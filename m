Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C378D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWToKPY4NC+RvNbtP48N7l0nt4O+1hLmMWZz8WN9xgg=; b=PIE/IzmmizZgLK8gUhcdDZT/2M
	ScZ60hLI3fIkXvehinXrK2M1gNZ5IOKUrLZpEC+37MJ5RBeHWlhB6LbkOK1dQJ8EuxfrrBJuonLmh
	IsMIfZMs2726sDfGMUjr+s+tusaYgTahsSBD382VXmdlH5slOZ0E39ScG44zsEqNQirnluqYPdbV9
	W7KE10uxMeMKqkgrjkhaTv9Hw2/M3EaG4aS6XmoC9TUOO3OBDwabTwpii4JV8hlTIXhl9E7sTm7Cz
	PB57CtoEJiEl6UPkB8S3d4GWYtAdvhUEAyd++S+yUjhP2iWBq/maG51kq1mlOtRKBcHySICJPtsQb
	6WAlYuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kX3-0000000EFmd-2f89;
	Tue, 29 Oct 2024 11:37:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqj-0000000E7QW-1YF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:22 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so55565081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199200; x=1730804000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWToKPY4NC+RvNbtP48N7l0nt4O+1hLmMWZz8WN9xgg=;
        b=xIP+V1WCUpO1GF6uLnA7eY7jzjOEKvkcAOMYwDnYlp8ELo5Lnre7jmjF/EG5B0qZi5
         lzTI38+00WANV4/jqZJZXHs6viFghsZ8oZHGEkvzZ9PJo7KGXtNQYTYb+mQizEHIpT4q
         6+g7dbgTYUsWlGLzlREeSOxCk063of9rrOPOZ/fQEvcAU+mldmRx4R9Afsj/FjjpM8m+
         uUf9yVp58pjydt6h5Ws8n4miPhmo4QhhaaVvC+qTmKbGu+rLiwimnrlFxTki4/io8MFg
         7s48vMGyW8XL52Cp6zPLsNupR+2YrTEml36K9Ffg5067tAWOwCoL7NTowZAXZEH/DD6u
         x+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199200; x=1730804000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWToKPY4NC+RvNbtP48N7l0nt4O+1hLmMWZz8WN9xgg=;
        b=l6woQ1ipdBxOz0j4APQmhbzopCQ31tcU+iVIopPEfbAF+W0sFPzzT+9EgFZGvNgI3A
         1LoJzLkCKYP2BdkmMiqE42U6+MId43DxjQlWzsPvbiKeM2cwx4Dny+hWFJDgzWsjd6aa
         /Wk+HPDSx/p5DNiVrYRAIFLs7XBFTWMFRg/iNPds7b0BoYFKR6viPcA6OVr7sDCwKr6C
         5RyhwENFNjGTzYmRYdeAP56QVorA8kpxX4WpBK3blYv43aLf+v/+zYL7W7rBiJi+wUck
         iWCher2qp+beDJFTNBfXIFMW4ufP9vXvkLLQsu4UQkRou8Ixfl+0L4f+UpoXhFEsdoy9
         CKdA==
X-Gm-Message-State: AOJu0YxThYhaj81KzpbAmyCz+GUYJkdjFB71mbu08N8WQD17I1BSkDpg
	Lmiaf462RUaJMJsfsMzIKhmFB7jxyM4cXnoPds9pe7ccW4sHW16S/mxFbj+hNHw=
X-Google-Smtp-Source: AGHT+IGGG5g/5+zGZjyROy/Yc3vo9dh2CvJXvwozTq1krbIQXNKWoJVtmLAen7EpI2bSFn7YNTEMaA==
X-Received: by 2002:a05:6512:6ce:b0:539:8ee8:749e with SMTP id 2adb3069b0e04-53b491f773dmr589492e87.3.1730199199721;
        Tue, 29 Oct 2024 03:53:19 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:58 +0100
Subject: [PATCH RFC v2 18/28] ARM: entry: Drop the superfast
 ret_fast_syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-18-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_035321_447268_FF7D492B 
X-CRM114-Status: GOOD (  14.62  )
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
index 3559e0a9f5e0..dddbd6ba1eb9 100644
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
2.46.2


