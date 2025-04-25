Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAFCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2FTsacs3FieckVUTwRR97mLT4DG6WU4JzaDzeZ9WyI=; b=DwAkttybKO4GmP
	C6ZCTxVIf4Rwcy4bShL2jjDecjyOExKsNzq2AIR9FMQddKvirjC/X5VWB/bJp0mtt8WKBicu74QkS
	RKr+oLGpT/PLqsoTdBYdOwHZ/H+g0M5bRbKHNV9E9O+del0dFwmrnnt9QD+qYZ9OVrKowo38VbLpm
	bY5W+8H54tHkqv2lWXp9oEZABq3eTsC33rJK5lwwRhQ7fL2jruwNoEB0CbyGxJK5/IB9D2i2k42Y5
	r6Vi0mnDqWl1s1Q/DWUdP5fClYPV34PxAWASoqLVF3QeLfE13VnGJG1LgXvtVznCWcI2ewQ4KKYdY
	khWKl6erXFz8LPOEZmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MMz-00000000JZa-3Ml0;
	Fri, 25 Apr 2025 16:57:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L76-000000004Pt-184p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:37:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CD00106F;
	Fri, 25 Apr 2025 08:37:10 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.45.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CABFD3F59E;
	Fri, 25 Apr 2025 08:37:14 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/11] arm64: debug: split bkpt32 exception entry
Date: Fri, 25 Apr 2025 16:36:46 +0100
Message-ID: <20250425153647.438508-11-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425153647.438508-1-ada.coupriediaz@arm.com>
References: <20250425153647.438508-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083716_434241_344EA8CD 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently all debug exceptions share common entry code and are routed
to `do_debug_exception()`, which calls dynamically-registered
handlers for each specific debug exception. This is unfortunate as
different debug exceptions have different entry handling requirements,
and it would be better to handle these distinct requirements earlier.

The BKPT32 exception can only be triggered by a BKPT instruction. Thus,
we know that the PC is a legitimate address and isn't being used to train
a branch predictor with a bogus address : we don't need to call
`arm64_apply_bp_hardening()`.

The handler for this exception only pends a signal and doesn't depend
on any per-CPU state : we don't need to inhibit preemption, nor do we
need to keep the DAIF exceptions masked, so we can unmask them earlier.

Split the BKPT32 exception entry and adjust function signatures and its
behaviour to match its relaxed constraints compared to other
debug exceptions.

This replaces the last usage of `el0_dbg()`, so remove it.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/exception.h |  1 +
 arch/arm64/kernel/debug-monitors.c |  9 +++++++++
 arch/arm64/kernel/entry-common.c   | 21 +++++++++------------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index af9b521e35f9..4ca43d4eaf98 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -66,6 +66,7 @@ void do_softstep(unsigned long esr, struct pt_regs *regs);
 void do_watchpoint(unsigned long addr, unsigned long esr,
 			struct pt_regs *regs);
 void do_brk64(unsigned long esr, struct pt_regs *regs);
+void do_bkpt32(unsigned long esr, struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 2209aff73d51..7e4e85a212f4 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -321,6 +321,15 @@ void do_brk64(unsigned long esr, struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(do_brk64);
 
+#ifdef CONFIG_COMPAT
+/* BRKPT exception always traps to be handled. */
+void do_bkpt32(unsigned long esr, struct pt_regs *regs)
+{
+	arm64_notify_die("aarch32 BKPT", regs, SIGTRAP, TRAP_BRKPT, regs->pc, esr);
+}
+NOKPROBE_SYMBOL(do_bkpt32);
+#endif /* CONFIG_COMPAT */
+
 int aarch32_break_handler(struct pt_regs *regs)
 {
 	u32 arm_instr;
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 8f257cd28d53..20aeb2eb9239 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -826,17 +826,6 @@ static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
-static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
-{
-	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
-	unsigned long far = read_sysreg(far_el1);
-
-	enter_from_user_mode(regs);
-	do_debug_exception(far, esr, regs);
-	local_daif_restore(DAIF_PROCCTX);
-	exit_to_user_mode(regs);
-}
-
 static void noinstr el0_svc(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
@@ -996,6 +985,14 @@ static void noinstr el0_svc_compat(struct pt_regs *regs)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
+{
+	enter_from_user_mode(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	do_bkpt32(esr, regs);
+	exit_to_user_mode(regs);
+}
+
 asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
@@ -1039,7 +1036,7 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 		el0_watchpt(regs, esr);
 		break;
 	case ESR_ELx_EC_BKPT32:
-		el0_dbg(regs, esr);
+		el0_bkpt32(regs, esr);
 		break;
 	default:
 		el0_inv(regs, esr);
-- 
2.43.0


