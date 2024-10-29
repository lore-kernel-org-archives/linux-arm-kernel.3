Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AEBD2AB2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0vhef1d/tO4V+dCGdQHkCwxrnfd2znP3qGknf9D7ME=; b=z4cewYnTVBLBwam6gUO10m4iKt
	uqYuyzx53QVQ5fT0qCL1u+82bfy/WPPf+k9tm5dXklG7xSWClUxVMQtQH3GMMZ167FMgrw/ufQex3
	jF+Yz40k8IGIqU9VMAG+nk0unwoNZhGc3CIbDPII7qAm2hIZ3JHc/Gv//x9stnFsuFjncwXJrFrX1
	6sd0t5k+a7k+av3oMZq4M4WC4ZBEJ0VxY2NrPHzljHJrD5aAWZtbPtog/DEPWROFomfp3kdQGtITw
	oXwJc81iZCWw7FeEXsObZ/I0tY8p/bO87TX2Xv82KSoTUUqIIt/e0NTOcUi2Qb125T+NS1bAMcQqW
	FBobz9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kzr-0000000ELJO-0SzU;
	Tue, 29 Oct 2024 12:06:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jr2-0000000E7YV-0kot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539ee1acb86so5298993e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199218; x=1730804018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0vhef1d/tO4V+dCGdQHkCwxrnfd2znP3qGknf9D7ME=;
        b=aN6z/tKOXJi+Uc1Viz4vGHPvMm9ggtuH7Phl9f4ussyPBblOOCUbDqNBigJrOdXAay
         8VBuG9plkpOcLWhBgmKI7ecbd3BvAaEhWxtsHWcbqBTnpmG23c+Gm/etnJGHx6TY6n9a
         cW+gz5n6hZ7iJsgtzSktJGvGqmmXwhZ3Y2Ltmzq5YYN/so6on+9ego2ObUQZTAv0dfPS
         uu/ELQWmpl9SiG/pVZpaCXLl3ABhg21bhX062yxNXgTt4fm7lKkjDjb3ELL73JnvNQLg
         ddfrypnwlyDmwbgYTYxpBkyRM8HdqFfl4jpFirHpMOIHyDa09LVEXH0q8TmMs5FwKUIM
         cUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199218; x=1730804018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0vhef1d/tO4V+dCGdQHkCwxrnfd2znP3qGknf9D7ME=;
        b=mFIkWLSpnO1TAbFfiIYElsV6XhiNeWWWGHIcLMhP8LsZMYZEg3eMOj8CI9IIHG7rB9
         NzADnL5Ey6TROqIJ+ROdc7thfV0Nmi2n4zFfdUSwdFii0m8n/kXfnYBx+gYGPShCHKvV
         VRx00adzR7SmfntYZZDoUskTHXcp5s1z6OdSDLTtQqzLrc+jYytxjTWpdBiHIG2e/LLB
         sSK0WkzcCeiu7pr+fryKeswWgAg5s+jUnfnU0UOT3KXAsGAT2za1Nv9xAT0KT01K4qAe
         zKc390oRyp6H1stDrrjHbrJBeM0Vvc/HWRgDocM9afm4oPZqvRSBjXFbUWhn2CmMxKeS
         bang==
X-Gm-Message-State: AOJu0YxCMUUIgzSA7VaSfN4jS8Tk8GodT9Gd60pqNOGPS7VOJLDsFsX9
	7LZH3MAXrt194Fb95ds0pWsPaTTQjzt7c9BtDaNyNa+n67rYoWO0ndViEU3+nV8=
X-Google-Smtp-Source: AGHT+IGwFjlzuzMZEo0N73/9K3H1Re0V56WIf94sbX16/ps67sdO8rsNPiu8KdHISykctGPyp0tuDg==
X-Received: by 2002:a05:6512:4024:b0:539:8d9b:b624 with SMTP id 2adb3069b0e04-53b34a31f8fmr5316573e87.55.1730199218365;
        Tue, 29 Oct 2024 03:53:38 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:08 +0100
Subject: [PATCH RFC v2 28/28] ARM: entry: Convert to generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-28-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_035340_379104_4FB93308 
X-CRM114-Status: GOOD (  28.00  )
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

This rewrites ARM to use the generic entry.

All of the irqentry_* callbacks are renamed to arm_irqentry_*
and made to call into the generic entry code.

The state for IRQ and NMI for usermode and kernelmode is
stored into a static local variable as interrupts are
not reentrant.

The syscall_enter_from_user_mode(), syscall_exit_to_user_mode(),
do_work_pending() constructs are replaced with generic code.

The syscall invocation now enables syscall tracing "work" using
the generic callbacks and no extra actions are needed to
enable/disable syscall tracing.

The old context tracking with user_exit_callable()
user_enter_callable() is no longer used. Only CSKY and Xtensa
use this deprecated mechanism now.

Like with the ARM64 proposed patch for generic entry, it is
necessary to create a small call "arm_exit_to_user_mode()"
that is used for things such as ret_from_fork, i.e. when
we create a completely new execution context with a botched
return from interrupt.

Open questions:

- I had to add defines for PTRACE_SYSEMU and
  PTRACE_SYSEMU_SINGLESTEP and I have no idea what those
  are or why they are required. Sorry for my ignorance,
  I need help to figure out how we deal with this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig                    |  1 +
 arch/arm/include/asm/entry-common.h | 66 +++++++++++++++++++++++++++
 arch/arm/include/asm/entry.h        | 23 ++++------
 arch/arm/include/asm/ptrace.h       |  3 --
 arch/arm/include/asm/signal.h       |  2 -
 arch/arm/include/asm/syscall.h      |  7 ++-
 arch/arm/include/asm/thread_info.h  | 17 +------
 arch/arm/include/uapi/asm/ptrace.h  |  2 +
 arch/arm/kernel/entry-armv.S        |  8 ++--
 arch/arm/kernel/entry-common.S      | 34 +++++---------
 arch/arm/kernel/entry-header.S      |  8 ++--
 arch/arm/kernel/entry.c             | 80 +++++++++++----------------------
 arch/arm/kernel/process.c           |  2 -
 arch/arm/kernel/ptrace.c            | 90 -------------------------------------
 arch/arm/kernel/signal.c            | 31 +------------
 arch/arm/kernel/syscall.c           | 27 +++--------
 16 files changed, 137 insertions(+), 264 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 749179a1d162..8155a4be7c9b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -66,6 +66,7 @@ config ARM
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
new file mode 100644
index 000000000000..7b1f108512db
--- /dev/null
+++ b/arch/arm/include/asm/entry-common.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_ARM_ENTRY_COMMON_H
+#define _ASM_ARM_ENTRY_COMMON_H
+
+#include <linux/thread_info.h>
+
+#include <asm/stacktrace.h>
+
+enum ptrace_syscall_dir {
+	PTRACE_SYSCALL_ENTER = 0,
+	PTRACE_SYSCALL_EXIT,
+};
+
+static inline unsigned long
+arch_prepare_report_syscall_entry(struct pt_regs *regs)
+{
+	unsigned long ip;
+
+	/*
+	 * IP is used to denote syscall entry/exit:
+	 * IP = 0 -> entry
+	 */
+	ip = regs->ARM_ip;
+	regs->ARM_ip = PTRACE_SYSCALL_ENTER;
+
+	return ip;
+}
+#define arch_prepare_report_syscall_entry arch_prepare_report_syscall_entry
+
+static inline void
+arch_post_report_syscall_entry(struct pt_regs *regs,
+			       unsigned long saved_reg, long ret)
+{
+	regs->ARM_ip = saved_reg;
+}
+#define arch_post_report_syscall_entry arch_post_report_syscall_entry
+
+
+static inline unsigned long
+arch_prepare_report_syscall_exit(struct pt_regs *regs,
+				 unsigned long work)
+{
+	unsigned long ip;
+
+	/*
+	 * IP is used to denote syscall entry/exit:
+	 * IP = 1 -> exit
+	 */
+	ip = regs->ARM_ip;
+	regs->ARM_ip = PTRACE_SYSCALL_EXIT;
+
+	return ip;
+}
+#define arch_prepare_report_syscall_exit arch_prepare_report_syscall_exit
+
+static inline void
+arch_post_report_syscall_exit(struct pt_regs *regs,
+			      unsigned long saved_reg,
+			      unsigned long work)
+{
+	regs->ARM_ip = saved_reg;
+}
+#define arch_post_report_syscall_exit arch_post_report_syscall_exit
+
+#endif /* _ASM_ARM_ENTRY_COMMON_H */
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 2e7ccd87f0eb..dadf0064c65b 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -4,19 +4,14 @@
 
 struct pt_regs;
 
-/*
- * These are copies of generic entry headers so we can transition
- * to generic entry once they are semantically equivalent.
- */
-long syscall_enter_from_user_mode(struct pt_regs *regs, long);
-void syscall_exit_to_user_mode(struct pt_regs *regs);
-void irqentry_enter_from_user_mode(struct pt_regs *regs);
-void irqentry_exit_to_user_mode(struct pt_regs *regs);
-void irqentry_enter_from_kernel_mode(struct pt_regs *regs);
-void irqentry_exit_to_kernel_mode(struct pt_regs *regs);
-void irqentry_nmi_enter_from_user_mode(struct pt_regs *regs);
-void irqentry_nmi_exit_to_user_mode(struct pt_regs *regs);
-void irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs);
-void irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs);
+void arm_irqentry_enter_from_user_mode(struct pt_regs *regs);
+void arm_irqentry_exit_to_user_mode(struct pt_regs *regs);
+void arm_irqentry_enter_from_kernel_mode(struct pt_regs *regs);
+void arm_irqentry_exit_to_kernel_mode(struct pt_regs *regs);
+void arm_irqentry_nmi_enter_from_user_mode(struct pt_regs *regs);
+void arm_irqentry_nmi_exit_to_user_mode(struct pt_regs *regs);
+void arm_irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs);
+void arm_irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs);
+void arm_exit_to_user_mode(struct pt_regs *regs);
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index a01c66f0ad90..8a7de4020cbc 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -200,8 +200,5 @@ static inline unsigned long it_advance(unsigned long cpsr)
 	return cpsr;
 }
 
-int syscall_trace_enter(struct pt_regs *regs);
-void syscall_trace_exit(struct pt_regs *regs);
-
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index bb753cd3e29f..45885383646c 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -23,6 +23,4 @@ typedef struct {
 
 #include <asm/sigcontext.h>
 
-void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
-
 #endif
diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index b94fd7ce17f8..a6c8f0e799bb 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,7 +19,12 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall(void *table, struct pt_regs *regs, int scno);
+void invoke_syscall(void *table, struct pt_regs *regs, int scno);
+
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	return false;
+}
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index d8a45c5a1049..84e58a9cdab6 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -74,6 +74,7 @@ struct thread_info {
 #ifdef CONFIG_ARM_THUMBEE
 	unsigned long		thumbee_state;	/* ThumbEE Handler Base register */
 #endif
+	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 };
 
 #define INIT_THREAD_INFO(tsk)						\
@@ -149,30 +150,14 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define TIF_USING_IWMMXT	17
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_RESTORE_SIGMASK	19
-#define TIF_SYSCALL_TRACE	20	/* syscall trace active */
-#define TIF_SYSCALL_AUDIT	21	/* syscall auditing active */
-#define TIF_SYSCALL_TRACEPOINT	22	/* syscall tracepoint instrumentation */
-#define TIF_SECCOMP		23	/* seccomp syscall filtering active */
-
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
-#define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
-#define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
-#define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
-#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_USING_IWMMXT	(1 << TIF_USING_IWMMXT)
 
-/* Checks for any syscall work in entry-common.S */
-#define _TIF_SYSCALL_WORK (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
-			   _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP)
-
-/*
- * Change these and you break ASM code in entry-common.S
- */
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
 				 _TIF_NOTIFY_SIGNAL)
diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23ccba7..336a5beb282f 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -33,6 +33,8 @@
 #define PTRACE_GETHBPREGS	29
 #define PTRACE_SETHBPREGS	30
 #define PTRACE_GETFDPIC		31
+#define PTRACE_SYSEMU		32
+#define PTRACE_SYSEMU_SINGLESTEP 33
 
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 839f3ebe7228..1bbadf13136e 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -206,9 +206,9 @@ ENDPROC(__und_invalid)
 
 	mov	r0, sp				@ 'regs'
 	.if \nmi
-	bl	irqentry_nmi_enter_from_kernel_mode
+	bl	arm_irqentry_nmi_enter_from_kernel_mode
 	.else
-	bl	irqentry_enter_from_kernel_mode
+	bl	arm_irqentry_enter_from_kernel_mode
 	.endif
 
 	.endm
@@ -495,12 +495,12 @@ ENDPROC(ret_from_exception)
 __fiq_usr:
 	usr_entry
 	mov	r0, sp
-	bl	irqentry_nmi_enter_from_user_mode
+	bl	arm_irqentry_nmi_enter_from_user_mode
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	mov	r0, sp
-	bl	irqentry_nmi_exit_to_user_mode
+	bl	arm_irqentry_nmi_exit_to_user_mode
 	get_thread_info tsk
 	restore_user_regs
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 6b0f86786a7d..b3b2455ab0a1 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -39,10 +39,6 @@ ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
 	add	sp, sp, #(S_R0 + S_OFF)
-	/* do_rseq_syscall needs interrupts enabled. */
-	mov	r0, sp				@ 'regs'
-	bl	syscall_exit_to_user_mode
-
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
@@ -60,7 +56,7 @@ ENTRY(ret_to_user)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
-	bl	syscall_exit_to_user_mode
+	bl	arm_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -94,7 +90,14 @@ SYM_TYPED_FUNC_START(ret_from_fork_asm)
 	bl	ret_from_fork
 	mov	r0, #0
 1:	get_thread_info tsk
-	b	ret_to_user
+	enable_irq_notrace			@ enable interrupts
+	mov	r0, sp				@ 'regs'
+	bl	syscall_exit_to_user_mode
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
 SYM_FUNC_END(ret_from_fork_asm)
 
 /*=============================================================================
@@ -210,29 +213,12 @@ ENTRY(vector_swi)
 #else
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
-
-	/*
-	 * Calling out to C to be careful to save and restore registers.
-	 * This call could modify the syscall number. scno is r7 so we
-	 * do not save and restore r7.
-	 */
-	mov	r0, sp				@ regs
-	mov	r1, scno
-	push	{r4 - r6, r8 - r10, lr}
-	bl	syscall_enter_from_user_mode
-	pop	{r4 - r6, r8 - r10, lr}
-	mov	scno, r0
-
 	mov	r1, sp				@ put regs into r1
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
 	mov	r2, scno			@ syscall number from r7
 	bl	invoke_syscall
-	cmp	r0, #0
-	beq	ret_fast_syscall
-	/* This path taken when tracing */
-	add	sp, sp, #(S_R0 + S_OFF)
-	b	ret_to_user
+	b	ret_fast_syscall
 
 #if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
 	/*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index ec8a6e193802..b5d61b871dec 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -205,7 +205,7 @@
 	disable_irq_notrace
 
 	mov	r0, sp				@ 'regs'
-	bl	irqentry_exit_to_kernel_mode
+	bl	arm_irqentry_exit_to_kernel_mode
 
 	uaccess_exit tsk, r0, r1
 
@@ -253,7 +253,7 @@
 	.macro  svc_exit_via_fiq
 	uaccess_exit tsk, r0, r1
 	mov	r0, sp
-	bl	irqentry_nmi_exit_to_kernel_mode
+	bl	arm_irqentry_nmi_exit_to_kernel_mode
 #ifndef CONFIG_THUMB2_KERNEL
 	@ ARM mode restore
 	mov	r0, sp
@@ -348,12 +348,12 @@ ALT_UP_B(.L1_\@)
 */
 	.macro asm_irqentry_enter_from_user_mode
 	mov	r0, sp				@ regs
-	bl	irqentry_enter_from_user_mode
+	bl	arm_irqentry_enter_from_user_mode
 	.endm
 
 	.macro asm_irqentry_exit_to_user_mode
 	mov	r0, sp				@ regs
-	bl	irqentry_exit_to_user_mode
+	bl	arm_irqentry_exit_to_user_mode
 	.endm
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 09109215dfdf..7302ed8025a9 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,87 +1,59 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
-#include <asm/ptrace.h>
-#include <asm/signal.h>
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
-long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
-{
-	trace_hardirqs_on();
-	local_irq_enable();
-	/* This context tracking call has inverse naming */
-	user_exit_callable();
-
-	/* This will optionally be modified later */
-	return syscall;
-}
+static irqentry_state_t user_irq_state;
+static irqentry_state_t kernel_irq_state;
+static irqentry_state_t user_nmi_state;
+static irqentry_state_t kernel_nmi_state;
 
-void syscall_exit_to_user_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
-	unsigned long flags = read_thread_flags();
-
-	rseq_syscall(regs);
-	local_irq_disable();
-	/*
-	 * It really matters that we check for flags != 0 and not
-	 * just for pending work here!
-	 */
-	if (flags)
-		do_work_pending(regs, flags);
-
-	trace_hardirqs_on();
-	/* This context tracking call has inverse naming */
-	user_enter_callable();
+	user_irq_state = irqentry_enter(regs);
 }
 
-noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
-	trace_hardirqs_off();
-	/* This context tracking call has inverse naming */
-	user_exit_callable();
+	irqentry_exit(regs, user_irq_state);
 }
 
-noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_enter_from_kernel_mode(struct pt_regs *regs)
 {
-	unsigned long flags = read_thread_flags();
-
-	/*
-	 * It really matters that we check for flags != 0 and not
-	 * just for pending work here!
-	 */
-	if (flags)
-		do_work_pending(regs, flags);
-	trace_hardirqs_on();
-	/* This context tracking call has inverse naming */
-	user_enter_callable();
+	kernel_irq_state = irqentry_enter(regs);
 }
 
-noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_exit_to_kernel_mode(struct pt_regs *regs)
 {
-	trace_hardirqs_off();
+	irqentry_exit(regs, kernel_irq_state);
 }
 
-noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_nmi_enter_from_user_mode(struct pt_regs *regs)
 {
-	if (interrupts_enabled(regs))
-		trace_hardirqs_on();
-	else
-		trace_hardirqs_off();
+	irqentry_enter_from_user_mode(regs);
+	user_nmi_state = irqentry_nmi_enter(regs);
 }
 
-noinstr void irqentry_nmi_enter_from_user_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_nmi_exit_to_user_mode(struct pt_regs *regs)
 {
+	irqentry_nmi_exit(regs, user_nmi_state);
+	irqentry_exit_to_user_mode(regs);
 }
 
-noinstr void irqentry_nmi_exit_to_user_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs)
 {
+	kernel_nmi_state = irqentry_nmi_enter(regs);
 }
 
-noinstr void irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs)
+noinstr void arm_irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs)
 {
+	irqentry_nmi_exit(regs, kernel_nmi_state);
 }
 
-noinstr void irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs)
+asmlinkage void arm_exit_to_user_mode(struct pt_regs *regs)
 {
+	local_irq_disable();
+	irqentry_exit_to_user_mode(regs);
 }
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index 81c1c3f98834..6c525a33fa6d 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -248,8 +248,6 @@ __visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
 		 * execve() syscall.
 		 */
 	}
-
-	/* syscall_exit_to_user_mode(regs); here once we switch to generic entry */
 }
 
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index ac7b98ae4724..89afe714cedc 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -27,9 +27,6 @@
 #include <asm/syscall.h>
 #include <asm/traps.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/syscalls.h>
-
 #define REG_PC	15
 #define REG_PSR	16
 /*
@@ -821,90 +818,3 @@ long arch_ptrace(struct task_struct *child, long request,
 
 	return ret;
 }
-
-enum ptrace_syscall_dir {
-	PTRACE_SYSCALL_ENTER = 0,
-	PTRACE_SYSCALL_EXIT,
-};
-
-static void report_syscall_enter(struct pt_regs *regs)
-{
-	unsigned long ip;
-
-	/*
-	 * IP is used to denote syscall entry/exit:
-	 * IP = 0 -> entry
-	 */
-	ip = regs->ARM_ip;
-	regs->ARM_ip = PTRACE_SYSCALL_ENTER;
-
-	if (ptrace_report_syscall_entry(regs))
-		current_thread_info()->abi_syscall = -1;
-
-	regs->ARM_ip = ip;
-}
-
-static void report_syscall_exit(struct pt_regs *regs)
-{
-	unsigned long ip;
-
-	/*
-	 * IP is used to denote syscall entry/exit:
-	 * IP = 1 -> exit
-	 */
-	ip = regs->ARM_ip;
-	regs->ARM_ip = PTRACE_SYSCALL_EXIT;
-
-	ptrace_report_syscall_exit(regs, 0);
-
-	regs->ARM_ip = ip;
-}
-
-asmlinkage int syscall_trace_enter(struct pt_regs *regs)
-{
-	int scno;
-
-	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall_enter(regs);
-
-	/* Do seccomp after ptrace; syscall may have changed. */
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
-	if (secure_computing() == -1)
-		return -1;
-#else
-	/* XXX: remove this once OABI gets fixed */
-	secure_computing_strict(syscall_get_nr(current, regs));
-#endif
-
-	/* Tracer or seccomp may have changed syscall. */
-	scno = syscall_get_nr(current, regs);
-
-	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_enter(regs, scno);
-
-	audit_syscall_entry(scno, regs->ARM_r0, regs->ARM_r1, regs->ARM_r2,
-			    regs->ARM_r3);
-
-	return scno;
-}
-
-void syscall_trace_exit(struct pt_regs *regs)
-{
-	/*
-	 * Audit the syscall before anything else, as a debugger may
-	 * come in and change the current registers.
-	 */
-	audit_syscall_exit(regs);
-
-	/*
-	 * Note that we haven't updated the ->syscall field for the
-	 * current thread. This isn't a problem because it will have
-	 * been set on syscall entry and there hasn't been an opportunity
-	 * for a PTRACE_SET_SYSCALL since then.
-	 */
-	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_exit(regs, regs_return_value(regs));
-
-	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall_exit(regs);
-}
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index a39ee14ec5b7..35d2bb3cd2b4 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 1995-2009 Russell King
  */
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/random.h>
 #include <linux/signal.h>
@@ -535,7 +536,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
  * the kernel can handle, and then we build all the user-level signal handling
  * stack-frames in one go after that.
  */
-static void arch_do_signal_or_restart(struct pt_regs *regs)
+void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
 	bool syscall = (syscall_get_nr(current, regs) != -1);
@@ -598,34 +599,6 @@ static void arch_do_signal_or_restart(struct pt_regs *regs)
 	return;
 }
 
-void do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
-{
-	/*
-	 * The assembly code enters us with IRQs off, but it hasn't
-	 * informed the tracing code of that for efficiency reasons.
-	 * Update the trace code with the current status.
-	 */
-	trace_hardirqs_off();
-	do {
-		if (likely(thread_flags & _TIF_NEED_RESCHED)) {
-			schedule();
-		} else {
-			if (unlikely(!user_mode(regs)))
-				return;
-			local_irq_enable();
-			if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-				arch_do_signal_or_restart(regs);
-			} else if (thread_flags & _TIF_UPROBE) {
-				uprobe_notify_resume(regs);
-			} else {
-				resume_user_mode_work(regs);
-			}
-		}
-		local_irq_disable();
-		thread_flags = read_thread_flags();
-	} while (thread_flags & _TIF_WORK_MASK);
-}
-
 struct page *get_signal_page(void)
 {
 	unsigned long ptr;
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 968cec945a7e..26ec3a151652 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -1,25 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/entry-common.h>
 #include <linux/syscalls.h>
 #include <asm/syscall.h>
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno);
 
-__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
+__visible void invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
-	unsigned long flags = read_thread_flags();
 	int ret;
 
-	if (has_syscall_work(flags)) {
-		scno = syscall_trace_enter(regs);
-		if (scno == -1)
-			goto trace_exit_nosave;
-	}
+	scno = syscall_enter_from_user_mode(regs, scno);
 
 	if (scno < NR_syscalls) {
 		ret = invoke_syscall_asm(table, regs, scno);
@@ -34,13 +25,7 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
 	ret = sys_ni_syscall();
 
 exit_save:
-	/* Save return value from syscall */
-	regs->ARM_r0 = ret;
-	if (!has_syscall_work(flags))
-		return 0;
-
-trace_exit_nosave:
-	local_irq_enable();
-	syscall_trace_exit(regs);
-	return 1;
+	syscall_set_return_value(current, regs, 0, ret);
+
+	syscall_exit_to_user_mode(regs);
 }

-- 
2.46.2


