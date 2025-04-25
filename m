Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048ADC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr9T0zrn7ryi/EQcCSSWyb7RjvnZzVoAyw/wyUzQt/A=; b=z+zJw3W9VdZ22C
	4vdSp0COMjha+G4YcWkJZdMHsgPh1/7rFvUhAnei1GnFw/JgBtUWA98jA0cmP9GfjVm18gzCToyrm
	QaXj7wI3pUeoGvluyN/dGfGumCCot0f8vVmvtZ1gRqEr1HGPXn9dhaXC7PRCjco8MJdJf6JmsXGye
	wB+Hefm/E6xrJqstjnWfg3Eg9J3XgjIGsq8ZwbhEtdpobGwEALJGsCzcfzjfDxgD1eiJ4rN2Ccz8A
	szyIIhsOyDkMZeiepggkYpwryJguHDeSymr6b+CZZOpprwoKDmve5qhCmbsW9pY0KhBmVHhlMipiB
	DqBy0RYlJdrKXHO8eTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MJJ-00000000Iqi-1ge6;
	Fri, 25 Apr 2025 16:53:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L71-000000004P2-3S1e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:37:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9398C1A2D;
	Fri, 25 Apr 2025 08:37:05 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.45.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD5463F59E;
	Fri, 25 Apr 2025 08:37:09 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] arm64: debug: split single stepping exception entry
Date: Fri, 25 Apr 2025 16:36:43 +0100
Message-ID: <20250425153647.438508-8-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425153647.438508-1-ada.coupriediaz@arm.com>
References: <20250425153647.438508-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083711_958938_E5CEA4C8 
X-CRM114-Status: GOOD (  15.93  )
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

The single stepping exception has the most constraints : it can be
exploited to train branch predictors and it needs special handling at EL1
for the Cortex-A76 erratum #1463225. We need to conserve all those
mitigations.
However, it does not write an address at FAR_EL1, as only hardware
watchpoints do so.

Split the single stepping exception entry, adjust the function signature
but keep the security mitigation and erratum handling.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/exception.h |  1 +
 arch/arm64/kernel/debug-monitors.c | 20 ++++++++++++++++----
 arch/arm64/kernel/entry-common.c   | 27 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index c593fe639697..cbcd832bf58e 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -62,6 +62,7 @@ void do_el1_gcs(struct pt_regs *regs, unsigned long esr);
 void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 			struct pt_regs *regs);
 void do_breakpoint(unsigned long esr, struct pt_regs *regs);
+void do_softstep(unsigned long esr, struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 55bca019ef5c..e02724947b68 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -21,6 +21,7 @@
 #include <asm/cputype.h>
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
+#include <asm/exception.h>
 #include <asm/kgdb.h>
 #include <asm/kprobes.h>
 #include <asm/system_misc.h>
@@ -197,8 +198,7 @@ static void send_user_sigtrap(int si_code)
 			      "User debug trap");
 }
 
-static int single_step_handler(unsigned long unused, unsigned long esr,
-			       struct pt_regs *regs)
+static int single_step_handler(unsigned long esr, struct pt_regs *regs)
 {
 	/*
 	 * If we are stepping a pending breakpoint, call the hw_breakpoint
@@ -233,6 +233,20 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
 }
 NOKPROBE_SYMBOL(single_step_handler);
 
+void do_softstep(unsigned long esr, struct pt_regs *regs)
+{
+	unsigned long pc = instruction_pointer(regs);
+
+	if (user_mode(regs) && !is_ttbr0_addr(pc))
+		arm64_apply_bp_hardening();
+
+	if (single_step_handler(esr, regs)) {
+		arm64_notify_die("single-step handler", regs, SIGTRAP, TRAP_TRACE, pc,
+					esr);
+	}
+}
+NOKPROBE_SYMBOL(do_softstep);
+
 static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 {
 	if (user_mode(regs)) {
@@ -341,8 +355,6 @@ NOKPROBE_SYMBOL(aarch32_break_handler);
 
 void __init debug_traps_init(void)
 {
-	hook_debug_fault_code(DBG_ESR_EVT_HWSS, single_step_handler, SIGTRAP,
-			      TRAP_TRACE, "single-step handler");
 	hook_debug_fault_code(DBG_ESR_EVT_BRK, brk_handler, SIGTRAP,
 			      TRAP_BRKPT, "BRK handler");
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index c8139c87caa6..b0da8637fc64 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -512,6 +512,17 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
+static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
+{
+	arm64_enter_el1_dbg(regs);
+	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
+		debug_exception_enter(regs);
+		do_softstep(esr, regs);
+		debug_exception_exit(regs);
+	}
+	arm64_exit_el1_dbg(regs);
+}
+
 static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
@@ -564,6 +575,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_CUR:
+		el1_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_CUR:
 	case ESR_ELx_EC_BRK64:
 		el1_dbg(regs, esr);
@@ -767,6 +780,16 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
+{
+	enter_from_user_mode(regs);
+	debug_exception_enter(regs);
+	do_softstep(esr, regs);
+	debug_exception_exit(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	exit_to_user_mode(regs);
+}
+
 static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
@@ -848,6 +871,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_LOW:
+		el0_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
 	case ESR_ELx_EC_BRK64:
 		el0_dbg(regs, esr);
@@ -970,6 +995,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 		el0_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_LOW:
+		el0_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
 	case ESR_ELx_EC_BKPT32:
 		el0_dbg(regs, esr);
-- 
2.43.0


