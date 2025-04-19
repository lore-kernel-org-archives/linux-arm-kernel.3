Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6268C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0QkVYjXA/9OCp1QGsNJRd0EN1x8yIqxmjYApguAD+c=; b=S9iCXcsBexal3xWKckdpsJmmMg
	ae8gl1VzOAlCnwqLrd6DUANYJAGMHhZ8Nr25fDlr1uEjF4QpSEz6sCF48DHXGWJfEd49DTU1KWPDl
	uLT7IZBzV4FvtwUVE+iOCGWtvSy3u5dUEePqLzdTbVhrTqjB0x8GqRuUtipknO6/Lqbk1perbmHM4
	xY1j2YYmrOBB1z91ZIFP9Pw8H6JilkzeR+Y0uoXOsLJLaJvIWvxy3UkSCLngW808S3TuEObX0hIH2
	xDE/gOaHZlM8eIjzetWEXCpPYFI2mquBWvMOaRvv0hwR9LtYdLgwrBLobCX7rkVtD8QDQdoPwdk5R
	hRoZgFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HXd-00000001xBm-1Bsh;
	Sat, 19 Apr 2025 23:24:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnV-00000001stF-3sL2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54af20849bbso3210814e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102188; x=1745706988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0QkVYjXA/9OCp1QGsNJRd0EN1x8yIqxmjYApguAD+c=;
        b=d8/0uRAJV2bzsmgB8mRR41cbLt8jT6Bb1uMG/fD/cCgvCaSj8yJ1F98kiB1e/IO0hB
         VtZtRev12opRJ9nmRQ0yW2HUGHW/bWwrW7exLtombAXpk5SFSTHWjJ2Qy9yQRzXBKAk2
         fTxuKKeKUT0q8+StlaQx7NyZ5fKlDKGONTgb4ATJmS7M7QlxBRJakGWbGMY37TRo0jhF
         LPM2H4QB0EiYsI2mEbIoZ3G36nzn8GxT61TeCgXg2FivZG6cc+uunr1TsA+QUEnUqPwP
         6jE7ZQo07j5UYcSetOtsfXp1L9xHX2NoWNcMTr6XQG8zUGXE1DsaTx+wY5q8jKrvEKlh
         kcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102188; x=1745706988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0QkVYjXA/9OCp1QGsNJRd0EN1x8yIqxmjYApguAD+c=;
        b=KUwwLDTP+w7/E1RfT58KmtTClA05AQLo7eukuV7jVZU9d59CsHknd+9goi2PfgHAPr
         i0SDmXOYojm0NzAH8zmgVcgrrd1jEIm31Wx7rMzcqVDFk53xaAMyPsk1D0g8GzY5gaTj
         WxOlSkG/LPc36VyUpUiGy/8cB162AfXAta/1jpWhk6rfSbHltNswjEERVWopwAmiiHut
         XwubZUHB0tH1rw495XcuyBJjZye9D911X1nfSpeMdaziDMGGWoUR5g3BuCRBXYkZ+pPm
         zlS/BQXU+s9N7+SCVaCI1iCBBXRKkQr19472CdQqHTmx/zi7HPRwvIExo1iy3w6VPQMJ
         2ajQ==
X-Gm-Message-State: AOJu0Yy5JW9wCrYrdjR3h/UoZ3zhR/5078D2L5oXhKDnyrC7Q6zbc55n
	VUxWT2uUPJjBzqdgxyfM86+S8VnxPqr4A7DONUIsKW9GPvsxZ/UKzprdARKoskY=
X-Gm-Gg: ASbGncsIzw2K/fcY7bBbuLiHXMEMtgpcHnW8gODFk8m9Ii1PnOU5CoorH/qrZ9KGo0u
	8qxeh/RTYu3BV3+A7RVg9/GPuyPgmVEMh3iCRUXbEqHWQEW1GLqB0hsjaDFBBZssWLxaf4YlCg4
	Yhc6j5kpPKZ5+t120V0eQ199u5BCyg6CQlPeNDvaPcw6hC9+noTKlca4I/T+6vAAy35PeUrM+YD
	ROa7Yv79vISJmlOnsSaEbFw4ocV4VEEHMrA0AEPrpMuGLpxyMQ91pMiluxTV2q57VvrR5C1hXrh
	rrk511H4+vpwAKheDvplQ0CqESZAcpA7Yw9JuvKkFpmod1TNUwQ=
X-Google-Smtp-Source: AGHT+IHDavBZ93agXbUvQF/6hQ58d4kFKhgOO+0wouRyvNbR41VTEJgISr5/oKDvWNecLDObQqdXtg==
X-Received: by 2002:a05:6512:1318:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-54d6e62c9c2mr2159440e87.18.1745102188074;
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:11 +0200
Subject: [PATCH v6 24/31] ARM: entry: Complete syscall and IRQ transition
 to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-24-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153629_968517_D76A803E 
X-CRM114-Status: GOOD (  18.00  )
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

This moves over the last few lines of assembly to C. The
subtle change is that in return to userspace from syscall
(SWI) or interrupt, we need to call do_work_pending()
as soon as the thread flags are != 0, just checking for
work with _TIF_SYSCALL_WORK is not enough (the machine will
freeze if we do that).

This is because do_work_pending() does not just handle
work: it handles _TIF_NEED_RESCHED, _TIF_SIGPENDING,
_TIF_NOTIFY_SIGNAL and _TIF_UPROBE as well.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 13 +------------
 arch/arm/kernel/entry.c        | 19 +++++++++++++------
 arch/arm/kernel/signal.c       |  3 +--
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index e2ac6d3216b6828d948d60c424ff95ccdad12331..6b0f86786a7d9e656ecbe8c741f2edbcbafd2915 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -61,12 +61,7 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	1f
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-1:
+
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
@@ -74,12 +69,6 @@ ENTRY(ret_to_user)
 ENDPROC(ret_to_user)
 
 ENTRY(ret_to_user_from_irq)
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	no_work_pending
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-no_work_pending:
 	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 88a7a699306ab61153d57333c26266b9161f5466..d7fdb9df33312dd2a914b59512b701748f33b597 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,11 +6,6 @@
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -28,7 +23,11 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 
 	rseq_syscall(regs);
 	local_irq_disable();
-	if (has_syscall_work(flags))
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
 		do_work_pending(regs, flags);
 
 	trace_hardirqs_on();
@@ -45,6 +44,14 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
+		do_work_pending(regs, flags);
 	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 03b20637a2e1ca6f327223c9132915a97a9c4697..a39ee14ec5b70b3738ecef537709326ef1e8217c 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -598,8 +598,7 @@ static void arch_do_signal_or_restart(struct pt_regs *regs)
 	return;
 }
 
-asmlinkage void
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't

-- 
2.49.0


