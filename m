Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D48C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Im/42hGHCSKC2Sk/RUS+a2LjdruxSQScNGacJMPsgAs=; b=IttvdblwHFLHjT
	1TgOxuTGy563FpKpTs4AbRpNcfWzWy0XJFZJM/aaTFl/I4WJi0Haay9CZasP3MMmsuHaL6TwdD0++
	oR/AOnVSvpSDV2pEuRM82b2m+tRKZNrj43i8VtHj4NN41KH9MK3X4fA+RG/CgchSBNsgMrZLWIzd1
	c+jipiJYEL2tSD5E+GxPr1JBRzLKE3ebjq6I+ZEtKKHtnYEbv+YhwAYLYzt/AL7q6L1MocyBxgm0U
	VqnPYa02EHXSfVLyY8E8JDcI2g8xn9HL5T99In97swwZnIsc9Ce+PSxP/1RonMA0SvzmZ78F+SIIC
	rr+bgVHObQWXWNNzJF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6S-00000005Gbp-24CA;
	Tue, 28 Jul 2026 12:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6D-00000005GTV-2fdj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C04051A9A;
	Tue, 28 Jul 2026 05:39:52 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 085A83F86F;
	Tue, 28 Jul 2026 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242396; bh=+3TJ2DYvvePKBz15pRPiGQlvWlWiBeIWOiNlRJvHQgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g6SMdXfl3qCrRUmytaDxxnnD273q4BTkrfoIHDBmz1zaJaZjLauBpDYbpqLbYUw+h
	 Ffs5k7491SF1x3lif+AuyDjortamvq3R8Rtv/syNqOfRm9Ntd7P0THKClFdgWHlE6w
	 0AnXrTtS0LGzrJtbccpinhvMhiD/Mn7TvIN2Rd9I=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
Date: Tue, 28 Jul 2026 13:38:52 +0100
Message-Id: <20260728123859.2911495-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053957_777250_C0A308D1 
X-CRM114-Status: GOOD (  24.99  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently arm64's this_cpu_*() ops transiently disable preemption in
order to guarantee that the address generation and memory access(es)
occur on the same CPU.

Transiently disabling preemption can be  expensive. When re-enabling
preemption it is necessary to make a conditional function call to
preempt_schedule[_notrace]() in order to handle the rare case that the
task needs to be rescheduled. The potential function call has a number
of negative effects on code generation (e.g. due to the need to create a
stack frame and spill registers), and the conditionality can result in
poor code generation and/or poor branch prediction.

This patch adds infrastructure for a scheme where this_cpu_*() ops do
not need to transiently disable preemption, avoiding the negative
impacts described above.

Each operation registers a critical section during which the exception
return code will adjust the offset and addresses if preemption occurs
mid-sequence. The critical section is registered/unregistered with a
small prologue and epilogue which encodes three distinct GPRRs (<pcp>,
<off>, <addr>) into a new thread_info::pcp_gprs field:

         // Prologue. Enable fixups for <off> and <addr>.
         mrs	<tsk>, sp_el0
         mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
         strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]

         // Generate cpu-specific address
         mrs	<off>, TPIDR_ELx
         add	<addr>, <pcp>, <off>

         // Perform access sequence
         ldr	<val>, [<addr>]

         // Epilogue. Disable fixups
         strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]

If an exception is taken from within the critical section, the exception
return code will adjust <off> to be the current CPU's offset, and will
adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
<pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
point during the critical section.

To ensure that this_cpu_*() operations within exception handlers work
correctly and do not corrupt state, thread_info::pcpu_gprs is saved
into a new pt_regs::pcpu_gprs field upon exception entry, and restored
upon exception return.

Looking at a simple this_cpu_operation:

| void outline_this_cpu_add_u64(u64 __percpu *p, u64 v)
| {
| 	this_cpu_add(*p, v);
| }

Atop v7.2-rc4, with GCC 15.2.0 and defconfig, this is compiled as:

| <outline_this_cpu_add_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        add     x0, x0, x3
| 1:     ldxr    x5, [x0]
|        add     x5, x5, x1
|        stxr    w4, x5, [x0]
|        cbnz    w4, 1b
|        ldr     x0, [x2, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x2, #8]
|        cbz     x0, 2f
|        ldr     x0, [x2, #8]
|        cbnz    x0, 3f
| 2:     bl      preempt_schedule_notrace
| 3:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

With the scheme added in this patch, this can be compiled as:

| <outline_this_cpu_add_u64>:
|        mrs     x2, sp_el0
|        mov     x4, #0xc80
|        strh    w4, [x2, #20]
|        mrs     x4, tpidr_el1
|        add     x3, x0, x4
| 1:     ldxr    x6, [x3]
|        add     x6, x6, x1
|        stxr    w5, x6, [x3]
|        cbnz    w5, 1b
|        strh    wzr, [x2, #20]
|        ret

TODO: Save/restore the PCPU GPRs in __sdei_asm_handler(). This will
require some mechanical rework to the __sdei_asm_handler() assembly.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h      | 43 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/ptrace.h      |  5 ++++
 arch/arm64/include/asm/thread_info.h |  1 +
 arch/arm64/kernel/asm-offsets.c      |  2 ++
 arch/arm64/kernel/entry-common.c     | 38 ++++++++++++++++++++++++
 arch/arm64/kernel/entry.S            | 13 +++++++++
 6 files changed, 102 insertions(+)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 98823c97d534c..0871dcc41d759 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -5,10 +5,12 @@
 #ifndef __ASM_PERCPU_H
 #define __ASM_PERCPU_H
 
+#include <linux/bits.h>
 #include <linux/preempt.h>
 
 #include <asm/alternative.h>
 #include <asm/cmpxchg.h>
+#include <asm/gpr-num.h>
 #include <asm/stack_pointer.h>
 #include <asm/sysreg.h>
 
@@ -51,6 +53,47 @@ static inline unsigned long __kern_my_cpu_offset(void)
 	return off;
 }
 
+#define PCPU_GPR_PCP			GENMASK(4, 0)
+#define PCPU_GPR_OFF			GENMASK(9, 5)
+#define PCPU_GPR_ADDR			GENMASK(14, 10)
+
+#define __VAL_PCPU_GPRS(pcp, off, addr)				\
+	"("							\
+		"(.L__gpr_num_" pcp  " << 0) | "		\
+		"(.L__gpr_num_" off  " << 5) | "		\
+		"(.L__gpr_num_" addr " << 10)"			\
+	")"
+
+#define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
+	__DEFINE_ASM_GPR_NUMS						\
+	__DEFINE_ASM_GPR_ALIASES					\
+	"	mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"	\
+	"	strh	w" off ", " gprs "\n"				\
+	__KERN_ASM_CPU_OFFSET(off) "\n"
+
+/*
+ * Begin a PCPU GPR critical section which requires <addr> (and <off>).
+ */
+#define __PCPU_GPRS_BEGIN(gprs, pcp, off, addr)				\
+	____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
+	"	add	" addr ", " pcp ", " off "\n"			\
+
+/*
+ * Begin a PCPU GPR critical section which only requires <off> and does not
+ * require <addr>.
+ *
+ * This is only for operations that can use register-offset addressing,
+ * e.g. STR <Xt>, [<Xn>, <Xm].
+ */
+#define __PCPU_GPRS_BEGIN_OFFSET(gprs, pcp, off)			\
+	____PCPU_GPRS_BEGIN(gprs, pcp, off, "xzr")			\
+
+/*
+ * End a PCU GPR critical section.
+ */
+#define __PCPU_GPRS_END(gprs)						\
+	"	strh	wzr, " gprs "\n"
+
 #ifdef __KVM_NVHE_HYPERVISOR__
 #define __my_cpu_offset __hyp_my_cpu_offset()
 #else
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index a1aa668aad50e..962013df20c7a 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -169,6 +169,11 @@ struct pt_regs {
 
 	u64 sdei_ttbr1;
 	struct frame_record_meta stackframe;
+
+	u16	pcpu_gprs;
+	u16	__unused1;
+	u32	__unused2;
+	u64	__unused3;
 };
 
 /* For correct stack alignment, pt_regs has to be a multiple of 16 bytes. */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c85..6db5fa72211d1 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -46,6 +46,7 @@ struct thread_info {
 	u64			mpam_partid_pmg;
 #endif
 	u32			cpu;
+	u16			pcpu_gprs;
 };
 
 #define thread_saved_pc(tsk)	\
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49ca..bde09e9fe3e64 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -36,6 +36,7 @@ int main(void)
   DEFINE(TSK_TI_SCS_BASE,	offsetof(struct task_struct, thread_info.scs_base));
   DEFINE(TSK_TI_SCS_SP,		offsetof(struct task_struct, thread_info.scs_sp));
 #endif
+  DEFINE(TSK_TI_PCPU_GPRS,	offsetof(struct task_struct, thread_info.pcpu_gprs));
   DEFINE(TSK_STACK,		offsetof(struct task_struct, stack));
 #ifdef CONFIG_STACKPROTECTOR
   DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
@@ -78,6 +79,7 @@ int main(void)
   DEFINE(S_PMR,			offsetof(struct pt_regs, pmr));
   DEFINE(S_STACKFRAME,		offsetof(struct pt_regs, stackframe));
   DEFINE(S_STACKFRAME_TYPE,	offsetof(struct pt_regs, stackframe.type));
+  DEFINE(S_PCPU_GPRS,		offsetof(struct pt_regs, pcpu_gprs));
   DEFINE(PT_REGS_SIZE,		sizeof(struct pt_regs));
   BLANK();
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ceb4eb11232a6..5bba1359280c3 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -25,12 +25,49 @@
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
+#include <asm/percpu.h>
 #include <asm/processor.h>
 #include <asm/sdei.h>
 #include <asm/stacktrace.h>
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
 
+/*
+ * Where the context being returned to had an active percpu GPR critical
+ * section, ensure that the offset and address GPRs are updated to match the
+ * current CPU.
+ *
+ * For simplicity we always update the GPRs when a critical section is active
+ * and preemption was *possible*, regardless of whether preemption actually
+ * occurred. Where preemption did not occur, the updates are redundant but not
+ * harmful.
+ */
+static __always_inline void irqentry_exit_pcpu_adjust(struct pt_regs *regs)
+{
+	int reg_pcp, reg_off, reg_addr;
+	unsigned long pcp, off, addr;
+	u16 gprs = regs->pcpu_gprs;
+
+	/*
+	 * Zero means no active PCPU GPRs. As the PCPU GPRs must be distinct,
+	 * a PCPU critical section cannot possibly use {x0,x0,x0}.
+	 */
+	if (likely(!gprs))
+		return;
+
+	reg_pcp  = FIELD_GET(PCPU_GPR_PCP,  gprs);
+	reg_off  = FIELD_GET(PCPU_GPR_OFF,  gprs);
+	reg_addr = FIELD_GET(PCPU_GPR_ADDR, gprs);
+
+	pcp = pt_regs_read_reg(regs, reg_pcp);
+
+	off = __kern_my_cpu_offset();
+	pt_regs_write_reg(regs, reg_off, off);
+
+	addr = pcp + off;
+	pt_regs_write_reg(regs, reg_addr, addr);
+}
+
 /*
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -58,6 +95,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
 	local_irq_disable();
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	local_daif_mask();
+	irqentry_exit_pcpu_adjust(regs);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843a..d26648cd7f280 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -194,6 +194,17 @@ alternative_cb_end
 #endif
 	.endm
 
+	.macro pcpu_gprs_entry, tsk, regs, tmp
+	ldrh	w\tmp, [\tsk, #TSK_TI_PCPU_GPRS]
+	strh	w\tmp, [\regs, #S_PCPU_GPRS]
+	strh	wzr, [\tsk, #TSK_TI_PCPU_GPRS]
+	.endm
+
+	.macro pcpu_gprs_exit, tsk, regs, tmp
+	ldrh	w\tmp, [\regs, #S_PCPU_GPRS]
+	strh	w\tmp, [\tsk, #TSK_TI_PCPU_GPRS]
+	.endm
+
 	.macro	kernel_entry, el, regsize = 64
 	.if	\el == 0
 	alternative_insn nop, SET_PSTATE_DIT(1), ARM64_HAS_DIT
@@ -277,6 +288,7 @@ alternative_else_nop_endif
 	.else
 	add	x21, sp, #PT_REGS_SIZE
 	get_current_task tsk
+	pcpu_gprs_entry	tsk, sp, x0
 	.endif /* \el == 0 */
 	mrs	x22, elr_el1
 	mrs	x23, spsr_el1
@@ -335,6 +347,7 @@ alternative_else_nop_endif
 	.macro	kernel_exit, el
 	.if	\el != 0
 	disable_daif
+	pcpu_gprs_exit	tsk, sp, x0
 	.endif
 
 #ifdef CONFIG_ARM64_PSEUDO_NMI
-- 
2.30.2


