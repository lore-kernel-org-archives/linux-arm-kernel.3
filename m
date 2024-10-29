Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7AFD2AB23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bckn3YFGIgJxyi6JuzR+D6XCfS8U3/QVQiTYkjNWbHI=; b=fQwZOSU4exf8SFvcyeNAX/7+s9
	C9+eO8p3+PZwUhBBhUjrA6a9ghqX7gWyVyqu98kAhh2KLToe2peVyPJMYVvGyt/SOdyyCIp9+OjOr
	A2+NJVfC7f8Ty0913XC2ostRRP3SAnoPXgELM8NVSERYWBvrMHq6zS8ZwoHSX2jAbAg6qkrd59qXR
	W1xIxo74ItBPCT2GjHMAm4JoKDcYn1L+niWmk+tI0SIa8MQUKoBJqoOiHuTVjsh3rXv6PYTEpe/gd
	vLOqNoulqZKrAKGmFpSVPoeYUSVfQa3VF4PcLGg9ElCPmPFfq8N0zGgXTfD/ddZkSKWee3P/H3Q/k
	cTnGuO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kez-0000000EHAc-0aP9;
	Tue, 29 Oct 2024 11:45:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqr-0000000E7Tz-2gAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e59dadebso6203365e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199208; x=1730804008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bckn3YFGIgJxyi6JuzR+D6XCfS8U3/QVQiTYkjNWbHI=;
        b=PW82LS8bSHt5eNwN72M2LgiNv2tdHowr4sWpKxcNJZEcIgZcv3EyTM+z2uPvtPIXx0
         6AbooLMm1BuQ8DziG4VIJc+iSbXjdJm/VaKmtv5UC/YCr1+QEJdhs7Nkp9l5k7W8WLLo
         s4qH2zPbVaxLEMarpBaSbGzD9gf8A2uEp0oKISgVvs/sXwVyMNW50BG9WP7JKJQlXu1G
         TIB2iarfs1qAiT0bkWaD9KIAya2XjLyaCuf6dDDllh+KXIPDJLHwktElfrIDfGnZrSEK
         2xZFB7lfOReGVO38POtn+bvqX530PphmQLjqDM+vUnhlSmeLJ+2+snBReVgowiOZSOvh
         6LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199208; x=1730804008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bckn3YFGIgJxyi6JuzR+D6XCfS8U3/QVQiTYkjNWbHI=;
        b=cjDIC5PilyRid7E7p7z4rjSaTD7t2tfO/WDMntZZr6CeP6WEy01u08LmBx3wPvdlKi
         B2xljo2H+oAD4YWe9RTR0S/8abTobA+zVNb+JzmuuMpBGIs5EfFkdT8Hjh86W2GZUXBP
         beKj6L6qfiKwuRcESF78sZapu50lPzoRCbJCs9vn+GWgOSUy36bujq4v0vfbeKuyoLYQ
         WsTZPvxVlphd+OwrSmW10dtiw6iNXlSSxHX81+bpZnV6AMdvsn3P2sG69LWqVJFMG0Cw
         T/lbHxusnOhaRZNf2qsK++S3WgSFdZPwThuq+C8T9TzJ2AQcJGOgrro2vAwSM8WYPVQm
         U2PA==
X-Gm-Message-State: AOJu0Yxymyc4fix9Zg7VvpIEqlslFkwTg5gx7CNYW0PHfBx5WYRMCmFL
	OowXFvXmVmkhXrYDS3wPVrgRi3TRyl5LYqIpL05Rba6b5svk6Itb1n9kd+R22ww=
X-Google-Smtp-Source: AGHT+IGgLkurQIqH+LeiVKuUnK882zQSAt0h3jg5bg57JzH8xBIm92K4anGF7sihxb5wM39FF6lmHQ==
X-Received: by 2002:a05:6512:3da3:b0:52e:76d5:9504 with SMTP id 2adb3069b0e04-53b348ec0c6mr5342333e87.3.1730199207896;
        Tue, 29 Oct 2024 03:53:27 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:03 +0100
Subject: [PATCH RFC v2 23/28] ARM: entry: Stop exiting syscalls like IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-23-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035329_738585_ABF5BBB1 
X-CRM114-Status: GOOD (  14.97  )
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
index 5385574c4339..e2ac6d3216b6 100644
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
index 0e3960844b94..88a7a699306a 100644
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
2.46.2


