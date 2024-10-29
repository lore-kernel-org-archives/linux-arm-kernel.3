Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38F5D2AB26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzzrIJOoccLZThZLp3kOXktHyMNXE6/2voWdPpMOjWQ=; b=hvjBVTlXUX5qrW5dqUcHY69Veh
	sAxM2Re2DlNAVHiNxzsD5tHxy5qpvLUVrTu7czN+Bd+k/IKiX2g6l4gJ9dVndtjcdHhWZAXN85qvg
	gED/2X+Lfnxt+x9p0XmNmrskFbUPurjs9Wx4VpZiGWVp/emjWWdWQu5MwNfDfKdvKtmSAz+s48Fge
	W2f8MkmE19KHJ5vJp4Gmw4/e48qmOJVSp4GEdodSLYYTl+n90bRKIh4yWKp1VkmLKuv2V51mwmVHd
	upHAvr0KBPXuWzqSS56IEFMTVd2o/t0x91Bmz7aQ3skEIKYQdTK02J5oSO1j801DpbqPj+Ke8z5/j
	xwQZ8JZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kqG-0000000EJS4-3Por;
	Tue, 29 Oct 2024 11:56:56 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqY-0000000E7L5-0D9G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so77807011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199188; x=1730803988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzzrIJOoccLZThZLp3kOXktHyMNXE6/2voWdPpMOjWQ=;
        b=MCm5Sv//OqtvW4XR1aJfHpEvS98UPhDWUWsu795Ll4u9jg+DaCFSeNBKa+QmSaxhGJ
         A32wTLMO5VQ9Id0l2UhDdqEX3jBIq9NeXKt439hRHArv3qjYrF7Al14XPALfnMqJkKb2
         3qYe0SlCGGAKNbAzPg/QNvCCbmE7RAWwgmH3WWaH5EOKxedA4sv2aOsKxv8lUCfAEjpN
         Y4+tr7zoyfNMIYK5QiaHe49atUtCRNkE8lcVlvp6Cium4PNJlZfZywwGNz5DdOgfalsi
         gsX4mhCBFGKPcaSG2IXUxnK9sozYZFzmkJMnGWsXl6hvbiAvOGn0+9O6WxnMfboejxMn
         92/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199188; x=1730803988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzzrIJOoccLZThZLp3kOXktHyMNXE6/2voWdPpMOjWQ=;
        b=kLj6Go4um4RmRx3xPS73FTXYpPb+ThAB83SYSJ9t4+Gwnj3Q6AomfaNC+Omchs9v1n
         Ix8Z/win62eSy4gLH7TKfeU5+0RJYBUPduNo6Qk5hvifrvLWJceZAMJG4lYC0uZs97Bc
         TtnOxeRBtOghia4HirM0KBJa4BwvD811hOh1s7FbjdjwDbbGW9n4ubzj/CSGXGSesrXy
         dXBoXwg59uk5gsncXAAUPEAYD2et8ceWt8hGumzrl2ly079hQCvCAKfFx/78ou5bhdKR
         LbyV/wGSRavoJXnJFfEPfitqX1qUySrLrqOqaSs6kwV6/CChb5mfgBUkcKVp2YG3WUer
         bCGQ==
X-Gm-Message-State: AOJu0YzgQ+qbVjqkGcT6OHLi810AWbdH6rGx1HDZzfHQpRnovRe+OKxP
	zcnHrHl7VayMS2dNt6sgWo518AF4dZw0Ykzybdcaz75cs9NfMp2iZ0Tv1ghei5Y=
X-Google-Smtp-Source: AGHT+IGRCP9njDT3bh0HLZQdKXOdaIKdzw+lCjY7s08cyEsqWgr6D/0u3fyrkqBD9EnSPMiRj86V7w==
X-Received: by 2002:a05:6512:10c7:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-53b348cc510mr9200713e87.16.1730199187934;
        Tue, 29 Oct 2024 03:53:07 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:52 +0100
Subject: [PATCH RFC v2 12/28] ARM: entry: Rename syscall invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-12-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035310_252053_5AC00FE1 
X-CRM114-Status: GOOD (  15.59  )
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
 arch/arm/kernel/syscall.c      |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 9c664d8c5718..b94fd7ce17f8 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,7 +19,7 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno);
+int invoke_syscall(void *table, struct pt_regs *regs, int scno);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f0f1f8723965..f1e48002bd30 100644
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
index ab9e66da0a80..968cec945a7e 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -8,9 +8,9 @@ static inline bool has_syscall_work(unsigned long flags)
 	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -22,7 +22,7 @@ __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
 	}
 
 	if (scno < NR_syscalls) {
-		ret = invoke_syscall_trace_asm(table, regs, scno);
+		ret = invoke_syscall_asm(table, regs, scno);
 		goto exit_save;
 	}
 

-- 
2.46.2


