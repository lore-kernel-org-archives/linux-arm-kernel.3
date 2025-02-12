Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd5myOXJmBrq2ZireMN1LAxoO4XGu12StPrpGUT11PQ=; b=4k2G4Vqe6C+MBOiAN2DsNeT5u/
	haYUndXhTpbmaqAkcFZZemgK7g8B8FsYrIr8unReLOaBQpk86pbIXC13Fzdhiy+JtkUtGLibpS9e9
	TQO7/n8jAcA2qC1KFcwecx5UpSr0rfWCXwnD3VPsYUMxkAnmEe7u0XDMpeMRmph2hGsBYN7GLaC7h
	uKLJ28pf5+DzolHBPEMnJRgyaU2oKRAJi9zfRPzDDMuAoADmUGEfG4FuB7lJyEfnCgpLTKWhxBl7A
	+/qXR1O9/yO76jKjQdoiZhdQpkN5GYrM/c6MtuoWp72l4f28g1iEtyLMWw8UdQNG/i9cV8bywlzPo
	KDVJBG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBYt-00000007IcC-2wsD;
	Wed, 12 Feb 2025 12:09:51 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAqC-000000079n6-2JMS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-308edbc368cso32852301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359419; x=1739964219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd5myOXJmBrq2ZireMN1LAxoO4XGu12StPrpGUT11PQ=;
        b=nbHhR4d5J5rOQJ4GFk7ee8CA/aHFfgkhZb8KyNi0hVfCJNloRswedrX8lb7DqDV1Zw
         1jikUg4MUIVHMaO4nVMm6plZhkp16BUqtnKvKl9XszpDu/RrSOyz4l8Ed9Z8f9Uqd2Dj
         DURs9WnaF1vdv5ty5sLAUf5NBZfqjj6jaqYTnOhpNGelnbn7me9jVnsuf5U8kj7Tlowo
         MVQttlr6BMve/gitEq9daMzRZPT/dtZoSovsvaTgiHdPYv1weNeqYAXgzKd/ILqJFxTz
         7I5f02NqhTEOa/0YAtpIX8tgX19KjcaALGaUHtF7EfIlAubR+Ru+jkcdKt4Gyiikswni
         twWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359419; x=1739964219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd5myOXJmBrq2ZireMN1LAxoO4XGu12StPrpGUT11PQ=;
        b=wyrfow1O38irAyEqnxKV8MV3rhbvdLVJQaTrKk6B4hpZWsbnGHrAztGiJmuBjmn2sX
         zXav1B9a9Ah36JvG2qj/gwJwAY3/O6QxDzKtBP3DTqlrsET+RKAUqO9tvG47ffQwj3CG
         ilHhFIy1AmQiSsZOpbJqI1UyT/qadekVTNaJKaLP4/D8HOKrXQjMUCkWkCqkTr15yKWf
         2oVnOi5+irZz/sNMxYv58hjWyJN5bDmROA7iw7tC3NeXzT12UnF8ir0Asddgz5CuBtMY
         eWhl6DC6sK2TG5QS1OG9DEyRysawP8zZTSOcUJUDUqWmOweG0Uz5DBq4+voLmPVF3mXJ
         holQ==
X-Gm-Message-State: AOJu0YwzhYAvSFC5s9lpVCVdjTNSi+/hXpXBYj2WP+gpAOoy6zpoogFP
	L9dq/mVQ0CMTdIF9n7FC+rUpC8Ek/ilN5Nnaely5ww+US9JDgZydcQ9/KPFtUYU=
X-Gm-Gg: ASbGncvcZ84ItegPcTJszT5jzDbst6dY2k1hVHg7UdyvSCkPlpxReXiSVERDZA53xnQ
	8+rHbvRdHQIp2UyEbSh14N+ozVvKN2wEcWHdr/UMqBJJEUA6nhp9HB+wy41Yl2Qk3JUQ1WdRzM1
	BriwABBhrcImGEenvNCHnYJUdN7rKbIu2UkV9HEgM5lZnYWQqgS1ZYaAQLKrzcE22bEC6tSGTXU
	qNWQ9my0yEqYPQ+fk9u3bHNXQUgm5urS9afTmNlYO03lpODFDcbaMHtyLKUexFci9Qa6rimUiAF
	uQJh5YQ9ch6pnmiTX8RDlgwPhg==
X-Google-Smtp-Source: AGHT+IFnBCvVu/VGrB3ufwIm9PIPjMNjQwi218jFm+vuC3QKd2lwYi8qU7J4iPr0yHXGhJ+sLSoDTg==
X-Received: by 2002:a05:651c:1991:b0:2ff:c3a2:f408 with SMTP id 38308e7fff4ca-30904fe65b4mr8433611fa.12.1739359418597;
        Wed, 12 Feb 2025 03:23:38 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:25 +0100
Subject: [PATCH v4 31/31] ARM: entry: Straighten syscall returns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-31-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032340_592496_4D69B33F 
X-CRM114-Status: GOOD (  15.23  )
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

Since ret_fast_syscall() is now only called in two spots in
vector_swi, we can inline the function into vector_swi, and
skip the separate call, placing the code from ret_fast_syscall
at the end of vector_swi and one of them inside an ifdef that
gets compiled out for !EABI.

TODO: is the UNWIND(.fnstart/.cantunwind/.fnend) really needed
on vector_swi after this change or can I just drop it?
I do not understand unwind well enough :/

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index a5a0e757ab23d151485092a078af98966e039869..f9c38f5311851e299234997796cd78de06a5c531 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -30,21 +30,6 @@ saved_pc	.req	lr
 
 	.section .entry.text,"ax",%progbits
 	.align	5
-/*
- * As we will need to call out to some C functions,
- * we save r0 first to avoid needing to save registers around each C function
- * call.
- */
-ret_fast_syscall:
- UNWIND(.fnstart	)
- UNWIND(.cantunwind	)
-	add	sp, sp, #(S_R0 + S_OFF)
-#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
-	bl	stackleak_erase_on_task_stack
-#endif
-	restore_user_regs
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
 
 /*
  * "slow" syscall return path.  "why" tells us if this was a real syscall.
@@ -122,6 +107,8 @@ ENDPROC(vector_bhb_bpiall_swi)
 #endif
 	.align	5
 ENTRY(vector_swi)
+ UNWIND(.fnstart	)
+ UNWIND(.cantunwind	)
 #ifdef CONFIG_CPU_V7M
 	v7m_exception_entry
 #else
@@ -210,9 +197,9 @@ ENTRY(vector_swi)
 	mov	r0, tbl
 	mov	r2, scno			@ syscall number from r7
 	bl	invoke_syscall
-	b	ret_fast_syscall
-
 #if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
+	b	9002
+
 	/*
 	 * We failed to handle a fault trying to access the page
 	 * containing the swi instruction, but we're not really in a
@@ -225,8 +212,17 @@ ENTRY(vector_swi)
 	sub	lr, saved_pc, #4
 	str	lr, [sp, #S_PC]
 	get_thread_info tsk
-	b	ret_fast_syscall
+9002:
+	/* Exit !AEABI clause */
+#endif
+
+	/* Return from syscall */
+	add	sp, sp, #(S_R0 + S_OFF)
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
 #endif
+	restore_user_regs
+ UNWIND(.fnend		)
 ENDPROC(vector_swi)
 	.ltorg
 

-- 
2.48.1


