Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A41C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=; b=LbEuBwPhCG4AKti26Mvobyms7u
	LBiUaT6iPpxLFIHWl+h0vbGzIg6Gr5IkXYW7z2ncaIw3q9309Q7kFpJOhi+R8+clVYB4MGsjDdSay
	+dijP4HrVlyiYxrvn9QIknuYx8hhXUIoDMtAr8MWHqS+bCrnWUv7NNSJSDtkxThy/wUrlhdWoRrwD
	vDyOoWpjgQuZrk0znu+4DcHKo80x5D8bnp756WwJkFsOWo/yPVI/4n6vZV/TeJL4zHTJO9EQNfNOh
	1W2J8/a702HDaQmXsdIRNNMFpu5PQFKbDIgKu0XNyRN6+MEW6LJyV5rgTH53yn2h4nUpdKgQr/lIP
	y7dS+QYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms56-0000000Go4A-35Dm;
	Tue, 25 Feb 2025 10:22:28 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreh-0000000Ghe9-3dte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30a2f240156so55037031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477310; x=1741082110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=;
        b=LKsmTpONUoieVquq/zW3GpukA3VluXvHBQZO+qPZFjX/Ol7wty3vmyu3Gie6IyaA/e
         3XFTO2bnU2c+2XnYgQx1kDlPzAgILeNIRVbPtbezVyQEesdN4Y+EizLnG9aN9iVdxPEd
         DXZMUZLt1/LU/q3/XErgBbPrMWvc74PbwlQX2DoHghMof3D3/seuwrIyY9jCQWmEFRk9
         tHnUrvsCB0AIKh26nP2EbhyywfvaspczUfF9xq4Lno8GPcUFWeFJGNJTFLPgeWJIvKuP
         f+1WRYXQTq6U25CVYYtWa4rFGd0NA7OPDAr9qFruHejpukLlw7jdmpnjaERSgDasWtTm
         GzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477310; x=1741082110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=;
        b=J+Ys1DHauhWmhySULh3jjJWr2wulif0TgCTBeuUop0vIFQi0aXFy6uuJj4oOVCHfAQ
         XMGKQW1tRRWu8m1Ley2+IvzyRsbryW3H/wId44wkIL8bOcxLe81o/bjr7GtJyuGIYwZr
         3GC9ObY2Mp9QsEiEK//sx2UaeAUb4aVYcEqEmpeEeHNx3isUWqAaPiL5HDUJ15E1k58L
         QzRr3tr3yJ499wjl5qxuqKjxDjMiz6icfRiMN1xvQNLsHMG+ZnF6XQnTQw4eiDTmtQnP
         qM9BPoFP+igQv1dSEGa39RwEQHCH51ph9GstWhj990SJLzboRogqWB9NOPtzhIs3DkXn
         5xcA==
X-Gm-Message-State: AOJu0Yx0I3XW5d6KYju40FwruWyiB9dXxO9e/WxAYB68l51HJMKB8Tt9
	zheL0x2QpX/6OKc7FH4X5PkLAp6RxyQAIabcnj5rMk4xpFtuuJ0xgVEjxHELOhI=
X-Gm-Gg: ASbGncvC2Qjpgg2CUGE3pq7jUr4yGUCtLR8Aol7rGv5YWBmNPhb1hHimjTG8u6vkrT5
	Hbj8LD1vMc/XVOYjzRPl28pRv/8895vNO2+T4jZa9Z+H49KJFR6p2WsQGy3QEGjFupIbXkYtzLC
	mqXr4ZZSYQ3Ul7hjRhkOob/BqRJUOmY/D6T7OooyBDxOoWFAfZudW3w1ALcBk3q2vM7YYB/xtSz
	IDPr98Rhvbl3LzljataeY3Si994Be/SHFegHaPWHCe67rlA6epa7Re3WJCiP7nZ9EZeH7QmLqtt
	GuKFr3E+HOcFFrEjc+rCc8S7wEi5yGrCe8Ci
X-Google-Smtp-Source: AGHT+IF8cIBO3SlK9WGiwosYyqGfJqHooI+lszN8vN5QA7gNtCgUPpe2l1NosqypYf0ggr1xuNTUZw==
X-Received: by 2002:a05:6512:110d:b0:53e:383a:639a with SMTP id 2adb3069b0e04-54838f4e402mr7330345e87.37.1740477309978;
        Tue, 25 Feb 2025 01:55:09 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:56 +0100
Subject: [PATCH v5 09/31] ARM: entry: save the syscall sp in thread_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-9-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015511_917347_7A0C2A7F 
X-CRM114-Status: GOOD (  18.90  )
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

We are going to rewrite the syscall handling in C, which
means that the stack used by the call code is no longer
predicatably 8 bytes (for syscall arguments r4 and r5)
but a varying number of bytes depending on how nested the
C code is.

However the current code is just assuming it can rewind
the stack by adding 8 to sp if a syscall is interrupted by
a sigreturn call.

Solve this by storing the entry sp in the per-task
struct thread_info and use that in the sigreturn wrapper
instead. We already have the thread info available in
the SWI entry and sigreturn is probably not so common
that retrieveing a pointer to thread_info should affect
anything very much.

Storing this per-task in thread_info makes the solution
SMP robust.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/thread_info.h | 1 +
 arch/arm/kernel/asm-offsets.c      | 1 +
 arch/arm/kernel/entry-common.S     | 8 ++++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 943ffcf069d29cf4a035964d20d56f7ebdd6d602..d8a45c5a10496aaf806bfeaa0353d5e8985bd6f5 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -67,6 +67,7 @@ struct thread_info {
 	__u32			cpu_domain;	/* cpu domain */
 	struct cpu_context_save	cpu_context;	/* cpu context */
 	__u32			abi_syscall;	/* ABI type and syscall nr */
+	__u32			sp_syscall;	/* SP when entering syscall */
 	unsigned long		tp_value[2];	/* TLS registers */
 	union fp_state		fpstate __attribute__((aligned(8)));
 	union vfp_state		vfpstate;
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 4853875740d0fe61c6bbc32ddd9a16fa8d1fb530..c9525cbb26b73827821aa746030e56b037f49556 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -49,6 +49,7 @@ int main(void)
   DEFINE(TI_CPU_DOMAIN,		offsetof(struct thread_info, cpu_domain));
   DEFINE(TI_CPU_SAVE,		offsetof(struct thread_info, cpu_context));
   DEFINE(TI_ABI_SYSCALL,	offsetof(struct thread_info, abi_syscall));
+  DEFINE(TI_SP_SYSCALL,		offsetof(struct thread_info, sp_syscall));
   DEFINE(TI_TP_VALUE,		offsetof(struct thread_info, tp_value));
   DEFINE(TI_FPSTATE,		offsetof(struct thread_info, fpstate));
 #ifdef CONFIG_VFP
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 3cfc6d952ff99be9c4c1be4481ac3039260e3e57..8baab7f97f59c434396f30b08ddd3029c5f9c0e5 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -232,6 +232,8 @@ ENTRY(vector_swi)
 
 	uaccess_disable tbl
 	get_thread_info tsk
+	/* Save a per-task copy of SP for sigreturn */
+	str	sp, [tsk, #TI_SP_SYSCALL]
 
 	adr	tbl, sys_call_table		@ load syscall table pointer
 
@@ -377,13 +379,15 @@ sys_syscall:
 ENDPROC(sys_syscall)
 
 sys_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_sigreturn
 ENDPROC(sys_sigreturn_wrapper)
 
 sys_rt_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_rt_sigreturn
 ENDPROC(sys_rt_sigreturn_wrapper)

-- 
2.48.1


