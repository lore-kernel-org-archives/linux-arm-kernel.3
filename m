Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E1C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=; b=tfvbc4kJAT7BF/FwwgRsvlCArX
	lklyMuACGCmBhsLdc/a7QaeN05VgbiA+byesZoB14hyL2N2bI0X8EGSTuGCmP+hcQIE6kWfaVKC7Q
	lAo2ToTxOn9zjV5U+IL1o9SSEpK1Br22Yo7CjhLl4szXWL+JtgxnaGkHSoWrE8/Oup1zhEgM68Fn0
	gMaxOu7fL8BNN6fFz02okVMcUTPI9Tp6myoz7UFQ13KUWg1aaruMt1tjIw57LOKim6dkUTThQ1BHl
	piBEhQa5FPqcUq5E40+KO789FbnFxBHZmNmLk+RX2nmGgNd15Umb9SLdwsgUxDtt/0Mn4MGwiJWj0
	3xH2zd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms25-0000000GnPk-1Uo4;
	Tue, 25 Feb 2025 10:19:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmree-0000000Ghd4-3vpz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5452e6f2999so5747078e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477307; x=1741082107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=;
        b=XVKL3hkNlLU4F2XxrUuciZlkuJSt8Axm6vV7zlz93raptb2gfeA5iDlxD3T/dtCZ+A
         qZU9CSzIviPF0u6/qixkvhAm2qVECiYE6kj/JE+ik9BBdhSh4s7Z4EgiJyszHmR1dOc+
         ipsEHCQSX2P93/nkImoCdcQ0Ha8cx76nwJnn+EGHn52puttu5ta5BCqzulnMcLW0qSbo
         7ASPM6BrM6GQo7Q0RUHO6IoJew0tCjUpnk/gf/LuN1W+W4RE3q5JjqKfu4+a2oR4lbUV
         jAk7e62ufs7AnmZXl2NNsgGvNgOg+iXZEmCOICjdAsKZ/Gd1VbL5gk6Sq/D/2IWOPnOM
         8FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477307; x=1741082107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=;
        b=cag0VJpbAMtgVrgXL15+H5eV26zmoRTH/porMHzZzXwGkJ8rOWj78oQIyHzfNtTOAL
         sO01qOtCJa8XMaFhRAwGLY/Ij1HlLClo8IlcqZhqNhupWiTtuV7XOS2zGpSLRDEh//Dc
         qxx09iI3lq1NfWEkUeRZJwnHBKqauFjKlu4gMAQFq4mApPvMP6uogANNbwpe+vdUxB6g
         /R4tm6BFthl3NgPqC8lqaMFLl2KdynLC3hOOgsanxQTJjqzmqGtXTmS4nJRJkxRFNB9i
         pT2bBqQw6SDbbqiQrqGTqrvUmxRlo4CMkK+hjjFliro7MbR1JcX1fj9FLOfxbKF3wq7o
         sZWw==
X-Gm-Message-State: AOJu0Yy1MuPliKwCKhqnRVM2v2IR2Ouq2osSDfUgcPsMtuQiS0tcGtJI
	JmWxzQTFzUqSbnjm/uNXXotpCJ2h4jCR8e3uhtAtgWKF4fvLArzW0fEzeSJJir0=
X-Gm-Gg: ASbGnctG7fg0S7RTj0bD+76wiLNW9FyRovZGfa10uwnJqXkSZndsTw9O0dozC7pgOi/
	1EAIZ0+AsDVaSMmf2AOxx4+a6UNc7HbJBvGrDD+vGM8gqZrfdIavD4hv6hSNFX5jOE3vBQH1XNn
	ShrTS3dN/N4JVlIvMWSaqqfaG9sXPZjfpTwvFG0jX6v/MtF6Xl0KzpoJHog3VNGrHUvI8IBcYIW
	edD/JqUWP0HIK5A1Hhg3ySjuNKBe4DFr7ppeNURu1ZYABk1CWmnWz6YkmmlJb/cAPauQ8k5yCyL
	aycwXaOBpfPE9/hkO6UG/n/y8VMVgKigQ1QD
X-Google-Smtp-Source: AGHT+IGoTxLJRfhLsWrHbxJYsDg42lv8XbjjipYTWunjh9XthEIABhj8ikVXP3Y+TyRAMRgkg54cow==
X-Received: by 2002:a05:6512:3f10:b0:545:27ee:79f3 with SMTP id 2adb3069b0e04-54850e8790bmr925786e87.0.1740477307404;
        Tue, 25 Feb 2025 01:55:07 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:54 +0100
Subject: [PATCH v5 07/31] ARM: entry: Rewrite two asm calls in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-7-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015509_005064_E2DD8351 
X-CRM114-Status: GOOD (  17.46  )
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

The normal and trace entry code calls out to arm_syscall()
and sys_ni_syscall() from assembly, but these calls can
be moved over to the new C implementation.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/traps.h   |  2 +-
 arch/arm/kernel/entry-common.S | 23 +++++------------------
 arch/arm/kernel/syscall.c      | 13 +++++++++++--
 arch/arm/kernel/traps.c        |  2 +-
 4 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/traps.h b/arch/arm/include/asm/traps.h
index 2621b9fb9b19b064aa40a8ab4a3a89067b98a010..b888912c2450e0e8eec8139166c7292f283545c7 100644
--- a/arch/arm/include/asm/traps.h
+++ b/arch/arm/include/asm/traps.h
@@ -40,7 +40,7 @@ asmlinkage void dump_backtrace_stm(u32 *stack, u32 instruction, const char *logl
 asmlinkage void do_undefinstr(struct pt_regs *regs);
 asmlinkage void handle_fiq_as_nmi(struct pt_regs *regs);
 asmlinkage void bad_mode(struct pt_regs *regs, int reason);
-asmlinkage int arm_syscall(int no, struct pt_regs *regs);
+int arm_syscall(int no, struct pt_regs *regs);
 asmlinkage void baddataabort(int code, unsigned long instr, struct pt_regs *regs);
 asmlinkage void __div0(void);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 57aa1084a0476e9c218cd100ce4fdf4aaa748234..77801d039b5f6562b231a6fd4979e318c7e736a6 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -264,18 +264,10 @@ ENTRY(vector_swi)
 	mov	r0, tbl
 	/* r1 already contains regs */
 	mov	r2, scno			@ syscall number from r7
-	badr	r3, __ret_fast_syscall
-	bl 	invoke_syscall
-
-	/* Restore regs into r1 and lr after C call */
+	/* We return here no matter what, also pass this as an argument */
 	badr	lr, __ret_fast_syscall
-	add	r1, sp, #S_OFF
-
-2:	cmp	scno, #(__ARM_NR_BASE - __NR_SYSCALL_BASE)
-	eor	r0, scno, #__NR_SYSCALL_BASE	@ put OS number back
-	bcs	arm_syscall
-	mov	why, #0				@ no longer a real syscall
-	b	sys_ni_syscall			@ not private func
+	mov	r3, lr
+	b 	invoke_syscall
 
 #if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
 	/*
@@ -308,13 +300,8 @@ __sys_trace:
 	mov	r0, tbl
 	badr	r3, __sys_trace_return
 	bl	invoke_syscall_trace
-
-	/* Restore regs into r1 and lr after C call */
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	badr	lr, __sys_trace_return
-
-	cmp	scno, #-1			@ skip the syscall?
-	bne	2b
+	cmp	r0, #-1
+	bne	__sys_trace_return
 	add	sp, sp, #S_OFF			@ restore stack
 
 __sys_trace_return_nosave:
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index edc0ac88ec60ce3f23149a526de7dc1205906552..d637dc74b1c70415933898fbcadbedc71df5f654 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -12,7 +12,10 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 		/* Doing this with return makes sure the stack gets pop:ed */
 		return invoke_syscall_asm(table, regs, scno, retp);
 
-	return 0;
+	if (scno >= __ARM_NR_BASE)
+		return arm_syscall(scno, regs);
+
+	return sys_ni_syscall();
 }
 
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
@@ -20,9 +23,15 @@ __ADDRESSABLE(invoke_syscall_trace_asm);
 
 __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
 {
+	if (scno == -1)
+		return -1;
+
 	if (scno < NR_syscalls)
 		/* Doing this with return makes sure the stack gets pop:ed */
 		return invoke_syscall_trace_asm(table, regs, scno, retp);
 
-	return 0;
+	if (scno >= __ARM_NR_BASE)
+		return arm_syscall(scno, regs);
+
+	return sys_ni_syscall();
 }
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 6ea645939573fb65ed36f5435a9c94e98828f45b..942c77767919466d5b89d83d8eb77032b119473e 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -609,7 +609,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
  *  0x9f0000 - 0x9fffff are some more esoteric system calls
  */
 #define NR(x) ((__ARM_NR_##x) - __ARM_NR_BASE)
-asmlinkage int arm_syscall(int no, struct pt_regs *regs)
+int arm_syscall(int no, struct pt_regs *regs)
 {
 	if ((no >> 16) != (__ARM_NR_BASE>> 16))
 		return bad_syscall(no, regs);

-- 
2.48.1


