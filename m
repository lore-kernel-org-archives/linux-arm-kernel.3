Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B084E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mrz9pc85brY24UNXnbG/br6V/oQ7kbdLPycDpNkgqOA=; b=xzJQUTPIWupKQDX4GProgLGKNd
	4Fhn8LIrHBpgLJh8kNpTsNg3EfLhOBZzuDpEcIwY48O0qnGX4n+iaMpeF5KVakDK2lsPw9zX3oQyD
	/H7E3Z3T4UhR2cPCFKLP9pjZajPNOTtpep7/e5UZGp4jVTZTJeqo4AxDiWxO3vFsyP3VpIBp51z4M
	MnZ8o/JyoH6iuzVV+oj3hDnPTZB0+ZKHhzkwG4704gByBO6dCGZ2GiIGN46N7Cv+9Vn/AHJIp2SRu
	5839O17ad0NBI7+gXQIazEoBgl4N3Fq8D4pXOdOK+/n8y3axgPIz4Ch5Ytju6e3hVBQEQUsJseI56
	M8PPeJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Dk-00000004DDT-487O;
	Tue, 07 Jan 2025 09:49:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65f-00000004AME-0HkB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa692211331so2940850266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242894; x=1736847694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mrz9pc85brY24UNXnbG/br6V/oQ7kbdLPycDpNkgqOA=;
        b=POKUctrygjanc8h45HKQUWHqr3yYzdMkyaUa8p/I+R8ZXo6iY8y2Lkgx4eY5ZrJCc+
         mWl5CiwWfBTJqnftcUzmzx6uiv/O/mQyShqBHl7lCPn0u+QGCUUXK1uOXounCG4b6OeO
         /g6pNYV6oPvy3TaAFMsiv2MqXxdhH3zK/tuvm1mGOX1f7Se1twQ+HN3HLRYQVlp8NOpH
         4c2ruAENojyMLM1ngS8qLI6QvABP4ZiuNj1jEw+BHMt/00HIWfv2NB8hgkdf23bfQZgz
         B11hQk5BZY1nJPHF6LK9vHb7ATq7yKH+3PLsMsERxuqu1qbWl0goGcsK8m6V/lsRo44N
         YnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242894; x=1736847694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mrz9pc85brY24UNXnbG/br6V/oQ7kbdLPycDpNkgqOA=;
        b=F056RYM3JygncYDfLMXrp/bJepI1wnMZt/PX1D/5G0b0MnHUNsOJFMNq5hh0pV4+6G
         cIcC+9IK1KnuPvuCEW6wPCyQts/zbZo3dqe7H0O1Q3cCGqIkwd6IKymuuiwxG8ign1AG
         RuMo5W3RcSHmHLp0vntXyHNkOoZeNC5GSmYA0PP88Ci4Je2q8HLB7y/9/rLN6ygC5/Ar
         L2Q2lsIo/Tjvi+Q52Mw7HLeAbKFLm11m514Q6jcmavfOu4vQs/rWhQjNYzQZv2HI258L
         FFhPTkuiF16TA0+4DzxCHx/RuHU2rVTr/SLARVPT/ceFxMZu3Yl94LMArBgOjG+K/DVg
         6bIw==
X-Gm-Message-State: AOJu0Yz3LDfY776AI8yVDVPjgweyNQHjHnTeYsPrvME/fAHOBUN90UJi
	Oapr7kADoJCMjYpjcqcmEK/pkDUmnsttMhQKH7bTrxv2OfIaipK2jnnQqAUHmWQ=
X-Gm-Gg: ASbGncsA6BejRQBJToWzam0EjFwKdRvw9l4ULMmSr0u+DN5e0dhyAXX8U1XtXcDCt3k
	tYxR/4ht8Soqf4dbyLDH1BzFq0WYyzZHwgMwgIVljavAu2PqSm5UhUIhEt6Snt/OsVyqGMmOJGg
	oXlYhNjkbFkMeZjYN6Rf2baeb6wFJmhB2lxRsK1V5S+YS3nkdgHa6rvQ0Dqi/an30vV0LJoq9pr
	E9sUPI4okRAMgWu7grI2mPhnBUx/IKk15yIejwBlrV0G2YRE77hmBZzKhS7MMudtf8=
X-Google-Smtp-Source: AGHT+IE738Tqr3jv6Gy2r2AS56pcvxRwCYsE6u9XLiSLTVsU2J8/19plrBtKkqKUhsaBw0bxCxZ+nw==
X-Received: by 2002:a17:907:36c8:b0:aa6:88a2:cfbd with SMTP id a640c23a62f3a-ab2918b5170mr192603366b.22.1736242893618;
        Tue, 07 Jan 2025 01:41:33 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:22 +0100
Subject: [PATCH RFC v3 06/30] ARM: entry: Invoke syscalls using C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-6-4e5f3c15db2d@linaro.org>
References: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
In-Reply-To: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014135_134919_50F56EA3 
X-CRM114-Status: GOOD (  28.39  )
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

This makes the assembly invoking syscalls switch over to
doing this from C with a small assembly stub to actually
jump into the syscall.

Split the syscall invocation into two paths: one for plain
invocation and one for tracing (also known as "reload"
as it was reloading the registers from regs). We rename
this path with the infix "trace" as that code will be
trace-specific as we move code over to C.

Some registers such as r1 and lr get cobbled during the
C calls and need to be restored when we return.

Right now the part in C doesn't do much more than check the
syscall number to be valid (a test previously done with
a cmp r #NR_syscalls inside the invoke_syscall macro)
but we will gradually factor over more assembly to C that can
then be switched to the generic entry code so the exercise
gets a point.

Since both functions are called from a C file that is in
turn only called from assembly, the functions have to be
tagged with __ADDRESSABLE() in order not to upset CFI.

Tested with a full system boot and by issuing some command
line tools with strace to make sure the tracing path still
works.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  3 ++
 arch/arm/kernel/Makefile       |  3 +-
 arch/arm/kernel/entry-common.S | 65 ++++++++++++++++++++++++++++++++++++------
 arch/arm/kernel/entry-header.S | 25 ----------------
 arch/arm/kernel/syscall.c      | 28 ++++++++++++++++++
 5 files changed, 90 insertions(+), 34 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index fe4326d938c18efb54c96930e6b52ab7da9b2942..1d21f26ecf510ac00a878b4d51a5753ee49475f5 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,6 +19,9 @@
 
 extern const unsigned long sys_call_table[];
 
+int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp);
+
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
 {
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index aaae31b8c4a5dba25b4cd362fe95e5ad2fa0df6c..d5a128a4228dbdf5825aca7385deb94b473716a8 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -20,7 +20,8 @@ CFLAGS_REMOVE_return_address.o = -pg
 obj-y		:= elf.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
-		   stacktrace.o sys_arm.o time.o traps.o
+		   stacktrace.o sys_arm.o time.o traps.o \
+		   syscall.o
 
 KASAN_SANITIZE_stacktrace.o := n
 KASAN_SANITIZE_traps.o := n
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index da5c2d4b62e56cce644b15e329ab4149d69c5b79..57aa1084a0476e9c218cd100ce4fdf4aaa748234 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -254,21 +254,23 @@ ENTRY(vector_swi)
 #else
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
-	/*
-	 * Reload the registers that may have been corrupted on entry to
-	 * the syscall assembly (by tracing or context tracking.)
-	 */
- TRACE(	ldmia	sp, {r0 - r3}		)
-
+	mov	r1, sp				@ put regs into r1
 	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 
 	tst	r10, #_TIF_SYSCALL_WORK		@ are we tracing syscalls?
 	bne	__sys_trace
 
-	invoke_syscall tbl, scno, r10, __ret_fast_syscall
+	mov	r0, tbl
+	/* r1 already contains regs */
+	mov	r2, scno			@ syscall number from r7
+	badr	r3, __ret_fast_syscall
+	bl 	invoke_syscall
 
+	/* Restore regs into r1 and lr after C call */
+	badr	lr, __ret_fast_syscall
 	add	r1, sp, #S_OFF
+
 2:	cmp	scno, #(__ARM_NR_BASE - __NR_SYSCALL_BASE)
 	eor	r0, scno, #__NR_SYSCALL_BASE	@ put OS number back
 	bcs	arm_syscall
@@ -301,7 +303,16 @@ __sys_trace:
 	add	r0, sp, #S_OFF
 	bl	syscall_trace_enter
 	mov	scno, r0
-	invoke_syscall tbl, scno, r10, __sys_trace_return, reload=1
+	mov	r2, r0				@ scno into r2
+	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
+	mov	r0, tbl
+	badr	r3, __sys_trace_return
+	bl	invoke_syscall_trace
+
+	/* Restore regs into r1 and lr after C call */
+	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
+	badr	lr, __sys_trace_return
+
 	cmp	scno, #-1			@ skip the syscall?
 	bne	2b
 	add	sp, sp, #S_OFF			@ restore stack
@@ -415,6 +426,44 @@ sys_mmap2:
 		b	sys_mmap_pgoff
 ENDPROC(sys_mmap2)
 
+/*
+ * This call wants:
+ * r0: syscall table
+ * r1: regs
+ * r2: syscall number
+ * r3: pointer to return function
+ */
+SYM_TYPED_FUNC_START(invoke_syscall_asm)
+#ifdef CONFIG_CPU_SPECTRE
+	csdb
+#endif
+	mov	tbl, r0
+	mov	scno, r2
+	mov	lr, r3				@ return address
+	ldmia 	r1, {r0 - r3}			@ reload r0-r3
+	/* Arguments 5 and 6 are (hopefully) on the stack */
+	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+SYM_FUNC_END(invoke_syscall_asm)
+
+/*
+ * This call wants:
+ * r0: syscall table
+ * r1: regs
+ * r2: syscall number
+ * r3: pointer to return function
+ */
+SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
+#ifdef CONFIG_CPU_SPECTRE
+	csdb
+#endif
+	mov	tbl, r0
+	mov	scno, r2
+	mov	lr, r3				@ return address
+	ldmia	r1, {r0 - r6}			@ reload r0-r6
+	stmia	sp, {r4, r5}			@ update stack arguments
+	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+SYM_FUNC_END(invoke_syscall_trace_asm)
+
 #ifdef CONFIG_OABI_COMPAT
 
 /*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa913501cad8b55ef04a2b8ab3d44f3e39e..52b4fa97226dbfa4b55aca8eaf74ae24e1e220f8 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -389,31 +389,6 @@ ALT_UP_B(.L1_\@)
 #endif
 	.endm
 
-	.macro	invoke_syscall, table, nr, tmp, ret, reload=0
-#ifdef CONFIG_CPU_SPECTRE
-	mov	\tmp, \nr
-	cmp	\tmp, #NR_syscalls		@ check upper syscall limit
-	movcs	\tmp, #0
-	csdb
-	badr	lr, \ret			@ return address
-	.if	\reload
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	ldmiacc	r1, {r0 - r6}			@ reload r0-r6
-	stmiacc	sp, {r4, r5}			@ update stack arguments
-	.endif
-	ldrcc	pc, [\table, \tmp, lsl #2]	@ call sys_* routine
-#else
-	cmp	\nr, #NR_syscalls		@ check upper syscall limit
-	badr	lr, \ret			@ return address
-	.if	\reload
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	ldmiacc	r1, {r0 - r6}			@ reload r0-r6
-	stmiacc	sp, {r4, r5}			@ update stack arguments
-	.endif
-	ldrcc	pc, [\table, \nr, lsl #2]	@ call sys_* routine
-#endif
-	.endm
-
 /*
  * These are the registers used in the syscall handler, and allow us to
  * have in theory up to 7 arguments to a function - r0 to r6.
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
new file mode 100644
index 0000000000000000000000000000000000000000..edc0ac88ec60ce3f23149a526de7dc1205906552
--- /dev/null
+++ b/arch/arm/kernel/syscall.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/syscalls.h>
+#include <asm/syscall.h>
+
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+__ADDRESSABLE(invoke_syscall_asm);
+
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp)
+{
+	if (scno < NR_syscalls)
+		/* Doing this with return makes sure the stack gets pop:ed */
+		return invoke_syscall_asm(table, regs, scno, retp);
+
+	return 0;
+}
+
+int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+__ADDRESSABLE(invoke_syscall_trace_asm);
+
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
+{
+	if (scno < NR_syscalls)
+		/* Doing this with return makes sure the stack gets pop:ed */
+		return invoke_syscall_trace_asm(table, regs, scno, retp);
+
+	return 0;
+}

-- 
2.47.1


