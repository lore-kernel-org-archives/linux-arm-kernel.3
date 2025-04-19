Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014DC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ2CAOyyO+hXIbzI5viafcwpFofTGSFRrqZLvi/3aBA=; b=1l65r5g048S69JZxb0T5ZU8PXS
	bnz7LRLPXUSvLHrAgAm5ovQvLtxKIv65afkcGH4GLMIOa3X5uoYorodNh6qqgczkuqWsbxD4M8grc
	pCAoVQNH0rE7qwNL9XU22ONOiq9UiJ0uhGhWOW9RyUItJD6dc65a/NnfQ4HR5Ni49ShA/ogtLvEen
	uwfw1XDOsaNjg4Mu8fZ66/h1L9gD3FGYb/mR8Kbru2qo/FBYnbSZ+X9tZimKi8l9sfVge2cHte6na
	dOIQ6OxQz58J0cUmVaUFGvuj7NNt0+mS51SHpcCcAHMQEzYPeKQuBGhzMqOU7EbU9IG/nuIeYOLs4
	aH+waq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HMR-00000001wMR-45SS;
	Sat, 19 Apr 2025 23:12:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnO-00000001sog-085Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54d65eb26b2so2640722e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102180; x=1745706980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2CAOyyO+hXIbzI5viafcwpFofTGSFRrqZLvi/3aBA=;
        b=MrmiQQdbwUSGwaC5bSy+REKvRPtKaikYs5PFUeOcx4p89IcYQjTrOMQMEeY7Kvy4g2
         2d30R/GZl800vO+SsArQvdcMIOTyqi66sIX46D1IGao+GVDO7EdeZhbp3iu4ZI+EEDuA
         HETzKU/JjImkhiyq5toC8AJEgEhvAtKC6333uRGGj+vsqAkCwt3O3SxhW9AXR0VHTySB
         n9FhSsEFOfaTzjukPe1CjotO8dIQAOsfgtNotKAEZNCToMhEKqgBFqLDEQE6ROJ77tnE
         vFkQGgpvm9HcBWBUjFgN+FyC6U9CbhHIL1QJrBzFvWpqVj8Ta4Rwg8CIRoneszDrklMg
         VWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102180; x=1745706980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ2CAOyyO+hXIbzI5viafcwpFofTGSFRrqZLvi/3aBA=;
        b=dJlPm02QqbUU00Gw+Y2FCxlDWBwKdaLLJDReyGciQXovQuYS72ztYVI8d3912Lgcso
         Wi8/998hGfysf/ujgz/hsJ1DbNwZq7F8lb5z+pICdHHZQV00s6XDLpeq9j4cE9RxT3Fh
         dvdz9A4kOqx2nZkEKrjaadZcTxXvM/woan3PERMjQiL6ybVhRgwX7bURR2seH/BTmjPT
         PT/MuW4derugsdMksLd374mkcW0IlEugucjZR41rv2fuQD2PG6ZdujV8PMPfC38JPRtu
         kEPjDYn+BEVa/TCIxO8yrpwgKT0ir/An0kah0fHwjBAWleXbmQHcN8AnKnYXiZX+Bkso
         vZAg==
X-Gm-Message-State: AOJu0YxjJ4G21/KIu5JCzIM1kW7v+0FsLcKhjHMhIZWI2RTQK79ZCRlZ
	IexvNqwzdmXc7Lh83Bi52w6fe7vCpWBPwWWlJWFeDoYhq9XMClBU/83ePo6Gyus=
X-Gm-Gg: ASbGncviaOh1tXoW8vmwFepuN0PFSRbK04aN0T0O3rd5rwsbD9DfPj1cjveAV6v/k7W
	t217980fUSxbzI/n0tl43uS2xUQycVw+3Fjw3fgwiwx9knNthersAqp2t5celYCxczZSHHnBL7G
	SRSb2f2p2CxNpnHPwKU7gax+4GbuznBtfERLf2sAFLtKP8aTF1gEomDcnYA60ssz4Pgju1L6V1A
	Zx0KPx20jW2FUWe5xAxc7dQ8k87aD/k1w0gVvjGMtqPTBcp07Yo6aCxxR2NqVRp8VWUJ/bUwG83
	aDjKCPNq5loWYR513timcJ6KUUIkLOticiXlXtgCQHEVFNJE3FI=
X-Google-Smtp-Source: AGHT+IFy8jjdgLjfaCOyW2gFGBs7/pfMPh1k6HYrKZA70Zav8DUkJktP7H7VAxHF4ELxWlpTqUqLsg==
X-Received: by 2002:a05:6512:12d0:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-54d6e62b86amr1840188e87.13.1745102180032;
        Sat, 19 Apr 2025 15:36:20 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:05 +0200
Subject: [PATCH v6 18/31] ARM: entry: Drop the superfast ret_fast_syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-18-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153622_073137_BA590CD1 
X-CRM114-Status: GOOD (  15.56  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


