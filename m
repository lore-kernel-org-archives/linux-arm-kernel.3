Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85847CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzZU1YIIu1tEEW+NfEP+TdcW3FbKp5NQWF2XmOxvSG8=; b=F0dhiJJ/8DpeZSqP/2Mh3VBKX5
	b/67eGAnijbj9qZwtjPAQXtFqEK2NgA2iDo/QWNOYdBJYWL1hythOp/6mlRzwoordwSDi03QiFHgY
	gXsq6c1WsSDJk7QaehevAm6nMeUtLAwurUP1Axjn7ZUpwQm28deE83FMSVi+76RLGX/FkHR0dxIPz
	Nsd92J5rW2mU6BVy+EoC8jr5Lo05q5zTFxvBcFk1h12Dr5lf7bpVPJo6jea2rvwekVwws+H3YwJ6p
	25rF/VEGcEC9g796NZ/CG6fSFv7lkbRaD9+cBnGNQhBiYxsboBix+5mqJRysfNENbMxbWVLBeIoS3
	WzD0FTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ico-0000000Cj5y-49Ko;
	Fri, 03 Oct 2025 16:27:18 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4icl-0000000Cj4F-2ekr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 16:27:17 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e38bd6680so10141985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759508833; x=1760113633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MzZU1YIIu1tEEW+NfEP+TdcW3FbKp5NQWF2XmOxvSG8=;
        b=LyZeFyw8G9Ksh2LcFPchcB3/xxI66bac58qINoQCtYtIT3/rTOVb1MTUp7ZI3Sa4aX
         uBxI4YDZZwBa1qG8FRVSGcEhDqnZfRRHhXujFAWP5Pw1r9hMh/TUwvzK9zfrYqo2NCok
         zbhr7hNRWTtBGi2ZDH18acyZnweSPc5ENijaeodJMrPXrYRLsHsw+ZKr8jS/JOourjeA
         VVT8YxFQOfHqij13Ik0lLO/GggUSVmDdyf26f0n+60CWyrYrjXSCLptVFSYyDbxiFgMB
         hPC60bQRQHW2nurrcen42HcxC0Yt4w+G/NlHqW+cUNuDVDMuE2M5WFOV9me+KETjKUT/
         /5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508833; x=1760113633;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzZU1YIIu1tEEW+NfEP+TdcW3FbKp5NQWF2XmOxvSG8=;
        b=g6cEv90vg97a5SRQADBtQx7Mn32jNE1pDPbCbJxRtzYETyzOm8QwZfhLJfR7OixdNC
         ZaSffUVjhWHAadKerF9sus0tPFUIhONBx9FoSCtkUEh2ACSwggk5IGcq4XhYWItqCoz5
         NSDMfeCcVO96YjSHsp6wl6mseHDqYFuIH++eVkrWgZK0ZPasH25LzAE6UkHjUWQW0Nla
         ZEa7Hg3J6xATjyoj9/JAqFNvsIbqH9VbJI1bhLjZZ/N4frCWBO9Fc5ABM60qWvmfIKh6
         15xny/mcQdEQqkEIQfwPkKtIZ3fjWZovzbAB0jP5Ls5MxSrfZvHx5OV7B9Rft2ToUKxN
         o39A==
X-Gm-Message-State: AOJu0YzblkoF6zKaR7ZwC31ZZB16Vigy5Fne+bATpLDr0/0FjX+g23xH
	6lt9N5levouO/a+IvrM6wnvADbUSqDPiIuyaBkq2zv04dh8ICyNNm2oXzIqqf+XlxdzYGUZs2aR
	OV3T26XAHTt51hdNi5AhSbGMqCB2/kaGJDBHvXwBmTuXYd0/v04PbpeIEWfELRw++lgytSnPa/G
	aQYFf8f/xXabI28r+uCo7ZbIuy15t7hTmmlFsxxctMWKLe
X-Google-Smtp-Source: AGHT+IE6d7XFFzHEQP3LZlDJ6UNgOnjntHAmo33gEOyj+OOsIA5T9WHORBs2YLgEj/GDoFpwHf2fOrJw
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:45d:d522:48a9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e20:b0:46e:385c:3e0e
 with SMTP id 5b1f17b1804b1-46e71147325mr21476375e9.29.1759508833541; Fri, 03
 Oct 2025 09:27:13 -0700 (PDT)
Date: Fri,  3 Oct 2025 18:21:21 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9767; i=ardb@kernel.org;
 h=from:subject; bh=oy3ZXXmy5rTIVCA8TnGFAP5PGUqXfbrZBOI+pHkf+d0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP+jxoDxhCb9d1JGnuzJFstNsmEp/wu5rirG5RvfkilS
 Elfb21HKQuDGBeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmEiHEiPDxPKj0XJ3F2zawLRT
 e7vcP/3e6ctPCfwuMVZMbJy/RXv1RoY/nLrB+mqxr2+8X/j6wH31fcanZ/+743plz5FjQuVrzGa 28AIA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003162120.2672780-2-ardb+git@google.com>
Subject: [RFC PATCH] arm64/fpsimd: Implement strict mode for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, broonie@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_092715_724164_2B333BD4 
X-CRM114-Status: GOOD (  26.66  )
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

The arch-specific code on arm64 that uses the FP/SIMD register file
takes great care to use FP/SIMD enabled C code only from isolated
compilation units. This is needed because that code is compiled
with the -mgeneral-regs-only compiler flag omitted, and this permits the
compiler to use FP/SIMD registers anywhere, including for things like
spilling. This could result in unrelated FP/SIMD state getting
corrupted, as that may only be manipulated from within a
kernel_neon_begin/end block.

The generic kernel mode FPU API, as used by the amdgpu driver, also
omits the -mgeneral-regs-only flag when building FP/SIMD code, but
without any guardrails, potentially resulting in user data corruption if
any of that code is reachable from outside of a kernel_fpu_begin/end
pair.

On arm64, this issue is more severe than on other architectures, as
access to the FP/SIMD registers is never disabled, and so such
corruption could happen silently.

So implement a strict FP/SIMD mode that does disable access to the
FP/SIMD registers, so that inadvertent accesses trap and cause an
exception.

Link: https://lore.kernel.org/all/20251002210044.1726731-2-ardb+git@google.com/
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig               | 11 ++++++++
 arch/arm64/include/asm/fpsimd.h  | 29 +++++++++++++++++++
 arch/arm64/kernel/entry-common.c |  3 ++
 arch/arm64/kernel/fpsimd.c       | 48 +++++++++++++++++++++++---------
 4 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 84c7a455d16c..53162e13c0d4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -384,6 +384,17 @@ config SMP
 config KERNEL_MODE_NEON
 	def_bool y
 
+config STRICT_KERNEL_FPSIMD
+	bool "Enable strict checking of kernel mode FP/SIMD register accesses"
+	default DRM_AMDGPU
+	help
+	  Disable access to the FP/SIMD register file when entering the kernel,
+	  and only enable it temporarily when using it for kernel mode FP/SIMD,
+	  or for context switching the contents. This ensures that inadvertent
+	  accesses from code that fails to use the kernel NEON begin/end API
+	  properly will trigger an exception, instead of silently corrupting
+	  user data.
+
 config FIX_EARLYCON_MEM
 	def_bool y
 
diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index b8cf0ea43cc0..0681c081db79 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -57,6 +57,35 @@ static inline void cpacr_restore(unsigned long cpacr)
 	isb();
 }
 
+static inline void cpacr_enable_fpsimd(void)
+{
+	sysreg_clear_set(cpacr_el1, 0, CPACR_EL1_FPEN);
+	isb();
+}
+
+static inline void cpacr_disable_fpsimd(void)
+{
+	sysreg_clear_set(cpacr_el1, CPACR_EL1_FPEN, 0);
+	isb();
+}
+
+static inline bool fpsimd_kmode_strict(void)
+{
+	return IS_ENABLED(CONFIG_STRICT_KERNEL_FPSIMD);
+}
+
+static inline void fpsimd_kmode_enable_access(void)
+{
+	if (fpsimd_kmode_strict())
+		cpacr_enable_fpsimd();
+}
+
+static inline void fpsimd_kmode_disable_access(void)
+{
+	if (fpsimd_kmode_strict())
+		cpacr_disable_fpsimd();
+}
+
 /*
  * When we defined the maximum SVE vector length we defined the ABI so
  * that the maximum vector length included all the reserved for future
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index f546a914f041..3b83989c768c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -21,6 +21,7 @@
 #include <asm/daifflags.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
+#include <asm/fpsimd.h>
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
@@ -88,6 +89,7 @@ static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
 
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
+	fpsimd_kmode_disable_access();
 	__enter_from_user_mode(regs);
 }
 
@@ -104,6 +106,7 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 	local_daif_mask();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
+	fpsimd_kmode_enable_access();
 }
 
 asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e3f8f51748bc..c1c3a554b3e5 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -359,6 +359,9 @@ static void task_fpsimd_load(void)
 	WARN_ON(preemptible());
 	WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
 
+	/* Enable access so the FP/SIMD register contents can be loaded */
+	fpsimd_kmode_enable_access();
+
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
@@ -432,7 +435,7 @@ static void task_fpsimd_load(void)
  * than via current, if we are saving KVM state then it will have
  * ensured that the type of registers to save is set in last->to_save.
  */
-static void fpsimd_save_user_state(void)
+static void fpsimd_save_user_state(bool leave_fpsimd_enabled)
 {
 	struct cpu_fp_state const *last =
 		this_cpu_ptr(&fpsimd_last_state);
@@ -447,6 +450,9 @@ static void fpsimd_save_user_state(void)
 	if (test_thread_flag(TIF_FOREIGN_FPSTATE))
 		return;
 
+	/* Enable access so the FP/SIMD register contents can be saved */
+	fpsimd_kmode_enable_access();
+
 	if (system_supports_fpmr())
 		*(last->fpmr) = read_sysreg_s(SYS_FPMR);
 
@@ -492,7 +498,7 @@ static void fpsimd_save_user_state(void)
 			 * There's no way to recover, so kill it:
 			 */
 			force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
-			return;
+			goto out;
 		}
 
 		sve_save_state((char *)last->sve_state +
@@ -503,6 +509,10 @@ static void fpsimd_save_user_state(void)
 		fpsimd_save_state(last->st);
 		*last->fp_type = FP_STATE_FPSIMD;
 	}
+
+out:
+	if (!leave_fpsimd_enabled)
+		fpsimd_kmode_disable_access();
 }
 
 /*
@@ -1114,10 +1124,10 @@ static void __init sve_efi_setup(void)
 
 void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
 {
-	write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
-	isb();
+	unsigned long cpacr = cpacr_save_enable_kernel_sve();
 
 	write_sysreg_s(0, SYS_ZCR_EL1);
+	cpacr_restore(cpacr);
 }
 
 void __init sve_setup(void)
@@ -1543,10 +1553,11 @@ void fpsimd_thread_switch(struct task_struct *next)
 	if (test_thread_flag(TIF_KERNEL_FPSTATE))
 		fpsimd_save_kernel_state(current);
 	else
-		fpsimd_save_user_state();
+		fpsimd_save_user_state(true);
 
 	if (test_tsk_thread_flag(next, TIF_KERNEL_FPSTATE)) {
 		fpsimd_flush_cpu_state();
+		fpsimd_kmode_enable_access();
 		fpsimd_load_kernel_state(next);
 	} else {
 		/*
@@ -1561,6 +1572,7 @@ void fpsimd_thread_switch(struct task_struct *next)
 
 		update_tsk_thread_flag(next, TIF_FOREIGN_FPSTATE,
 				       wrong_task || wrong_cpu);
+		fpsimd_kmode_disable_access();
 	}
 }
 
@@ -1654,7 +1666,7 @@ void fpsimd_preserve_current_state(void)
 		return;
 
 	get_cpu_fpsimd_context();
-	fpsimd_save_user_state();
+	fpsimd_save_user_state(false);
 	put_cpu_fpsimd_context();
 }
 
@@ -1747,6 +1759,9 @@ void fpsimd_restore_current_state(void)
 		fpsimd_bind_task_to_cpu();
 	}
 
+	/* Disable access to the FP/SIMD registers until return to userland */
+	fpsimd_kmode_disable_access();
+
 	put_cpu_fpsimd_context();
 }
 
@@ -1793,7 +1808,7 @@ void fpsimd_save_and_flush_current_state(void)
 		return;
 
 	get_cpu_fpsimd_context();
-	fpsimd_save_user_state();
+	fpsimd_save_user_state(false);
 	fpsimd_flush_task_state(current);
 	put_cpu_fpsimd_context();
 }
@@ -1810,7 +1825,7 @@ void fpsimd_save_and_flush_cpu_state(void)
 		return;
 	WARN_ON(preemptible());
 	local_irq_save(flags);
-	fpsimd_save_user_state();
+	fpsimd_save_user_state(false);
 	fpsimd_flush_cpu_state();
 	local_irq_restore(flags);
 }
@@ -1848,7 +1863,7 @@ void kernel_neon_begin(void)
 		BUG_ON(IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq());
 		fpsimd_save_kernel_state(current);
 	} else {
-		fpsimd_save_user_state();
+		fpsimd_save_user_state(true);
 
 		/*
 		 * Set the thread flag so that the kernel mode FPSIMD state
@@ -1869,6 +1884,9 @@ void kernel_neon_begin(void)
 		 */
 		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
 			set_thread_flag(TIF_KERNEL_FPSTATE);
+
+		/* Allow use of FP/SIMD until kernel_neon_end() is called */
+		fpsimd_kmode_enable_access();
 	}
 
 	/* Invalidate any task state remaining in the fpsimd regs: */
@@ -1900,8 +1918,10 @@ void kernel_neon_end(void)
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq() &&
 	    test_thread_flag(TIF_KERNEL_FPSTATE))
 		fpsimd_load_kernel_state(current);
-	else
+	else {
 		clear_thread_flag(TIF_KERNEL_FPSTATE);
+		fpsimd_kmode_disable_access();
+	}
 }
 EXPORT_SYMBOL_GPL(kernel_neon_end);
 
@@ -1939,6 +1959,8 @@ void __efi_fpsimd_begin(void)
 	if (may_use_simd()) {
 		kernel_neon_begin();
 	} else {
+		fpsimd_kmode_enable_access();
+
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
@@ -2020,6 +2042,7 @@ void __efi_fpsimd_end(void)
 		}
 
 		efi_fpsimd_state_used = false;
+		fpsimd_kmode_disable_access();
 	}
 }
 
@@ -2076,9 +2099,8 @@ static inline void fpsimd_hotplug_init(void) { }
 
 void cpu_enable_fpsimd(const struct arm64_cpu_capabilities *__always_unused p)
 {
-	unsigned long enable = CPACR_EL1_FPEN_EL1EN | CPACR_EL1_FPEN_EL0EN;
-	write_sysreg(read_sysreg(CPACR_EL1) | enable, CPACR_EL1);
-	isb();
+	if (!fpsimd_kmode_strict())
+		cpacr_enable_fpsimd();
 }
 
 /*
-- 
2.51.0.618.g983fd99d29-goog


