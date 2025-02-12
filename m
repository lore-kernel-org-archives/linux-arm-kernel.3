Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B27C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCFlnePKkNndn1RG+PlEu//ug35hNzDbDVRdXX0Jf/g=; b=MdoGUQtorrh38vdV+6MFAHk0Jn
	/KkiQrhmlA/SGN6OJpVmTo9x7onqOxsfWvciD6aWGfQy1wjLijy37RoNjC/mIiu1JOaT0T5pe9pOv
	+nRcoIJO0b5XB+3STbrsFoN2Phn3POtOGmEtyyXDufgMP2KzA+If4Y6U/7mqvuUQnQQhEX8hg3LNl
	l3o12LSR2tv2zpNgSsuSVFe4k2Xt8iE7Tk7kTkjV04M58+klAcSPgJPfb5egk5O0sJCRBNQndawj4
	J12vHYqIbK5/7QSv5XA0Qm4CC9HoEgmfp4H8e+UxGZ31++qWlBItrnFOq2Gst8j1VFZiK4ftLNquo
	pObSke7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAvv-00000007BJP-3hEZ;
	Wed, 12 Feb 2025 11:29:35 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApk-000000079bp-3QsL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-307325f2436so61492251fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359391; x=1739964191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCFlnePKkNndn1RG+PlEu//ug35hNzDbDVRdXX0Jf/g=;
        b=WFLD34OylWj0ia9bJYZc0tX5Osi/e2DyJaGMQVwukCrSNJ+R7uOEAn0+5d3Us61faA
         70PRlGQGXfevVqEDKia7ntVfiniddhCR2yJ2FmLnKU7Qr/wNBBJkt5N/WqYbKGiIf0Ta
         VprgdESfcP0hmMeEmHfLi+gVvgx0Hdb/9Oea0fmREhcTY0ckxu1765GGS/IK5TFtXldc
         9mBJqT/wwtirFHDjo5JUR37lSo8Pgv7HeHtZ0B4dXogCLLauNrR/SZAzbbWPPA/QGf1p
         I55Mp5KXQM7d6LQqGpHampu59ITBx6hF81AQUaSHLAsV+MLRA7T4ZiiBGP4egLDZfkff
         3KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359391; x=1739964191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCFlnePKkNndn1RG+PlEu//ug35hNzDbDVRdXX0Jf/g=;
        b=bqL+lTzhXOUKSD4PKxipGXMivV4yt8O1lSGNwySUREXgZAhZvwRMhZbbnyrmjQyeiq
         PciEtKfkykLqrwLB4GRF8P7DUdvVA+eHH/1fD6K+ywrVk7LYMTrNvmlNm7hv5ms/4t/T
         6Bq6/ecCpJ9y3DepC0Qc6/LEsWHdN1L0jceulm2VnKHHeL+Evt5BJGk8MUqwaySoBJNf
         aOk7SAXbXFYzx/tbtwS8RGC01uzpo31ZeOfiJbD01d2I6AKwLyxlSbP3N/hfGO9vzXVm
         tc0GRRvBAVMEmIcPo8A7FbI2+Xl/TsUOFCZzmn1oUM35ql1iNrN3geWtIBY9amLzch9g
         j+CQ==
X-Gm-Message-State: AOJu0YyY6TdtiyNsYEc3Yv89aGXw/fGr/K1eHWgj25hB2GMzt/1mPa7B
	3Vts9lr7spfPPsX9yY+t044oG8338I30C1YCr+YD6I4N7w0mk+pSJSTRw+jRQkw=
X-Gm-Gg: ASbGnctsHo0mkQqP4IbR1poNs2B8hSc72CzYaHt0mFtjMTSRPqsHcLbKZDjqBct80W0
	8H6imZRVqVHbeoGY1IpR2LdORW+JTIzAZcD3xnGmxf2jUK7NFY6zqGgDU7mSJKckU/ILiBSDTH9
	3ITaVze582HrScI0lekKJIxwwLKebiDe2Dynml3AxkBWRbhtw2stT9ml4pvC+v9Kd2C0oICRXVn
	bYnnq7c18HaepuZTu6qyvCesgfGvfMjJpnDVPx4SjiEtNBwH6NXCSF8W99l4b+etOHFdEIowGq3
	Ya+h5whydF4jqSXR78mtdm4PNg==
X-Google-Smtp-Source: AGHT+IEYodYzadqUx2Im4nLmPVhkj0QvmLDghRs5R4XGCmQddXyPfDz0d1vVwCk+T4sDxY8MmfEg4A==
X-Received: by 2002:a2e:a588:0:b0:300:2d54:c2c8 with SMTP id 38308e7fff4ca-3090369c207mr7437881fa.8.1739359390812;
        Wed, 12 Feb 2025 03:23:10 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:22:59 +0100
Subject: [PATCH v4 05/31] ARM: process: Remove local restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-5-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032312_864219_4F05E0F6 
X-CRM114-Status: GOOD (  22.72  )
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
2.48.1


