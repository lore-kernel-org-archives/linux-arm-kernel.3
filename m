Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC7EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0xk90iCJuCR8FFWwSxF5kQuJOeLnT5yLRORiP5UC0w=; b=TTpqSqQKl8/6eQDCtl1NCOlF44
	1cG6iVvTMRPfzqPhPHt7uGo+rqOcl86l+QHx5INReGRz64opWcUo3kLtBJ83ew+4exnwkEVXAThUm
	1p5MWT6Hfru+OvhScU+LDL3uHEpdLgCLrQo+nyVKELCB9YMNqycVn602fO5GlKOenwhPWY2pKuxpY
	VYsPHqgBj9VnRo0teDrWF0C3NWNf33GiAPk9txlgLPwOE+2pTf1uB4+lc8GZEFEPl/UlLiYLjIt2S
	LORUXbNO/ySq/Jz8ID2G5aaUwKej9HeE2/glyioR1mgFbMeuOdj/KeigVJTbZhHcf5jsE6u2PvOFg
	khF3fyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Cb-00000004Cvl-1SdY;
	Tue, 07 Jan 2025 09:48:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65e-00000004ALn-1AKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso866224366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242892; x=1736847692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0xk90iCJuCR8FFWwSxF5kQuJOeLnT5yLRORiP5UC0w=;
        b=WKC85lPD/3ATr5kL/RU/spOv39uLjfrthSgEjWVSqpCCPj6oyOj9PSd1OuKcbAoslf
         sZ8OIVKP250fWjXUyLlyRgAE9szKjdtz4dvfBWxCcb0FWeTRfkb83zyRtQ/cEKrDiJgC
         SjPrhGzS07bunu3cCInPyY1v1nAxPuo+1qm4b405pQjSsDcMUVrj4JomCxviZJs2bt3D
         YRM25JeXx/oAACTIhVXeTi6Kucmxt3AeNIZAVELLHsoRz8Bh2js3scOUZDCpI2yU8ZZs
         wPAGD6H4IvuDd7yWHzsoYQlCM4gz1KJaQREojdiQCMYeHDRbiWU6rZA3bZiVQO1dh/in
         pQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242892; x=1736847692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0xk90iCJuCR8FFWwSxF5kQuJOeLnT5yLRORiP5UC0w=;
        b=KG2rKG+V/A0fdJBg6esRdpUfuHtVEt+7Xmn5vK66V+meP2apN40wbwZiyuYaBwGOmG
         E0hwoxjWnfuwqzs/9t9w7QbuddHF5egkq3FW4jhQae22YWPC7dbM9Cnm8OQ0pIlN+jyM
         2ZJ3XZNu5r/t61tpYjm1hlsG8vRSu0iZwbNweFqOcqF+qwQJbXn4UCGHOnHsUyLNrvng
         4/uGXqNbybwHyoLkyRM7gyHATQH8hddBrWh+9fFCK0vjKxcgzoJVbT1lP9F5gJzagpZC
         aaXutCROPlDKe6wQtvxZ40iMOcDhNs+HycH6yVmzOa5NPS0Pw/fYFymMQTe9ZWF4MsuK
         Wwig==
X-Gm-Message-State: AOJu0YxsmhFLbbU4+RqWwyHvhHOd1q4YnRz91DftGo3MtrBAb72rAP1t
	EEJypmGoairmGtzfX007HaTR392IgHszBMWgcDGpUT1CpX0TMprInw85taQ5J7xyBt08vKzR+7S
	rT4c=
X-Gm-Gg: ASbGncvbojIMcgJ6jt3LLdGirL4kVjq17rK1PKnkNIa46ReDf8p9PB7EQoZAT08HXKd
	pcK/5iJI4bMyC5ARqwAxLw+/W9AmX6srTxOjZxZf/OVjTQ2e2M7sP+BOXBKH850klGuDNX5xxsv
	ZcMibk57x1+6wxq3dwEyR9XJeAyH2hI6X+1XikPnzcEfqXrqFZ8B43Lp6gyyLHu1raty+rkNTy6
	gVaeCw+KoZjJ1f+o5StFT0a3lLMVhgr9BgVBfp3Yi97mSEqy4HpULyPnGAuegRzTyo=
X-Google-Smtp-Source: AGHT+IH7GnKHose+SCGU4IDmzQsxlhuuWzS7qxw8Naw7AVRLHNfhriDPca5ZUr9UKS5W4G3xsHXuZw==
X-Received: by 2002:a17:907:c247:b0:aae:85ad:4997 with SMTP id a640c23a62f3a-aae85ad4b0amr5075746566b.40.1736242892461;
        Tue, 07 Jan 2025 01:41:32 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:21 +0100
Subject: [PATCH RFC v3 05/30] ARM: process: Remove local restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-5-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014134_323073_7A61C580 
X-CRM114-Status: GOOD (  22.55  )
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
index 8b84092d151800cb4076672d1c31f0a83777d0d8..7acccc96840c8a17744cc3f2894f19d142aba4fd 100644
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
index df6961a1006b7a0f3522728812bf52ccb849e511..da5c2d4b62e56cce644b15e329ab4149d69c5b79 100644
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
index 79a6730fa0eb7d6581343bdbbeb6834dcaabb9f8..7b1a16e86b236575efdc29cda9b751e8e2a3f64e 100644
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
2.47.1


