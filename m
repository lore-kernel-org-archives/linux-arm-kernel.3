Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEDEC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw0V66m60nCqUZ6I3CWtDCcAEKaevGAZ9HVr27fyCOs=; b=Nn8i7akGSEW1z37Gsh476g344E
	fPeXh24zLPv7W6j4S6rCnnlGEaH8RjV8pwPUXuWEYVs6OgJDS0uxo4FjkaQtgY43PYAqD7IOwoVdS
	Vx2f6M+ahUbe9WzFRO2hMwZHlhplWOeGG/jmkiQldNGwIrBql/pcXr16Tv2Da4S+jAz8YgnEIg1KE
	vghmlx9JIk538b2yWYL77YL5i6vZjnLlCnIF7/gTWFjpXXjP25UQcHDGI4BhygE0UI9O34wBjFsEN
	ZUJhxPxBTulqt4ymKmvsJOAVXTJreWXn+mYcmmPXsGj2+Dhv+DrY9c1R6CYQUUD5BmSNU0kFX8XTd
	c9ko3FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HZV-00000001xRv-45HW;
	Sat, 19 Apr 2025 23:26:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnW-00000001stL-28SL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5497590ffbbso2635485e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102189; x=1745706989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qw0V66m60nCqUZ6I3CWtDCcAEKaevGAZ9HVr27fyCOs=;
        b=KfMvOLBN10TB3JrDblW5rXWD/9ecDagrxVHBiHWPo6pJ4lnnnoxNp1PeOPn2LDjlYm
         28ujB7V8kvUgV883XuArq3sTC87Rv71ZtwaLMmsKEt0SDOCJH1T+1z4S1tReksjN6xjY
         u3lNA7kAXavBALyDWGUcxWFTEci2vkZz7pPebRBn7+vvt3WQ7GKT99BeX4JiReBZj+lk
         a9lvSOYU5i6vQF+/ebjuiDKHrZZDwTaYtzMalbg4V7FD77C1I21DhAIOzz20ZFsMKyTF
         zkUiZo70dw++U8IXWxyj1sh1481Vj0VvXRtnYgOulYjMbadR2MaZyO0TTfPOdN21uF0C
         NaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102189; x=1745706989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw0V66m60nCqUZ6I3CWtDCcAEKaevGAZ9HVr27fyCOs=;
        b=i/0VNUUkLqGyXCc8TH2UtECP1vLaFDgW98mBswiGXqBDMu9PdYbAe5VGszkxcZZqBT
         N3F9rEORqZKdxNLI/k73PjZhB4NJkgYd63NKvYWOHwUsU9s14Ni0ppZxRdMVzbbwlCXw
         uSNAWqReGjAbIG8liHAZDi4tr2KNCB+2TNNyUiuUFPZT3XtUOGTwk9J3Lxb8ouUUhDlH
         N/4HJm/mWHIOUqbX6V5ZYPdw8Tf2VISjzqo0zdzoUfTahkKQ6C3baP5npbx8kQfovwTQ
         BH1h2HfcQwVVtj89UqglsXR8ykUHdU7io9BcJASj/dbKdeKbZvpVM8qpc6G0bM/8iRKc
         G1xQ==
X-Gm-Message-State: AOJu0YwU4I0NJlilC6Ul9yBhoBKwCKPRa0AfvuBGpROIuZAEvQ4VfTi4
	7MghKH+NkWy4Wpw7SHeT4Sm77vqgVUzc4wjkX46oLuGF64hKb2ix4RyqLCT0/HQ=
X-Gm-Gg: ASbGncublafnqNCAr6uCSfh+jPMbWvgpOyjBzAsXpgp9Ex9iaXONbZwLwnpZ7I55+H7
	UPGi/UMCk5ouHT66oihPlI1+jvmvHtxJ7FuvMeuBXqy3S8q1oJw01F3wtu4fRqDJBuBvk3I7PBx
	OWbCaoC/M+JsaebB5UVFbf4fhXl6u9DBoyClKZnmKT2xNCz0byk5kcehu4za2YcCx3rP8hhunra
	3Nvio9MtX1gWa79TtZ7qwqoGknkwNkrC4nUasYitcfnudR57evUVLx7kcCNA6wFFQi0rgPwaO2o
	kbYKxpWnx+YIo4xFmfL9V9Asc5z1g3iCoGaE4cDqdYAbp1nRDKw=
X-Google-Smtp-Source: AGHT+IF0LG448Co8asu2b12O+qf9qV9IKjw3budk1sW5xJ+8nJP8Lbabi/R9ROBF67ZAdL1nIqOrww==
X-Received: by 2002:a05:6512:1598:b0:545:1d96:d6f7 with SMTP id 2adb3069b0e04-54d6e63528cmr2119221e87.32.1745102188993;
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:12 +0200
Subject: [PATCH v6 25/31] ARM: entry: Create irqentry calls from kernel
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-25-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153630_553531_73A83DB8 
X-CRM114-Status: GOOD (  14.76  )
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

This adds a few calls to C when exceptions enter/exit from
the kernel itself, so these can be used for generic entry.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   | 2 ++
 arch/arm/kernel/entry-armv.S   | 3 +++
 arch/arm/kernel/entry-header.S | 5 +++++
 arch/arm/kernel/entry.c        | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 8b8cc9a1eefbd00dd75d4e344576fc184a413768..a78bc5054b093120e903f08369fb8b1a9feb7f81 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -12,5 +12,7 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long);
 void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
+void irqentry_enter_from_kernel_mode(struct pt_regs *regs);
+void irqentry_exit_to_kernel_mode(struct pt_regs *regs);
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 3cd5a80b47758867d1db6c3971030370bca1551a..f64c4cc8beda6bcd469e6ff1a1f337d52dbbaf9c 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -205,6 +205,9 @@ ENDPROC(__und_invalid)
 	get_thread_info tsk
 	uaccess_entry tsk, r0, r1, r2, \uaccess
 
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_enter_from_kernel_mode
+
 	.if \trace
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 51c7f93c1ded1db56f173c7aaed8094ef011ff5a..49a9c5cf6fd5fbb917f2ada6c0d6cc400b7d3fb3 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -210,6 +210,7 @@
 	.else
 	@ IRQs off again before pulling preserved data off the stack
 	disable_irq_notrace
+
 #ifdef CONFIG_TRACE_IRQFLAGS
 	tst	\rpsr, #PSR_I_BIT
 	bleq	trace_hardirqs_on
@@ -217,6 +218,10 @@
 	blne	trace_hardirqs_off
 #endif
 	.endif
+
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_exit_to_kernel_mode
+
 	uaccess_exit tsk, r0, r1
 
 #ifndef CONFIG_THUMB2_KERNEL
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index d7fdb9df33312dd2a914b59512b701748f33b597..674b5adcec0001b7d075d6936bfb4e318cb7ce74 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -56,3 +56,11 @@ noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
 }
+
+noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
+{
+}

-- 
2.49.0


