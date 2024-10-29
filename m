Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349AED2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWWOf9VRKfs2/tqyRJcdO75r8/gLb8BcoV6DE9Ay3YY=; b=tpfivcgXsLcapw3qvKnadQyHYN
	OVLsp6EWUMCqRyn+bVThmkIkmcI/cltu5GaH3SgZcsddKI8NkEPLPWMC7pHQZI/U8WKQJkXMsmFVf
	vDSsTfDTD5K98ofDn7zMpsK5BBwJX1X0phhg/q22s0z2nLPUh7U/tiHZFgjrVHDZfltzB9bkw/+3j
	ILNa5lez8F5wb1vDgaROHqiVnSHrVEaS70f+73XUvslUyGPjJMyXKuDXYbkic1EgB0kpRtzeer4pR
	PeX3r4o5OowTqMHKKKrEyxxs9cL3gzWDXQLi9BahvZtgN8q/Tkgt4n+0DeMOsk/o1AI8HIxpyBBE6
	7M73e9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kaE-0000000EGHY-0gYY;
	Tue, 29 Oct 2024 11:40:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqm-0000000E7Rp-2kV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e8607c2aso5399361e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199203; x=1730804003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWWOf9VRKfs2/tqyRJcdO75r8/gLb8BcoV6DE9Ay3YY=;
        b=AyUt0bUl0tOeac6A+WieszW/53hVgo3TbBxOzSkhE5C/fmMYYFk/BsQdf+ic4iIqUm
         RVRhofKK8ahtwjLysPF1bnWt7OYTRzyDzMfGkrFAgsVFykVJ3XpnAm62+2b4q+E4lF/a
         /9SQfd+YXSmrusnor7quuMWBS+R36yi8lqyTsstFcq/Dar2kghypHejVLDjlD5ii7hMf
         +AlL81vEk366ZZDN1DYFI6B66ziBcXqHMRR9aZmB62ugTKFnKagacozELvfohKEiB9KE
         lOgUWNQ7sBCKgyslrISlxUYNnmnMviWLtEQ6kgE2wXmpBy+JaAf2moq/oigzL3LBr1aZ
         scSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199203; x=1730804003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWWOf9VRKfs2/tqyRJcdO75r8/gLb8BcoV6DE9Ay3YY=;
        b=wmgdsALTxO+8g5uIqGliT59GC/WlytBKGumUAdw0Thm0fLKlSKVGTO1wW3S003v2hW
         CbarBp57KQArG4+sP1Zg3ma4x81M4f3QF4xa2w62W0tABRRRfTzGgQhq+p5iF6f+gpI5
         9d/yrK/pBQ9UYbR3X0O8RfllNlO7spnNJiuxrM+1sAdu/zaL+QeBLNF1oEoh+lvTkwpl
         H6EwDw56eJU5t+azs90cjJJW2FsCw9S8sFrzMobPxyjsq7jH/NQkjG9Nw+8uCWgIgY7O
         wWFXPAr5F00njOVaCmgSSwD08hWHx4xw9RzDX3MPT8/uU1E2fdrzOMTjSfR6WHt0M1eu
         QSkA==
X-Gm-Message-State: AOJu0Yz5qgXbIGBpeRt+9a34RZNpKUytLPw3Zn4z3xR25qrHc4dZUTC6
	xhL8J8JugMaLAnJy6qV77fQkU6pmuIoGCfdNrYLgaiLgXHDwMwYV/l7NOkOgN8E=
X-Google-Smtp-Source: AGHT+IGYokcfvTEQUjshtOgXGdmRS2U3eH+gIN/8bmikMfR0LXUeM0vzogR0GFUwOUcsWs1HgXxhYQ==
X-Received: by 2002:a05:6512:3084:b0:539:fed8:321 with SMTP id 2adb3069b0e04-53b34a31cdbmr4939668e87.51.1730199202995;
        Tue, 29 Oct 2024 03:53:22 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:00 +0100
Subject: [PATCH RFC v2 20/28] ARM: entry: Untangle ret_fast_syscall/to_user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-20-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035324_736506_320D282E 
X-CRM114-Status: GOOD (  12.22  )
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
index d27e34d7e97a..ece921571714 100644
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
2.46.2


