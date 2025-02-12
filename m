Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300D3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=; b=2A/nKa8vyebVqpYRzK9l/nFriI
	BqVeGfROve0YhGSJNWuX0LAHSUeGi7GANb0S7XMazUS8eEOR55CutBgnHZ0ISf8haa3czinVhyTiV
	VvWy2quw6eMbNbUZUvRGqr+N84wWaMboLNYloOiAN20yZwWFHLWmHwzGTiR/D631mh+EOuycFAE/t
	aJWZJcbBuuVuV/JmPOjE075LNkH7SJqINak70QPyB9pX1AH+Vv/I0R0IRFOLTsUUtoZhSHg9ruCXa
	6o0RwFkDuXLgLVa1vqnwmn+xZBJ5xSyRTw12Y+5lZesWV7CSJiJY4LAPDWhwohQdGJDzAFVAbcEQJ
	F/Eq/Umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBIC-00000007Fuv-0eL2;
	Wed, 12 Feb 2025 11:52:36 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq0-000000079iA-42GF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:30 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308f141518cso31075111fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359407; x=1739964207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=;
        b=HBgBQ2EFvoJ+HkjmGM09CvJAYiEIr55mirwt33914rQX+aDNG2dg+86CSs0eAQ+tiF
         G0AE83RUEXsAvDRtBmStXHKj4VpkzM5VSjJLrXgaaxsyleeIMMR4VKzktbbiVrtuZ9oe
         AAgvNbaaK0llEwtCS1BYwK2ZYuLWB4I292OWYsT9RuewVhsrh9bdwtgTUkKPgk0HWAiX
         uBigA5ZYhgJz5EdoHGFEcZEPwVNWdKdeujpm2apL4vsZygfNbI57Sh+ZV7Zo1JPme1Qq
         vajGsIpL2CUxKZRFiODMAZ8pCdQX33BwefsJaSsev6/snQSkkSW11OX3AfHIq5tf5YLt
         lM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359407; x=1739964207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=;
        b=skpwdSFY3W8xi/hnRfYAg+46phtM+9IR+JmQfuPLV7vwCcKhZV7qArb+1MF3Sjxc59
         5LF0NgaKQs+Nvpsq1M9Zi928MXV1ZSiXHofhJuSI0YnN7u9jWuHjVg1nmRkLQAZGPSZT
         5VkYUuHm9WJME8anmWQnk4X6pmyzyzSWBtOpfYsY6xnypWmswBKw9lCl+hyNYPxROmCc
         kbLrNb3MLsBn2QfMPAiI2V2oc0EumY7acm4P1TG9NgOQQa9SfM5dAcbHwZIO62HIkxLw
         GbYcmOz8GoZpk286L4+qBnC6DeAecsonX6en+ZVYMxMa/hLcXicNyUm/IO46d0tV49fL
         0VxQ==
X-Gm-Message-State: AOJu0YxMrtBluyVUjr83R0YRc15pfakmwBB//FiQqsv+CuiuRJIwYQHz
	4uugUbTZGB7m0z2feMgB5g4BAfbm6FJ4oGxPCEndghy010SZAHMGAhPhwz+U7kg=
X-Gm-Gg: ASbGncsbAKklcWxtB6NNd49FMVm7N8nvrpMjXmkaKN8trZZ3d/bLnNVdoOIEvZatVNH
	Sz7EgPdWG1/BB35J7UGjqexLr8Eha2CjsiguxcCW0bC2/SHaWMFGhDAc/0tCTOiig30HUh0+OyK
	EASM95+v0cpZD2ljUsZ1w+bxcDg1HTVdC56LXCylYYXVjKSxbYr2wnojBukZRhWUmceg2F14y3j
	e1xbkI8bPMlDh0KEaId+WjQCthEl32p4Mgsuhhy1H+W36rh7gjMbWLplC9rWjIG/v0JZLncf7y7
	xJ+g9RrWI0WRBpkzwWqRaG5kzA==
X-Google-Smtp-Source: AGHT+IHQpMybVh2UGY3q+b/5gNXwdYp/Tf5GyuWxuwv3bDkab39Fdfp6CaiE28gYUS4P0fFCrwjZ/A==
X-Received: by 2002:a05:651c:1991:b0:2ff:c3a2:f408 with SMTP id 38308e7fff4ca-30904fe65b4mr8430881fa.12.1739359406796;
        Wed, 12 Feb 2025 03:23:26 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:14 +0100
Subject: [PATCH v4 20/31] ARM: entry: Untangle ret_fast_syscall/to_user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-20-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032329_041096_B67741C4 
X-CRM114-Status: GOOD (  12.10  )
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

The return to userspace is a bit hard to follow. To prepare
the ground for further refactorings we rewrite the functions
to ret_fast_syscall and ret_to_user are mostly stand-alone
symbols.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index d27e34d7e97a079d62e7b778cf7cf97c302e4763..ece9215717143427de7572a18a6dbe620a9193e9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -44,20 +44,23 @@ ret_fast_syscall:
 	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
-	beq	no_work_pending
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Slower path - fall through to work_pending */
+	beq	2f
 
 	tst	r1, #_TIF_SYSCALL_WORK
-	beq	slow_work_pending
+	beq	1f
+
 	b	ret_to_user
 
-slow_work_pending:
-	mov	r0, sp				@ 'regs'
+1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending
-	b	no_work_pending
+
+2:	asm_irqentry_exit_to_user_mode
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -74,7 +77,9 @@ ENTRY(ret_to_user)
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
-	bne	slow_work_pending
+	beq	no_work_pending
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
 no_work_pending:
 	asm_irqentry_exit_to_user_mode
 

-- 
2.48.1


