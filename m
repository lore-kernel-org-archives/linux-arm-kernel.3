Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA52FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1LOCiscFEjSoqgCDhMw5kpuextA75e49lXHljIliqE=; b=C/vnh6O/V4/b6e
	PCWqp3DPa98OBuA0cDxi7roGNPuW0a/NR7KnmlPFnnBgfSWCLxTcb5r71mVpaiqkURMT9PKAIxA+t
	I82+n0GidoDDSOO1qPt3PBRhBiFoSG39/ZWxUovERra8CCBv2h6srg27D4bVlDz1AUWlxX6BTz1lU
	ZQCUTT3HAt/ZNlTOMzjmzWjIdH+j4O2Pe+RQStY4X8etga2dXs43z+PsUKspViAEPGm0/5wulwX0J
	NEnsZG7V/Zb82VScQpmyKvSX0CavQz6tuEuO7MbRcmK6EQx/bIM2BfbMk8NggccCTn86L04tfVNEK
	/mdQJWa1zbPh+sihttiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KY-00000006Vb3-3cZM;
	Tue, 07 Apr 2026 13:18:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KW-00000006Va0-0Am4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:18:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142061BB2;
	Tue,  7 Apr 2026 06:18:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E87773F7D8;
	Tue,  7 Apr 2026 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567934; bh=2GspNv828Xl2KX6qp8neNpclH69k3zwgwYawgy5AC/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bmZlTDyERLi4Xu/Ur7JYtQNwtgWONgcg1HR2cHS0Pv2toiJ4i+q3TU3LC67YbRsMG
	 dZLCOI+C42wZbrNhYG0PF6j2+nApBR1+ZhEGuovcHqLYkNwoWkmG1O0Pvifqv3Giyt
	 Dg9vh+AW4sFwXkbtKHlXOkI+/c1av6MBiF0sicf8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 09/10] arm64: entry: Use split preemption logic
Date: Tue,  7 Apr 2026 14:16:49 +0100
Message-Id: <20260407131650.3813777-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061856_163354_EFB64686 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The generic irqentry code now provides
irqentry_exit_to_kernel_mode_preempt() and
irqentry_exit_to_kernel_mode_after_preempt(), which can be used
where architectures have different state requirements for involuntary
preemption and exception return, as is the case on arm64.

Use the new functions on arm64, aligning our exit to kernel mode logic
with the style of our exit to user mode logic. This removes the need for
the recently-added bodge in arch_irqentry_exit_need_resched(), and
allows preemption to occur when returning from any exception taken from
kernel mode, which is nicer for RT.

In an ideal world, we'd remove arch_irqentry_exit_need_resched(), and
fold the conditionality directly into the architecture-specific entry
code. That way all the logic necessary to avoid preempting from a
pseudo-NMI could be constrained specifically to the EL1 IRQ/FIQ paths,
avoiding redundant work for other exceptions, and making the flow a bit
clearer. At present it looks like that would require a larger
refactoring (e.g. for the PREEMPT_DYNAMIC logic), and so I've left that
as-is for now.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/entry-common.h | 21 ++++++++-------------
 arch/arm64/kernel/entry-common.c      | 12 ++++--------
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 20f0a7c7bde15..cab8cd78f6938 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -29,19 +29,14 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 
 static inline bool arch_irqentry_exit_need_resched(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		/*
-		 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-		 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-		 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-		 * DAIF we must have handled an NMI, so skip preemption.
-		 */
-		if (read_sysreg(daif))
-			return false;
-	} else {
-		if (read_sysreg(daif) & (PSR_D_BIT | PSR_A_BIT))
-			return false;
-	}
+	/*
+	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * DAIF we must have handled an NMI, so skip preemption.
+	 */
+	if (system_uses_irq_prio_masking() && read_sysreg(daif))
+		return false;
 
 	/*
 	 * Preempting a task from an IRQ means we leave copies of PSTATE
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 16a65987a6a9b..f42ce7b5c67f3 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -54,8 +54,11 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
 static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
 					      irqentry_state_t state)
 {
+	local_irq_disable();
+	irqentry_exit_to_kernel_mode_preempt(regs, state);
+	local_daif_mask();
 	mte_check_tfsr_exit();
-	irqentry_exit_to_kernel_mode(regs, state);
+	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
 /*
@@ -301,7 +304,6 @@ static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_mem_abort(far, esr, regs);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -313,7 +315,6 @@ static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_sp_pc_abort(far, esr, regs);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -324,7 +325,6 @@ static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_undef(regs, esr);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -335,7 +335,6 @@ static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_bti(regs, esr);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -346,7 +345,6 @@ static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_gcs(regs, esr);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -357,7 +355,6 @@ static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_mops(regs, esr);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
@@ -423,7 +420,6 @@ static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_fpac(regs, esr);
-	local_daif_mask();
 	arm64_exit_to_kernel_mode(regs, state);
 }
 
-- 
2.30.2


