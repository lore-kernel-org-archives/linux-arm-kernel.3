Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E70AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiM2m9ABoxfWOeD3G81zWg3PRWoAeqZTvFDZw3I7hGA=; b=iBJerFrsteRl6DbFAWb0NBVBr7
	3NHCeIxn801zTX54rUlPmitjDo+y1HIlvYhcSD5F8lVlte4jxlSRSHmerIQAcAq6k/7ytw/O35Y2a
	QUGXGpUJmdMMHoN6t7oiF8Occ4IZhRY0ivWqyIKzLThbSTuuIlopgNjwMXnRPXOfK6cbGj9+/cidn
	WJJufaYyypvVkMQ72oAD1q/aufkPKDn8vn05hwKCqhJLel+TWDK3QY2k5AhZxFhrYnJb4hGTSyoIV
	JFJhldFvogxzdvmi6zIomHzBD0OSot5aJWvgFuDBiPg9IBmUK7adQGcNp6AfoTahbXtFae0vQVUw+
	7ausJxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6H7X-00000001v9i-3Qi4;
	Sat, 19 Apr 2025 22:57:11 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnD-00000001sjn-1qlm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54b10956398so3476801e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102170; x=1745706970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiM2m9ABoxfWOeD3G81zWg3PRWoAeqZTvFDZw3I7hGA=;
        b=OljFh8F1Q/Hv/3wuL6WV5kZEG9eA4deIxRliPkK+e0TqTfnjVW2+VKHirvPRWlFigF
         xlTrXgCyC31h3ZHCdlibbnL8iqZRAgK5tsc01socJ9+y8z1WZ0ksUkyoW7BGEIY1hUyq
         vHU0Hraw62Jfh8S2ruMSt5os/02r5lX/pynKu3++4tRx947t2E3F+roT53sX1Xpxt09F
         7tBgRYwV3GTqd2J98BcTTP5bNWpFGChIURcbghtOqgpk3cnALB0C45a8ZV/JppbnONV6
         +DBt+sKR8YUtqCkx+kzp/oCAxtZ8m4UkQpyw3QabOWlnjhP1xpSot/4LsDtBNzl495I7
         HZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102170; x=1745706970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiM2m9ABoxfWOeD3G81zWg3PRWoAeqZTvFDZw3I7hGA=;
        b=dYKarjmpdxEfR+qNYRSHZZQSr3/nfZDPK+K7HPWfN24EUS6J0Sdy8zQLaciIkvNERv
         NUxkqaKAl7xnG5pd1DKUn4sfxVP6Tdfu6UzxJPsjjtx9CXH6fy8Nk8IVfxSV6MutZeAY
         k8wLbCazJFafAjVWmIuqvN6y2YqByT+JgfRga075AwWyj8mMEqc9h8XKJ1vMZzgeRhiQ
         4CRJTPOaUi5AIdhdZNAvHGwO2K7pEWJ7lxO4E9cbMO57UFs87QaGPxQ0A/ML6nb8u8fZ
         wQ+4CLCxTWgzEWi5Pgkkg1X6wngeqMKAboUsv5aNPER8SLhVZYAuTYziGUdihsEcv/F3
         NGpw==
X-Gm-Message-State: AOJu0Yy1fOVOCZrKzy3Idh0HqKtKqGdlsXxXwIZG5Do3XMo3VbypyXDQ
	FicNz7Wdi0Mq4TOv/2CanYA7yAdFek0h+5TjOS2UEVtqmmwA/+Rh+8VlDV3zkgg=
X-Gm-Gg: ASbGncu4PDb7krgrpDuWyYYuBJM27CfeH2wgbwvpSaUkk+NnJrQO7sQlvSzUlzcFN4I
	gv7K1jdGdVePh3uiwoxP9kKYBbmsB1zzqjSod3gkkDfyf/kC5ofxSQO+Fme+c+rbwecjtlEZOQ7
	jcjubAGQkBw6RDPOqpovTQ+sxEU90FeLW7Pl+l26erQ+As1XA5zpjBKas82uKhuqi7/uRfbQ46K
	rgt6TUyCoLixi4UwIjk9M83zKtvjNnF33wFG2W/5xZhEGFIYJ/NYYmDAPQTb5kOUsZlCInI2A+A
	OJyeSJnKFy88MSbnlfNylTXrTJRiL3YlaoYZ4HBiyH8dnOEBzZluX68qG2uinw==
X-Google-Smtp-Source: AGHT+IFUHnCFl3rwYhxdXisPsoj8SpByV0bgu6OwD68TwJ1OsQbpjFjweq7RH2TQHdNEzdVERV/lRQ==
X-Received: by 2002:a05:6512:1151:b0:54b:f99:776c with SMTP id 2adb3069b0e04-54d6dc055ebmr2313462e87.24.1745102169877;
        Sat, 19 Apr 2025 15:36:09 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:57 +0200
Subject: [PATCH v6 10/31] ARM: entry: move all tracing invocation to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-10-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153611_501599_22633CA2 
X-CRM114-Status: GOOD (  22.06  )
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

The traced invocation of syscall is rewritten in C, moving
over also the call to syscall_trace_exit() to C.

To do this we cannot have invoke_syscall_trace_asm() be a
leaf call, which is the mechanism we hithereto relied on
to make sure the stack is pulled back to the state we were
at before we called out to the code written in C.

Push the registers potentially used by C on the stack, and
make a copy of the two stack-pushed syscall arguments
on the top of the stack before invoking the syscall and
then drop these copied arguments and pop back the
registers before returning from invoke_syscall_trace_asm().

As we are now calling from and returning to C, we no
longer need to pass the regs pointer around so drop it.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 32 +++++++++++++++-----------------
 arch/arm/kernel/ptrace.c       |  2 +-
 arch/arm/kernel/syscall.c      | 30 +++++++++++++++++++++---------
 4 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 66067d165ba3fbbe0f840a89ae396eb1a311bacc..cb0073c4151bf70a82d15e17a95b6b6f48b245d6 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -20,7 +20,7 @@
 extern const unsigned long sys_call_table[];
 
 int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
-int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp);
+void invoke_syscall_trace(void *table, struct pt_regs *regs);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 8baab7f97f59c434396f30b08ddd3029c5f9c0e5..dbc947d301ec11bb13007cb4bb161c035ede5c10 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -296,22 +296,11 @@ ENDPROC(vector_swi)
 __sys_trace:
 	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
 	mov	r0, tbl
-	badr	r2, __sys_trace_return
 	bl	invoke_syscall_trace
-	cmp	r0, #-1
-	bne	__sys_trace_return
-	add	sp, sp, #S_OFF			@ restore stack
-
-__sys_trace_return_nosave:
-	enable_irq_notrace
-	mov	r0, sp
-	bl	syscall_trace_exit
+	add	sp, sp, #S_OFF			@ restore stack pointer
 	b	ret_to_user
 
-__sys_trace_return:
-	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
-	mov	r0, sp
-	bl	syscall_trace_exit
+__sys_trace_return_nosave:
 	b	ret_to_user
 
 	.macro	syscall_table_start, sym
@@ -437,18 +426,27 @@ SYM_FUNC_END(invoke_syscall_asm)
  * r0: syscall table
  * r1: regs
  * r2: syscall number
- * r3: pointer to return function
  */
 SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
 #ifdef CONFIG_CPU_SPECTRE
 	csdb
 #endif
+	/* Save registers because we are being called from C */
+	push	{r4 - r10, lr}
 	mov	tbl, r0
+	/* Make space to copy the two syscall stack arguments */
+	sub	sp, sp, #S_OFF
 	mov	scno, r2
-	mov	lr, r3				@ return address
-	ldmia	r1, {r0 - r6}			@ reload r0-r6
-	stmia	sp, {r4, r5}			@ update stack arguments
+	badr	lr, __invoke_syscall_trace_ret	@ return right here
+	ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
+	stmia	sp, {r4, r5}			@ copy stack arguments
 	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+__invoke_syscall_trace_ret:
+	/* Drop the copied stack arguments */
+	add	sp, sp, #S_OFF
+	pop	{r4 - r10, lr}
+ ARM(	mov	pc, lr		)
+ THUMB(	bx	lr		)
 SYM_FUNC_END(invoke_syscall_trace_asm)
 
 #ifdef CONFIG_OABI_COMPAT
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 07b0daf47441f1f76a8af416acc74fa5ed770403..ac7b98ae47249b4a00fc1cb871bb2d309bfd8c88 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -888,7 +888,7 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 	return scno;
 }
 
-asmlinkage void syscall_trace_exit(struct pt_regs *regs)
+void syscall_trace_exit(struct pt_regs *regs)
 {
 	/*
 	 * Audit the syscall before anything else, as a debugger may
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 377e16c8c53c8e809e3f8b157a889ef115d5c043..e90f04f35b3485968a1e9046cf0889f56cca92e5 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -18,23 +18,35 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 	return sys_ni_syscall();
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
 __ADDRESSABLE(invoke_syscall_trace_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp)
+__visible void invoke_syscall_trace(void *table, struct pt_regs *regs)
 {
 	int scno;
+	int ret;
 
 	scno = syscall_trace_enter(regs);
 	if (scno == -1)
-		return -1;
+		goto trace_exit_nosave;
 
-	if (scno < NR_syscalls)
-		/* Doing this with return makes sure the stack gets pop:ed */
-		return invoke_syscall_trace_asm(table, regs, scno, retp);
+	if (scno < NR_syscalls) {
+		ret = invoke_syscall_trace_asm(table, regs, scno);
+		goto trace_exit_save;
+	}
 
-	if (scno >= __ARM_NR_BASE)
-		return arm_syscall(scno, regs);
+	if (scno >= __ARM_NR_BASE) {
+		ret = arm_syscall(scno, regs);
+		goto trace_exit_save;
+	}
 
-	return sys_ni_syscall();
+	ret = sys_ni_syscall();
+
+trace_exit_save:
+	/* Save return value from syscall */
+	regs->ARM_r0 = ret;
+
+trace_exit_nosave:
+	local_irq_enable();
+	syscall_trace_exit(regs);
 }

-- 
2.49.0


