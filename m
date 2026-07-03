Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWx+w3BpbLSI1HFsW/w1fwzhkQZbjEze7QkV6N2m3bE=; b=j5ToYpOsEz8e+xtnb4eQQJIoy6
	mdnrwLil7LH8nvGY/WA9GiLvYZ0AZ6SlJhkMde9ONgm5KsEI0dpZRbh1WZgt0V0id9XzBlhLinrBF
	HxOueqcUxzuxMAVrcx7D+B6h+XiUg9xK/my/SamQ40B9760Ck1al2U7uu/rW4JKoqAXGH0S910NdN
	6cSmyt20lk3pWW7zb+gBh1mahN6fFvUKbUwrVjtUMd2n2/tg8mP4Y95pGpCftN5bflJl+kbitmVGK
	8kxS75VzIvr3s9dOqnN64z/FK1+bdBkCa7jq/+QF3okDK7meh92gGqKAq9L4GeVfwzcntlKciB+mw
	y6oC/Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd96-00000006xYW-1CmV;
	Fri, 03 Jul 2026 12:37:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd8C-00000006xD3-3bgg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D58221F60;
	Fri,  3 Jul 2026 05:36:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4BB63F905;
	Fri,  3 Jul 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082189; bh=ssbqc6Lp48uvopx2v5D3BMUIZH6E+ISYSd7s23unaAU=;
	h=From:To:Cc:Subject:Date:From;
	b=ur/4TzzMde0/N5/Iu1mP/GYiwtVrzE28YvDgkCqbGVGTqG7Z7yKdaFvexwJua9e5e
	 65uKmUL4zKqYpt+qLdvctWQt0wp9T+fwt7BUKUam+B0NzDjpM1OQbh5SEfue4RVT2M
	 gaCt2rq/sAp4HM7AnRj85qOR/78snuyL7V0kIQxQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 00/23] Introduce SCMI Telemetry support
Date: Fri,  3 Jul 2026 13:35:38 +0100
Message-ID: <20260703123601.381275-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_053632_983422_72460D1F 
X-CRM114-Status: GOOD (  32.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

[TLDR Summary]
 - This series introduces a new driver to support ARM SCMI Telemetry
 - The previous (till v4) FS-based ABI driver is gone: no equivalent
   FUSE support is planned, either, due to the implicit performance hit
 - A new simple chardev driver exposing am IOCTLs ABI is proposed
 - V5 focus is on the new UAPI (i.e. definitely missing to address some
   previous V4 reviews...they will be taken care in v6)

The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
dedicated to System Telemetry.

In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
runtime the set of Telemetry Data Events (DEs) available on a specific
platform and provides the means to configure the set of DEs that a user is
interested into, while reading them back using the collection method that
is deeemed more suitable for the usecase at hand. (...amongst the various
possible collection methods allowed by SCMI specification)

Without delving into the gory details of the whole SCMI Telemetry protocol
let's just say that the SCMI platform/server firmware advertises a number
of Telemetry Data Events, each one identified by a 32bit unique ID, and an
SCMI agent/client, like Linux, can discover them and read back at will the
associated data value in a number of ways.
Data collection is mainly intended to happen on demand via shared memory
areas exposed by the platform firmware, discovered dynamically via SCMI
Telemetry and accessed by Linux on-demand, but some DE can also be reported
via SCMI Notifications asynchronous messages or via direct dedicated
FastChannels (another kind of SCMI memory based access): all of this
underlying mechanism is anyway hidden to the user since it is mediated by
the kernel driver which will return the proper data value when queried.

Anyway, the set of well-known architected DE IDs defined by the spec is
limited to a dozen IDs, which means that the vast majority of DE IDs are
customizable per-platform: as a consequence, though, the same ID, say
'0x1234', could represent completely different things on different systems.

Precise definitions and semantic of such custom Data Event IDs are out of
the scope of the SCMI Telemetry specification and of this implementation:
they are supposed to be provided using some kind of JSON-like description
file that will have to be consumed by a userspace tool which would be
finally in charge of making sense of the set of available DEs.

IOW, in turn, this means that even though the DEs enumerated via SCMI come
with some sort of topological and qualitative description provided by the
protocol (like unit of measurements, name, topology info etc), kernel-wise
we CANNOT be completely sure of "what is what" without being fed-back some
sort of information about the DEs by the afore mentioned userspace tool.

For these reasons, currently this series does NOT attempt to register any
of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
PERF etc), simply because we cannot be sure which DE is suitable, or even
desirable, for a given subsystem. This also means there are NO in-kernel
users of these Telemetry data events as of now.

So, while we do not exclude, for the future, to feed/register some of the
discovered DEs to/with some of the above mentioned Kernel subsystems, as
of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
available to userspace tools.

With V5 we drop the FS-based ABI approach, as it has been recently rejected
upstream, and we move to a pure chardev/IOCTL approach.

INTERFACES

For each discovered SCMI Instance a character device named tlm_<N> is
created under /dev/scmi/ subtree.

The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
available to enumerate and configure Telemetry resources: Telemetry data
can be collected using a few different IOCTls, depending on the required
granularity.

Alternatively it is possible to obtain a list of the file descriptors
referencing directly the underlying SCMI Telemetry SHMTI memory areas and
implement in user space an SCMI Telemetry parser accessing directly the
SHMTI, while staying in compliance with the SCMI TDCF format.

NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
the latest SCMI v4.0 specification [0].

KNOWN ISSUES/IMPROVEMENTS/TODO
 - still to look at Sashiko complaints
 - a few V4-related review comments to address
 - review SCMI Telemetry in-protocol notification handling
 - maybe better to have a single unified TLM_CFG IOCTL with a variable
   payload composed of TLV items ?
 - what about RO static resource enumeration via mmaped areas as an
   alternative to a bunch of enumeration IOCTLs that we have now ?
 - maybe better to have one single mmap'able area where all the TDCFs
   are collected at proper offsets, instead of one distinct mmap for each
   TDCF ?
 - add generation counter IOCTL support
 - add Telemetry RESET IOCTL support
 - stlm tool utility is crappy and minimal ... as of now just for testing
   or development...serious rework needed to make it upstreamable

Based on V7.2-rc1, tested on an emulated setup.

This series is available also at [1].

If you still reading...any feedback welcome :P

Thanks,
Cristian

----
v4 --> v5
 - rebased on v7.2-rc1
 - dropped FileSystem based driver
 - introduced a new simple chardev SCMI driver using Telemetry
 - reworked/reviewed the v4 IOCTLs based UAPI
 - UAPI: better struct alignment and comments
 - UAI: Removed flexible array members
 - UAPI: make SCMI Telemetry protocol stack completely independent from
 	 uapi defs
 - UAPI: new ioctls support to enable RAW mmap direct access to SCMI SHMTI
 	 areas from userspace
 - added new ABI Documentation
 - added new SCMI core facility to lookup the current SCMI instance ID
v3 --> v4
 - rebased on v7.1-rc7
 - updatded doc to detail Concurrency model
 - bail out on FW_BUG errors
 - make all_des_enable/all_des_tstamp_enable entry readable
 - refactored access to TDE values
 - refactored common accessors for tlm_priv (FIX WARN on kfree)
 - make all files by default world readable and user writable (if needed)
 - added uid/god/umask mount options (and docs)
 - added generation counter to aid spotting config changes (and docs)
 - added DebugFS configurable support to debug/dump SHMTI areas (and docs)
 - hide FS entries when NOT supported (like des_simple_sample_read)
 - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
 - renamed top-dir by_components to by-components
 - add a .remove method to SCMI System Telemetry Driver
 - use kzalloc_obj
V2 --> V3
 - rebased on v7.0-rc5
 - ported the firmware interface to SCMI v4.0 BETA
 - split the SCMI protocol layer in a lot of small patches
 - completd filesystem and ABI documentation
 - renamed components subtree to by_components
 - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
 - renamd tstamp_exp to tstamp_rate
 - swap logic in scmi_telemetry_initial_state_lookup
 - use memcpy_from_le32 where required
 - changed a dfew dev_err into Telemetry traces
 - define and use new helper scmi_telemetry_de_unlink
 - simplify a few assignments with ternary ops
 - added a missing __mmust_check on the internal SCMI API
 - reworked and clarified de_data_read returned errno:
 	ENODATA vs EINVAL vs ENODEV/ENOENT
 - removed some risky/unneeded devres allocations
 - various checkpatch fixes
 - reworked and clarified usage of traces in Telemetry
 - added the missing DT binding for protocol 0x1B
 - split out unrelated change around notification from patch
   adding support for protocol internal notifier
 - more comments

V1 --> V2
 - rebased on v6.19-rc3
 - harden TDCF shared memory areas accesses by using proper accessors
 - reworked protocol resources lifecycle to allow lazy enumeration
 - using NEW FS mount API
 - reworked FS inode allocation to use a std kmem_cache
 - fixed a few IOCTLs support routine to support lazy enumeration
 - added (RFC) a new FS lazy mount option to support lazily population of
   some subtrees of the FS (des/ groups/ components/)
 - reworked implementation of components/ alternative FS view to use
   symlinks instead of hardlinks
 - added a basic simple (RFC) testing tool to exercise UAPI ioctls interface
 - hardened Telmetry protocol and driver to support partial out-of-spec FW
   lacking some cmds (best effort)
 - reworked probing races handling
 - reviewed behaviour on unmount/unload
 - added support for Boot_ON Telemetry by supporting SCMI Telemetry cmds:
   + DE_ENABLED_LIST
   + CONFIG_GET
 - added FS and ABI docs

RFC --> V1
---
 - moved from SysFS/chardev to a full fledged FS
 - added support for SCMI Telemetry BLK timestamps


Thanks,
Cristian

[0]: https://developer.arm.com/documentation/den0056/f/?lang=en
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_ng_V5

Cristian Marussi (23):
  firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
  firmware: arm_scmi: Reduce the scope of protocols mutex
  firmware: arm_scmi: Allow registration of unknown-size events/reports
  firmware: arm_scmi: Allow protocols to register for notifications
  dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Add basic Telemetry support
  firmware: arm_scmi: Add support to parse SHMTIs areas
  firmware: arm_scmi: Add Telemetry configuration operations
  firmware: arm_scmi: Add Telemetry DataEvent read capabilities
  firmware: arm_scmi: Add support for Telemetry reset
  firmware: arm_scmi: Add Telemetry notification support
  firmware: arm_scmi: Add support for boot-on Telemetry
  firmware: arm_scmi: Add Telemetry generation counter
  firmware: arm_scmi: Add common per-protocol debugfs support
  firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
  firmware: arm_scmi: Add Telemetry debugfs ABI documentation
  firmware: arm_scmi: Expose per-instance identifier
  uapi: Add ARM SCMI Telemetry definitions
  firmware: arm_scmi: Add System Telemetry driver
  docs: ioctl-number: Add SCMI Ioctls
  Documentation: Add SCMI System Telemetry documentation
  [RFC] tools/scmi: Add SCMI Telemetry testing tool

 Documentation/ABI/testing/debugfs-scmi        |   22 +
 .../bindings/firmware/arm,scmi.yaml           |    8 +
 Documentation/userspace-api/index.rst         |    1 +
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 Documentation/userspace-api/stlm.rst          |  143 +
 MAINTAINERS                                   |    1 +
 drivers/firmware/arm_scmi/Kconfig             |   24 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/common.h            |   10 +
 drivers/firmware/arm_scmi/driver.c            |   93 +-
 drivers/firmware/arm_scmi/notify.c            |   30 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |   13 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1233 ++++++
 drivers/firmware/arm_scmi/telemetry.c         | 3318 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  254 +-
 include/trace/events/scmi.h                   |   48 +-
 include/uapi/linux/scmi.h                     |  359 ++
 tools/testing/scmi/Makefile                   |   25 +
 tools/testing/scmi/stlm.c                     |  648 ++++
 20 files changed, 6202 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/userspace-api/stlm.rst
 create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c
 create mode 100644 include/uapi/linux/scmi.h
 create mode 100644 tools/testing/scmi/Makefile
 create mode 100644 tools/testing/scmi/stlm.c

-- 
2.54.0


