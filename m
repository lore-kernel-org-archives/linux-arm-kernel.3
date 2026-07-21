Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4630C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xx5QBUbkJeO+8NVxlyHI+T4QL5u8nrlJRITGeX3ec8o=; b=G1NWsw7Oegdi3PllB55vODBgso
	bOIROipPov6RhQKchrNAeNhhlEVJSZI79BXHy+hE4uiX9nP24Urc2aXOPxlw09C0rnypg980ls8AB
	MRbzavsMIEg9S4VxC8nIqFiOf/3qNNP04AgYMhViIJBDJdnkNqa5XXF7K6mB8FnqE8oE0TkCHvJfO
	d4mAF0plBDa0OYaQHd6SBUUiSh3zszgEsACcR6DGSlQCRGuJc7se93YofWSDX7BYkxrwEmOcJK06F
	ZBSzlPI8mpET/8rJXLRxIx4V6PfTvT691oPdajM3zYhe6tuUxYjbAqCeO1JNyAyfZ2T1wcDBmj1ix
	lddB0BBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hC-00000008me8-366F;
	Tue, 21 Jul 2026 08:19:22 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5gz-00000008mUC-0zKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xx5QBUbkJeO+8NVxlyHI+T4QL5u8nrlJRITGeX3ec8o=;
	b=o4GJv8CTuCkLCE/j6tEGY10AJB1WOLGMRhWicgEaJv7E4qP71sNqT9M7Idp7u1RGqmI9YUjW4
	d4bMEpp5WtmARIV8xRGQTcvBfUhqdV5XtsbZS4aRqVchfqLBPSeW8j/MSHvHQ6NPwbZiHtGbimv
	F/YY0VViUNfs7sVuwLpJqBY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h495v45Zfz1T4Km;
	Tue, 21 Jul 2026 16:09:39 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A5CD9203D1;
	Tue, 21 Jul 2026 16:18:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:18:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <kees@kernel.org>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<thuth@redhat.com>, <peterz@infradead.org>, <mark.rutland@arm.com>,
	<linusw@kernel.org>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <anshuman.khandual@arm.com>, <james.morse@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 01/15] arm64: ptrace: Skip syscall exit reporting for PTRACE_SYSEMU_SINGLESTEP
Date: Tue, 21 Jul 2026 16:18:44 +0800
Message-ID: <20260721081858.1169276-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721081858.1169276-1-ruanjinjie@huawei.com>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011909_599790_ACBFE119 
X-CRM114-Status: GOOD (  13.88  )
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

According to the ptrace man page (Syscall-stops section):

	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
	the tracee enters syscall-enter-stop just prior to entering any
	system call (which will not be executed if the restart was using
	PTRACE_SYSEMU, regardless of any change made to registers at this
	point or how the tracee is restarted after this stop). ...
	If the tracee is continued using any other method (including
	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions
	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP."

When a tracer uses PTRACE_SYSEMU_SINGLESTEP, both _TIF_SYSCALL_EMU
and _TIF_SINGLESTEP are set. Currently, arm64 unconditionally reports
a syscall exit stop whenever _TIF_SINGLESTEP is set, regardless of the
emulation state. This deviates from the documented behavior and breaks
consistency with x86, where PTRACE_SYSEMU_SINGLESTEP does not trigger
a redundant exit stop.

[Changes]
- Introduce report_single_step(): Returns false when _TIF_SYSCALL_EMU
  is set, ensuring emulated syscalls do not trigger a duplicate report.

- Update syscall_exit_work(): Use the new helper instead of directly
  checking _TIF_SINGLESTEP.

[Impact]
- PTRACE_SINGLESTEP: Continues to report exit stops for actual
  instructions.
- PTRACE_SYSEMU: Continues to skip exit stops.
- PTRACE_SYSEMU_SINGLESTEP: Now correctly skips the redundant exit stop,
  aligning arm64 with documentation and the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: ac2081cdc4d9 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 924805e0c8da..4e9c71d477a5 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1


