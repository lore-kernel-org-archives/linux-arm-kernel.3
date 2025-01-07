Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fSpPlBqZE2GxPZ8aqxBgZ4u22dj0xDyR7PMf5d8jHM=; b=RoZThgQo+61T6qRZfCvi1agKc6
	NqeFMq4RGRG8mBL0erTvR35/tZqddTo4D93O2qaoqIzTCJ8OSiazYYq2bPywWbOrBYSv++08/9c2c
	5bYdtd/SBCFfORQ5MbPP0wEo5/BvYl8tOXoW5tJokTGck0l1kBWU9aTkd8NuxLnvo0sOP81MZQkC0
	c5bXPKx2dntyL1QynphE5keeMMAmxcuSPw0a6HY04XJEOa5BV1fkp1jKMKcKe0OjrxIDgA4/jRqIR
	uG1D1Jm9PPMKC0sOq9RXSu30AIzfe1HAZQPkDhB3pPk5R1/OjlNFBdwjvPa5UZ7PfIgU6J6+fVnKP
	wC5xRkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Ya-00000004HX9-0M5o;
	Tue, 07 Jan 2025 10:11:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV662-00000004AZK-1QYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:05 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so26641631a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242917; x=1736847717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fSpPlBqZE2GxPZ8aqxBgZ4u22dj0xDyR7PMf5d8jHM=;
        b=U8tAgFJyVcFvE2Jfw8uXGV379bRHzHOM5pk7Tfs00hD1dTaOFNfkSjZJkExsdaCi1E
         0clVv+ZsR5p7guxvM+SPb0JXpxGVdXxxUSOVbSKuePL5rJOW+/v4cb0Cfl1g+AJ+O9JO
         6sy4WP/wHl6ZAVFP7NDo9icUttwxU3/Cwq14adxFIc9upmu51z2CWPoRgyvaLbgDbrZ2
         3ZywQFkTQkgCw0sCvMJuFil3MACytoprINEO4Ebyxa0QzF9hWmXWfwpMH4k/h4hLpBCi
         DYOcf4sQJpC9esISnIT2Req+QIEY24MF0LUUtocTjoVVEILHyv0mWwN7pTFm4eZpsg9f
         xqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242917; x=1736847717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fSpPlBqZE2GxPZ8aqxBgZ4u22dj0xDyR7PMf5d8jHM=;
        b=LVhVe9+bshnnuKArgYvAdNyJBfQy9bUBLsK4v70e85YUjkaPSsxxeSfAXEGGLZfo7s
         D8qiAyVcqCwaEh1HdILRpLaRmLqHjG3wPEP4sUyaXe4IhF/gmLFcssCNjsVF0KpZTnKJ
         EHe3zk8vMQNSdHPpp2wHXo0MP22AvOf+lgHL+rfrLlGSStmpcHJ3/6gZGMu6uKsTHnMe
         fiVl5kSmoxb7RHCxE26mJB3RfcveTQleGAgaZimRa7GG1hiy1FJ+q+4HWKhNIwwTyS0G
         5YceDJmcE7Y6ppV8/IIcJGV66MzHTELtmCs8UKrnus99Hy3RllDEFxb9zTee3deFq9em
         4JBg==
X-Gm-Message-State: AOJu0Yyvukf7BgglAvpbWA+Fqk/DctUskTVwDkozFHlRd+JOMSpUXSvz
	vJnMmGQqAF1HuxrrdMCwFfBIrPos/OKykZW8/IZwYRIE3SSoA8ZPkSa7SQaPk08=
X-Gm-Gg: ASbGncth+GHnF6386OXKsWChVsWEKKRS9JoNOqjDY15A25KBAskejeJwcRM36RizUHq
	ih/duiVFwcnQjXLM1+B2W+GXkGlNYosYPFLhJoriYnxNTecmj8KH4HNL/obhrsKe431fgVtGBYm
	rBKgxIveuEs8gxvymJIsUmYefO8OIS3uIhzSxwv/xlkY5hxabcPs+2hGHNclXVxNjuijSCAJ7/u
	MdNkerlXSzbW6MhW1IAEjSqu5+WPk8d/ogNoahLm38I2BaspS6WnKruA8dVq/cu42g=
X-Google-Smtp-Source: AGHT+IH/dI1PxCW+yp4QARSJfd4dkKI+h1pdEwCvQ+1RIosRFpfUhuopq0xYZv8q0GQqsFrKty0/6A==
X-Received: by 2002:a17:907:96a7:b0:aa6:3223:19e6 with SMTP id a640c23a62f3a-aac345fabc9mr4954124166b.60.1736242916794;
        Tue, 07 Jan 2025 01:41:56 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:39 +0100
Subject: [PATCH RFC v3 23/30] ARM: entry: Stop exiting syscalls like IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-23-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014158_382834_B7B9A0A2 
X-CRM114-Status: GOOD (  14.87  )
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

The syscalls are issued as software interrupts, and to this point
they were sharing code with the other exception handlers, but
this does not work with generic entry.

Make syscall_exit_to_user_mode do what irqentry_exit_to_user_mode
does at it's tail, and drop the invocations of
irqentry_exit_to_user_mode from the syscall path so that these
are now exception-exclusive.

Split ret_to_user and ret_to_user_from_irq into two distinct
execution paths.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 ++++++++++++--
 arch/arm/kernel/entry.c        |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 5385574c4339714f3d8b5ab6894f27466b89f932..e2ac6d3216b6828d948d60c424ff95ccdad12331 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,7 +42,6 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -62,6 +61,18 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
+	ldr	r1, [tsk, #TI_FLAGS]
+	movs	r1, r1, lsl #16
+	beq	1f
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
+1:
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ENDPROC(ret_to_user)
+
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
@@ -76,7 +87,6 @@ no_work_pending:
 #endif
 	restore_user_regs
 ENDPROC(ret_to_user_from_irq)
-ENDPROC(ret_to_user)
 
 /*
  * This is how we return from a fork.
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 0e3960844b94b14325eb00ce7dd791b36c43ac3c..88a7a699306ab61153d57333c26266b9161f5466 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -30,6 +30,10 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 	local_irq_disable();
 	if (has_syscall_work(flags))
 		do_work_pending(regs, flags);
+
+	trace_hardirqs_on();
+	/* This context tracking call has inverse naming */
+	user_enter_callable();
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.47.1


