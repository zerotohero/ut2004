#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

download.sh

config.sh

compress.sh

echo "Setting permissions on ${UT2004_HOME}/.ut2004"
mkdir -p "${UT2004_HOME}/.ut2004"
chown -R ut2004:ut2004 "${UT2004_HOME}/.ut2004"
chmod -R a=,u=rwX "${UT2004_HOME}/.ut2004"

echo "Starting unreal server"
exec "${UT2004_UCC}" server "${UT2004_CMD}"
