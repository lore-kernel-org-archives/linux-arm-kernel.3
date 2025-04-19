Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B54C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTVDaSvJ4L704RA6vZ0/T+s/rQlTI98VbS11Ma+Uwx0=; b=mnRsXGGZ47KmngahGVO6c6rApq
	mYpOReEdNYnSIethUIz5XmKCFm5qt6qtYy7tOC8Fide4H1DkzME2YLMi9hBtU88oW2MPvXEMQ6u8N
	WDAHBf04AMQcA2JfuaNiLraQlAhuOL2ucvBJxg3JOjRJqur9u1fRcqIM04eUzA5XGOfGOtMpuDT2j
	u5aEqP242u4b0s72U1KO9DCvIeAdOUQmf4MKUjRKhBc0ZaRCe5hWrg4c1Q2yDAwEnYHwnVB+UtmPN
	5bub8HE1MWVBEEpUasnRZW+TdM8Gcsg0KuZfZAnruSy1EEbUEgPQSpGzd0ydmgBzF6478CpAec6Wz
	V9hl/PoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HVl-00000001x0w-2264;
	Sat, 19 Apr 2025 23:22:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnU-00000001sso-2Ra4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:29 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54d42884842so3879023e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102187; x=1745706987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTVDaSvJ4L704RA6vZ0/T+s/rQlTI98VbS11Ma+Uwx0=;
        b=Q4dfBS+GSkXu0F6WPO7ctzSiSJVufvC7LvoAU6yeH0O6EYq8nng/LIAfoebXfIQunF
         WePhsyN8TO7oEcDySYtt5pJ0mzKc89l17Ww0smIVA/kCLy/4UHIu/5Jw0D6yMYj98ntg
         c3FCXIkT1Mj31So0dApwjFL6cJrkP2msq3zJ5coc0MSi7VkV48rGSLajPoDo/O4sWR5h
         E947z/mL3nUbX/pULtYfKa6R5yoDU2TcyVtuyojcTxTZ6SHbbAZxEYgry2h6faO1AnrS
         ogjfnA0cOuJU+nv2CBZuq7Vr7vnoZMnVUlOHz+13oypNmj9q7BAPaPHPaxjXAx1QR37p
         bP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102187; x=1745706987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVDaSvJ4L704RA6vZ0/T+s/rQlTI98VbS11Ma+Uwx0=;
        b=QanoD6b9h6VHla/49gVLdu07gn8cL3DmLWgXow8uPXZm5uBXQ5cgMJYvbOJCpS6N0e
         B8FSltg0PdPWIrXI1MaZLoM+mLBPGvSq/PZTgWs8qXKkMnBm81uA6/WDrAFrZvTuV7yE
         AD0WFaBp+zrQQd302jxbjuTr/jXZJPYxoxKQ/Tzz+TfKkeEqLhsHKI++pb3V1p+nigTN
         bTqjD16CVmsHb34fpsKjPIGd1tIdKIu18NyxuBM2gwlUWgql7FBweIjYK7mTSn/tXV4e
         uRiSXRnI9Ba0ssg2XDMzgyL/2gsyNnpu/N+aoQvgCwPzkoM+ZhMD3iepglEvjyfsFLU/
         Yf6g==
X-Gm-Message-State: AOJu0YyGibb23krPi9ZyZmoJZ5B3K5wqmyehGCrZXTyZ+wOcjxP+7QN7
	LxjSIzRDbiqvluiuVWVCi7BiFJl/vnWbvQz1NGJwU7QOPBtHy0TuQWJ2Q1CjgcM=
X-Gm-Gg: ASbGnctzf3/iXQqvuY6WWp12EF2PfA015PzDn8+R4Rf9tFPVtI55FTcQ6jfniovkYUd
	28OEeN4So0IdaFJK2ZHlXhiO/uZDp/h1fIzk4vHild0yekg+FGWoByA3SGqQ3dShbBwcxpgMzim
	kZEt+neQvCu5LCgvDx+K++7UJNc8msr0XywSA5COO40H+oujCQ1bpOe48I0wJZoht/wZ8cuhvVv
	VH3Oy8yhwmHzLb5ZSm8cqmycWwpeUTUgo+0fTHPCGWznaw9xYmGJcUx1P/4oH4TQs2IkdPL1hR/
	KzGseZHEemzywbeTuHkeuySeIh4gOAtJNTCgErOgfPwIs6vVPtQ=
X-Google-Smtp-Source: AGHT+IFSClu7d5x/EKBK2U9rNLPTV0CRIKMtMGD/M+3v4fEe5EoA6+CF5GbxPDsD14QroLyqyRmiZg==
X-Received: by 2002:a05:6512:3d0e:b0:549:5989:bb89 with SMTP id 2adb3069b0e04-54d6e65911dmr1973786e87.35.1745102187044;
        Sat, 19 Apr 2025 15:36:27 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:10 +0200
Subject: [PATCH v6 23/31] ARM: entry: Stop exiting syscalls like IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-23-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153628_633661_D14A6C42 
X-CRM114-Status: GOOD (  15.66  )
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

The syscalls are issued as software interrupts, and to this point
they were sharing code with the other exception handlers, but
this does not work with generic entry.

Make syscall_exit_to_user_mode do what irqentry_exit_to_user_mode
does at it's tail, and drop the invocations of
irqentry_exit_to_user_mode from the syscall path so that these
are now exception-exclusive.

Split ret_to_user and ret_to_user_from_irq into two distinct
execution paths.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 ++++++++++++--
 arch/arm/kernel/entry.c        |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 5385574c4339714f3d8b5ab6894f27466b89f932..e2ac6d3216b6828d948d60c424ff95ccdad12331 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,7 +42,6 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -62,6 +61,18 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
+	ldr	r1, [tsk, #TI_FLAGS]
+	movs	r1, r1, lsl #16
+	beq	1f
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
+1:
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ENDPROC(ret_to_user)
+
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
@@ -76,7 +87,6 @@ no_work_pending:
 #endif
 	restore_user_regs
 ENDPROC(ret_to_user_from_irq)
-ENDPROC(ret_to_user)
 
 /*
  * This is how we return from a fork.
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 0e3960844b94b14325eb00ce7dd791b36c43ac3c..88a7a699306ab61153d57333c26266b9161f5466 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -30,6 +30,10 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 	local_irq_disable();
 	if (has_syscall_work(flags))
 		do_work_pending(regs, flags);
+
+	trace_hardirqs_on();
+	/* This context tracking call has inverse naming */
+	user_enter_callable();
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.49.0


