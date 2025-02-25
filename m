Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC4EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=; b=VLj7X+BPlxFLRklPYVZM8x9+Sb
	YnrKuJWMKRdcur6kKg0ebAOK4xypvqYte1jjJI7BhWkQ8tz2ts5jkf8Ln24rnyJdGpWXqHtHMeK/0
	i6LXhhuYPOmYSVFcJXHwnFD6mlJq+qSaCij/v4Ga/Dl5/cWjn7lQHoPq/8JlKp7ZY25IQlnVcDQfY
	uGaHM8H47OFN9NJjNLHRD+IKhSCI/DBK11NGyaC8oorMFZ34bFbGhKZkU1vb/+82oCkRPzQ+c8ziV
	7mtc5Gs+V3zS2ZkMGw/e6be0VIdn+jjrG58v6gXv2i2bwm+nPKTRurNeJ3sTfGNY8g1x39YvzaTVq
	xbZCoiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsEF-0000000Gq7p-0Jqd;
	Tue, 25 Feb 2025 10:31:55 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreo-0000000GhhS-2bEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso6455959e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477317; x=1741082117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=;
        b=qMk87P8xVbfYbOKaRg8U0iu3WsAN+w6kqIQhDLeLPc7zeONcSrXEw1ChYGxAGn2mkS
         lugkXbEAVCnWMzGKmGgCGFnHDeH132+HUktZSKPmpIdyiQ+Gg1LMwzFAYhANjpJohTRx
         lknM0iNSkACQy1jtKZiStbXNCdmkxG6TqFq7MuUFpUcJ+qThAbglE5wTQFRAWemwHkvW
         5CaWmz1S/4hnIdlUxCgyz4q5fR/DQ4UAIgzvH4dnfn0ZVs7aN9nTL5y+LldsszmltGqx
         AzmmQpGRuOWPO1+0vPezSfB4yTbjkj3UAIlfnN+npGL5vmF4gjgcm4Sglsz/MVddY2LS
         J3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477317; x=1741082117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l4jcdIT0+K6QMNd0VK8RPhMVALn2TkHG1rRCOsPTks=;
        b=aFrjKlaj3hNtwaDHFxWw2eLtwwelOuWrrBHhUi6IB4DlaxL95HgCJBhvpHbGQx+fSN
         QxJIo1KFO+ArLJG6UF6vVTMyZjUV4IpvQxvmqsfT7qKcTYswwlzO7x7DfQguUKkX6eU0
         atKFio918n9/NpbDB+WA/C0JD9ncOgFp63C2yhCTzhPnRpFa1k0QXqi2mr+s8QiDI1vP
         R+87CGKu8K6blOzWYEKPY2OmEWg2cpU6Ckn7j0L0otKTPw3umxaTHV/6wf/CF1oPTr6n
         sTlIu65yJXr8B+b74KFYTuaiEmfUZEx3SWDr7iDABscuLAfV+Awuuood8Jc4yyxeuVaL
         QtcA==
X-Gm-Message-State: AOJu0YyGI8EMMZHjkLY1fZhwjIzcCn0vE4+sXKyWRETl9Le0B+3idxy4
	NiCPoi3y7OhsMz/jTPkllpvNIEbiAlJegBpgGdvJLuhMTAktfz1S2/D+HAKb2Ok=
X-Gm-Gg: ASbGncuqKNCBW7KxbwnxU+zmYJjwZuK00gX4K6GBOJH7XAyMiy41ioPDjPuDUIHojos
	JOR9H20IDMZyyZNTUFnvAgIs9cGVv0Wiv4CQCGAKFQm7dR9HeCI5yANhgfVH3NLZwzn16eKruIz
	wSkoPXqQSlusrZp+RKpGFCxLpDKkplBhqZEO+DQEx/Dayfc4vS/0UUnYdk6kWvTEdB1XQJgdwNl
	XcpnBEyc+vqqxRDtpFZQ/6cKBAUyJOxOvNXjPQe7vn/Yzoklzk8gJMv+7ryApr2MOHVtEW/C0/+
	6Lkh/tM6822yLpDTIYnX3iHoPCDqt8EE9yoe
X-Google-Smtp-Source: AGHT+IHtmonsQI8mjfkxDPF9rkkwlOMD+FnaR5UIKDlAt4SXZ1OQl3Nrl9JuRZs/P07o5ZESbealNQ==
X-Received: by 2002:a05:6512:b98:b0:545:16fe:536a with SMTP id 2adb3069b0e04-548391452a9mr7078517e87.31.1740477317024;
        Tue, 25 Feb 2025 01:55:17 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:02 +0100
Subject: [PATCH v5 15/31] ARM: entry: Separate call path for syscall SWI
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-15-2f02313653e5@linaro.org>
References: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
In-Reply-To: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015518_694523_B9AD9A5B 
X-CRM114-Status: GOOD (  18.88  )
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


