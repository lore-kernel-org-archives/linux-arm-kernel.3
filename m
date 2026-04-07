Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC01FEEF41
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13doc/3FCKY4n9lX9uzBGkJYjgPPbjSoK4aoirBe+NY=; b=pBwgrKu7GXWKlK
	RKTjC2wSLOm6luU9f38Zpe2ZhQOs7s6yWX5ZaTPmR2XY7Q1g8IFTWgEVoIKIzueTYoQbjeU/3v6UM
	nqpAq1y7W8udCJ7ojXhojo+UscjRfILz96A6mJe5hIx0E1yTc9DRGLSI0IxY/85sS202JL1YaEmEt
	Ye4wSfAAu8mtx0JW5AWNZPsfPHowrYT7LtIi/WqxxVQAvnlxRcOXbDdYWNmZlk66dnOCYqfvjZyst
	DN+MSMvhxRFecgDsAb5HIZjetWWia8qLzzRmwirEb2KVCsR56/9X63hnY5lu+5iFE71Fa1Ad0hAMW
	6OMWPhkkSZ5ELZdUOb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JN-00000006V4l-2BLn;
	Tue, 07 Apr 2026 13:17:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JL-00000006V2z-35nB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 842BC16F2;
	Tue,  7 Apr 2026 06:17:36 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62E0A3F7D8;
	Tue,  7 Apr 2026 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567862; bh=A2D6lxL6Il0+BUIp51/50fVPIMF1mAhdZSwxbep0s0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVwhDsGqS69W8pyM5O2Irxf3e+RSC1VmIe6Qpvxlpls5xl3IutTi9qO84rCJbqmB9
	 TYf59sOhZX5hYSLbiPCI22HTxv/gGabXgva3U5rC6981gflphFbwp+pqAmNSPwfuUd
	 sPEtQFvUq/V8wqJXLNdRevCJ4w26ssEX3MKKccxU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 04/10] entry: Split kernel mode logic from irqentry_{enter,exit}()
Date: Tue,  7 Apr 2026 14:16:44 +0100
Message-Id: <20260407131650.3813777-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061743_873142_C614CAF3 
X-CRM114-Status: GOOD (  34.15  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The generic irqentry code has entry/exit functions specifically for
exceptions taken from user mode, but doesn't have entry/exit functions
specifically for exceptions taken from kernel mode.

It would be helpful to have separate entry/exit functions specifically
for exceptions taken from kernel mode. This would make the structure of
the entry code more consistent, and would make it easier for
architectures to manage logic specific to exceptions taken from kernel
mode.

Move the logic specific to kernel mode out of irqentry_enter() and
irqentry_exit() into new irqentry_enter_from_kernel_mode() and
irqentry_exit_to_kernel_mode() functions. These are marked
__always_inline and placed in irq-entry-common.h, as with
irqentry_enter_from_user_mode() and irqentry_exit_to_user_mode(), so
that they can be inlined into architecture-specific wrappers. The
existing out-of-line irqentry_enter() and irqentry_exit() functions
retained as callers of the new functions.

The lockdep assertion from irqentry_exit() is moved into
irqentry_exit_to_user_mode() and irqentry_exit_to_kernel_mode(). This
was previously missing from irqentry_exit_to_user_mode() when called
directly, and any new lockdep assertion failure relating from this
change is a latent bug.

Aside from the lockdep change noted above, there should be no functional
change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/irq-entry-common.h | 103 +++++++++++++++++++++++++++++++
 kernel/entry/common.c            | 103 +++----------------------------
 2 files changed, 111 insertions(+), 95 deletions(-)

Thomas/Peter/Andy, as mentioned on IRC, I haven't created kerneldoc
comments for these new functions because the existing comments don't
seem all that consistent (e.g. for user mode vs kernel mode), and I
suspect we want to rewrite them all in one go for wider consistency.

I'm happy to respin this, or to follow-up with that as per your
preference.

Mark.

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index d1e8591a59195..2206150e526d8 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -304,6 +304,8 @@ static __always_inline void irqentry_enter_from_user_mode(struct pt_regs *regs)
  */
 static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	lockdep_assert_irqs_disabled();
+
 	instrumentation_begin();
 	irqentry_exit_to_user_mode_prepare(regs);
 	instrumentation_end();
@@ -356,6 +358,107 @@ void dynamic_irqentry_exit_cond_resched(void);
 #define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
+static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+	irqentry_state_t ret = {
+		.exit_rcu = false,
+	};
+
+	/*
+	 * If this entry hit the idle task invoke ct_irq_enter() whether
+	 * RCU is watching or not.
+	 *
+	 * Interrupts can nest when the first interrupt invokes softirq
+	 * processing on return which enables interrupts.
+	 *
+	 * Scheduler ticks in the idle task can mark quiescent state and
+	 * terminate a grace period, if and only if the timer interrupt is
+	 * not nested into another interrupt.
+	 *
+	 * Checking for rcu_is_watching() here would prevent the nesting
+	 * interrupt to invoke ct_irq_enter(). If that nested interrupt is
+	 * the tick then rcu_flavor_sched_clock_irq() would wrongfully
+	 * assume that it is the first interrupt and eventually claim
+	 * quiescent state and end grace periods prematurely.
+	 *
+	 * Unconditionally invoke ct_irq_enter() so RCU state stays
+	 * consistent.
+	 *
+	 * TINY_RCU does not support EQS, so let the compiler eliminate
+	 * this part when enabled.
+	 */
+	if (!IS_ENABLED(CONFIG_TINY_RCU) &&
+	    (is_idle_task(current) || arch_in_rcu_eqs())) {
+		/*
+		 * If RCU is not watching then the same careful
+		 * sequence vs. lockdep and tracing is required
+		 * as in irqentry_enter_from_user_mode().
+		 */
+		lockdep_hardirqs_off(CALLER_ADDR0);
+		ct_irq_enter();
+		instrumentation_begin();
+		kmsan_unpoison_entry_regs(regs);
+		trace_hardirqs_off_finish();
+		instrumentation_end();
+
+		ret.exit_rcu = true;
+		return ret;
+	}
+
+	/*
+	 * If RCU is watching then RCU only wants to check whether it needs
+	 * to restart the tick in NOHZ mode. rcu_irq_enter_check_tick()
+	 * already contains a warning when RCU is not watching, so no point
+	 * in having another one here.
+	 */
+	lockdep_hardirqs_off(CALLER_ADDR0);
+	instrumentation_begin();
+	kmsan_unpoison_entry_regs(regs);
+	rcu_irq_enter_check_tick();
+	trace_hardirqs_off_finish();
+	instrumentation_end();
+
+	return ret;
+}
+
+static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (!regs_irqs_disabled(regs)) {
+		/*
+		 * If RCU was not watching on entry this needs to be done
+		 * carefully and needs the same ordering of lockdep/tracing
+		 * and RCU as the return to user mode path.
+		 */
+		if (state.exit_rcu) {
+			instrumentation_begin();
+			/* Tell the tracer that IRET will enable interrupts */
+			trace_hardirqs_on_prepare();
+			lockdep_hardirqs_on_prepare();
+			instrumentation_end();
+			ct_irq_exit();
+			lockdep_hardirqs_on(CALLER_ADDR0);
+			return;
+		}
+
+		instrumentation_begin();
+		if (IS_ENABLED(CONFIG_PREEMPTION))
+			irqentry_exit_cond_resched();
+
+		/* Covers both tracing and lockdep */
+		trace_hardirqs_on();
+		instrumentation_end();
+	} else {
+		/*
+		 * IRQ flags state is correct already. Just tell RCU if it
+		 * was not watching on entry.
+		 */
+		if (state.exit_rcu)
+			ct_irq_exit();
+	}
+}
+
 /**
  * irqentry_enter - Handle state tracking on ordinary interrupt entries
  * @regs:	Pointer to pt_regs of interrupted context
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index b5e05d87ba391..1034be02eae84 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -105,70 +105,16 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 
 noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 {
-	irqentry_state_t ret = {
-		.exit_rcu = false,
-	};
-
 	if (user_mode(regs)) {
-		irqentry_enter_from_user_mode(regs);
-		return ret;
-	}
+		irqentry_state_t ret = {
+			.exit_rcu = false,
+		};
 
-	/*
-	 * If this entry hit the idle task invoke ct_irq_enter() whether
-	 * RCU is watching or not.
-	 *
-	 * Interrupts can nest when the first interrupt invokes softirq
-	 * processing on return which enables interrupts.
-	 *
-	 * Scheduler ticks in the idle task can mark quiescent state and
-	 * terminate a grace period, if and only if the timer interrupt is
-	 * not nested into another interrupt.
-	 *
-	 * Checking for rcu_is_watching() here would prevent the nesting
-	 * interrupt to invoke ct_irq_enter(). If that nested interrupt is
-	 * the tick then rcu_flavor_sched_clock_irq() would wrongfully
-	 * assume that it is the first interrupt and eventually claim
-	 * quiescent state and end grace periods prematurely.
-	 *
-	 * Unconditionally invoke ct_irq_enter() so RCU state stays
-	 * consistent.
-	 *
-	 * TINY_RCU does not support EQS, so let the compiler eliminate
-	 * this part when enabled.
-	 */
-	if (!IS_ENABLED(CONFIG_TINY_RCU) &&
-	    (is_idle_task(current) || arch_in_rcu_eqs())) {
-		/*
-		 * If RCU is not watching then the same careful
-		 * sequence vs. lockdep and tracing is required
-		 * as in irqentry_enter_from_user_mode().
-		 */
-		lockdep_hardirqs_off(CALLER_ADDR0);
-		ct_irq_enter();
-		instrumentation_begin();
-		kmsan_unpoison_entry_regs(regs);
-		trace_hardirqs_off_finish();
-		instrumentation_end();
-
-		ret.exit_rcu = true;
+		irqentry_enter_from_user_mode(regs);
 		return ret;
 	}
 
-	/*
-	 * If RCU is watching then RCU only wants to check whether it needs
-	 * to restart the tick in NOHZ mode. rcu_irq_enter_check_tick()
-	 * already contains a warning when RCU is not watching, so no point
-	 * in having another one here.
-	 */
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	instrumentation_begin();
-	kmsan_unpoison_entry_regs(regs);
-	rcu_irq_enter_check_tick();
-	trace_hardirqs_off_finish();
-	instrumentation_end();
-
-	return ret;
+	return irqentry_enter_from_kernel_mode(regs);
 }
 
 /**
@@ -212,43 +158,10 @@ void dynamic_irqentry_exit_cond_resched(void)
 
 noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 {
-	lockdep_assert_irqs_disabled();
-
-	/* Check whether this returns to user mode */
-	if (user_mode(regs)) {
+	if (user_mode(regs))
 		irqentry_exit_to_user_mode(regs);
-	} else if (!regs_irqs_disabled(regs)) {
-		/*
-		 * If RCU was not watching on entry this needs to be done
-		 * carefully and needs the same ordering of lockdep/tracing
-		 * and RCU as the return to user mode path.
-		 */
-		if (state.exit_rcu) {
-			instrumentation_begin();
-			/* Tell the tracer that IRET will enable interrupts */
-			trace_hardirqs_on_prepare();
-			lockdep_hardirqs_on_prepare();
-			instrumentation_end();
-			ct_irq_exit();
-			lockdep_hardirqs_on(CALLER_ADDR0);
-			return;
-		}
-
-		instrumentation_begin();
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			irqentry_exit_cond_resched();
-
-		/* Covers both tracing and lockdep */
-		trace_hardirqs_on();
-		instrumentation_end();
-	} else {
-		/*
-		 * IRQ flags state is correct already. Just tell RCU if it
-		 * was not watching on entry.
-		 */
-		if (state.exit_rcu)
-			ct_irq_exit();
-	}
+	else
+		irqentry_exit_to_kernel_mode(regs, state);
 }
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
-- 
2.30.2


