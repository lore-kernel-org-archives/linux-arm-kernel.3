Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78248C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=; b=zO4fm8IFpzt43bjnAomkz2nchP
	k96EHkWdmn7vtHDalqBb1Zh2tXSXuEVkYOJbexKvTdakqajI9ywFNzIEpiiQAmBuT5628NuLrmA1W
	VWNde0AxukwcjC9w7am7YI/9FofJB4E0/x1O948K/SUy2XuHHPiiHh+NghpLjcuPeaw64Yy1MCW8Y
	IBzTClhSLYl8XU6CyWIl6OMU0jRTPWl7p+8p1duJDWE1a3aOe2y9X9Sqi8fuWgxu49zYAOcOTgF7g
	k0GHJTyuJBUQ6La37z2ky4Ohzsx86BsORPcNwWVJ1oJSy9L8ZIrjrqouMExYr/Jn0BPFGSTNXCyLb
	YAyXu9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBGo-00000007Fao-1rq7;
	Wed, 12 Feb 2025 11:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq1-000000079iJ-30xh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=; b=AWZa61c2pCkElSejbPf4x4E0yy
	P+G4ZFEYhvfQy5PWknf6laJB1zMjsvFZPHvome/vi++p0XtV23RoA5E7V0uVIM/vDjBWaT3DzTrf/
	qtdnGpdse3c9x2+om2o6b8ZUCNTmFA/Dv4pP3AKvhmQ6+3efaG1eKRRb+vibydAqfABaXi+c4KOcl
	0NBnlJ5uuDD+mCb8DXM45YbrlwkqRDPe3jvlu++8FCg2pHoj4SafADpryRUhl4Q2i3p75Wcr+aiXR
	vhecqcMQ1xGt4VSCPwdR0O11Xb5JizAIFyVtfsYTzXuXs/FQPQL+ODqQQa1TwgjfnwxFskWCJyHTs
	cx2npBXg==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApy-00000000noe-1EQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:28 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so61919961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359404; x=1739964204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=;
        b=Dhi5Ao3mfjGVcVPewoI0Oj61ssGo/ZBQFdlA5Fh7n7nymJi4qpp9+yyoddtfu89dm4
         vePXTYxiCB15iDILTqa9CaXfu8X02f8k3EUfiFirnyZTsh8xGpuXgcDrnCDTETiG47PA
         9u7C8qtA3VdTp6VG9/fGBRCASEuAntNwJ2IjZMt/s0poJbi/m2oiR4S4bPuAhce14YB7
         +V39TpLhJHsN+OK83QDsekzuiiA6CtinS/ABTJs9VfvwH8a0L5lMHlvcqWK+khXi8xt9
         TfFG65tPwkm1QdYNV7gro83AM/VwydIT2xYywHDVjuOwVlsus42bsVXQskTHUFKhnSns
         E94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359404; x=1739964204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KMIzffvEsBK43v+gCyDeKdrTwv9xJqaffLfxp2Y9ec=;
        b=sE2GZfhl4Rd/U0wx37nPu/6JSQ2d+KU84P7PaiIGQhA9U1Xia7eMrMNE9Y7ETvxJOD
         gpjJjTjEXS/vtIEj5ohwVDystRs51RvkesgKKsnmn9WyCeGR0GLMWXs3wcbAy+Kt46he
         1ZltdRvJWBDPsVMujf9eufX4fqRmgs1KmMeMjw41CSSmWtA+kDG1XsaalQoQfTtDQ/kA
         KHVs3xf4lKgyS0BS63t9tnSxMTCS6a/TwoEAdc27BOqTsaiXVp0mcxZWuGJFQtaaEMeR
         GwXBOCsWs+kaD8dRDvsyazy38Y+BJOXwzs/wQixz652Jv4BW7V4HQc18wE6bBoGlxKKx
         kFPQ==
X-Gm-Message-State: AOJu0YyN+ff4kpZrrQ93S6/Z/L+0GfrPq1HT6RCf9cMZ8dxOnXTisTM9
	cRMG/EbujYWQdJBazlhuibMiMg2t4LBSHYxvwf+Yq/sEn49slVidsgqtbbz2nwI=
X-Gm-Gg: ASbGncs39A7yxTJeI/f5RhbIEy3eErnVRUP+IqVpSSCSjL6iHj+NRgc/LqMWmjfB+iy
	Z8mCtXPPcth+l/plNoqBiTQFCWd7yTh3PDcV0LVMdnllcdRpnamiY/B5VLmgGs0DznZgvIip4S2
	k4G+jnQOt+7/UOfNktORtcyw2Hyq3W/G08b3IIjrVVE3iWwUeisFk2+TNGfa0l8i+efCqbXEimZ
	hfONt5GfzcTAIGnwYUHw6awZH7+UI4BOjIeU+EbSxaYPcYjKxIvQhBRWv77Bm+yDQjwJ2AvSCt5
	yz3ckuD7MqyrgtfmEyVmiYgQdQ==
X-Google-Smtp-Source: AGHT+IF3FbVuyAVSXE6FSKtFUxtJ6fX5M5a69TIwSs1mwLT4jbjl8bopzEgPtqY5QadYENn8IcrBjg==
X-Received: by 2002:a2e:a916:0:b0:308:eb05:9d3e with SMTP id 38308e7fff4ca-309036dc200mr10746881fa.23.1739359403613;
        Wed, 12 Feb 2025 03:23:23 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:11 +0100
Subject: [PATCH v4 17/31] ARM: entry: Implement syscall_exit_to_user_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-17-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112326_536666_503E0288 
X-CRM114-Status: GOOD (  15.49  )
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

Mirroring syscall_enter_from_user_mode() we create the sibling
call syscall_exit_to_user_mode() and start to move some stuff
over from assembly, first the rseq call and the interrupt
disablement.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  1 +
 arch/arm/include/asm/signal.h  |  1 -
 arch/arm/kernel/entry-common.S | 10 ++--------
 arch/arm/kernel/entry.c        |  8 ++++++++
 arch/arm/kernel/signal.c       |  7 -------
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index e259b074caef75c7f777b18199623f07bebee5b4..8b8cc9a1eefbd00dd75d4e344576fc184a413768 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -9,6 +9,7 @@ struct pt_regs;
  * to generic entry once they are semantically equivalent.
  */
 long syscall_enter_from_user_mode(struct pt_regs *regs, long);
+void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 
diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 7acccc96840c8a17744cc3f2894f19d142aba4fd..bb753cd3e29fc54186543c48b2aee7b221301a37 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -23,7 +23,6 @@ typedef struct {
 
 #include <asm/sigcontext.h>
 
-void do_rseq_syscall(struct pt_regs *regs);
 void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
 
 #endif
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index df564388905ee019cd5553f8b37e678da59e3222..3559e0a9f5e079f1af91392bf000d39f9b45906c 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -65,12 +65,9 @@ ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
 	add	sp, sp, #(S_R0 + S_OFF)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
 	beq	no_work_pending
@@ -97,13 +94,10 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 1973947c7ad753fccd694b3ef334fba1326f58b6..47233804733752aef0f2fec6f54badeab18e98d0 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
+#include <linux/rseq.h>
 
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
@@ -14,6 +16,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 	return syscall;
 }
 
+void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	rseq_syscall(regs);
+	local_irq_disable();
+}
+
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	trace_hardirqs_off();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7b1a16e86b236575efdc29cda9b751e8e2a3f64e..03b20637a2e1ca6f327223c9132915a97a9c4697 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -659,13 +659,6 @@ struct page *get_signal_page(void)
 	return page;
 }
 
-#ifdef CONFIG_DEBUG_RSEQ
-asmlinkage void do_rseq_syscall(struct pt_regs *regs)
-{
-	rseq_syscall(regs);
-}
-#endif
-
 /*
  * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
  * changes likely come with new fields that should be added below.

-- 
2.48.1


