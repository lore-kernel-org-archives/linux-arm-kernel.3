Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C1CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNGuHvTHhzfhTH3CopTS+hOuzXjJxItcv+TieblAYlA=; b=u02jyBYe93mP95uOeBhLqniWb8
	BRQcg26VEPUOZ3DPBxloLh+LErQnYyh5kRmNBnXI9XcBCRoOZBd1bEELubeptcHuEYBKskjrGajfk
	U/+8Zw4h3tIc+zoPRB6fFXb7jTp6FNddQvqoDF6Z4qLKwOm3doCK+I54QO1kaJvwisaj84et5geF+
	VOxOSRREpD2i6leYTTxhSlMYC+b2/l9nLLPzBdgRwd3E41eDjdlRzwKdJFB+GINGPe3mTJXodkmTl
	21JMVEfKYKwNIwVhEZ5G/kc9VXvynCAlkZ+DVYb96V1ZXy2H7Zku8eLIg6eXpiWxbMXyiPpVTuEj0
	nWPmYBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Rc-00000004G1E-2QvW;
	Tue, 07 Jan 2025 10:04:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65w-00000004AVM-23ru
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:54 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so26641454a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242911; x=1736847711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNGuHvTHhzfhTH3CopTS+hOuzXjJxItcv+TieblAYlA=;
        b=f5MrURz2fCsrDfyYZPzbyWnCYdld+B0+vwu2OxWIfkZQtDpBrTA0jfvhT8pRZy4Zz3
         tRGhE5oOvmwDWXw2RaB6YB1kjC2YGyoHvz0TW/sKQTcf/r87/tnRTKZonU/5X0JFLrWF
         ayKqKZx62XTDDD+CqwDQLEXcfUdrSzNBjDtcocqddJbXGxixonTQ1VwIxS61t2HpT0ib
         c05N430ncmuAIQC67mBVnXK2PuZp939CFf7vgjQu0pSCGGUWAX7LCJpqsJYZxzH7wFmL
         gYiSoF34xa3g43mJ9/7ElivHQaKYhRJdhaQ8txJQOveF/pqCfg1sTf+TMW/tOYi+lvwv
         WX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242911; x=1736847711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNGuHvTHhzfhTH3CopTS+hOuzXjJxItcv+TieblAYlA=;
        b=Q7tpJ+u2/RfzrH1i0jcvDgzD8sRJLHmpKm8jZcyfrvIphnbU6TlNCKGcGbReEwLkYS
         FnVXYbGJTtTsfERxHd/mtcGgFYNtMoTlKa0r4kSimDLPAVoPiAv9bF7keJYy/wUsyuQv
         1pvRAOBb3/tgXAd6vHvCuVJnolwBu5yJ+8XDbVwuzX9XANvwQiy+JEb6gwNA6en8/1lr
         nWL+ymtJdadHVlCn0Z0bd9p47qijhVklVwqWDBz07xis7mgRoLnXRSW71TrtH3V0iQBE
         pVlfLuTo8oZD4NlwDdFlfwkqJh/cjOOLM3/8AxEJhiSepBW25GM7fhUl6U5mkoWuz4hg
         A3lQ==
X-Gm-Message-State: AOJu0YybHEipmf2h1paINoXbHYzkskpizyLU7X6YXaDQZ93G/DWekQ8f
	Kqv7dX8z0CuX6ySMnvzXHllPuSbDocdgXfgUQcBHkxkWJL14ni0CmDY7Fo1gc5E=
X-Gm-Gg: ASbGncs2eNvEqCfuQbMtS1Jn5vDrfVA572zkZZ2ICJUsrronypYrZlPFLnWEGA+OgwB
	4FAYCQBdTL0cI0nSgd4u1RiAQxFUFOR6jJgVOd8aDMgqgh3Gcq9LMx7vMd/AcKMY4BXmIJ4DuED
	R1xDtiT60ddNpy53lI9/UwC8SWXfE/o6pO3eqFaAlqCQfzpHvsz7dh+CpY8VhNs0Qh5Uk+Cilxj
	wuVqgJM+tXPhNR22CffXKLdxKra4VrPYQe6SX70dIeCQZLgVPHetZYHRfKDRzRVSjw=
X-Google-Smtp-Source: AGHT+IFxRx1Uu23VD6LIatzdS+l1ndVVhhtxHZ732JbaJpgqK/hVhhr7XB86kAmbVwbbNYxk+Vt9bw==
X-Received: by 2002:a17:907:7291:b0:aae:e784:55c5 with SMTP id a640c23a62f3a-aaee7846124mr3788329666b.33.1736242910656;
        Tue, 07 Jan 2025 01:41:50 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:34 +0100
Subject: [PATCH RFC v3 18/30] ARM: entry: Drop the superfast
 ret_fast_syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-18-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014152_533523_C5E49130 
X-CRM114-Status: GOOD (  14.56  )
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
2.47.1


