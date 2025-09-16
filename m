Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76929CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQJChy4CSig7WwWYt7pGFEdPu8K8NX2y5MQxbd1imwo=; b=20hyoXLTzFnmCRpwgUyeWB2B7e
	QXxq+nZZvZvdMYatIl8u6AEjWLZuZZOi9NqdsuQS6rneKjL3n4QtjgRyTwYFJLktGPfNzNsojQcO+
	K/6ieXQRYeLKERWGNr10WleeS+qSGqYOVQb2FOI1j+StV9X39rDo2d2TuJUgr2WChHIWR68CqhyGz
	fGAfQD28UOBIvH+bdFcezFRodbTew9O5716X6shwTqiuaaseEEiCp6yt9rJi6I6gknGBWr0e35Oob
	VFv031CBp/qXu3is+cX88Ft+vladFdIVq7Ip36ewoi5mPglkeT5XCTMRAaSS27LDPLcZOg+rvr0w2
	9iyZWcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0p-00000007B5Q-2oka;
	Tue, 16 Sep 2025 08:26:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0R-00000007Ajs-3yEr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:25:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cQw2D1yMHz14MXG;
	Tue, 16 Sep 2025 16:25:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 35F03180087;
	Tue, 16 Sep 2025 16:25:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 16:25:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <charlie@rivosinc.com>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 05/10] arm64/ptrace: Handle ptrace_report_syscall_entry() error
Date: Tue, 16 Sep 2025 16:26:06 +0800
Message-ID: <20250916082611.2972008-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916082611.2972008-1-ruanjinjie@huawei.com>
References: <20250916082611.2972008-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_012544_147409_73CDE199 
X-CRM114-Status: GOOD (  13.12  )
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

The generic entry handle error of ptrace_report_syscall_entry(), but
arm64 not.

As the comment said, the calling arch code should abort the system
call and must prevent normal entry so no system call is
made if ptrace_report_syscall_entry() return nonzero.

In preparation for moving arm64 over to the generic entry code,
return early if ptrace_report_syscall_entry() encounters an error.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 95984bbf53db..707951ad5d24 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2317,10 +2317,10 @@ enum ptrace_syscall_dir {
 	PTRACE_SYSCALL_EXIT,
 };
 
-static void report_syscall_enter(struct pt_regs *regs)
+static int report_syscall_enter(struct pt_regs *regs)
 {
-	int regno;
 	unsigned long saved_reg;
+	int regno, ret;
 
 	/*
 	 * We have some ABI weirdness here in the way that we handle syscall
@@ -2342,9 +2342,13 @@ static void report_syscall_enter(struct pt_regs *regs)
 	saved_reg = regs->regs[regno];
 	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
 
-	if (ptrace_report_syscall_entry(regs))
+	ret = ptrace_report_syscall_entry(regs);
+	if (ret)
 		forget_syscall(regs);
+
 	regs->regs[regno] = saved_reg;
+
+	return ret;
 }
 
 static void report_syscall_exit(struct pt_regs *regs)
@@ -2374,9 +2378,11 @@ static void report_syscall_exit(struct pt_regs *regs)
 
 int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
 {
+	int ret;
+
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		report_syscall_enter(regs);
-		if (flags & _TIF_SYSCALL_EMU)
+		ret = report_syscall_enter(regs);
+		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
 	}
 
-- 
2.34.1


