Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD87C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=; b=LxeQF11l49IV0sZIj1Men8IGlo
	3UpWe497A35JNvuy4S9GEl5PsP5UQLjH8jvjq9QPsV2WfcCtFUP7BMDxZdg35eqArulhYf6AcIG3s
	ZMtVfO7R6HuvsUvr4ZTQV4F0uqo+8ltJBbyWVeUuMEpATditv92UYhVihwqk7t9ac0KdbkyF67Meo
	ZEV89zhdvJqm0m6BXTcuRm5dFBreGVoO/ne51A+ROoEzk/14J4qAOhG/TaEHQw/r99g/MCiv0DwVm
	+gi2PmAkmZjWlz98Q+zA6aS6GoKcR3HLbjBJLjfKcpFCF2UlnohpI7Uh9a4mw+P/UVNEWVcdpDjRq
	ZMRxqoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBKy-00000007GHf-2bhz;
	Wed, 12 Feb 2025 11:55:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq3-000000079jE-2wEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-307325f2436so61495901fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359410; x=1739964210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=;
        b=j/vrQdQP2Hg1aBykExme0LEtPwZNIBBKGr2P/IkcMwj2pLBTdwagfcq8yH5ML4kY+r
         y2Tq/Asn342D5xmMB0w48dcN8CMrCJakGWtbVvKIg2srxyZmvUzOU8a7FxzqOzsmFsqk
         YIb0bkqrZ5pA6JDrR4i6Hghvkm8lvETZXan7pQF+fd9qFARcGzb6W6QzcUCMl7KcEXFs
         KY6QQ9a36/OfkqKqVI4lDq4dMhLdZkMA5A1vCBXhaI6yQ7qwp4CICPD3MKbq2elzXHuC
         dOkbZULVvtj4OKL4G4hcP5rQsrFGtomwfJw23ilmqCHzjaGxcX2K/dqs+sMb7Gldxyok
         yEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359410; x=1739964210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=;
        b=Q7uiLoRj7oZNcHIihZvyhIvTOixZcPcDx66rqrXZO5Rc7gZRM0UXLe5SHWQ0Tk5lgq
         SB/u1du3eaeqo6WtHhCY9J0h+63nUs4hi+Q4m9VnZU579sJGWvcwrHeBnFHwP09P7rOm
         /gBnE2F5ZnI6MopdbJTjAid+XpwuXuO9NlU096HTs27SEwk0BTAcF/W0RlvBBMln2nGD
         UgXoZYCrDrl9cS6V+juo+PxMey/7Qdnv3AMVu+I4rT/1iah6H2VaMROwNcH3p2Lrllll
         V/n+4BKEyp5yu4JiGhCmQJf4HmoSpk//MQsZ92kI84NRJ9U6J2WitXSaaO/Va7W+xQpl
         ISsA==
X-Gm-Message-State: AOJu0YzYxGwFzH46gPs5zCTr2mm+TcNdwt3JZcZccGWBtEf++5o7c+dX
	+wQZNtp67LMnhz8oM/ZoMxTztd9vFqMjEn9rEdnymPE06NaugLp4g7SxjxZbb0R4ThJl53OxC8i
	J
X-Gm-Gg: ASbGncs4jY7K+o9nr0ohBGaMCFphPs7jZwWv/GgJtOFh5C408hYixjsQZRSxn5l8uw0
	2zO0TTPK5KiN+omqej53ZvoTfCHLVKRCYXNoYY7VsnppgAxqi/gJND60OiKG6dX2Nw7BUihCa44
	N0SN1gQCIJuvA9jPEgBWlwl90o3LzNCRXH16hvleLuV/h0KV+o88euRfsgw3wyBz1Q3kVkRwHay
	KfEOiBnsVTf1AleIG/lKNxJkEiQMRAPQoHKPRnHkUHWWxn3lzohMIJ17d3ieq2DxRofThp01Xje
	Ak45eiaeqbfm1rngaGJCasU2Dw==
X-Google-Smtp-Source: AGHT+IHrTlZ5pCNMcRck2dAefduLfG8aeY2J1acA2/5dWt4A8Fi7HvaayN1bzLZYfwPYvudmJmpuSw==
X-Received: by 2002:a2e:be86:0:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-309037615d5mr11191991fa.34.1739359409801;
        Wed, 12 Feb 2025 03:23:29 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:29 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:17 +0100
Subject: [PATCH v4 23/31] ARM: entry: Stop exiting syscalls like IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-23-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032331_785079_9C0197A5 
X-CRM114-Status: GOOD (  14.94  )
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
2.48.1


