Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678B0CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlfDtmWk3q88uzqKS+uG5zRgxyCNHID4YH6Y2MOm6Vk=; b=Qd2SIm8BBbLMHOEWK307uMB63q
	b4JoNS5NNXveyyxcOUKfCYao0psVIrtQpySrZ0N2Sgvf46ECPcBFW+JKiFsKR3f1y6TKpXQUI6EXd
	F5gtMYxOLqHErccVhQ5vWrFhs3j6tbU1fmTcOqZvHvix1Qb24x9U75fjc5uYcYzXIDx2XNtfTWZAf
	TkDQHeAX5Hy3uZTsd550bZ7Fa0sbbmCkmamX0XgcIKK+HKfrpw1sDRyY3O009MgbJS6Z4/W3DkwvP
	cp0K8dO2f6VlhwG0ebluCTOjkQdjhIuhNexeysP2cZDjv+1yLPFBp9L6CDgnP67Gh+akDrKrHPjpa
	pGr2KeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1shW-0000000Cmov-0drJ;
	Thu, 25 Sep 2025 20:36:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1shT-0000000Cmn7-1zpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:36:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA1C1692;
	Thu, 25 Sep 2025 13:36:12 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E103F694;
	Thu, 25 Sep 2025 13:36:17 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 00/10] Introduce SCMI Telemetry support
Date: Thu, 25 Sep 2025 21:35:44 +0100
Message-ID: <20250925203554.482371-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133623_603892_8CF8037A 
X-CRM114-Status: GOOD (  30.53  )
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

the upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
dedicated to System Telemetry.

In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
runtime the set of Telemetry Data Events (DEs) available on a specific
platform and provides the means to configure the set of DEs that a user is
interested into, while read them back using the collection method that is
deeemd more suitable for the usecase at hand.

Without delving into the gory details of the whole SCMI Telemetry protocol
let's just say that the SCMI platform firmware advertises a number of
Telemetry Data Events, each one identified by a 32bit unique ID, and a user
can read back at will the associated data value in a number of ways.

Anyway, the set of well-known architected DE IDs defined by the spec is
limited to a dozen IDs, which means that the vast majority of DE IDs are
customizable per-platform: as a consequence the same ID, say '0x1234',
could represent completely different things on different systems.

Data Event IDs definitions and their semantic are supposed to be described
using some sort of JSON-like description file consumed by a userspace tool,
which would be finally in charge of making sense of the exact meaning of
the set of DEs specifically defined as available on a specific platform.

IOW, in turn, this means that even though the DEs enumerated via SCMI come
with some sort of topological and qualitative description (like unit of
measurements), kernel-wise we CANNOT be sure of "what is what" without
being fed-back some sort of information about the DEs semantic by the afore
mentioned userspace tool.

For these reasons, currently this series does NOT attempt to register
any of the discovered DEs with any of the usual in-kernel subsystems (like
HWMON, IIO, POWERCAP, PERF etc), simply because we cannot be sure if a DE
is suitable or not for a given subsystem. This also means there are NO
in-kernel user of these Telemetry data, as of now.

So, while we do not exclude, for the future, to feed/register some of the
discovered DEs to some of the above mentioned Kernel subsystems, as of
now we have ONLY modeled a custom userspace API to make SCMI Telemetry
available to userspace users.

In deciding which kind of interface to expose SCMI Telemetry data to a
user, this new SCMI Telemetry driver aims at satisfying 2 main reqs:

 - exposing an FS-based human-readable interface that can be used to
   discover, configure and access our Telemetry data directly from the
   shell

 - exposing an alternative machine-friendly, more-performant, binary
   interface that can be used to avoid the overhead of multiple accesses
   to the VFS and that can be more suitable to access with a custom tool

In the previous RFC posted a few months ago [1], the above was achieved
with a combination of a SysFS interface, for the human-readable side of
the story, and a classic chardev/ioctl for the plain binary access.

In this V1, instead, I moved away from this combined approach, especially
away from SysFS, for the following reason:

 1. "Abusing SysFS": SysFS is a handy way to expose device related
      properties in a common way, using a few common helpers built on
      kernfs; this means, though, that unfortunately in our scenario I had
      to generate a dummy simple device for EACH SCMI Telemetry DataEvent
      that I got to discover at runtime and attach to them, all of the
      properties I need.
      This by itself seemed to me abusing the SysFS framework, but even
      ignoring this, the impact on the system when we have to deal with
      hundreds or tens of thousands od DEs is sensible.
      In some test scenario I ended with 50k devices and half-a-millon
      related property files ... O_o

 2. "SysFS constraints": SysFS usage itself has its well-known constraints
      and best practices, like the one-file/one-value rule, and due to the
      fact that any virtual file with a complex structure or handling logic
      is frowned upon, you can forget about IOTCLs and mmap'ing to provide
      a more performant interface, which is the reason why, in the previous
      RFC, there was an additional alternative chardev interface.

 2. "Chardev limitations": Given the nature of the protocol the character
      devices approach itself was problematic: first of all because there
      is an upper limit on the number of chardev we can create, dictated by
      the range of available minor numbers and then because the fact
      itself to have to maintain 2 completely different interfaces is a
      pain.

As a final remark, please note that all of this is supposed to be available
in production systems across a number of heterogeneous platforms: for these
reasons the easy choice, debugFS, is not an option.

Due to the above reasoning, in V1 we opted for a new approach, with the
proposed interfaces now based on a full fledged, unified, virtual
filesystem implemented from scratch so that we can:

 - expose all the DEs property we like as before with SysFS, but without
   any of the constraint imposed by the usage of SysFs or kernfs.

 - additionally expose a few alternative and more performant interfaces
   by embedding in that same FS, a few special virtual files:

   + 'control': to issue IOCTLs for quicker binary discovery and on-demand
   		access to data
   + 'pipe' [TBD]: to provide a stream of events using a virtual
		   infinite-style file
   + 'raw_<N>' [TBD]: to provide direct memory mapped access to the raw
   		      SCMI Telemetry data


INTERFACES
===========

We propose a couple of interfaces, both rooted in the same unified
TelemetryFS, which can be mounted with:

	mount -t stlmfs none /sys/fs/arm_telemetry/

 1. a FS based human-readable API tree

   This API present the discovered DEs and DEs-groups rooted under a
   structrure like this:

	/sys/fs/arm_telemetry/tlm_0/
	|-- all_des_enable
	|-- all_des_tstamp_enable
	|-- available_update_intervals_ms
	|-- current_update_interval_ms
	|-- de_implementation_version
	|-- des
	|   |-- 0x0000
	|   |-- 0x0016
	|   |-- 0x1010
	|   |-- 0xA000
	|   |-- 0xA001
	|   |-- 0xA002
	|   |-- 0xA005
	|   |-- 0xA007
	|   |-- 0xA008
	|   |-- 0xA00A
	|   |-- 0xA00B
	|   |-- 0xA00C
	|   `-- 0xA010
	|-- des_bulk_read
	|-- des_single_sample_read
	|-- groups
	|   |-- 0
	|   `-- 1
	|-- intervals_discrete
	|-- reset
	|-- tlm_enable
	`-- version

	At the top level we have general configuration knobs to:

	- enable/disable all DEs with or without tstamp
	- configure the update interval that the platform will use
	- enable Telemetry as a whole oe rest the whole stack
	- read all the enabled DEs in a buffer one-per-line
		<DE_ID> <TIMESTAMP> <DATA_VALUE>
	- des_single_sample_read to request an immediate updated read of
	  all the enabled DEs in a single buffer one-per-line:
		<DE_ID> <TIMESTAMP> <DATA_VALUE>
        
	where each DE in turn is represented by a flat subtree like:

	tlm_0/des/0xA001/
	|-- compo_instance_id
	|-- compo_type
	|-- enable
	|-- instance_id
	|-- name
	|-- persistent
	|-- tstamp_enable
	|-- tstamp_exp
	|-- type
	|-- unit
	|-- unit_exp
	`-- value

	where, beside a bunch of description items, you can:

	- enable/disable a single DE
	- read back its tstamp and data from 'value' as in:
		<TIMESTAMP>: <DATA_VALUE>

	then for each discovered group of DEs:

	scmi_tlm_0/groups/0/
	|-- available_update_intervals_ms
	|-- composing_des
	|-- current_update_interval_ms
	|-- des_bulk_read
	|-- des_single_sample_read
	|-- enable
	|-- intervals_discrete
	`-- tstamp_enable

	you can find the knobs to:
	
	- enable/disable the group as a whole
	- lookup group composition
	- set a per-group update interval (if supported)
	- des_bulk_read to read all the enabled DEs for this group in a
	  single buffer one-per-line:
		<DE_ID> <TIMESTAMP> <DATA_VALUE>
	- des_single_sample_read to request an immediate updated read of
	  all the enabled DEs for this group in a single buffer
	  one-per-line:
		<DE_ID> <TIMESTAMP> <DATA_VALUE>

 2. Leveraging the capabilities of a full-fledged filesystem and the
    topological information provided by SCMI Telemetry we expose also
    and alternative view of the above tree, by hardlinking a few of the
    same entries above under another, topologically sorted, subtree:

    components/
    |-- cpu
    |   |-- 0
    |   |   |-- celsius
    |   |   |   `-- 0
    |   |   |       `-- 0x0001
    |   |   |           |-- compo_instance_id
    |   |   |           |-- compo_type
    |   |   |           |-- enable
    |   |   |           |-- instance_id
    |   |   |           |-- name
    |   |   |           |-- persistent
    |   |   |           |-- tstamp_enable
    |   |   |           |-- tstamp_exp
    |   |   |           |-- type
    |   |   |           |-- unit
    |   |   |           |-- unit_exp
    |   |   |           `-- value
    |   |   `-- cycles
    |   |       |-- 0
    |   |       |   `-- 0x1010
    |   |	    |    ....
	.................
	...............
    |   |-- 1
    |   |   `-- celsius
    |   |       `-- 0
    |   |           `-- 0x0002
    |   |           .........
    |   `-- 2
    |       `-- celsius
    |           `-- 0
    |               `-- 0x0003
    |-- interconnnect
    |   `-- 0
    |       `-- hertz
    |           `-- 0
    |               |-- 0xA008
    |               `-- 0xA00B
    |-- mem_cntrl
    |   `-- 0
    |       |-- bps
    |       |   `-- 0
    |       |       `-- 0xA00A
    |       |-- celsius
    |       |   `-- 0
    |       |       `-- 0xA007
    |       `-- joules
    |           `-- 0
    |               `-- 0xA002
    |-- periph
    |   |-- 0
    |   |   `-- messages
    |   |       `-- 0
    |   |           `-- 0x0016
    |   |-- 1
    |   |   `-- messages
    |   |       `-- 0
    |   |           `-- 0x0017
    |   `-- 2
    |       `-- messages
    |           `-- 0
    |               `-- 0x0018
    `-- unspec
    `-- 0
    |-- celsius
    |   `-- 0
    |       `-- 0xA005


   ...so as to provide the human user with a more understandable layout.


All of this is nice and fancy human-readable, easily scriptable, but
certainly not the fastest possible to access especially on huge trees...

 ... so for the afore-mentioned reasons we alternatively expose

 3. a more performant API based on IOCTLs as described fully in:

	include/uapi/linux/scmi.h

   As described succinctly in the above UAPI header too, this API is meant
   to be called on a few special files named 'control' that are populated
   into the tree:

   .
   |-- all_des_enable
   .....
   |-- components
   |   |-- cpu
   |   |-- interconnnect
   |   |-- mem_cntrl
   |   |-- periph
   |   `-- unspec
   |-- control
   .....................

   |-- groups
   |   |-- 0
   |   |   |-- available_update_intervals_ms
   |   |   |-- composing_des
   |   |   |-- control
   .....................
   |   |-- 1
   |   |   |-- available_update_intervals_ms
   |   |   |-- composing_des
   |   |   |-- control
   .....................
   |   `-- 2
   |       |-- available_update_intervals_ms
   |       |-- composing_des
   |       |-- control
   .....................

  This will allow a tool to:

   - use some IOCTLs to configure a set of properties equivalent to the
     ones above in FS
   - use some other IOCTLs for direct access to data in binary format
     for a single DEs or all of them


Missing feats & next steps
--------------------------
 - FS internals cleanup and testing
 - enforce a single mount
 - handle platform configured with boot_on Telemetry
 - add streaming mode interface via 'pipe' file
 - add direct access interface via mmap-able 'raw' file
 - provide a simple test tool to make use special file access via
   ioctls/mmap etc...
 - more tests on multiple SCMI instances scenario


Known Issues
------------
 - missing proper docs for the FS human-readable interface
 - FS uses legacy mount implementation...use fs-context
 - FS corruption and troubles on unmount
 - needs a better handling of races between multiple probes and
   concurrent mount

Thise series now support SCMI Telemetry ALPHA_0 specification in all of
its features. (with bugs probably still... :P)

Based on V6.17-rc6, tested on an emulated setup.

Any feedback welcome,

Thanks,
Cristian

----

RFC-> V1
---
- moved from SysFS/chardev to a full fledged FS
- added support for SCMI Telemetry BLK timestamps


Thanks,
Cristian

[0]: https://developer.arm.com/documentation/den0056/f/?lang=en
[1]: https://lore.kernel.org/arm-scmi/20250620192813.2463367-1-cristian.marussi@arm.com/

Cristian Marussi (10):
  firmware: arm_scmi: Define a common SCMI_MAX_PROTOCOLS value
  firmware: arm_scmi: Reduce the scope of protocols mutex
  firmware: arm_scmi: Allow protocols to register for notifications
  uapi: Add ARM SCMI definitions
  firmware: arm_scmi: Add Telemetry protocol support
  firmware: arm_scmi: Add System Telemetry driver
  firmware: arm_scmi: Add System Telemetry ioctls support
  firmware: arm_scmi: Add Telemetry components view
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Use new Telemetry traces

 MAINTAINERS                                   |    1 +
 drivers/firmware/arm_scmi/Kconfig             |   10 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/common.h            |    4 +
 drivers/firmware/arm_scmi/driver.c            |   67 +-
 drivers/firmware/arm_scmi/notify.c            |   31 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |    9 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 2496 +++++++++++++++++
 drivers/firmware/arm_scmi/telemetry.c         | 2156 ++++++++++++++
 include/linux/scmi_protocol.h                 |  188 +-
 include/trace/events/scmi.h                   |   48 +-
 include/uapi/linux/scmi.h                     |  286 ++
 13 files changed, 5265 insertions(+), 42 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c
 create mode 100644 include/uapi/linux/scmi.h

-- 
2.51.0


