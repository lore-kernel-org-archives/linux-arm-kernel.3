Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED300C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=; b=3O0yweDf6FvaTqiLi856UShoOv
	nF7wNjOUHBD33Q9JaPiyLQzoWuADG9qbJ6fliKKp+nfP3tI8k7bhQN9vSnSEpfb023py6+yGHWXiF
	4j/1E5TJDkZhpx9pRjFKN7+QvUHr/634Av6WIE5i9VB9oyrg5x7EkwdxMfUyaYXxl+FcGjzh65Bkl
	jIxD1rKbMC1HA85mHkCH9+8Y8snQtzjugYA10EIZTL8bOwWXVFViZG3VhzyUyMv2YsenJuEqDMXDG
	p7CFVnc9+XAIL3gPtMFaWpqXUcuCewBGTWWbK+OE8IopEPWqd7EfU4MiqH5w/TKbZal768Eudqc5v
	yaEuRi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB08-00000007CEc-0v99;
	Wed, 12 Feb 2025 11:33:56 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApn-000000079d2-2R0z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:16 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30613802a04so65148611fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359394; x=1739964194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=;
        b=DsLE7A+oxsTHm7FLfaFXMh96Wa31OZ013bwaUypL6rze8BpT1OOfIQtrTb9ZKqDrYX
         i6pbUd2JDRZNaTIVaUUJBQqezZjBb40DBMu0eHNHCe48ivvoh5gC4WRea+4IHhU1Otpw
         y+Dc7k0I5HO+tyiLBNqKSmtsO1PtHLEIf4jz1F2yIKFF5hxsHuX9YAZkhxeKUB7N58XO
         YngZ8cJFFM6ZxGTcGI9evMvbOGD05u3oc7eCb/GJIOShE3KVPNO+/pgGhz4Q/VnLmazB
         MUmTxg4U55qPLDqPh22xC8298QNUBLoYeKB+MiEGfSfZ3wNN1enPYke+D4c/ByHqiDF6
         6S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359394; x=1739964194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yplTGeg8q5Jb1IHX+lZzUxdHnSw+Ki6MseFOXEsgMb4=;
        b=S3/OWNWVisx1EULnlFbIcIoVxRtNKtJs9vaSsYYUIh+PX9EkoDLBLd9I00HCQVAtsK
         ZUydO0s8xZK6BONLJr53nIwLWLWiTcenJ1dEn9XskbiFT4MtRrynxxMi/xICg0RBekGO
         Oxc58kOIeuEuvyuuCV0y65JMOG0sfHJ+SxBcH30Ipc6f+Yi3xLFLcbPp8NLd4ZtIl2Fb
         SpMC5TI7d1lNly9Fh+8wUr6eZXzVzVfYsoQPdB3rl57eUgSKuQS7XF3Xdil1dM8Pkk25
         LHK13deL6Yt7Q5D1cC0DUT6aPj9VzIBbfkH9eGAc2hLDFrtGLYoc0oIv+9Js+aXjQlrd
         vBuA==
X-Gm-Message-State: AOJu0YyEKgRL0NsL5RT3PeLTH6wYVt1gv8IvycbNNVXc1bhWQD1/ZM0r
	nEUEno1PZdfdAh/2w3flPbQGoAqiurjJNtgAPArGiccJgPWeebmJZamVQ/BzxP8=
X-Gm-Gg: ASbGncv4lyK55XW9qLpmn1uizH6v53zqmL9TT10Vh7N7Hl1QTa1pmIcZgM6YvATWzmd
	7utRseORfWkdHiARigHHmER5/nZLI7ZQZCWHm/sAMXJH3OVpOzJJ8gydN3kxF0B5osLpBumgFQq
	yqwW4z/RWEOek5sD175ZAkVT6neLfRg98NcxsEOUXsVwVeH1TU6iMuiktxofbz3PZFCpj08ELps
	iXbImLw299ZKwp3ouZ4wbSj/DmyngzEeSgPF/Rty1qKZulw6QFbie3k8kkPI1D94h4noJgcX/hL
	bavwfvddUFVRfDfAfFcuQElXOw==
X-Google-Smtp-Source: AGHT+IEaYca91uWTU7cyiSHpPYPrfctGa1tgN1r2xzyJA7Zpo1TE5CUGZf48fi1/xqnUPpwUa4Slpw==
X-Received: by 2002:a2e:2206:0:b0:308:eb34:101e with SMTP id 38308e7fff4ca-30903911e32mr7352541fa.29.1739359393267;
        Wed, 12 Feb 2025 03:23:13 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:01 +0100
Subject: [PATCH v4 07/31] ARM: entry: Rewrite two asm calls in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-7-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032315_640891_672F5457 
X-CRM114-Status: GOOD (  17.40  )
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


