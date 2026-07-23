Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54118C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 03:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdTNhDz79coVG90lr9kcDinnTiiuCDBL+1Sav220N1s=; b=pxCcQOwWt4GQxho6GMR9Wmbj1A
	8gLppYv2nRXZbHhNppgnBOvPU5B3PAnwTZxMN/nAxR07Fb/6sYBUfbUgUdaXBgbzrD2umnpOS67el
	XYnA/++pNxbYN3IrfbG18ng9mycT5I5ox2Z34voUVRfIXd/LJxGdGyhy0iO6W18yZqSSIkLasv4Yk
	aeDwoJwXDF/wQYPH1zn+CM/bKuNKsts9cXeVIf+7ovyu8x9BZ2DlB6utLGB2zuRQaIwS+NGHqNwoH
	v9ZMzki+VOvbpInD5zpISpjvq1AQCevTiROf1ul4b4kqpSXj5G9NruZzxi/yXV6yu6CnPWH9RMj5I
	UmsDlKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkVT-0000000DLfK-1dQA;
	Thu, 23 Jul 2026 03:53:59 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkVO-0000000DLeH-1lrg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 03:53:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cdTNhDz79coVG90lr9kcDinnTiiuCDBL+1Sav220N1s=;
	b=6r8ir6lXutiFBFi54KOAFgsNAFRKi5kjkwUaHMNG+tzOGl7uDF6ItgmhHhbeyVuNEaZN/xErc
	Wq0BInpUZ2j4+0sofP1KKJB8IlsAwMdYAlSfqZIjfsAne5EK8beDhTraLb+cz3o472fkG0MxAvD
	GZ2Pt4aYXDAsqRNIJLU6DCA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h5H7B2R3rzpStj;
	Thu, 23 Jul 2026 11:44:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A874240561;
	Thu, 23 Jul 2026 11:53:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 11:53:44 +0800
Message-ID: <7df0ce45-c09c-4be5-bfa5-71b98c46a0e9@huawei.com>
Date: Thu, 23 Jul 2026 11:53:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/36] arm64: Add support for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_205354_842014_AC5E4B0B 
X-CRM114-Status: GOOD (  34.41  )
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



在 2026/7/9 20:12, Vladimir Murzin 写道:
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
> testing so far has been done on QEMU and FVP.
> 
> P.S.
> I'm aware that Jinjie Ruan has a similar series on the mailing
> list. I'm very open to collaborating and aligning our efforts if that
> makes sense.
> 
> Thanks
> Vladimir
> 
> Ada Couprie Diaz (19):
>   arm64: debug: don't mask DAIF for mdscr_write()
>   arm64: hibernate: mask DAIF before restoring hibernated kernel
>   arm64: suspend: rely on daif helpers to handle PMR
>   arm64: irq: introduce a helper for GIC priority initialization
>   arm64: entry: mask DAIF before returning from C EL1 handlers
>   irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when
>     handling IRQs
>   arm64: irqflags: introduce arm64-specific irqflags type
>   arm64: irqflags: save and use both DAIF and PMR
>   arm64: interrupts: introduce interrupt masking helpers for entry code
>   arm64: entry: replace DAIF helpers with entry helpers
>   arm64: interrupts: introduce generic interrupt masking helpers
>   arm64: replace local_daif helpers
>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>   arm64: remove daifflags.h
>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>   arm64: ptrace: Add PSR_ALLINT_BIT
>   arm64: cpufeature: Detect PE support for FEAT_NMI
>   arm64: nmi: Manage masking for superpriority interrupts
>   arm64: irq: Report FEAT_NMI masking local IRQs
> 
> Lorenzo Pieralisi (1):
>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
> 
> Mark Brown (5):
>   arm64: booting: Document boot requirements for FEAT_NMI
>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>   arm64: idreg: Add an override for FEAT_NMI
>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>   arm64: nmi: Add Kconfig for NMI
> 
> Vladimir Murzin (11):
>   arm64: ptrace: Remove INIT_PSTATE_EL2
>   arm64: suspend: Initialize PMR on resume
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


Hi Vladimir,

In the past two years, while debugging the FEAT_NMI code externally, we
encountered an issue related to the hardware NMI interrupt cancellation.

I'm sharing this below to exchange ideas with you. I've reanalyzed your
code, and it seems that this issue has been resolved.

The sequence of issues I understand is as follows:

CPU (IRQs disabled)          GICv3               Normal IRQ          NMI
===============              =====               ==========         ====
    |                           |                     |                |
    |                           | <--- pending -------+                |
    |                           |  (IRQ latched)      |                |
    |                           |                     |                |
    |                           | <--- NMI arrives --------------------+
    |                           |  (ISR_EL1.NMI = 1)  |                |
    |                           |                     |                |
    | <--- IRQ exception -------+                     |                |
    |  (enter el1_interrupt())  |                     |                |
    |                           |                     |                |
    |                           | <--- NMI withdraw -------------------+
    |                           |  (ISR_EL1.NMI = 0)  |                |
    |                           |                     |                |
    | (regs_irqs_disabled()is true)  |                |                |
    |   call __el1_nmi()
    |                           |                     |                |
    | call gic_handle_irq()     |                     |                |
    |  -> gic_read_nmiar()      |                     |                |
    |     -> read special 1023  |                     |                |
    |        -> safe return     |                     |                |


Our fix, based on Mark's original version of the code, is as follows:

 static void __gic_handle_irq_from_irqson(struct pt_regs *regs)
{
        bool is_nmi;
        u32 irqnr;

        /*
         * We should enter here with interrupts disabled, otherwise we
may met
         * a race here with FEAT_NMI/FEAT_GICv3_NMI:
         *
         * [interrupt disabled]
         *                   <- normal interrupt pending, for example
timer interrupt
         *                   <- NMI occurs, ISR_EL1.nmi = 1
         * do_el1_interrupt()
         *                   <- NMI withdraw, ISR_EL1.nmi = 0
         *   ISR_EL1.nmi = 0, not an NMI interrupt
         *   gic_handle_irq()
         *     __gic_handle_irq_from_irqson()
         *       irqnr = gic_read_iar() <- Oops, ack and handle an
normal interrupt
         *                                 in interrupt disabled context!
         *
         * So if we met this case here, just return from the interrupt
context.
         * Since the interrupt is still pending, we can handle it once the
         * interrupt re-enabled and it'll not be missing.
         */
        if (!interrupts_enabled(regs))
                return;

        irqnr = gic_read_iar();

        is_nmi = gic_rpr_is_nmi_prio();

        if (is_nmi) {
                nmi_enter();
                __gic_handle_nmi(irqnr, regs);
                nmi_exit();
        }

        if (gic_prio_masking_enabled()) {
                gic_pmr_mask_irqs();
                gic_arch_enable_irqs();
        }

 ......

}


Best regards,
Jinjie

> 
>  Documentation/arch/arm64/booting.rst          |   6 +
>  arch/arm/include/asm/arch_gicv3.h             |   6 +-
>  arch/arm64/Kconfig                            |  29 +-
>  arch/arm64/include/asm/arch_gicv3.h           |   7 +-
>  arch/arm64/include/asm/assembler.h            |  24 +-
>  arch/arm64/include/asm/cpucaps.h              |   2 +
>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>  arch/arm64/include/asm/cpuidle.h              |  14 +-
>  arch/arm64/include/asm/daifflags.h            | 144 --------
>  arch/arm64/include/asm/efi.h                  |  42 ++-
>  arch/arm64/include/asm/entry-common.h         |  10 +-
>  .../include/asm/interrupts/common_flags.h     | 248 ++++++++++++++
>  arch/arm64/include/asm/interrupts/entry.h     | 116 +++++++
>  arch/arm64/include/asm/interrupts/masking.h   | 176 ++++++++++
>  arch/arm64/include/asm/irqflags.h             | 148 ++++-----
>  arch/arm64/include/asm/kvm_host.h             |   1 -
>  arch/arm64/include/asm/mmu_context.h          |   1 -
>  arch/arm64/include/asm/ptrace.h               |  17 +-
>  arch/arm64/include/asm/sysreg.h               |   2 +
>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>  arch/arm64/kernel/acpi.c                      |  15 +-
>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>  arch/arm64/kernel/debug-monitors.c            |   4 -
>  arch/arm64/kernel/entry-common.c              | 311 ++++++++++++------
>  arch/arm64/kernel/entry.S                     |  18 +-
>  arch/arm64/kernel/hibernate.c                 |  23 +-
>  arch/arm64/kernel/irq.c                       |   9 +-
>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>  arch/arm64/kernel/process.c                   |  24 +-
>  arch/arm64/kernel/setup.c                     |   4 +-
>  arch/arm64/kernel/signal.c                    |   1 -
>  arch/arm64/kernel/smp.c                       |  18 +-
>  arch/arm64/kernel/suspend.c                   |  26 +-
>  arch/arm64/kernel/traps.c                     |   1 -
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>  arch/arm64/kvm/hyp/vhe/switch.c               |  12 +-
>  arch/arm64/mm/fault.c                         |   1 -
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/arm64/mm/proc.S                          |   7 +
>  arch/arm64/tools/cpucaps                      |   2 +
>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>  drivers/irqchip/irq-gic-v3.c                  | 127 +++++--
>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>  47 files changed, 1247 insertions(+), 521 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 


