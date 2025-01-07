Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DD6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQAp8VACnKHObFrcN6BKQWBu0lC+h+9xnjqKvK7FcXs=; b=SuFsZosk2yBjGjj56/lor85Ptr
	rM+3y0ddrOfHF+VaJvDrnIsHdNBIk5+lmhNOCJdG65OKaoK0keLKgas81Wqn+oiByFb1rAdFyiXod
	9dkpySqD1m1JEIEKUVYVkZyEpAQ/WiuBZDItk3mKNuVzS7ZmcuXhXC72swixhiDAXwv8wCQdhDsDg
	EeREarYjotVz71gTNIWDhrJR9iZ7DqM3ThQSoMMglzIAz3leQXRL/rKKsKsw8yFYcCaCcjdXhUOSS
	vvVWbotPYAK351K6UEVhy+mW8hXFigehW6dv7ZhLaT/ibhlLdvbnag8z9wJ2ANY7QeDVtx2ECfBnm
	kxahlseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6IN-00000004E58-3aXV;
	Tue, 07 Jan 2025 09:54:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65j-00000004AOV-1dD0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so2540118666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242898; x=1736847698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQAp8VACnKHObFrcN6BKQWBu0lC+h+9xnjqKvK7FcXs=;
        b=WeacyQrKCmNgPMMjZ+izN9G5nZe166jFR8bqniMwKtTahStQEu1L9LXGptLApZrFTy
         O3K3zQIQsMIOPG06iXemkZ3bpYnx00dUEvaqvWwqR/AWzag7AtweRmw0gn0dFVA4BK10
         9zTvNz/0N9dvOxM/3k4Rc0D8Fl1EjbXOLvHVO2hI2QpwkNrLmk/C+fMoe3IsWW0jVxfi
         WcaCkFVjxgsbmlfcmxpEj8uwqrxkCP1t6ISWma4yVVOYrwmUo0rpLUondxF/qL/oU/i5
         Wt0KSSqJIi2mNrajVjH9d+8iBQx3pyEroJvEB47l3lvjEYNXBqM9lyzdvNBcYc5k52J1
         d81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242898; x=1736847698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQAp8VACnKHObFrcN6BKQWBu0lC+h+9xnjqKvK7FcXs=;
        b=QBHFOl7fVnm3IQgT5MXSfj6bUjxh84Q7e7hMR4dVxUw4WK1M16RtET1pMNp4esdMqS
         WBceL79xLMCdR51/caEcgL3X3uzr38y8+VpL0iKzmfAGqp8ILilYGpSjIiag29vQ2JU0
         DYLmeG4CgJxFiDHl3eaxGfZV0v6TEXnZjN8wHjb6iZ8ZkY1voG2WKTMte3kS5jzAFZe3
         7y7clCNWeSKcbFW+8nBlfyFzLUSFM6RVp5jdw0NM/l1f+djrDsP2tH/R/pGcnTB31rIq
         5H2Z4in8EN3CrnIWA1NZ2aCqDQNcEgdYAhk+LxlZuJFV97ASwNeH0tIIHCTOxXXvVnz4
         E0mQ==
X-Gm-Message-State: AOJu0YwVExhdHMoK1AUY8lKCOr8HNO/uC5tN1H33xojzdiD8fS/4k52T
	191EoKpsdciuIRD56kI9h302ySERcLEJ3AH6IuDAEwmUIYpmU7/UcqBZKpc2mgw=
X-Gm-Gg: ASbGncuLcN/Nui6Itr25RsKmLdY0rJbZBBixqzV3LgGCJBkMZGAifITgqUO4ivbH9xe
	H1MxMOktmvSt2vsY1wFfrbGSJu1ox54WBFeG41gm6yHx3eZFbSewCjOQQUCk3hErVooHX5SpQGI
	Z2tPNNVpTU+X23lAWTREmAQpv5lyKX8tmSjke3zUkWKs1aVM2gihdoB2qcNJhsIskIWBUl+ym4j
	OvWbhWDC6QtKpSru0Dj7Cago6yYHMekDUOM7KzojhfuSYd74UarG2YfX1+dJ3YXuLQ=
X-Google-Smtp-Source: AGHT+IFbK5JNMY/DlBPttO03FrsecsUcG94kP+7J7Uhk6bjBGJqZw7Ul1vEZtVACwonxWgRUxG1J2Q==
X-Received: by 2002:a17:906:6a27:b0:aa6:9fad:3c1d with SMTP id a640c23a62f3a-aac3464881amr4406657766b.39.1736242897835;
        Tue, 07 Jan 2025 01:41:37 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:25 +0100
Subject: [PATCH RFC v3 09/30] ARM: entry: save the syscall sp in
 thread_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-9-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014139_431131_8A82B029 
X-CRM114-Status: GOOD (  18.75  )
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
2.47.1


