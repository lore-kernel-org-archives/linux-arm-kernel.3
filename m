Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E42AD10386
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NKRkv9PmTPvKvb9WQMf8LT937RMyCVtAwfnRNIoOaE=; b=kmmHs2MLtVFeETCef+vzJBnDeY
	C2dqVimlXwEjJ0g6KmlycTpxnioSjtvf8R+6SmWrpx5LbSoLCiGUwIVPwE77NEB1vH/wFpKG+QQY6
	S+UBt/uZk93dWF/U18Iyl8EPq+xCcfGHNV9WVU2/qwLkrFd10xpPeZ1emVZ9q8PhYccRAhh1dQZCe
	92VTj1P81s77TVeNL16VsR6CyXhk3qkD5N+qZileucMVjk6j9p/1lK7AmZ5yAQ/IuN5PdKAaXeNrH
	qFmVuiaQS4i7LhdvD8LUJob8/80mEhKlvdQz6jRdTxzyCmmGdHwWfM9QMn8qef06UxbQLBjSkU4Xb
	fzfZqJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9k1-0000000EU0p-34mf;
	Wed, 26 Nov 2025 07:15:05 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9jy-0000000ETyf-1oMV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:15:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0NKRkv9PmTPvKvb9WQMf8LT937RMyCVtAwfnRNIoOaE=;
	b=fnKXUrqfrQHYSGVjce0I3drd+b9Pt738FZ8iyAcMTmJrZ8/PGPVTSAN4jH67nyx6Nh/QlHqUp
	rGStC51MfbdrsPxZXK0eJ1cWM2XZOaVPNIpStzSSD9k+3sWldSIBO7KwcIgIGWDmrHOAP9KBI8E
	21yBxwId2DLph4hLtaPTVNA=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dGW4X3scRznTYB;
	Wed, 26 Nov 2025 15:13:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3359B1A0188;
	Wed, 26 Nov 2025 15:14:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 26 Nov
 2025 15:14:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <mark.rutland@arm.com>,
	<efault@gmx.de>, <song@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <pengcan@kylinos.cn>, <dvyukov@google.com>,
	<kmal@cock.li>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 02/12] arm64/ptrace: Split report_syscall()
Date: Wed, 26 Nov 2025 15:14:36 +0800
Message-ID: <20251126071446.3234218-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126071446.3234218-1-ruanjinjie@huawei.com>
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_231502_884640_240C2681 
X-CRM114-Status: GOOD (  13.51  )
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
index 4b001121c72d..abc5baa29cc9 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2317,9 +2317,10 @@ enum ptrace_syscall_dir {
 	PTRACE_SYSCALL_EXIT,
 };
 
-static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
+static inline unsigned long ptrace_save_reg(struct pt_regs *regs,
+					    enum ptrace_syscall_dir dir,
+					    int *regno)
 {
-	int regno;
 	unsigned long saved_reg;
 
 	/*
@@ -2338,15 +2339,31 @@ static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
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
@@ -2366,7 +2383,7 @@ int syscall_trace_enter(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		report_syscall(regs, PTRACE_SYSCALL_ENTER);
+		report_syscall_entry(regs);
 		if (flags & _TIF_SYSCALL_EMU)
 			return NO_SYSCALL;
 	}
@@ -2394,7 +2411,7 @@ void syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
 	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
-		report_syscall(regs, PTRACE_SYSCALL_EXIT);
+		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
 }
-- 
2.34.1


