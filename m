Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63536C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=; b=kKfQldru6gI/hDlzbmrHdn+f+r
	Ax4MOGk0ueWM09q9Df7TW2vGvZL7UqV9pnvwkwdqniO7f7QnWlsqGOWWzQqMv+hTkH03wOEMYDYCR
	IaqjjnoLPPf7YkIneBZiMu9+gi2UpC8OFmSLm741zTuaFvfmkOyVMlkisNthYK5T3vXTVc2oJr5ZX
	p7aC7FnT3N0dILuS75k7H3LyiqJdPAMdMO0/eWja7i2LWygb2CK1QaQvwT1mS4BV7AKDI+ZJZ9Ceg
	fA42B39opacx90zXuIFlp2vtiFUVDondwPtCcxI+AZ2XC8oNKgc3SO/bZ5wCdDC0uTpiR4afgBPTK
	x2J7wHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsIp-0000000Gr7h-0Rsv;
	Tue, 25 Feb 2025 10:36:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmres-0000000Ghjq-1e6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5461a485a72so5229579e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477321; x=1741082121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=;
        b=nGoSM2+aRxdbfDH472hF5AQfLPU/6YlO27v5LW0vFR410XiNug09TNAEFLfAZHGwrO
         Go6szEtwXe2cwdB0kk2TXBxpuUFFHu1EbR6CzBF+4mRHSEBxVhgkMnyY5/LVVWRCc00/
         aEktKOOE8dLqmq6xDbOf+Ennh87dgdeqrmH57pgLPy034/Bksy/P6tt1SNlVOh22VbIk
         0Gg7w7ncN4Sx97+fJOStlqzH+Brcz92o8D7H1OFlpmT75THHW5D6Py7npbhh4n1g+eCS
         OyWDdw+2TfogSxUKsfr+RXw9qtvc8OFMDrVi9SwcCcNZlnOhHEGwoqQ24n5zdGh82W/2
         aFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477321; x=1741082121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=;
        b=Myq81uFLrbz9m3WyVCF3fWbLfwZkdGx1lTCYrb9yTq5yvRgm7Hwr1vNNxXfOTmGs6c
         vO/FkTSmenipciOU5KoLrYxE/ZABu7ccyqeyTBqo3tL4F5RjC1mXNFTiDDQkvH6I1Nms
         RhglfvVwUn3KUP2J7My3GmZeJMb5/kjqVxXmlLWsbt8NIQPJD5haf4p1HbC9UwSruXuW
         MX3MciHe8BOblQYo3fEKwjkap6tMb94MK83blbF6Jn5hwI3Y3Z4oQkrqoLAR88TwcuEq
         saIsVONKu38HzS6pFqRJYEU5ebXaNjaHq++MohWb/nOq3r3+VLJaf+OJtuIaE0g3NVA5
         prDg==
X-Gm-Message-State: AOJu0Yz581U85oxXut6eXCstiuK8SPbjXBxZ/HFp0vtr6LXjTIuRvc/9
	gal/lC0HOIOzgvBwaW1XlZwiKKeYUfNUfF8S9StKjBQf4W/0Qm9z+oMvOF3pPb0=
X-Gm-Gg: ASbGncvQqbYbW6OIkl5GbqUa+fUzSTThDVSZM0psci13alie1LaLCc/VTgWyBcgh+Fi
	aPx9XFdKpmy5uiSJzovKMJ/v14UpknO5niiOhE6TewtEIbA0jeFi6SlM+1eB2hxbvXPojN9YtNQ
	/NGnYfMEMXIYSDi1/gyfmvx6OKrddIVEMg2Edd0JXjxl7qFjNY1cJs9BvyEHl5xFKvC6OkH6n19
	Bxf3wxHjnegVre+/Kcy4tDOAYeuk38VyAF87ISqQ9Go+lanbQupbkRt5xH2rXRdQ4tt1smuARGr
	YNlwHv128RMkpi9GAzy1WirdmSBZ0EDGvUyb
X-Google-Smtp-Source: AGHT+IE7t84m4BCM4TmWOCmFQFqdsr7GUqDmKXu9j93tWoANi+DXx582k3Ij4BI18U0vfQc//0bwWQ==
X-Received: by 2002:a05:6512:3186:b0:545:f9c:a80f with SMTP id 2adb3069b0e04-54838edd978mr5618553e87.1.1740477320805;
        Tue, 25 Feb 2025 01:55:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:05 +0100
Subject: [PATCH v5 18/31] ARM: entry: Drop the superfast ret_fast_syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-18-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015522_437566_08C24CF7 
X-CRM114-Status: GOOD (  14.82  )
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

When not using any irqflags tracing, context tracking or rseq
debugging, the ARM kernel uses a "superfast" ret_fast_syscall
with a very few assembly instructions.

With generic entry, such local optimizations are not really
possible, we need to call C unconditionally and take the
(hopefully small) overhead.

With generic entry in C, most of the tracing (etc) calls are
replaced by stubs and optimized out by the compiler.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 3559e0a9f5e079f1af91392bf000d39f9b45906c..dddbd6ba1eb9fcbc2c0d81f24e1a9b3231558d7f 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -30,34 +30,8 @@ saved_pc	.req	lr
 
 	.section .entry.text,"ax",%progbits
 	.align	5
-#if !(IS_ENABLED(CONFIG_TRACE_IRQFLAGS) || IS_ENABLED(CONFIG_CONTEXT_TRACKING_USER) || \
-	IS_ENABLED(CONFIG_DEBUG_RSEQ))
 /*
- * This is the fast syscall return path.  We do as little as possible here,
- * such as avoiding writing r0 to the stack.  We only use this path if we
- * have tracing, context tracking and rseq debug disabled - the overheads
- * from those features make this path too inefficient.
- */
-ret_fast_syscall:
- UNWIND(.fnstart	)
- UNWIND(.cantunwind	)
-	disable_irq_notrace			@ disable interrupts
-	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
-	movs	r1, r1, lsl #16
-	bne	fast_work_pending
-
-	restore_user_regs fast = 0, offset = S_OFF
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Ok, we need to do extra processing, enter the slow path. */
-fast_work_pending:
-	add	sp, sp, #(S_R0 + S_OFF)
-	/* fall through to work_pending */
-#else
-/*
- * The "replacement" ret_fast_syscall for when tracing, context tracking,
- * or rseq debug is enabled.  As we will need to call out to some C functions,
+ * As we will need to call out to some C functions,
  * we save r0 first to avoid needing to save registers around each C function
  * call.
  */
@@ -75,7 +49,6 @@ ret_fast_syscall:
 ENDPROC(ret_fast_syscall)
 
 	/* Slower path - fall through to work_pending */
-#endif
 
 	tst	r1, #_TIF_SYSCALL_WORK
 	beq	slow_work_pending

-- 
2.48.1


