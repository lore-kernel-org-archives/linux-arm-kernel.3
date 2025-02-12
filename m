Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AF7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=; b=ZucUiRajVStTZVHV5bzXPjGMTk
	rdsW1QTiN3H15oKW797bC1hssB/aeV0KoGf38CnQtDo6AzeKzhhFjKHYTIXkACfrvwBJqZuSPrEuf
	G0jT/UERqdtNY1JHE+VIiZHTis8IM/WpB6v1tc8C+x/yAynw1qjrDzA/vpC8oGzNogeY+7Y/hkWNh
	mHLzkEXpLbT9HFkPdngXjEmAULiTX0avxNUBDNVnRdM2zjg4F288Fv9pTErXDhxsW13L5DnK8D4HA
	gYwavDU/P9AZPWgFwKOS2MO9A3vkEtFyQ+Pg5kGcveW1GMEdYjqBL1UlWq7UA0iajQa+3eeeJWgIx
	KZYVKzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBNl-00000007GeY-02pU;
	Wed, 12 Feb 2025 11:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq5-000000079jg-0nEO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=; b=XmO5F1q+gY2/XhOjWbCfv8590s
	HMaC5r5sGGEtQnUa4IJ0tcAlB7b+3voNYIfZlGay5Z9Fh6/dgKlcAFBMMu8WWmOqaleZjrx5MtrHs
	vlfXUzRS6IeyhoEDC7wFbwMHEz6Bo/wxjKXUA1/se+IYw2mXIrQPIIl0uGzNJz46KkQPfLOSEMfMV
	gi/gTbdLcRdJoWzX8219O6x4Blo3h03RsVqC5c8cuBcJgMLHRjJxMmLbs3zqFEC9d5EAdlreLQyQk
	wHoeFC3f2gNbDJyDn9CnNQ2h+WGb18b/ly4HQC+hoi69jpW9DvjlXOPxouHk2CmCnpixPhAHO2PqD
	8D04dlnw==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq2-00000000nqR-1EHA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:32 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-308e3bd8286so39089821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359409; x=1739964209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=;
        b=O6pPW+GSbHSgVaW/ygdtzJGuikGqjm07wvDLzZH6Tng031/xRcmxjga7Co4ScHayeP
         aFrmAFKixvV/DGWdUdotb7yoTZ9F5Jw0tlQj8AFcmiYggiLulP9lTZaVeb2QJG3Ie4Ro
         lbVh7UmDC9uX6d8dR6EnWwZ+iA1tNkRHLrciScIvB2tBV9by4RSERWKH4FAPPi1D/2+J
         lcZ7Z4S3Up/PDJtJ4Ixf3ctAPD5FHCYqec+IWJ5vztglhjTnRLmpFCXbx53/sf1RFhof
         h7l8bnfrYn1sqpKc0BWghi0b3dM/HdKaryTnVLt4T/sofXzafJFKJsZTxJUME7R0OB1P
         mO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359409; x=1739964209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=;
        b=AHJCiSX/mcDSe2o+ZhrgeVJ1kNg9p9KrViS25crjHzKou2yOAiBbORlWpte9LZFaOI
         R6FDmuGqd9BVeOl0YGNiQ8IIh/gOSyYXO0UaxdKbpx5UHsM+B7OAzuSP2I0qzovpnBHT
         HqbJ18cti0r7doIpJYZSvOeOtG8PzhRBtsmwAMP+HzwJ7oNdMeHQ7e70xqBAoXUH9T/1
         AdxFom7Ydjp9M8zZyJM5Fby1X7bDmpt+6QXSE5x+7BVgIzuLfcRbjp7+b7o2QuZ9JUtX
         FAnksvVcHFETxp3DsD0JgXbaLoK9fgKJYGngnqQV+B2sOCmLxW/mpFG0WbOKmQTtQ9dS
         KwdA==
X-Gm-Message-State: AOJu0Yw0QvQNSR8xF2tYzXcoiucnZ6kgSKlfMi+VBtKozLVvg3oATjST
	d9qRDaZK9XZxJ/96TEDmUkSlGJC6OhAOr6U4Q6IHmBAlb+gC6QcQ8+4Jr+Zzoyn0EK67kAYdvQS
	m
X-Gm-Gg: ASbGnctUfbJgIC3A4R27z9ICUZKXmXY1m9JNitOCUxd/ZKpEH/MTiHICxuyNypo/EvZ
	Ls8Jj49+RvPzUvjbta/LUROc0nFlZz6KVDAUw0+xaKNmjX7O+qBmnqh8GiUmtsG3oSIyAuaihwT
	tu8Zj7hYF26jjE0ao60PewG+JfFO3yPoZrMO6M46VfeZxIhsVaKR1VckU10ZyzkdrRJOuQEPFsW
	WIObBXaaqSK5CfMTm6opiZhuQ+iOR5iT/zF0LIySBxfPbbr0LnBICR++eQIKMI3GAImwnng28+V
	zcAVGksJG3ldfIr8rD/pRZBZjg==
X-Google-Smtp-Source: AGHT+IGSxmUmsIGZU6BTQUkSp0x8dKEvIYRNw21ZDleo+Ua51tS+VPbbp2jic1YKzEdrANQKDuDojQ==
X-Received: by 2002:a2e:bcc7:0:b0:307:2b3e:a4a9 with SMTP id 38308e7fff4ca-3090366fe24mr12618001fa.20.1739359408813;
        Wed, 12 Feb 2025 03:23:28 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:28 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:16 +0100
Subject: [PATCH v4 22/31] ARM: entry: Move work processing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-22-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112330_580331_A19A7CA4 
X-CRM114-Status: GOOD (  14.30  )
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

At the end of a syscall software interrupt and every time we exit
an interrupt handler we check if there is work to do, i.e. if the
current thread (userspace or kernel daemon) has set the
_TIF_SYSCALL_WORK flag.

Move this processing over to the C entry code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 +-------------
 arch/arm/kernel/entry.c        | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 33bc9e7c5b32f62474724f1d47f97af24dba53bf..5385574c4339714f3d8b5ab6894f27466b89f932 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,19 +42,7 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
-	movs	r1, r1, lsl #16
-	beq	2f
-
-	tst	r1, #_TIF_SYSCALL_WORK
-	beq	1f
-
-	b	2f
-
-1:	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-
-2:	asm_irqentry_exit_to_user_mode
+	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 47233804733752aef0f2fec6f54badeab18e98d0..0e3960844b94b14325eb00ce7dd791b36c43ac3c 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/ptrace.h>
 #include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
+static inline bool has_syscall_work(unsigned long flags)
+{
+	return unlikely(flags & _TIF_SYSCALL_WORK);
+}
+
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -18,8 +24,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 
 void syscall_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
 	rseq_syscall(regs);
 	local_irq_disable();
+	if (has_syscall_work(flags))
+		do_work_pending(regs, flags);
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.48.1


