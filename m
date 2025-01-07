Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3B7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpsIgg1e/3uFwlFgTsWNBO+zJGIkDDm/DpMGSieQyDA=; b=NHr04rIT9O/nBzaFfNpe/tUSVq
	JZ8hf1Qyejj8gAGNFzUGpm1Xrm0SKaAKpDwjYSCdZC7nCJcUQBT6vWn7WeKzvhUweBT1+d9FnzyuA
	dLB6ehjKr3+nkZekn90UnGdHWGeDzPabj6o6Uh9Ue3yVsDO4KbI1Y8mkyPXel4fbygDVbE1oBbZkL
	3Ul2ZBN1qPcbuEkh8GN1SYmLnTjor4P4IPAMBX+T+WEOlLaWrFI25oLnnTBfzSH1xr9xGeJOiMjW9
	ly5pr0z7nGXF6/zN5a0mP9h1TJDJ3QfETHGg8yRc6UREsEthzbw1SRa25B3TV2WcS3a4Pk8A2TZdw
	mZ8uxVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Kh-00000004ESR-1OMA;
	Tue, 07 Jan 2025 09:57:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65n-00000004AQO-3hIN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa692211331so2940875766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242902; x=1736847702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpsIgg1e/3uFwlFgTsWNBO+zJGIkDDm/DpMGSieQyDA=;
        b=GteJnLAXf8aAdcG8RjhbmxSui5m0YIPrACrhiO29VBqJhFd5ZDsejjb8LUTC+Gpl8e
         nHQQMJBYgoUTV+IbeNJRYniewiY8XB/BisbXRHW8pYNTWzy2XRKDp6U01S8Co5r90/2f
         Dp0XRN8hX9+NuuYobp4TskGHvryqnJwlfQn8H6Dh6Hl4L+OJPAcOYJzJP0Sqr4OTv0aI
         xlgSxHf8PtXOJhfQjlN72uIvPKcIn8k4iuEe3z4+AAfsUyt36IAdNHkt5aKu2rEKQcjQ
         JPvSoWvNDKt6Fgx7R+km2MXn+XVGYtsVlCp9/hzPV4UnrJlHJd/XyRiWLG8t8kVOCoBL
         rCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242902; x=1736847702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpsIgg1e/3uFwlFgTsWNBO+zJGIkDDm/DpMGSieQyDA=;
        b=iFVEPsCMVWNCnJqaCEFSbk/BaQDv8ohB3gWNEN9DGqU/pYUGlz7+LqVEAX4gW+0haO
         x3WskjWF4wMkWHgIlr0i7ZOcSaq8akQR3quEMgxS7pLcLnhXHv3C8QxvRqbhJpQPpJsO
         CVoEYn87vpUuXkjqprq2R6GRcRc+3/lf3ThDgtO8NvRlFEB2uF0+yXrxDEcYptf4vKp8
         AAgCgQK27syz3lsuRJyeGHrW+nVWdfmoQEhH3x3QnwUP330KUOCGh3F3QJJJhbxxHFbA
         izmh8NKA9zZxRBtSWBzD4PIGVxtS7K6xap3Z+ylRksvBE8L5Lbcpt+u0/kCLpMicBiz0
         3a2w==
X-Gm-Message-State: AOJu0Ywg+ylwluZKROtpdRWlB6FxjRxCwdxZDBM3+//Cc3j3rugl+Moe
	tLeu0zZ5rhRHZd6JpqW+HkAli6TIHMd+vjvQMaRpULqbJNMwKSyYyEUzQor9l8yrxZf1cktwgds
	fI34=
X-Gm-Gg: ASbGncvYoh/DIJkx47ZsLZwkDxp2KB5KYJH6XszOwwEZnUciM9UQL+izAXSldSNehkq
	9oxl27PXyxG7Kp5p/0LJGKB/dSPf+vfPcN2uRrBsWyKZNGmW8lLnDfpD76GHCnUhPEYRHv3YEqY
	ZiFlDFZ1B4fgjmkhEDWRgZwXNDnOr3JTyB/aTUDF1FhtkQ98sjK5vYU2xWydzdwYQF7b27QQtSU
	4QnnvjXLVSbJ0D+UrCVC3ZU+osjj4hHosCbM0kwrVUud65XnfjZ/0e7P4O+kU75SKc=
X-Google-Smtp-Source: AGHT+IFg90XSIzsHeI+IKESBsSFpkxnaQ4jjexpj6W9kCj39JSV8wQCQI8feJQ8/JhMvrEeNMUEQ8A==
X-Received: by 2002:a17:907:7ba5:b0:aab:f971:1f73 with SMTP id a640c23a62f3a-ab2918fdce4mr194300366b.22.1736242902078;
        Tue, 07 Jan 2025 01:41:42 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:28 +0100
Subject: [PATCH RFC v3 12/30] ARM: entry: Rename syscall invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-12-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014143_923214_BE7F6BCC 
X-CRM114-Status: GOOD (  15.76  )
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

Now that we do not have a separate trace syscall invocation
path, rename the invocation functions to be generic.

This can be squashed into the previous patch, it is just done
here for the previous patch to be easier to get a cleaner
diff and be easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 10 +++++-----
 arch/arm/kernel/syscall.c      |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 9c664d8c5718f58034f442c20a030b59faf65dd9..b94fd7ce17f82f0baf06b74800245112e1f13002 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,7 +19,7 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno);
+int invoke_syscall(void *table, struct pt_regs *regs, int scno);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f0f1f8723965313b287158fb2a238908db72fcd2..f1e48002bd3075ea67b5883178583127fa0055c6 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -260,7 +260,7 @@ ENTRY(vector_swi)
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
 	mov	r2, scno			@ syscall number from r7
-	bl	invoke_syscall_trace
+	bl	invoke_syscall
 	cmp	r0, #0
 	beq	ret_fast_syscall
 	/* This path taken when tracing */
@@ -390,7 +390,7 @@ ENDPROC(sys_mmap2)
  * r1: regs
  * r2: syscall number
  */
-SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
+SYM_TYPED_FUNC_START(invoke_syscall_asm)
 #ifdef CONFIG_CPU_SPECTRE
 	csdb
 #endif
@@ -400,17 +400,17 @@ SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
 	/* Make space to copy the two syscall stack arguments */
 	sub	sp, sp, #S_OFF
 	mov	scno, r2
-	badr	lr, __invoke_syscall_trace_ret	@ return right here
+	badr	lr, __invoke_syscall_ret	@ return right here
 	ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
 	stmia	sp, {r4, r5}			@ copy stack arguments
 	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
-__invoke_syscall_trace_ret:
+__invoke_syscall_ret:
 	/* Drop the copied stack arguments */
 	add	sp, sp, #S_OFF
 	pop	{r4 - r10, lr}
  ARM(	mov	pc, lr		)
  THUMB(	bx	lr		)
-SYM_FUNC_END(invoke_syscall_trace_asm)
+SYM_FUNC_END(invoke_syscall_asm)
 
 #ifdef CONFIG_OABI_COMPAT
 
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 36330023b5484399a4ca2fdb5727b410e2c74b6f..6f518ec3870fb36a64d1b671b20f96d63a52bf78 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -8,10 +8,10 @@ static inline bool has_syscall_work(unsigned long flags)
 	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
-__ADDRESSABLE(invoke_syscall_trace_asm);
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno);
+__ADDRESSABLE(invoke_syscall_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -23,7 +23,7 @@ __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
 	}
 
 	if (scno < NR_syscalls) {
-		ret = invoke_syscall_trace_asm(table, regs, scno);
+		ret = invoke_syscall_asm(table, regs, scno);
 		goto exit_save;
 	}
 

-- 
2.47.1


