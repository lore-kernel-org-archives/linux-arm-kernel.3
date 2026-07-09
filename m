Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63584C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LgYdaZ3pSMddt2a+O542LweJ/RKvDVSPl6eweVEmgdA=; b=tZWBr3YJWwN7PbHGaFoHHsm20v
	WMKXLN7dT3x3SFXdtwOzuULKjYBsAQuvDBXN6DHZvK8v3naiVjKDOZfjYNMSJBoXmS9K+R0TTVSWm
	GUO2TpcYc77HZS868gksjoZI8GZrwzSVQ6eTEnbDuDBX5Pcb1Inh7Ahq4dWt+ZrV7/JqZOK/BC8ic
	CnbWcxaILoUdAena7QV7PGXqQ1+6l5ewgwj/cs5xIiFhEhwr6iTDYyPpr9loImNu9Z4C8PTWFRTxz
	DYwfrOQ4QFQgSwChvQ0Bo50mmMQchnoN/P5N3JmWd9vn93phQReI4n1MKKH7ItWSKcIj3MxEmNors
	nuGkugcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndh-00000002KNN-2tet;
	Thu, 09 Jul 2026 12:14:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnde-00000002KM1-2eUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254AA339;
	Thu,  9 Jul 2026 05:13:50 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 715433F66F;
	Thu,  9 Jul 2026 05:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599234; bh=vcxiRk9gnwB3VRS/VvRWmwGe5qiJtqUoCS7N0kwO638=;
	h=From:To:Cc:Subject:Date:From;
	b=MY4OFpQSZ9KFnQNoHeKqoB5ac+XynmXusOk9BH7RHdcMEY4KqM4GcndrMmlearZS+
	 fY3+fd6JsVlrc+d94QZYYCa/D7G0+2uPOEDSnE7Mf2ZWsnb13RSyZ+nAdPN5PwNrbD
	 1NyTWeVxtWqOR+eL4LwlCvB4IvudsTu55pgHOMes=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 00/36] arm64: Add support for FEAT_NMI
Date: Thu,  9 Jul 2026 13:12:57 +0100
Message-Id: <20260709121333.23507-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051358_851770_983D637A 
X-CRM114-Status: GOOD (  19.27  )
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

FEAT_NMI provides an architected mechanism for supporting non-maskable
interrupts (NMIs) and less-masked interrupts (LMIs).

Since we already support pseudo-NMIs via priority masking, introducing
another flavour of NMI on top of the existing infrastructure could
easily become messy, making the code harder to follow and reason
about.

To avoid that, this series first makes room for the new NMI "tenant"
by restructuring the existing exception masking logic.

The main idea is to separate the logical view of exception state from
its hardware representation. To achieve this, we introduce logical
exception contexts that can be mapped onto the corresponding hardware
state. This naturally consolidates the hardware-specific handling into
a small number of places, while allowing the rest of the code to
operate purely in terms of logical exception contexts.

Since this restructuring is non-trivial and carries a risk of subtle
behavioural changes, the series adds extensive debug checks to verify
that the hardware state always matches the expected logical state.

With this restructuring in place, wiring FEAT_NMI into the new
framework becomes much more manageable.

This work would not have been possible without the contributions of
Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
them for everything that works well. Any remaining bugs or issues are
entirely my own.

I'd especially appreciate feedback on the overall approach. Please
don't hesitate to bikeshed the naming or other details - improving
clarity is one of the main goals of this series. Of course, technical
review is more than welcome as well.

The series would also benefit from extensive testing on real hardware
(without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
testing so far has been done on QEMU and FVP.

P.S.
I'm aware that Jinjie Ruan has a similar series on the mailing
list. I'm very open to collaborating and aligning our efforts if that
makes sense.

Thanks
Vladimir

Ada Couprie Diaz (19):
  arm64: debug: don't mask DAIF for mdscr_write()
  arm64: hibernate: mask DAIF before restoring hibernated kernel
  arm64: suspend: rely on daif helpers to handle PMR
  arm64: irq: introduce a helper for GIC priority initialization
  arm64: entry: mask DAIF before returning from C EL1 handlers
  irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when
    handling IRQs
  arm64: irqflags: introduce arm64-specific irqflags type
  arm64: irqflags: save and use both DAIF and PMR
  arm64: interrupts: introduce interrupt masking helpers for entry code
  arm64: entry: replace DAIF helpers with entry helpers
  arm64: interrupts: introduce generic interrupt masking helpers
  arm64: replace local_daif helpers
  arm64: cpuidle: use new helpers to bypass interrupt priority masking
  arm64: remove daifflags.h
  arm64: gicv3: remove GIC_PRIO_PSR_I_SET
  arm64: ptrace: Add PSR_ALLINT_BIT
  arm64: cpufeature: Detect PE support for FEAT_NMI
  arm64: nmi: Manage masking for superpriority interrupts
  arm64: irq: Report FEAT_NMI masking local IRQs

Lorenzo Pieralisi (1):
  irqchip/gic-v3: Implement FEAT_GICv3_NMI support

Mark Brown (5):
  arm64: booting: Document boot requirements for FEAT_NMI
  arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
  arm64: idreg: Add an override for FEAT_NMI
  arm64: nmi: Add handling of superpriority interrupts as NMIs
  arm64: nmi: Add Kconfig for NMI

Vladimir Murzin (11):
  arm64: ptrace: Remove INIT_PSTATE_EL2
  arm64: suspend: Initialize PMR on resume
  arm64: process: Use helper to check exception state
  arm64: cpufeature: Remove system_has_prio_mask_debugging()
  arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
  arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
  efi/runtime-wrappers: Permit architectures to override IRQ flags
    checks
  arm64/efi: Implement override for IRQ flags checks
  arm64: suspend: Always initialise PSTATE.ALLINT
  arm64/efi: Add ALLINT to IRQ flags checks
  arm64: kprobes: Disable NMIs

 Documentation/arch/arm64/booting.rst          |   6 +
 arch/arm/include/asm/arch_gicv3.h             |   6 +-
 arch/arm64/Kconfig                            |  29 +-
 arch/arm64/include/asm/arch_gicv3.h           |   7 +-
 arch/arm64/include/asm/assembler.h            |  24 +-
 arch/arm64/include/asm/cpucaps.h              |   2 +
 arch/arm64/include/asm/cpufeature.h           |  14 +-
 arch/arm64/include/asm/cpuidle.h              |  14 +-
 arch/arm64/include/asm/daifflags.h            | 144 --------
 arch/arm64/include/asm/efi.h                  |  42 ++-
 arch/arm64/include/asm/entry-common.h         |  10 +-
 .../include/asm/interrupts/common_flags.h     | 248 ++++++++++++++
 arch/arm64/include/asm/interrupts/entry.h     | 116 +++++++
 arch/arm64/include/asm/interrupts/masking.h   | 176 ++++++++++
 arch/arm64/include/asm/irqflags.h             | 148 ++++-----
 arch/arm64/include/asm/kvm_host.h             |   1 -
 arch/arm64/include/asm/mmu_context.h          |   1 -
 arch/arm64/include/asm/ptrace.h               |  17 +-
 arch/arm64/include/asm/sysreg.h               |   2 +
 arch/arm64/include/uapi/asm/ptrace.h          |   1 +
 arch/arm64/kernel/acpi.c                      |  15 +-
 arch/arm64/kernel/cpufeature.c                |  68 +++-
 arch/arm64/kernel/debug-monitors.c            |   4 -
 arch/arm64/kernel/entry-common.c              | 311 ++++++++++++------
 arch/arm64/kernel/entry.S                     |  18 +-
 arch/arm64/kernel/hibernate.c                 |  23 +-
 arch/arm64/kernel/irq.c                       |   9 +-
 arch/arm64/kernel/machine_kexec.c             |   4 +-
 arch/arm64/kernel/pi/idreg-override.c         |   1 +
 arch/arm64/kernel/probes/kprobes.c            |  24 +-
 arch/arm64/kernel/process.c                   |  24 +-
 arch/arm64/kernel/setup.c                     |   4 +-
 arch/arm64/kernel/signal.c                    |   1 -
 arch/arm64/kernel/smp.c                       |  18 +-
 arch/arm64/kernel/suspend.c                   |  26 +-
 arch/arm64/kernel/traps.c                     |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
 arch/arm64/kvm/hyp/vhe/switch.c               |  12 +-
 arch/arm64/mm/fault.c                         |   1 -
 arch/arm64/mm/mmu.c                           |   7 +-
 arch/arm64/mm/proc.S                          |   7 +
 arch/arm64/tools/cpucaps                      |   2 +
 drivers/firmware/efi/runtime-wrappers.c       |  32 +-
 drivers/irqchip/irq-gic-v3.c                  | 127 +++++--
 include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
 include/linux/irqchip/arm-gic-v3.h            |   4 +
 47 files changed, 1247 insertions(+), 521 deletions(-)
 delete mode 100644 arch/arm64/include/asm/daifflags.h
 create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
 create mode 100644 arch/arm64/include/asm/interrupts/entry.h
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

-- 
2.34.1


