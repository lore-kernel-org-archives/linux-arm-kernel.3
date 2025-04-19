Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3059C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axbUMXtD4QAuEbBzGSN5WvaY4ne+9NQW3YHW/FPa3uk=; b=EiiuVQqzs+7o4LiKokHb5tW5Vk
	15+/30AvWwcoUbERJiQiO6t19sLhXLlWaCIFOLYDMfT8PQ1uoeCX35EXuYfsqNCVBLh0qcOvdcD3l
	wIdzu54fEQ7MDD4AykT33P55TVvfDg/vkrbCblRLipJ5xSuu8toxJy6JfsDsBpmXJsCP2xs63l9ix
	ExnC+F0wCz85MTxczbqWJEVI54MQPG4qaleYRsv3zEMJHOVjLz4ztlJ9d4NLY/NVEXQkPohaaDDCI
	//skZLS40L5FCkVGwKZFRlbubIXLiDbbpy4bibGONBHGH2lLSMq+h9lY/RK+oKG3+I37CRC3vt/9/
	1PcJiQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HGr-00000001vuo-3ARV;
	Sat, 19 Apr 2025 23:06:49 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnK-00000001sn2-1u9I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:19 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bee278c2aso41053871fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102176; x=1745706976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axbUMXtD4QAuEbBzGSN5WvaY4ne+9NQW3YHW/FPa3uk=;
        b=BsfhYbdoSEEsAhvBoJasFTyi2ZXxmMPKXJlhmlVO2asUaRGOXdYgQahw+SzOpg4LbT
         5JGLz8GYcshNpm7BBpZIJ1bN8iChRgi8zghGEv3Jli6e3DgErDkrUnPM/dHDAGA2xncy
         xB1yhieaZHmMGchJqOnE1fPzzh1qju5S898HNHw2DCmgcYjInQGN/7VIaB0CanLMI6NP
         eQKooeV5tMBK0KLYvSA3DmzpqIKiWm+87bv5lUkLqpQPnMwCFHr8qDIesp7tTTalv8Kb
         PtYIyPeZFCEyHkxAwHmh9PCpB+D/vOZFyaNIfH8dgY1MHOsaS1b5uLLHcf7hd6KTTeRy
         Z/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102176; x=1745706976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axbUMXtD4QAuEbBzGSN5WvaY4ne+9NQW3YHW/FPa3uk=;
        b=vBot4N1TAOJCWioAPiOcpf+rLDlg8vAloRAQOlmXl9n3P9m/alSlV9Snm05z1o2J+L
         j4U6dBcwPb7XdAsOi7s34LZMvn6K8SKG3weAWz6DBd+RTfM/i+h7lNRaT8RVfP4AeGOR
         15whxATIMa/bbn9/cRIjg6nlDesnbengQ0XW8Dt5N5xj3kyeocYJ+OmJBZv2/naLkfaw
         yJLQKwjx6ohYpMH0Zr9zmRzuJ2aUQFz8ER1uPuE6Vaa2aIp6hbhv5OylsVeEMAaKFp27
         d6WydLka4FK1nqE4Cdl5b0B219wHEKThceSs+DhdYBlkLVeT2eX8RpMKbzwjr7e8Bq1q
         x2+g==
X-Gm-Message-State: AOJu0YxAdWJ/FJbqOceE4amWX0ahohRGFceJNoW184pS32Dw3HGzlht6
	v3otJGuH/GSs8yXf2Y5rjyF8JDZBjpx9sdK1qYhfDQF4sJnbwm3qlMaA3BWnlPs=
X-Gm-Gg: ASbGncu5C6Gpg3PbkUpFMmMtkMN8zSIeXMfapvr2NnYaaTuFcry+wDrj9xUEocaNapM
	qK2UQCHCf1upp8Crrp0nXVkXsOjvia5DGHXg8mAiQJcGYX+BRQg28zv1CJU+facejr3bNgUatCj
	6a86GWy0tEtJebVbgw9xuG+jQEUtYk7DwqFDpv4PMW7viFLqqd+EnmBliZMhSOb8EtOlBXKTMNR
	eDAsOdWip6fX5R5h2ClV/WniYjPZdvI3kIbQoFz/988OtYydOzNMekkE2I9pNQaKQnOa/hhYXK5
	ezcRHYWXyucRvbX/1gZkMIvMQkKp9FsxwU3VPpqC3htjH6LlKGk=
X-Google-Smtp-Source: AGHT+IG/IKcgsDHej1eYc5hp+IWsKO7tK5TWYYLushLhkgbkqkm1Az+iUjNzyiAjE2ntG62MjJUEuA==
X-Received: by 2002:ac2:5683:0:b0:549:981a:1eeb with SMTP id 2adb3069b0e04-54d6dbbdbd0mr2520131e87.5.1745102176568;
        Sat, 19 Apr 2025 15:36:16 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:02 +0200
Subject: [PATCH v6 15/31] ARM: entry: Separate call path for syscall SWI
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-15-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153618_509189_A167230A 
X-CRM114-Status: GOOD (  19.52  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


