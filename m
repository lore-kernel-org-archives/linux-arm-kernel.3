Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8EEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=; b=EA30SbCGJKM6hUvuMU245ik8je
	3575R8EmU66Ktwu+lchuRrqTaVifK3eHPU9GREk1gzUkgJaqDnJhyvigni4nVJJgyhIB+b8XkvluM
	kgRmYX+3dA7VIreSWSD4spdA2sdunHBEyt0GL3h7iZ2nt9ANiFBChWmIJIvP8SvYpuVzFV14onwum
	DjwVcEPgy7ZvBntNpBPC1cLiYicjudWn+3q9eAqJYRKGx9ak3oXTx2Vv0Kd/hZ+0zau3+JqOGqOKC
	t4cT/2odOVByP+GdsDkS/0EBJHHI7mouWps56b+hlXWYYKJo96V7KsEIu6j9Y0ghwKle81NtYbmKK
	27bEqDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsLr-0000000GrXV-2I96;
	Tue, 25 Feb 2025 10:39:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreu-0000000Ghki-3KHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso5037286e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477323; x=1741082123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=;
        b=QTkEhf98nw/pF8ILsFseCiGNDlsS/bV2FVUb2le7p8y6JmMVXuF1aMcU+XI7L13Td1
         /ZOn9OXtGSqBVqr2fEXva0ktH9ZAPCfhZcqSZXjrSZUFN81sulva8GCONp70ct6FcnZs
         APjG+MgPh0yyQQQJj3FsedL64apFDy6L5GFEYpI9XjrNZV02v1euK8UMNHSZ4rxd6huS
         do1qsuMxO0J22dBSvGAco02q6wTIfEU+F5aNbdqomoFDP/GhT5kIWbBfgRtDhgouvxCG
         ++qotarEW3d2/fzpLedgB+vG4pt+KMicmn4ewpo60h1B9he1VZF8zFfMT5eOf3P75yxn
         qtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477323; x=1741082123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLPL0cxSmhQjzTuSazqL5ULZpLc4BXlPwpKFYiv7qfk=;
        b=irJM1U49Y+VwlRthd1mULU0rffgqojTm2xoeu9it7OjbmH6chqyEEbi8D/us0mwlOA
         notxggHBbtHaBq62ecuY6Ts2W1T0jKCsoEYqhet/oU8fkryomyTZn5fqRvD3SxPq65vW
         O74CP9NWHZdMzF5MJkX3ny4FywdKKzxEm3rwtGCT9RbSJx5/7ZhmINSF7GPbvrPINTZ7
         nMo24FKlSpPmuF6VgHOPx1jcWMgXBhqyRHMXiI/Xu06NTkErkIS+NsmU+DvORoLLRB0Y
         hD1VjeGFKc7ruE5/i9ycyh5NoAJhuODHukuw+2bKnOv+5AuHhK2PEzVapuNkuDciG/9+
         wgVA==
X-Gm-Message-State: AOJu0YzvqlFpEPxI1pkMnMa7wRAPCdnL5vM+SKKCAGYbCVKpHQo+Vdrl
	NsQNPbkBhexf5g/t/1iHtZxy5xUWOF9xFPnskP3IgjQVlFKJGHj+wzN1jzFVKdY=
X-Gm-Gg: ASbGncujuYjckm6daWNPOLBtw+g3HMnr/nliqtAKoF2dcNPTnv9JGk6IoedbM9R34O1
	4XbgicR0c+DMRt1KfNaNeeD2UK7oRufdoDrpawFtKry3W32n3wboJuyvK0D2LCiP4NBDiYjskhd
	qQjEeHLMrzbj2L2p+/IQFnGYfberY2oDfLwl7otWxe53sDOMwnSYxOwqBDJGKM/P3FjS4r8NSog
	DkJTIIQpgwNSD2vREdBnArZbyDGiR3o+wSBsT7HHWs+cnMTuoprckgmS4EbUZUDvqmSddO21gEi
	uQsrutFdzSlmfIyWvWpWyd4MlZo8YjBj8nOS
X-Google-Smtp-Source: AGHT+IG4gnndhO6d56pPyJzHQkvZAwyB0xsXUyc/MHVXGstc6/S0wQ2MFyd0xpUKVgQgFI8a8Tye1Q==
X-Received: by 2002:a05:6512:2809:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-54838f5a9d3mr5459397e87.40.1740477323227;
        Tue, 25 Feb 2025 01:55:23 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:07 +0100
Subject: [PATCH v5 20/31] ARM: entry: Untangle ret_fast_syscall/to_user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-20-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015524_835021_4B528CAD 
X-CRM114-Status: GOOD (  12.26  )
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

The return to userspace is a bit hard to follow. To prepare
the ground for further refactorings we rewrite the functions
to ret_fast_syscall and ret_to_user are mostly stand-alone
symbols.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index d27e34d7e97a079d62e7b778cf7cf97c302e4763..ece9215717143427de7572a18a6dbe620a9193e9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -44,20 +44,23 @@ ret_fast_syscall:
 	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
-	beq	no_work_pending
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Slower path - fall through to work_pending */
+	beq	2f
 
 	tst	r1, #_TIF_SYSCALL_WORK
-	beq	slow_work_pending
+	beq	1f
+
 	b	ret_to_user
 
-slow_work_pending:
-	mov	r0, sp				@ 'regs'
+1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending
-	b	no_work_pending
+
+2:	asm_irqentry_exit_to_user_mode
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -74,7 +77,9 @@ ENTRY(ret_to_user)
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
-	bne	slow_work_pending
+	beq	no_work_pending
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
 no_work_pending:
 	asm_irqentry_exit_to_user_mode
 

-- 
2.48.1


