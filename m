Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC270C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCQ6+DQDPMzAFiGvlZ6y0mjJp6DqBrxlbrRmdPEJvEg=; b=ZkckemHiXIBsvYlMBOhckOeOcr
	3XPlZDs7p8cCWvcuooCm8LGUEDFpyu5v2nTzBbAuFUKEg+IqElPqclLKzgtCN3Gzlacg5dmHqdbfl
	vo+VHVC5L5r8c6movnDA5e4pATvLoPxjEhcRciXHyd1Dt/NEVvgRKpaLGpntD3w5L8RpkE6AfiDXr
	cYJMMdf3eQoWeQUcHKtvyIjuSUZSDYQoR3DT5HO3aecRN52nAoyXQui/B7aQqGZDlW4FGtVLomZfy
	+P4JEtjPZWQsB9hJyzCtT3QYMkTXUmDbA9eWPZtivBhjyZgdcypc4n9zUK6DThhxM82vucgzZEL3x
	maaY15IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIhk-0000000FYRP-13TZ;
	Fri, 11 Jul 2025 18:42:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcI-0000000FX1u-0Cyc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E08916F8;
	Fri, 11 Jul 2025 11:36:50 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343F53F694;
	Fri, 11 Jul 2025 11:36:58 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 00/36] arm_mpam: Add basic mpam driver
Date: Fri, 11 Jul 2025 18:36:12 +0000
Message-Id: <20250711183648.30766-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113702_176946_BF797D98 
X-CRM114-Status: GOOD (  27.14  )
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

Hello,

This is just enough MPAM driver for the ACPI and DT pre-requisites.
It doesn't contain any of the resctrl code, meaning you can't actually drive it
from user-space yet.

This is the initial group of patches that allows the resctrl code to be built
on top. Including that will increase the number of trees that may need to
coordinate, so breaking it up make sense.

The locking looks very strange - but is influenced by the 'mpam-fb' firmware
interface specification that is still alpha. That thing needs to wait for an
interrupt after every system register write, which significantly impacts the
driver. Some features just won't work, e.g. reading the monitor registers via
perf.
The aim is to not have to make invasive changes to the locking to support the
firmware interface, hence it looks strange from day-1.

I've not found a platform that can test all the behaviours around the monitors,
so this is where I'd expect the most bugs.

It's unclear where in the tree this should be put. It affects memory bandwidth
and cache allocation, but doesn't (yet) interact with perf. The main interaction
is with resctrl in fs/resctrl - but there will be no filesystem code in here.
Its also likely there will be other in-kernel users. (in-kernel MSC emulation by
KVM being an obvious example).
(I'm not a fan of drivers/resctrl or drivers/mpam - its not the sort of thing
 that justifies being a 'subsystem'.)

For now, I've put this under drivers/platform/arm64. Other ideas welcome.

The first three patches are currently a series on the list, the PPTT stuff
has previously been posted - this is where the users of those helpers appear.


The MPAM spec that describes all the system and MMIO registers can be found
here:
https://developer.arm.com/documentation/ddi0598/db/?lang=en
(Ignored the 'RETIRED' warning - that is just arm moving the documentation
 around. This document has the best overview)

This series is based on v6.16-rc4, and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/rfc

The rest of the driver can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc4

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/


Bugs welcome,
Thanks,

James Morse (31):
  cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for
    cache-id
  arm64: cacheinfo: Provide helper to compress MPIDR value into u32
  cacheinfo: Expose the code to generate a cache-id from a device_node
  ACPI / PPTT: Add a helper to fill a cpumask from a processor container
  ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear
    levels
  ACPI / PPTT: Find cache level by cache-id
  ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
  arm64: kconfig: Add Kconfig entry for MPAM
  ACPI / MPAM: Parse the MPAM table
  platform: arm64: Move ec devices to an ec subdirectory
  arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
  arm_mpam: Add the class and component structures for ris firmware
    described
  arm_mpam: Add MPAM MSC register layout definitions
  arm_mpam: Add cpuhp callbacks to probe MSC hardware
  arm_mpam: Probe MSCs to find the supported partid/pmg values
  arm_mpam: Add helpers for managing the locking around the mon_sel
    registers
  arm_mpam: Probe the hardware features resctrl supports
  arm_mpam: Merge supported features during mpam_enable() into
    mpam_class
  arm_mpam: Reset MSC controls from cpu hp callbacks
  arm_mpam: Add a helper to touch an MSC from any CPU
  arm_mpam: Extend reset logic to allow devices to be reset any time
  arm_mpam: Register and enable IRQs
  arm_mpam: Use a static key to indicate when mpam is enabled
  arm_mpam: Allow configuration to be applied and restored during cpu
    online
  arm_mpam: Probe and reset the rest of the features
  arm_mpam: Add helpers to allocate monitors
  arm_mpam: Add mpam_msmon_read() to read monitor value
  arm_mpam: Track bandwidth counter state for overflow and power
    management
  arm_mpam: Add helper to reset saved mbwu state
  arm_mpam: Add kunit test for bitmap reset
  arm_mpam: Add kunit tests for props_mismatch()

Rob Herring (2):
  cacheinfo: Set cache 'id' based on DT data
  dt-bindings: arm: Add MPAM MSC binding

Rohit Mathew (2):
  arm_mpam: Probe for long/lwd mbwu counters
  arm_mpam: Use long MBWU counters if supported

Shanker Donthineni (1):
  arm_mpam: Add support for memory controller MSC on DT platforms

 .../devicetree/bindings/arm/arm,mpam-msc.yaml |  227 ++
 MAINTAINERS                                   |    6 +-
 arch/arm64/Kconfig                            |   19 +
 arch/arm64/include/asm/cache.h                |   17 +
 drivers/acpi/arm64/Kconfig                    |    3 +
 drivers/acpi/arm64/Makefile                   |    1 +
 drivers/acpi/arm64/mpam.c                     |  365 +++
 drivers/acpi/pptt.c                           |  240 +-
 drivers/acpi/tables.c                         |    2 +-
 drivers/base/cacheinfo.c                      |   57 +
 drivers/platform/arm64/Kconfig                |   73 +-
 drivers/platform/arm64/Makefile               |   10 +-
 drivers/platform/arm64/ec/Kconfig             |   73 +
 drivers/platform/arm64/ec/Makefile            |   10 +
 .../platform/arm64/{ => ec}/acer-aspire1-ec.c |    0
 .../arm64/{ => ec}/huawei-gaokun-ec.c         |    0
 .../arm64/{ => ec}/lenovo-yoga-c630.c         |    0
 drivers/platform/arm64/mpam/Kconfig           |   23 +
 drivers/platform/arm64/mpam/Makefile          |    4 +
 drivers/platform/arm64/mpam/mpam_devices.c    | 2910 +++++++++++++++++
 drivers/platform/arm64/mpam/mpam_internal.h   |  697 ++++
 .../platform/arm64/mpam/test_mpam_devices.c   |  390 +++
 include/linux/acpi.h                          |   17 +
 include/linux/arm_mpam.h                      |   56 +
 include/linux/cacheinfo.h                     |    1 +
 25 files changed, 5117 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
 create mode 100644 drivers/acpi/arm64/mpam.c
 create mode 100644 drivers/platform/arm64/ec/Kconfig
 create mode 100644 drivers/platform/arm64/ec/Makefile
 rename drivers/platform/arm64/{ => ec}/acer-aspire1-ec.c (100%)
 rename drivers/platform/arm64/{ => ec}/huawei-gaokun-ec.c (100%)
 rename drivers/platform/arm64/{ => ec}/lenovo-yoga-c630.c (100%)
 create mode 100644 drivers/platform/arm64/mpam/Kconfig
 create mode 100644 drivers/platform/arm64/mpam/Makefile
 create mode 100644 drivers/platform/arm64/mpam/mpam_devices.c
 create mode 100644 drivers/platform/arm64/mpam/mpam_internal.h
 create mode 100644 drivers/platform/arm64/mpam/test_mpam_devices.c
 create mode 100644 include/linux/arm_mpam.h

-- 
2.39.5


