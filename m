Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033B1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bLsme7OM6rpWLWd7leWw9Vc5lyXOMiSWvBkTBVUIUc=; b=3bbmeJgG22OEsm
	xE+lNDXnkpeSvZdbcQvOFaXa9Vplh+hT0Z/DOMuFrzMtbriYvDPFUvPZ9aWVIWVsnpf3z/e9Nn26D
	8RXr8LcCRlUzzZpF9rH4/pN3zl52e+jhPDAWGezFSCHfh6oxx7v0esE8aRy1o8BacWBEn/nTVtQS+
	KJmMLhMyy7E49tmCd+Q8zhCXQy2uvteCCBtH8sQxCPLdLoit2nWT/Yid3xdFN6t1UvR3mbvvHcso1
	gCH1BryPFsHYTXIA4qsCJ4kCQ4O5YC17cSH+iaIETAyhcxxktAWJ5wEPS1nn7q3zls5cjWOmcJkMZ
	npNvHUmQEMdRkE2/rOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf7-00000002MfD-1o0n;
	Thu, 09 Jul 2026 12:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneO-00000002LLP-41pl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 12:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2bLsme7OM6rpWLWd7leWw9Vc5lyXOMiSWvBkTBVUIUc=; b=jewqM5KG+9+BcJLUd6W8ekUp1S
	MaAWehLC6Po+jprIJvUPLk7NLyt2Xkm0OsES/vM9fF3ewSfjr7IAg/m8fP3EMZBRGub92vghGuSZH
	q79HIVnvEZlv0tgh4zY3zLHomp99sX0p9+FS8JVyJg8KTollzN4yE6RFhGgOb7hoeWmyKYrYocWlZ
	k66FE2EYlDY6P2AltFgPxLSLqsZidYiABgOEVXvCzDilL9DSzbNU/4IPj7mJ6x84Ls7pWpqKb0WDP
	nGkEhiiQehtfmlRZQOh+22DPcFTB7MDK3GPual7iulK34VCLu4gooeqe9VnHoyxA4PRqxX8le5l9s
	0phGUkuQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whneK-00000009Bnp-3Job
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E72D3569;
	Thu,  9 Jul 2026 05:14:35 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B5313F66F;
	Thu,  9 Jul 2026 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599279; bh=mVJYjbKCqn9UMxfR8P1gTVJYeZVCo8cpl+HEwiM0zB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=THLDf/yYUdikcRyAcMGbwQCUKQTCCvlQmnhO9N8dn7MTTU0E/HiOdcEMLpDS6pHS9
	 JbQofEHCCMBbnNfrrzDe9vNopTRgbe/j24IRuT4UYIZ14Qm8MB2Z3oX4DQCsYy2FlK
	 pnBvVxf/MFbNEceD1AwmawaVwK5ASuq4DGUseQRo=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority interrupts as NMIs
Date: Thu,  9 Jul 2026 13:13:28 +0100
Message-Id: <20260709121333.23507-32-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131441_306646_4FFEDCB8 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mark Brown <broonie@kernel.org>

Our goal with superpriority interrupts is to use them as NMIs, taking
advantage of the much smaller regions where they are masked to allow
prompt handling of the most time-critical interrupts.

When an interrupt is configured with superpriority, we enter EL1 as we
do for any other interrupt. The presence of a superpriority interrupt
is indicated by a status bit in ISR_EL1. We check this bit before
unmasking interrupts in elX_interrupt(), and if a superpriority
interrupt is pending, we handle it as an NMI. Otherwise, normal
interrupts are handled as usual.

Since superpriority interrupts are always handled as NMIs, the
interrupt controller can rely on in_nmi() to distinguish them from
ordinary interrupts.

Enable IPIs to use superpriority interrupts as NMIs, matching the
existing pseudo-NMI behaviour.
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/entry-common.h |  7 ++++
 arch/arm64/kernel/entry-common.c      | 59 ++++++++++++++++++---------
 arch/arm64/kernel/smp.c               |  2 +-
 3 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 73d82a8d8e95..0681ba91ac3b 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -37,6 +37,13 @@ static inline bool arch_irqentry_exit_need_resched(void)
 	if (system_uses_irq_prio_masking() && read_sysreg(daif))
 		return false;
 
+	/*
+	 * If AllInt is set then we must have handled an NMI, so skip
+	 * preemption
+	 */
+	if (system_uses_nmi() && read_sysreg_s(SYS_ALLINT))
+		return false;
+
 	/*
 	 * Preempting a task from an IRQ means we leave copies of PSTATE
 	 * on the stack. cpufeature's enable calls may modify PSTATE, but
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index a13653b228b7..de71d5a3a6a1 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -525,8 +525,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
-static __always_inline void __el1_pnmi(struct pt_regs *regs,
-				       void (*handler)(struct pt_regs *))
+static __always_inline void __el1_nmi(struct pt_regs *regs,
+				      void (*handler)(struct pt_regs *))
 {
 	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
@@ -545,7 +545,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 
 	state = arm64_enter_from_kernel_mode(regs);
 
-	arm64_unmask_exc_context(NONMI_CONTEXT);
+	if (system_uses_nmi())
+		arm64_unmask_exc_context(NOIRQ_CONTEXT);
+	else
+		arm64_unmask_exc_context(NONMI_CONTEXT);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
@@ -565,8 +568,11 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
-		__el1_pnmi(regs, handler);
+	/* Is there a NMI to handle? */
+	if (regs_irqs_disabled(regs))
+		__el1_nmi(regs, handler);
+	else if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS)))
+		__el1_nmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
 
@@ -906,24 +912,39 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
-
-	arm64_unmask_exc_context(NONMI_CONTEXT);
-
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
-	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	/* Is there a NMI to handle? */
+	if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS))) {
+		irqentry_state_t state;
+		arm64_exc_hwstate_t hwstate;
+
+		state = irqentry_nmi_enter(regs);
+		hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
+		do_interrupt_handler(regs, handler);
+		arm64_mask_exc_context(hwstate);
+		irqentry_nmi_exit(regs, state);
+	} else {
+		arm64_enter_from_user_mode(regs);
+
+		if (system_uses_nmi())
+			arm64_unmask_exc_context(NOIRQ_CONTEXT);
+		else
+			arm64_unmask_exc_context(NONMI_CONTEXT);
+
+		irq_enter_rcu();
+		do_interrupt_handler(regs, handler);
+		irq_exit_rcu();
+		/*
+		 * For the same reason as in el1_irq() we effectivly
+		 * have NOIRQ_CONTEXT on return from handler - keep
+		 * track of it
+		 */
+		arm64_debug_exc_context(NOIRQ_CONTEXT);
+		arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
+	}
 
-	/*
-	 * For the same reason as in el1_irq() we effectivly
-	 * have NOIRQ_CONTEXT on return from handler - keep
-	 * track of it
-	 */
-	arm64_debug_exc_context(NOIRQ_CONTEXT);
-	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
 	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 257d50529d14..80e35a8e5c8f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1035,7 +1035,7 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 
 static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 {
-	if (!system_uses_irq_prio_masking())
+	if (!system_uses_nmi() && !system_uses_irq_prio_masking())
 		return false;
 
 	switch (ipi) {
-- 
2.34.1


