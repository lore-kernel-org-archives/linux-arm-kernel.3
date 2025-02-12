Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCA5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=; b=4FYbrtBIjgNCuJPGg88pJC5mht
	EncIsS2BWefYF3oHTprRUeoX/qsHWl4q7c9Y5eMTHtt/1GLua/PZjTHL0qq7YYGtz6QsbE+NButd9
	3xghwCLgvSfSyjMIX0wuF/hMXsLg3YyBhZIxsyh+17FgP88L7LPJFnwkS5BqKiLeB7J3Gy212HpWf
	DNW6kqAn64xxSLTo5KtOhjTK+yLxzY6Ad/sBYr1l2Goa0GiUtRrZ/LZ7Ip3fSJtW+xY+cT4koKeia
	gETklxseclA45CD049y72UpFSi4oog6sA4lczQZsZsZeE2Z+gJOypxPqwPVN3r0aAUvsRYcYGVmbi
	1VdCZehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBP9-00000007Gw6-3Gmo;
	Wed, 12 Feb 2025 11:59:47 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq4-000000079jQ-39YC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:33 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-308e9ff235bso30051021fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359411; x=1739964211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=;
        b=PKKrkjjYR5/0VKMV87yJhVv1/Oy8aQyD84zACDyYfl/cIdjJKoOi7ipmh/d2EQxAoE
         R0vXVBM7QPguJteas4gJ9umTSV+eD37RLPw5LonZqQDGxMcIK47Y+OticDWml6KJ7T4b
         KXh0De1oExQl/n0Tj2LT9eug1G3ISbS+1PRcj+y3+QAMTkNmV+hXujd3JQAembZfztAK
         zw7ublf0ww3lCnin+zhxdV8il8rs72fRtpNAizZaUUbSco2+0IFpvIa7uAbFNttjv0Ib
         RsB6Dr2nbbVsKMGuD1wyjgkc9EvWXvjCcGFD2S5pC19/y8OYOOofjWWjUEHe8JxbLeRq
         dvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359411; x=1739964211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=;
        b=hY9yvba0i6IPZIshfqw0rSBYRw4B5v51dGSj1AZwKop8hJEnevHCLOh+4A8x5r2V14
         FmQgtzWOYX1P8Hnnag6ETRn+irtI6RjfW4dzX4h61J/ibggroq+8OkZmGD92KNgNB+tn
         rTHeGp1A77ejod53VBP4kMtNkife0O69S9gRDGHo25JXeZzLpw6y6oDjHC+IjGAJGzbw
         dS6YlOIltB+ONbswhJpbxRL5tfK47CNqo+siuc2O5/Gn0qPY/M78gOW9F4yg2pbBFwnd
         CAWQrw4oltzDMyorYI2d9D5GtwZNGEAR4tMwAVgwhQtDZTWnnyF4RJvB8lLY7rgNj86U
         Zu/w==
X-Gm-Message-State: AOJu0YxylacwctMgGKcuZ0an/uCqBAu9KV3g6ZsMewfHf9Yw9uMAfgqk
	dn80AFU8CcxQi29/GBMKUlJAgYG3YEzBELMOuUYtYNLVEoaOyp+qrn+f8N86dvI=
X-Gm-Gg: ASbGncsmXkOutw5/t07p/IKQUnSIdQK0zqt7oQlk2ilI6Xms8hIF6/vF+wJvZKh2Rmv
	xtRoiNopm8zwiJg5txqnAY8Hwu+vT9elc2WvsP5zQ7Oot9Fm5dhT9Oywi+CipuBPfRWhSA67cxI
	yGs8mvaeh84rh8hF/dQvVwPhf04We9cpLmj5DD65NPfl8Ag0Ury4ZZx1hjUh+ecTMAo7CcBPW2a
	JSVQU8KvURRlxDNNII9tsIaGKRjS/2rOdHxI/jjL3KjCphu4trjf3VEesxEOz34kD6Q7kC2bmCl
	w6I/TGQlqqeTyOi1nKH4YaeTVg==
X-Google-Smtp-Source: AGHT+IH0PjnzWpFgj3aInaPvyhRs2W2GlVVhEZ9bNbf1pRiBVZ5r7dcyK4H7rv4O7JS5XNCNKpDFKg==
X-Received: by 2002:a2e:a58a:0:b0:308:fd11:7705 with SMTP id 38308e7fff4ca-3090363079amr11272811fa.2.1739359410842;
        Wed, 12 Feb 2025 03:23:30 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:30 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:18 +0100
Subject: [PATCH v4 24/31] ARM: entry: Complete syscall and IRQ transition
 to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-24-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032332_807301_34FA8F38 
X-CRM114-Status: GOOD (  17.30  )
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

This moves over the last few lines of assembly to C. The
subtle change is that in return to userspace from syscall
(SWI) or interrupt, we need to call do_work_pending()
as soon as the thread flags are != 0, just checking for
work with _TIF_SYSCALL_WORK is not enough (the machine will
freeze if we do that).

This is because do_work_pending() does not just handle
work: it handles _TIF_NEED_RESCHED, _TIF_SIGPENDING,
_TIF_NOTIFY_SIGNAL and _TIF_UPROBE as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 13 +------------
 arch/arm/kernel/entry.c        | 19 +++++++++++++------
 arch/arm/kernel/signal.c       |  3 +--
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index e2ac6d3216b6828d948d60c424ff95ccdad12331..6b0f86786a7d9e656ecbe8c741f2edbcbafd2915 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -61,12 +61,7 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	1f
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-1:
+
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
@@ -74,12 +69,6 @@ ENTRY(ret_to_user)
 ENDPROC(ret_to_user)
 
 ENTRY(ret_to_user_from_irq)
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	no_work_pending
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-no_work_pending:
 	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 88a7a699306ab61153d57333c26266b9161f5466..d7fdb9df33312dd2a914b59512b701748f33b597 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,11 +6,6 @@
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -28,7 +23,11 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 
 	rseq_syscall(regs);
 	local_irq_disable();
-	if (has_syscall_work(flags))
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
 		do_work_pending(regs, flags);
 
 	trace_hardirqs_on();
@@ -45,6 +44,14 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
+		do_work_pending(regs, flags);
 	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 03b20637a2e1ca6f327223c9132915a97a9c4697..a39ee14ec5b70b3738ecef537709326ef1e8217c 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -598,8 +598,7 @@ static void arch_do_signal_or_restart(struct pt_regs *regs)
 	return;
 }
 
-asmlinkage void
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't

-- 
2.48.1


