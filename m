Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B7108B8EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6ZqUOfelG9M/XsOvAWMh+kpIFBKHrt7506l4y2Pw8k=; b=1APDY9qKFbWZehOC+7Pz5VwICe
	OyAoYCOVMDtHpAjCmBolR3kj8wrJSO8q5uv3SGYlknLmfEG28YQDgwCBK1oacj0sKrygKQeq8Qp1v
	/o+TG3aUXeezLUWJHZbebiXPiwfiQAhypxuIeGLktFzooxyZiZ22BwF1FECcoux6poEXaulI5tBcv
	+MKYopQsJRwuYHoNM1x/TEq8MOe0HnhqKaIEuBjta0y0PyRFfRr+ebCiyjH7tgS4EqkYBp4ndBVDq
	Enp4GQMH/YZN9yINB5tOpq+zDqdFuyGbI3VrC8TRnkTsq9IVXqJ6eHMTVhoKZy1WaKZakdusRadO6
	j6LctNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3B-0000000CaOg-0z6R;
	Fri, 20 Mar 2026 10:25:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2t-0000000CaFp-3foZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=q6ZqUOfelG9M/XsOvAWMh+kpIFBKHrt7506l4y2Pw8k=; b=BddK6353RNyaRxpsDYyBlOJuiY
	fjTec8cnXwlbYOL90A1SsvrQQtAIMA46ZWmxc9KdLW8nCLZmVO1ain3x//Ra4Vc3G5mteZgWkXADp
	FF1PNML4TMrp6o7WJdKMansF3FpDcRFLGjlocRapZZ7JhecqzW2Uyd/zo2qc8qZIk079wYS2Hea1Y
	5birTZ9MFEz6ZKUW/xyCFTFu7kf+2/eGGTLpTJforiZ/kR967IwLwEs64f9vDeUXu7NtWzie9Jnam
	GLoNByOqIQjPu56J1RdxdjHOM9tLVvjQ0MnQb18z30Z9tz6+PaOZq+qheoeJlZeTBDjDIuGFw7pUl
	UN6oNeIQ==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2o-0000000FJkg-1iau
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q6ZqUOfelG9M/XsOvAWMh+kpIFBKHrt7506l4y2Pw8k=;
	b=OT9QxcKIb82lEbq6qoWloqjVZVnUQgpB0cpfrUHQhNHeTv03/a2LD8Z0zzahSAPGjPmPMVNN5
	oTSJ8DWOYpx1wBm0zmMmmstUk8gMuMMffaB68abN5pbcv99W2tL2LJ8aFH0fAzNYdE+PAukqKvL
	CKl4w51JuH2CX73y+lbvCqo=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fcdqW4qLWz1prL3;
	Fri, 20 Mar 2026 18:20:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B157F40363;
	Fri, 20 Mar 2026 18:25:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<ldv@strace.io>, <song@kernel.org>, <thuth@redhat.com>,
	<ryan.roberts@arm.com>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <mathieu.desnoyers@efficios.com>, <mingo@kernel.org>,
	<edumazet@google.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 05/10] arm64: ptrace: Move rseq_syscall() before audit_syscall_exit()
Date: Fri, 20 Mar 2026 18:26:15 +0800
Message-ID: <20260320102620.1336796-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102532_284404_DF0EDB21 
X-CRM114-Status: GOOD (  13.92  )
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

Move the rseq_syscall() check earlier in the syscall exit path to ensure
it operates on the original instruction pointer (regs->pc) before any
potential modification by a tracer.

[Background]
When CONFIG_DEBUG_RSEQ is enabled, rseq_syscall() verifies that a system
call was not executed within an rseq critical section by examining
regs->pc. If a violation is detected, it triggers a SIGSEGV.

[Problem]
Currently, arm64 invokes rseq_syscall() after report_syscall_exit().
However, during report_syscall_exit(), a ptrace tracer can modify the
task's instruction pointer via PTRACE_SETREGS. This leads to an
inconsistency where rseq may analyze a post-trace PC instead of the
actual PC at the time of syscall exit.

[Why this matters]
The rseq check is intended to validate the execution context of the
syscall itself. Analyzing a tracer-modified PC can lead to incorrect
detection or missed violations. Moving the check earlier ensures rseq
sees the authentic state of the task.

[Alignment]
This change aligns arm64 with:
- Generic entry, which calls rseq_syscall() first.
- arm32 implementation, which also performs the check before audit.

[Impact]
There is no functional change to signal delivery; SIGSEGV will still be
processed in arm64_exit_to_user_mode() at the end of the exit path.

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index a908e05749c1..8245d1ae61cf 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2456,6 +2456,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 {
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2463,8 +2465,6 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 
 	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1


