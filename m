Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1054C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=; b=qDdjyQ+siZuCDHANKppKclUjvV
	WKxQorbzV3Rd1pnweyWSjqt3l/bl4RKPdnt1T8m4MJuhZWIKbh7avqrnIH+8NA0Rhtn/rG2X8QIho
	i1BayIPOpRzsiga/TjesfYhxon2E2Bq6Lt5LxkJq8POpnIFir9EzLpJ9LaDvDQy1Rj2VKiEqPUdxi
	+YQ6sekzreVyIuFHV9XE6jlOHlGTOCTpzZ08HouAvlmzp49OM2E73vAi6om/8oikhk0sE7mmBrm4k
	UpP7afrPcCAepmVUYmKPoVuYrCEtvd3naNAcs3EPz05ywP2wyLjp8/ncW6eDbN147TQa6ygWQoplj
	9dKYdOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsHJ-0000000Gqt8-1vWw;
	Tue, 25 Feb 2025 10:35:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrer-0000000Ghiv-1GOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-545316f80beso4810684e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477320; x=1741082120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=;
        b=GnI4E65fZFyKnp/lpWwHxj3YsuAeKEZ55SeBoz+L43GgpsrlOlRi5zyKVsn1L+C00f
         07eaukAIMjp55PVLvVyxJ+sqhQ70r71WSwGfVwzvpYQXBeocPudFzMYdEstniU4omBPL
         OXkCca8W1ohMSLSLyoSiW5PEKWpGmiXSrQvJpm0g7kBPta3PpS64GPgPkLLJmf82Bnar
         +TG/6ygEshSV8O/UOpRCQpiZciSELnBi1kd9Iz/PBQu6Q332NbxGayEJXp7TaZo+uM1l
         AVDcuNQGIxaTjFUKfR+HpPXGcGuofgF94GJU7qOE4YU85ZmVXfDZOarA8JVWduakChgY
         mmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477320; x=1741082120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=;
        b=CuzLTyf/5YTzNhsytT20GhNcTGaGvz7s0+x+ncGmTMP3OhRQabRFY56Czp5u3LR0su
         lQ3zR7mZbt58pG/1QopVvACGezbWyg9a9yhfl0YQyvqwWAWJMlFR3jSIQVveTuz6tY8H
         D8oDJSuEAWvcuWzfqluJ92pZdWCuQ8Jd+S7pgv/IGerzhtqn7cGxyTrTveNDg4AghGsq
         Swz0377ptkzA7yEAYsFaferyYhl2JxLdMC3htER7nc56QHJ3PEIicPqQWcITVBDnxITW
         yU5RdbuG8ymlQgHOWHOLNKQLCTHN9aYVvJyLABMZRqg/NqOwgF2sOdlLdQDMLIearudh
         q0zA==
X-Gm-Message-State: AOJu0YwtBJghx4ukKWZGNrXNTwHuMaFOxyKITKvuNriXviySdTuq9/yZ
	u0goXYleQJwahsmPJGm3K/2wCW3EUX/aCsuyItDkXCbgGxRCs6FIZaxbAzHvQ1M=
X-Gm-Gg: ASbGncueaJJ6R9ekGzQqSXTBBZBL5GauqG2uDlqxgYTED2W0SwYjbm1wmVPONW7VMS7
	a3rzTFbKwgcmYTXzDnfvgMObXpduyAMipXAGrW/tZgZTP9iZtoL/MhLPKZff9mxLave+OxXMSNL
	r0krcU+rG7Ml4L349/Y70zkExqSpeOl8LiB6WLIQPatudZv9objmoZ8wGoer+K6qygZjI11XBgM
	Wb7NtR69gfb67mW+JbsVMSueNj9m9rVWViZPh6QVoBoAZBd1nrGJuk9iFwzroYRKGOTInWwmEkt
	rNzP6RR6PIurcTmPmF1gjHiZLRdLi24v8hGj
X-Google-Smtp-Source: AGHT+IFQbbLnCCyj6FgNCwGxulDwvPP6jZb6g7kcFOt1Jz/gH3uLa0VdebmCRshYEfTm6zK7LqNLZQ==
X-Received: by 2002:a05:6512:6d0:b0:545:93b:30c3 with SMTP id 2adb3069b0e04-548510cf94emr1053860e87.18.1740477319703;
        Tue, 25 Feb 2025 01:55:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:04 +0100
Subject: [PATCH v5 17/31] ARM: entry: Implement syscall_exit_to_user_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-17-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015521_346609_4EC24777 
X-CRM114-Status: GOOD (  15.60  )
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

Mirroring syscall_enter_from_user_mode() we create the sibling
call syscall_exit_to_user_mode() and start to move some stuff
over from assembly, first the rseq call and the interrupt
disablement.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  1 +
 arch/arm/include/asm/signal.h  |  1 -
 arch/arm/kernel/entry-common.S | 10 ++--------
 arch/arm/kernel/entry.c        |  8 ++++++++
 arch/arm/kernel/signal.c       |  7 -------
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index e259b074caef75c7f777b18199623f07bebee5b4..8b8cc9a1eefbd00dd75d4e344576fc184a413768 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -9,6 +9,7 @@ struct pt_regs;
  * to generic entry once they are semantically equivalent.
  */
 long syscall_enter_from_user_mode(struct pt_regs *regs, long);
+void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 
diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 7acccc96840c8a17744cc3f2894f19d142aba4fd..bb753cd3e29fc54186543c48b2aee7b221301a37 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -23,7 +23,6 @@ typedef struct {
 
 #include <asm/sigcontext.h>
 
-void do_rseq_syscall(struct pt_regs *regs);
 void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
 
 #endif
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index df564388905ee019cd5553f8b37e678da59e3222..3559e0a9f5e079f1af91392bf000d39f9b45906c 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -65,12 +65,9 @@ ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
 	add	sp, sp, #(S_R0 + S_OFF)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
 	beq	no_work_pending
@@ -97,13 +94,10 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 1973947c7ad753fccd694b3ef334fba1326f58b6..47233804733752aef0f2fec6f54badeab18e98d0 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
+#include <linux/rseq.h>
 
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
@@ -14,6 +16,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 	return syscall;
 }
 
+void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	rseq_syscall(regs);
+	local_irq_disable();
+}
+
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	trace_hardirqs_off();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7b1a16e86b236575efdc29cda9b751e8e2a3f64e..03b20637a2e1ca6f327223c9132915a97a9c4697 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -659,13 +659,6 @@ struct page *get_signal_page(void)
 	return page;
 }
 
-#ifdef CONFIG_DEBUG_RSEQ
-asmlinkage void do_rseq_syscall(struct pt_regs *regs)
-{
-	rseq_syscall(regs);
-}
-#endif
-
 /*
  * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
  * changes likely come with new fields that should be added below.

-- 
2.48.1


