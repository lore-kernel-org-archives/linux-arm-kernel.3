Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=; b=rmsnQoWD/GXOKPvz1sLIUAhtXA
	zCAqGDbn8ERzwKfEq7sUkzrvu+nvS44sTVWDjMMMxWD8f5UUhcCUCG+i2b598GMoFNtpIQd0D/lNT
	BKStV4AhBCz+pYTmGJLnM5dnCta/f9IpCoZg5LJGkMbIXZKuxAHu4/Nq718NaShRdjIWBmZzhc9kk
	1zjc0Dje9fVln04Sp5JWvGw5G9yDSFGecPCCbb+x31mljN2cy7VNaCp9+pv4lPC5iUxNKMu+6kKk9
	DU1+57qhQ/9mGW/ltvgDa8BvDlswkbKMQED2rACR/RFhD1a2ZiJQv1W5QUW6k+e02ojsq1VHitIxz
	yRi5i5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms9g-0000000Gp6N-3WSO;
	Tue, 25 Feb 2025 10:27:12 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrel-0000000Ghfu-3Dxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so50428181fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477314; x=1741082114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=;
        b=y8JYFAsFnib4ooTd1nduSieQMzZ0+T9Dnwdo6yIFHu+xDAltKk8l4SZ7aT5iSY3CdH
         DdRmftgEjBU62+UnM0bmV866tRwarD8/PYJz7T3ZycvbKexrkCzM+HEagKRPV8Z1yFoQ
         upD5y9S11vMy7wW63AqlmRYhKzQkAoZif95jMadFUALL7Nl5MeURVVzXhLX0mijtmhqn
         L2O53+twM2Goiva2iBrjNsSK/GR0VjXeqWKSkQ8IcIZ72aqcRMA98qaXuz3oXPFbEjke
         Z8NjTS8SnOHoPsYw7/dnxEdY0Gm3FGiRt5Msxm6j9O1YrnvHEU7iwzi7iv8InE2HgQPX
         x68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477314; x=1741082114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=;
        b=sdr/LoNS6FNGwY9dh3l70PAsqReItnhICRx/WN0EaZYU9vIQwAQtNgM8uq7m441C4G
         p0yvkEaHeZuJvBovwQBKYeI6rUP9L5nld+qqEblt2Ej9SMvpaSB7T2TZJibYDTkJdGEm
         QruuHbxarhd3J5LxFxUApuJjvU/gFZqgjfb10Q7A0gUbT9Y3ap9bEBQLsbAruovDcPQg
         gBgCv3wBXn4pL5+ixH+X+S8HqCnan8WdnrEyzzYjJuVOEPARfq8sWA8OQCBvcAhtuS0M
         7FRn7j9zSx962UzDLL2xBkI35koFgm3qcn+a9P/01Zqyr+fLf/F3lznO03tv81wBSd+9
         ln9Q==
X-Gm-Message-State: AOJu0Yz/q6fQ5JrHafgs+XZEu81biqAHFQ++VeA4r4dGWeVNf9r4jSVZ
	NA9SoE0+t2r7QnVz5vjZeXJRwy71voeqvugG9d5adzSP5Me10alCGHfwtpUGO8g=
X-Gm-Gg: ASbGncugYvRt/nqzDCMJbe1bWZPOcg3auJka5AOhymneJ5uuaPmuA2dk6p98V8irLyD
	ihZgkiqbdq1fMjlM0h7cbNlUBMJ5RLSCQDa+qkBTEAAGOVBINEKVqQoqsxibZeP+6nBeo+gsYGS
	7cRzvnJVGre19phPGKHEw1aNGouh85OW46wQkA97U82rSpTYsgQ1fei8shOYJXnq7Dv40xysPuW
	CD7d5I/gy3aJRWY5RKnbL4HN23mIorQqXmDRS2DouQQ3etgcPUGpQ90KudL5OYNsBx2Wews3Zzl
	0cmLVwSl+Zy+wxTIiA304yhMvdIXDQGbrAZf
X-Google-Smtp-Source: AGHT+IFeLR30oGpW5vklNxUSsMhMgUVaKjzRtV+OjULqK8ylumNd1C7a3hr2K2xQCsmZr/q/cwPOIA==
X-Received: by 2002:a05:6512:3297:b0:549:2ae5:99d8 with SMTP id 2adb3069b0e04-5492ae59d04mr117932e87.3.1740477313811;
        Tue, 25 Feb 2025 01:55:13 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:59 +0100
Subject: [PATCH v5 12/31] ARM: entry: Rename syscall invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-12-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015515_814664_E4F0BD41 
X-CRM114-Status: GOOD (  15.91  )
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
2.48.1


