Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEABACD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDAbBK0gDWIHpzVtm1kT10TBleqgRZVICZfHfQaXsiM=; b=MXhHY0sAqa9NMkyYzojswbjUBe
	F49WEeBryRLIQIaQnt2+NBA+q3xpWz2H43sdhmLtW3VG6RgJ4alSPSNniNHvV2qoH2e9tvXNK58lR
	A3C27HMSK9C5A66Li7Tk2XfRf61VMsAwf7FbSljBkjWXvlM6b6HL8Lr4bAkdaq7Yg0RlwtFBRWu/E
	Kv4Utl5LEbkmxWPzVVjmIraB2EbWlVVu7PCVm1Cuys3VUkpFU8f3UoZ+6CLtLvGM85JP5d78Apk6M
	tNjLW6H3O3Z1fRtAzjMrMUGoe7tocQw46mvzMvRnl37IIxl503AiveryocYPSkwRpG9JiLGU0evpK
	VGOSqD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMqE-0000000CtDc-3nJf;
	Mon, 11 May 2026 09:22:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq6-0000000Ct4Y-3JMY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=sDAbBK0gDWIHpzVtm1kT10TBleqgRZVICZfHfQaXsiM=; b=mIMP5uiJHGhrzLnj7dAdbMhKJ9
	nW/77tSqDk/Am2+CZnYt8UEtM+W7dt4yaR3SKnKLpmVE2dlLSLvtzSpfEkB9nDwmbqf8TXUdbUdVt
	1itozFSjv1/Lgt3S4hbr8fYqPqwXixngKRdi0U6Q4Dx+QjCVnt7iIb2TUrJdNvH1QjEMTrAwu+gJe
	gZNw/mkOm7Stbi+dDi25h4wah0ozbgs644ma94KTHtg91AsDn3k9JPBpm7Xw9pHkpw2pUoHjdldvM
	iRHkRgELQhf5IiPK0MmqIVMI6MNIDbqlYI/W3glIc7ZNiYCiWUYGD+JZK0ZA6Zb/0E3ypjEVb06AJ
	OrH3Kryg==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq0-0000000BA7A-03KL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sDAbBK0gDWIHpzVtm1kT10TBleqgRZVICZfHfQaXsiM=;
	b=CkE/Uemg7Kbmf8wt+dKmX4cMPX+3LwgxyePeigaXXtf6w4P0ttql7h6s1ktZMtzINKBrUL6pg
	i8Wrs1NJUEF+dOAexkFAVtylKuuisJKFqNg4WoUshP/0voiMeN1o1QjkPqsUsYGbvqXqnBeUMDG
	EOzXuZV5S2fqgOW9ZECBYiE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvV171wzRhW0;
	Mon, 11 May 2026 17:14:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AD2A340537;
	Mon, 11 May 2026 17:22:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:22:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 10/11] arm64: entry: Convert to generic entry
Date: Mon, 11 May 2026 17:21:02 +0800
Message-ID: <20260511092103.1974980-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102210_143101_33F400A8 
X-CRM114-Status: GOOD (  26.58  )
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

4. Cleanup and Refactoring:
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

Cc: Mark Rutland <mark.rutland@arm.com>
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
 arch/arm64/include/asm/entry-common.h |  76 ++++++++++++++
 arch/arm64/include/asm/syscall.h      |  21 ++--
 arch/arm64/include/asm/thread_info.h  |  19 +---
 arch/arm64/kernel/debug-monitors.c    |   7 ++
 arch/arm64/kernel/ptrace.c            | 143 --------------------------
 arch/arm64/kernel/signal.c            |   2 +-
 arch/arm64/kernel/syscall.c           |   7 +-
 8 files changed, 103 insertions(+), 174 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..dd5bb1d4b161 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,9 +128,9 @@ config ARM64
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
index b982398f8765..f9fbb33600d8 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -10,6 +10,9 @@
 #include <linux/err.h>
 #include <linux/rseq.h>
 
+#include <asm/compat.h>
+#include <asm/vdso.h>
+
 typedef long (*syscall_fn_t)(const struct pt_regs *regs);
 
 extern const syscall_fn_t sys_call_table[];
@@ -121,17 +124,19 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_exit_work(struct pt_regs *regs, unsigned long flags);
-
-static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
 {
-	unsigned long flags = read_thread_flags();
+	unsigned long sigtramp;
 
-	rseq_syscall(regs);
+#ifdef CONFIG_COMPAT
+	if (is_compat_task()) {
+		unsigned long sigpage = (unsigned long)current->mm->context.sigpage;
 
-	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-		syscall_exit_work(regs, flags);
+		return regs->pc >= sigpage && regs->pc < (sigpage + PAGE_SIZE);
+	}
+#endif
+	sigtramp = (unsigned long)VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
+	return regs->pc == (sigtramp + 8);
 }
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 56a2c9426a32..3f621ba0f961 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -46,6 +46,7 @@ struct thread_info {
 	u64			mpam_partid_pmg;
 #endif
 	u32			cpu;
+	unsigned long		syscall_work;   /* SYSCALL_WORK_ flags */
 };
 
 #define thread_saved_pc(tsk)	\
@@ -68,11 +69,6 @@ void arch_setup_new_exec(void);
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
@@ -94,27 +90,14 @@ void arch_setup_new_exec(void);
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
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ff8ee474ff31..9acc314bc376 100644
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
@@ -37,13 +35,9 @@
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
@@ -2338,143 +2332,6 @@ long arch_ptrace(struct task_struct *child, long request,
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
-	int ret;
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
-	return syscall;
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
-void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
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
index 6ac71a0282d5..f83673e38901 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -2,6 +2,7 @@
 
 #include <linux/compiler.h>
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/nospec.h>
 #include <linux/ptrace.h>
@@ -57,6 +58,7 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long flags = read_thread_flags();
 
 	regs->orig_x0 = regs->regs[0];
@@ -90,7 +92,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
+	if (unlikely(work & SYSCALL_WORK_ENTER)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
@@ -108,8 +110,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		flags = read_thread_flags();
-		scno = syscall_trace_enter(regs, flags);
+		scno = syscall_trace_enter(regs, work);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1


