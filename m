Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C7AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa+6PSlNL4t/65YhlpxeyjZxsZsxKfkQGqf+kwb8SlM=; b=4+kjw2IllRrqeqOyNCFHA7sM4A
	eh9rQ0VHYP7f6fRZSPffCXX9E2VLQFABSwK9mga4vK4uD29soOcxLBdwdmHU3aKP731jZlAGrbdc0
	ye3NQLGVQKwJyuENGtDGmQjbH0tpa1oSLfP84jr3As4Qx+q5X9eRe0wWyJrt6srGvqIPCTjM92dVi
	Xg12aveFn5hFkJ+xLFOx4OpDka6Fnj09nx3240VVQ7xTwwtmrFjhOnopGTwxIFMRrZp0Lxd/eOLAu
	rzYNcE6RiHuuKKl0RttK5pXB6Iz6vExtFkc+dZUugyrDLSJXTHMBaBBdRE23IibgkX+JGUHPGlBu0
	P2lFwm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gsf-00000001u8l-3QO4;
	Sat, 19 Apr 2025 22:41:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn2-00000001sgE-3xWO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2761741e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102159; x=1745706959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xa+6PSlNL4t/65YhlpxeyjZxsZsxKfkQGqf+kwb8SlM=;
        b=onxIR5mWP99rwpj7+kRPtgx/sz2utrLQ/irjZpA5lvARAvNyin4hq1FrFC8kBf9YjF
         YFZ9+hT2XVEkht/OPnqZVy3JBCc6ccNC2nqwqj+eXFcCSegdKFatd51xNqUjwtiJmUht
         1zicTcwVww+OVWU0zOvIavm2eQWc2jBvGk1IL/gVmm+rvjbJPSAsTn/Rersv1K5uuQGB
         Bx6G1agC86L7NmDacxkbi7ZttlCRF9BRvO5SdPkm2XMXwLD7GwzDrS/Q75XS17rDp3aJ
         qNLpJWihL+CAvczsE9iNGpybDOx5mNFnbRwWe/HNMCLrrGUk68YF7WvQxkCJe1lNhNtD
         vKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102159; x=1745706959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa+6PSlNL4t/65YhlpxeyjZxsZsxKfkQGqf+kwb8SlM=;
        b=wVA0tXHtYVJZLWYs/WCn15Lfc1nQGAzcA4hALJ1cJbLDqkr3KhQPXmuET8LuBXm3k8
         4AJZ4PSjTp5dYRrsdk31GIl/KN+M9pEU8A9hYNAfAs7jHskHn9Qxi4G5JijeyyLSOdHC
         O/nyQzA9oOna4d23G/Aob346lCBVT84ToyKfCUKAJTeisGrfa6E+jvqecSbMvtkcOUR4
         CinS30msltjSEUpm8bL7k8IIEGSadoEHn4VAscHYJo8uGE8x2snxtPOhpt1OxdL3ZGYX
         Wiz+R4cTTgQLTY2QiiJNhPDPBYTLqDQpxj6c5/Atuk05o/3IfwiOBR0eqmOZvp+xX8E9
         Tv3g==
X-Gm-Message-State: AOJu0Yx224JIIOyxGnH1L7EjxEKc9nwy/VZq3XmOpSoSmXVkwjKDjAMZ
	uNprbHSvoqG3qr7YUMYMZ/CkqP2yuQZ00Ha479B2v9zozweecDglu3vkHROmBOI=
X-Gm-Gg: ASbGncu2FsV6hw0NgLpdR0KA1gucnaSi5XsrkI+0tZfV00soskDpgpV0erRn+HevFqd
	Kw92KhCgvw3PtH400pzDJHQ6xROZWFwriORJ+W9TsuyAOPnTPV5iMQEz/LKgk4byKYQG+YvxYzj
	09ZZdVXzNNvCaZsBMrJVnxcYaY3UW34v2zNzhhXM4hLNFGHJ3CmqhwV6VAdcCYQYmx1QDHswHKe
	YIa/LYGjBs/++P5gvsElvEhIq31yMH/JlKBP5ZH+KcwZBSaV/KsBtchTwj1+J5R3OUDsCiJWf9I
	y04MVzpK2mfvYCta3VCimZbXAMrEdjCmzpy0Bxaj8TO9sHEuH2A=
X-Google-Smtp-Source: AGHT+IFxQdlR3XbwN3+K/S07VkZdxfUuHrjaKg+XbMlUjDGQX29Og6QcKArMltGpAQ4oZl3D4gBdWQ==
X-Received: by 2002:a05:6512:b06:b0:549:5769:6ae3 with SMTP id 2adb3069b0e04-54d6e61c9c7mr2111296e87.6.1745102159063;
        Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:49 +0200
Subject: [PATCH v6 02/31] ARM: ptrace: Split report_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-2-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153600_990590_CA825DD3 
X-CRM114-Status: GOOD (  15.08  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


