Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89807C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=; b=cpsT5RDPu4UzbZbiZt9sfHETkI
	w98Pw+COijkHYhED6Lk2++nSO8/nHWyiUIFYoAhS8T3Cqf0sQvkGjY1cFrkVZV7Zgn5PgxNvqt9qi
	iZCiT2ICxuqcOq/3E/MhQArqe6b7lQxNGXMdrUp4mPrR4VzK6D2TqsZATTmjCNZIdfsoHKNJ5Hjcy
	56XbBYjG+hCLL8Njr82j3wqBH//EsUt14VVqqHg8khvrNi3wf8GSF4gEg/YG555Zd6GMv60YjKc7G
	20PzBxlGxSsSTHEEVvt+eBpsXlP0v5FIyE7KAB+L+iwFUZ+LHv2RgZl1rjnDC7i+QnwrSpGS0eam1
	MJw6WtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsRx-0000000Gt1P-1ofG;
	Tue, 25 Feb 2025 10:46:05 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrez-0000000Ghmm-0NWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so48187631fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477327; x=1741082127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=;
        b=LQ6g5KnekaTGixcMorl0H5d5lAtszkDRsen0MbFmhf/a+imd5dmMkL4/9kZIFOgDUK
         2EThOrr2WFzgVtvC6pLDm9EH1ppivqWUnmxSD4xCLQYQpOomEJoHu+1AsuivbtxVIr+C
         wvAG6Bxg9Wj+5KP1LQJCTvTFp7yO2E2YCU1kwX88xv9f1XJYDf1npJAC2QyyAkXrKI50
         /Y3Y63DFM2bazs4CRyH8Rj/6+scoU95AZXXR0ff4oT9mHMFy33v3s/EE8MCKWv5cDJGM
         J48f+VnCGjqQzh7IxZcrKmbyDIVQvWdYJtLuY02vjcobPx81wvzUa7N+qALOAtvzR1YW
         vCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477327; x=1741082127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1th+DnYZSKT2go08vz+Ftvr7FlZ7mKXRvbFUdOlbPI=;
        b=lUsAdzL9dRnfWLf+QLZV/67J8jEvMMlAyPMDfVsr5Vu8AvZ869nLgVHMi+U/FRCfmE
         HKj/kUiJ9+KzWNLYL4hMd5B0UUUDVA2T13+YjuRJfXI3zNCwgOL/8EPQMJFJ3YgsEmgn
         y8DovnHe54knvujZExhRvOoUjfXx5fwFAvz35zI+fkEQehQmZas2bljQW82wQcyhqIC0
         uVdeG4o0qK8Z8hNfdop2OAtLgyqFbqcPKEygeFxsNXpRIGQ3TA4YL0XttHXectRTckpe
         RhzPiF8szW/RCLTwvD6XcVQrOlizSyPg3O8SNp9n/TryGMDEX/F7QPuZ7lecV2kATf18
         1M2g==
X-Gm-Message-State: AOJu0YxJ2vm516wpMyqwFP68hEyD4ysQ11ACfaBCkzbA0XREXcwQWw9P
	x1xDunHzpZFNitOgEo+qsTJwzPCUfRJXZ0fUtXQp4SsZyaYOt7wQ0FflzzkhZAM=
X-Gm-Gg: ASbGncv0emyCXX9rzzR829WPwpdQKpALggXDpaK6hfDFS1SdWpNC+UZtzGSN07ao4Yk
	GEQiZl8OewkvjSGFIOxw6ecVNUF/GupuXTIZXmdd4ghbF661QHJ2cdr09MyBL+OWB0xI8tlmBB9
	HmCTAZU3mkqQS2MfmgIMXPbzRYNwJI88Ajd8wXbQr9FFwuv88CsvcmNG64x9qMBDiqqSLZFMM8G
	2DR/wTwfVor0cTTqpfYc4Ss00q7OCM36HkfQNTLJ/+XbSgVXBWHj4pZR8BJKoxUVUnCtU4fmMPW
	T2VSsThEJLwypRHAywOuGpbuIUvaI2HyUWwb
X-Google-Smtp-Source: AGHT+IFJojS9YcdzZoZZ2a4fWY6El/OS+wlvMSzdOOSRtg7jEpLZV7xetDwt8bSZ007hZm6HmPnT8g==
X-Received: by 2002:a05:6512:3b86:b0:545:fad:a747 with SMTP id 2adb3069b0e04-54838ee28e2mr6423382e87.5.1740477327533;
        Tue, 25 Feb 2025 01:55:27 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:11 +0100
Subject: [PATCH v5 24/31] ARM: entry: Complete syscall and IRQ transition
 to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-24-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015529_135002_50DC180E 
X-CRM114-Status: GOOD (  17.36  )
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


