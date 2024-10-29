Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F277DD2AB29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aytaH1oLbxE7oXL5Lh1BICkPib3Ft7vQWy4tTKokWI=; b=oUagOdCkWu4eziRmJDSLh8gx2Y
	KTZGZvKxU++fdP+z+CcZmr8HcvQ1431jA+5eCkp9F8fgX3pFXgkMpOmAEK7adCtnA2KxDNgN0E7su
	80EeCGdLKwWJGV85LH42lbIevYHWcwCfKwu500n5r4Ht0GNo03dN/OHL17WPgTvm24ygXhCtWpq/L
	YEkdO/Z8iU7gqppU0w8+bPOOTShGeRkLWJUp6QRkHxnTMT3bpvqI60K7hmq/PsLRbehar8dKInKj1
	tCJlrMTnF19peGEKQmpDY/odOMkNI3bFqG3HvSZan2Uv1rgnPIISXdbfFG3M58aBNj9WK7yUZZfR0
	QG7Z2vGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kyF-0000000EKwO-1kPT;
	Tue, 29 Oct 2024 12:05:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jr0-0000000E7Xo-0voh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so6476856e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199217; x=1730804017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aytaH1oLbxE7oXL5Lh1BICkPib3Ft7vQWy4tTKokWI=;
        b=WHHg6DHzbAjRHBRKKONy7gPdWxbar0Yao58TVM22uQm2YongJ60V/ddZpgYA1/aDkR
         9ullBO3Qy0Uo3dhBdVG+7osyaObwgAuT6MBdP5dkiYJITN5+SzADEu9ocv4j3EgUDX+S
         aObf2uVgTSqTJRfjpTMUSNn3EXE3OFt7TyWlVX6VljEBJr9E1uKfe9276yAWBuy67xbK
         JilqdHnzwj93UVQCfEj7nt7QGvz+F61yp9jd/HRHBT7wFEuGWIpZKNgakTaeUTiLYzqj
         KJG4vuRzJe0l2TeNgYN733fqaH36YUmxtBVBCXz/K9Ulmcu0UGv6LZere5hmf0RxM+ln
         Mxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199217; x=1730804017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aytaH1oLbxE7oXL5Lh1BICkPib3Ft7vQWy4tTKokWI=;
        b=t00rXVU8FAdjLpkFUaDH9F7j05JFU3Re4IHMy6M/6tKWnGcYsHwaE5lGFIGexGCghD
         sfCT22lDKyfj/L8VgtanUONFhmzZna4g8hIqiHv+z+jfD+0fYxUiIJ3a3NMA8QMd9QYP
         c1Xs1aK7sGl54uTfMgLgwJFSAbvkhZ4hyE2EQyu77XDCjRPhi9M1lzSaHADewr8J3PeJ
         P9/izrXJHJAmWxNM/W6v3nO2XY5CZxMern+tLcmt77D/D6EMLCJBFMpW7Gl1FtIKZrSE
         e2FXarsHdCmrKbPRNTFzgod9+phy3hzVeAC8LKrvRUGgapqIv0ubYiBssUvZrKdDmbVl
         YfuA==
X-Gm-Message-State: AOJu0YyhJNQ0K98ihT3qxe+lSHwUKpbGEuwskzMRPQHmG48moV3grAUO
	DeHkJuY5oxuV/yX5gLu2ZXb7NHK8XXg6azk2CPk1RUWf9NAWEMb+cXBEWG4aaFM=
X-Google-Smtp-Source: AGHT+IGR4YQInxFI66N5j0WfMdCdeF355iwdhYBDKEXmAVJwY1SO6OvLh/7PzjphT8TgoLwPMIQX0Q==
X-Received: by 2002:a05:6512:10d6:b0:539:f7de:df6a with SMTP id 2adb3069b0e04-53b34a3208dmr5334035e87.52.1730199216687;
        Tue, 29 Oct 2024 03:53:36 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:07 +0100
Subject: [PATCH RFC v2 27/28] ARM: entry: Add FIQ/NMI C callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-27-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035338_302018_35A1A3AE 
X-CRM114-Status: GOOD (  13.33  )
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

These NMI (FIQ) callbacks are added to complete the calls expected
by the generic entry. They are perfectly fine to add code to
but are left empty for now.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  4 ++++
 arch/arm/kernel/entry-armv.S   | 14 +++++++++++---
 arch/arm/kernel/entry-header.S |  2 ++
 arch/arm/kernel/entry.c        | 16 ++++++++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index a78bc5054b09..2e7ccd87f0eb 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -14,5 +14,9 @@ void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_kernel_mode(struct pt_regs *regs);
 void irqentry_exit_to_kernel_mode(struct pt_regs *regs);
+void irqentry_nmi_enter_from_user_mode(struct pt_regs *regs);
+void irqentry_nmi_exit_to_user_mode(struct pt_regs *regs);
+void irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs);
+void irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs);
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 600375f6f5d8..839f3ebe7228 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -157,7 +157,7 @@ ENDPROC(__und_invalid)
 #define SPFIX(code...)
 #endif
 
-	.macro	svc_entry, stack_hole=0 uaccess=1, overflow_check=1
+	.macro	svc_entry, stack_hole=0 uaccess=1, overflow_check=1, nmi=0
  UNWIND(.fnstart		)
 	sub	sp, sp, #(SVC_REGS_SIZE + \stack_hole)
  THUMB(	add	sp, r1		)	@ get SP in a GPR without
@@ -205,7 +205,11 @@ ENDPROC(__und_invalid)
 	uaccess_entry tsk, r0, r1, r2, \uaccess
 
 	mov	r0, sp				@ 'regs'
+	.if \nmi
+	bl	irqentry_nmi_enter_from_kernel_mode
+	.else
 	bl	irqentry_enter_from_kernel_mode
+	.endif
 
 	.endm
 
@@ -297,7 +301,7 @@ ENDPROC(__pabt_svc)
 
 	.align	5
 __fiq_svc:
-	svc_entry
+	svc_entry nmi=1
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	svc_exit_via_fiq
@@ -315,7 +319,7 @@ ENDPROC(__fiq_svc)
 @
 	.align 5
 __fiq_abt:
-	svc_entry
+	svc_entry nmi=1
 
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
  THUMB( mov	r0, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
@@ -490,9 +494,13 @@ ENDPROC(ret_from_exception)
 	.align	5
 __fiq_usr:
 	usr_entry
+	mov	r0, sp
+	bl	irqentry_nmi_enter_from_user_mode
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
+	mov	r0, sp
+	bl	irqentry_nmi_exit_to_user_mode
 	get_thread_info tsk
 	restore_user_regs
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index cfaf14d71378..ec8a6e193802 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -252,6 +252,8 @@
 	@
 	.macro  svc_exit_via_fiq
 	uaccess_exit tsk, r0, r1
+	mov	r0, sp
+	bl	irqentry_nmi_exit_to_kernel_mode
 #ifndef CONFIG_THUMB2_KERNEL
 	@ ARM mode restore
 	mov	r0, sp
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 1e1284cc4cae..09109215dfdf 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -69,3 +69,19 @@ noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
 	else
 		trace_hardirqs_off();
 }
+
+noinstr void irqentry_nmi_enter_from_user_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_nmi_exit_to_user_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_nmi_enter_from_kernel_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_nmi_exit_to_kernel_mode(struct pt_regs *regs)
+{
+}

-- 
2.46.2


