Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202EDD2AB25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAeVmp86zd6G4zC8AXuoLcHe5Kdpm6JlP18N2B6Kh/4=; b=kssxCOXKNZFYb79VBditm8Jzro
	zYwV2OlXToiCL8xHT50Izp3GUGDfRJO0EMEnh58YLrbdghzxTeZD93z6DZ1tdPNbGuUeswclNxaHD
	XkgTNCnDzYrnTCmQL0JUrdIBeuvUBYbTdYol+sdWtPtPJJwpurPDu53Hi+x1sSVQyUNA7Q9+O0g8n
	HjrgrR8rzYgR96mOs9iee12DZCUPHdnl+LrknWcsGHBoG0V+LWPI+EtR8VYMX1QAFJkpDs9zPsqZ0
	OlPD0FyC0c4QF/5yt2adNTUd4XSjeYbvyMaP68tHUMFP03d63xt0MkTILIzIXniESdCPIXZu1HNfc
	1rYk4YVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kn3-0000000EIkA-3Ugp;
	Tue, 29 Oct 2024 11:53:37 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqT-0000000E7JS-2WjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:07 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e4b7409fso5072543e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199184; x=1730803984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAeVmp86zd6G4zC8AXuoLcHe5Kdpm6JlP18N2B6Kh/4=;
        b=lI81DDmZzMmcWHpbeO2QCCiNUrY3pRPAw0yJexotC3hD2QDkMFoMs18lWP4IQkOn0B
         ZNUuIxu7kh76ssGoMWZhLquMtnprgCTTz3MJBOI3eyBvnGMIqbuw/++WurNaVtvwVGbq
         wkFSrfBdpeLggSMdBb3M9iH6jnzoL+ayIwgOOx8Z8McOyaJs2iiinRjpwY+SBI6kEFus
         nWilEoK0rZNzK19Ojq0ZAnjqnoSkhhZ+t9+DH7Ok+K6YxKdyKAogNl7IX3mZrBz/bCEL
         FNNapnbOw4j5GRQd25eVXkoIOs7nistjvq8Ed9Z6Y3kARTf4mr1q/QrWDkwui/QLckG/
         gKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199184; x=1730803984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAeVmp86zd6G4zC8AXuoLcHe5Kdpm6JlP18N2B6Kh/4=;
        b=Xn5aeBS0yaE5XgUBIQGw0VBk1Ax0m5lkmF9vdpxL4UytQo8qGQ90Hk30VKUVtG9pPM
         9pGQmQXf8v+I2/Fd2wsigvQkwwkKzLvo4bJaDeMCRBRAgav7soy7mHVOEpfEHJ51gpDy
         JGHjCWE3ZYqqshlFcV2qb7tZKJXN8F2520zo8xew0v6lWeQqInFL29+7v7nwRRQZw9S2
         nRO4ad5WQZX8KwXeQE/bVIyXkkRDCAFg++lYds6vb4Jxu33J2Rsvnjiq/JPn4oqMWQw+
         OJ2OUg3rvfTBon/J/X808IU5pisg1y2Tek5u4jGcz686kot1QeTjyuAw6di9Vfjj2qZg
         oR0w==
X-Gm-Message-State: AOJu0Yzj3MBbyfxoHK++Yy03miJeXw2r9zVtsYNRJlY2ZLeq6rKC1m+a
	r7jDtdT99cTz+kSmPxISFe677szTbRxGrg+TyWOiJKSwsvvJ32Wddl49nAJ4TGY=
X-Google-Smtp-Source: AGHT+IFefyGlbbRKMfUFrz0xvxG/5dLGzWVofaMM/165xooZgf0Xpl0v+lfmrHJRxGbEyXi2pOzvbQ==
X-Received: by 2002:a05:6512:696:b0:539:fcf0:268e with SMTP id 2adb3069b0e04-53b4922ad58mr608713e87.14.1730199183928;
        Tue, 29 Oct 2024 03:53:03 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:50 +0100
Subject: [PATCH RFC v2 10/28] ARM: entry: move all tracing invocation to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-10-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035305_684689_27B22823 
X-CRM114-Status: GOOD (  21.27  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 32 +++++++++++++++-----------------
 arch/arm/kernel/ptrace.c       |  2 +-
 arch/arm/kernel/syscall.c      | 30 +++++++++++++++++++++---------
 4 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 66067d165ba3..cb0073c4151b 100644
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
index 8baab7f97f59..dbc947d301ec 100644
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
index 07b0daf47441..ac7b98ae4724 100644
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
index 815312f7b254..3ee367958298 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -17,22 +17,34 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 	return sys_ni_syscall();
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
 
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
2.46.2


