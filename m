Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21A3C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/0cVDZGMnreZxruSLY2dvzSLDJCCUi+BRk/vmsfPVk=; b=qhYqfRY7S/RgaBCugpkZuAYgWf
	RaLEecYJA2I2qpefNrLkvw5SucIvFHyw108wC+i01EtTN9z6m0OgMDK9lnr2uQ7VoOytwEqXMwFY+
	mwhMvZUNFKNrTvEPzURG9GiCPkmwrQy678/VI/yt5jX99d1jtB3/jMTQdpujSxJHLHW2qgN0Qj4Ks
	bxg+7pZab4bu3oEex32T9khF9sWmxZVTqG6EN8DyAEMQrIv2q/KF7iWTGiJ4vCgjXodF4RGuGCjmB
	4Kr3/P60zQNJw1gQFAFySp+5sm30pTgXh+unM1KUhS5uSgRJ6T+qlat4LFKLMZ28EGxGNLr24bp2u
	0/tBwIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HBH-00000001vU1-1MXX;
	Sat, 19 Apr 2025 23:01:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnG-00000001skq-2c73
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54e6788d07eso48284e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102173; x=1745706973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/0cVDZGMnreZxruSLY2dvzSLDJCCUi+BRk/vmsfPVk=;
        b=XnowbgIhlxSw4WX36lgDw4K5uz6r8MpUeED0GqeYlSykFjTk1zV316OIOHffkuV8BS
         vPV4+JXaEKrPzPfOH5fnhTWPBlVRMQMHztfXgRUxomdjiRIP2AwLeCRfYXlI7Y3MrIi7
         swreslVV6pqiRF7Llf19g2eAvMIMXOHVDQu66EoyiWiL2hRhedKsLfNOu1zxrNdpGRRf
         D0pMB+5O1xpVUtskoGr1nxw1mU/fFH3x7KCEYKdyImIdfWiS8vdmT9xBxAj86vBnLXEf
         FJyxE3drKkPB+x3Qro8QDrMF07GFU0vYTVAJBcT8nn2hL+xagZajHCYgjnJGBaPeNy3O
         CXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102173; x=1745706973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/0cVDZGMnreZxruSLY2dvzSLDJCCUi+BRk/vmsfPVk=;
        b=hZjDJjrjBVsu/NOC9n9jSzUs/FFIWzf4QqtMv776Jgg6mkHnthbyB6oTlPuLT29V1a
         sizLj9SoTLfPzhT8QyLm7NVUyQtii9PtyHQ6R6vhVhO//xi7NBLO7J3Kt87wbo51dP5G
         5IiY6/VUFVQfFDEe1jsptez86jBnqvNEa8DMAuDrjiTw5smNKP+yh5hD3c28eJuioVlc
         TnXIcvFIzYbFLg71uzJvK/XJNGb+vR9CTzFN8YYhp9yp9kpiD/0vj1vWz0ACCn7m6Bgi
         y14BzuzFmX7jQD7DgTrdvpI1maS0GYLZbSJ/BFXl6AEUaO/RCNctkk39MOBhH1soquNZ
         0Jyg==
X-Gm-Message-State: AOJu0YwhJtIFJKQnmkciXC/VCGpCy4u817/ttIAE87MDicX9X+UKkNjP
	7qONDgBZhIYjyX8Yuf0ZQmLI87edBvRxWkuaQg1H8n5mht2rxF0NHM7t9z2KPYk=
X-Gm-Gg: ASbGncsTK4pSUnn0aEenVkjQn8pg61eJcjB7vdv/fcw+S5d2rZfv3YyDQpDSfz3Mim5
	sNdfPZVUtkJHSCeuj4B9CE6imgrVxsbGFDfo0THyXsbw15fo+Cjy17xDV3oGKrMKelEg9M5wVN5
	4xJRfSnpfIMqtBIQIgJ/Rpliyq+eK2YyUvyb5Ir7h4R18CresRepge28vk91AAFnTBYFUPbPLkK
	tKSD2QlSC7+vfJAAHMOMGGCfzFHJ2ScWhE80hwlkZrsxAUk7mdYo8vd071eQ6yYUdqC2sG/xsKw
	5BQ4BcbMToMgFoFZZ2lZoAsbda/pBe3YHCaRxNE+xRpECsjCWOQ=
X-Google-Smtp-Source: AGHT+IH5eyW+1pMgdFapklrs6OWOvrrQJkiCwqKe7oqBFGUg8NWg9+mef9o53f+m66wsGks9TAtwsg==
X-Received: by 2002:a05:6512:2c98:b0:54d:69fd:3598 with SMTP id 2adb3069b0e04-54d6dbf59b2mr2418793e87.18.1745102173077;
        Sat, 19 Apr 2025 15:36:13 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:59 +0200
Subject: [PATCH v6 12/31] ARM: entry: Rename syscall invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-12-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153614_671184_D919AA20 
X-CRM114-Status: GOOD (  16.47  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


