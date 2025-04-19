Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F98C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKbKBVNuxHHKFMXQV5jdXdd9fdcW7JzXWBFz1LBqwDs=; b=g0ZVY61Nafpc9Gwv62DUXqz7T8
	e2uCiMw9O4IBi+8nlUmmWkTtxSJ/G7u11U7YHPZgFiX/zYrUuIQs4gZKfNYaFC5hvPx4WBDGjKiG6
	YiRQUtwe98n2vQPjsmeDvecHgq0KFVBCWBfymuHM16Hn9M4ap6npmwCbKWOQPmSL+f+y7tdVc6Jq5
	a9x1vjccwj+EuRkcsAmQl66aLAGhl80PTPoixpbM8dSnbBqDc7CQvlFTt1Q5ccLesu0j1HG7gtnhF
	I8+RVWayFmRDV3XGOI55aw+iVv7rOfdunkjIA1M2zCz5lzXj1h473tjukY8arubaHf3NEUMhhzeDw
	6SZCmv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Hkl-00000001yWu-3A1Y;
	Sat, 19 Apr 2025 23:37:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gne-00000001sx9-1fjn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:39 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so3101951e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102197; x=1745706997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKbKBVNuxHHKFMXQV5jdXdd9fdcW7JzXWBFz1LBqwDs=;
        b=zkqUzHngin4z015jkBr3Nm/ZYvIH9dtNPV5XsgIV3sFUFv6I7DeCCnt9Y9EV6emJRA
         FdGtZfUkGWDyZqi4OR9D/boCa5Q2r/hoH9Gd4PheexJ5RCW0O2SkNOqlFAeeWLY+Z5pn
         N/101PbJmF8Zn8FG7g/BKMsTHrKc40ud42o2DINjm9FBCqm5ki3PmkPxOO6/LqSNB2bN
         jHf3g5Kl7mD862O+qADMjcOf2fk6BnzenrOHI1uIYdSkBtR4VwTuemGjx1ULR3GLGeCl
         FAvjnprCqjYLNw9mtS4ANuFGmZOCnfV9i3BN17a39O74WNAMA5TgCyS+xEr/9bohInvh
         lEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102197; x=1745706997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKbKBVNuxHHKFMXQV5jdXdd9fdcW7JzXWBFz1LBqwDs=;
        b=N71t9wGNMj/o1+7iV9zJ4iA0G405aPrWw65vCNRRFrCLgaduVk7oN4sqcdvbu6Z3DN
         SDb3qSN6F8iJAZmBI1vqsgxSbaW3yabJ6zllp6CN1M6UCK5wG/sLOUszjuVrM91dMm4a
         4rKjqFOKc18tIWL6qB5XAmmJ1d57xbJ77NHJvUpPGMSIDX5u5DGIjRvFyYZ/C7v1aVaY
         NGCNiE9alJf5FpG+Wr35DlAjF8y6QjcHCfPVwet1uOyD58Kh6Xvkjfrt4tPgJ20a1lZI
         m3YjwY0t6YgiJjAQytorHPZJzwUMIparBIyq6QMOyVShY7lfnyqvqAGlrLP1USHZCubg
         boTw==
X-Gm-Message-State: AOJu0YxSbUytrGkOHbYtIqFVW+mrgkfoIkeQj7oTvySH9f9PLwscGBvX
	r9mq3+8/14fovUsHo6H3YFfYcwRUDhRZRneA8CP2p4JsNkhhNcYic+tCIT7YQAk=
X-Gm-Gg: ASbGncs1XmUqS6lNKw+2OuoIo25jvKcyv7p5QbLuZN1jWnshl2AwrrXezAmLy9Us6LO
	rL14MH4ISs5ltbZePiryJdPfAQrEHju6W8xaAQr1Cx2fLACJs+fkuXn1Hz0vbjxRKb5/0N3SbdS
	mtVa89wa3Lq5sMqonRFJRrJttQRDYqfyo2xB8oBNsNykL+6mjOppSK6l5F5vB4lSgOPygBSLZVE
	4AhMYz+Idwz9OMvv97FvoHiSjN0vvWD26MvP/wGbBPxjm5JLn/vRelmlcIwATt2wrXOKpCzwsqL
	a9TePTSXopG+C/G15Yh7iAEogU4BqFJP8Kf7KWVtRpspTc/lbhY=
X-Google-Smtp-Source: AGHT+IGEswbN+axVcFAc6ETBdVjgjfsIKWDzjM2+TEM0R4FVCzATThuev3a/7i06beqEJHQx3Z2hMw==
X-Received: by 2002:a05:6512:a82:b0:549:8809:ee32 with SMTP id 2adb3069b0e04-54d6e62cbfcmr2154163e87.22.1745102196896;
        Sat, 19 Apr 2025 15:36:36 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:18 +0200
Subject: [PATCH v6 31/31] ARM: entry: Reimplement local restart in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-31-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153638_458865_8D34332C 
X-CRM114-Status: GOOD (  25.83  )
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

The former local restart hack to restart syscalls inside
the kernel if we get restart signals while processing a
system call was deleted when converting the architecture
to generic entry.

This makes strace tests fail so the hack is necessary.

Now, after the conversion to generic entry, restore the
order by reimplementing this with two TIF flags that
help us to issue system call restarts immediately in the
kernel.

This is essentially a reimplementation of commit 81783786d5cf
"ARM: 7473/1: deal with handlerless restarts without leaving
the kernel" from 2012, but in C, on top of generic entry.

Link: http://lists.infradead.org/pipermail/linux-arm-kernel/2012-June/104733.html
Link: https://lore.kernel.org/all/1340377626-17075-1-git-send-email-will.deacon@arm.com/
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/thread_info.h |  4 ++++
 arch/arm/kernel/signal.c           | 17 +++++++++++++----
 arch/arm/kernel/syscall.c          | 22 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 84e58a9cdab63ad264c2cd2bad64239d1912cbe7..09dcaeef645a4ab45f40a14f8d7b46f408225f81 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -150,6 +150,8 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define TIF_USING_IWMMXT	17
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_RESTORE_SIGMASK	19
+#define TIF_LOCAL_RESTART	20
+#define TIF_LOCAL_RESTART_BLOCK	21
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
@@ -157,6 +159,8 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_USING_IWMMXT	(1 << TIF_USING_IWMMXT)
+#define _TIF_LOCAL_RESTART	(1 << TIF_LOCAL_RESTART)
+#define _TIF_LOCAL_RESTART_BLOCK (1 << TIF_LOCAL_RESTART_BLOCK)
 
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 35d2bb3cd2b442dac164548037262e065fbfe12a..a4fc6522124fd3ac3df7149ba38cf4b097196e06 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -541,7 +541,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
 	bool syscall = (syscall_get_nr(current, regs) != -1);
 	struct ksignal ksig;
-	int restart = 0;
+	bool restart = false;
+	bool restart_block = false;
 
 	/*
 	 * If we were from a system call, check for system call restarting...
@@ -557,12 +558,12 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 		 */
 		switch (retval) {
 		case -ERESTART_RESTARTBLOCK:
-			restart -= 2;
+			restart_block = true;
 			fallthrough;
 		case -ERESTARTNOHAND:
 		case -ERESTARTSYS:
 		case -ERESTARTNOINTR:
-			restart++;
+			restart = true;
 			regs->ARM_r0 = regs->ARM_ORIG_r0;
 			regs->ARM_pc = restart_addr;
 			break;
@@ -593,8 +594,16 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	} else {
 		/* no handler */
 		restore_saved_sigmask();
-		if (unlikely(restart) && regs->ARM_pc == restart_addr)
+		if (unlikely(restart) && regs->ARM_pc == restart_addr) {
+			/*
+			 * These flags will be picked up in the syscall invocation code,
+			 * and a local restart will be issued without exiting the kernel.
+			 */
+			set_thread_flag(TIF_LOCAL_RESTART);
+			if (restart_block)
+				set_thread_flag(TIF_LOCAL_RESTART_BLOCK);
 			regs->ARM_pc = continue_addr;
+		}
 	}
 	return;
 }
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index ed3ab51283c06c1398ece2ad3ee1fae16cd03ee8..20b59f5dfdc8d2e8c168ac04c2244cb6371e5672 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -11,6 +11,7 @@ __visible void invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	int ret;
 
+local_restart:
 	scno = syscall_enter_from_user_mode(regs, scno);
 	/* When tracing syscall -1 means "skip syscall" */
 	if (scno < 0) {
@@ -34,4 +35,25 @@ __visible void invoke_syscall(void *table, struct pt_regs *regs, int scno)
 	syscall_set_return_value(current, regs, 0, ret);
 
 	syscall_exit_to_user_mode(regs);
+
+	/*
+	 * Handle local restart: this means that when generic entry
+	 * calls arch_do_signal_or_restart() because a signal to
+	 * restart the syscall arrived while processing a system call,
+	 * we set these flags for the thread so that we don't even
+	 * exit the kernel, we just restart right here and clear
+	 * the restart condition.
+	 *
+	 * This is done because of signal race issues on ARM.
+	 */
+	if (test_thread_flag(TIF_LOCAL_RESTART)) {
+		if (test_thread_flag(TIF_LOCAL_RESTART_BLOCK)) {
+			scno = __NR_restart_syscall - __NR_SYSCALL_BASE;
+			/* Make this change visible to tracers */
+			task_thread_info(current)->abi_syscall = scno;
+			clear_thread_flag(TIF_LOCAL_RESTART_BLOCK);
+		}
+		clear_thread_flag(TIF_LOCAL_RESTART);
+		goto local_restart;
+	}
 }

-- 
2.49.0


