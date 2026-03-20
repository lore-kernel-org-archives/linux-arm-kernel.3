Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6838108B901
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlgAcyyHqNOc1MBpgJuhEwQRVsybw8o2VVDYrxkGivw=; b=f7jJUnO0K1RsJz
	Y/qe3fAkpyPbDoUuSVRaO//V4lKyANZ6tIWFcK0sQbRmkV7cJ/MujkgDTygJ0xLWs1rlp2zTidELQ
	eVluFSIgxrb2OVbXG0/OrB+kpgHtk4LnvrlvxQLwdG/YWnyXnkrRJ+237MJbxEcLxW5jHWnhqAsVn
	kgoiFN0ZjJFJJIjdLd9RqPunIxnN8Ww8EobV9g5qymHpvnLYB8ifSUN18Lnv4A9uhBdwo0i9UsogQ
	p/Zf5axNXDN7rHpmznK1Q17SqIt1NZg7HGRuC8r4OxShR3uyfq43e/CF/qGHGMc7pKSSsBn2m+yHN
	0HSoRS/nz3PAKuzOVvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y45-0000000ChZo-2Tw4;
	Fri, 20 Mar 2026 11:30:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y42-0000000ChZE-43i4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:30:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3718422F8;
	Fri, 20 Mar 2026 04:30:42 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FD273F7BD;
	Fri, 20 Mar 2026 04:30:46 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64/entry: Remove arch_irqentry_exit_need_resched()
Date: Fri, 20 Mar 2026 11:30:26 +0000
Message-Id: <20260320113026.3219620-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260320113026.3219620-1-mark.rutland@arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_043051_863470_64711682 
X-CRM114-Status: GOOD (  14.38  )
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

The only user of arch_irqentry_exit_need_resched() is arm64. As arm64
provides its own preemption logic, there's no need to indirect some of
this via the generic irq entry code.

Remove arch_irqentry_exit_need_resched(), and fold its logic directly
into arm64's entry code.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/entry-common.h | 27 ---------------------------
 arch/arm64/kernel/entry-common.c      | 27 ++++++++++++++++++++++++++-
 kernel/entry/common.c                 | 16 +---------------
 3 files changed, 27 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index cab8cd78f6938..2b8335ea2a390 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -27,31 +27,4 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 
 #define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
 
-static inline bool arch_irqentry_exit_need_resched(void)
-{
-	/*
-	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-	 * DAIF we must have handled an NMI, so skip preemption.
-	 */
-	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return false;
-
-	/*
-	 * Preempting a task from an IRQ means we leave copies of PSTATE
-	 * on the stack. cpufeature's enable calls may modify PSTATE, but
-	 * resuming one of these preempted tasks would undo those changes.
-	 *
-	 * Only allow a task to be preempted once cpufeatures have been
-	 * enabled.
-	 */
-	if (!system_capabilities_finalized())
-		return false;
-
-	return true;
-}
-
-#define arch_irqentry_exit_need_resched arch_irqentry_exit_need_resched
-
 #endif /* _ASM_ARM64_ENTRY_COMMON_H */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 1aedadf09eb4d..c4481e0e326a7 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -486,6 +486,31 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 	irqentry_nmi_exit(regs, state);
 }
 
+static void arm64_irqentry_exit_cond_resched(void)
+{
+	/*
+	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * DAIF we must have handled an NMI, so skip preemption.
+	 */
+	if (system_uses_irq_prio_masking() && read_sysreg(daif))
+		return;
+
+	/*
+	 * Preempting a task from an IRQ means we leave copies of PSTATE
+	 * on the stack. cpufeature's enable calls may modify PSTATE, but
+	 * resuming one of these preempted tasks would undo those changes.
+	 *
+	 * Only allow a task to be preempted once cpufeatures have been
+	 * enabled.
+	 */
+	if (!system_capabilities_finalized())
+		return;
+
+	irqentry_exit_cond_resched();
+}
+
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
@@ -497,7 +522,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	irqentry_exit_cond_resched();
+	arm64_irqentry_exit_cond_resched();
 
 	exit_to_kernel_mode(regs, state);
 }
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index af9cae1f225e3..28351d76cfeb3 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,20 +171,6 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	return ret;
 }
 
-/**
- * arch_irqentry_exit_need_resched - Architecture specific need resched function
- *
- * Invoked from raw_irqentry_exit_cond_resched() to check if resched is needed.
- * Defaults return true.
- *
- * The main purpose is to permit arch to avoid preemption of a task from an IRQ.
- */
-static inline bool arch_irqentry_exit_need_resched(void);
-
-#ifndef arch_irqentry_exit_need_resched
-static inline bool arch_irqentry_exit_need_resched(void) { return true; }
-#endif
-
 void raw_irqentry_exit_cond_resched(void)
 {
 	if (!preempt_count()) {
@@ -192,7 +178,7 @@ void raw_irqentry_exit_cond_resched(void)
 		rcu_irq_exit_check_preempt();
 		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
 			WARN_ON_ONCE(!on_thread_stack());
-		if (need_resched() && arch_irqentry_exit_need_resched())
+		if (need_resched())
 			preempt_schedule_irq();
 	}
 }
-- 
2.30.2


