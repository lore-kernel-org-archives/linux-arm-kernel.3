Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDADCD4841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1a21J/DT6jyDYs1WrnNDIORGxosTg5TGC6mPo0ri0Y=; b=F7MhOLXqWUxGK8Xtl9Ys6HyNu3
	GKsbMVMOLpTRwBoQnJMLgw6dcsjJnhqzM29LeJjwtd7ayX0fbSUogypdOlmPfjxRsWqtv6qfWwAoH
	mwFYNgfrkkF3ALHs0947C1dbtNHL0o5YshgwDj0EhFOqpj6MdEEUoamtLrLK+OWozoUZ1vE1KAkeu
	naIMvyHjdYx9DeB5Ur3+jWbtaLych+jDrW6QeibHmOt63tYycZi5Src4WtRH7ee6fV6BD6oOc6YS/
	LpaJ9gFbJvIOVy5Qm48c8ZRspMUuZQU+TBFnJ8mutX1SdwVbslqAMo/jMtEfwF7dOISHnG8/LQvzH
	PS8I721g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq1-0000000Cszl-1auZ;
	Mon, 11 May 2026 09:22:09 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpr-0000000CstR-2NrT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=d1a21J/DT6jyDYs1WrnNDIORGxosTg5TGC6mPo0ri0Y=;
	b=4WY5Go4K76aUqku54jDBtdEY1X0fqcswrFggzWpZ1L1xLrZsEaJbRc7Yoq2b7kJ83Fi26ZPnO
	nvYJbxryrhZ854pvke+uaHIgZPsocqG6XiQJ59YPo7WwMnMVH9GcvTattrrfihV+n/+dZEN/BCt
	XTiz6/k1yY1VkKvRymaIW8A=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvF07d5z1T4FV;
	Mon, 11 May 2026 17:14:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 84FB740561;
	Mon, 11 May 2026 17:21:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:21:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 03/11] arm64/ptrace: Use syscall_get_nr() helper for syscall_trace_enter()
Date: Mon, 11 May 2026 17:20:55 +0800
Message-ID: <20260511092103.1974980-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022159_953380_A73FB9F4 
X-CRM114-Status: GOOD (  11.16  )
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

Use syscall_get_nr() to get syscall number for syscall_trace_enter().
This aligns arm64's internal tracing logic with the generic
entry framework.

[Changes]
1. Use syscall_get_nr() helper:
   - Replace direct regs->syscallno access with
     syscall_get_nr(current, regs).
   - This helper is functionally equivalent to direct access on arm64.

2. Re-read syscall number after tracepoint:
  - Re-fetch the syscall number after trace_sys_enter() as it may have
    been modified by BPF or ftrace probes, matching generic entry behavior.

[Why this matters]
- Aligns arm64 with the generic entry interface.
- Makes future migration to generic entry framework.
- Properly handles syscall number modifications by tracers.
- Uses standard architecture-independent helpers.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e4d524ccbc7b..8d296a07fbf7 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2410,6 +2410,7 @@ static void report_syscall_exit(struct pt_regs *regs)
 
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
+	long syscall;
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
@@ -2422,13 +2423,23 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (secure_computing() == -1)
 		return NO_SYSCALL;
 
-	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_enter(regs, regs->syscallno);
+	/* Either of the above might have changed the syscall number */
+	syscall = syscall_get_nr(current, regs);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
+	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
+		trace_sys_enter(regs, syscall);
+
+		/*
+		 * Probes or BPF hooks in the tracepoint may have changed the
+		 * system call number as well.
+		 */
+		 syscall = syscall_get_nr(current, regs);
+	}
+
+	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
-	return regs->syscallno;
+	return syscall;
 }
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
-- 
2.34.1


