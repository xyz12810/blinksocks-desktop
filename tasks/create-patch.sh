#!/usr/bin/env bash

command -v openssl > /dev/null 2>&1

if [ $? != 0 ]; then
  echo "openssl is required to be installed"
  exit 1
fi

if [ ! $1 ] ; then
  echo "you must specify a file as the second parameter"
  exit 1
fi

patch="$1.patch"

if [ $2 ]; then
  patch=$2
fi

cat $1 | openssl dgst -sha256 -binary > ${patch}
cat $1 >> ${patch}
gzip ${patch}
