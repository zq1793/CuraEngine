#!/bin/sh
#
# This scripts lists all the .deb files in the "build/" directory and
# publishes them one by one to Cloudsmith.io
#

for f in build/*curaengine*.deb
do
    echo "Uploading DEB package '${f}' to Cloudsmith..."
    cloudsmith --credentials-file "${CLOUDSMITH_CREDENTIALS_INI}" \
        push deb --republish "${CLOUDSMITH_DEB_REPO}" "${f}"
done

for f in build/*curaengine*.zip
do
    echo "Uploading RAW package '${f}' to Cloudsmith..."
    cloudsmith --credentials-file "${CLOUDSMITH_CREDENTIALS_INI}" \
        push raw --republish "${CLOUDSMITH_DEB_REPO}" "${f}"
done
