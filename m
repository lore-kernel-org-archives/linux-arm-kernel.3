Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE5C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=; b=hNzAKLks9JveSW0W6Ojvnep733
	VKOGWQp16vacovtA/Sun/3yb0s6Y4G1gKDqf6Lpm2GVzUaQ09nkvQW0hxJliOgyiHeO+QmOS92rme
	4AXDzlp2t2L4MWDR7v04pqiKygZMJ0mbT2QDyucMEt3EhqmygyfzdH6WiBULR3Af8KwpW3GWHvps6
	vfQ02tOds3lhoagOv/wEzEvBfWKraPWcSKaaiLB0xV655WDiXoVXWqXQisbZ6oM5dNJn43JTLRWn+
	TD1Uff4kaB1zTmXFQMQfV5j1FHYQQPgNafAKqaHLGk/I4fn5mkuUboeeuPjxFZVJYmis/h3A0A8/u
	5VjbroHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsOt-0000000GsAv-49bi;
	Tue, 25 Feb 2025 10:42:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrex-0000000Ghm9-02ed
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54524740032so5581796e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477325; x=1741082125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=;
        b=DfG5eImTxMkxDZtW5AQrHcRb/dlqHxUQ4GqHqSHUQ0OauwaWwRD4LVfmTl5KGBEZIE
         2e1s5QUcFeN+eHpX4ZoH4fAh7QS+FZiIWdDQqINerTIBI5cu+mHyQ5fnD3JSwY5zylQg
         0CQD2W/o1rCdD+scvBlGdtxI/OaRbSKEFxgcDAwYtikmbhYBiohJEyBhUegVZyWIQSzB
         DhADMrxci9tBb2bscApFAaoAuyNp38VpD1fXs+3FjEvyB7SqdHJf1ffLLHVSjt+vFXSI
         GneUOUC4qMmn2mprC7qp1gHtO8Q7qpceJxRGILCbZRjsfr3bTBPnL9wm6tCJFjtszS5Y
         /95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477325; x=1741082125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l05ZDEo5bKH98lcf/z2wVpVbfg6jDUAnt9TMH5HSeU=;
        b=G2SrudWHobJzp8MDYOO2rbXIeLQJSJNN8cucp5euQSnRuzKegR3QJLntIC/6zctHws
         4eJdFGh4OspC3wdDsEm4n4q7qqeT/ebSDEqNgoAf85LbuGhw9+rN/+wAVsHOmn8Ug02I
         tDoRbsLBmmGTE2NR/gGcu+TYBWsvnxqZgag6POaxhhzwu/ImMrFsr8BZgGOve2zLio5e
         NF8h30kyvrgETTGNAWHF7Xwb9jRu2U0pxjf3Fjo0A9YB88E8IRfuD+swpELVg8wmz5JN
         4IkWZezQir0xP1B/930Z8IL9oNR81+pRz/alswMd+BdFVy4PEa/uhA4YSf7UvJhcApby
         h12A==
X-Gm-Message-State: AOJu0YzwvstvWRJpTkXKr7PnZTMcAJRZPhzOczvONWQ02foJZyGkMGvG
	U0Kif+ZhyjQ4ShpuxVyD53LHvgIxYgHoEx9Xd0RatCPyiSdL689JJwwDo8Fd2KQ=
X-Gm-Gg: ASbGncvdmxEB650iis7O+stNLhHB7NPvDKmjVOzYNQ8N0gbvPICzaVajahdMMw/NG/J
	oGO5c+CVgU7tnDX9fnNkIs/wVV92aDCRrDxbzC1NBCdl4C3UGpOXs3Ko04om19GavTrmt7gohTr
	gNNbkNa3TJVn1Vf6R3PJKsNyab4GzVd9d6OXGN9YGVslqIvSnSXJT9SRZ2LlTzloTw4qdVC3b1I
	d1dAA6nmhol7OQEakjp7OC+3TzMiksBIVcgQm3rBZ1SbesLk1Z6Ive3uJ1M9NX6QQ9EuctYOpGD
	TB2W0X77CU2BsVS9FuGGQ38WSjlKVxn7DCET
X-Google-Smtp-Source: AGHT+IGv9PupW5hC43RAbr/CGZZGm/FFBN/oPYbjQj0aMhZodLXr8EOafbq0GSLZY9dixj7FM743WQ==
X-Received: by 2002:a05:6512:15a7:b0:545:a2f:22ba with SMTP id 2adb3069b0e04-548510eb0b2mr957604e87.37.1740477325442;
        Tue, 25 Feb 2025 01:55:25 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:09 +0100
Subject: [PATCH v5 22/31] ARM: entry: Move work processing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-22-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015527_067746_0CCFC08F 
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


