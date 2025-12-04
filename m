Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE9D1D897
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0HMWHgEoAP6SGTrdt8dpNJiaYNeesey7SizYjh0MSs=; b=HMM591qaeUkzJ+tr3+ADgsKdNX
	UxmrVFHiDJlv9fRLRw2I/60gtvVfQUFH39BVtt6p3qda9Iex1DDIR6WDjn9ssehF2uA+hSD3YORQw
	n7DrN3c2zIuCUXq3ypUC5vSS5wwHAfXl1RTwa3ocwnO/oLcghgYFEUjfgMDYVHm8nICOCDr3hpwLl
	bpeFYubmEabvhnfTjgJndP+CdWhxXRrbTq7PGetaGoSKWrV3qcUumHe7sRyM+P2oyFkg89qwsP3sz
	swFRcTWuCvm18yEU6WbC/ueqDy22YPxP1Flz6LCCw1GJmjzOQfD58gW3/1YJS2R5esH0iQPPs/xu7
	68vQ/f+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4bH-00000007gWa-2ppk;
	Thu, 04 Dec 2025 08:22:07 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4bA-00000007gJC-0iKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:22:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A0HMWHgEoAP6SGTrdt8dpNJiaYNeesey7SizYjh0MSs=;
	b=gKuFApuJMBTKeEO16t4U6oQqohKqztQrvl9gzLFT9x5n0X0d/5gy49cl7TPc28Iq8GYMNlnHZ
	9ocS7foOrKcxLdXLLmp7mU66MEse1OnfbysbwVehFG8vYIDdz8NeLI5EBPJuNyRI56/1HbAziGE
	/3hvw2BuCUVGXPxfNPpzSe4=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dMS9b6Rq5zKm4c;
	Thu,  4 Dec 2025 16:20:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 47D2E18001B;
	Thu,  4 Dec 2025 16:21:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Dec
 2025 16:21:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <kevin.brodsky@arm.com>,
	<ldv@strace.io>, <mark.rutland@arm.com>, <song@kernel.org>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 12/16] entry: Add arch_ptrace_report_syscall_entry/exit()
Date: Thu, 4 Dec 2025 16:21:19 +0800
Message-ID: <20251204082123.2792067-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204082123.2792067-1-ruanjinjie@huawei.com>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_002200_399870_59019A35 
X-CRM114-Status: GOOD (  11.90  )
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

Differ from generic entry, due to historical reasons, ARM64 need to
save/restore during syscall entry/exit because ARM64 use a scratch
register (ip(r12) on AArch32, x7 on AArch64) to denote syscall entry/exit.

In preparation for moving arm64 over to the generic entry code,
add arch_ptrace_report_syscall_entry/exit() as the default
ptrace_report_syscall_entry/exit() implementation. This allows
arm64 to implement the architecture specific version.

This allows arm64 to implement the architecture specific version.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 kernel/entry/syscall-common.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index 66e6ba7fa80c..27310e611567 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -17,6 +17,25 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 	}
 }
 
+/**
+ * arch_ptrace_report_syscall_entry - Architecture specific
+ *				      ptrace_report_syscall_entry().
+ *
+ * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
+ * Defaults to ptrace_report_syscall_entry.
+ *
+ * The main purpose is to support arch-specific ptrace_report_syscall_entry()
+ * implementation.
+ */
+static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
+
+#ifndef arch_ptrace_report_syscall_entry
+static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
+{
+	return ptrace_report_syscall_entry(regs);
+}
+#endif
+
 long syscall_trace_enter(struct pt_regs *regs, long syscall,
 				unsigned long work)
 {
@@ -34,7 +53,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 
 	/* Handle ptrace */
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
-		ret = ptrace_report_syscall_entry(regs);
+		ret = arch_ptrace_report_syscall_entry(regs);
 		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
 			return -1L;
 	}
@@ -84,6 +103,26 @@ static inline bool report_single_step(unsigned long work)
 	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
 }
 
+/**
+ * arch_ptrace_report_syscall_exit - Architecture specific
+ *				     ptrace_report_syscall_exit.
+ *
+ * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
+ *
+ * The main purpose is to support arch-specific ptrace_report_syscall_exit
+ * implementation.
+ */
+static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
+							    int step);
+
+#ifndef arch_ptrace_report_syscall_exit
+static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
+							    int step)
+{
+	ptrace_report_syscall_exit(regs, step);
+}
+#endif
+
 void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 {
 	bool step;
@@ -108,5 +147,5 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 
 	step = report_single_step(work);
 	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
-		ptrace_report_syscall_exit(regs, step);
+		arch_ptrace_report_syscall_exit(regs, step);
 }
-- 
2.34.1


