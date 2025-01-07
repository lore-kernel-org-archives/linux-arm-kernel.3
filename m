Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39E2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deVa2FvUEOHV8lxaYOobNw6K9tuy+tyk/0Of0h0Ki9g=; b=J3vYmfLr3aLgS//4orqnaHIhSA
	TpAn9WiXn3V/AUjiIeFkkyY6HazMQqquWhPIMAQQv26FlzJC3tUTBh0nX24Dut7L8bIssDP4R16CB
	yXiunCa1aMMjNG/nremVln5bH7lIGYMyxWjMpjFXnpU66DR9xtQ2XCEOftfa66VH7JqEyl9YGyxqP
	eHe2CK4vqej54ievf+Z37pqcFNvOdjEPF1xbDCG9QJjx8RtkQ90QvBqbdfZ/J8I49q+Vvwamqpna/
	Jky1AWD4wouybfv/7B5Thr/XODYxF9+8jlhYpf8PFDYxBFxkUomz4DFEMIf1P/yyM6rSmURvZzkIY
	zN96yoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6WG-00000004H2j-31Kf;
	Tue, 07 Jan 2025 10:09:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV661-00000004AYx-0hOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaeef97ff02so1919384666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242916; x=1736847716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deVa2FvUEOHV8lxaYOobNw6K9tuy+tyk/0Of0h0Ki9g=;
        b=V/OkEKvzgWJuIstQj8zE9WoG7qioZJcrOaegQveJJyWqEHl9i6Ki75pBRI+6pGaduO
         sNQSy0SiZYlQUlPqhtscmq9askCrcWKHBSslIkSP9kCAcT4u9oMuzsA6/8I6CeEJJl6y
         /PxVr4uRjpHPxM5WcMa4Yl1pYUN20yHT8XzLwVlCZuVPuv2x7Im3CnrgK0SOzQP2Vh/D
         /7ibxzQn9tVndzzX+Nldxn7zg7va8EJNA56l6Ru+yqDn2SBxgZ/feOLiEbO5nos4GBxY
         wN1wqoLJprs/vVzLtMOVd3h09o9NBsW2Xb3D7zXweG8RcyBzfLtwXfyi7aZBYPBIv45s
         81cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242916; x=1736847716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deVa2FvUEOHV8lxaYOobNw6K9tuy+tyk/0Of0h0Ki9g=;
        b=SDW9DgvGN9EgC1rvooq7ER8vN1iawvm17VWio4S14xbISsZ143ZDynJo7jzIigaTUj
         B21PX7apne3o5zr4mrq/KJhAU4NS2MD7FrV/FOz2fQH1B1/mdS4SkPMAdxhftWpEyvMP
         SQZ9fR7iMjxH/uWG0Jvjouf6cg5X7i7WKCQ7NqhTCWAQI2n8MPe/RbK1a1nzjSBKFBvY
         kc8TxJMtOfDsOFMJkxiO5oPydd8wqJzd9IG8ufsamSnaiY9fQ1piGcEFhiLFL93i486e
         IpA9NgDYE9VLY+Ao9UVc8KXl0Xhcv/rJ78uvO1PQ2WwCQFDUxEsW8nnHJr6W4W2jJKii
         QuYw==
X-Gm-Message-State: AOJu0YwowokIf9uiR5XKG2aFmhnQBL2DGGYBkokBA5/1FxgXraEYsvD/
	a5IvWI10WEi5YZFgpn4FWlw/ooxYBqQ/uqmI/tMEsXONl0tmzHaQsqM25bCun5k=
X-Gm-Gg: ASbGnct4cTUPjLMKsPbc1M1wFR2MO3sns6OWWk61mvDtujgWVJYg7XG0xjRe+pukDZ1
	W/DxwT9Wi8neIqkkrrIeFxGVR4rRSRRd1+JX9tLKeB/wHDnNK6wHV/RnZa3ssumba+oXH6sEy5g
	tRc6dzrRZfuq0doBuWpgmJ6k07sMrYsSCwZSBJW+l9w+6GjwlDJtPLAarCkCxp6Gu8+owcF9zZO
	ZqVlGfHZWFU9nuBWlwQew/smrE6PUZZR4tZlXbtk6CUjwx22bN1ldNX+i9gYyBOajc=
X-Google-Smtp-Source: AGHT+IEI7jiLjIgZysIlEX73yDDpgFYYpjbOqnnBoDztE8NoLaevmNECfxbufOxFIll7IK31jTg9iA==
X-Received: by 2002:a17:907:7f22:b0:aa6:7c36:3423 with SMTP id a640c23a62f3a-aac2d4472f0mr5322819166b.1.1736242915603;
        Tue, 07 Jan 2025 01:41:55 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:38 +0100
Subject: [PATCH RFC v3 22/30] ARM: entry: Move work processing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-22-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014157_207829_E0D76483 
X-CRM114-Status: GOOD (  14.25  )
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
2.47.1


