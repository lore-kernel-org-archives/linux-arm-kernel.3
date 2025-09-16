Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198EACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MqVMJTTo6T38F+TamEic2utqXgvdR5R1B5+ka+htpM=; b=EfsM7WDxAxIuOKL1VckQiEEEbB
	YOAj+3/7v1vYxyFO1AvfhhIIDB9g0yIwra00O4An/KVuOSBtPM4tv3maml83LmskTo/e0ftKIyVbT
	HLcCl75/rbxE20Z+v6s01VTpRIE5iWaAFo1r8jBUKCn/NiWFM60c5MUolsLDxeZA0XmzBl3mneFHq
	JUR8EgWSrvosAdCkSM+ASRe8Iq/nYR7FvVySVAf7+lxRQbMgv+aO7AzXtP/Yx9biPpfg2YlnI9P9o
	3K4jnfDgvtJ8pS5rPokKcJXSsEGNykke3bgDF7jWteCSQ7QmMHz4LKgzbdvI0xYdd3tPd982uhyWt
	oIOIrCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0q-00000007B7A-3cNt;
	Tue, 16 Sep 2025 08:26:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0h-00000007Ayz-3QSX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 08:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1MqVMJTTo6T38F+TamEic2utqXgvdR5R1B5+ka+htpM=; b=ArNmzZzeqAi7QtN61xA5WGk/Bo
	0b6AxcKl7sLmu+hH386DF6Pt89HNfBBvpQASmInBcpgJRaxrKe3uvl+2/bPqLtMqQzuAxZcE2pgnC
	HJbF3iUSxt4fPjOTuZnasIjoui0ONtwl/MiKdpGEL9wuCLFd432qt21Yzvb5Zf7jnM/TwizVeDNEJ
	CbC+wwBniXKbS1AhbCZ0TbB30Q9mfRr+rPisZ/6v6AYYFPK1qgq+EeGFFrqgE7/zXq6a0NwKAe2MJ
	08r04M7TFnsVi6dAiu756D4X8BtK2yBxXd9FGqtIxr66XRbU6Qx5Dqahsn5CT9OlrsCSumK3EGST2
	S9QazaYQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0e-00000007AL7-0PtB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:25:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cQvxF5RyvzRkJk;
	Tue, 16 Sep 2025 16:21:05 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 382651402C4;
	Tue, 16 Sep 2025 16:25:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 16:25:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <charlie@rivosinc.com>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 08/10] entry: Add arch_ptrace_report_syscall_entry/exit()
Date: Tue, 16 Sep 2025 16:26:09 +0800
Message-ID: <20250916082611.2972008-9-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20250916_092557_137036_923002A3 
X-CRM114-Status: GOOD (  10.95  )
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

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
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


