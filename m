Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FBAC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOEQSnNalgqVIBCnNcYOX6JYFAly/Ty25dhrGeDePu0=; b=c0Qxh9cky6eVl1X8NnPDj4Jo5t
	pDolp9d2SqsfsDxSXTdBe9Xa7UkAIoV4gRFM66TZocYTP2OKqfkSAFwPnmDJzlhMJP8YQoXZTHKQe
	x2N+PsfVvusFFHL69ud5a6wM64viNU+/GK1rB/H4fNEMQgUPY4k5TPXwono2jfTbdqoIzmavKAK4e
	xGQLfTIZdrB1R06gzOz7K3+CboHs/5Ckq2NgBx6PXwH/GcsxCYGmc9IOeDkzohJMHqGQ8Do7CVLNQ
	cHaaaD+fWtc7DuVjULnJzi/wBuft8+W485sJ+7XbFJsh8GFZL4EcS9WunWnhGLbq5iJFfHCPtrSUI
	DFLH7+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuh6I-00000001oyn-0Ose;
	Fri, 14 Aug 2026 01:52:50 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuh6D-00000001oyS-1ugF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 01:52:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dOEQSnNalgqVIBCnNcYOX6JYFAly/Ty25dhrGeDePu0=;
	b=ARCae4H+N+jDhV3aCma0g48EcnagfpHGTzU5H5dXdd7QDzIdxOgVZ/558yLs1THzcRvfIZNIB
	lrA0pc0ePIzUrigjDr/UYyPoz2MaFz9hQmpW23kHUei/7QJ2UZRDsuWOXCHslcYElIbfa9lht4j
	w7iu2wtapzHDYDm00+MZEOc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hLlMQ6mJKz1K96b;
	Fri, 14 Aug 2026 09:41:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 15CAE40586;
	Fri, 14 Aug 2026 09:52:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Aug 2026 09:52:32 +0800
Message-ID: <d594b97c-747d-41df-8f7c-563ea11974df@huawei.com>
Date: Fri, 14 Aug 2026 09:52:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_185246_155053_9CBF7E0E 
X-CRM114-Status: GOOD (  31.38  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> To avoid that, this series first makes room for the new NMI "tenant"
> by restructuring the existing exception masking logic.
> 
> The main idea is to separate the logical view of exception state from
> its hardware representation. To achieve this, we introduce logical
> exception contexts that can be mapped onto the corresponding hardware
> state. This naturally consolidates the hardware-specific handling into
> a small number of places, while allowing the rest of the code to
> operate purely in terms of logical exception contexts.
> 
> Since this restructuring is non-trivial and carries a risk of subtle
> behavioural changes, the series adds extensive debug checks to verify
> that the hardware state always matches the expected logical state.
> 
> With this restructuring in place, wiring FEAT_NMI into the new
> framework becomes much more manageable.
> 
> This work would not have been possible without the contributions of
> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
> them for everything that works well. Any remaining bugs or issues are
> entirely my own.
> 
> I'd especially appreciate feedback on the overall approach. Please
> don't hesitate to bikeshed the naming or other details - improving
> clarity is one of the main goals of this series. Of course, technical
> review is more than welcome as well.
> 
> The series would also benefit from extensive testing on real hardware
> (without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
> testing so far has been done on QEMU and Fast Model.

Hi all,

Apart from gicv5, I have gone through the other patches. Apart from code
style issues, patch split and certain specific implementation details, I
don't see any major issues. I am very much looking forward to more
reviews, discussions, and the next version.

Best regards,
Jinjie

> 
> 
> Changelog
> 
>   RFC v1 -> RFC v2
> 
>     - Rebased on v7.2-rc5.
>     - Improved commit descriptions.
>     - Split some patches into smaller ones.
>     - Added a graceful fallback for IPI requests when FEAT_NMI is
>       supported by the CPU but unsupported by the interrupt
>       controller.
>     - Split the GICv3 preparation from the FEAT_GICv3_NMI
>       implementation.
>     - Added NMI support to GICv5, primarily as an illustration of the
>       implementation, although it also happens to work on Fast Model.
>     - Added review tags only to unchanged patches. Review tags were
>       intentionally dropped from modified patches to reflect those
>       changes and encourage re-review.
> 
> RFC v1:
>   https://lore.kernel.org/linux-arm-kernel/20260709121333.23507-1-vladimir.murzin@arm.com/T/#m6a9321ce39d4a8b1c2111638e5dde827336f355d
> 
> Thanks!
> Vladimir
> 
> Ada Couprie Diaz (20):
>   arm64: debug: don't mask DAIF for mdscr_write()
>   arm64: hibernate: mask DAIF before restoring hibernated kernel
>   arm64: suspend: rely on daif helpers to handle PMR
>   arm64: entry: mask DAIF before returning from C EL1 handlers
>   irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when
>     handling IRQs
>   arm64: irqflags: Introduce arm64-specific irqflags type
>   arm64: irqflags: save and use both DAIF and PMR
>   arm64: interrupts: Add common exception state helpers
>   arm64: entry: Introduce entry specific exception masking helpers
>   arm64: entry: replace DAIF helpers with entry helpers
>   arm64: interrupts: Introduce exception masking save/restore helpers
>   arm64: interrupts: introduce a helper for GIC priority initialization
>   arm64: replace local_daif helpers
>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>   arm64: remove daifflags.h
>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>   arm64: ptrace: Add PSR_ALLINT_BIT
>   arm64: cpufeature: Detect PE support for FEAT_NMI
>   arm64: nmi: Manage masking for superpriority interrupts
>   arm64: irq: Report FEAT_NMI masking local IRQs
> 
> Lorenzo Pieralisi (2):
>   irqchip/gic-v3: Prepare for FEAT_GICv3_NMI support
>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
> 
> Mark Brown (5):
>   arm64: booting: Document boot requirements for FEAT_NMI
>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>   arm64: idreg: Add an override for FEAT_NMI
>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>   arm64: nmi: Add Kconfig for NMI
> 
> Vladimir Murzin (18):
>   arm64: ptrace: Remove INIT_PSTATE_EL2
>   arm64: hibernate: Restore DAIF state on error
>   arm64: suspend: Initialize PMR on resume
>   arm64: entry: Avoid unnecessary local_irq_disable() on kernel exit
>   arm64: process: Use helper to check exception state
>   arm64: cpufeature: Remove system_has_prio_mask_debugging()
>   arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
>   arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
>   efi/runtime-wrappers: Permit architectures to override IRQ flags
>     checks
>   arm64/efi: Implement override for IRQ flags checks
>   arm64: suspend: Always initialise PSTATE.ALLINT
>   arm64/efi: Add ALLINT to IRQ flags checks
>   arm64: kprobes: Disable NMIs
>   arm64: smp: Abstract SGI and LPI operations
>   arm64: smp: Fall back to IRQ when IPI NMI request fails
>   arm64: smp: Add NMI support for LPI-backed IPIs
>   irqchip/gic-v5: Add NMI support for PPIs, SPIs and LPIs
>   irqchip/gic-v5: Add NMI support for IPIs
> 
>  Documentation/arch/arm64/booting.rst          |   6 +
>  arch/arm/include/asm/arch_gicv3.h             |   6 +-
>  arch/arm64/Kconfig                            |  29 +-
>  arch/arm64/include/asm/arch_gicv3.h           |   7 +-
>  arch/arm64/include/asm/assembler.h            |  24 +-
>  arch/arm64/include/asm/cpucaps.h              |   2 +
>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>  arch/arm64/include/asm/cpuidle.h              |  18 +-
>  arch/arm64/include/asm/daifflags.h            | 144 --------
>  arch/arm64/include/asm/efi.h                  |  42 ++-
>  arch/arm64/include/asm/entry-common.h         |  10 +-
>  .../include/asm/interrupts/common_flags.h     | 259 +++++++++++++
>  arch/arm64/include/asm/interrupts/entry.h     | 119 ++++++
>  arch/arm64/include/asm/interrupts/masking.h   | 170 +++++++++
>  arch/arm64/include/asm/irqflags.h             | 149 ++++----
>  arch/arm64/include/asm/kvm_host.h             |   1 -
>  arch/arm64/include/asm/mmu_context.h          |   1 -
>  arch/arm64/include/asm/ptrace.h               |  27 +-
>  arch/arm64/include/asm/sysreg.h               |   2 +
>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>  arch/arm64/kernel/acpi.c                      |  15 +-
>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>  arch/arm64/kernel/debug-monitors.c            |   4 -
>  arch/arm64/kernel/entry-common.c              | 347 +++++++++++++-----
>  arch/arm64/kernel/entry.S                     |  18 +-
>  arch/arm64/kernel/hibernate.c                 |  26 +-
>  arch/arm64/kernel/irq.c                       |  45 ++-
>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>  arch/arm64/kernel/process.c                   |  24 +-
>  arch/arm64/kernel/setup.c                     |   4 +-
>  arch/arm64/kernel/signal.c                    |   1 -
>  arch/arm64/kernel/smp.c                       | 230 ++++++++----
>  arch/arm64/kernel/suspend.c                   |  26 +-
>  arch/arm64/kernel/traps.c                     |   1 -
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>  arch/arm64/kvm/hyp/vhe/switch.c               |  14 +-
>  arch/arm64/mm/fault.c                         |   1 -
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/arm64/mm/proc.S                          |   7 +
>  arch/arm64/tools/cpucaps                      |   2 +
>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>  drivers/irqchip/irq-gic-v3.c                  | 137 ++++++-
>  drivers/irqchip/irq-gic-v5.c                  | 244 +++++++++++-
>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>  kernel/irq/handle.c                           |   3 +-
>  kernel/irq/manage.c                           |  11 +-
>  50 files changed, 1734 insertions(+), 614 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 


