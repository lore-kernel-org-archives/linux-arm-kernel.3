Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B609108B8EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRU/if3Sf/LCGwMjmP75NrzB0iAC8AggPlE3bv2cVc4=; b=YoDD5rvUBhh1a4sGwTdM95LqgS
	1ZIRnaVHI7DmIEBnM4hKIZqEQPgVKYysaq55jiMDUjVvZzGuo2iM4M/1ks7z+zpvHEAzDMGrYQCIL
	x961gTukiaXQS/RzsE9h6FpvoFRod5khKwBRlcK3UP9VPmZbj1V2mTUAIadjKDIzsviG5bRLt5bO0
	33YezN7lYx6VacVutDiEYAyW1ItvBTuIlBuUl/fGnLOxYNn1c6lco9waPexbXMH3nuE5bsmg2482E
	8bsUmLam0o2yRYzzotBTouXLjGxvG261eMxUVmA0zKSEeZgM+eL8muj2g4z9kZ9YcURGJN/6qEacH
	doTzTF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3W-0000000CajO-3tm6;
	Fri, 20 Mar 2026 10:26:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3D-0000000CaQe-3rKa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=RRU/if3Sf/LCGwMjmP75NrzB0iAC8AggPlE3bv2cVc4=; b=KAuRW+VdzsWeG7CVTsb5ylnIq9
	saJjtg0ae1dEntmaks5HEgja/2CpP6npgZlTYWjvwNj6PnSI28Y42ElTPflLYfYl88QhptKRmOd+1
	79rdpukTFwKtg+Tf8dneJwXDmS3DtV54+tHSm4dbgXc1B3Gvxu1IfYP+mq8Ah3bUxxEYcU+LFV3je
	M9pDkZpda31T4n+sQRBqk0TuVQuDzzbLRp+R+hBlJUyLR393NY5BU3GigpwIIurAkNM/JKXs0t/wk
	UwQ9JjZdNFtekle/nUMuITojv0Fi1sJCo5SpBdhzBSa+eV3PSQOc9PhndQ8BXkyZJ5P/ZQwzBNIj+
	Wqak4R8Q==;
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3A-00000007cFo-13pY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RRU/if3Sf/LCGwMjmP75NrzB0iAC8AggPlE3bv2cVc4=;
	b=c2px53S7J2k4CR3vcyiJ8QVUelkT9exBMc0MohofONLwpyOscgEEFgM5UtlFqedU4qrDtT64P
	rZw0EwlT9L1Qc91Mf/DhPgPLkMQo0uspg265LZ+3J2neaOZ0aMxARo41AwjRcKKrgjwsXZm5BL3
	LjDU4qytjASzZjbgwCe0DXE=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fcdq53nhsznTWn;
	Fri, 20 Mar 2026 18:20:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 112A940363;
	Fri, 20 Mar 2026 18:25:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<ldv@strace.io>, <song@kernel.org>, <thuth@redhat.com>,
	<ryan.roberts@arm.com>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <mathieu.desnoyers@efficios.com>, <mingo@kernel.org>,
	<edumazet@google.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 09/10] arm64: entry: Convert to generic entry
Date: Fri, 20 Mar 2026 18:26:19 +0800
Message-ID: <20260320102620.1336796-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102552_963030_F8666AF1 
X-CRM114-Status: GOOD (  23.53  )
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

Implement the generic entry framework for arm64 to handle system call
entry and exit. This follows the migration of x86, RISC-V, and LoongArch,
consolidating architecture-specific syscall tracing and auditing into
the common kernel entry infrastructure.

[Background]
Arm64 has already adopted generic IRQ entry. Completing the conversion
to the generic syscall entry framework reduces architectural divergence,
simplifies maintenance, and allows arm64 to automatically benefit from
improvements in the common entry code.

[Changes]

1. Kconfig and Infrastructure:
- Select GENERIC_ENTRY and remove GENERIC_IRQ_ENTRY (now implied).

- Migrate struct thread_info to use the syscall_work field instead
  of TIF flags for syscall-related tasks.

2. Thread Info and Flags:
- Remove definitions for TIF_SYSCALL_TRACE, TIF_SYSCALL_AUDIT,
  TIF_SYSCALL_TRACEPOINT, TIF_SECCOMP, and TIF_SYSCALL_EMU.

- Replace _TIF_SYSCALL_WORK and _TIF_SYSCALL_EXIT_WORK with the
  generic SYSCALL_WORK bitmask.

- Map single-step state to SYSCALL_EXIT_TRAP in debug-monitors.c.

3. Architecture-Specific Hooks (asm/entry-common.h):
- Implement arch_ptrace_report_syscall_entry() and _exit() by
  porting the existing arm64 logic to the generic interface.

- Add arch_syscall_is_vdso_sigreturn() to asm/syscall.h to
  support Syscall User Dispatch (SUD).

4. Differentiate between syscall and interrupt entry/exit paths to handle
   RSEQ slice extensions correctly.
- For irq/exception entry/exit: use irqentry_enter_from_user_mode() and
  irqentry_exit_to_user_mode_prepare().
- For syscall entry/exit: use enter_from_user_mode() and
  syscall_exit_to_user_mode_prepare().
- Remove exit_to_user_mode_prepare_legacy() which is no longer necessary.

5. Cleanup and Refactoring:
- Remove redundant arm64-specific syscall tracing functions from
  ptrace.c, including syscall_trace_enter(), syscall_exit_work(),
  and related audit/step helpers.

- Update el0_svc_common() in syscall.c to use the generic
  syscall_work checks and entry/exit call sites.

[Why this matters]
- Unified Interface: Aligns arm64 with the modern kernel entry standard.

- Improved Maintainability: Bug fixes in kernel/entry/common.c now
  apply to arm64 automatically.

- Feature Readiness: Simplifies the implementation of future
  cross-architecture syscall features.

[Compatibility]
This conversion maintains full ABI compatibility with existing
userspace. The ptrace register-saving behavior, seccomp filtering, and
syscall tracing semantics remain identical to the previous implementation.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig                    |   2 +-
 arch/arm64/include/asm/entry-common.h |  76 +++++++++++++
 arch/arm64/include/asm/syscall.h      |  19 +++-
 arch/arm64/include/asm/thread_info.h  |  19 +---
 arch/arm64/kernel/debug-monitors.c    |   7 ++
 arch/arm64/kernel/entry-common.c      |  25 ++++-
 arch/arm64/kernel/ptrace.c            | 154 --------------------------
 arch/arm64/kernel/signal.c            |   2 +-
 arch/arm64/kernel/syscall.c           |   6 +-
 include/linux/irq-entry-common.h      |   8 --
 include/linux/rseq_entry.h            |  18 ---
 11 files changed, 127 insertions(+), 209 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..96fef01598be 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -154,9 +154,9 @@ config ARM64
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
-	select GENERIC_IRQ_ENTRY
 	select GENERIC_IRQ_IPI
 	select GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index cab8cd78f693..d8bf4bf342e8 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -3,14 +3,21 @@
 #ifndef _ASM_ARM64_ENTRY_COMMON_H
 #define _ASM_ARM64_ENTRY_COMMON_H
 
+#include <linux/ptrace.h>
 #include <linux/thread_info.h>
 
+#include <asm/compat.h>
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
 #include <asm/fpsimd.h>
 #include <asm/mte.h>
 #include <asm/stacktrace.h>
 
+enum ptrace_syscall_dir {
+	PTRACE_SYSCALL_ENTER = 0,
+	PTRACE_SYSCALL_EXIT,
+};
+
 #define ARCH_EXIT_TO_USER_MODE_WORK (_TIF_MTE_ASYNC_FAULT | _TIF_FOREIGN_FPSTATE)
 
 static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
@@ -54,4 +61,73 @@ static inline bool arch_irqentry_exit_need_resched(void)
 
 #define arch_irqentry_exit_need_resched arch_irqentry_exit_need_resched
 
+static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
+						     enum ptrace_syscall_dir dir,
+						     int *regno)
+{
+	unsigned long saved_reg;
+
+	/*
+	 * We have some ABI weirdness here in the way that we handle syscall
+	 * exit stops because we indicate whether or not the stop has been
+	 * signalled from syscall entry or syscall exit by clobbering a general
+	 * purpose register (ip/r12 for AArch32, x7 for AArch64) in the tracee
+	 * and restoring its old value after the stop. This means that:
+	 *
+	 * - Any writes by the tracer to this register during the stop are
+	 *   ignored/discarded.
+	 *
+	 * - The actual value of the register is not available during the stop,
+	 *   so the tracer cannot save it and restore it later.
+	 *
+	 * - Syscall stops behave differently to seccomp and pseudo-step traps
+	 *   (the latter do not nobble any registers).
+	 */
+	*regno = (is_compat_task() ? 12 : 7);
+	saved_reg = regs->regs[*regno];
+	regs->regs[*regno] = dir;
+
+	return saved_reg;
+}
+
+static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
+{
+	unsigned long saved_reg;
+	int regno, ret;
+
+	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
+	ret = ptrace_report_syscall_entry(regs);
+	if (ret)
+		forget_syscall(regs);
+	regs->regs[regno] = saved_reg;
+
+	return ret;
+}
+
+#define arch_ptrace_report_syscall_entry arch_ptrace_report_syscall_entry
+
+static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
+							    int step)
+{
+	unsigned long saved_reg;
+	int regno;
+
+	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_EXIT, &regno);
+	if (!step) {
+		ptrace_report_syscall_exit(regs, 0);
+		regs->regs[regno] = saved_reg;
+	} else {
+		regs->regs[regno] = saved_reg;
+
+		/*
+		 * Signal a pseudo-step exception since we are stepping but
+		 * tracer modifications to the registers may have rewound the
+		 * state machine.
+		 */
+		ptrace_report_syscall_exit(regs, 1);
+	}
+}
+
+#define arch_ptrace_report_syscall_exit arch_ptrace_report_syscall_exit
+
 #endif /* _ASM_ARM64_ENTRY_COMMON_H */
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index dea392c081ca..240d45735cc5 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -9,6 +9,9 @@
 #include <linux/compat.h>
 #include <linux/err.h>
 
+#include <asm/compat.h>
+#include <asm/vdso.h>
+
 typedef long (*syscall_fn_t)(const struct pt_regs *regs);
 
 extern const syscall_fn_t sys_call_table[];
@@ -120,7 +123,19 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_exit_to_user_mode_work(struct pt_regs *regs);
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	unsigned long sigtramp;
+
+#ifdef CONFIG_COMPAT
+	if (is_compat_task()) {
+		unsigned long sigpage = (unsigned long)current->mm->context.sigpage;
+
+		return regs->pc >= sigpage && regs->pc < (sigpage + PAGE_SIZE);
+	}
+#endif
+	sigtramp = (unsigned long)VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
+	return regs->pc == (sigtramp + 8);
+}
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 4ae83cb620bb..f89a15dc6ad5 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -43,6 +43,7 @@ struct thread_info {
 	void			*scs_sp;
 #endif
 	u32			cpu;
+	unsigned long		syscall_work;   /* SYSCALL_WORK_ flags */
 };
 
 #define thread_saved_pc(tsk)	\
@@ -65,11 +66,6 @@ void arch_setup_new_exec(void);
 #define TIF_UPROBE		5	/* uprobe breakpoint or singlestep */
 #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
 #define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
-#define TIF_SYSCALL_TRACE	8	/* syscall trace active */
-#define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
-#define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
-#define TIF_SECCOMP		11	/* syscall secure computing */
-#define TIF_SYSCALL_EMU		12	/* syscall emulation active */
 #define TIF_PATCH_PENDING	13	/* pending live patching update */
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_FREEZE		19
@@ -91,27 +87,14 @@ void arch_setup_new_exec(void);
 #define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_FOREIGN_FPSTATE	(1 << TIF_FOREIGN_FPSTATE)
-#define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
-#define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
-#define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
-#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
-#define _TIF_SYSCALL_EMU	(1 << TIF_SYSCALL_EMU)
 #define _TIF_PATCH_PENDING	(1 << TIF_PATCH_PENDING)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
-#define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_32BIT		(1 << TIF_32BIT)
 #define _TIF_SVE		(1 << TIF_SVE)
 #define _TIF_MTE_ASYNC_FAULT	(1 << TIF_MTE_ASYNC_FAULT)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
 
-#define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
-				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
-				 _TIF_SYSCALL_EMU)
-
-#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
-				 _TIF_SYSCALL_TRACEPOINT)
-
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 29307642f4c9..e67643a70405 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -385,11 +385,18 @@ void user_enable_single_step(struct task_struct *task)
 
 	if (!test_and_set_ti_thread_flag(ti, TIF_SINGLESTEP))
 		set_regs_spsr_ss(task_pt_regs(task));
+
+	/*
+	 * Ensure that a trap is triggered once stepping out of a system
+	 * call prior to executing any user instruction.
+	 */
+	set_task_syscall_work(task, SYSCALL_EXIT_TRAP);
 }
 NOKPROBE_SYMBOL(user_enable_single_step);
 
 void user_disable_single_step(struct task_struct *task)
 {
 	clear_ti_thread_flag(task_thread_info(task), TIF_SINGLESTEP);
+	clear_task_syscall_work(task, SYSCALL_EXIT_TRAP);
 }
 NOKPROBE_SYMBOL(user_disable_single_step);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8..b7ac88bb946c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -64,6 +64,12 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
  * instrumentable code, or any code which may trigger an exception.
  */
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
+{
+	irqentry_enter_from_user_mode(regs);
+	mte_disable_tco_entry(current);
+}
+
+static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
@@ -78,7 +84,16 @@ static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 {
 	local_irq_disable();
-	exit_to_user_mode_prepare_legacy(regs);
+	irqentry_exit_to_user_mode_prepare(regs);
+	local_daif_mask();
+	mte_check_tfsr_exit();
+	exit_to_user_mode();
+}
+
+static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	local_irq_disable();
+	syscall_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
@@ -717,12 +732,12 @@ static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc(regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs);
 	fpsimd_syscall_exit();
 }
 
@@ -869,11 +884,11 @@ static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc_compat(regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e3b74add88e7..9acc314bc376 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2012 ARM Ltd.
  */
 
-#include <linux/audit.h>
 #include <linux/compat.h>
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
@@ -18,7 +17,6 @@
 #include <linux/smp.h>
 #include <linux/ptrace.h>
 #include <linux/user.h>
-#include <linux/seccomp.h>
 #include <linux/security.h>
 #include <linux/init.h>
 #include <linux/signal.h>
@@ -28,7 +26,6 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/regset.h>
 #include <linux/elf.h>
-#include <linux/rseq.h>
 
 #include <asm/compat.h>
 #include <asm/cpufeature.h>
@@ -38,13 +35,9 @@
 #include <asm/mte.h>
 #include <asm/pointer_auth.h>
 #include <asm/stacktrace.h>
-#include <asm/syscall.h>
 #include <asm/traps.h>
 #include <asm/system_misc.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/syscalls.h>
-
 struct pt_regs_offset {
 	const char *name;
 	int offset;
@@ -2339,153 +2332,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ptrace_request(child, request, addr, data);
 }
 
-enum ptrace_syscall_dir {
-	PTRACE_SYSCALL_ENTER = 0,
-	PTRACE_SYSCALL_EXIT,
-};
-
-static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
-						     enum ptrace_syscall_dir dir,
-						     int *regno)
-{
-	unsigned long saved_reg;
-
-	/*
-	 * We have some ABI weirdness here in the way that we handle syscall
-	 * exit stops because we indicate whether or not the stop has been
-	 * signalled from syscall entry or syscall exit by clobbering a general
-	 * purpose register (ip/r12 for AArch32, x7 for AArch64) in the tracee
-	 * and restoring its old value after the stop. This means that:
-	 *
-	 * - Any writes by the tracer to this register during the stop are
-	 *   ignored/discarded.
-	 *
-	 * - The actual value of the register is not available during the stop,
-	 *   so the tracer cannot save it and restore it later.
-	 *
-	 * - Syscall stops behave differently to seccomp and pseudo-step traps
-	 *   (the latter do not nobble any registers).
-	 */
-	*regno = (is_compat_task() ? 12 : 7);
-	saved_reg = regs->regs[*regno];
-	regs->regs[*regno] = dir;
-
-	return saved_reg;
-}
-
-static int report_syscall_entry(struct pt_regs *regs)
-{
-	unsigned long saved_reg;
-	int regno, ret;
-
-	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
-	ret = ptrace_report_syscall_entry(regs);
-	if (ret)
-		forget_syscall(regs);
-	regs->regs[regno] = saved_reg;
-
-	return ret;
-}
-
-static void report_syscall_exit(struct pt_regs *regs)
-{
-	unsigned long saved_reg;
-	int regno;
-
-	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_EXIT, &regno);
-	if (!test_thread_flag(TIF_SINGLESTEP)) {
-		ptrace_report_syscall_exit(regs, 0);
-		regs->regs[regno] = saved_reg;
-	} else {
-		regs->regs[regno] = saved_reg;
-
-		/*
-		 * Signal a pseudo-step exception since we are stepping but
-		 * tracer modifications to the registers may have rewound the
-		 * state machine.
-		 */
-		ptrace_report_syscall_exit(regs, 1);
-	}
-}
-
-static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
-{
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
-
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
-}
-
-int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
-{
-	long syscall;
-	int ret = 0;
-
-	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		ret = report_syscall_entry(regs);
-		if (ret || (flags & _TIF_SYSCALL_EMU))
-			return NO_SYSCALL;
-	}
-
-	/* Do the secure computing after ptrace; failures should be fast. */
-	if (flags & _TIF_SECCOMP) {
-		ret = __secure_computing();
-		if (ret == -1)
-			return NO_SYSCALL;
-	}
-
-	/* Either of the above might have changed the syscall number */
-	syscall = syscall_get_nr(current, regs);
-
-	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
-		trace_sys_enter(regs, syscall);
-
-		/*
-		 * Probes or BPF hooks in the tracepoint may have changed the
-		 * system call number as well.
-		 */
-		 syscall = syscall_get_nr(current, regs);
-	}
-
-	syscall_enter_audit(regs, syscall);
-
-	return ret ? : syscall;
-}
-
-static inline bool report_single_step(unsigned long flags)
-{
-	if (flags & _TIF_SYSCALL_EMU)
-		return false;
-
-	return flags & _TIF_SINGLESTEP;
-}
-
-static void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
-{
-	bool step;
-
-	audit_syscall_exit(regs);
-
-	if (flags & _TIF_SYSCALL_TRACEPOINT)
-		trace_sys_exit(regs, syscall_get_return_value(current, regs));
-
-	step = report_single_step(flags);
-	if (step || flags & _TIF_SYSCALL_TRACE)
-		report_syscall_exit(regs);
-}
-
-void syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	unsigned long flags = read_thread_flags();
-
-	rseq_syscall(regs);
-
-	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-		syscall_exit_work(regs, flags);
-}
-
 /*
  * SPSR_ELx bits which are always architecturally RES0 per ARM DDI 0487D.a.
  * We permit userspace to set SSBS (AArch64 bit 12, AArch32 bit 23) which is
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 08ffc5a5aea4..7ca30ee41e7a 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -8,8 +8,8 @@
 
 #include <linux/cache.h>
 #include <linux/compat.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
-#include <linux/irq-entry-common.h>
 #include <linux/kernel.h>
 #include <linux/signal.h>
 #include <linux/freezer.h>
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index ec478fc37a9f..77d00a5cf0e9 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -2,6 +2,7 @@
 
 #include <linux/compiler.h>
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/nospec.h>
 #include <linux/ptrace.h>
@@ -68,6 +69,7 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long flags = read_thread_flags();
 
 	regs->orig_x0 = regs->regs[0];
@@ -101,7 +103,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
+	if (unlikely(work & SYSCALL_WORK_ENTER)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
@@ -119,7 +121,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = syscall_trace_enter(regs, flags);
+		scno = syscall_trace_enter(regs, work);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index d26d1b1bcbfb..6519b4a30dc1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -236,14 +236,6 @@ static __always_inline void __exit_to_user_mode_validate(void)
 	lockdep_sys_exit();
 }
 
-/* Temporary workaround to keep ARM64 alive */
-static __always_inline void exit_to_user_mode_prepare_legacy(struct pt_regs *regs)
-{
-	__exit_to_user_mode_prepare(regs);
-	rseq_exit_to_user_mode_legacy();
-	__exit_to_user_mode_validate();
-}
-
 /**
  * syscall_exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
  * @regs:	Pointer to pt_regs on entry stack
diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index c6831c93cd6e..e9c4108ac514 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -743,24 +743,6 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
 	ev->events = 0;
 }
 
-/* Required to keep ARM64 working */
-static __always_inline void rseq_exit_to_user_mode_legacy(void)
-{
-	struct rseq_event *ev = &current->rseq.event;
-
-	rseq_stat_inc(rseq_stats.exit);
-
-	if (static_branch_unlikely(&rseq_debug_enabled))
-		WARN_ON_ONCE(ev->sched_switch);
-
-	/*
-	 * Ensure that event (especially user_irq) is cleared when the
-	 * interrupt did not result in a schedule and therefore the
-	 * rseq processing did not clear it.
-	 */
-	ev->events = 0;
-}
-
 void __rseq_debug_syscall_return(struct pt_regs *regs);
 
 static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
-- 
2.34.1


