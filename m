Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED2DCEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQJChy4CSig7WwWYt7pGFEdPu8K8NX2y5MQxbd1imwo=; b=GYBRgCXnXtFCucd8Tny0ok5jTb
	1NMjGY1dWgYkIaEbl8sHqFZ1IE/bMNE2lVwYvcJ6ck2YRmLV4UGccbOYwVB448Xuk7lDgvM9XHshn
	Yht6rrZO77/uG2p1gF6JcdOerT/0inPg4R35eC+yLtl9HQtkZFExwlStTd6x1oogOl2X1evNjiu88
	74k9/HSKAq9TUX/UcR00Uy91DCOLsP+4ZXxCILhkHjJAIUQDJn9V/M5KgIawH6mRLhzzRKElSOj5F
	9sGwnZfvOssDlbFwC8q2zCvNsWRJBxJwkZb/Q+VQGpnQW0qvXkyGMz7RlfhBrGCuPvAdYR3jqIubf
	p7Xw8BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzKI-0000000GBBT-3IRn;
	Mon, 17 Nov 2025 13:31:26 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzK7-0000000GB3a-1o0L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:31:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kQJChy4CSig7WwWYt7pGFEdPu8K8NX2y5MQxbd1imwo=;
	b=XCdll9/WfiN+9U5PmTpPKoAREVR7KqYPR4vpBiFW1qdQOrehyTN+qOdp6g4vWfpvcmKX4Ek1o
	ZaxJoqJiZOKKoW/7JzAhVQ/sWCNiZDkXuW++bpMiXhOo2Nrn6NWbHi9iKn+3lhHdK12FtfG96OU
	FbilBiHRQZ6cuST6Q8DJ/bk=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d97rT4yJXz1cyqF;
	Mon, 17 Nov 2025 21:29:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AB31B1A0188;
	Mon, 17 Nov 2025 21:31:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Nov
 2025 21:31:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <ldv@strace.io>, <macro@orcam.me.uk>,
	<deller@gmx.de>, <mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<pengcan@kylinos.cn>, <dvyukov@google.com>, <kmal@cock.li>,
	<lihongbo22@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 05/11] arm64/ptrace: Handle ptrace_report_syscall_entry() error
Date: Mon, 17 Nov 2025 21:30:42 +0800
Message-ID: <20251117133048.53182-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117133048.53182-1-ruanjinjie@huawei.com>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_053115_788710_1F569CBE 
X-CRM114-Status: GOOD (  12.49  )
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


