Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3EFC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2oUY/WKIEq8Evp3ZyFIu+cgZC04yoqr/o6eiYlPpGs=; b=d8obHRqU4g+ceHvx6XD8kruaVk
	X1wraZd8GqDyMQnoS2w45wNxeLBt02ZGBBX4hK15aHR17FpFfDBkzFL6fprBlvL/KZgC1PPrWXdlG
	BYyfvVMSo8/1yLGe+KhPIr3Z+XnTy6NJDq+GIPNSTugT6EwFb+ZTzB2clFBEHJlMKtOWzeWPiXyEH
	xdKJO9geQzAsULJ0xRaoa4xQc9y+R7snqk+LugkYHx+3euE894cgXADOJgcMFtYk9jTHIvJwJTGDY
	6InIMs7PwBUtzxYi4tqfri6E+OPJ8NHRL7dikJBGfsl6GIrr6sFrEQjYOK4GvydKsnGEp1BcotpcR
	CnmG/QoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms0Y-0000000Gn3F-23l2;
	Tue, 25 Feb 2025 10:17:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmred-0000000GhcY-3vQV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54527a7270eso5408025e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477306; x=1741082106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2oUY/WKIEq8Evp3ZyFIu+cgZC04yoqr/o6eiYlPpGs=;
        b=HUKRLtUuZ97COIrNgn1OjRGqi7CS0wAHODcFTiUj74OOR3vd/FZFnwnePajA2zG0mh
         plqP+wNa83WiTSlXWvJvPEgBFQoUaRf9Xofh/TYYyXVBqkS5tZXGg54zlra7f625Mru/
         LUkdorQMqgcgKYItevpTaxrKTwaWxaMngSJB+bsa6opWQOr09d/sgJBQVWzjTsIGCOHx
         TPbt1gAmuqg5lQzmq+X5RY0rGFWsbb5BjvOXRuCHADk897lVax1b18AObQ/NpKPB50d9
         vCvwx8nnRPnD9+WuEF9SxH1hj5SqgKGocB5/Sx8u9DdMszcsoJ35fRMxPcVXmrZ8agwO
         B7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477306; x=1741082106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2oUY/WKIEq8Evp3ZyFIu+cgZC04yoqr/o6eiYlPpGs=;
        b=v0sM2RMNKm1tRRnMp1ySo96YINm0KWvgR3G7J2bT/vxWVIvBDD706KPdTLqZMQQZbK
         PNg5qeodL7fhLWOsvbVwGXLTHS97MOq1apNQZZWt9Nsx8XPS4/xAUyfGi68u+T/P5Ngx
         viCeYkz5ts2Z5iG4ZV0yVTgnWy32jk9Y0HqsTaJgw6zR6ffrNd9T9B/GxW/PzFOuf+u9
         1BBQb6/9kXlnlsC4pVpL3Acb98OYoN4D+8jQIi3Ajj6+uM19a7TJSuWuT9RUlC0pTj1s
         zxuWgu+5044oUUe+Ze15Zmo/7GY+DfRN8IhNFZL45v3ktmyyf9e4uimY7Nj+YA0Cu14S
         navw==
X-Gm-Message-State: AOJu0YypAJrsU06v4RbfVYGbsfoCKJo+lsnf3gCDzWGUkYkSDHGQsaUh
	sCbfJ5aIo4MR1Z3CltShKww6+S9I00XWafxi8/v0jOVpHQGV8Enrqq5g730BgVk=
X-Gm-Gg: ASbGncu2NZZh3M7mlRFGqqsccg68uLasRqphd2a1wyLjtSEUWC/dTKSfJ2gPUsGYE+0
	98pzHEXGGcu61bRYD5Cf1kaUKWMZPHCuS7NS3EUuvhiV/4p1U2XjXBTubO1RXWH0IrTtPghljLF
	IgBrLlqxig1g3VhvDXgdIeF5SSaZ6XahYGaijaFV6JCmLyR6ZBdnYHKOmSHoCzEpL0QzQwIIXXx
	G2wHWEknoTrJlwmzhEE1POYfP9kknJpQOV4Z7IBjKoFHOGM92Rczol1UaHgxjD/33UofWLf4uxu
	QGuUGUP7hQnwUWwH4pxQE3Jm1+g+ay6GeVxf
X-Google-Smtp-Source: AGHT+IHAFWSNeFOCqj7itWqejwjbFtkz5zB14hTY/lexRvyjjC7gm0PhxyvvhicInIiEhLg5asuYew==
X-Received: by 2002:a05:6512:b05:b0:545:2efc:7458 with SMTP id 2adb3069b0e04-54839259c52mr6699501e87.39.1740477306361;
        Tue, 25 Feb 2025 01:55:06 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:53 +0100
Subject: [PATCH v5 06/31] ARM: entry: Invoke syscalls using C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-6-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015508_009201_A442A908 
X-CRM114-Status: GOOD (  28.54  )
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
index b3333d070390a8ff366a306931614b1b260647bd..69ddf51081f4791982518d37df60c11211b8955a 100644
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
2.48.1


