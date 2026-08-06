Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2319C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YPVbFpPk+Vi0AmZcunxEr4n8OBahnerbMMu/2B4EUAE=; b=j0058kCdAHjuwnjqyvrmvoivZm
	AN9LZFbJYybTKe6cXtOmdwNE3A6fHCdUjtvhRJRtGvSexNDZt+/M6m/dNoGVGRWmYK9PUDsulatqo
	xlmDsDotLenaqKHOP4l+rEw0blLiU7j5H3FQ5Ce4r212vGUTXklfS5gdtyGZr2odUPKeuJzy53fTU
	uxKv7dDpWsPFr1pG1KM6hUCl0xQxnu8bVErALY0O7tnEjsFpYRw/XnMklbLGaGqv2Bk5Iw8+S3o+v
	hB8wC/A4VC3SD3Oys/kwXMrFgsl1wtMrl4GiDwjuGhKCcLZT5TQRgDS4xFmgN87JFFF3aMo/dJzD8
	dLSfB1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Zp-00000006ivO-0i8P;
	Thu, 06 Aug 2026 21:24:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Zn-00000006iv1-3knQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:24:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D22E6004E;
	Thu,  6 Aug 2026 21:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F1C1F000E9;
	Thu,  6 Aug 2026 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786051470;
	bh=YPVbFpPk+Vi0AmZcunxEr4n8OBahnerbMMu/2B4EUAE=;
	h=From:Date:Subject:To:Cc;
	b=FPI0uSKL+zmQvniTNzX542qdvkG7ucYhPqJfb3LOpXWotq3Rby6IOAfDbX0ag6YRR
	 AkTLDwGkEQ3cvoUR0wYrrF7ozK4dlJrn00JcKQPPhnKs59shXHxWlMyEb5Bw4NZHxA
	 mzWOXOAiNsuObZElDMQs6Yza0TSNS4artTJH8SvP+UqYzisU4XeCa6W94mL9l7e3+U
	 vYIq4c5vmrDT5c80FxKf0ox42Pd6fGu7WCknaYkeF+9cNj0LSgsg4ZSo+LJycK0fpB
	 4Zcp6pLtfK+9PBrLerHSY6JgbSrVdZv9ooKplqykfZZHvkk5zMVX8FIKE6zWNWxuD/
	 ejUrF13WSNJkQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 06 Aug 2026 23:24:17 +0200
Subject: [PATCH v2] ARM: entry: Convert IRQ handling to generic IRQ entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-arm-generic-irq-entry-v7-1-v2-1-3dd7747b2567@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V07RhatIgr/8OwgGGA+ig6xUZC+
 HdbjFuXJ7n3nFk4YkNOHJNZMHnjzGADqE0isK9sR2CawEKlSqdaKaj4Dh3Z8EIw/ASyI0/gc5D
 Qthplo7HA3UEEwYOpNe9Vfi6/7F71hXCMxrjojRsHnta6l3H3C2X/Ql7Gmtpjlad5QVl9uhJbu
 m0H7kS5LMsHbQSKy9cAAAA=
X-Change-ID: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Bring ARM to the same level of generic-ness as ARM64 by enabling
GENERIC_IRQ_ENTRY.

Route ARM IRQ entry through C wrappers that use the generic IRQ entry
helpers. Conversely put the FIQ entry under the generic NMI-style entry
helpers.

Select GENERIC_IRQ_ENTRY, add the ARM entry prototypes, and provide
regs_irqs_disabled() for the generic IRQ entry return path.

The kernel-mode IRQ return path relies on the generic IRQ entry
preemption handling, matching the arm64 structure and avoiding the old
assembly reschedule check.

The reschedule check is now done in raw_irqentry_exit_cond_resched()
in kernel/entry/common.c.

User-mode IRQs __irq_usr is neither calling ct_user_exit/enter
or asm_trace_hardirqs_off/on anymore. The corresponding calls happen on
irqentry_enter/exit() call paths, e.g the irq-disabled C variants
__ct_user_exit/enter() are called instead.

As __irq_usr no longer returns by jumping to ret_to_user_from_irq,
the corresponding code has been inlined, except the slow_work_pending
part, which is now also handled by generic entry. ret_to_user_from_irq
is only called from v7m so it has been renamed accordingly.

arch_do_signal_or_restart() is required, but we only need a very small
stub, since we keep the existing syscall restart code around in assembly.

Tested on with multi_v7_defconfig and qemu-system-arm vexpress-a15
using vexpress-v2p-ca15-tc1.dtb and some different loads.

A note on V7M: the reason we cannot switch the V7M entry over to generic
entry is that it raises a "pendable service call" ("pendv") exception to
process deferred work at the end of the interrupt handler. This is done
so higher priority work can come in. This has no corresponding structure
in other ARM cores.

This is a reduced patch based on the earlier generic entry series avoiding
all the syscall handling changes.

Link: https://lore.kernel.org/linux-arm-kernel/20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Rebase on v7.2-rc1
- Select GENERIC_IRQ_ENTRY also for V7M even if this platform is not
  using it, in order to properly link the image.
- Link to v1: https://patch.msgid.link/20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org
---
 arch/arm/Kconfig                    |  1 +
 arch/arm/include/asm/entry-common.h |  7 ++++
 arch/arm/include/asm/entry.h        | 10 +++++
 arch/arm/include/asm/ptrace.h       |  7 +++-
 arch/arm/kernel/Makefile            |  2 +-
 arch/arm/kernel/entry-armv.S        | 75 ++++++++-----------------------------
 arch/arm/kernel/entry-common.S      |  5 ++-
 arch/arm/kernel/entry-header.S      |  7 +++-
 arch/arm/kernel/entry-v7m.S         |  2 +-
 arch/arm/kernel/entry.c             | 51 +++++++++++++++++++++++++
 arch/arm/kernel/irq.c               |  6 +++
 arch/arm/kernel/irq.h               |  2 +
 arch/arm/kernel/signal.c            |  6 +++
 13 files changed, 116 insertions(+), 65 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9187240a02db..48daf8a8e5a7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -71,6 +71,7 @@ config ARM
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
new file mode 100644
index 000000000000..c017df5f39d5
--- /dev/null
+++ b/arch/arm/include/asm/entry-common.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ARM_ENTRY_COMMON_H
+#define __ASM_ARM_ENTRY_COMMON_H
+
+#include <asm/stacktrace.h>
+
+#endif
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
new file mode 100644
index 000000000000..864c9b3abbf1
--- /dev/null
+++ b/arch/arm/include/asm/entry.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ENTRY_H__
+#define __ASM_ENTRY_H__
+
+struct pt_regs;
+
+void arm_irq_handler(struct pt_regs *regs, int mode);
+void arm_fiq_handler(struct pt_regs *regs);
+
+#endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da0..88ddb9371a02 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -46,8 +46,13 @@ struct svc_pt_regs {
 #define processor_mode(regs) \
 	((regs)->ARM_cpsr & MODE_MASK)
 
+static inline bool regs_irqs_disabled(const struct pt_regs *regs)
+{
+	return regs->ARM_cpsr & PSR_I_BIT;
+}
+
 #define interrupts_enabled(regs) \
-	(!((regs)->ARM_cpsr & PSR_I_BIT))
+	(!regs_irqs_disabled(regs))
 
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index b36cf0cfd4a7..3b8a62f6f54d 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index a3d050ce9b79..8ac7f1512ee8 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -36,35 +36,6 @@
 #define RELOC_TEXT_NONE
 #endif
 
-/*
- * Interrupt handling.
- */
-	.macro	irq_handler, from_user:req
-	mov	r1, sp
-	ldr_this_cpu r2, irq_stack_ptr, r2, r3
-	.if	\from_user == 0
-	@
-	@ If we took the interrupt while running in the kernel, we may already
-	@ be using the IRQ stack, so revert to the original value in that case.
-	@
-	subs	r3, r2, r1		@ SP above bottom of IRQ stack?
-	rsbscs	r3, r3, #THREAD_SIZE	@ ... and below the top?
-#ifdef CONFIG_VMAP_STACK
-	ldr_va	r3, high_memory, cc	@ End of the linear region
-	cmpcc	r3, r1			@ Stack pointer was below it?
-#endif
-	bcc	0f			@ If not, switch to the IRQ stack
-	mov	r0, r1
-	bl	generic_handle_arch_irq
-	b	1f
-0:
-	.endif
-
-	mov_l	r0, generic_handle_arch_irq
-	bl	call_with_stack
-1:
-	.endm
-
 	.macro	pabt_helper
 	@ PABORT handler takes pt_regs in r2, fault address in r4 and psr in r5
 #ifdef MULTI_PABORT
@@ -224,34 +195,17 @@ ENDPROC(__dabt_svc)
 
 	.align	5
 __irq_svc:
-	svc_entry
-	irq_handler from_user=0
-
-#ifdef CONFIG_PREEMPTION
-	ldr	r8, [tsk, #TI_PREEMPT]		@ get preempt count
-	ldr	r0, [tsk, #TI_FLAGS]		@ get flags
-	teq	r8, #0				@ if preempt count != 0
-	movne	r0, #0				@ force flags to 0
-	tst	r0, #_TIF_NEED_RESCHED
-	blne	svc_preempt
-#endif
+	svc_entry trace=0
+	mov	r0, sp				@ regs
+	mov	r1, #0				@ from kernel mode
+	bl	arm_irq_handler
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5, irqentry = 1		@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
 	.ltorg
 
-#ifdef CONFIG_PREEMPTION
-svc_preempt:
-	mov	r8, lr
-1:	bl	preempt_schedule_irq		@ irq en/disable is done inside
-	ldr	r0, [tsk, #TI_FLAGS]		@ get new tasks TI_FLAGS
-	tst	r0, #_TIF_NEED_RESCHED
-	reteq	r8				@ go again
-	b	1b
-#endif
-
 __und_fault:
 	@ Correct the PC such that it is pointing at the instruction
 	@ which caused the fault.  If the faulting instruction was ARM
@@ -302,7 +256,7 @@ ENDPROC(__pabt_svc)
 __fiq_svc:
 	svc_entry trace=0
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	svc_exit_via_fiq
  UNWIND(.fnend		)
 ENDPROC(__fiq_svc)
@@ -331,7 +285,7 @@ __fiq_abt:
 	stmfd	sp!, {r1 - r2}
 
 	add	r0, sp, #8			@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 
 	ldmfd	sp!, {r1 - r2}
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
@@ -438,12 +392,15 @@ ENDPROC(__dabt_usr)
 
 	.align	5
 __irq_usr:
-	usr_entry
+	usr_entry trace=0
 	kuser_cmpxchg_check
-	irq_handler from_user=1
-	get_thread_info tsk
-	mov	why, #0
-	b	ret_to_user_from_irq
+	mov	r0, sp				@ regs
+	mov	r1, #1				@ from user mode
+	bl	arm_irq_handler
+#ifdef CONFIG_KSTACK_ERASE
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
 ENDPROC(__irq_usr)
 
@@ -498,7 +455,7 @@ __fiq_usr:
 	usr_entry trace=0
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	get_thread_info tsk
 	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..d5fdb234c1d4 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -110,7 +110,8 @@ ret_slow_syscall:
 	bl	do_rseq_syscall
 #endif
 	disable_irq_notrace			@ disable interrupts
-ENTRY(ret_to_user_from_irq)
+ENTRY(v7m_ret_to_user_from_irq)
+	/* Only the v7m jumps directly to v7m_ret_to_user_from_irq */
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
@@ -123,7 +124,7 @@ no_work_pending:
 	bl	stackleak_erase_on_task_stack
 #endif
 	restore_user_regs fast = 0, offset = 0
-ENDPROC(ret_to_user_from_irq)
+ENDPROC(v7m_ret_to_user_from_irq)
 ENDPROC(ret_to_user)
 
 /*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa91350..e83f2fb8a592 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -199,7 +199,11 @@
 	.endm
 
 
-	.macro	svc_exit, rpsr, irq = 0
+	.macro	svc_exit, rpsr, irq = 0, irqentry = 0
+	.if	\irqentry != 0
+	@ Generic IRQ entry already handled tracing and lockdep state.
+	disable_irq_notrace
+	.else
 	.if	\irq != 0
 	@ IRQs already off
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -216,6 +220,7 @@
 	tst	\rpsr, #PSR_I_BIT
 	blne	trace_hardirqs_off
 #endif
+	.endif
 	.endif
 	uaccess_exit tsk, r0, r1
 
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 52bacf07ba16..49a3a34e2913 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -94,7 +94,7 @@ __pendsv_entry:
 	@ execute the pending work, including reschedule
 	get_thread_info tsk
 	mov	why, #0
-	b	ret_to_user_from_irq
+	b	v7m_ret_to_user_from_irq
 ENDPROC(__pendsv_entry)
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 000000000000..1142e418d161
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/hardirq.h>
+#include <linux/irq-entry-common.h>
+#include <linux/irq.h>
+
+#include <asm/entry.h>
+#include <asm/stacktrace.h>
+#include <asm/traps.h>
+
+#include "irq.h"
+
+static void noinstr handle_arm_irq(void *data)
+{
+	struct pt_regs *regs = data;
+	struct pt_regs *old_regs;
+
+	irq_enter_rcu();
+	old_regs = set_irq_regs(regs);
+
+	handle_arch_irq(regs);
+
+	set_irq_regs(old_regs);
+	irq_exit_rcu();
+}
+
+noinstr void arm_irq_handler(struct pt_regs *regs, int mode)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/*
+	 * mode == 1 means we came from userspace, and then we
+	 * should just immediately switch to the irq stack.
+	 * Then we check of we are on the thread stack. If we are
+	 * not, then by definition we are already using the irq stack.
+	 */
+	if (mode == 1 || on_thread_stack())
+		call_on_irq_stack(handle_arm_irq, regs);
+	else
+		handle_arm_irq(regs);
+
+	irqentry_exit(regs, state);
+}
+
+noinstr void arm_fiq_handler(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_nmi_enter(regs);
+
+	handle_fiq_as_nmi(regs);
+
+	irqentry_nmi_exit(regs, state);
+}
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ec..f99d6b24d8ff 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,11 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+void call_on_irq_stack(void (*fn)(void *), void *arg)
+{
+	call_with_stack(fn, arg, __this_cpu_read(irq_stack_ptr));
+}
+
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(void *arg)
 {
diff --git a/arch/arm/kernel/irq.h b/arch/arm/kernel/irq.h
new file mode 100644
index 000000000000..80dd5bfe6403
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+void call_on_irq_stack(void (*fn)(void *), void *arg);
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7be9188d83d9..9084c04c07f7 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -12,6 +12,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/uprobes.h>
 #include <linux/syscalls.h>
+#include <linux/irq-entry-common.h>
 
 #include <asm/elf.h>
 #include <asm/cacheflush.h>
@@ -599,6 +600,11 @@ static int do_signal(struct pt_regs *regs, int syscall)
 	return 0;
 }
 
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	do_signal(regs, 0);
+}
+
 asmlinkage int
 do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 {

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48

Best regards,
--  
Linus Walleij <linusw@kernel.org>


