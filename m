Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=; b=T/l4ezRBextsHxXz46fUEevT/H
	ZV/thqSLI7UiSCCQQ1riaP4niHUCscMJOEz+VVM5JpuHiuCFyMjC2P2eKgSMZYaEzbimvtqMbv6z5
	yX4Pc+AWtO54SSp97+wjqhIyxbbFeEdzTZCOZLykSjy+HyuZa5lyBUvb+VBWb5JN2Rp5JfoATlWY8
	4fgUJdaCfquzgjg92thm++v38buAZwQJnc1iwlJUbJk0Cze5+Wyh2CBvSUrpFEFxeoYVUv7BVW0wG
	9RVCCteWaLMhO57iyB0NXAk1Lz+9VGijiG0Y4782MQATYMRkV/vMtYgG4dudfBcz/BjF+zbkC3L1U
	l9SVdVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBCe-00000007EXA-0vbK;
	Wed, 12 Feb 2025 11:46:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApz-000000079hF-0mTt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=; b=UVYLqkT0WCW/Xiadm/RDt0xgTU
	75oam2RAbjEnnfOrYjYMDeYlKFkDM9/wAr0t4mz5ood4YZWNgEXLWQ3PhZu7LSMhFLORVSBLFFnRI
	O2HSeqg4ojn+UJQ8TMsN1WedIs/YMuuev5X7IECTqXeor6y96mvVdrwO/wrzJ0nLzd88IQGWcwzzH
	YwdS2Q6Zu8nQc3aJcNw9exrU6jAOfTeLuU6kADCk4cCsQaRsKYLaQFSqa2Ubd7XNQ7JYFYnUMxdmb
	3+pXFn6babDEx27KYhs3tFkF6Lj/7Xlft27SWqEnYYqOSCi7lThfRfoTPVirqieqbefFhS5bZbwU0
	BY8v1PPg==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApw-00000000no4-0sJy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:26 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30738a717ffso58894451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359402; x=1739964202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=;
        b=nJXEZmEF5fpp1JThWtd+EpFmxpX6H4y1yoCMsSkYV9BeKyzrKIL9NJp4cTRLe5VaTd
         4sE06IjttFwhmjX8ab34UlLBDmhPpk2V21f0Yce8fm/RQRB4pic+iNx1gfPY2joxprJs
         dXb9A2KAzu8Fu3X2CTpppAmZn1tqClQJSBa528/NynKgKaHUY8ObQxnipzv8fKOCxMdh
         1RIoWq/JmD6tAMIl6lTFE+2M7V/JeOTNDF7FqjYQmY2cS9Mc83kDa0SnWVy/afN7/8As
         Ups4ClBPvQlxCwxLJmGlbV0jBfUvvuVQ1l8+kOz0lIZ9O5KDzUaBvRlrMIJ7gabRkOir
         /18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359402; x=1739964202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=;
        b=mpzazbZ0Wf6Y6O7ZsI6OTsqkHH3I6Rah24QwP/s6PlW9F8XBl0h2Y3R5AfAFOM853G
         EcMMIBVZk3V6JYGM07jUvUaYKsZeJGm72JxrMYn1E+LsNHJgpDola0DkFLYmXH9nxSwq
         ht7A+cZasMwcT053bvzdgVv3j9LpYUhCa3ErzL0uWgrdiUzr6B7XSYSH+k6riHIQjQMM
         MkbGBAW6v75tTcpMLBy6PCIiUV4jh5LxVLh5qj9Zx1u71ZZpGJwTzkQFfkEkl72DQ9gV
         4g3h7b5rRZ+FBIP3uhs1H/Y3Z12y/8DYSC+f3VhPKjqPzdvlWYLxtHcs7XIIq5TzW7a1
         fdng==
X-Gm-Message-State: AOJu0YxoUmzMgtqIkXeFtjN95tj4fFXqBrYeQCY8qArwuoyLNopE3o1o
	+3Yrh+5jCAk1m8nipXEJ4vIYQbg1N0w0yyue7DsmjlIxCkTKNBCXPn/JQqwbC+c=
X-Gm-Gg: ASbGncv7ro9dIr3nexabEpZt/MqjUWUYJMEx8QIcfQx93TlFypWqIVIHmltc6QyNiFU
	FYARlE+K/T2zgjNdYvckrHs2U/IODtEvjPDj5bKU+nQT5xx2UPAHawJ+Jc3ehw9rM1vqw+VwATi
	gv1i3gpQipsq1qVPVKgQarlhd+B4DKL4hBoEc0CWzvsFiMjcjP/TqnakP0if97zlLBCYNhFLTHC
	2LzWKFF0wT096M3oUrnUBD/8DPkXvHyRB1LTAcoPvPnELAyR/2rG6bWBlsa/ROIX8ppTadvtY9I
	VYQQR9Ot9WIvFv4eG+JLDcmcmQ==
X-Google-Smtp-Source: AGHT+IE0MOK5A4Hgs6x7f54TlSM9Gy9GRZ5jq57qtCi8sQldGDST9iVi2gYFwCJT4+05NjX+kZxcDQ==
X-Received: by 2002:a2e:a909:0:b0:307:e302:a34 with SMTP id 38308e7fff4ca-3090500af87mr9903901fa.20.1739359401620;
        Wed, 12 Feb 2025 03:23:21 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:09 +0100
Subject: [PATCH v4 15/31] ARM: entry: Separate call path for syscall SWI
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-15-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_112324_553542_434D4DC6 
X-CRM114-Status: GOOD (  18.66  )
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

The syscalls (SWIs, software interrupts) are deviating from how
any other interrupts are handled as they enable the IRQs again
while processing the syscall, while "hard" IRQs disable all
interrupts until they are handled.

Break out syscall_enter_from_user_mode() into its own function
and call it instead of irqentry_enter_from_user_mode().

As we are moving toward generic entry, we use the signature
from the generic function.

As the generic function requires the syscall number to be
determined, we move the call down below the code that
figures out the syscall number, the only practical effect
should be that interrupts are re-enabled a few instructions
later.

As we move the trace_hardirqs_on/off() calls into C, we can
just get rid of the helper macro usr_entry_enter again and
call asm_irqentry_enter_from_user_mode directly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  1 +
 arch/arm/kernel/entry-armv.S   | 16 ++++------------
 arch/arm/kernel/entry-common.S | 18 +++++++++++++-----
 arch/arm/kernel/entry.c        | 14 ++++++++++++++
 4 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index e26f369375ca3cf762f92fb499657a666b223ca2..e259b074caef75c7f777b18199623f07bebee5b4 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -8,6 +8,7 @@ struct pt_regs;
  * These are copies of generic entry headers so we can transition
  * to generic entry once they are semantically equivalent.
  */
+long syscall_enter_from_user_mode(struct pt_regs *regs, long);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index c71110126fc105fc6ac2d6cb0f5f399b4c8b1548..6edf362ab1e1035dafebf6fb7c55db71462c1eae 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -403,14 +403,6 @@ ENDPROC(__fiq_abt)
 	zero_fp
 	.endm
 
-	/* Called after usr_entry for everything except FIQ */
-	.macro	usr_entry_enter
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-	asm_irqentry_enter_from_user_mode save = 0
-	.endm
-
 	.macro	kuser_cmpxchg_check
 #if !defined(CONFIG_CPU_32v6K) && defined(CONFIG_KUSER_HELPERS)
 #ifndef CONFIG_MMU
@@ -430,7 +422,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -441,7 +433,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -455,7 +447,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -480,7 +472,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
-	usr_entry_enter
+	asm_irqentry_enter_from_user_mode save = 0
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index ff1dd3169346f3770cad6b7e218f5d74ffc646fe..14b2495cae3c2f95b0dfecd849b4e16ec143dbe9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -109,8 +109,6 @@ ENTRY(ret_to_user_from_irq)
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-	asm_trace_hardirqs_on save = 0
-
 	asm_irqentry_exit_to_user_mode save = 0
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
@@ -189,9 +187,6 @@ ENTRY(vector_swi)
 	reload_current r10, ip
 	zero_fp
 	alignment_trap r10, ip, cr_alignment
-	asm_trace_hardirqs_on save=0
-	enable_irq_notrace
-	asm_irqentry_enter_from_user_mode save = 0
 
 	/*
 	 * Get the system call number.
@@ -256,6 +251,19 @@ ENTRY(vector_swi)
 #else
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
+
+	/*
+	 * Calling out to C to be careful to save and restore registers.
+	 * This call could modify the syscall number. scno is r7 so we
+	 * do not save and restore r7.
+	 */
+	mov	r0, sp				@ regs
+	mov	r1, scno
+	push	{r4 - r6, r8 - r10, lr}
+	bl	syscall_enter_from_user_mode
+	pop	{r4 - r6, r8 - r10, lr}
+	mov	scno, r0
+
 	mov	r1, sp				@ put regs into r1
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 8b2e8ea66c1376759d6c0c14aad8728895b3ff1e..1973947c7ad753fccd694b3ef334fba1326f58b6 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,15 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
 #include <linux/context_tracking.h>
+#include <linux/irqflags.h>
+
+long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
+{
+	trace_hardirqs_on();
+	local_irq_enable();
+	/* This context tracking call has inverse naming */
+	user_exit_callable();
+
+	/* This will optionally be modified later */
+	return syscall;
+}
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_off();
 	/* This context tracking call has inverse naming */
 	user_exit_callable();
 }
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
 }

-- 
2.48.1


