Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxoDZkceuldN2v+AcZoQ7wCap4C6/eLU9DTPkxF/gzU=; b=ux2NwymdLIDS69bsDtQQULd+fY
	2HZ+MML23fkVG72+8BPi/LTj5/4W9WWkdNgLNItd+iEh4x1f0zxaSRssfdteXJ43xikDBe4vz76lf
	XPFSfl3RO+HPhOVANJPMY8bzumqOSoys1ElQ2qzHU5hmgXfCjuVYmAS/r43nU2eqmQhzTHiM07uXG
	Gm1M8c/d/s4cq2KBYtNrh/+vf+ejVISmBKGVJNfEz1uGFETZlxpe9daZaEVlECfUc8c7fnoVByorB
	gdlZyRmFQNnwOtzF+VBxQ4Q3rLlv8Layn15ZPcP1rGC3GD384hANAYRjw5l/pKpKubWLg0bPz54sO
	7uYp4LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV697-00000004Bag-1eOB;
	Tue, 07 Jan 2025 09:45:09 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65a-00000004AKN-1Noo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf8f0ea963so3097266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242888; x=1736847688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxoDZkceuldN2v+AcZoQ7wCap4C6/eLU9DTPkxF/gzU=;
        b=y17qdGivhf9QKhcCiIuC31cm9Pk+MLDJA/lRZM/hibBRWXANKSRUqm4JpcRtYD5MDf
         F/dq8jkBbZoVGhLAwhys/WjDA/vj81kS51Ho4Tn6OLj+V+i5H14yE100KAft2ppvXva6
         RVItp+wZ/0z8TCSlYHELCdf8MRYaFf+BJbontoKLczha2bvaAcfXhz4NJ64tJZpPeCXH
         acjbX71dpnvRXmfvnFdM06io9h0qw0c4k9eklmtX+vLkHZptFyc9DfIv13XmytkI5lKY
         mtOKdyDwR8pMe/ZIkBf5UaoIyp0uIQPqHMyghFF/l5czIXKe07V12en3nk8F5x+XYMha
         p50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242888; x=1736847688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxoDZkceuldN2v+AcZoQ7wCap4C6/eLU9DTPkxF/gzU=;
        b=LP5VXR1pWZ4ROfjwipxONkIhUv8KSxvYSbs12FwdAzCfRt47HssCk5UB62LO/1H9zD
         XwU+Em7U+D5lWAdF2Yrjo5P6lntxfjDdZzLc9kHo0/BgA+keA27eqsVAAG2xqu5lNcq1
         w0huS9vBQQXFiW4lwBTuQ4RcOL5f4T9U3QImujgZ3j9nZfKgbBMiPi+Wn2BLIw00dzQK
         MpvpldlyC68FtcZx6djpiwGHMk7Mp9hfIucO8wj5rIaQd1kVp9IducjGpjkjVdDYduPl
         MN4BFDd7GgSNh/WRQWvFe+T4cCFwzHvhsArOnlTkFG7O9UtS+My6Fpn0XsPpnngd+eu8
         B0Hw==
X-Gm-Message-State: AOJu0Yzs0P5cF7U60fEMkSA2kw8JhCjVNj1juFQmjMbypigpIZ6AsjfK
	U9oE+ljlsTrDuRNU2+Tdlbn/fnzFCH1KD8bW/YY7ZBApXQ7/I6U0+U4HXMU3k3waJfuhVLTIMFE
	msRU=
X-Gm-Gg: ASbGncuP/h5QEU1yri3qYX4BQw7ZKaBcJDJYgua0aKYhOauVJTRnRGhVEYYs7cR/QP4
	Pmtayr41GcGaMBreF2+lK17MJxkgkPW0QPwrL81D8Muo7Gj/KNr1z2ZgaP9i1gNFHyFWnjVeFMQ
	doBHubve6Klno3qyBeZ1DyutwAKpiv47atBDcQjKTRxCXBHzmyGhnHeBMevs0tPJHoxRo32MLFp
	HEKunzMaX47LL7FtY1KTckRYXeQVoxRWYxo3ZkVlOitN9T7ectYPtxxJl3k5pDSXj4=
X-Google-Smtp-Source: AGHT+IEM28Aop4iPJtDsWQ84LuFu7WxnHVAzJRG9etmyple0xNlzoIv/hKHIlrWa557ZtbVDH/zCCw==
X-Received: by 2002:a17:907:7f8e:b0:aa6:9198:75a2 with SMTP id a640c23a62f3a-aac334e51afmr5458619866b.44.1736242888513;
        Tue, 07 Jan 2025 01:41:28 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:28 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:18 +0100
Subject: [PATCH RFC v3 02/30] ARM: ptrace: Split report_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-2-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014130_374781_63D0AF16 
X-CRM114-Status: GOOD (  14.19  )
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
2.47.1


