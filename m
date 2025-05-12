Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F5CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2yABfol+I85C2yUWsrB3Ka/US0nc3c6LTVzyKywLuE=; b=mQePe3virp4rfg
	yhCA/w8JDp73lurkb6f96n5OHnfZFRSqjQDOvU0RyLWPCQM7lYcSKa95ckI+zWDwax88oczvusT56
	kx8lOMJPgoqyJNbPP8Is0HMw7jbX+70YuCxdCqmlhsd0yxfdmygg044CM6UfFz2CsXm9I4rRdSoWL
	xdLyVe7xOs9raWC48mFxi/KfGLhLBfZ46X8zRmJT4+fMqBtYCUTZYHpFGUGVAhXL8L9krG/AUgJ+p
	C9yjugvQESA3rFzeKdNpG63HsujDJLD/wvHp3VBjXkGjaPkocRs7aOsUaT/W8WiNe7EmhVr2b1sFR
	iPkpiiaTa9cjK2cvpumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXZx-0000000AIDb-3RCH;
	Mon, 12 May 2025 18:08:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXCC-0000000AFDr-2FMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:44:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5AD2923;
	Mon, 12 May 2025 10:43:56 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C2ED3F673;
	Mon, 12 May 2025 10:44:05 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/11] arm64: debug: remove debug exception registration infrastructure
Date: Mon, 12 May 2025 18:43:26 +0100
Message-ID: <20250512174326.133905-12-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512174326.133905-1-ada.coupriediaz@arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_104408_658573_6D7A7BE3 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that debug exceptions are handled individually and without the need
for dynamic registration, remove the unused registration infrastructure.

Remove `early_brk64` as it has been made redundant by
(arm64: debug: split brk64 exception entry) and is not used anymore.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/debug-monitors.h |  2 -
 arch/arm64/include/asm/exception.h      |  2 -
 arch/arm64/include/asm/system_misc.h    |  4 --
 arch/arm64/kernel/debug-monitors.c      |  3 -
 arch/arm64/kernel/traps.c               | 26 +--------
 arch/arm64/mm/fault.c                   | 75 -------------------------
 6 files changed, 1 insertion(+), 111 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 9aabf65de693..fedcf78fb04d 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -94,7 +94,5 @@ static inline int reinstall_suspended_bps(struct pt_regs *regs)
 
 int aarch32_break_handler(struct pt_regs *regs);
 
-void debug_traps_init(void);
-
 #endif	/* __ASSEMBLY */
 #endif	/* __ASM_DEBUG_MONITORS_H */
diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index 4ca43d4eaf98..f7f772d75860 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -59,8 +59,6 @@ void do_el0_bti(struct pt_regs *regs);
 void do_el1_bti(struct pt_regs *regs, unsigned long esr);
 void do_el0_gcs(struct pt_regs *regs, unsigned long esr);
 void do_el1_gcs(struct pt_regs *regs, unsigned long esr);
-void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
-			struct pt_regs *regs);
 void do_breakpoint(unsigned long esr, struct pt_regs *regs);
 void do_softstep(unsigned long esr, struct pt_regs *regs);
 void do_watchpoint(unsigned long addr, unsigned long esr,
diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
index c34344256762..344b1c1a4bbb 100644
--- a/arch/arm64/include/asm/system_misc.h
+++ b/arch/arm64/include/asm/system_misc.h
@@ -25,10 +25,6 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
 		      int signo, int sicode, unsigned long far,
 		      unsigned long err);
 
-void hook_debug_fault_code(int nr, int (*fn)(unsigned long, unsigned long,
-					     struct pt_regs *),
-			   int sig, int code, const char *name);
-
 struct mm_struct;
 extern void __show_regs(struct pt_regs *);
 
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 53f0b2281f14..a5f344e556df 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -346,9 +346,6 @@ int aarch32_break_handler(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(aarch32_break_handler);
 
-void __init debug_traps_init(void)
-{}
-
 /* Re-enable single step for syscall restarting. */
 void user_rewind_single_step(struct task_struct *task)
 {
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 50d7a6a75f45..ce20f46e08cb 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1101,29 +1101,5 @@ int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr)
 }
 #endif
 
-/*
- * Initial handler for AArch64 BRK exceptions
- * This handler only used until debug_traps_init().
- */
-int __init early_brk64(unsigned long addr, unsigned long esr,
-		struct pt_regs *regs)
-{
-#ifdef CONFIG_CFI_CLANG
-	if (esr_is_cfi_brk(esr))
-		return cfi_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
-#endif
-#ifdef CONFIG_KASAN_SW_TAGS
-	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
-		return kasan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
-#endif
-#ifdef CONFIG_UBSAN_TRAP
-	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
-		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
-#endif
-	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
-}
-
 void __init trap_init(void)
-{
-	debug_traps_init();
-}
+{}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..bc7f554dea9f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -53,18 +53,12 @@ struct fault_info {
 };
 
 static const struct fault_info fault_info[];
-static struct fault_info debug_fault_info[];
 
 static inline const struct fault_info *esr_to_fault_info(unsigned long esr)
 {
 	return fault_info + (esr & ESR_ELx_FSC);
 }
 
-static inline const struct fault_info *esr_to_debug_fault_info(unsigned long esr)
-{
-	return debug_fault_info + DBG_ESR_EVT(esr);
-}
-
 static void data_abort_decode(unsigned long esr)
 {
 	unsigned long iss2 = ESR_ELx_ISS2(esr);
@@ -938,75 +932,6 @@ void do_sp_pc_abort(unsigned long addr, unsigned long esr, struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(do_sp_pc_abort);
 
-/*
- * __refdata because early_brk64 is __init, but the reference to it is
- * clobbered at arch_initcall time.
- * See traps.c and debug-monitors.c:debug_traps_init().
- */
-static struct fault_info __refdata debug_fault_info[] = {
-	{ do_bad,	SIGTRAP,	TRAP_HWBKPT,	"hardware breakpoint"	},
-	{ do_bad,	SIGTRAP,	TRAP_HWBKPT,	"hardware single-step"	},
-	{ do_bad,	SIGTRAP,	TRAP_HWBKPT,	"hardware watchpoint"	},
-	{ do_bad,	SIGKILL,	SI_KERNEL,	"unknown 3"		},
-	{ do_bad,	SIGTRAP,	TRAP_BRKPT,	"aarch32 BKPT"		},
-	{ do_bad,	SIGKILL,	SI_KERNEL,	"aarch32 vector catch"	},
-	{ early_brk64,	SIGTRAP,	TRAP_BRKPT,	"aarch64 BRK"		},
-	{ do_bad,	SIGKILL,	SI_KERNEL,	"unknown 7"		},
-};
-
-void __init hook_debug_fault_code(int nr,
-				  int (*fn)(unsigned long, unsigned long, struct pt_regs *),
-				  int sig, int code, const char *name)
-{
-	BUG_ON(nr < 0 || nr >= ARRAY_SIZE(debug_fault_info));
-
-	debug_fault_info[nr].fn		= fn;
-	debug_fault_info[nr].sig	= sig;
-	debug_fault_info[nr].code	= code;
-	debug_fault_info[nr].name	= name;
-}
-
-/*
- * In debug exception context, we explicitly disable preemption despite
- * having interrupts disabled.
- * This serves two purposes: it makes it much less likely that we would
- * accidentally schedule in exception context and it will force a warning
- * if we somehow manage to schedule by accident.
- */
-static void debug_exception_enter(struct pt_regs *regs)
-{
-	preempt_disable();
-
-	/* This code is a bit fragile.  Test it. */
-	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
-}
-NOKPROBE_SYMBOL(debug_exception_enter);
-
-static void debug_exception_exit(struct pt_regs *regs)
-{
-	preempt_enable_no_resched();
-}
-NOKPROBE_SYMBOL(debug_exception_exit);
-
-void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
-			struct pt_regs *regs)
-{
-	const struct fault_info *inf = esr_to_debug_fault_info(esr);
-	unsigned long pc = instruction_pointer(regs);
-
-	debug_exception_enter(regs);
-
-	if (user_mode(regs) && !is_ttbr0_addr(pc))
-		arm64_apply_bp_hardening();
-
-	if (inf->fn(addr_if_watchpoint, esr, regs)) {
-		arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
-	}
-
-	debug_exception_exit(regs);
-}
-NOKPROBE_SYMBOL(do_debug_exception);
-
 /*
  * Used during anonymous page fault handling.
  */
-- 
2.43.0


