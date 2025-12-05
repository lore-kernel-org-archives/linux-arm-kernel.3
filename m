Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D42BD374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6ojlx7J8I6wJJOrs48svHaWBIVaJZE/duL7SiOswIo=; b=tFkN1LDEvqJ52O5Sq3kV5N34Q4
	a3zrj1OWqEJ/BTcC4/ukG/9D9Dp3h4glBobXapyL82EllM9wreWo90sHfS/7oo8VqJWOZqFwcFsau
	i3fWobhnx7sOUnTZ7wnXZgdIeMmbUgidapkWJHD9mYUb9t/3Sg1I6MJI1qBRVD87dyEjT5ooAUDcw
	TPps7K+vB4TDoboVVdu1m4Sb8jhuqcpKjV322RTyPQZi3aNaBUqHqGQ+Rv0wCp8rgbXVm/fYZ3A9/
	dmjl9d7PjSGCnSSYxX8XdcYuIm8PBvCiq8PhdlLsbyL1GCtrVk17Tw2Qw/JoVJhIYQjyyx8CDBwF6
	ndYnYT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdpg-0000000A4vc-2ssm;
	Fri, 05 Dec 2025 21:59:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdpd-0000000A4vC-21OW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:59:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256D01A00;
	Fri,  5 Dec 2025 13:59:05 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F593F740;
	Fri,  5 Dec 2025 13:59:08 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 00/38] arm_mpam: Add KVM/arm64 and resctrl glue code
Date: Fri,  5 Dec 2025 21:58:23 +0000
Message-Id: <20251205215901.17772-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_135917_595192_F39FEBC0 
X-CRM114-Status: GOOD (  18.56  )
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

This is the missing piece to make MPAM usable resctrl in user-space. This has
shed its debugfs code and the read/write 'event configuration' for the monitors
to make the series smaller.

This adds the arch code and KVM support first. I anticipate the whole thing
going via arm64, but if goes via tip instead, the an immutable branch with those
patches should be easy to do.

I've not CC'd all the relevant maintainers because its the merge window.
(...and yet there are folk chomping at the bit to see this posted...)


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


This series is based on arm64/for-next/core, and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/rfc

There is no snapshot branch - this is it!
I'll push the extras branch once I've gotten a handle on the DT shaped mess in
there.

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/


Thanks,

James Morse (32):
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
  arm_mpam: resctrl: Add rmid index helpers
  arm_mpam: resctrl: Add support for 'MB' resource
  arm_mpam: resctrl: Add support for csu counters
  arm_mpam: resctrl: pick classes for use as mbm counters
  arm_mpam: resctrl: Pre-allocate free running monitors
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Allow resctrl to allocate monitors
  arm_mpam: resctrl: Add resctrl_arch_rmid_read() and
    resctrl_arch_reset_rmid()
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()
  arm_mpam: resctrl: Add empty definitions for assorted resctrl
    functions
  arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
  arm_mpam: resctrl: Call resctrl_init() on platforms that can support
    resctrl
  arm_mpam: resctrl: Call resctrl_exit() in the event of errors
  arm_mpam: resctrl: Update the rmid reallocation limit
  arm_mpam: resctrl: Sort the order of the domain lists
  arm_mpam: Generate a configuration for min controls
  arm_mpam: Quirk CMN-650's CSU NRDY behaviour

Dave Martin (2):
  arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
  arm_mpam: resctrl: Add kunit test for control format conversions

Shanker Donthineni (4):
  arm_mpam: Add quirk framework
  arm_mpam: Add workaround for T241-MPAM-1
  arm_mpam: Add workaround for T241-MPAM-4
  arm_mpam: Add workaround for T241-MPAM-6

 Documentation/arch/arm64/silicon-errata.rst |    9 +
 arch/arm64/Kconfig                          |    6 +-
 arch/arm64/include/asm/kvm_host.h           |    1 +
 arch/arm64/include/asm/mpam.h               |  105 +
 arch/arm64/include/asm/resctrl.h            |    2 +
 arch/arm64/include/asm/thread_info.h        |    3 +
 arch/arm64/kernel/Makefile                  |    1 +
 arch/arm64/kernel/cpufeature.c              |   18 +-
 arch/arm64/kernel/mpam.c                    |   55 +
 arch/arm64/kernel/process.c                 |    7 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h  |   16 +
 arch/arm64/kvm/hyp/nvhe/switch.c            |   12 +
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c          |    1 +
 drivers/resctrl/Kconfig                     |    9 +-
 drivers/resctrl/Makefile                    |    1 +
 drivers/resctrl/mpam_devices.c              |  298 ++-
 drivers/resctrl/mpam_internal.h             |  120 +-
 drivers/resctrl/mpam_resctrl.c              | 1926 +++++++++++++++++++
 drivers/resctrl/test_mpam_devices.c         |   66 +
 drivers/resctrl/test_mpam_resctrl.c         |  374 ++++
 include/linux/arm_mpam.h                    |   32 +
 21 files changed, 3038 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/include/asm/mpam.h
 create mode 100644 arch/arm64/include/asm/resctrl.h
 create mode 100644 arch/arm64/kernel/mpam.c
 create mode 100644 drivers/resctrl/mpam_resctrl.c
 create mode 100644 drivers/resctrl/test_mpam_resctrl.c

-- 
2.39.5


