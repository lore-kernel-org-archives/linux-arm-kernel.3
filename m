Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=; b=n9LY9tlOahoWaF2JGeW8h0DmYa
	9FHSFA4tkBAyrIJsU22lklXBPHbyb+RAJYneFK8TAirQF4MfhDY/XNGMEznbIlrs9MfLin36+2Lew
	jzqfIlbPAHBgOnpdan8E26BovfrWE2XrNrzHvxxATlK8FF/z/H4Hx6vern/N30ZBA2YY/XhnsOgND
	HQv3u+BJCqnGrUjPbpd5omdri4P3pFFjbavuxduqlMyK5UR+9GDOIYdqsvs370JCIvf7WPkALNohP
	0MSrrR+3rTDPThf0aQFPl4Yh8aYoWWIBaGw90DiBDZtsXWp4/0X1keKJsfTwabjOTbN6b2YebUTtR
	e9RXhL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsQQ-0000000GsWH-3GAy;
	Tue, 25 Feb 2025 10:44:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrey-0000000Ghme-1SxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5452c29bacfso5856803e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477326; x=1741082126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=;
        b=obPVdw/2BZlFP2FtsbREDcjnAz9IJkaWOhanYqE1yagphIE266fpVVt3UKBTyyDqfm
         a5bxf+S9nYmC7eCwJ536Hs8JqGbT0Fb5SoYdr4k09DUk4rsaUXvraJLj5G3Q/vZ8kxxX
         1OPdn4qD/qqdwaSvXKjKJKHS2WEvdv/jJwKzIVigPArd6YCnbJbwooDtylOni44Q86PO
         IAIXptH76+BUGAO4X81tZdf4rkeEnyVR/A5ursLVkX8zkGcopPsoYR1qoa+Bo+K15mrg
         hH2xPajW4PcGz3czQh/box+bPdQ+MjLuJH5ZVICOXfrGwfLebT4SYVYkugpDwvjezOCF
         zymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477326; x=1741082126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZE98juq0oGv0Xstj1U7TzgmKhYjLwozMlzxeXVPHlA=;
        b=akb5b9f8pdIR6X0Mwxum0KHTtww1iFIZPZ83cT9Kv5cvlSqnGj4iTwX7lNzIJZZsnU
         fS/9x1F7u2Kg9cfPSLcoozkrnW3gGWZJqX8M9kYRqGmoxog8785SLwQjPeZ66jC/niWu
         3Izqn7MZGRNmj9Su0BPr1WDYSj4TJJPbAzx307QHqv6nfgh4HGTK2GOH/zPkD1yTvmQ0
         /0RgD9Ep8vVRd7/5mZvOb2fwB4tppF00SUzmcCVxDlg1mlsnA5BHCiyVODo5v1G3InEB
         fpkyTByPthQ859wsdIo5GWa7fAwBBxfTnAdYgQ+E4I1ghRLxnbxUo+VBdF1a7GjrtX7I
         LPHw==
X-Gm-Message-State: AOJu0YyFqT7LsjL7yIkkUI7o+TBmzKUQUpr076YIdG6JqyHlsb4V1dSv
	CbC1Xi1HQFwqmZ8ozzzdMeitDk0fJhifDRT+GE/oGEHcfV13ds/94d90SW/CeO4=
X-Gm-Gg: ASbGncvXHy6aA5+b4Flkm5HwikmzxiTXCet/65/1b9oMCfkiSbN6gh4sFn3iFEE1qsO
	8yI88poQ3jG2kNDD0qg9wq3imEXeucUetXCetHNl4d+Q9wKJonSQ2EneVb3joW531pp+cOm3QUK
	lIY7PF4rezZlI/fh/MrILYQLpRrK26r/Zp9mvLnM7vjYez/g9Rff5TU6+aVRBjvs6/nSMt8OeIr
	zMe/JHcp/qDmvj8+mIdotcv42vo3q+bT4WJHijc0noSVtXMkIxOMdTDTVXi8eb8n6unxlHYPZzd
	GR3U1DMvDJSsOboNd4zGEhkf3KwpkJyFLsBj
X-Google-Smtp-Source: AGHT+IHv2LyiSeosodUrcS8c6R5xpQiyNyga8e1Qfb63OSq/UTKN+o0/2yMM03TOk0Z2Siw/VpkP2Q==
X-Received: by 2002:a05:6512:3b4:b0:548:d4e0:82bd with SMTP id 2adb3069b0e04-548d4e08399mr321337e87.17.1740477326469;
        Tue, 25 Feb 2025 01:55:26 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:10 +0100
Subject: [PATCH v5 23/31] ARM: entry: Stop exiting syscalls like IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-23-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015528_391208_BF375097 
X-CRM114-Status: GOOD (  15.02  )
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
2.48.1


