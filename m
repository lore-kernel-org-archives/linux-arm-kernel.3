Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC456C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=; b=fyhZFRP4sTR/SU43p2eiq9vrO1
	qWVga170Ydpe2YViz8EpIS7viTg4Qvo+IBv8KdV1I7rkAkTJfMdTbxVTI4z23cq9PkW7pVp3ql8xW
	auWq2RnWiMQkGUlkMwgLMXNBVkyBLR9gU+une1I6FV+BLFOW+cIMQUhqgjgBlxtHmEEJKiFSUyuxr
	USoIGDKEfuu9uehiq5QT7vjqjigKnLotsuYaWy++sqr3frZxlnV+kr20Gl0yju2QzzsRy/fqMvcPs
	61BJWV8rSqDjNHaxzfqB72BUSKji7nwnXsph8SzJTyWUzgPDYjlsHu4UIOVNw+Hl6irWzzbI0BHGY
	yDYi1+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBE1-00000007Elr-46QO;
	Wed, 12 Feb 2025 11:48:17 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApy-000000079hC-3UTR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:28 +0000
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308ee953553so33249531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359405; x=1739964205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=;
        b=HHIrAnVsGi2u6oJVUhesbLtoq0RGsrt7Wz4uxIHb4qhQ4a4O0RUTbEidyIN6mzlIT6
         So3zuHKPJ2BhL6peA59AqHAIbr6Uf5u/IhSP18WCxYztnpxinDXgO44lH/ArkiBOKi4i
         MoO9MpiXlb3paJNeTu4k8ad3PqGsSyib0OWKGLgiw5DkB1JR1VvAYBLXQ53cUeuSU4vs
         MkfaaNisTSZvuJc700OCqWLCgAZaIJjw6TqCdPkVpwIftwht/eDXnGM7gUeiTVzlB3te
         lCd75ymemfvN8PyapHOwEPNkJdqr8xtviO6EYcAO4F1JtaxRkRMirxE0U6H/P81tPMfR
         bjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359405; x=1739964205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kElQgdyrfkPgzICs9KEd5Is5KMXf1IbQ9ph46r/iv/o=;
        b=ZYGPx/WQT6QewcD5muJcvdXQYsoY/wWaoQWIV4oM0C2ysutMwwg6vRspNajHffdqOB
         wlIJur0lIfj66aBTSf1Fj9LZ2qMAv+npUATMeJS+7+3DZk0BJRM+5bXUXzHOckxw1Sg/
         OUomn7R0DeO2H+yqId7nZVI0vkIy4AfJW7BH/lHcNijZlZmlbq+2TIjUh0lQw3w2zlhu
         L6GKHcquK/z7hJ+Ik7eeursnx965O3j01eeEITKh6OOK9d5RLwGczVu6sHaQCHBMAcPI
         7/7p/PMipJw+YHy4Q3E2fMwHI3a3gJxKrUEI15zDu79SCigA+k4r3sXbPrbl6HUjuKFT
         NIoA==
X-Gm-Message-State: AOJu0Yx5XZv5gJKDdve1MKGtphawxIKk7sUE+wcCzfzcb+hR8IFecF8f
	Cs13Z5XVMhiIerT+HcNZgdONKd190Rw6bEKk1aVCe7NB0dHIGAPPGGC76eQ0doI=
X-Gm-Gg: ASbGnctsRTYOm10O/zRpthazuaNKTTFCG4s0BmNliXIZN429dHu9ozJmMPST4KLDhbM
	Cc0FKhmvxH7t1mnevN3Na4fJBhXOKRLBBG+xGE6SVMqHtDMeqL+7rwed2hIAkws7On68fihnaWy
	1DgKab/kitYSCBZv1BkvQa0hXC9RnJb7364QJBBrsNyAq0kIyYViuZim/YAVdGH9WdtpiIbyyBG
	8W89Lnh9jrAta7rNqIj+DlWRHHRcK9kSnfv0etnfOZ3ZEmhmf6gpPhNma8ZDTZmnRLnCMDyPO7w
	1YmzpAloc1e4NJB9pam4A5APTg==
X-Google-Smtp-Source: AGHT+IE/lLojbQa5ylZyujHSAywjLKA0KHvd1gHdqbGhs1YJlJx+LEqW8/3kRM9xKQQzC/5ig+Neww==
X-Received: by 2002:a05:651c:1a0a:b0:308:e587:ca79 with SMTP id 38308e7fff4ca-309037c1998mr10011751fa.11.1739359404686;
        Wed, 12 Feb 2025 03:23:24 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:12 +0100
Subject: [PATCH v4 18/31] ARM: entry: Drop the superfast ret_fast_syscall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-18-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032326_876107_1B7CFBFA 
X-CRM114-Status: GOOD (  14.76  )
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


