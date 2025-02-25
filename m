Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC06C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tokJWXMpPS52pGnN85+C7ykU4Uc3aikcglEb93YpSqg=; b=G0CWpN1eLt+lgsl7Vplj6isxhG
	EMtgpNYOEGD1LhCeA5Q6L1Kvj1FUOeP5z/SBRBxWxqO2XB2YH0Y7PHadPln70/YljvLRn51tn/W5v
	7TpoudRycC6UwFZ2GgKqxVNZTvpsGT5vu+u7xcPdB7gJUv1opER9Ihcuvlk1nwKszTX8sxRG4UN2D
	IYTj5klYL+uq2MZrm78XKCA+Hz9v2/1NIc/cHRFm9WyY+AuAdMBpXzWCv2r3DmUN/tdAK0vVD9JG/
	OJAmETJbGdZ/at8zlPGxSP0eTPvoxpjVWckUdsPT+6HGiofrtJK4hZ3FIkzW2ODq/VoZLfQdezvKd
	OPPa/jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrz2-0000000Gmmc-3Oyh;
	Tue, 25 Feb 2025 10:16:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmred-0000000GhcQ-1BmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54843052bcdso2642080e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477305; x=1741082105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tokJWXMpPS52pGnN85+C7ykU4Uc3aikcglEb93YpSqg=;
        b=egCfBPJ5V15MjtHSddryBUV0pmm+w4OgZ9z8+T1lXpe+hWz7n20mVkIdo83UXNinPk
         sU7Xm25E5LDMTRLbOGw2m4GuLAWHxlZhJCOmQTLAKPg1zP1yBBqoL65Zp4la0wqmiu8S
         QFeBHUL7hsPmEjfi9taKxqRiVAzz7JIJXHOZV5GRvH6QmqofD3K4uLesmMNqyy7/WouJ
         80yM92glOb0CGd9rD4b7rJQTkOcDspLqIg0z/R4YQoBfz1Y7Th0Nh+gjrt/0McdjyHjF
         a8t6MxKBGSJClv2TIQeAV96k3gDPjUpZavyRX5h2pCnf/i1F6bL/9GlFRuVHQlTo928n
         lrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477305; x=1741082105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tokJWXMpPS52pGnN85+C7ykU4Uc3aikcglEb93YpSqg=;
        b=gXOGi7IKstGXmTuCYJTFTp97ynZDj7quFb61a7HN01kxBvEUqwPN04yBtlN/sdy5EP
         aUdpb5xL94su7j12Ri9EG8hwPKwa/sgfFgo+luhVNSGT1B98ECdgz9jTKMFTrHssthOZ
         PScQsR6CaWvRZVyo0K6OLi0tVZXFZq+OzVvBjKSvFZ8U7/sZW9Y1rOwSsNnbbgt5qmCQ
         n4IMCThLwwu9sCPyRex4jdazczdFbK0NBSvUvIbpO/C8GPagkJnFDTYctMisYBbbJjo/
         0abfo56HtWA0fYwxVW8ZrSLO5Y5mgh4C2u9I/ykdGn2WQyrdV+CjY8wQo4u/L3JmhkYr
         XO5A==
X-Gm-Message-State: AOJu0YxwJdBve5kjUBeVlWjmjPihdlyHXRBhjRJxms/AmAB6iHUHTQxV
	yvMf6jykOUAnqCAit4MlSpYlaSfTo2KHlYMUzA2TDkhw9uZWh0f0znKJnAgd2Fs=
X-Gm-Gg: ASbGncvQb1eU/B/7h+Vp1y71r1peP1GBwa6Bfz3hu/najPoRsN8p/ZmEvT+g6fW/yb9
	mj0BQyubUXT1WpmxB3ave9B7ZkhIl9wsAj7m1DtCS3hdtOIKfnf9k/VQG5IV9lV6GyhZApVhW61
	72rKIwE3aEwpq90DUnq2GftSNbVjcM597dOrsXL/wL26bZzXy1iOMxnlzc5CpxcDhuNaEIDmfDb
	iTG061nrTNc8Dxudubxr5NGuQm5xSFDxL6NmG8jCuGgwwC9LXr451M75BKIE9+VIA3NilneHr7g
	vcNPjwnraKW1F1LulXr3c+l31teYvgkXZ9C3
X-Google-Smtp-Source: AGHT+IGAmJN5oP6/0azJ8UrklFwsjFNaH/XCFoS/k5MzdQEera2+lJew2uD4+v03oYKKl/xsUE50dA==
X-Received: by 2002:a05:6512:1305:b0:545:2b20:5b21 with SMTP id 2adb3069b0e04-54851109ba6mr924438e87.50.1740477305355;
        Tue, 25 Feb 2025 01:55:05 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:52 +0100
Subject: [PATCH v5 05/31] ARM: process: Remove local restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-5-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015507_332554_44AAB6E0 
X-CRM114-Status: GOOD (  22.02  )
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


