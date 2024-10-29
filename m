Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0D1D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUlF8zw6dAVB0pDGKJAXIn96hGOC+sJV5+syU6CZdaU=; b=xNDl/9EOq7MYsFCYA/6eL/69C2
	8r53zHKXsCvZfNlTiuDvWyHpem7jh4KT3lazhI7ZqNsbXK0QnndRzt9a2fig/VLbmi0iWxIQId9K+
	4Dm4nMI41WZKDRNuGG0IGmKjFcY7XLlahVTuf+0VT/sK14VuaUh6teTDmnBhU6CvUwsdS0ac6/RJK
	yMvqg1lhqgfUkIOrDws6ozVUetM/Es7JDOwPXArOpYNi2LXfd+5Lz5jbjlwM2hGp4Vmu5ioQz8MDw
	DuXqni9wrvi8B527hsBNUxxRUZRZuGs0lQDOQV4GRLUSd/4LjDDlaOo9ZEmnFTuErWq/v2W+WHPw8
	1KdGkwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kFH-0000000EDPV-08xq;
	Tue, 29 Oct 2024 11:18:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqO-0000000E7HP-3tCy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso79073291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199179; x=1730803979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUlF8zw6dAVB0pDGKJAXIn96hGOC+sJV5+syU6CZdaU=;
        b=JQCklD+UUr0TcxgtjAtB5fLeIx5YRcFgI3UlLX2xtTCChlu4+KmDrnu9ILxny4L8a/
         PZyBMrZrawOijtWzP01vUTTFTnm9dd6cEaGE9GeyMHXDnlO1Ljzh0a/cZkc5v2aoatJV
         XIlk47Msd+l0tJuYKSPTSBnXy1FCs9iZsGMDoje88G0bGKsKeJFsdjfyni66LMcF5qtu
         Pc4gW4/qzNxwgyz+nxx7w0VQ/z5xkoYfLegDK0wftUveOrZt3kt6zjbxZJahlctO1OCd
         vU0As8bhZ6mO2gcX+nfpaQ+ewhazGIQ8HdTFB3Hd2tJ/S1v7sz/tIct1/EaZsa6lMgPT
         hivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199179; x=1730803979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUlF8zw6dAVB0pDGKJAXIn96hGOC+sJV5+syU6CZdaU=;
        b=I+Wsd0BZPzmKTzip70ucXJpE4oBPOYJAGZYg9kJH+uHu9afo0qoF+YYHq0gD99IwmS
         /4fsa5kazumj3rEhycJa+Y0LazYstxQOhgFM6ZvuioQfsnFbWt0337IOVLw3ofS9cTyt
         4ouyQlU2TK2nlKBjDkKXUMMRhMAq3ty0foeZpSyRWJiExrhtP5MKTgYbKwXJQlBPZJWt
         KmoapflzZwM6fCfaI7Dmtes3RFW6JpGMmLZrxaBjmOZDbfXfWiKDPBLFwYYBtTi+SsMR
         fjCEAhFlz4rZlttcJW/nuF5BiiclizFG09t0ooNv+KSzf0R14OLHfFXIDN+2ztCXn70G
         KI/g==
X-Gm-Message-State: AOJu0YxUcnEzTkSanG8r7whop53IpTQGaLs7qIUxw+n4bgVhiVpvJOmz
	CgfKeseZjowQ/xqxtes4MK2YHifdroUWRexNDc7op0YTOfD7U2Asc9lK6i8jDz0=
X-Google-Smtp-Source: AGHT+IE1Zk4oQJfcQ3ydT5j4hWbXtZadfIMGcMOO6V/a6kzdw22mTKnF7LA+e5CH2gcq4VfHFz9bfA==
X-Received: by 2002:a05:6512:3ba3:b0:533:483f:9562 with SMTP id 2adb3069b0e04-53b3491e07amr8032028e87.42.1730199178733;
        Tue, 29 Oct 2024 03:52:58 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:47 +0100
Subject: [PATCH RFC v2 07/28] ARM: entry: Rewrite two asm calls in C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-7-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035301_018562_7CD2BDE8 
X-CRM114-Status: GOOD (  17.42  )
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
index 2621b9fb9b19..b888912c2450 100644
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
index 57aa1084a047..77801d039b5f 100644
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
index be193266299f..d1259c6d2805 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -11,16 +11,25 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 		/* Doing this with return makes sure the stack gets pop:ed */
 		return invoke_syscall_asm(table, regs, scno, retp);
 
-	return 0;
+	if (scno >= __ARM_NR_BASE)
+		return arm_syscall(scno, regs);
+
+	return sys_ni_syscall();
 }
 
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
 
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
index 480e307501bb..42f6bb593eb4 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -606,7 +606,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
  *  0x9f0000 - 0x9fffff are some more esoteric system calls
  */
 #define NR(x) ((__ARM_NR_##x) - __ARM_NR_BASE)
-asmlinkage int arm_syscall(int no, struct pt_regs *regs)
+int arm_syscall(int no, struct pt_regs *regs)
 {
 	if ((no >> 16) != (__ARM_NR_BASE>> 16))
 		return bad_syscall(no, regs);

-- 
2.46.2


