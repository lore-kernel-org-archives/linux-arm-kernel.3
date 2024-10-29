Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DEED2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4LTFu04v+ewJrCMf1qStO/yKKemj/dlkSOHqQ2h8u0=; b=QLoKd9l3N9iEldnfE5jc3EbIYf
	jgxHxomQk8SEdY1oV7WWLao6LAqyktIBAwk0FntHCLaGRqn9zVSQzDp2QeS3yuZnCM80HutPE1BCY
	GYzdSV7a1xlXh6DMjvfngZBJ3oG8E0XAeyUWOPBCH+4SLOC4gLIc0PV73HBKPd1S1VjwPxLJR8RE0
	ENGJPaUCb/Hx/NNLREPC8OwyF51XWgZpDLSOGfO2t80m1qZTzDL2z9UOr44ekoeyzakjPEDgwcGgg
	HrCYryHX0TnX3QFcOiNb24/d8ct8orbqIfRKXLzCdltrzfFiYyirT3q8PqA/whp2DKMmD/EoJszK0
	RLF1s8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kAU-0000000ECnU-3JfO;
	Tue, 29 Oct 2024 11:13:46 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqE-0000000E7DM-3DcE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:52:51 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f1292a9bso6177866e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199169; x=1730803969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4LTFu04v+ewJrCMf1qStO/yKKemj/dlkSOHqQ2h8u0=;
        b=qPlP35wx81RVgKN5Sz9ibIEeAJDn1dC9DZc98YtPLfwNUEVSIKl6BTjzGMudxFtFT2
         OrTa0O/qvZZ8I5nXzqWaC4/qIgH0Wr5IdqZVuQRs4UeGMkVkc5rKThZ2aoP77dyvdXyt
         mCWWea0pUs/4EwhQjP4iJj8BS3hxDSwS7rbcAXX8Xh+PhEorYhVhyaX5kxXhlF0Ci2D5
         h70o4jly/WMwIlI1NAHThNDgqsb3riV+4gaPEyQyfu29+01exsHYzlJtg9C/ThsRK5Ai
         sLrvmLi/qwg4cy3SPuhymM+ySHsYF1/rfRZSavYGrJDMT7sWq1vNMtqgiEJVd1u5iRP4
         J5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199169; x=1730803969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4LTFu04v+ewJrCMf1qStO/yKKemj/dlkSOHqQ2h8u0=;
        b=uFR3U2BjTaF8NjD7Ra+3LHjPpISyo4Rx0SGKm7tbiijHpd2tSCXVp4HpHmKDL9s+LP
         15pIW+pheskhuPdAy3wyhcjYAx0Pyy+uAXH1dMmeayBkzL4tJQ7EwAglcz4zRg5Ns6ky
         h8A65QOrOVi5cWJ5UJtwwj614vbN7sey6ARjv5t2/Rz85XYwSjEOl+OXLGNCQceb8Xg/
         Pmef2LOQqSj4jOHSy6K1/6vWi40qszxDE4nYpvvoWAMFeeOw37Fo6VwXs4pt9oZ2BNMA
         pItUD9uCOgGsSMKH2DpIQnWRPg6Y1pvuTuVantpbrHe16vlGFP0nVNIvhXjS06GLskqM
         VpDQ==
X-Gm-Message-State: AOJu0Yw1qq4CyGs/+v/g8GIjPGmi4tClWxKyDsIJtYKlWgPVpkoJKC8l
	9MAQigxyyVNpfrZKuZtI4/SA6rzgpxAARpch9IjOFtHlQ7lev94llTMADuHDxUM=
X-Google-Smtp-Source: AGHT+IHzdoIpnm1raIIfmAFKx69MVi8OCs2VC2TJN21ljNCIN9pZ7ToE5AMSUbLLmWlJJIXJdiGYpg==
X-Received: by 2002:ac2:4e06:0:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-53b34a2e4d0mr4368775e87.49.1730199169220;
        Tue, 29 Oct 2024 03:52:49 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:42 +0100
Subject: [PATCH RFC v2 02/28] ARM: ptrace: Split report_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-2-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_035250_845185_A09BE5B2 
X-CRM114-Status: GOOD (  14.40  )
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
index c421a899fc84..07b0daf47441 100644
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
2.46.2


