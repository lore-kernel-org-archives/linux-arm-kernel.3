Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C94C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=; b=QoanVifvSAUUrzprJbp/Nu9RPX
	Yi1A1WgFbBdLCWK+h4wkCuhhLWzZL5c6cnlBCy/YrZ+B9S1LAP0ve6C8qv+CTGwBK/eouvGEmC1sX
	u3N3dOCVgSMdVCfVS+D9SuKwlU79YxG0GCFEszeyeYya+9D8g4DEPvPj5Sac7JqjOGO2zx1ds1ALR
	DftU1Bo7GaDJ0R6LFaCpe0Mo8Qu3cnqYVfnd6wLyVUJEKm6007JSwyJQRinDhXwL6W/Bfe8ugSySV
	tAax5/7GAe5JPbU80Raxf+OZF4o+zKSlh1A9kNLSHhRi/gH3ESIrsNi8ieOcgb8t0SAvb07H8yZXg
	7CE7F9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAxL-00000007Bf3-3MpY;
	Wed, 12 Feb 2025 11:31:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApm-000000079cm-3b40
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=; b=im2KWtmsv9MLpYJVp+ScoE1Ser
	IEqVnSMa+j4bBTPq5jEG2ZX+XUKFDAdZxHtBpxeI2XmCRBkNwZb0V72vJVgJOAHd4ibwXnOmppJPd
	Bfw7/dK0NpKoTao9zn0PS9HPjssiZhifqfZ/98tFTVKhEgl0Wf1Eac0PidzEpcM6xC/d3y+cPmseE
	ocyapWG4Fs4xkRvZnq3Al9+UhIzhu6ipNjsF1YWA/AmfcbiOQBCsV89jeqcPBzJ5U3c+pPo4T7Yi8
	OPiGqIvtE/szp2qazSBXCkRwq9UKrZ3tJeQxZ+EKC1C9MbGrPvLpQp/BBUCprTr/FD6LRzZSCE0jc
	N22LPLLw==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApj-00000000nmn-0dmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:13 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30227c56b11so68278681fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359388; x=1739964188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=;
        b=MU+xc6xCewrnvBty1cIJcRN7T2Z7gNgaYGmpkwE+UMbLnICTHPa/oZajEpcUuCcTex
         jT0LVi2jPH3v6IWhVeXV/5I/GVk7A39sYPy/3lOdPqSo5KRqlL4n/1WeAqsf2Qci9i+6
         lmNyjHUOv1BJ3YWpM2njeVp7H5zgyiqo/khrXDiVZxprd+PiQo2I9wID5FfGKqh2sSbY
         iWQNUFhaKxiaSmMEaGv9GxRBmjqO4qt3sEmDEQhDLjJor21vgulXF8Di1MBfpiDqfsUE
         N9RMSUg1xlJLve4J18QKDVnN7qgdF3pM0Y3AsqRbO1o+38gvGyXcCYOFyh8qAI4xwuWL
         WQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359388; x=1739964188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=;
        b=lkhUlW+BV64xpCr8EDpTIzw5DHwCJrE2rEIOEqwM78JDrbiavWGTkdEyUub7Dw/Jx1
         VaWJ6bZ0KqAHiF3jsympSmQBdVzs9qew+JYJIFWiC3cABvU+uXqI15gXXkzLLuiXz3eO
         3E8FDomsLJM3QtUOt6ZCHAQ8kjye9+kK6QDxKpApkmQyz1zQOj+d0LRi3noM7VX9TumC
         1aOX05AAHyTmm21BDOL3ao1rpRSAvJ4qlCgK4QuW72tfi1vp8LlTmvYXPr/lO9tigbDM
         ZHwEEmznykSmyRvDVAkIEWdXpWceAtaW7Kwo0dOQqaMCVKUQifpvubv/+xfKtHwRU/Yx
         1ivA==
X-Gm-Message-State: AOJu0Yw1iCL5hzCd9AufUUXcGkYWG9QbOxQDDCnmZALK2K+9PC8Nupiz
	gYQf91uz6Kfq0deEnM1VhsTjSRzmoxFD5kfyzQnwEZAKDGhtHAlW0p2byGd2wfY=
X-Gm-Gg: ASbGncsp1RHkfXRVzrsosWcCTF0CXG6OK0Et6zH3zlCUHmgr9oLF0A8eZSVPVQQFcud
	8wCO4a7qNiYhn86uxXvev9ExhM2YSRhWcJm6n7UNJEsxq9tvLk4LwZYakWHa5k/aj4tkWrsBYqH
	tM7QroYJI2woWITE6IbWsuKZ+laty3t1u585a8qqXMmhFBUzRGhBztT7XWhn7YhOnYV/W3G8hbR
	xy9eKX0SV8TdD77lFyOsEj7nWQ0qFQdfTxgTe8tBvXLbH90ubTt/INjtHtbR12oaAln5OhbCmoi
	7Mnqk9IIDux5OMKG/UzoMfoR5A==
X-Google-Smtp-Source: AGHT+IF0bN8IrtjGLfeKlbBP9UpoS79dKnT/CxxK+D4rlHCjY6PG5wH4SvZpBeywkQxHf+e/L4Kf6g==
X-Received: by 2002:a05:651c:50a:b0:308:eabd:2991 with SMTP id 38308e7fff4ca-30904fc99ccmr6630861fa.1.1739359387948;
        Wed, 12 Feb 2025 03:23:07 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:22:56 +0100
Subject: [PATCH v4 02/31] ARM: ptrace: Split report_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-2-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_112311_454370_8E1286B1 
X-CRM114-Status: GOOD (  14.23  )
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

The generic entry code requires that report_syscall() be provided
in two parts: report_syscall_enter() and report_syscall_exit()
so split the combined function in two.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/ptrace.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index c421a899fc84c476a672cbfe1c8ece8355d8512d..07b0daf47441f1f76a8af416acc74fa5ed770403 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -827,31 +827,45 @@ enum ptrace_syscall_dir {
 	PTRACE_SYSCALL_EXIT,
 };
 
-static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
+static void report_syscall_enter(struct pt_regs *regs)
 {
 	unsigned long ip;
 
 	/*
 	 * IP is used to denote syscall entry/exit:
-	 * IP = 0 -> entry, =1 -> exit
+	 * IP = 0 -> entry
 	 */
 	ip = regs->ARM_ip;
-	regs->ARM_ip = dir;
+	regs->ARM_ip = PTRACE_SYSCALL_ENTER;
 
-	if (dir == PTRACE_SYSCALL_EXIT)
-		ptrace_report_syscall_exit(regs, 0);
-	else if (ptrace_report_syscall_entry(regs))
+	if (ptrace_report_syscall_entry(regs))
 		current_thread_info()->abi_syscall = -1;
 
 	regs->ARM_ip = ip;
 }
 
+static void report_syscall_exit(struct pt_regs *regs)
+{
+	unsigned long ip;
+
+	/*
+	 * IP is used to denote syscall entry/exit:
+	 * IP = 1 -> exit
+	 */
+	ip = regs->ARM_ip;
+	regs->ARM_ip = PTRACE_SYSCALL_EXIT;
+
+	ptrace_report_syscall_exit(regs, 0);
+
+	regs->ARM_ip = ip;
+}
+
 asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 {
 	int scno;
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall(regs, PTRACE_SYSCALL_ENTER);
+		report_syscall_enter(regs);
 
 	/* Do seccomp after ptrace; syscall may have changed. */
 #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
@@ -892,5 +906,5 @@ asmlinkage void syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, regs_return_value(regs));
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall(regs, PTRACE_SYSCALL_EXIT);
+		report_syscall_exit(regs);
 }

-- 
2.48.1


