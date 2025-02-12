Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF133C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ+1V9qTPsDzOzqvLQMw/vPgzhrwZ5TSLeEMjw/aHNM=; b=rbwjcCMNvJyMBbg4bMIkOykps8
	6A6DAsH8/5oDYYNJbguln2Tu3mbQATMbmG0Jm3qWfd/r7UCvJLMYca/Kwlzt9J8VGaxLT0OV03exj
	l4QEB1GuX4zrZ0ntpbDOhG8ds7GUHGQSfBl0y2Ce/A4u0Ng10Y5+hYrGVUOrShjpL/VGKT3qkOXTh
	W3uHYK0q6S5jxbatNXXD6O9W9EmTba1bOabDeK9yxhR6G/fLYAjhFwltCqsymNutwtXXqaD3r3zGj
	cK54XvqlsLb+rnILz0H8df8ib1sN0qR1AhSiWS/Cp4kTYNWh0mpZhE2fq6er2Dfid0sqvHYIwOill
	Jrn8pHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB76-00000007DcT-1HS3;
	Wed, 12 Feb 2025 11:41:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApt-000000079fN-0owH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QZ+1V9qTPsDzOzqvLQMw/vPgzhrwZ5TSLeEMjw/aHNM=; b=H0ZLai/+qLxjS5HVrPBxlkUS0E
	hkfvjr6psznY/ksSpVuTFhCcd6B/w6+E6hUp7xhnAnWZILAFlyC1m2CgNh4oO5Vs2twRuHUv3B1gP
	uwPEF3olaz5PROVbwU2+S0L1ZbWmLIqaw3+yMw6QVsQSrKLOaGK9oD1JCzSUUvLuOcrhEMkw4SRK+
	HmOP4csQoBGSFPiTxb4BLZWgZpO1b9B4wdHVRQbAun0Y86s3SoNUq3oMFyQUD0l8HMpBKnXF+L+NJ
	EPcRKrQnqGEX49IRN/TxVLpYiUY0Hi0CEWRxGZjO4FAwnX228N7ufBfQq6B5d06atXCUckVpDUfM8
	gWY5QfUg==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApq-00000000nnT-1DHb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:20 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30761be8fa7so60301071fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359396; x=1739964196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ+1V9qTPsDzOzqvLQMw/vPgzhrwZ5TSLeEMjw/aHNM=;
        b=Z/6iJ5T9IIUIKQt7G1ydUIJa9LK/tUd9jUIoQzW1zc/90UI6LJkh5rlI4gtBvWWMxU
         3rjneteLjaIHRdLaiI2SnJ5W8cEmsWwS4RexfhOOT/W2xbVg9+TaVY4aZ3wo6eWfsTnm
         Y49n7j2H0q9go+qVD4iRMmgYvD3U9RjDDScMr22ZiIDGnLboll1k9VwQCRXcyRJU1/N1
         tVxLDqCTVOE/RXpOOnBwUinciEM1au0gCwE4dhokzzQlm5cA1V24cyKNFrBGBWsdYVVM
         gWWoNTgyOu1Ncts5Y4Ng2X/1iri5ZDbY07X5hM2bj8CPEI7JxOtJzjzv6HreYbU3WOqD
         XgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359396; x=1739964196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZ+1V9qTPsDzOzqvLQMw/vPgzhrwZ5TSLeEMjw/aHNM=;
        b=Hu3leoyiIcYtwlLOkffRWrnEjCSlFBAlM+JF4l4zAVH/07ACht9WF+feBbvdbONoD3
         CUZl0umsZgJbitlhBgv8yUyZWImtYGVfx0QgCfMaVDzFTNvVjt8wjKzzIWs0ZqTKtpUP
         cP7q+MlE2aqSW6RKK5sDb53kFV28KMQwan3EM1IgRPLUpvD5K9dXaiks8Vhyo3aKtf/D
         /D0E5YDtsmKdUJAOZpYUAy7tX7sfVrb/XCcKoo+HPJ25J4+DprEzebuvtLufc/uOxr1v
         rvK58jlbTlIjWMuufyGH7YXbYJbKRSe/WlgDaM6MdfwGAXZfMGzX32jrOhWfjiBo9vVm
         2GvA==
X-Gm-Message-State: AOJu0YzTE68HoGCyqG2hq4OkizkOTwPIdOBjsminFbudwELShtVyTFnq
	J4SYXac8nHw63hH0wAha2lo582+HJ075iRDGI5C8lITK3d22StyPJHVNjFvvQME=
X-Gm-Gg: ASbGnct4f9W0sZHVuDkWWZ9u9VEJ+GLNxG0LNRWhqTeKbZa35eu3MQMCHHWH2h+KQE5
	oMbDuWY5RYBCo+ErFlPJ1jRtBQCgX9B04cZsrTwF80rE5wG6eE9chHJClmAgLfkOQ78eOQsYIR5
	xAqkF+lE2VinTc7mdLSP6jDb7KJ/qEynmUKcheZCGq2Eg7ouCuZNFa3YJ3c1O9X7+CrHMQuAS9t
	RQhi9sPU+pjflmoD7CIANyv+FPUYTvxyRmlkYyB8F7BR5cdeZZtpTCuSUqd1hTroN0gMzKN04EC
	I66Cc+i+ybmgo0oeN85DwC+4vA==
X-Google-Smtp-Source: AGHT+IEy2zhtjzr1xUwkwwU7OEnGwL574LYD2AIUrLmh4kmR8+NHxnHLbPnyZ0TB2gEDQ1t6v/qifw==
X-Received: by 2002:a2e:be22:0:b0:302:3003:97e with SMTP id 38308e7fff4ca-309036dbf25mr11761381fa.30.1739359396492;
        Wed, 12 Feb 2025 03:23:16 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:04 +0100
Subject: [PATCH v4 10/31] ARM: entry: move all tracing invocation to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-10-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112318_561609_4A17FEF6 
X-CRM114-Status: GOOD (  21.21  )
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
2.48.1


