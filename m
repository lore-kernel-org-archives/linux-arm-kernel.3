Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4761C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj3uQfPL5QpQaijVWcdGBfiFx0mvGXpme5FKU6Df8+c=; b=4Fj2RtFb7KbSDF
	KqD8hd+0InGKhQpHmSZYUcDi2aVbYsCpWn4VpolLbwIruENESuYg/9kgFy9Ycb8ErFfJUCM1v1t7f
	s3DFlX/UTR4ZG/snGCPlN7j8DkDK7B2+GUXyEeB6sl/ybA/Ewfsda4kVV125X7U0t+RkDSw2Ux2u9
	zNLoX8+8obbioAmsLexKcB3E2p8r+v2w7IRePl3UFG+SUR9jZ8ipI4Wwyt1I0rnZeCFbi1pd2BFcu
	7348r9TixQdZg7qr6mgIg6q1VSo5zxhj+qtUn27hQG/CTpNE/WbrZOqn2e0taO96ChNbeXQuHgutP
	BOVGFb3kN8w4gFyXTGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEX-0000000Eywg-1BoL;
	Fri, 18 Sep 2026 16:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bET-0000000Eyuw-2su5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2727960A58;
	Fri, 18 Sep 2026 16:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92211F000FF;
	Fri, 18 Sep 2026 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748076;
	bh=Yj3uQfPL5QpQaijVWcdGBfiFx0mvGXpme5FKU6Df8+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mBzSpswBxzlDApkp72n3j6wu4B2CAB+jfjCHubUEJXTyehUqxSy2kpHopSw1bN1IH
	 nZvtzJAkLglbinbIcSexhc4AbjWsR7chcrWqX5zEg9hdor6sJZpE95wNy3tVGOZ8+E
	 sDZuGO2tEl1AWYsvbyWb2vaKwV6OtGijeH4tsgP33gpGGxY7slQNRqjmvSajeEKp1z
	 Wunafa1SHHEmaAZIZoOVy1IMk6ikNjyTPTPADbAFXJTWneJzGQ9cuYpQb89rG8LF5/
	 ue+JBUX5RXJkC2JEwTLesyrDLKVFzTZSwXAsnYsPrNO+8f6fydGm4qDZDAp5Sc1pIO
	 g8+23RlLf/1vg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of SP_EL0
Date: Fri, 18 Sep 2026 17:13:50 +0100
Message-ID: <20260918161407.2300-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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

To make SP_EL0 available to point at the per-cpu kernel overflow stack,
we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
in the return-to-user path, we can otherwise use it to hold 'current'
and update the various accessors accordingly.

Move 'current' from SP_EL0 to TPIDRRO_EL0.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/assembler.h |  2 +-
 arch/arm64/include/asm/current.h   |  6 +++---
 arch/arm64/kernel/entry.S          | 20 ++++++++++----------
 arch/arm64/kernel/head.S           |  2 +-
 arch/arm64/kernel/process.c        |  5 +++--
 arch/arm64/mm/proc.S               |  6 +++++-
 arch/arm64/net/bpf_jit_comp.c      |  4 ++--
 7 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dc..fd1ae5337935 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -587,7 +587,7 @@ alternative_else_nop_endif
  * Return the current task_struct.
  */
 	.macro	get_current_task, rd
-	mrs	\rd, sp_el0
+	mrs	\rd, tpidrro_el0
 	.endm
 
 /*
diff --git a/arch/arm64/include/asm/current.h b/arch/arm64/include/asm/current.h
index c92912eaf186..8c7efac05394 100644
--- a/arch/arm64/include/asm/current.h
+++ b/arch/arm64/include/asm/current.h
@@ -14,11 +14,11 @@ struct task_struct;
  */
 static __always_inline struct task_struct *get_current(void)
 {
-	unsigned long sp_el0;
+	unsigned long tpidrro_el0;
 
-	asm ("mrs %0, sp_el0" : "=r" (sp_el0));
+	asm ("mrs %0, tpidrro_el0" : "=r" (tpidrro_el0));
 
-	return (struct task_struct *)sp_el0;
+	return (struct task_struct *)tpidrro_el0;
 }
 
 #define current get_current()
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index b5d8277f608a..a45be0a837c8 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -81,9 +81,9 @@
 	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
 	msr	tpidr_el0, x0
 
-	/* Recover the original x0 value and stash it in tpidrro_el0 */
+	/* Recover the original x0 value and stash it in sp_el0 */
 	sub	x0, sp, x0
-	msr	tpidrro_el0, x0
+	msr	sp_el0, x0
 
 	/* Switch to the overflow stack */
 	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
@@ -99,7 +99,7 @@
 
 	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
 	sub	sp, sp, x0
-	mrs	x0, tpidrro_el0
+	mrs	x0, sp_el0
 	b	el\el\ht\()_\regsize\()_\label
 	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
@@ -226,7 +226,7 @@ alternative_cb_end
 	clear_gp_regs
 	mrs	x21, sp_el0
 	ldr_this_cpu	tsk, __entry_task, x20
-	msr	sp_el0, tsk
+	msr	tpidrro_el0, tsk
 
 	/*
 	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
@@ -548,7 +548,7 @@ SYM_CODE_START_LOCAL(__bad_stack)
 	 */
 
 	/* Restore the original x0 value */
-	mrs	x0, tpidrro_el0
+	mrs	x0, sp_el0
 
 	/*
 	 * Store the original GPRs to the new stack. The orginal SP (minus
@@ -843,7 +843,7 @@ SYM_FUNC_START(cpu_switch_to)
 	ldp	x29, x9, [x8], #16
 	ldr	lr, [x8]
 	mov	sp, x9
-	msr	sp_el0, x1
+	msr	tpidrro_el0, x1
 	ptrauth_keys_install_kernel x1, x8, x9, x10
 	scs_save x0
 	scs_load_current
@@ -1031,11 +1031,11 @@ SYM_CODE_START(__sdei_asm_handler)
 
 	/*
 	 * We may have interrupted userspace, or a guest, or exit-from or
-	 * return-to either of these. We can't trust sp_el0, restore it.
+	 * return-to either of these. We can't trust tpidrro_el0, restore it.
 	 */
-	mrs	x28, sp_el0
+	mrs	x28, tpidrro_el0
 	ldr_this_cpu	dst=x0, sym=__entry_task, tmp=x1
-	msr	sp_el0, x0
+	msr	tpidrro_el0, x0
 
 	/* If we interrupted the kernel point to the previous stack/frame. */
 	and     x0, x3, #0xc
@@ -1051,7 +1051,7 @@ SYM_CODE_START(__sdei_asm_handler)
 	mov	x1, x19
 	bl	__sdei_handler
 
-	msr	sp_el0, x28
+	msr	tpidrro_el0, x28
 	/* restore regs >x17 that we clobbered */
 	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
 	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..c33551ee6572 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -193,7 +193,7 @@ SYM_CODE_END(preserve_boot_args)
 	 * for consistency with user tasks and kthreads.
 	 */
 	.macro	init_cpu_task tsk, tmp1, tmp2
-	msr	sp_el0, \tsk
+	msr	tpidrro_el0, \tsk
 
 	ldr	\tmp1, [\tsk, #TSK_STACK]
 	add	sp, \tmp1, #THREAD_SIZE
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index bfdc12166895..79a19be88ced 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -551,8 +551,9 @@ static void ssbs_thread_switch(struct task_struct *next)
 }
 
 /*
- * We store our current task in sp_el0, which is clobbered by userspace. Keep a
- * shadow copy so that we can restore this upon entry from userspace.
+ * We store our current task in tpidrro_el0, which is clobbered when returning
+ * to userspace. Keep a shadow copy so that we can restore this upon entry from
+ * userspace.
  *
  * This is *only* for exception entry from EL0, and is not valid until we
  * __switch_to() a user task.
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 12aacc74f764..ad4965d34978 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -129,6 +129,10 @@ SYM_FUNC_START(cpu_do_resume)
 	ldp	x9, x10, [x0, #48]
 	ldp	x11, x12, [x0, #64]
 	ldp	x13, x14, [x0, #80]
+
+	/* Move 'current' somewhere safe */
+	mov	x15, x3
+
 	/*
 	 * Restore x18, as it may be used as a platform register, and clear
 	 * the buffer to minimize the risk of exposure when used for shadow
@@ -176,7 +180,7 @@ alternative_if ARM64_HAS_GIC_PRIO_MASKING
 alternative_else_nop_endif
 #endif
 
-	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
+	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
 	isb
 	ret
 SYM_FUNC_END(cpu_do_resume)
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..51d853b92443 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1694,7 +1694,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
 		if (insn->src_reg == 0 && insn->imm == BPF_FUNC_get_smp_processor_id) {
 			cpu_offset = offsetof(struct thread_info, cpu);
 
-			emit(A64_MRS_SP_EL0(tmp), ctx);
+			emit(A64_MRS_TPIDRRO_EL0(tmp), ctx);
 			if (is_lsi_offset(cpu_offset, 2)) {
 				emit(A64_LDR32I(r0, tmp, cpu_offset), ctx);
 			} else {
@@ -1707,7 +1707,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
 		/* Implement helper call to bpf_get_current_task/_btf() inline */
 		if (insn->src_reg == 0 && (insn->imm == BPF_FUNC_get_current_task ||
 					   insn->imm == BPF_FUNC_get_current_task_btf)) {
-			emit(A64_MRS_SP_EL0(r0), ctx);
+			emit(A64_MRS_TPIDRRO_EL0(r0), ctx);
 			break;
 		}
 
-- 
2.55.0.1082.g2b9226bbc0-goog


