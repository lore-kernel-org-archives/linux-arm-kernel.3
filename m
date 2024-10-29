Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1677D2AB24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsQ2/1OD1833y3AwH5IJOrZR5jmPSoKtfSG79U8bJN4=; b=aRRr5VMOzCAeMnQw+Okj9G0rhh
	dus1V/+QU8wYU09WhfnlLAd02GLECEkFCanMrAVYDKy5yjuHFQB2QmI4SOlo+/lfRiEGan13KILbV
	A1AR6+xl1e4wbtUOb5WaMZFdld/8S+lkHqrdMZffHNSH0tugoV4kLp57f8jj2HRE+wGAy+UvY60XN
	cjg1KIcqlg7nanFh0gARoLvvrxjuVvm2hEMiZcyRVRufRUXdotAcMZttQTbQ0GSAkMvs8mz9BVHku
	H3yNjI6F29lOswws9qwUwUL9RlqdfwUwoXDtokIhKx7e9FpU18Expq/m24oSh4K4Lss7mGYGJSuJA
	Ce7saSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ktR-0000000EJx5-2y8x;
	Tue, 29 Oct 2024 12:00:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqb-0000000E7Mz-3KfE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e8607c2aso5399186e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199192; x=1730803992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsQ2/1OD1833y3AwH5IJOrZR5jmPSoKtfSG79U8bJN4=;
        b=zjyZB+zh2w4x6OXhVjIO3GM6emdE9OfL6PKDQlgdB2JmHJzbLWcL34bpwPTraHcj3T
         tyXyO8fTIbYKCL73tuDXbM6GGon3PKfX2l70qev1WLBc53b0aK/zeKxHkmYG7dDHq6X9
         rp9cjLB/dQUq9nzxLYyTDEe8klmpgZCtlq8HRhLTCzbmxnBumGf20cgl4dMqlZnqR0F7
         9MYXoNImObtI7cxls90uxkA2fKvj0kh3z2jpvPG+nY2r12MCj8PCNtjsHw3IpUlD32qk
         ortMQNefBdHt7NWN1P3mfdEkzyLoiRiGZ6PBtQLjy/vJ+KUcwzqVejtaPpeNDtjfsN0X
         cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199192; x=1730803992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsQ2/1OD1833y3AwH5IJOrZR5jmPSoKtfSG79U8bJN4=;
        b=WeYFGBOsQD5RWL6ICoyxUziCOE/eQtKr4g8mNiPtUd7tgDt5F+pSi4xxDZgwx9GV0T
         0ktuAAK2xtGjIkd2UO18ntt4bRGjkwwkiIJsobhy3X/OIbRxNrCqUy1bhQp1L92mtNdp
         tsaqIIJwW1tCzn6J4/9+jgO2Du69FNBP9PjoSVxNfS/V8gFn9YRzuuUWbARHYGcr/nth
         MnAcNjvnzB7iGfcpftrEsYS+3uAP9QA0dOdG2vqdfvQoMxb3kWhqtmmsJCLLZEZ7Lpse
         KOEnMniBrXfj5SvbHL7gTOF9Zd69FjhwCTXE9q7s5NswIT9jb6HG1KEdH4zwP/uWC2bw
         eKPw==
X-Gm-Message-State: AOJu0YzOiP3qqWLvx3nNN64JsKdctXa8RvW+yF+g4d9K9Hn3yMAZrOY9
	XK4rvfQ8UVn5eumlgVuozxQMV+3Q2lB+WKCzoqeKkKH9hnmpCkdNvI4gd5TXPoc=
X-Google-Smtp-Source: AGHT+IGOwfWqSbH0lylD+oRmBxNetXVYp5mK7klp6qC5Jtc7snUGEHRWcKY/n0b0UsFd0cmE4rybVA==
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53b348c8978mr5274118e87.13.1730199191697;
        Tue, 29 Oct 2024 03:53:11 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:54 +0100
Subject: [PATCH RFC v2 14/28] ARM: entry: Drop trace argument from
 usr_entry macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-14-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035313_923684_2F8C3978 
X-CRM114-Status: GOOD (  12.72  )
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

The trace argument select whether to look into tracing of
the hardirqs for the exceptions from userspace, but also
selects whether to call further down to establish context
for RCU.

Split off a second macro that is called on everything
except the FIQ since this is the only outlier.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index d6e8b36c70f5..be2df297ec0a 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -356,7 +356,7 @@ ENDPROC(__fiq_abt)
 #error "sizeof(struct pt_regs) must be a multiple of 8"
 #endif
 
-	.macro	usr_entry, trace=1, uaccess=1
+	.macro	usr_entry, uaccess=1
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)	@ don't unwind the user space
 	sub	sp, sp, #PT_REGS_SIZE
@@ -400,13 +400,14 @@ ENDPROC(__fiq_abt)
 	@ Clear FP to mark the first stack frame
 	@
 	zero_fp
+	.endm
 
-	.if	\trace
+	/* Called after usr_entry for everything except FIQ */
+	.macro	usr_entry_enter
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
 #endif
 	asm_irqentry_enter_from_user_mode save = 0
-	.endif
 	.endm
 
 	.macro	kuser_cmpxchg_check
@@ -428,6 +429,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -438,6 +440,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
+	usr_entry_enter
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -451,6 +454,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -475,6 +479,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
+	usr_entry_enter
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
@@ -494,7 +499,7 @@ ENDPROC(ret_from_exception)
 
 	.align	5
 __fiq_usr:
-	usr_entry trace=0
+	usr_entry
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi

-- 
2.46.2


