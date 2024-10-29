Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC78D2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhwutFaJAhBwzUvxWfpVZxdfXLNUR2eiL6c/Y41YU9M=; b=hBq7ng2ALEITTpHUSzldPQmOXE
	W1oOXrzs0g0XMdoc3hoqVqoKXHVtpVdHGjwfhk6KEtejRcjfTnbFyoTXJVYb5jhVhowDsY5GOZ2Ei
	FbTVKiAcLcO9a1jn3W7+L4BM8zA5S/brbrD7+SvWCJrxLy/S5dCJzeD91xpyhlfxpzmnM8S+V52KZ
	IGUpFJ3hzZZQERnC+jLbdJrmFHSBmuVizzRtbxnBgWRUdV6bMi76Fdzi/+vaUj2lkKgsxaGbiZnG0
	qVnENTT560YD9RpVwybFi6B4JUlqPf96j2WIQ4TFyQTBSLttl742IezLfSq/fTHZdO81DeEekT1PH
	n1hDma6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kLb-0000000EEKh-3jOO;
	Tue, 29 Oct 2024 11:25:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqU-0000000E7JZ-11p6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 10:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FhwutFaJAhBwzUvxWfpVZxdfXLNUR2eiL6c/Y41YU9M=; b=nBIpKJdwp/gAe7GrGuPyEbykeN
	L1dGjS/gL0nfI9ARO+pXy4UyKG7APVNAXekmgvD+eukNhSYRf6Xi1a3RUgulDi1BcoXGjSI/+JsoH
	N66BYyf1A01jX1ZEmo9P8Rkz3FP6txT3xycnotwHczOL7Qrg3fgv823TpCOghrSjNPnIaWY260T1T
	bN/DegM1lo2+4wkTRsfniVVF6TImfHBsp9nyXePVsl+ltcJiXT5zAUtoVgW3Y5dzWTj4yI6ooT2E/
	rk1Xm45M+GcFyug8/cT+zJbmrdEz7MoQrQV+KKzIzFKY3q6PrKS27h8DN8cWh1Nui8xdd5v5oROQz
	zjJ9p5ZA==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqP-00000009sXZ-3L0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539f7606199so5690399e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199175; x=1730803975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhwutFaJAhBwzUvxWfpVZxdfXLNUR2eiL6c/Y41YU9M=;
        b=EdbC9vlAMk7qssyMhmnciTBXWZ9dsnrK9tCsg9DsNvprg10f3MnokN2NGvAUSDx6vw
         8DvtRwuDQ/5XmpSSszMXT2HsKhKcZlrG+NbqyjjMqoh3UN7LNnVlML3VVSR1GYjF98UH
         nhjxTDoAEU6ATPiPS182zVxNdlsJlTpGDcnUf4rHjBvdfY5jMSTvHSN1bxPzSuek9T2g
         vzUUJWa+ryhQ/wAq8iuR1rI55faM+aan/uqBtqYS/1F6GmII+qcmraan2LWNQG2/E2vG
         RDT1OSJ3NQbKwnxHy6GbXoSeBv0u6k7o9IpMPd6pJFzUZ527O8OvwPSaPtQGgjiooVL7
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199175; x=1730803975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhwutFaJAhBwzUvxWfpVZxdfXLNUR2eiL6c/Y41YU9M=;
        b=C+GsCouuHyO+PmKTeeUyO00JNQQJyiPdLwICX/4Uk/M3Q6ZXAcC30Lc6AM/pz0C7yk
         XKsC+h3XIS0CX5LBGkjE+yO3r3+Eb3gNr8Tqua3N/Egr6O9vCMj/L23PmqNMCR0UXPhE
         uaSt+EnJRZ+mRNkbqY3AoGTnGgySzphR6KfxJFeMrOEHb1hYK77NmuSljXo2zCJo0rFL
         1frM1GWuQoXAQEvYjjaqckdbKkjdw1R5GCGaOlGnTKlyyk/KWT+PbHzzsj9Nh6xDJu+h
         tFIYjxnhn0t7YTaOwWLBago2cho2/k0L13wdH70KJTDqq45uX92TqIHgWdpyqqw+aVom
         lBEg==
X-Gm-Message-State: AOJu0YwNL1X5TtdPJ2En0CfxpWlEPRtT48tk9Nu+mixt2nACe0XG/JBE
	HEW2ABrfZwlcH8eIMp9QhKDjnoweEYDGdzL3K5jyeYxLWzRBk+fBEk5/Xw7On2I=
X-Google-Smtp-Source: AGHT+IE7TBLGcMxKsC7a30pUEcJoXeIzSiYTepdqh334Y6u9VYfbvLHbrLSewuIIAuux0bNQMqTTNA==
X-Received: by 2002:a05:6512:3b2b:b0:539:e1ea:c298 with SMTP id 2adb3069b0e04-53b348cbb37mr5497449e87.22.1730199175441;
        Tue, 29 Oct 2024 03:52:55 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:45 +0100
Subject: [PATCH RFC v2 05/28] ARM: process: Remove local restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-5-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_105302_130343_9D7F0250 
X-CRM114-Status: GOOD (  22.58  )
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

The ARM kernel contains a quirk to handle syscall restarts
inside the kernel without exiting to userspace. The generic
entry cannot handle this.

Rename do_signal() to arch_do_signal_or_restart() to fit
with the upcoming generic entry conversion.

This is essentially a revert of commit 81783786d5cf
"ARM: 7473/1: deal with handlerless restarts without leaving the kernel"
from 2012.

Other solutions may be possible, such as checking the PC after
do_work_pending and assume it is a local restart if that address
is inside the kernel, or modifying the generic entry code to
track local restarts like ARM does and pass that information
back.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/signal.h  |  3 +--
 arch/arm/kernel/entry-common.S |  9 +--------
 arch/arm/kernel/signal.c       | 28 +++++++++-------------------
 3 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 8b84092d1518..7acccc96840c 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -24,7 +24,6 @@ typedef struct {
 #include <asm/sigcontext.h>
 
 void do_rseq_syscall(struct pt_regs *regs);
-int do_work_pending(struct pt_regs *regs, unsigned int thread_flags,
-		    int syscall);
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
 
 #endif
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index df6961a1006b..da5c2d4b62e5 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -86,14 +86,8 @@ ENDPROC(ret_fast_syscall)
 	bne	__sys_trace_return_nosave
 slow_work_pending:
 	mov	r0, sp				@ 'regs'
-	mov	r2, why				@ 'syscall'
 	bl	do_work_pending
-	cmp	r0, #0
-	beq	no_work_pending
-	movlt	scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
-	str	scno, [tsk, #TI_ABI_SYSCALL]	@ make sure tracers see update
-	ldmia	sp, {r0 - r6}			@ have to reload r0 - r6
-	b	local_restart			@ ... and off we go
+	b	no_work_pending
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -266,7 +260,6 @@ ENTRY(vector_swi)
 	 */
  TRACE(	ldmia	sp, {r0 - r3}		)
 
-local_restart:
 	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 79a6730fa0eb..7b1a16e86b23 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -18,6 +18,7 @@
 #include <asm/traps.h>
 #include <asm/unistd.h>
 #include <asm/vfp.h>
+#include <asm/syscall.h>
 #include <asm/syscalls.h>
 
 #include "signal.h"
@@ -534,9 +535,10 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
  * the kernel can handle, and then we build all the user-level signal handling
  * stack-frames in one go after that.
  */
-static int do_signal(struct pt_regs *regs, int syscall)
+static void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
+	bool syscall = (syscall_get_nr(current, regs) != -1);
 	struct ksignal ksig;
 	int restart = 0;
 
@@ -590,16 +592,14 @@ static int do_signal(struct pt_regs *regs, int syscall)
 	} else {
 		/* no handler */
 		restore_saved_sigmask();
-		if (unlikely(restart) && regs->ARM_pc == restart_addr) {
+		if (unlikely(restart) && regs->ARM_pc == restart_addr)
 			regs->ARM_pc = continue_addr;
-			return restart;
-		}
 	}
-	return 0;
+	return;
 }
 
-asmlinkage int
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
+asmlinkage void
+do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't
@@ -612,19 +612,10 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 			schedule();
 		} else {
 			if (unlikely(!user_mode(regs)))
-				return 0;
+				return;
 			local_irq_enable();
 			if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-				int restart = do_signal(regs, syscall);
-				if (unlikely(restart)) {
-					/*
-					 * Restart without handlers.
-					 * Deal with it without leaving
-					 * the kernel space.
-					 */
-					return restart;
-				}
-				syscall = 0;
+				arch_do_signal_or_restart(regs);
 			} else if (thread_flags & _TIF_UPROBE) {
 				uprobe_notify_resume(regs);
 			} else {
@@ -634,7 +625,6 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 		local_irq_disable();
 		thread_flags = read_thread_flags();
 	} while (thread_flags & _TIF_WORK_MASK);
-	return 0;
 }
 
 struct page *get_signal_page(void)

-- 
2.46.2


