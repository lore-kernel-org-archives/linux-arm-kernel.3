Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D4C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S06JQqVlFUu5YQR6B7LpPsHspKKb3zlQ4EOB8DFSLhc=; b=TYCL97g8Fq+oc+bnjQPGRWd1LA
	7GSi+K8roxE1sEHQIFSwAv/LYqpgn1n+0KcQcvhww/Atg3hFsqT0To0WietOT44f4hZ3oPGW2AeRZ
	Z5Yrrj3ezCBPP4S3DZGKOIa4KgfMfb366GWDWneA7DDhUzg3ju+HCZRAtW595kBt+InJIVsv/b1xx
	pddkoVmZGpqZq7IlZIqQnEaRXkYW3wt7H2mYy9RKXxSKk/z7ZHl42GSI98A2+hvv2UdfQuBmi3XFn
	13S3/O3SJh5oQQdkiSGkEqEDRC1WmjRa6RYo/36Mkx1zRvsAgedqx4S8Xi3oLxCAcyfZ4gRCz7ywQ
	vPUKVT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HEz-00000001vjW-318Q;
	Sat, 19 Apr 2025 23:04:53 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnI-00000001slt-4Bi3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54b166fa41bso3305265e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102175; x=1745706975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S06JQqVlFUu5YQR6B7LpPsHspKKb3zlQ4EOB8DFSLhc=;
        b=Vg4Xx7w5F5rQKUs9uB0tZ9hwTNF7O02fUoJeBWJL4oxNp6FmSItWoFxLau8jxGd2Zv
         dE3GKTrqH2RmBCu7754Ka92OkdYRWu+8V68fAet1n7PjrCGuTU0UHKYveIOmKw2uiKnn
         v94JaXOLUrvDRhdHLWmdJa0RbTv4DDLG1F53xiKqpCwj3OJQGJNSUK5jHGfMT0wI56sq
         m8kN6/BKOpfVyttgkgREJy2V61SKmSpnaIvpj2xLhSttzTik2ySGqUCcgimMXmuk7hpk
         tzOgZI+h4Pywl/H+6mGxMVW0oQ9Q9xgdZKiR/3OUsJTz7VQUvA5JMaUQE7UFb2J1S0B3
         GQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102175; x=1745706975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S06JQqVlFUu5YQR6B7LpPsHspKKb3zlQ4EOB8DFSLhc=;
        b=xRJu/++8FUIBHsGwo7sSVIiVWDl8/m9SqOXINlyCfeEIoHlN7VDtGzVpr/kWb37K3b
         bAlw0dFSH/gLt0BH2gzP1BtrtyN8LBmXQbGsiOsj8+PjfZNLUkFhqbX93V5u9xOC+XsI
         W5x0uy2Szp0+L7O0uft0hNoDgPAQa4F51ej1E9fa8NI3rGmoBBa4MhsqTAykCHymHqcA
         BKP0BWfx+yJyfMJL0NIgbTSTMwCVK3NpnKELqYNUmm/cYGDSrmT1LmtbARsME5FPjNbI
         hwCCAoejIFSqZzSccnzCOy2bHyIB1ZvGj9kAqbz3mZPoOo9loIDOWuRVi24+s/GyLzaP
         YT+A==
X-Gm-Message-State: AOJu0Yz+wiKCW4ARUPkHeeQVMqYwbhPo+Mofw6fQis6PJwXdNbhCKh5R
	CytD8LrZs9SDvxu4dajL5BGXsdR1VTSM9tuKobHaOTvp6w34Z73LWUJBElNsPOM=
X-Gm-Gg: ASbGncsXko9AguvuWdqnT1XNYsWNxEfmmsEnUehHVxbfF0oTcnMkt5TCbs1Tt8wKQyR
	8KTsxKOPgVUPIveL4dvgzMeBBPZCbluE7ylEe0QKxAwZDcHLNbZmvfC1YYhggoV7wwXlELTYXI4
	+mHWutnnjXLZsILqEKZ6rquQ2orsbr5mZMUr6fYHR1w4XcKk6fNmp3XjeQvBAZFfTgVVBWPTYfa
	mZFwMsrcnbSSUaf9NGMbSkCDG9PK6XyoAFoTaafW4g8nmSBDdffNidn0Q/FXKvReYxFvIrtW8ZW
	zg2z6WNZ37lxWbywY6oYkkuqPE4yTPA2Dkj1J6wvyqOe+er18tk=
X-Google-Smtp-Source: AGHT+IGrGpnN8/tEv6ndwbb/jlIR6Kig9UXaFiAlwtupFJWaEj/+/pWLTfpATpASNAxUxjR0OdE0lA==
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id 2adb3069b0e04-54d6e633c8cmr1668429e87.25.1745102175072;
        Sat, 19 Apr 2025 15:36:15 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:01 +0200
Subject: [PATCH v6 14/31] ARM: entry: Drop trace argument from usr_entry
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-14-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153617_051388_D54E5CCB 
X-CRM114-Status: GOOD (  13.42  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


