Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7647CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=; b=t+FJDy6jAgMlTLQ8ms7y6EcQAE
	lGGpT+FYjAiK0aPXli2yjxSH6h0MN+xJh5lDyLrERGIrZFU3Jv268s836r5dh2hDyY9sxkeH/1bBq
	14AXlqcK+Jk/Z/cbEX/OY4aEhp/65cCmrnrWfUDk9Wtn85X0PEUiWLVjUHNMtqexEEjWiSBkU28cg
	tT7uYGHXxZoC98VBVZFSSFGfhh60naBNi2Mz6ZwcVd295IhDkHIdZTA0qTQq/hOYExuOCHAAX/trG
	EH6hNnjUBaV442+FROiA9vX/Ap7rds0D3+q1Nv+LneMdmdV6VrjpioUuZyvol8gDhCaUJfNndvhqP
	CFZlrt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchzt-000000094m9-3Pd2;
	Thu, 25 Jun 2026 11:11:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchzs-000000094lm-0ooY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:11:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c7f0d34de4so931495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385911; x=1782990711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=;
        b=Ds3h600X/u4zTLK3zzGWfRW/jpOoc23X/8DRMbfYN0o7Gq+LWGK0gnWg8a1lNbCbJX
         DJuyzz0nFl6VvTWDhZYPCYKMDJ2exwROf6YnR+OLoKYZvOXprOs8SpaRX2jvtd3uTAGD
         Qf3f/2rfsR4R5jz1FMZvjE/4ONsscRYmfwAz6gKr6KofZbB/yAiE+EhHe0X35jrY+IKA
         zMaqK5lB2Byu0pVsuXKf1hcKDPVyGpFng0JEvCMF6/LF9QbjUlQxCF94mUD6rCiJYMFV
         zFaCqy8cEomN2eSUM5YFLqy9TgxiYkellgU/WtufPfDkHNp60/PUuDmKJI4m/fk0hdMI
         i58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385911; x=1782990711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=;
        b=FbjIsD0zPFCZMIxYr91LrbQuUBhuKITvzM6H0M6srnYs4E4QpQTMJALLj1V9wOLtJ8
         ey7YRBL/iGorUhkS7AlvA1mHgOEk9XvWgDxUQc4gi7pgCxXk+T2QLEdscN5rzYOcGi58
         XVtvfIfF7r3naIahNRBchGOsZE2VfktZCez+KDPodaVCk8OlLWKDwxkZ5TGSEgaf3Y36
         AtwJVSwfj5uFNUxhuwts61LxJjr+eyCtHXgEeMC8yVU5u7bqm1ltacLtgH5k4d1Rsqi6
         p5DevwMP8aMCc9gfMBHE1XPcVqSGnq2nC6kAWGKEm/morkr/UbfWXf4lzsEOV72dtIZf
         hhyw==
X-Forwarded-Encrypted: i=1; AHgh+RoOFqJLExI2Gh8mQlIfWl2Ad0miZN4QOgo6p23/am5feXBJ4KH6K2rmjlNv9OTdbH84cyhauyxOboL/mrosopes@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5NYUuH3jt4BUUCxa2rCJ97fKWQO9Q2MmuqHYA15quG9daTGep
	hstIenYMsIPLXSgFedcXyPwIBVqBBOtRkvXrX972fRmP8b6oUc6GJcxC
X-Gm-Gg: AfdE7cneua6i4GcBIjaHESX46o7hiwtai/dfVrPipkdO3c78BSgBMWcylj7h4eq/8LG
	WZNzJzpExc0RFZybjSJrDXxHMDjj/bALZzgrR38k0kpZ86h+iQCFW6A4zt1UiKfiAzXLBjhQ0p7
	DEZAUeEUcqmAOPXkber1y3C0/vz9jfEEq/WYD5JHeIaZatRUow7T79LMFM4y+UBOfW7pY+8ttux
	/3YyfeFLLdSz6Cco3X5EVYf87HFYRwMdza6ZCvDuLPXL37f/2U8cwXDdfNb/EdaZhX+JpWH5SwV
	N4C6qsJOY4rY5fp0VTDLdG1jaRCufeaY4E9vIpSf/ydPqBZkZmDHiGyQfBi4w4On6ztlWm80ZNg
	NrAZ0D90rZnya+l8WUpavFIMFvwXFMEsdL+yjklv5zlPWxPHIF+o3PGaZJ82FW2GVE3qVQLEXxI
	Nsr7e5xd1oVWDlJti2p5J0Mw==
X-Received: by 2002:a17:902:fc87:b0:2c0:c965:6656 with SMTP id d9443c01a7336-2c7fc729c16mr11686925ad.6.1782385910710;
        Thu, 25 Jun 2026 04:11:50 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5b04be8sm17995485ad.35.2026.06.25.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:11:50 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: sunyiqixm@gmail.com
Cc: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com,
	will@kernel.org
Subject: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after ptrace
Date: Thu, 25 Jun 2026 19:11:39 +0800
Message-ID: <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529065444.1336608-1-sunyiqixm@gmail.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_041152_232283_2A701E63 
X-CRM114-Status: GOOD (  15.62  )
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
Message-ID: <20260625111139._kQMUzn9BetHrpnhD9eFG_6nkmrxZVftip_9Pa1f9Bs@z>

On arm64, seccomp obtains syscall arguments via
syscall_get_arguments(), where arg0 is currently read from
regs->orig_x0. audit_syscall_entry() in syscall_trace_enter() also
takes arg0 from regs->orig_x0. However, the syscall wrapper consumes
live arguments from regs->regs[0..5].

A ptracer can modify x0 on syscall-enter stop before seccomp and audit
run, but cannot update orig_x0 through the native syscall-stop
interface. This can leave seccomp and audit checking stale arg0 while
the syscall executes with updated live x0.

Make both paths read arg0 from regs->regs[0], matching the actual
dispatch arguments and keeping seccomp and audit aligned after ptrace
updates.

Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
Changes in v2:
- Also switch the arm64 audit entry path to use live x0
- Clarify the orig_x0 synchronization comment in syscall_set_arguments()
---
 arch/arm64/include/asm/syscall.h | 7 +++----
 arch/arm64/kernel/ptrace.c       | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..0a44db425522 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[0] = regs->orig_x0;
+	args[0] = regs->regs[0];
 	args[1] = regs->regs[1];
 	args[2] = regs->regs[2];
 	args[3] = regs->regs[3];
@@ -101,9 +101,8 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	regs->regs[5] = args[5];
 
 	/*
-	 * Also copy the first argument into orig_x0
-	 * so that syscall_get_arguments() would return it
-	 * instead of the previous value.
+	 * Keep orig_x0 in sync so syscall_rollback() and compat
+	 * register views see the updated first argument.
 	 */
 	regs->orig_x0 = regs->regs[0];
 }
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..35dd86f9e87a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2426,7 +2426,7 @@ int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
+	audit_syscall_entry(regs->syscallno, regs->regs[0], regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
 	return regs->syscallno;
-- 
2.34.1


