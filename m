Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5745C79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfGjPKgc3qx+td6ktkbm/INFRpZnkn57gpMaPuzTD/o=; b=ee9z9j61lTJdLY
	Jxr+ByNtRN3q1Aqx2VoJyN5DpBuqz5cUGCch89sCd9yBNOiIZJUXXjWR6H2/lvId4CL5L/vSX2WrU
	RLfZY1bqSU1Y6nOQ7EPsyo4dMO6s4M6EQd/RirLIVXvdQ9T8+AMuqRLXbF/U0dDCf6dtKZJIoqrdE
	tcqqr20sI/Kf4MyedK/veBtcgn5+M2Et3WHHXZyd6nPNCvpJX9gLrskPSwq256Ev3FK1Qmc2P4xcv
	YEX2SgS2HD3lvgdpQl4L0oH0xdLAC2AhHwIq3aH3iUosiIw+/IyjNw3LWsjtsyEz+Xpk0YjH7baR8
	OJh00ZdRWRbILbzcKygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cS6-00000007Nxp-2Uo0;
	Mon, 07 Sep 2026 16:44:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cS4-00000007Ntm-3R05
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39FCC60261;
	Mon,  7 Sep 2026 16:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA71C1F00A3F;
	Mon,  7 Sep 2026 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799451;
	bh=mfGjPKgc3qx+td6ktkbm/INFRpZnkn57gpMaPuzTD/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HKs61XX8CvuVioaYlQwNc3JPB64PiPxs8yimoxDLgY5IRUr9JRYlmA1c3NE9BXgJy
	 CsRlv02mVv2MxTH8r+iao1rmSmOujEERV+daw9RY0a91usOlxdui4l74b4/lejGuln
	 Q/b2DYAc/KJVbrjtnFqPx0WbKJJN5dLCs62TLBl2Es6IE1eSHAoji9zTDz636IMXJh
	 Qoui9EtI9x2/g81L9w8iq6qaGz8YAQ9SBhSUvfGnGNq78Nv3ANfUpMo7r0QFHTJW7u
	 1g6FVK8R/2nl9QM9ePMAWWYn8zDMqTm4ksPQ2MstetelZYfqyQvrwaEti8sWMTkrzk
	 U47Iq45rbt+dg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 21/21] arm64: Rename 'overflow_stack' and OVERFLOW_STACK_SIZE
Date: Mon,  7 Sep 2026 17:42:46 +0100
Message-ID: <20260907164247.17223-22-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that the kernel "overflow" stack resides in SP_EL1, it is the active
stack for any exception taken from the kernel. Even though we currently
switch immediately to the kernel stack in the EL1t entry code, rename
the "overflow_stack" to "kernel_exception_stack" to better reflect its
usage. Introduce NVHE_OVERFLOW_STACK_SIZE to keep the EL2 overflow stack
size distinct from the EL1 kernel exception stack size.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/memory.h          | 10 ++++++----
 arch/arm64/include/asm/stacktrace.h      |  9 +++++----
 arch/arm64/include/asm/stacktrace/nvhe.h |  3 +--
 arch/arm64/kernel/entry-common.c         | 18 +++++++++---------
 arch/arm64/kernel/entry.S                |  2 +-
 arch/arm64/kernel/head.S                 |  2 +-
 arch/arm64/kernel/smp.c                  |  9 +++++----
 arch/arm64/kernel/stacktrace.c           |  2 +-
 arch/arm64/kernel/traps.c                | 14 +++++++-------
 arch/arm64/kvm/hyp/nvhe/host.S           |  2 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c     |  4 ++--
 arch/arm64/kvm/stacktrace.c              |  4 ++--
 12 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index a2b7a33966ff..93ce6ef65573 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -139,10 +139,11 @@
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
 
-#define OVERFLOW_STACK_SIZE	SZ_4K
+#define KERNEL_EXC_STACK_SIZE	SZ_4K
 
-#define NVHE_STACK_SHIFT       PAGE_SHIFT
-#define NVHE_STACK_SIZE        (UL(1) << NVHE_STACK_SHIFT)
+#define NVHE_OVERFLOW_STACK_SIZE	SZ_4K
+#define NVHE_STACK_SHIFT		PAGE_SHIFT
+#define NVHE_STACK_SIZE			(UL(1) << NVHE_STACK_SHIFT)
 
 /*
  * With the minimum frame size of [x29, x30], exactly half the combined
@@ -150,7 +151,8 @@
  * save the unwinded stacktrace; plus an additional entry to delimit the
  * end.
  */
-#define NVHE_STACKTRACE_SIZE	((OVERFLOW_STACK_SIZE + NVHE_STACK_SIZE) / 2 + sizeof(long))
+#define NVHE_STACKTRACE_SIZE	((NVHE_OVERFLOW_STACK_SIZE + NVHE_STACK_SIZE) \
+				 / 2 + sizeof(long))
 
 /*
  * Alignment of kernel segments (e.g. .text, .data).
diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index 6d3280932bf5..eb18d7cee62f 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -59,12 +59,13 @@ static inline bool on_task_stack(const struct task_struct *tsk,
 
 #define on_thread_stack()	(on_task_stack(current, current_stack_pointer, 1))
 
-DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
+DECLARE_PER_CPU(unsigned long [KERNEL_EXC_STACK_SIZE/sizeof(long)],
+		kernel_exception_stack);
 
-static inline struct stack_info stackinfo_get_overflow(void)
+static inline struct stack_info stackinfo_get_kernel_exception(void)
 {
-	unsigned long low = (unsigned long)raw_cpu_ptr(overflow_stack);
-	unsigned long high = low + OVERFLOW_STACK_SIZE;
+	unsigned long low = (unsigned long)raw_cpu_ptr(kernel_exception_stack);
+	unsigned long high = low + KERNEL_EXC_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
diff --git a/arch/arm64/include/asm/stacktrace/nvhe.h b/arch/arm64/include/asm/stacktrace/nvhe.h
index 171f9edef49f..629dd2d2caa3 100644
--- a/arch/arm64/include/asm/stacktrace/nvhe.h
+++ b/arch/arm64/include/asm/stacktrace/nvhe.h
@@ -44,8 +44,7 @@ static inline void kvm_nvhe_unwind_init(struct unwind_state *state,
  * In non-protected mode, the unwinding is done from kernel proper context
  * (by the host in EL1).
  */
-
-DECLARE_KVM_NVHE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
+DECLARE_KVM_NVHE_PER_CPU(unsigned long [NVHE_OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
 DECLARE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
 
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 9d734cd09f62..7e9b26cf1bdc 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -327,43 +327,43 @@ static void debug_exception_exit(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
-static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
+static void noinstr el1h_64_check_exception_stack(struct pt_regs *regs)
 {
 	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
-	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
+	unsigned long exc_stack = (unsigned long)this_cpu_ptr(kernel_exception_stack);
 
 	/*
-	 * We're in big trouble if we've overflowed the overflow stack
+	 * We're in big trouble if we've overflowed the exception stack
 	 * so perform a best-effort check before we proceed. If our SP
-	 * is outside of the overflow stack for this CPU then presumably
+	 * is outside of the exceptoin stack for this CPU then presumably
 	 * we're already corrupting memory, so park ourselves here in an
 	 * attempt to contain the damage.
 	 */
-	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
+	if (sp < exc_stack || sp > exc_stack + KERNEL_EXC_STACK_SIZE)
 		cpu_park_loop();
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 {
-	el1h_64_check_overflow_stack(regs);
+	el1h_64_check_exception_stack(regs);
 	el1t_64_sync_handler(regs);
 }
 
 asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
 {
-	el1h_64_check_overflow_stack(regs);
+	el1h_64_check_exception_stack(regs);
 	el1t_64_irq_handler(regs);
 }
 
 asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 {
-	el1h_64_check_overflow_stack(regs);
+	el1h_64_check_exception_stack(regs);
 	el1t_64_fiq_handler(regs);
 }
 
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
-	el1h_64_check_overflow_stack(regs);
+	el1h_64_check_exception_stack(regs);
 	el1t_64_error_handler(regs);
 }
 
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index afcd84510daf..a31ef890a2ee 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -207,7 +207,7 @@ alternative_cb_end
 	mrs	x21, sp_el0
 	ldr_this_cpu	tsk, __entry_task, x20
 	msr	tpidrro_el0, tsk
-	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
+	adr_this_cpu	x19, kernel_exception_stack + KERNEL_EXC_STACK_SIZE, x20
 	mov	x20, sp
 	msr	sp_el0, x20
 	mov	sp, x19
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 7419e1d8b7ec..794cefaf8482 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -213,7 +213,7 @@ SYM_CODE_END(preserve_boot_args)
 
 	mov	\tmp1, sp
 	msr	sp_el0, \tmp1
-	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
+	adr_this_cpu	\tmp1, kernel_exception_stack + KERNEL_EXC_STACK_SIZE, \tmp2
 	mov	sp, \tmp1
 	msr	spsel, #0
 	.endm
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index b2e778aae881..5aaeda5362f7 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -447,9 +447,10 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	mark_linear_text_alias_ro();
 }
 
-static void __init update_boot_cpu_offset_and_overflow_stack(void)
+static void __init update_boot_cpu_offset_and_exception_stack(void)
 {
-	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
+	u64 exc_sp = (u64)raw_cpu_ptr(kernel_exception_stack) +
+		     KERNEL_EXC_STACK_SIZE;
 
 	asm volatile(
 	"	msr	tpidr_el1, %1\n"
@@ -457,7 +458,7 @@ static void __init update_boot_cpu_offset_and_overflow_stack(void)
 	"	msr	spsel, #1\n"
 	"	mov	sp, %0\n" /* Update the overflow stack pointer */
 	"	msr	spsel, #0"
-	: "+r" (ovf_sp)
+	: "+r" (exc_sp)
 	: "r" (per_cpu_offset(0))
 	: "memory");
 }
@@ -469,7 +470,7 @@ void __init smp_prepare_boot_cpu(void)
 	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
 	 * freed shortly, so we must move over to the runtime per-cpu area.
 	 */
-	update_boot_cpu_offset_and_overflow_stack();
+	update_boot_cpu_offset_and_exception_stack();
 
 	cpuinfo_store_boot_cpu();
 	setup_boot_cpu_features();
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c53fb0..8e65b81c7502 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -337,7 +337,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 	struct stack_info stacks[] = {
 		stackinfo_get_task(task),
 		STACKINFO_CPU(irq),
-		STACKINFO_CPU(overflow),
+		STACKINFO_CPU(kernel_exception),
 #if defined(CONFIG_ARM_SDE_INTERFACE)
 		STACKINFO_SDEI(normal),
 		STACKINFO_SDEI(critical),
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 914282016069..ce0e213d772d 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -897,14 +897,14 @@ void bad_el0_sync(struct pt_regs *regs, int reason, unsigned long esr)
 			      "Bad EL0 synchronous exception");
 }
 
-DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
-	__aligned(16);
+DEFINE_PER_CPU(unsigned long [KERNEL_EXC_STACK_SIZE/sizeof(long)],
+	       kernel_exception_stack) __aligned(16);
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
 	unsigned long irq_stk = (unsigned long)this_cpu_read(irq_stack_ptr);
-	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
+	unsigned long exc_stk = (unsigned long)this_cpu_ptr(kernel_exception_stack);
 
 	console_verbose();
 	pr_emerg("Insufficient stack space to handle exception!");
@@ -912,12 +912,12 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 	pr_emerg("ESR: 0x%016lx -- %s\n", esr, esr_get_class_string(esr));
 	pr_emerg("FAR: 0x%016lx\n", far);
 
-	pr_emerg("Task stack:     [0x%016lx..0x%016lx]\n",
+	pr_emerg("Task stack:      [0x%016lx..0x%016lx]\n",
 		 tsk_stk, tsk_stk + THREAD_SIZE);
-	pr_emerg("IRQ stack:      [0x%016lx..0x%016lx]\n",
+	pr_emerg("IRQ stack:       [0x%016lx..0x%016lx]\n",
 		 irq_stk, irq_stk + IRQ_STACK_SIZE);
-	pr_emerg("Overflow stack: [0x%016lx..0x%016lx]\n",
-		 ovf_stk, ovf_stk + OVERFLOW_STACK_SIZE);
+	pr_emerg("Exception stack: [0x%016lx..0x%016lx]\n",
+		 exc_stk, exc_stk + KERNEL_EXC_STACK_SIZE);
 
 	__show_regs(regs);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index 9393fe3ea6a1..b05211a55074 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -205,7 +205,7 @@ SYM_FUNC_END(__host_hvc)
 
 .L__hyp_sp_overflow\@:
 	/* Switch to the overflow stack */
-	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
+	adr_this_cpu sp, overflow_stack + NVHE_OVERFLOW_STACK_SIZE, x0
 
 	b	hyp_panic_bad_stack
 	ASM_BUG()
diff --git a/arch/arm64/kvm/hyp/nvhe/stacktrace.c b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
index 7c832d60d22b..92fe8b6d4de0 100644
--- a/arch/arm64/kvm/hyp/nvhe/stacktrace.c
+++ b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
@@ -9,7 +9,7 @@
 #include <asm/memory.h>
 #include <asm/percpu.h>
 
-DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
+DEFINE_PER_CPU(unsigned long [NVHE_OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
 	__aligned(16);
 
 DEFINE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
@@ -42,7 +42,7 @@ DEFINE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)], pkvm_stacktrac
 static struct stack_info stackinfo_get_overflow(void)
 {
 	unsigned long low = (unsigned long)this_cpu_ptr(overflow_stack);
-	unsigned long high = low + OVERFLOW_STACK_SIZE;
+	unsigned long high = low + NVHE_OVERFLOW_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
index 9724c320126b..e5b878f959fc 100644
--- a/arch/arm64/kvm/stacktrace.c
+++ b/arch/arm64/kvm/stacktrace.c
@@ -27,7 +27,7 @@ static struct stack_info stackinfo_get_overflow(void)
 	struct kvm_nvhe_stacktrace_info *stacktrace_info
 				= this_cpu_ptr_nvhe_sym(kvm_stacktrace_info);
 	unsigned long low = (unsigned long)stacktrace_info->overflow_stack_base;
-	unsigned long high = low + OVERFLOW_STACK_SIZE;
+	unsigned long high = low + NVHE_OVERFLOW_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
@@ -38,7 +38,7 @@ static struct stack_info stackinfo_get_overflow(void)
 static struct stack_info stackinfo_get_overflow_kern_va(void)
 {
 	unsigned long low = (unsigned long)this_cpu_ptr_nvhe_sym(overflow_stack);
-	unsigned long high = low + OVERFLOW_STACK_SIZE;
+	unsigned long high = low + NVHE_OVERFLOW_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
-- 
2.55.0.979.g7e5102b832-goog


