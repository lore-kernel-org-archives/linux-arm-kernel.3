Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFA4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=; b=XP8kN4MVQSxHNokbAADIzMm+kT
	PpBKTfvdtjgPC8r4I8vQXl3UmxcYYw1gZ6sgd0Gal7kyOAbv4yXPIA7sshi5b0biISMMSq7vCaYMQ
	DfTR0lqREc2Rr0pfiWnGcB81ZvWwqzjJXZ/Tm5uludkfymPAjTzZufB9zD/tRW/p5EvdFgTzB2I1e
	C+S38xnUkBhJIA0j795aayTfh+pLvEPpjATzCT2CaHwaaVj77d4NTCdw3HsbyvSBbSHbUYVYZK+Q1
	X/h5xi+Vq8NyYZ2ne7Dr5wx0CuQtONbWv5Q7qz81a/Cv3mlLiWnhw0/p5FB1xBF3L1Ug7nOJp7qtE
	mkhGRpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsCj-0000000GppX-1Fiy;
	Tue, 25 Feb 2025 10:30:21 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmren-0000000GhgQ-2Dzm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5452efeb87aso5417649e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477316; x=1741082116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=;
        b=Tx5gAie6/0aXgeQW/z/S9dcfCd0fn9f6MFUh/9xMv0iH4XiDR9hH7sBc/6S7EvWVCo
         F7NmyWV8o93EO/4sM0KpaQZ2i2ig7Rga2qyxoqhYeic2oHpOUJyFMTWk09PMwUEaqvQ9
         NeQxstThVxM8zEekSZ/X32I0jGvkIaLBJP5ntx7/bkQcm6zfeXQOJai3VkvBiqqsleSX
         dQyE8iipzAzWOhs9YbbJCaKuzdl1Tn1FHP5ABkT/HvGgCetYryv2k0bCk75XfhBvS54m
         hUB1mSMxGJQv3XIwrHANszPzz5SZWRIf7+PJ1fXyARTfwWXldSAVHamQ/U63b2xt0wSd
         tq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477316; x=1741082116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgvrpQqwFQ0R0umdPRsAplUpCRMZEe+n8Q2dyj0aMbc=;
        b=LYIH+SA5Tq/P1PNtO2CwDorbIu9nTWH3xKr9Oa70Spk56YABtQwKIYn/F8vpEvboSh
         SynGG8eGG0Ls1JRlHaatuIS8MQ7PiAMDxFjRcsndbPFwlCpLqgry6Dx6hClGe9SqZP/8
         DE3Vdr6+YZx2Cf48wdqxWFiyydBZQsKOOzMw72zOWL6xKDXPPJwYn0UyV5+LjgVrgICn
         447IMRHrClqztf0qB0Y9fjxVRH514dr5EHPIF3ggmYTcTapG7Pv6ZmPIl7vLtgYhKzQF
         vNsiCGrx5YJFuczmfbKcfFTUUf4EYjnG44u9+DbkS2qn6qdt+oy5xwlVPWJP9MDvrA6O
         5+jA==
X-Gm-Message-State: AOJu0YziFdDTCdI+XsrJEbXBVdQZfAy5F26Bk2TdwUSSorhrMRqRp/WQ
	zZZ60BbRoDAGs6OUozXLkgn84yG6cLSQmIw016o67cDmSIPME9jX0fyvpcfRN/U=
X-Gm-Gg: ASbGncvJwMTieIPdwfq+4gJE5UmmTpobwMiQk6xq7SpO0L82GPSGPBUB8fHjlEwn7lA
	7AYoutTz7FOJ9I8VFgCjmERzIMN4dyTywPITMekQmB62X50/PWM2TEKp2HFfYrLmHTKHcFXStA+
	NAnVJQJcBHYm3C3xU1AveJb8TYefNKcLKjLG3T+MCsy+HMPS0U5UfYbGb8M/QWtc4RTEWAi31y2
	cpugHcEl/OsTufxefIBP0qQmA3dh7a1rya2ejiJ60jN+UBPa0ginkO7a/Lsbvc7etxfYLmzQPGC
	OUfKTM3aCfc5UGgseYHYeCDCwoZOjUDxRnEM
X-Google-Smtp-Source: AGHT+IFzWjwa7+x+DsN9qo/60H31u5WVx0JVKoFSYgag5yjlwdX8Fst2CGM/hjw802aY7bipwjamsg==
X-Received: by 2002:a05:6512:ba6:b0:545:2f5d:813d with SMTP id 2adb3069b0e04-54838f5a9bcmr6922156e87.37.1740477315950;
        Tue, 25 Feb 2025 01:55:15 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:01 +0100
Subject: [PATCH v5 14/31] ARM: entry: Drop trace argument from usr_entry
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-14-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015517_576294_84232D0D 
X-CRM114-Status: GOOD (  12.76  )
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


