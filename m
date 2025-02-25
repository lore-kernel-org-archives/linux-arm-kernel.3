Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4127C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIYvJaonUYyfEumf+Z+WmSCNyMMQcgPh7imvn/7wUEM=; b=qtt5aYLG9j21achttyG2D39la2
	Kl2ggefQDtrhq381PiXvuyjA1+6FxlKLFo6x2BGNM7bPCiaDVxfs6SHGPPABAauTNfa/jXHYbg1Q7
	tByQMgnAbDPykB1iLJaOVUhm9GRjD+hJD/FYDaLnSfNK9uT1ouCNyTSVHT0yN/FSgADDwiPkfCsxr
	ZPwKKo8TLhUKjh/Bcd3NkwmXHLsIEqYugA0dQiUiwMlCHf2yUnQ5RUV2ZBcwH1G3HxtXV2CLKF+9l
	Tr67d14sVOFLKeFbrzs3mDGbb9I+Fo55NcN0lTgJJEV0AbIPmXE4LyRE8L5Mj5GrWIZvdAExZnS1k
	8lKn3jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt0I-0000000H0yj-20zP;
	Tue, 25 Feb 2025 11:21:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf7-0000000Ghqh-0zZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-543d8badc30so6249369e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477336; x=1741082136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIYvJaonUYyfEumf+Z+WmSCNyMMQcgPh7imvn/7wUEM=;
        b=yRaw/5ODgUONgUohX4nC6CpT2xxQCmmaEXFgDOUFRh2Mq83KDocB8czGy6iBtvjIqE
         O5bqn1GCcyr+GrWMo/1Y1TGOdhguX1O6HInCXpSYRvd4XSJLTxDHnxmzw+rpFvUJWl4T
         8YDK1WCzaIm+EevNEUiAXDmM93sWY680ry3P5wpSTapxWauFBgFmDT5Pc/eWA0bTXIzt
         0K6PrBg5hB+HBYVmDAaaqaV/CSCyzOUrc3xp+LImMvRiJRVNIVgAUVOYFg08R2GmVuxq
         weC8EVjtbKuWKrO+RjZ98bQm6/tCq2oSkNpy8nWWdBc9jyT4sjick3o7Q6OPwFB7x7yS
         cv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477336; x=1741082136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIYvJaonUYyfEumf+Z+WmSCNyMMQcgPh7imvn/7wUEM=;
        b=Gcbmdk0fNHOD109CSWq5PwX2zwrYSeBrdnVfgR6wTUaHeRaLuPLpWv9MkXOptpEK4D
         TmtpvR/h1YoZOwW84vVE1PodCgb2eWQu+vT21a796FNh7/FUDuVqmi80ZKpTUyN9UiBH
         zcmvQdPTQvdB1EAXm8J9U2fZnJPMXixZSuI8UNNdRqGB3Sy9QIbjpy9i0SvgwiZmpN4T
         NOS7Ali2Xjc8TNpQZcEXKx5JO+zZeDxVGfP11AAXiqj1R55Xj1UO6Mok0ykqTNjPEK/6
         l/b1vUiz5yfjIFwFsKyGJ/2scuSLPpLGh1PY8uStoEhr0KsD/YwgWl8euUB7eSaGXLUL
         ypWQ==
X-Gm-Message-State: AOJu0YwLg1EO9oTl/WY+ScXXrzS3W6paNz6IYPsp0o0CoN5nxwWZYKlV
	PDK9zBfu9G2m5xFah498g7MebtxsLjroOGugpDgNeJTwehDy7o8cZses/SaCPzg=
X-Gm-Gg: ASbGncuCOVHD+R57QejKC/muhaCoXsJtknXOu99s9huhBfJQ6ERBrn1l0fMRorg7MMF
	Ep4QQj8gR98Du9A133WyYhPGo6H6TDTSsQfSA2E5QDHJBZY4Wbh97uR/r6SQQKcMsER2HyBR0xI
	OP3Sm4WelyukqO7wNZrb8WZOE+Q6NXVAnfxNSbwlGNGQ5rgJqtoBJy2mgoKLcQxc7TSrVEa/5Xw
	kvUOEMlOfU422NuddK9EgA3e1Tp83xR5Unpe4lUToPGbFWlDlA/jaWtOoY94srHKsxPT1KVUIp8
	ior96jZZHwEe5GGbrlXl8rj5ObbleGMRJpif
X-Google-Smtp-Source: AGHT+IEadLgBcodjV4MeijK1RxbLNXPOedOFvhDLMaZ6EVsgBHRAKm5NLB+ewxhEdUYnEE+8TXegEw==
X-Received: by 2002:a05:6512:224b:b0:545:54b:6a05 with SMTP id 2adb3069b0e04-548510eebcdmr998842e87.45.1740477335666;
        Tue, 25 Feb 2025 01:55:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:18 +0100
Subject: [PATCH v5 31/31] ARM: entry: Reimplement local restart in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-31-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015537_283227_D09F0095 
X-CRM114-Status: GOOD (  25.09  )
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
2.48.1


