Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=; b=TzVME0153Ln1liY6to+ko9QM0W
	1nrNc3QZPGloGettzdenES5nhTRwOxpYuM/uGgePVCCIshwWaA/R2Msj2tJeT3uAQqdLDdSzonmA2
	OwtXThgoMqBryhctCBFye25JtznTiHcTYZFSYBmfRFsKpTzKJCmXt3Em75gSJd12E4XnXCNZmP2SN
	KLWbNbeyIN4fcbfUP7/z0pLbZtJrzWCG/Jiz9PIxf3bMEiJD1HwcgM/iXstjIeuObeNKmYMok7Fh9
	/Ktgn94BF/srtrZbjvZJvlNHQaQmG6R+HkvWLbRi4I7WUOpzeydfHX1bRvtK/C0thdZRp4O5UsObj
	9GXkarbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBBF-00000007EK6-1n7U;
	Wed, 12 Feb 2025 11:45:25 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApu-000000079fo-3Gi8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:23 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307bc125e2eso62128231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359401; x=1739964201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=;
        b=aqPFOedqVlrfQFvuOOO1iLlgHgkTtSvgl1Dm77ytZ1YJLp/nMErK8RxU4A1F58bBdS
         r1IWO+jB8+ezvQuVchvoMUwg/rLyPpx13Jj/IIEL/qqsSlZwuDxMgHiTSlT1stj31JuI
         RT+e/YmWYSloAwtrH3N8ikHuI9rWk3dyYCbY6TavG/41mOmPhXlh8RgZ6x2AUCCNwv4a
         Xmirp8y1Z0J0b+cnQhpwdkB5rbDjuz7uHFYDitaB5/hkvSnLLaihFOBQ727GKSyU/OA6
         do4oecNPdxizjTgLq/gy7LpWOE3ktUPCFPgn09D9sIeqi3y7Suws1aJZEy7yjaKiCgtW
         0p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359401; x=1739964201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=;
        b=lak1sKwEDflXXIRDfikeOb5pQgh78uKqauxs5oapH/8WflQ89emTojRz+zjnWAgAK9
         H4fLCu8+vfHWp2wkMbLy8nOPpal5zqGkWS/AaTZu4ldEta4RTDXEqPrvqpwBqYUp6Scj
         Fgc1sdlmLXwDUbJXwnvKnD+gFro2Im5FiKN/PGmEGlXVO6I6Ne2y2pKcryAzb4MQIEzc
         fUzg0L8qLNYebk2iF9nYQ2cNog0RxvPVCTmWobFJve0iZcxPJtCFddm83DBfXEkgJ+8n
         qt4LKcO/sQunepxNZZi5fWY5roYdf2tVOmUiY3/iARFmKVqPqQ5T8iXVsntSoIGG4UYb
         42VQ==
X-Gm-Message-State: AOJu0YxJt6oyp0CCphnylM6BZeQ1coJVQ4YFhtuoR+O6VJR6QIX7BOsf
	j6hutMc+OQ9RX7AKZOsz2UDsbFn7ZB+ukcby1OwxL7YfLZK0RbTLXKXsQEeN4S0=
X-Gm-Gg: ASbGnctxbwZ7N9fR1QRnR5aKPSnsVfGoKlw7Id2ChINetwH+1m1nRntHqAujle2RWfp
	JhudA4Uv5STxSOxFSBYg8GiZ2vQwyDVAIPA8cqNEWBIyD7O06omeCrIi0gkEpgKtbgMfYl6dM5h
	4FJqMUJ7tKZO3vMQw1Hiwk05UW4ba+qPEWpl4aBAyOBQNKg8pFlaxSwuBttp0Ao+Epy5hzCSfLE
	77ZbYs1lpdS+0Fcgcr1Lt08nCOZJcnUBKzX1Ptkt/UTTrm6X1AjyenkqeCyte0idGYIGcEeBItf
	jhuWAm5zq9Ol6sJtW6JWBo9aiQ==
X-Google-Smtp-Source: AGHT+IFJnUYDjF8FB8NajpoFIXNop4QIT5L6sFMa3fWK7tI1+RrzzH8NZHHj8Q+W0l9RcxU2y5/akA==
X-Received: by 2002:a2e:9fc2:0:b0:307:9648:65c3 with SMTP id 38308e7fff4ca-30903665fe5mr11295941fa.15.1739359400622;
        Wed, 12 Feb 2025 03:23:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:08 +0100
Subject: [PATCH v4 14/31] ARM: entry: Drop trace argument from usr_entry
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-14-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032322_820284_CDCCE422 
X-CRM114-Status: GOOD (  12.71  )
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
index 93a37437a9520118eff411f009e8f6bd729412fc..c71110126fc105fc6ac2d6cb0f5f399b4c8b1548 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -357,7 +357,7 @@ ENDPROC(__fiq_abt)
 #error "sizeof(struct pt_regs) must be a multiple of 8"
 #endif
 
-	.macro	usr_entry, trace=1, uaccess=1
+	.macro	usr_entry, uaccess=1
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)	@ don't unwind the user space
 	sub	sp, sp, #PT_REGS_SIZE
@@ -401,13 +401,14 @@ ENDPROC(__fiq_abt)
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
@@ -429,6 +430,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -439,6 +441,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
+	usr_entry_enter
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -452,6 +455,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -476,6 +480,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
+	usr_entry_enter
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
@@ -495,7 +500,7 @@ ENDPROC(ret_from_exception)
 
 	.align	5
 __fiq_usr:
-	usr_entry trace=0
+	usr_entry
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi

-- 
2.48.1


