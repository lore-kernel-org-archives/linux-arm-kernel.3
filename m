Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95FFC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZmnKukadbd2DVD0OEXjqg+oIWqCHiujZSlF23WxiBI=; b=FvRfJ1Xtjhx3GDoNKL5jZh1Vro
	z1S2gKKk3rKRF38aMSlJnXpTMCQ60XEIt170UFo78x7cRCZJ6i+fNFDQbqG1A/jdeSnV0w2HLSFXl
	G51fymJEcS+eUarrUI4tomCnGgmzoZQFOdiP9yhyXIdmLdYrCKgs4ddeChuqao28ANm4JFdXkaHwU
	a816MDdJEi8ukd1YuQAiw8Y88we/BtFC1ty+6lT9S4Lo3NzkNCYTeG6yKbgGV/p7JCq19np/9t7GR
	jEQLiFh6CrWH4UbYX8btuk1Y1gtyDaIlrr77nV4Fbys3ErBB4GzhbebRrXb8RkN8dI8f4AZ4NXwh3
	n0Sa0wYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6H1x-00000001umx-231M;
	Sat, 19 Apr 2025 22:51:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn9-00000001siI-2b3x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:08 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-549963b5551so3109552e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102166; x=1745706966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZmnKukadbd2DVD0OEXjqg+oIWqCHiujZSlF23WxiBI=;
        b=U/MtSKg3BYE3RlMW+ixHsX2tX18uXtmYFz9wygLFRH6PAvCKDiOKvYAi//6uaDLYbJ
         qFKgZIote0DgHaKDnvm3maCZXj/JPg4G/2qIziMa6XN5slA9J1Xxb4dm0K2e5bYTtgka
         kbsLT5yvAdmj8ieZR8BQuASl9YktTFhkFbOO7ezMXsb5Qk7EApaNDKOPUdhVUCmIAnr3
         3euhnChndIre1do0IPVmliFfmnmPEY8uMV0djxgit0olKeFkqY7TiIJQe6pRlJ2Bp98C
         3v/afVyncxj+mX8HyGcMhbKqj1KSGmYZbhDlUS92oKmF0f1Z7oYXzKNeN4abqQ8mJevl
         FHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102166; x=1745706966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZmnKukadbd2DVD0OEXjqg+oIWqCHiujZSlF23WxiBI=;
        b=q7MUjtTDp2R/6czW8caCcFctHkJ58jdOymDaq+0BUyyA1gAopEjUx78ahCPLPNtbiQ
         IV7T+nGTxr98svWehh9KCjDDBKciZoWDSpj06jeUIMiNxhzYdgJTc837WLi/lwSsitVj
         fRNmXET6o6Dt9RZGKoGHcJk5DfxpLkcJVJ65UmZC/ETZkpvzd8RMq4pD1fR2xW2/ZLOr
         cOig0bzvl4S8tA0sF3kCDWRAyLg+25bNN6C0Ldj8kc2pfbUKW6k/+beJN2VP+4/UKKG2
         Aim09FINiuTnfWdseoxlFDts6mNNLqibO7CCAxOqT8CB8AqophB5GDrAyOcf9uUx0xqn
         luGA==
X-Gm-Message-State: AOJu0YwCMK/CSBQk00PV63PnPkCQoq8YewvK7ESRjGfEErAvBBK4Wgoi
	SvPGhKWHOIdxlUcy7rZ/Ho21Z6EfJ7p/rPC14KFPANOBKlmzeX4zSvE3rIklfOw=
X-Gm-Gg: ASbGnctU3u6jxrIvNkYuew71KlpUntRcvpfyFZtB0WiV/t1uW8A9Nv8Ls+9ZC9LqRKo
	fyPTuWXYg1HqhshVJw15NfTx4zxxDR488EtcNYDsKxomxYViMaSwodDgjL0pKezZnm04GtA6IEd
	Eh9/AajjJoQ/1vv8LWm+wHf1EWzHAl/8hameEvXEDMJjQR2uV90eX+0sry6M302gqMAGGMC2rHb
	BkuNthmBtRLQR92FjUemCBwCNUqeiglnEkf3S4Cjhk6FzHVZ+51euIUPvXquyR57bCePN8u+2kp
	YORPZzBvmOilEjTlGf80yQJhuLoNKGYkJK/mwhxZbQkm1Hw9l+E=
X-Google-Smtp-Source: AGHT+IEcKs0MGpbznfsnmrfRQLSqoFKUEdc6MfTqSjSELeLCkrqH4RJxAyZmrS5qBrUmlZKS7RcNVQ==
X-Received: by 2002:a05:6512:3b93:b0:545:2ab1:3de with SMTP id 2adb3069b0e04-54d6e62b725mr1819788e87.13.1745102165769;
        Sat, 19 Apr 2025 15:36:05 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:54 +0200
Subject: [PATCH v6 07/31] ARM: entry: Rewrite two asm calls in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-7-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153607_665274_F3E7CC37 
X-CRM114-Status: GOOD (  18.10  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
index afbd2ebe5c39dca42e5cfac1d46213f0d5b63d5c..2e673ebf44abe5e7224acbe4f672bb74730a7f6c 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -602,7 +602,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
  *  0x9f0000 - 0x9fffff are some more esoteric system calls
  */
 #define NR(x) ((__ARM_NR_##x) - __ARM_NR_BASE)
-asmlinkage int arm_syscall(int no, struct pt_regs *regs)
+int arm_syscall(int no, struct pt_regs *regs)
 {
 	if ((no >> 16) != (__ARM_NR_BASE>> 16))
 		return bad_syscall(no, regs);

-- 
2.49.0


