Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66498F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gdFxOiAYpNPUcEBKY+wyDw5xoZYWnL3N5Tc0bnIvq8=; b=JJ67FeY3hac9NW0sMI9icddl9A
	le6abjC/Vpup7+secDE4ENuJUQmj/dyLH5vtVOT3w6C64QWbRMHOM40MpTsMn36DYTZU4BdSvzL8r
	G5eeuLSuoTJ92mynbPlzBTl764PPgEWoPgsGaB6ktacH/6bmss05riESyk5obvyY6fsfUzGemebm7
	bU5Vc7hPhTfVym4uuSSZSWwQSXTc+dri+HFPpQbZjOHWfY+G1ziFI52FBU4NPBRTppvTRqvf2itX6
	mSfk5hWRRJ+L3PJzxeeTrpWJ/NA/34F+wUp+L6PlNUwFy/Xq7k/exVK0WemOkjfPE1UHKVVcCqdNu
	ZzNj5trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfH-00000002WRp-1Cow;
	Tue, 24 Feb 2026 17:57:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfB-00000002WPh-395O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:57:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98061339;
	Tue, 24 Feb 2026 09:57:28 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DAE23F59E;
	Tue, 24 Feb 2026 09:57:29 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
Date: Tue, 24 Feb 2026 17:56:39 +0000
Message-ID: <20260224175720.2663924-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095737_894864_6E2A0332 
X-CRM114-Status: GOOD (  19.31  )
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

The main change in this version of the mpam missing pieces series is to
update the cdp emulation to match the resctrl interface. L2 and L3
resources can now enable cdp separately. Cdp can't be hidden correctly for
memory bandwidth allocation, as max per partid can't be emulated with more
partids, and so we hide this completely when cdp is enabled. There is a little
restructuring and a few smaller changes.

Changelogs in patches

It would be great to get this series merged this cycle. For that we'll need
more testing and reviewing. Thanks!

From James' cover letter:

This is the missing piece to make MPAM usable resctrl in user-space. This has
shed its debugfs code and the read/write 'event configuration' for the monitors
to make the series smaller.

This adds the arch code and KVM support first. I anticipate the whole thing
going via arm64, but if goes via tip instead, the an immutable branch with those
patches should be easy to do.

Generally the resctrl glue code works by picking what MPAM features it can expose
from the MPAM drive, then configuring the structs that back the resctrl helpers.
If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
counters are considerably more hairy, and depend on hueristics around the topology,
and a bunch of stuff trying to emulate ABMC.
If it didn't pick what you wanted it to, please share the debug messages produced
when enabling dynamic debug and booting with:
| dyndbg="file mpam_resctrl.c +pl"

I've not found a platform that can test all the behaviours around the monitors,
so this is where I'd expect the most bugs.

The MPAM spec that describes all the system and MMIO registers can be found here:
https://developer.arm.com/documentation/ddi0598/db/?lang=en
(Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
 This document has the best overview)


Based on v7.0-rc1

The series can be retrieved from:
https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v5

v4 can be found at:
https://lore.kernel.org/linux-arm-kernel/20260203214342.584712-1-ben.horgan@arm.com/

v3 can be found at:
https://lore.kernel.org/linux-arm-kernel/20260112165914.4086692-1-ben.horgan@arm.com/

v2 can be found at:
https://lore.kernel.org/linux-arm-kernel/20251219181147.3404071-1-ben.horgan@arm.com/

rfc can be found at:
https://lore.kernel.org/linux-arm-kernel/20251205215901.17772-1-james.morse@arm.com/

Ben Horgan (11):
  arm64/sysreg: Add MPAMSM_EL1 register
  KVM: arm64: Preserve host MPAM configuration when changing traps
  KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
  arm64: mpam: Drop the CONFIG_EXPERT restriction
  arm64: mpam: Initialise and context switch the MPAMSM_EL1 register
  KVM: arm64: Use kernel-space partid configuration for hypercalls
  arm_mpam: resctrl: Add rmid index helpers
  arm_mpam: resctrl: Add kunit test for rmid idx conversions
  arm_mpam: resctrl: Wait for cacheinfo to be ready
  arm_mpam: resctrl: Add monitor initialisation and domain boilerplate
  arm64: mpam: Add initial MPAM documentation

Dave Martin (2):
  arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
  arm_mpam: resctrl: Add kunit test for control format conversions

James Morse (24):
  arm64: mpam: Context switch the MPAM registers
  arm64: mpam: Re-initialise MPAM regs when CPU comes online
  arm64: mpam: Advertise the CPUs MPAM limits to the driver
  arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
  arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG
    values
  KVM: arm64: Force guest EL1 to use user-space's partid configuration
  arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
  arm_mpam: resctrl: Pick the caches we will use as resctrl resources
  arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
  arm_mpam: resctrl: Add resctrl_arch_get_config()
  arm_mpam: resctrl: Implement helpers to update configuration
  arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
  arm_mpam: resctrl: Add CDP emulation
  arm_mpam: resctrl: Add support for 'MB' resource
  arm_mpam: resctrl: Add support for csu counters
  arm_mpam: resctrl: Pick classes for use as mbm counters
  arm_mpam: resctrl: Pre-allocate free running monitors
  arm_mpam: resctrl: Allow resctrl to allocate monitors
  arm_mpam: resctrl: Add resctrl_arch_rmid_read() and
    resctrl_arch_reset_rmid()
  arm_mpam: resctrl: Update the rmid reallocation limit
  arm_mpam: resctrl: Add empty definitions for assorted resctrl
    functions
  arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
  arm_mpam: resctrl: Call resctrl_init() on platforms that can support
    resctrl
  arm_mpam: Quirk CMN-650's CSU NRDY behaviour

Shanker Donthineni (4):
  arm_mpam: Add quirk framework
  arm_mpam: Add workaround for T241-MPAM-1
  arm_mpam: Add workaround for T241-MPAM-4
  arm_mpam: Add workaround for T241-MPAM-6

 Documentation/arch/arm64/index.rst          |    1 +
 Documentation/arch/arm64/mpam.rst           |   94 +
 Documentation/arch/arm64/silicon-errata.rst |    9 +
 arch/arm64/Kconfig                          |    6 +-
 arch/arm64/include/asm/el2_setup.h          |    3 +-
 arch/arm64/include/asm/mpam.h               |   96 +
 arch/arm64/include/asm/resctrl.h            |    2 +
 arch/arm64/include/asm/thread_info.h        |    3 +
 arch/arm64/kernel/Makefile                  |    1 +
 arch/arm64/kernel/cpufeature.c              |   21 +-
 arch/arm64/kernel/mpam.c                    |   62 +
 arch/arm64/kernel/process.c                 |    7 +
 arch/arm64/kvm/hyp/include/hyp/switch.h     |   12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c          |    9 +
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c          |   16 +
 arch/arm64/kvm/sys_regs.c                   |    2 +
 arch/arm64/tools/sysreg                     |    8 +
 drivers/resctrl/Kconfig                     |    9 +-
 drivers/resctrl/Makefile                    |    1 +
 drivers/resctrl/mpam_devices.c              |  257 ++-
 drivers/resctrl/mpam_internal.h             |  105 +-
 drivers/resctrl/mpam_resctrl.c              | 1875 +++++++++++++++++++
 drivers/resctrl/test_mpam_resctrl.c         |  364 ++++
 include/linux/arm_mpam.h                    |   32 +
 24 files changed, 2968 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/arch/arm64/mpam.rst
 create mode 100644 arch/arm64/include/asm/mpam.h
 create mode 100644 arch/arm64/include/asm/resctrl.h
 create mode 100644 arch/arm64/kernel/mpam.c
 create mode 100644 drivers/resctrl/mpam_resctrl.c
 create mode 100644 drivers/resctrl/test_mpam_resctrl.c

-- 
2.43.0


