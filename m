Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B51C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKlZzoQb4JII1q0l+W4f/QHictW7rsVShKuMRXxMRRc=; b=oe3gGyiIDzFoH/
	Iz2d7RSihhnQqu+XqxAZoROvI+R9WFtZCizl5ntVx9ozYXii8SD1KhG+RA7H4VGqCDUi4Ys6B5fH+
	29RYrBmSQKq3b5YwcNNwVbf6Evd5NfopUtKG6/JkIP8IIvO8zk49wleLM2Ngoh9mX6htWfKL89swr
	oQJP3TauVvxFj5LbcJPCoyG5PQ62V/acfiVzkYqIId0dDahFeXMml8Kt1D4TsuMR27w3GshmmZ17s
	9anPaDh1DQiRiXeCA/t3fgu3iwj9/61hDl969taWQqzYGdTgI4P5MSq8g5gKO5w3LYwvRBrP23snD
	1/S70M/666Qq0qYLLlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOi51-000000050fr-0Otg;
	Mon, 09 Jun 2025 19:22:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgPE-00000004oyA-0jVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2A4D150C;
	Mon,  9 Jun 2025 10:35:12 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 220453F66E;
	Mon,  9 Jun 2025 10:35:30 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/13] arm64: debug: remove debug exception registration infrastructure
Date: Mon,  9 Jun 2025 18:34:13 +0100
Message-ID: <20250609173413.132168-14-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103532_295793_1607BFA8 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that debug exceptions are handled individually and without the need
for dynamic registration, remove the unused registration infrastructure.

This removes the external caller for `debug_exception_enter()` and
`debug_exception_exit()`.
Make them static again and remove them from the header.

Remove `early_brk64()` as it has been made redundant by
(arm64: debug: split brk64 exception entry) and is not used anymore.
Note : in `early_brk64()` `bug_brk_handler()` is called unconditionally
as a fall-through, but now `call_break_hook()` only calls it if the
immediate matches.
This does not change the behaviour in early boot, as if
`bug_brk_handler()` was called on a non-BUG immediate it would return
DBG_HOOK_ERROR anyway, which `call_break_hook()` will do if no immediate
matches.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/debug-monitors.h |  2 -
 arch/arm64/include/asm/exception.h      |  6 ---
 arch/arm64/include/asm/system_misc.h    |  4 --
 arch/arm64/kernel/debug-monitors.c      |  3 --
 arch/arm64/kernel/entry-common.c        |  4 +-
 arch/arm64/kernel/traps.c               | 26 +-----------
 arch/arm64/mm/fault.c                   | 53 -------------------------
 7 files changed, 3 insertions(+), 95 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 586290e95d87..4dfc37dd1d96 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -94,7 +94,5 @@ static inline bool try_step_suspended_breakpoints(struct pt_regs *regs)
 
 bool try_handle_aarch32_break(struct pt_regs *regs);
 
-void debug_traps_init(void);
-
 #endif	/* __ASSEMBLY */
 #endif	/* __ASM_DEBUG_MONITORS_H */
diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index 1c41b6e3d3be..f7f772d75860 100644
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
@@ -86,8 +84,4 @@ void do_serror(struct pt_regs *regs, unsigned long esr);
 void do_signal(struct pt_regs *regs);
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far);
-
-void debug_exception_enter(struct pt_regs *regs);
-void debug_exception_exit(struct pt_regs *regs);
-
 #endif	/* __ASM_EXCEPTION_H */
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
index 5490a4f32e85..172be6b367f8 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -333,9 +333,6 @@ bool try_handle_aarch32_break(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(try_handle_aarch32_break);
 
-void __init debug_traps_init(void)
-{}
-
 /* Re-enable single step for syscall restarting. */
 void user_rewind_single_step(struct task_struct *task)
 {
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 90ee140052c5..879beba5c78b 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -448,7 +448,7 @@ static __always_inline void fpsimd_syscall_exit(void)
  * accidentally schedule in exception context and it will force a warning
  * if we somehow manage to schedule by accident.
  */
-void debug_exception_enter(struct pt_regs *regs)
+static void debug_exception_enter(struct pt_regs *regs)
 {
 	preempt_disable();
 
@@ -457,7 +457,7 @@ void debug_exception_enter(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(debug_exception_enter);
 
-void debug_exception_exit(struct pt_regs *regs)
+static void debug_exception_exit(struct pt_regs *regs)
 {
 	preempt_enable_no_resched();
 }
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 654c8ea46ec6..d6c5268e6947 100644
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
-	if (esr_is_ubsan_brk(esr))
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
index d451d7d834f1..bc7f554dea9f 100644
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
@@ -938,53 +932,6 @@ void do_sp_pc_abort(unsigned long addr, unsigned long esr, struct pt_regs *regs)
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


