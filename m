Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgjerbaRhix+kd50qFGRKR55bWj7bTqB01M6nHY9FI4=; b=qRKzJCRFTp+yStvRdvMYkFN8S6
	45uRJ5/20KgBsJkDv3E7kz5VbEsmNL6uMtxNBzCJO3dooI1S7buOVafD13GzIdAkOqYiTQXKqVjul
	yTowOf+PClaj7AiEiBUaAqpu7DnadPPUBDbZOzXgXmTNujxLYnODs8FeLbn9X9m6QwFWFocKnAcjC
	5Ac//sbvUbKC2hktNdb5B2kS5Ofwxdv8UVWA5yG34Sl7GlMnYCHWGh0P82hedDPbVBxbnIgboBEa+
	WkzCxvDdJ5uSMJ+CXyZ6tJS3mMhhLj5DmPu5qskkcTpk0IRMv74bTdK0/HxyG2iiUffN6MpW8n8Iy
	v9MS8Jaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6QS-00000004FqH-3gG3;
	Tue, 07 Jan 2025 10:03:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65u-00000004AUR-3jfO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaee0b309adso1866416966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242909; x=1736847709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgjerbaRhix+kd50qFGRKR55bWj7bTqB01M6nHY9FI4=;
        b=eK3SCLcNR27dIvNnsLUq/8tK+VJScfajFKlmeP7mux+SH1KSpWjx3NPQq1Y5Lr+PRN
         YXMrUVr1h4xwA/H8gLd9W+lcE8yTEUof98hhBh/NVnwddQ9rSMK/xiwB3TCsUNwxQ+4M
         idXe4ZsEAwYu34/oTsUfCAYFyPpRCeiUH6aMDPY3B5w3nkEOGxVUs+st/v50shX9Gz7t
         Us0I5BVtgUkaoOGzwBCiI01H3cMotTOouN8YLTr4Zfb16sDUNj3eKwHLBeUzSUedP01u
         Ijr+v0TLDg87+WpgsQ7y0kBp/4nZA63jcDaaEsO/BMD7qjZorQv6QB/9/N8YN0H+uJDG
         PJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242909; x=1736847709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgjerbaRhix+kd50qFGRKR55bWj7bTqB01M6nHY9FI4=;
        b=A3BG0Q9hjX3lUWpB9W17nuCLNWVAw+0XnuMSGmsbBDsst7PsXB2EYMCqEVBIUl1jlw
         nTIvhnzR332PlgyMQDADmJo2W9GU5VgqrJo2lmidb/AKv57Ca9sDHV184v+oROlbilGJ
         3TktgZGet3dwmL1ZqbzmZA9C9/nSQzYaDg3nEduR2SSzRNca7TzicBQi3iewjJYon39x
         dIhItmkxfT8hZxpYAzCEPcuk5lcSoXkwrTPAN/JjycGRaW+egEL4pEdJKRMR4Wn8/jCH
         2MYu7G9VzsjVC+ij3k5yVbbALiDKjHbow/AEa/8COI63Q45B6qF7rDm/FdydisMoQU2E
         st8Q==
X-Gm-Message-State: AOJu0Yw/WalNeHAhesac4SPi3onoHW0BNAP0S8/zVejZcv/88eeGafTA
	hvjGlnaKQ6KDGvrswuzYBg+Tsxflf4LleWnQQFhX3gzMCR2upl98JVk8RS7CWfFyNfN0JPxUdFt
	3sRk=
X-Gm-Gg: ASbGncuENsdGa6nGrTNh8nbOHQJMCYIQY9UntqbvJZd4muO0jR2gmI+VFsTzQrnc890
	9HasS0XRXku89BdkSSgTKvyk8oQcK0q0OlMS9j/DZtdMt1s2qLt1r/OqouJUySHjfwkkP8lS+Q0
	qHlKawgByg+IsagifPhKt7xEplZlQRsWsGqhkporZ+DKiXvfBD8XWw+mFWpdJEKcWKVKoz1Fy1S
	rg2VfbYPoXiGgwG/4ZaX1PvsvxayIYnjsonA67yR08NSrmeXkSaPMG8LqHISJ2HH1s=
X-Google-Smtp-Source: AGHT+IHeBpDVZuVWnjTw8CL4OhJcL4lUdEaCemS7Kwan56Mqu4ixU2+PMFWEVUVxrqr/Ynh4ykgBdA==
X-Received: by 2002:a17:907:3f10:b0:aab:c6d6:62ac with SMTP id a640c23a62f3a-aac26966057mr4407081966b.0.1736242909536;
        Tue, 07 Jan 2025 01:41:49 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:33 +0100
Subject: [PATCH RFC v3 17/30] ARM: entry: Implement
 syscall_exit_to_user_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-17-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014150_945628_7EFF8B2B 
X-CRM114-Status: GOOD (  15.55  )
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
2.47.1


