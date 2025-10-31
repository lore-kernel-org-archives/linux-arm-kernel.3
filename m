Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28783CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXSBfWV8tpC2Nd3cljXrFyvXUntLEuS79VQ7cN3V6Kg=; b=kt+/jYqCMUYr4TZh6NhOu3cHEZ
	Qo6FVI/tpOgNVMFmvMPdVW9wFFMnn+kdNSY+QRQef48Q97zXLri1A+sKIAQDSWZfr068+L7E3mTdL
	CLHprh3GFojtdRkBRsva404K8pr981t5JyLvdUBnUcfjr1QZMZ68G9vokUOf9yXMnaC0i5V45D2nc
	k4qjwIz1Is7+FPPpkCwzPaYg2bD0uNpa6Oh/GYK3ZEEJYe6zVPxZU/w9KFmon4e7O0+NGWOrSsu/a
	FtTV/st4xuuopZXG9mmm7f8uvQxqPvRv1+LD443SQ8Rn5otyqXU/Mx+63oupRQTlJq5IzPZvm3CoU
	vDoSH1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZJ-00000005w3G-2kSG;
	Fri, 31 Oct 2025 10:41:19 +0000
Received: from mail-ej1-f73.google.com ([209.85.218.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmYC-00000005vJn-25qF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:10 +0000
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b6d546f68a0so241491266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907206; x=1762512006; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXSBfWV8tpC2Nd3cljXrFyvXUntLEuS79VQ7cN3V6Kg=;
        b=foFahVOS0AaTprv4+Zd1OZUbKRZ77InWRFIJWYPSF7L7jlLmv5C+CxHIDCXsjbET70
         FP2AI3GVRr0Mbq0b6I2bm3N/6Cec2IAWRMOli5WzyxOiqzpeVzdyJinSyfzxYoEsgREV
         3GmSl9hU4VPOKMg8e98/L/jNN5YmupjJdRxSL9w9bISJh71ne+P51AgLGrXY4Hla5Gi8
         byYS2srlwPtTXtwVWMubHx6IvYS9qInZMZqmtj5k3k2+r1B80l1A1mWvi1yFA9opo5KB
         Tx1O8DekNP6snvVAZ29lih+UhTly6TUQJokih+mC3Cd30o0TnCSpEvTeX4QqSGLwUoDb
         /NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907206; x=1762512006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXSBfWV8tpC2Nd3cljXrFyvXUntLEuS79VQ7cN3V6Kg=;
        b=cz2qAPbFI0ic2W+Tx6jS36xxLG5fKbgvqnhHGKe2+Be1DFJismrkD/R9dNWo3nnrwh
         Cdo/xw3L/659WeJxb8FJM+tLqCc66VB4R2DKq2J62qUfPZcH7cl6YovJsQvECHZcOb61
         uAoVzZiq6ITUCvlgrXeGEdb+Ih474vGd0Qmu86x0rlY0chlq1DoK+tuH3e7YopFApe/8
         chytZisEPYnHd5B87d6K09TYuFG02pdKzLLPXM8sxqdrU9fdCypVrKvhYbBYiZmO/Nnr
         UWp0KaAVZfrkgMqYoXhN7mFC8lgM7T4DlhWEfZc8F519682vLq9z/wwBiN9oBEYBUvq6
         oJWA==
X-Gm-Message-State: AOJu0YwT0ub2zIdALcviBJA4jmhnUkCTWyT/NjMAU9c9jhqCbfUG+dd9
	6t8gkHiC9jtGnKSCe0bzk8DWAuqFue3BaM9HDaXHSLbFKcJShWS2vAs3LFyPx5w+KfM2a5p1vzW
	LX49DMZIk+K6BQgWTsnMhXYozImjHIgfTSZP04QW+cO8ygQ56Hy2aA6qwh0ai/12jqCxL0ZiRGQ
	SyjOvVFH7iKw5G4yvQD0lAZVzAvDswRnpp51sEYJrnTkYt
X-Google-Smtp-Source: AGHT+IHsCyufAFYruq64bIN1s13iRBPnlbTRcCcT0v8JxVpk2siEwC+tdjkWMK4wLBKHpRG6/wZkpb6/
X-Received: from ejnc2.prod.google.com ([2002:a17:906:7622:b0:b3a:f659:314b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:354a:b0:b6d:4fe5:ead0
 with SMTP id a640c23a62f3a-b70700b561amr213996666b.10.1761907205667; Fri, 31
 Oct 2025 03:40:05 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:20 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8906; i=ardb@kernel.org;
 h=from:subject; bh=cmnjLnh4iP86mnRISKNH+TGi8gCkbqyWu/Q2rv/wC+k=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4sOk8CMO764nGqfuqbwan9Nbczdctat9y2r203sCq
 5hLDqzpKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOJamRkWP3TQ39O6kPtPvfY
 KSY/lQ6tV1drLvtnylQwpy4+RuJxCCPDKj+rS784v1Smex89/9vBtz7O6AGP5AW9+44q13wW1+7 lBQA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-44-ardb+git@google.com>
Subject: [PATCH v4 21/21] arm64/fpsimd: Allocate kernel mode FP/SIMD buffers
 on the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034008_868411_8998F5C4 
X-CRM114-Status: GOOD (  31.48  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Commit aefbab8e77eb16b5

  ("arm64: fpsimd: Preserve/restore kernel mode NEON at context switch")

added a 'kernel_fpsimd_state' field to struct thread_struct, which is
the arch-specific portion of struct task_struct, and is allocated for
each task in the system. The size of this field is 528 bytes, resulting
in non-negligible bloat of task_struct, and the resulting memory
overhead may impact performance on systems with many processes.

This allocation is only used if the task is scheduled out or interrupted
by a softirq while using the FP/SIMD unit in kernel mode, and so it is
possible to transparently allocate this buffer on the caller's stack
instead.

So tweak the 'ksimd' scoped guard implementation so that a stack buffer
is allocated and passed to both kernel_neon_begin() and
kernel_neon_end(), and either record it in the task struct, or use it
directly to preserve the task mode kernel FP/SIMD when running in
softirq context. Passing the address to both functions, and checking the
addresses for consistency ensures that callers of the updated bare
begin/end API use it in a manner that is consistent with the new context
switch semantics.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fpu.h       |  4 +-
 arch/arm64/include/asm/neon.h      |  4 +-
 arch/arm64/include/asm/processor.h |  7 ++-
 arch/arm64/include/asm/simd.h      |  7 ++-
 arch/arm64/kernel/fpsimd.c         | 53 ++++++++++++++------
 5 files changed, 54 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
index bdc4c6304c6a..751e88a96734 100644
--- a/arch/arm64/include/asm/fpu.h
+++ b/arch/arm64/include/asm/fpu.h
@@ -15,12 +15,12 @@ static inline void kernel_fpu_begin(void)
 {
 	BUG_ON(!in_task());
 	preempt_disable();
-	kernel_neon_begin();
+	kernel_neon_begin(NULL);
 }
 
 static inline void kernel_fpu_end(void)
 {
-	kernel_neon_end();
+	kernel_neon_end(NULL);
 	preempt_enable();
 }
 
diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
index d4b1d172a79b..acebee4605b5 100644
--- a/arch/arm64/include/asm/neon.h
+++ b/arch/arm64/include/asm/neon.h
@@ -13,7 +13,7 @@
 
 #define cpu_has_neon()		system_supports_fpsimd()
 
-void kernel_neon_begin(void);
-void kernel_neon_end(void);
+void kernel_neon_begin(struct user_fpsimd_state *);
+void kernel_neon_end(struct user_fpsimd_state *);
 
 #endif /* ! __ASM_NEON_H */
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 61d62bfd5a7b..de3c3b65461d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -172,7 +172,12 @@ struct thread_struct {
 	unsigned long		fault_code;	/* ESR_EL1 value */
 	struct debug_info	debug;		/* debugging */
 
-	struct user_fpsimd_state	kernel_fpsimd_state;
+	/*
+	 * Set [cleared] by kernel_neon_begin() [kernel_neon_end()] to the
+	 * address of a caller provided buffer that will be used to preserve a
+	 * task's kernel mode FPSIMD state while it is scheduled out.
+	 */
+	struct user_fpsimd_state	*kernel_fpsimd_state;
 	unsigned int			kernel_fpsimd_cpu;
 #ifdef CONFIG_ARM64_PTR_AUTH
 	struct ptrauth_keys_user	keys_user;
diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index d9f83c478736..7ddb25df5c98 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -43,8 +43,11 @@ static __must_check inline bool may_use_simd(void) {
 
 #endif /* ! CONFIG_KERNEL_MODE_NEON */
 
-DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+DEFINE_LOCK_GUARD_1(ksimd,
+		    struct user_fpsimd_state,
+		    kernel_neon_begin(_T->lock),
+		    kernel_neon_end(_T->lock))
 
-#define scoped_ksimd()	scoped_guard(ksimd)
+#define scoped_ksimd()	scoped_guard(ksimd, &(struct user_fpsimd_state){})
 
 #endif
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e3f8f51748bc..1c652ce4d40d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1489,21 +1489,23 @@ static void fpsimd_load_kernel_state(struct task_struct *task)
 	 * Elide the load if this CPU holds the most recent kernel mode
 	 * FPSIMD context of the current task.
 	 */
-	if (last->st == &task->thread.kernel_fpsimd_state &&
+	if (last->st == task->thread.kernel_fpsimd_state &&
 	    task->thread.kernel_fpsimd_cpu == smp_processor_id())
 		return;
 
-	fpsimd_load_state(&task->thread.kernel_fpsimd_state);
+	fpsimd_load_state(task->thread.kernel_fpsimd_state);
 }
 
 static void fpsimd_save_kernel_state(struct task_struct *task)
 {
 	struct cpu_fp_state cpu_fp_state = {
-		.st		= &task->thread.kernel_fpsimd_state,
+		.st		= task->thread.kernel_fpsimd_state,
 		.to_save	= FP_STATE_FPSIMD,
 	};
 
-	fpsimd_save_state(&task->thread.kernel_fpsimd_state);
+	BUG_ON(!cpu_fp_state.st);
+
+	fpsimd_save_state(task->thread.kernel_fpsimd_state);
 	fpsimd_bind_state_to_cpu(&cpu_fp_state);
 
 	task->thread.kernel_fpsimd_cpu = smp_processor_id();
@@ -1774,6 +1776,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
 void fpsimd_flush_task_state(struct task_struct *t)
 {
 	t->thread.fpsimd_cpu = NR_CPUS;
+	t->thread.kernel_fpsimd_state = NULL;
 	/*
 	 * If we don't support fpsimd, bail out after we have
 	 * reset the fpsimd_cpu for this task and clear the
@@ -1833,8 +1836,13 @@ void fpsimd_save_and_flush_cpu_state(void)
  *
  * The caller may freely use the FPSIMD registers until kernel_neon_end() is
  * called.
+ *
+ * Unless called from non-preemptible task context, @state must point to a
+ * caller provided buffer that will be used to preserve the task's kernel mode
+ * FPSIMD context when it is scheduled out, or if it is interrupted by kernel
+ * mode FPSIMD occurring in softirq context. May be %NULL otherwise.
  */
-void kernel_neon_begin(void)
+void kernel_neon_begin(struct user_fpsimd_state *state)
 {
 	if (WARN_ON(!system_supports_fpsimd()))
 		return;
@@ -1846,7 +1854,7 @@ void kernel_neon_begin(void)
 	/* Save unsaved fpsimd state, if any: */
 	if (test_thread_flag(TIF_KERNEL_FPSTATE)) {
 		BUG_ON(IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq());
-		fpsimd_save_kernel_state(current);
+		fpsimd_save_state(state);
 	} else {
 		fpsimd_save_user_state();
 
@@ -1867,8 +1875,17 @@ void kernel_neon_begin(void)
 		 * mode in task context. So in this case, setting the flag here
 		 * is always appropriate.
 		 */
-		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
+		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq()) {
+			/*
+			 * Record the caller provided buffer as the kernel mode
+			 * FP/SIMD buffer for this task, so that the state can
+			 * be preserved and restored on a context switch.
+			 */
+			WARN_ON(current->thread.kernel_fpsimd_state != NULL);
+			WARN_ON(preemptible() && !state);
+			current->thread.kernel_fpsimd_state = state;
 			set_thread_flag(TIF_KERNEL_FPSTATE);
+		}
 	}
 
 	/* Invalidate any task state remaining in the fpsimd regs: */
@@ -1886,22 +1903,30 @@ EXPORT_SYMBOL_GPL(kernel_neon_begin);
  *
  * The caller must not use the FPSIMD registers after this function is called,
  * unless kernel_neon_begin() is called again in the meantime.
+ *
+ * The value of @state must match the value passed to the preceding call to
+ * kernel_neon_begin().
  */
-void kernel_neon_end(void)
+void kernel_neon_end(struct user_fpsimd_state *state)
 {
 	if (!system_supports_fpsimd())
 		return;
 
+	if (!test_thread_flag(TIF_KERNEL_FPSTATE))
+		return;
+
 	/*
 	 * If we are returning from a nested use of kernel mode FPSIMD, restore
 	 * the task context kernel mode FPSIMD state. This can only happen when
 	 * running in softirq context on non-PREEMPT_RT.
 	 */
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq() &&
-	    test_thread_flag(TIF_KERNEL_FPSTATE))
-		fpsimd_load_kernel_state(current);
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq()) {
+		fpsimd_load_state(state);
+	} else {
 		clear_thread_flag(TIF_KERNEL_FPSTATE);
+		WARN_ON(current->thread.kernel_fpsimd_state != state);
+		current->thread.kernel_fpsimd_state = NULL;
+	}
 }
 EXPORT_SYMBOL_GPL(kernel_neon_end);
 
@@ -1937,7 +1962,7 @@ void __efi_fpsimd_begin(void)
 	WARN_ON(preemptible());
 
 	if (may_use_simd()) {
-		kernel_neon_begin();
+		kernel_neon_begin(&efi_fpsimd_state);
 	} else {
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
@@ -1986,7 +2011,7 @@ void __efi_fpsimd_end(void)
 		return;
 
 	if (!efi_fpsimd_state_used) {
-		kernel_neon_end();
+		kernel_neon_end(&efi_fpsimd_state);
 	} else {
 		if (system_supports_sve() && efi_sve_state_used) {
 			bool ffr = true;
-- 
2.51.1.930.gacf6e81ea2-goog


