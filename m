Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31230108B902
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyyzjKCdArnRLGCPj0k5ifRxweT2tzi5Tl1QPG9/z30=; b=LdOOJs+nHhabrs
	43hg8OOPYoxDqiZCGn1oxC0Sv3SzwGpUzMKqjVAK0b44oTj8JVwZ2yPU11tTNP128NjN1Hxr55EEB
	VBIPMEHMf66I4Bq1dw/5r29aJhOhyy0VVuVTsAbj1B/aY5wzzQVyI9xOj0H1czsdd3KYWcjgpiyRZ
	oZYBUOUi2SYx00h9ZBrnPWpvw38j+LSa7nkFQ95Ys1AjK1I+OPUfiDwxKn66ByYtfgT27mq1O9TNj
	SntlAu4c0VZBQjyw3nV9/cW0AQglBnQxyS7FOATBWPnXxPxuwuEjFVtkPOeqLhwR7YSwKHEmDJPiX
	bi20+2Wb+IWEl+x7jcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y40-0000000ChYV-170a;
	Fri, 20 Mar 2026 11:30:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y3x-0000000ChXd-2nmw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:30:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37A8B16F3;
	Fri, 20 Mar 2026 04:30:38 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FE8F3F7BD;
	Fri, 20 Mar 2026 04:30:42 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception masking
Date: Fri, 20 Mar 2026 11:30:25 +0000
Message-Id: <20260320113026.3219620-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260320113026.3219620-1-mark.rutland@arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_043045_791390_6D999098 
X-CRM114-Status: GOOD (  22.23  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On arm64, involuntary kernel preemption has been subtly broken since the
move to the generic irq entry code. When preemption occurs, the new task
may run with SError and Debug exceptions masked unexpectedly, leading to
a loss of RAS events, breakpoints, watchpoints, and single-step
exceptions.

We can fix this relatively simply by moving the preemption logic out of
irqentry_exit(), which is desirable for a number of other reasons on
arm64. Context and rationale below:

1) Architecturally, several groups of exceptions can be masked
   independently, including 'Debug', 'SError', 'IRQ', and 'FIQ', whose
   mask bits can be read/written via the 'DAIF' register.

   Other mask bits exist, including 'PM' and 'AllInt', which we will
   need to use in future (e.g. for architectural NMI support).

   The entry code needs to manipulate all of these, but the generic
   entry code only knows about interrupts (which means both IRQ and FIQ
   on arm64), and the other exception masks aren't generic.

2) Architecturally, all maskable exceptions MUST be masked during
   exception entry and exception return.

   Upon exception entry, hardware places exception context into
   exception registers (e.g. the PC is saved into ELR_ELx). Upon
   exception return, hardware restores exception context from those
   exception registers (e.g. the PC is restored from ELR_ELx).

   To ensure the exception registers aren't clobbered by recursive
   exceptions, all maskable exceptions must be masked early during entry
   and late during exit. Hardware masks all maskable exceptions
   automatically at exception entry. Software must unmask these as
   required, and must mask them prior to exception return.

3) Architecturally, hardware masks all maskable exceptions upon any
   exception entry. A synchronous exception (e.g. a fault on a memory
   access) can be taken from any context (e.g. where IRQ+FIQ might be
   masked), and the entry code must explicitly 'inherit' the unmasking
   from the original context by reading the exception registers (e.g.
   SPSR_ELx) and writing to DAIF, etc.

4) When 'pseudo-NMI' is used, Linux masks interrupts via a combination
   of DAIF and the 'PMR' priority mask register. At entry and exit,
   interrupts must be masked via DAIF, but most kernel code will
   mask/unmask regular interrupts using PMR (e.g. in local_irq_save()
   and local_irq_restore()).

   This requires more complicated transitions at entry and exit. Early
   during entry or late during return, interrupts are masked via DAIF,
   and kernel code which manipulates PMR to mask/unmask interrupts will
   not function correctly in this state.

   This also requires fairly complicated management of DAIF and PMR when
   handling interrupts, and arm64 has special logic to avoid preempting
   from pseudo-NMIs which currently lives in
   arch_irqentry_exit_need_resched().

5) Most kernel code runs with all exceptions unmasked. When scheduling,
   only interrupts should be masked (by PMR pseudo-NMI is used, and by
   DAIF otherwise).

For most exceptions, arm64's entry code has a sequence similar to that
of el1_abort(), which is used for faults:

| static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
| {
|         unsigned long far = read_sysreg(far_el1);
|         irqentry_state_t state;
|
|         state = enter_from_kernel_mode(regs);
|         local_daif_inherit(regs);
|         do_mem_abort(far, esr, regs);
|         local_daif_mask();
|         exit_to_kernel_mode(regs, state);
| }

... where enter_from_kernel_mode() and exit_to_kernel_mode() are
wrappers around irqentry_enter() and irqentry_exit() which perform
additional arm64-specific entry/exit logic.

Currently, the generic irq entry code will attempt to preempt from any
exception under irqentry_exit() where interrupts were unmasked in the
original context. As arm64's entry code will have already masked
exceptions via DAIF, this results in the problems described above.

Fix this by opting out of preemption in irqentry_exit(), and restoring
arm64's old behaivour of explicitly preempting when returning from IRQ
or FIQ, before calling exit_to_kernel_mode() / irqentry_exit(). This
ensures that preemption occurs when only interrupts are masked, and
where that masking is compatible with most kernel code (e.g. using PMR
when pseudo-NMI is in use).

Fixes: 99eb057ccd67 ("arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()")
Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/Kconfig                     | 3 +++
 arch/arm64/Kconfig               | 1 +
 arch/arm64/kernel/entry-common.c | 2 ++
 kernel/entry/common.c            | 4 +++-
 4 files changed, 9 insertions(+), 1 deletion(-)

Thomas, Peter, I have a couple of things I'd like to check:

(1) The generic irq entry code will preempt from any exception (e.g. a
    synchronous fault) where interrupts were unmasked in the original
    context. Is that intentional/necessary, or was that just the way the
    x86 code happened to be implemented?

    I assume that it'd be fine if arm64 only preempted from true
    interrupts, but if that was intentional/necessary I can go rework
    this.

(2) The generic irq entry code only preempts when RCU was watching in
    the original context. IIUC that's just to avoid preempting from the
    idle thread. Is it functionally necessary to avoid that, or is that
    just an optimization?

    I'm asking because historically arm64 didn't check that, and I
    haven't bothered checking here. I don't know whether we have a
    latent functional bug.

Mark.

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298ef..c8c99cd955281 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,9 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config ARCH_HAS_OWN_IRQ_PREEMPTION
+	bool
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2d..bf0ec8237de45 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -42,6 +42,7 @@ config ARM64
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
+	select ARCH_HAS_OWN_IRQ_PREEMPTION
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8f..1aedadf09eb4d 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -497,6 +497,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
+	irqentry_exit_cond_resched();
+
 	exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 9ef63e4147913..af9cae1f225e3 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -235,8 +235,10 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 		}
 
 		instrumentation_begin();
-		if (IS_ENABLED(CONFIG_PREEMPTION))
+		if (IS_ENABLED(CONFIG_PREEMPTION) &&
+		    !IS_ENABLED(CONFIG_ARCH_HAS_OWN_IRQ_PREEMPTION)) {
 			irqentry_exit_cond_resched();
+		}
 
 		/* Covers both tracing and lockdep */
 		trace_hardirqs_on();
-- 
2.30.2


