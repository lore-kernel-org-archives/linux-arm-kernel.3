Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E86FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYkNHQuv+SACgxNERp8CxEKakLXgFnXCL7ekBiageuE=; b=bACB8ejhhbaymWgzPvm/E1CTm4
	T+Yu0ZsRTp77n3pWV41GVJRH5ULol9mkR1+NzxAtgDCs7xJTm++3DvuXgJHLDQ3Xsfqa5ULmVs6Oc
	WjDMcbh81iq/wu2rIJTKThxWbyvBnvaWrZTzJw+bV2WlXtbFJIBr8Lho85WbIE2yhBjuU/r4FhJ/4
	+N0JV+jZ3gGMUtallCphjhXhZcvNWXkFAWknSVN3RkAtqNWPRrN0Q4BQo7WGJQnd1cKprmCWM1GRb
	4e4MSo9XfJvrhLQyx5Zhmq+UDXpwwQGXR1GUKsDXBsUH7eHUaebXv3i+cXYbfqU8nxCuRW6q6rJAR
	0ewW+Cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6XP-00000004HEh-1rxL;
	Tue, 07 Jan 2025 10:10:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV663-00000004AZj-1Tpa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaec111762bso2491465366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242918; x=1736847718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYkNHQuv+SACgxNERp8CxEKakLXgFnXCL7ekBiageuE=;
        b=kikjV6ALzeytR7AyeKXaG2GffuEYppdoxSAUfyEMdUkDjrQMTaFvcCLe+T3SxRPR2z
         btohd0+hd+3z9wx55aQkdvIFM2VH8worEIoFgXT9UoeIEVt9TD4ASwX6E2MyRC0pw3Ki
         bDTKOSPeI69pdtV1T8mZBzcZDb5+WgMNSIAV7kEznF+Ievuh7B6RlRchLwShvFYRMXLE
         LPmHTW8jO+/908HfUtGP6NtF9MP2JuZFuNSVLIus9nmsQEm/unmDywrfattyAZD0JVgk
         7ktRHAFdXnL6T2jV388yiiS3kIpRPfsc4ykQpTCGOxds1oxdj/bWuFsKelfuVplLBqEi
         UXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242918; x=1736847718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYkNHQuv+SACgxNERp8CxEKakLXgFnXCL7ekBiageuE=;
        b=cASyRBSSb7i3YCaajwyFEyPKCfL5cw2Z+eurKCFaF8vEww4gFJklxDsVFnWZlgfB3m
         m3kX/GMsw0RWVmOom+XkF2A7dBXDLl1TUpBbC80XOuozoxxp7G/j81xYt3nFAJKFvxhA
         oYpL0vivitah9r8I5Brot92fD4IqX8BKoxg5BP0LcnU44Kbbi25ZxL2OxeHNStxkXG+P
         kt9GoMZ7TGGsHJxrtIT93GdxsP9Eoa9gAn+Fr5lowXLWTMhLJWAqjxMqE7WOvi2y8lMX
         s+96YD3jECu6XUAcXBKeL44ePKuZ4eKedKkqZ8nC4hKiPolzMfFesiyCYRthsA0Gl5Zk
         ZNjw==
X-Gm-Message-State: AOJu0YzEfgNvZrPNHo8IEQ6ctq0O5rGlNKKcizdjauVr+igSPIkbgcHf
	Xtvx3M9/ohw7bwQZAC4HQrBt411oXi7pXoWn44mISw99rzDfseWSkdncML3wHs4=
X-Gm-Gg: ASbGncvjoKE1BJmPLnEcjSz7gAU2+rdOKL84cnXiApvG67rS1TNPGtfB0VtLZyG6Unf
	NX/FqnqRyZYzZ1VrnKosnhWYzmrJ85Zegz8Sr7jS6aUpjY9T+eMz9vJVnfZXJxKhmQzp2Fex5cM
	6zj1kuRPeArrmUoi7JbI3FzBonWd8hmRai0Ukw5xJSOknemxCnbXC14bea6XIpeKrbsk4jTgVql
	DewFky7fprOMfmw1ZaseCw0z0iP/+8VCat77D3lwa7te6WN/FUv5qAE4qFsUo58tzI=
X-Google-Smtp-Source: AGHT+IGS1h0tqhv8PFF2VyP7s0fGDYjnRN6TwLkjLD1tgNRKoA7OPaiv3ifCCBh2WK52GnioqRk31A==
X-Received: by 2002:a17:907:968a:b0:aab:f014:fc9a with SMTP id a640c23a62f3a-aac2b383cb3mr4464284266b.22.1736242917900;
        Tue, 07 Jan 2025 01:41:57 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:40 +0100
Subject: [PATCH RFC v3 24/30] ARM: entry: Complete syscall and IRQ
 transition to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-24-4e5f3c15db2d@linaro.org>
References: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
In-Reply-To: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014159_394954_6CE94316 
X-CRM114-Status: GOOD (  17.21  )
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
2.47.1


