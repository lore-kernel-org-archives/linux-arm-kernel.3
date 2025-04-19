Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8605C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRhCeJvUzi6fE4P1HsVoSPsfz0kLlIAvb//vG5rLP0o=; b=amTVXqFh+MkEqFV1a6AXRh5KhK
	Erm22dSjjSjtJGvBMHax4zHIHjm7SsDI3DfCOCnPYBovB2Lgw1Yig7KP1qmXH1hM43fpLMWCVDbUE
	4bUxVlT9RyTGeZSVgw849C93EtEl0+LC3ECnAGmYJSf3faNDiC2EtXuTjPRdehRb3LkI4Wj7z/yY2
	/SnBfZ1QOR9VAA/X1gDCROkX7t/LnjwAuuJVO+UFcUvTcp6kHD+v8IJuGvtlGpdl+PKPhVWyB9mNW
	kw8QWTk2XxmGrS42LAQfxI3slCLpNSyaVJkqISnW+XbnRQmES9jUVHHuOrC5QpWGozbiIQKsk76zw
	lyR3VgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GyE-00000001uVF-48Yu;
	Sat, 19 Apr 2025 22:47:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn7-00000001shd-0EQ4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so2820933e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102163; x=1745706963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRhCeJvUzi6fE4P1HsVoSPsfz0kLlIAvb//vG5rLP0o=;
        b=Z3hXCvZ0ND0xPi4PEbsfe6UFz7iNVGTzqGCt264zdnDRawlTziOH5J9rTbz64VYqWw
         v6OWf2xRYkat5kPh9W3ZYKYwpco+P2aoxoVBafNTLVL0eJvwf2Qs4NKMBdxtpL/3eEH8
         e5kdx8VAVCeiuxV6M4OyqYK8MztntbfTkvgT8rGDUrQgkfumd8dravpEF8uxmCZqYgnU
         R0zr7n21X7rnrB5knvl5hCeWALLurIIAfxlI1bN57AZcfBBrExr3KPrylb22IkZTfs0u
         wcp+NJMmdqmUUYHkcGHKNAoQcyzmZvCd4PR4dbXqcgAUoRUVBJc2SzrXs8KSU4Hy3p2w
         2HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102163; x=1745706963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRhCeJvUzi6fE4P1HsVoSPsfz0kLlIAvb//vG5rLP0o=;
        b=hDM7e+1N5Vu0/k/zvGHxb6N2WC2THCLHd/ocKkl2y6ZkQCtIW6riOEzZYW9ImwGdhN
         6IHsBy2Q9CtahCd3RAB2S8xUy2O+8LYZviywyDznfmqC/PJhlZYNBJsqZuxRKXt2FSo/
         7FNum2+45XGRHQ+Ktv6cjjiUT7nHH0//ty4iOC3buWxW2ngK0PdgblVOnfMk32QXXJit
         55C97TZELkLQYvs4jB4GjoMA1tL9hAhphnpnTWn3PnAeRf5svq9GXIm29oI8ENJO7JZ4
         /nqL53AGeIw9ccNWv0BHKBBwWLbEIqdoF3Sv2wGP3KBlkbucvw0nSegZNhgkSxh4mVqG
         NN6Q==
X-Gm-Message-State: AOJu0Yz+Kf/LBVyEFHHrlz1l5szta3/AgaqCRt5gf31TD+ZWC62kJHHH
	eAWoy8t4G0vW/g9xFDGFUaQR8zHooOiePtjPvpXiWfirSpLO/v4J0SaQwJvS4ys=
X-Gm-Gg: ASbGncvyu9tEfk9x9r1pPf37nl26tm7ZEzo9RggU8enQDXM8STTUiTb26IC7r5oQO4Z
	NLmo6u7Z/jvhZs7kMJzPm7an95fn/FwxUHPj1ad3aYt/Iqyvu0n9UNWaFP5re82M5IoXOpaDD/u
	vjkvpJiCRiipuLxjw1XJn8HQfixkjgl5bJ7HPr91HfO0xSLMPUQT/9n6ml6CFdH/HQl/yYJFuaO
	9JI4YFFV+v3iCkgKsBEtWrzhxtehc8nffeM5S+z/jm/7Q71kbv6kBDzE9p5kdY+2G69hlFrQaaF
	8rDm03Ns1bV6JPWoQYaXacBV1eTMP08mXd1+KfoQZquPPPn5DqlvwDRz3C+Mxw==
X-Google-Smtp-Source: AGHT+IEeGCMHqxwit+Owc8qaBud2K8eXJfTXFHX95D/1MI3+kTRdPxunWD+MPU/Bh4fCWiX1DSmdpA==
X-Received: by 2002:a05:6512:10d4:b0:545:ea9:1a1f with SMTP id 2adb3069b0e04-54d6e6301e0mr1711739e87.25.1745102163166;
        Sat, 19 Apr 2025 15:36:03 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:52 +0200
Subject: [PATCH v6 05/31] ARM: process: Remove local restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-5-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153605_101166_95A854E1 
X-CRM114-Status: GOOD (  22.76  )
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

After the conversion to generic entry later in this series,
the local restart will be reimplemented again, but in C.

Link: http://lists.infradead.org/pipermail/linux-arm-kernel/2012-June/104733.html
Link: https://lore.kernel.org/all/1340377626-17075-1-git-send-email-will.deacon@arm.com/
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


