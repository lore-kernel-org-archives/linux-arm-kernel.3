Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2251BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj8/SaLudo4NEJ77c2SgPAbc3BlZnt/7rdnxCBQ6AWg=; b=v8J0uMpVfkeyBQTqDcTdoiC/Lp
	epokors30hNrAJu+79f31lw4iAQwZOoJvxiCUd2E4EZJivr4iWl+et+/4RmAPrF/OpiQT2/ziBOoN
	0P0n4T9ne0TrWtx/v3nfXD2kjABjlFRL3FtLR0jtbTCiV0fSn2N2oJY3CEKZaY076q5ZyPuduckdq
	Bq8AFvR/0gZYx4WtdBatgFc4lfLlizjc0HRxAbcdURmHmtdGT5uU37Yjji0eCeADpPP5IEiFke9yY
	Qlw/DJSzJ4ardV9mwhEHBaQEnifptkiBSN7lboAWjcMsmoAsF7bBmKjEKGhszUXsQwmoHdj9MPcuK
	95ER+Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Tv-00000004GPu-3R7P;
	Tue, 07 Jan 2025 10:06:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65y-00000004AWv-3Dnt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa6a92f863cso257465366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242913; x=1736847713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pj8/SaLudo4NEJ77c2SgPAbc3BlZnt/7rdnxCBQ6AWg=;
        b=c6iMcik8wuX4Az8PwNshyna4o0FWrEH4vYePfZocJW/O8NfeKXLuuTl0WLM6R+Yjeh
         /HY7hvHSViml2Ux+IBzKVCZdInVUPpLeec56PbPUHTsPWytwVm8Xxv2mow6A2KX6NfoN
         e6uLCtM3PQ5WACt+woH1giQwvqwuOQMlVswHfSis1G0f53kYPoVqkdKgOIAtEEYpVpnz
         dRbFU75ZZA+6wOsSDw76bw0RQHVMGWY2VsGAXktnvxAvU8qhZk9zFu2HWStcVVo9r5PF
         dG36yCKGkar9Qpqyv/uK7Yz6UPNxjCjCj7MU9GnMaK9QvihbuvaO1e4fSQ+JUcgSGQ3Z
         uNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242913; x=1736847713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pj8/SaLudo4NEJ77c2SgPAbc3BlZnt/7rdnxCBQ6AWg=;
        b=ktCNlxIrtCxqV7goQ4muV/lDzZHYm//Tl+0CS0WPZ4TSCuy7CnhbxVv530tIwN8TIE
         bya5NdjHH7WsTtAIzByxiScqD7PYcQuf8llNBbNKYQylUQoN5V6OcvY9wx0HwM43SIRl
         McRRoEEkAUt6Gj4TUmHJwkheyCd3apEHQCj2XCe7X1Pk7NQesxSTWT9OM1ERcv1kAJ1n
         PufJ2uhxZcZn0pz1Y1NXDPcTWG722gLnoE3dRW739lc2W7NB17IGoZNOOq+WbTy21ARD
         Mpl0MMZzYsZwuOMzZhZAjxhTCmQ4k4IcoZE6lIX1gsPRk7lfbYyqGDU/fkfR103u3o4C
         jPvw==
X-Gm-Message-State: AOJu0YzMRGhMpsICn1tl/pCIFbh+IYqgSn40l5F4h5o4wUtHo+tEoZDh
	CmUn3UpWjHgLtzEG1qMyaiM/3IbanySZJwzpYcAnA3Vtk/UK/4Pd7o2BAyTO4e8=
X-Gm-Gg: ASbGncvL5l1df1HUfCQ0J7A6nHqfqRALMj6ZFrZ3ubsFcaIHOkY5SIl/Gwg4e7yafo6
	6f2Djo24Us7AMMC17NjODnNr+5L4TCWLk6yGI4RVtzeuRiZ629rHoLzeS4wGsb8RWolmg1DaIun
	JlpnvOk246h7spUlDvVwQp/Mc5nkwgiz0SkixL+3EygjfzoNR2EQezopEWhNB3sC1y2hmBicdQ9
	axFC9paWobhQOSAen81XI2N+5f0J4EL2DBX929M7Ay++Ak7dz2Kag/88iPehdtNyy4=
X-Google-Smtp-Source: AGHT+IHVxLk0EMwczs0Uxehy2LL79n8I1psLDTVXxkeoAqQionVlmgUKTFWz0Wz6ph/R5/p8X73BAg==
X-Received: by 2002:a17:907:318c:b0:aaf:ab6f:da49 with SMTP id a640c23a62f3a-aafab6fdc82mr1319882366b.39.1736242913302;
        Tue, 07 Jan 2025 01:41:53 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:36 +0100
Subject: [PATCH RFC v3 20/30] ARM: entry: Untangle ret_fast_syscall/to_user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-20-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014154_817698_D564A030 
X-CRM114-Status: GOOD (  12.11  )
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
2.47.1


