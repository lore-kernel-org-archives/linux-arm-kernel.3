Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F38D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wP1nC9llP2df/xsfs1zPIJ3oMrkiGOdpltxFcj+OFqQ=; b=a8Qxyo9k9WVUmE79+qgivI9QVe
	T4IXxWCI1WqBMe2xtqoK6Egf3pR0odnoVj1lWkXTHy4CXWf1MDVOhTHyamEnvhef/2WBdZRGUWSOx
	WTFC7z4+LHVQ/wW8+NoQHl9tEZ8c4pDkajaaPsCdqL9SGKDlhoXvZMtpaDeqC7spRdYMKlXG83CvA
	Artuv7/b1zVK6r9C4qLOXqQSqljobTJloWj29QaZGk8p5XirHymQi7WQkJmlC1nJgwtjpCxHs0inR
	t0143AmXyRGBX2OIwK/Ha+w4y2KghKl9xNXyx/HK+ES7amGqwGSaVfFIt5yfXH3qrNrnCUQB+Q3Ra
	clh+laIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kK1-0000000EE1P-1hBt;
	Tue, 29 Oct 2024 11:23:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqS-0000000E7Iw-1sv1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539e63c8678so5347726e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199182; x=1730803982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP1nC9llP2df/xsfs1zPIJ3oMrkiGOdpltxFcj+OFqQ=;
        b=EJX49Ninl9sMpGdBKfdx/NpOaZisMWj5J/1oSw4RoavjSnN2GXjo6BWO4GZQwIimDV
         gIl6mguk/U3PuOFrT0ftp36DlpXTRlO/wXBs6JRkUDPMrJCwMdpcQhHh29KboOPikBBa
         myoZbwqUk4SKiH9xcCWNRT9RbC4KRRSW6v5nBwujuKxpzqqjGj4lvuW0GMb9X3/wZMDU
         NrmmxHeFXpPfK56/t22jpALmTRXm8uM6dXnIPPKKVEA61UKD9sUbzheuI35C7kyyKCyr
         L1CI8TuLzHJ4gSfKKmGt6PnjfyCZ+IC1AN+Mnlwh1nNS5p8TI3CqB4d5mxiwOhRn2Tt4
         lVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199182; x=1730803982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wP1nC9llP2df/xsfs1zPIJ3oMrkiGOdpltxFcj+OFqQ=;
        b=fveUXi0HCcVW3hXwm9ajvFeDhxVmzYvtCI6SxNqodblI1dQAtAOz/1yGTza291oZV9
         Aym+scrJsB7lUCZv0HNbDrzPINfXxgbUbBnBAPj222D1P2fChMxjFPA6sN9P5yEXsCMQ
         tvIg4iKFf8U4S5cc8F60Y1LGln29yrDUnKH0stzmMP+ihFM8N9mc75P84pH6nblwL4AC
         t0YFkNqoUER/7FRRf8t//lyDwlLpoMINUqr7nJTB6vknVoJkWXTipFxX6VciT5+OgA8b
         M6fQNM7tFiCxS1pDbuMOGokVrUQP1nHKC5ayvgqLLaFoXKVgnUGWv0WEb94mjiee3/TB
         A42w==
X-Gm-Message-State: AOJu0Yz/TYuuuiJHNNY3kaElRa0bR4Xo/Pxsx1PL32h07iB8utCZ4gc3
	DdF+BgaxKG4nvpjCMD1Nlc6V8ipkRJHKVM4y/cMbdljRkilThAvAHdbW5J3LHdM=
X-Google-Smtp-Source: AGHT+IE/w7kIOXo/Y3qsbp0tgFseC/dxf4IJVHvxSY84qtp5r2/GkVLWSkRL6dmR+BAQtvd2iOudFA==
X-Received: by 2002:a05:6512:10d1:b0:53b:1f7a:9bfd with SMTP id 2adb3069b0e04-53b34a343d5mr5817803e87.52.1730199182371;
        Tue, 29 Oct 2024 03:53:02 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:49 +0100
Subject: [PATCH RFC v2 09/28] ARM: entry: save the syscall sp in
 thread_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-9-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035304_525027_F0C7767E 
X-CRM114-Status: GOOD (  18.86  )
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
index 943ffcf069d2..d8a45c5a1049 100644
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
index 4853875740d0..c9525cbb26b7 100644
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
index 3cfc6d952ff9..8baab7f97f59 100644
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
2.46.2


