Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=; b=4g/uBNABkCEhlEskldOyI+P61n
	uJDcWHbU+1+rFEfrbebnZk8WolDC5PeodR86EtOMACgQNGP6XyjDB3qlnVT5uJAxYFg87R89I3/2g
	iA/ymaVx7hy7X1tTZL50hCoSR33MOwebyvZ7Y2fqUyhU9ovhkGaBh3NmmvprT0B1th3saqWNd+hL2
	myAmN6CKRFEEwM0bYjTjvz0Tw3e9PRE3RuoWe/WQvfw69q6VACPDdRCB+wM9zFlQP8xLMsA0wfIwF
	Ua2BZJE1eEWL5XPDUrCk4Pk6Ul6CAkCy/hzApTPCXuTzPexIbHXJNG3hdOsBNB6hkG2A/jzG+Um8H
	vOuTm8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmruS-0000000Glgo-2WPE;
	Tue, 25 Feb 2025 10:11:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreZ-0000000Ghav-2XgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:04 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5452e6f2999so5746973e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477302; x=1741082102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=;
        b=Kop6qwSZvdVkroZ8GZOYV5kKwR5LfxmdyykF4XMei3TmNBDdei74kYKwp74rUFZNCK
         twfH3TDIiUqyBM4zQasbxyVjGL8Qj4UTcb8z+rtbh2gKo2lVqla4LnjsQXGAHjhHoQoj
         gR0pQ+1Swm/fyOXsB0VxXa6xVTFN7MR6w9zt/mnchmMR6Ih3H+bC/JBmKHb/cCI+KZcI
         lA7q/TkflHsMQ2m8+cPUKoRcAU8qzUG/uHFanmCE2fyatjb4xMHHkZCo1zGKGHbtWXHC
         rd9hJIoynqGqyJe2XCBT8y8tIS+nR3OeR++rhnT/VzSJoBJg24r8pp8wObsts20SP/J+
         stEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477302; x=1741082102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeNYI4Yc1OrceUVt/GJDCyO7YwVHZ9lpFFe5ekDh0x0=;
        b=VU2oaacm8ODIJ5yC1o0mc58tmv5cHGFAEiPKy0Njhq8913rJH/nnLlFv8/xgNZlgXc
         onENGh61K5N4tpJFhxgYZIoo6A5YVMB5D489zpJyhj0ZTe+UadswedAtwQgd+yvVcZqg
         Cnj2BJoPO05BqnPeqnawIXgCqGdSBe9StVdTL6eRHuBxfXu8F7Zmh41LtI/lfoDozqlJ
         CEyBF9o6q5jABtyI6eCBQO9xM5a7lkHAkVCeDDwp4WqmiXI2q7cw58aZxRpp53Fpknf4
         VsqgoPZ74gPHRbtHYG6IWubE0HVTbBnEXoHUxQ0yqqEqMPuyvTtiBo2IvJJ6CgjuENEM
         FNHg==
X-Gm-Message-State: AOJu0Yxgg3rH1EDHytHqVD63OnWew3fPlUn4jbAAcfk9pd1JTzroHw37
	LghKiZuq1DCF4j89opqPa/7wv/D4zVPxWNf+RH3VoX4Fao68fDjmPqYOBxTYVC8=
X-Gm-Gg: ASbGncsv4lKIdV2No35A2ku00FVuXeKutNaOFgj3j1MNLymIQke3P6/Du6glZrcci3m
	qYjmt8Aj2fc0wbUx7fQT6SVJkUdxg6sfhrVGaHK125EsJlsR3Z3yMZV2OOIzed0z6Q+hEv/EcZ/
	VJxQb0G633sNLvTGspRVupIs3k8AggNXZzVcKR/GKYP3cjiwijoHuK43CgCNBbcG+/BV2w1CfwN
	ofO/WaR/ogsnjzEsPkq7PU743MODGJu0Z8+DkcoiKYkPxvaezdl8eey10u8J4eyA9F7OWgNDJJW
	C6bzxIZeox9EkpcWq21ZqPNLKuTh8NZLWP9s
X-Google-Smtp-Source: AGHT+IGq0OxvT7/cZlFfZbbX0H/MkEPa6FnOUXsHEgn9uErHuYCGdCabGyfw1Gq2rovjVGQpSBjALQ==
X-Received: by 2002:a05:6512:130b:b0:545:3032:91fd with SMTP id 2adb3069b0e04-548510cf943mr985679e87.16.1740477301678;
        Tue, 25 Feb 2025 01:55:01 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:49 +0100
Subject: [PATCH v5 02/31] ARM: ptrace: Split report_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-2-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015503_656566_4B417441 
X-CRM114-Status: GOOD (  14.26  )
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


