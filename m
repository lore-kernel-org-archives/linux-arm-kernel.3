Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67043D2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi2KcUYCbZkPlsUdwrNEo9QLrpmnXM+YJIWNYO7+o8Y=; b=GtRj121mkR1izir1CqaFlRdpZp
	eGMYSDdx0BYwWi1EHa3P4LDGdVtgMMFMhaReyKeFRU71sYN/WRfsvmRt8A2dt+5Rp4NK1LiJj5aIG
	ATETMaJ7l6xIai2TVDQugINGsMNKNDsnuCeW5q37A4/l7LECZR+Q5p+FpJvfSkhFJLJK2QK8XnAnt
	pQ3JnshkX1C76p0Edhdh3i4lzso0WcWB6LAtnqXemwql12TvnUi4PWsrU2SE3by5IQQj9u6OeZGbY
	s/2AFMGOdq5AZRO6HTew3U3aGRjAx6BPkmY39pQ2R7qsS65eGXdwQCL8oqJ51LRWSC7S6lcbdfRZK
	wEQObjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kdN-0000000EGiD-3SF8;
	Tue, 29 Oct 2024 11:43:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqq-0000000E7TK-1alD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so8221376e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199206; x=1730804006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi2KcUYCbZkPlsUdwrNEo9QLrpmnXM+YJIWNYO7+o8Y=;
        b=SbVNe9/wyoTceVhs3mMo1XKpR43ucrZIWDKpyAeYrhvJixfa3Qw4pIa1QLEg/gOJFF
         X+YFJp2nD0hDwhoKr8mWP64ynriOEWwB63yKtuF2lExEUxJCvZ+iWC7HCrQQns012PgO
         k9nM17ZQQnvCrwPn3cZOS0bqcNVq6otZHIo5+0DrV0zYMpvAnhBIVHmWymX2e0oqVotg
         WpP16eUS6aNX0TyQGd1coaLz3fcBwl6cikf8VqKuHMFDPo7XBGQFQnI6HvN1EUD7jlbk
         tckuYbd7BOvAWXHlrlifGmjo5yi1kCYeArdRtW2H4Tlk4V9doexjqyzJxS4EGAxOg2dY
         JjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199206; x=1730804006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gi2KcUYCbZkPlsUdwrNEo9QLrpmnXM+YJIWNYO7+o8Y=;
        b=WE2qmmx925ptCUsKthMsrbjbTSZSWRJf06pSyeivQR3WMx2ziZmiczHc+GfEz8SDyK
         ZjpS1SkmGkgd0V6XoqHMExUI6fiEUlAUGUNweiCYbZeTTjY2lm+YGwI7Yg0IhrzvxKyb
         zqS/FGMwP8ouE3Tm6gccp/POLBVBSxPKjIGrmjwvqlmcXI90oQ3FK0XY1jNTpgxVyp2W
         h7b9t0Z59Lca5lDxsqIIT48pKsnUJEInMNeVqCSMLskYrOIRhVbc3DG/b/c9pp/xif71
         uV5gdggxqaK3RgCrDawYrw1PeHwsAjaFDx/2UXMtl6DNB52/71DAV5Za+o6g5nJO9mnn
         RFUg==
X-Gm-Message-State: AOJu0YxcOPpa2EWRcCGvKHMx1YNQO3pn3O8A3686sMXeva8mon2REA6z
	gYgwS8lRQu2sAncqjjrc+UkwV7tGn/UFXJ9V9Tlz3lesvWkxf3khOihH3MnQ9sM=
X-Google-Smtp-Source: AGHT+IFLoqBuIKnwUObAl1tJTS1Bn4dPHs461dC4/LHdcT9FwMkp5b3gbbvcN/LNXtk6xKOfbTGsmQ==
X-Received: by 2002:a05:6512:3c9f:b0:539:93b2:1380 with SMTP id 2adb3069b0e04-53b34921b15mr9500411e87.48.1730199206270;
        Tue, 29 Oct 2024 03:53:26 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:02 +0100
Subject: [PATCH RFC v2 22/28] ARM: entry: Move work processing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-22-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035328_458413_DF91E0AD 
X-CRM114-Status: GOOD (  14.37  )
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
index 33bc9e7c5b32..5385574c4339 100644
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
index 472338047337..0e3960844b94 100644
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
2.46.2


