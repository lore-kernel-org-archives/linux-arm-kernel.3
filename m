Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997FCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v829giFYonEyQ9WTV+P3dJRTtjfI/rZhUUQIvCJakF8=; b=nuxLRe8oAeik8xAsJBd4EHtTn4
	gR2FPOA0paJtY3k2dyi/cQVgT8gyVV+Cnlc87fRAa6S90Qs9kMauzvTmINw6NRglM5AnGooffmoi3
	kpaJCLZTMmewcoFSRXbrSUBQpi6/gFG2wRYhWWzr8ETPsc2JKr/9F4ULbCQm0LqmNShNwApJPn2TH
	u4AP/wCW2YBaJPfBevcv9vVCii16Na3AHI1a91+2BIEqA0LAn48wL1VKF5ZPthTyW0xLMmaDJ2cBS
	hboDYVrgUDaZLm0kIFTy4yZ2HcytLH0Rs/nUv5rW6NZ6yIN4SB1t0gshzE3KGVkWT4TV3WqHhywfN
	qCrt668g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Mz-00000004Epu-4BrF;
	Tue, 07 Jan 2025 09:59:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65q-00000004ARv-1rXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:50 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa68b513abcso2839245766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242905; x=1736847705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v829giFYonEyQ9WTV+P3dJRTtjfI/rZhUUQIvCJakF8=;
        b=jzxheBUoLMBdrX/CfXfs/R+HAp8HQ0+ZAye6WS5/TeudDv0casZPCZNpl2CffL1M+H
         c/ba/x9WzGfbHAWKf4Dl1W7yLIM++4HQZ9OVnb5xBNTK9wugcqQCguyFxLnr8DOH8C+M
         H45BpW9QfvduUVlYdwVlHfoRgjVqKEdwXrKxrcEpIXzS4XqaWWHs5FGwQsKoeu7/gHab
         fMcVL1HV+gKiiDBww/8XPES266jjN8Sn/J5+TpNN+icZmH9M+/WchLMpxMgjzBzBN/k0
         UbWspwAoKZ8LGChqMjRO4LPBkiP64y8EpfdwMXcoyP8lHvDQlrpdgomrpeGvokuTmdDk
         bFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242905; x=1736847705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v829giFYonEyQ9WTV+P3dJRTtjfI/rZhUUQIvCJakF8=;
        b=Zj/RW8WXvx+lowYffs9bavPv6WBBMGTGfMyTPK1kot3GmcQxIy9PBEOBbJFMIR6lWM
         vHIEjPlPbJV9RgfoXk5XT9tYyIVsUPvgqJEW4+wHH6Y/kxQ8uZdbXWtdEoO6FluszFeZ
         xw+Y3uCoi8zMa3N4e5qOnsYpdNomD6b8S8JLlbQz6ep6UB9AxVyp47IhCgd3tOkc8TVD
         3chqNG5GA/nbXTyfOcZobCibZ7Z4gTyDVV85fOZ9D+krt8si2Ldf7i+YA8NF5b/npcDz
         NXC6cdp8brQhA0rOSVTJXpLgWSX1kAPtldOoDpDaYjqqf2MweeiVUZ0HdDSX1ywcrTQY
         Brlw==
X-Gm-Message-State: AOJu0YwzAtMrwLAMsbl5LyjVmIFi8hoJ49DI8DZAibjPSNBvlHVBz97G
	pa7XFQ5PHUNFRvFzkFVnH0A8WJX2elVTCwIKjj84EmG6I3O/FX8T1Fq2DcEplEQ=
X-Gm-Gg: ASbGncu1McMZ0jXoQYTxhjSs4kuQObbLdWRQPtvukciILZMVPhw1nn3XAfs8DBQpd24
	TW0uBowYqlTWkBDWIN6aUloBCtCuj9qEIHrk385Ik8dOuzSdlyfmqbCs58UeXFB0kNDiQmC6Wpp
	7zWYFrUsUrFstFZ+Ico7Rz4QtwFbaZ1+B5/f93E0Sht4yOKPoZ0Ty7lsPsag+lQNOYSYHiRPo+2
	cYSI14T3kIK3vKeWM2ZhPifdZuUDG5S2iMVi6ji8WweiuR/9Aph0GI/yEQQmBLuRlM=
X-Google-Smtp-Source: AGHT+IGxL2uvreJSYgRQWypM4h6fpX3X0ht6mED44IiWbS3kunWbdejn+a0zmCmtQsTsupFQ/PTArA==
X-Received: by 2002:a17:907:1a4e:b0:aac:4324:977e with SMTP id a640c23a62f3a-aac432497bamr4897636766b.27.1736242904900;
        Tue, 07 Jan 2025 01:41:44 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:30 +0100
Subject: [PATCH RFC v3 14/30] ARM: entry: Drop trace argument from
 usr_entry macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-14-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014146_488249_797AAF23 
X-CRM114-Status: GOOD (  12.61  )
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
2.47.1


