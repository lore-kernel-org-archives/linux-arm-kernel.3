Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1863BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1XNfcXLPxTuycG48FvJ57h34RR7WVga1h96zHJSpsk=; b=opHrXaeZIsmlxX8hdfJYiWBZ/7
	0Y+fOVjhypdjREhLXkPFSVAhptdN1Iok6YlT2Wf6xYVm0en+IzqY/Bgo3TcZN0Yg0ZGQtdZJoZLnp
	FlpOL9wcoiTfp4cO+b823SblXZolxyFeWURVX+wbGzwnXpi4f1m01n2YWtCnstP1Pa29f1jzXntJw
	e/QjMYiAa371rjYMzhdGn3k1uEoVLi77N668Ig7cA4Qoh80R5UeC/hjIetUn6Q2EzgcBbfBiCY+s8
	q7v0e1kHOnA0kGHOfl0pM/wlW85bzYHg3hG2Jxe4zCQJLrziV35K2Z9XspJJ1f/4KVLt0Hw2ALa/a
	lv0AudRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zu-00000008zbY-4777;
	Wed, 01 Oct 2025 21:04:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zt-00000008zXn-2pye
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x1XNfcXLPxTuycG48FvJ57h34RR7WVga1h96zHJSpsk=; b=FYGwCjVrlsP9IlIKp3FTuI4c+D
	QVA/yGhSlDzWbiVQivwtCctlbyvyj54SW5hjbjNs7F9HL9o2+bLLH8tC2YhcYA93ZGVOlzjCrsNR9
	zeo3wOSZs+sa+eCTg9isp19wlFXEfBrLwaAa0uHa3I3WgCDVVDT5TKFAxhODs0VswkQZE/m645anw
	mpbMW722PINAO929Q0QFYJb5um5EYRCvgPhgQo83YncRP4TrSxZawQazt7dZ/b59AYYD4+ej+P1yO
	/c7xXQq8lNWq70pVBHsYOrWUdzpWjX8rSiUSG14cSju8E1egPesjhELZzDGdC8aAX9NJ8nZcIqTCj
	yn/IZsEw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zn-0000000DoSW-2jjS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e4cc8ed76so727075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352654; x=1759957454; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1XNfcXLPxTuycG48FvJ57h34RR7WVga1h96zHJSpsk=;
        b=XIMiyvZZAoUjqV+56hW96T1MPRj8c/kJ5EsPwvR0DSDAlWvLf2ION+FlBR1A9iYrCk
         o20x5fq6J1QuTwbJ8paM8Spcu3Jt+9mYupz0Vf7J2I+ox3YJH9WMRW0wy6oVGv1q+xfr
         6X+rr749/DwPHMACOVATkcaChYO6RsaEe/HAh90Fg9lR5AUTHkQw4Vl1JblOxRC+0bfJ
         ZN8rOZTKJC5R3L4MzhPBd9RMkhabTJGNDoIqUOxFgMXrYr//RSnWOwKV0+06jR90GO+1
         YXVtsfE1GkELBUUBPyGDHCDjiyamhWc5H8iGmE6MfQT5kIykm7esRW59iFMUZ1b3KVm7
         DsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352654; x=1759957454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1XNfcXLPxTuycG48FvJ57h34RR7WVga1h96zHJSpsk=;
        b=diWafIR7u/zY//v7uneyX9XxjuU7J+1di7nEiKWojF+Y4KdsXw7Ga+U3I0zoO20jWN
         dp9O8gj3zs2BBOlC/baFv43kL/HTBsaAIRxcEs88iJo7/V5vBsn7M5NkVlCfg9CRKOCY
         GxOFmGPd/xKA9KaQVV9OZ9GnJd8xvWDVQj9COQFINjaRa6VkticWmC2dYJn7eG2xPJIM
         SM+1umya80iI9ej/zgUOQtS/Fn739wOy4Y4qZ127UBFZsVRFoTBwZ6qAuKLmMz98qBOE
         E6BC3bUa3uZQhoC6VZ8M4+gfd6JHzJUhVyBuiJjyuzXEG0BBOnFKF9Yk4/QdOyjNCFAM
         5NsA==
X-Gm-Message-State: AOJu0YzC6SfTQ1bzdl2gq/4MmORNUTLZ7Xa3dub42mKQyZQJLLK89CaL
	s4GDdvMfDsipjFxTO8mvT6dWVP2ISSEOrDrtY19PEIsIwu0oOzCRCdg9K6BkqvJv6Oj6qlaU56d
	XAD8lwG5XKZZ8GSX68P0VEqC6noO2TF+8kQYYfYhlhKbYoj3npJkPHM6dUrynfFk8D2t26kE/eD
	Y8rk9Nac7YiCvtVZKCTrGBNXi3r2YKBV67C8MyxEpK5BoK
X-Google-Smtp-Source: AGHT+IF4pAXl5Kz4VKrEzIr4Pw9yb2GP5tMgq1HmwMabQ5THhboAs0iCENwI8BZUxUuDCIiW3R3H9LbE
X-Received: from wmbh26.prod.google.com ([2002:a05:600c:a11a:b0:45d:cfa4:ce0d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d0:b0:46e:1d8d:cfa2
 with SMTP id 5b1f17b1804b1-46e612bab92mr36541765e9.20.1759352654487; Wed, 01
 Oct 2025 14:04:14 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:22 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6908; i=ardb@kernel.org;
 h=from:subject; bh=AKLCnRRN0mrxopEXea8EITSSalYE601b/mp0OMxmCUA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudPllFx24g4Qqp876JueqIbU3bdpm9jenXldn3VCqc
 7xwoXx6RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI/3JGhpfBSQwSSv8eLPfY
 NFdq3fNCmQ7XN/e1mDiza847V+1/8Izhn2WKrPTZCa8PqC/9+8/01/oEz/e2W6NvM6rtUG1RPc+ VwAIA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-42-ardb+git@google.com>
Subject: [PATCH v2 20/20] arm64/fpsimd: Allocate kernel mode FP/SIMD buffers
 on the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220421_901537_EAE34029 
X-CRM114-Status: GOOD (  29.57  )
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
by a softirq while using the FP/SIMD unit in kernel mode, and so it is
possible to transparently allocate this buffer on the caller's stack
instead.

So tweak the 'ksimd' scoped guard implementation so that a stack buffer
is allocated and passed to both kernel_neon_begin() and
kernel_neon_end(), and record it in the task struct. Passing the address
to both functions, and checking the addresses for consistency ensures
that callers of the updated bare begin/end API use it in a manner that
is consistent with the new context switch semantics.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/neon.h      |  4 +--
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/include/asm/simd.h      |  7 ++--
 arch/arm64/kernel/fpsimd.c         | 34 +++++++++++++-------
 4 files changed, 31 insertions(+), 16 deletions(-)

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
index 4f8d677b73ee..93bca4d454d7 100644
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
index c37f02d7194e..ea9192a180aa 100644
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
-void kernel_neon_begin(void)
+void kernel_neon_begin(struct user_fpsimd_state *s)
 {
 	if (WARN_ON(!system_supports_fpsimd()))
 		return;
@@ -1866,8 +1869,16 @@ void kernel_neon_begin(void)
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
+			if (cmpxchg(&current->thread.kernel_fpsimd_state, NULL, s))
+				BUG();
 			set_thread_flag(TIF_KERNEL_FPSTATE);
+		}
 	}
 
 	/* Invalidate any task state remaining in the fpsimd regs: */
@@ -1886,7 +1897,7 @@ EXPORT_SYMBOL_GPL(kernel_neon_begin);
  * The caller must not use the FPSIMD registers after this function is called,
  * unless kernel_neon_begin() is called again in the meantime.
  */
-void kernel_neon_end(void)
+void kernel_neon_end(struct user_fpsimd_state *s)
 {
 	if (!system_supports_fpsimd())
 		return;
@@ -1899,8 +1910,9 @@ void kernel_neon_end(void)
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq() &&
 	    test_thread_flag(TIF_KERNEL_FPSTATE))
 		fpsimd_load_kernel_state(current);
-	else
-		clear_thread_flag(TIF_KERNEL_FPSTATE);
+	else if (test_and_clear_thread_flag(TIF_KERNEL_FPSTATE))
+		if (cmpxchg(&current->thread.kernel_fpsimd_state, s, NULL) != s)
+			BUG();
 }
 EXPORT_SYMBOL_GPL(kernel_neon_end);
 
@@ -1936,7 +1948,7 @@ void __efi_fpsimd_begin(void)
 	WARN_ON(preemptible());
 
 	if (may_use_simd()) {
-		kernel_neon_begin();
+		kernel_neon_begin(&efi_fpsimd_state);
 	} else {
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
@@ -1985,7 +1997,7 @@ void __efi_fpsimd_end(void)
 		return;
 
 	if (!efi_fpsimd_state_used) {
-		kernel_neon_end();
+		kernel_neon_end(&efi_fpsimd_state);
 	} else {
 		if (system_supports_sve() && efi_sve_state_used) {
 			bool ffr = true;
-- 
2.51.0.618.g983fd99d29-goog


