Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF934CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1ta9KttEF8sJmGrgUmmN67wbPwjz6EsYqXVUKnq6iI=; b=kFbuYx5b6POvAZA5RhCW+k7/Wg
	HReKN/zG1RHxNcDtgw6L9do8d+NCXxTniK1ST8D9jq/8O4RQboo5t+pPied6h8g4nFAJlJeU5ZhBo
	gdDwPoZQtNWp+aOpTwGsXPV5mdrVWvGKVC3n5qLtdIlG3Qj0A51udBjRk/wcH0r8RouoUHSqOEjrG
	uQj7f2QQu5vIn9ckFePkd9PJBlKOflBBHurcQtFfxpYWBu+UbPUnmTVliyKJNaO16ijEd51IbStnc
	Pd0Gyp1RwkszDHFzegMXMvqOxKDQuQj5D2xrKMv9wH21ocnow98GunkGjkwCGCY+Y7GwsHleOTZEn
	+/bbFSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fs-0000000GRCY-2Ro4;
	Thu, 18 Sep 2025 06:36:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fa-0000000GQyC-3VxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:15 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45f2b9b99f0so3076065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177373; x=1758782173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1ta9KttEF8sJmGrgUmmN67wbPwjz6EsYqXVUKnq6iI=;
        b=loOBS+yzsiYkT6h+xyiC8BltFhvqqANeYsCBL6eN3x0mWuJZejmkQ3FfUnv49uxJQf
         TYbjrE9avAnvCYsEMSxLPSo1f36twh8awTeVorqhMFLg7pfVjCsdqzPG3glSmsyTR2QZ
         q6bO2ie2GWDsAnL5mC+I0tLBRB396/9AimflRAfnloEzp0GhEiPBE8SElOCvWqEwn0jV
         humlnIixzEearLLVmc9gOTeWtY0Yba0ESNni9psSfX0eOz8NJbkrCo5vHfK+olQ//r0m
         FJC7KkjXquKJqH+SUvx/zQMSUOs+Rqu+H5hWQPzLena5voW7s4Yp+hFr5tmJkNsuEIWS
         0Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177373; x=1758782173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1ta9KttEF8sJmGrgUmmN67wbPwjz6EsYqXVUKnq6iI=;
        b=rVdMKqxGZRNyvJnU0dUAniTaBirBt+yxGepx9t3i0AXVWsspHtR/e8hEgUsj9ll5wv
         vfAoiF3hmbIsPQegcr86PhfvaM521ph/5WCwG8fLSG/evc6ATlH5zlHEGVJA8qMpFjQ5
         UkwQM9hI6XE9++/Y19n29xsLGA1/vu2Qn008EwFmoPGVQBMjlVszL/U7EhxuNLVuKlCT
         Su1z+5PviFmnxim3mjg4dDuIR+Gl7aRQ/r6lJgLEwYDhJDE+4pr3fKkEbdqDGyKtzWR5
         rLfFLI7mw+uGk2GztUJxGwEQly5ti/UBJP+4y/g2HiMVqRrgzvijWltX8Gev9F0TDv4Q
         DfSQ==
X-Gm-Message-State: AOJu0Yyqv2FmBs4hMwulX2mYDHn7LV/xvf5WwsaiC4nDnRv7tLNhO5bm
	+juUvTiyctrDbDHYv7jFZD7C0IS2zPLWsEUTTq+qYzCW6+L+rswhQJxb0WsQO9ER0FsaAtplZji
	b7T7ZY5EdGlymz20ZCMPy2Ycu+9Jsxw/26SwzQNLaK7tx8MLO1hEZL5cxHT+EHf0M2ELXKXfAYM
	BuVUYOdu479BtwZQn9/o5AkoJoiYDB0fXoPfzuanX8nkaS
X-Google-Smtp-Source: AGHT+IHwDdNQKSpulh2BKmpGNYTuQzvpQWSRjIlrRJfiSKNGg3YFQhrNwINDqw6AqWcxEWBgOnrglZXe
X-Received: from wmbhc26.prod.google.com ([2002:a05:600c:871a:b0:45f:2859:5428])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0d7:b0:45b:9b9f:88cb
 with SMTP id 5b1f17b1804b1-464fdf4425emr15559625e9.16.1758177372848; Wed, 17
 Sep 2025 23:36:12 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:45 +0200
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5265; i=ardb@kernel.org;
 h=from:subject; bh=Dk5FXoMF39rDUZtpDj8iIP76qecw7z+7kErWyEtMPzo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0CufThftPBJ5ss7Q590bVUEs2Ter/i0lV+lcLvH5sO
 OEvxvmxo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExE8A0jQ1dfScM10ctyTn+n
 ty7RPK65fneCi7xyrPjMkFVnk3OWVDH8r2H2uPotW6BoL8e7uzOTizP+SbnZ3nFqrFr5/s6HEP6 VLAA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-12-ardb+git@google.com>
Subject: [PATCH 5/5] arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_233614_920948_56CDD3DF 
X-CRM114-Status: GOOD (  26.79  )
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
in non-trivial bloat of task_struct, and the resulting memory overhead
may impact performance on systems with many processes.

This allocation is only used if the task is scheduled out or interrupted
by a softirq while using the FP/SIMD unit in kernel mode, and given that
calls to kernel_neon_begin() and kernel_neon_end() are now guaranteed to
originate from the same lexical scope, it is possible to transparently
allocate this buffer on the caller's stack instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/neon.h      |  4 +--
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/kernel/fpsimd.c         | 26 ++++++++++++++------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
index 4e24f1058b55..acaac98ff449 100644
--- a/arch/arm64/include/asm/neon.h
+++ b/arch/arm64/include/asm/neon.h
@@ -13,10 +13,10 @@
 
 #define cpu_has_neon()		system_supports_fpsimd()
 
-void __kernel_neon_begin(void);
+void __kernel_neon_begin(struct user_fpsimd_state *);
 void __kernel_neon_end(void);
 
-#define kernel_neon_begin()	do { __kernel_neon_begin()
+#define kernel_neon_begin()	do { __kernel_neon_begin(&(struct user_fpsimd_state){})
 #define kernel_neon_end()	__kernel_neon_end(); } while (0)
 
 #endif /* ! __ASM_NEON_H */
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 61d62bfd5a7b..226e635c53d9 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -172,7 +172,7 @@ struct thread_struct {
 	unsigned long		fault_code;	/* ESR_EL1 value */
 	struct debug_info	debug;		/* debugging */
 
-	struct user_fpsimd_state	kernel_fpsimd_state;
+	struct user_fpsimd_state	*kernel_fpsimd_state;
 	unsigned int			kernel_fpsimd_cpu;
 #ifdef CONFIG_ARM64_PTR_AUTH
 	struct ptrauth_keys_user	keys_user;
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index d7eb073d1366..919c53a26484 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1488,21 +1488,23 @@ static void fpsimd_load_kernel_state(struct task_struct *task)
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
@@ -1773,6 +1775,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
 void fpsimd_flush_task_state(struct task_struct *t)
 {
 	t->thread.fpsimd_cpu = NR_CPUS;
+	t->thread.kernel_fpsimd_state = NULL;
 	/*
 	 * If we don't support fpsimd, bail out after we have
 	 * reset the fpsimd_cpu for this task and clear the
@@ -1833,7 +1836,7 @@ void fpsimd_save_and_flush_cpu_state(void)
  * The caller may freely use the FPSIMD registers until kernel_neon_end() is
  * called.
  */
-void __kernel_neon_begin(void)
+void __kernel_neon_begin(struct user_fpsimd_state *s)
 {
 	if (WARN_ON(!system_supports_fpsimd()))
 		return;
@@ -1849,6 +1852,13 @@ void __kernel_neon_begin(void)
 	} else {
 		fpsimd_save_user_state();
 
+		/*
+		 * Record the caller provided buffer as the kernel mode FP/SIMD
+		 * buffer for this task, so that the state can be preserved and
+		 * restored on a context switch.
+		 */
+		current->thread.kernel_fpsimd_state = s;
+
 		/*
 		 * Set the thread flag so that the kernel mode FPSIMD state
 		 * will be context switched along with the rest of the task
@@ -1899,8 +1909,8 @@ void __kernel_neon_end(void)
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq() &&
 	    test_thread_flag(TIF_KERNEL_FPSTATE))
 		fpsimd_load_kernel_state(current);
-	else
-		clear_thread_flag(TIF_KERNEL_FPSTATE);
+	else if (test_and_clear_thread_flag(TIF_KERNEL_FPSTATE))
+		current->thread.kernel_fpsimd_state = NULL;
 }
 EXPORT_SYMBOL_GPL(__kernel_neon_end);
 
@@ -1936,7 +1946,7 @@ void __efi_fpsimd_begin(void)
 	WARN_ON(preemptible());
 
 	if (may_use_simd()) {
-		__kernel_neon_begin();
+		__kernel_neon_begin(&efi_fpsimd_state);
 	} else {
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
-- 
2.51.0.384.g4c02a37b29-goog


