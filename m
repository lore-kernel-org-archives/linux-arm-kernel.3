Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC0EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA5CIdQ0lbXH4n0pAtvx2LNmm2vuWTvTqeYMmiBEiDg=; b=QEXC2SERJTk5Q71KzM94FZ69C1
	wLBEhSMJM8Il/Lvj6SKIZ4SmgKn51ejDLRGuNWYooVd4c31liqdNgaVZorsHL4dMzZCKDJ49F7yn3
	iUdx6NeAaK1RQrQuzUUB7l1rJJnPL7Q8aYOkYxJQMxtbpCRllFsVwAOg0bf7Sjyd/0uUxKYv8FsKx
	AkkisEQxSzLqgV3eNlNV2Pc3qBZmAnz8u9OP1zLAuFyD5qCRG8CcKVWUZ2YwRjYCvClgu/DvkeMTC
	O0GdU/zMB7NNVi6EWHwZPlREvmT3w8zWJh83nzSaHOrExqHePeikilX9EuUcQWvBUrnQjUGrdGeCx
	KG6pZcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Zj-00000004HoM-31h8;
	Tue, 07 Jan 2025 10:12:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV664-00000004AaD-30h2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so10625462a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242919; x=1736847719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA5CIdQ0lbXH4n0pAtvx2LNmm2vuWTvTqeYMmiBEiDg=;
        b=CfZPghWdRszWcNikseFar2d63ja4wsvUk8S42VJ6FEmd4aCAmU4cINrcuLzb0lkL+f
         u9qie0Pp6BRFksTHwxQbvH4clWFGbKCA0n/9wRH1zuViXXsCb2If+xuG48n3jhVlSlsO
         GhNBsmogPGeKlZFsW+4E121ZlZDFS9jZiezT1lWGeSi/eAbSfSK5DKM7fjkCGpUcZj4Q
         iFEZvgEZa4mxXv2O/L1eTNTfq4n7TxqxLPyc90KV7rQQxUt0YbKltlDGzTUInrvBUVzq
         T7nXVydnyDKWjDWEyYwmaWl2uBdkMF1f0+irSUrq1u4Sz0iXj5ZogA+3gpmCxXf3NSiB
         T5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242919; x=1736847719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GA5CIdQ0lbXH4n0pAtvx2LNmm2vuWTvTqeYMmiBEiDg=;
        b=JQ6x4ENnsIwUplDYtZPAEA/yyvyfqQz73bDaETh8vvN+Jj+obCceJax/IPUy/lmxnh
         vrDR+Baxykvgfq9E4EwC+hMxkZyGtnwy2YqrfJwpC8sjxTyAx9aTSSngYQQSMy3I8roB
         pHHtId5yMPW6EMtKfNBReXEJerKBaVdt5/h8bM16ZBQ4+3JMNgkfsSmzAL0v8ZtsU1kD
         8mGY0dgOFjC6lCQpvAuyucWZBoogbbbHoTspQ0yapIXe4Aep1C1O0Z7eNJIO6x5t1hmz
         jzN3AUd6bOopfZOF+0WvGod9OiK1GP5V7MLtGFNxNz/vL+3sKc0xq9+wOD8Oe46/vNIn
         v5aw==
X-Gm-Message-State: AOJu0YwQzbzFuHZF7G4wU3wlGgY2937veyxzU1oGpwOUx056M57brnD4
	Qh8js4Y9hqn+wbqapedUAQqqnL7/FoAZQADRylOjKouuuF7S1Nlw3qry5kEF84I=
X-Gm-Gg: ASbGncsYEMQd87FWZVAcTghtb92z+FnnNSUzpIqAAyq4bn4UgXyhdLOuW0KKwFDX4eb
	tUeOP7ZEwHksHFUM/Xju+LONnm9Ih4XO6XAMAacLJ/i3oCM/wrLuZzowjPVKs2JeAAq6Mlu+xmX
	tOEQfJ5pmygp4/B/4RjdSMPvAW0dD9fpOCptkmPkYOGSwnmSuJB9+loEMnv3ng8w9TAW+FCchia
	+pcJNUpJaHSg4ACLxh3uTG7tMReqo4JC+Mv6jFOfeC6/zOBkZRUe65fRe2G4btsYUY=
X-Google-Smtp-Source: AGHT+IHjNcm3SJgRDE9sTXW5p/Q+t40ZGJWcXhVcRyYilmutwpMo3+fZgXXoT+2r7xFg0aaeFgkyQA==
X-Received: by 2002:a17:907:72ce:b0:aa6:25c6:d94f with SMTP id a640c23a62f3a-aac2ba3f469mr5899210166b.31.1736242919089;
        Tue, 07 Jan 2025 01:41:59 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:58 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:41 +0100
Subject: [PATCH RFC v3 25/30] ARM: entry: Create irqentry calls from kernel
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-25-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014200_764996_756599E0 
X-CRM114-Status: GOOD (  14.07  )
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
2.47.1


