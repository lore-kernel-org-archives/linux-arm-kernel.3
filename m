Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609F5E6749A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxgQLkj0Z7hHoCYhNOLJqMr8LObp/tqs2Sovd+PzMtM=; b=mfXWL7BB/SUXgrETBl0pYs5byh
	zglsO1qm2gGUixA6sxou0KoygiGpxLso/X8gBDpGyu6kRrImFEp4/Fy0MyZUBQ+tg2TSI389mIQgM
	Wyu4NH5NewC0xwM+/p6zhdBTJxKUxE7vvDglldbQqCbnJJvq3Ws2jbWLm3RPfpJuB1uGJ6mnvRIrA
	rO2vMqkvEVQzivKkmte3cmPL9WnIC1YBixeko1M2aRS8vkdQffzyKF3jqZ2mjRye3ydo1l5GKPJbM
	QTu7qdjyiu+0IPbNYUi2KmFst9LEWy4317HWTlpRInSoHKkaxtfeYlG8zcVj0WXrjPZIA1BgJmQcf
	D7YMFYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXePA-0000000DghM-3N1b;
	Mon, 22 Dec 2025 11:48:49 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOj-0000000DgT7-29TT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:48:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pxgQLkj0Z7hHoCYhNOLJqMr8LObp/tqs2Sovd+PzMtM=;
	b=HZ4lPPx/CfznsSIiZbI4KOTlDMzG0Ifg+iz13CW2kG+nAG431Zbip88e1rRIb+2HC8IjU50G3
	X1jg48Xhr/ISGsb362U31wZE90tnAehSfEXzVRUxoRBTazwy7jL065zbHffkTLPZ5+l8g570ZYO
	6RARnmpAdtWv/7sJLSZrpXE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dZbsx3jRnzLlTC;
	Mon, 22 Dec 2025 19:45:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DF7A40565;
	Mon, 22 Dec 2025 19:48:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 22 Dec
 2025 19:48:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <kevin.brodsky@arm.com>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v10 02/16] arm64/ptrace: Split report_syscall()
Date: Mon, 22 Dec 2025 19:47:23 +0800
Message-ID: <20251222114737.1334364-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034821_888348_384946BB 
X-CRM114-Status: GOOD (  13.72  )
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

The generic syscall entry code has the form:

| syscall_trace_enter()
| {
|	ptrace_report_syscall_entry()
| }
|
| syscall_exit_work()
| {
|	ptrace_report_syscall_exit()
| }

In preparation for moving arm64 over to the generic entry code, split
report_syscall() to two separate enter and exit functions to align
the structure of the arm64 code with syscall_trace_enter() and
syscall_exit_work() from the generic entry code.

No functional changes.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v8:
- report_syscall_enter() -> report_syscall_entry().
- Add ptrace_save_reg() helper.
---
 arch/arm64/kernel/ptrace.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b9bdd83fbbca..03fe2f8a4d54 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2343,9 +2343,10 @@ enum ptrace_syscall_dir {
 	PTRACE_SYSCALL_EXIT,
 };
 
-static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
+static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
+						     enum ptrace_syscall_dir dir,
+						     int *regno)
 {
-	int regno;
 	unsigned long saved_reg;
 
 	/*
@@ -2364,15 +2365,31 @@ static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
 	 * - Syscall stops behave differently to seccomp and pseudo-step traps
 	 *   (the latter do not nobble any registers).
 	 */
-	regno = (is_compat_task() ? 12 : 7);
-	saved_reg = regs->regs[regno];
-	regs->regs[regno] = dir;
+	*regno = (is_compat_task() ? 12 : 7);
+	saved_reg = regs->regs[*regno];
+	regs->regs[*regno] = dir;
 
-	if (dir == PTRACE_SYSCALL_ENTER) {
-		if (ptrace_report_syscall_entry(regs))
-			forget_syscall(regs);
-		regs->regs[regno] = saved_reg;
-	} else if (!test_thread_flag(TIF_SINGLESTEP)) {
+	return saved_reg;
+}
+
+static void report_syscall_entry(struct pt_regs *regs)
+{
+	unsigned long saved_reg;
+	int regno;
+
+	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
+	if (ptrace_report_syscall_entry(regs))
+		forget_syscall(regs);
+	regs->regs[regno] = saved_reg;
+}
+
+static void report_syscall_exit(struct pt_regs *regs)
+{
+	unsigned long saved_reg;
+	int regno;
+
+	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_EXIT, &regno);
+	if (!test_thread_flag(TIF_SINGLESTEP)) {
 		ptrace_report_syscall_exit(regs, 0);
 		regs->regs[regno] = saved_reg;
 	} else {
@@ -2392,7 +2409,7 @@ int syscall_trace_enter(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		report_syscall(regs, PTRACE_SYSCALL_ENTER);
+		report_syscall_entry(regs);
 		if (flags & _TIF_SYSCALL_EMU)
 			return NO_SYSCALL;
 	}
@@ -2420,7 +2437,7 @@ void syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
 	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
-		report_syscall(regs, PTRACE_SYSCALL_EXIT);
+		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
 }
-- 
2.34.1


