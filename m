Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA1FC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6B3Gao3CM3hLw8ujO0Qq5QsLTpHvJFrMR8p5PSsAXY=; b=oAx3wvjHzfK67+h4r76xEUww6A
	FhCQpGpuCgzO71I6e2bOlBRzmgv/QXbJzqgf+O7dJrDY0Og1CQFWn2qxHqgMG48NbdqT2O7jJzO0C
	1FaK+HZlU1HzNFxi0we038ibaOAgo1ZpS3Irf+6GJCuG80VWPCX8zgGtTbvvnfdGibwBKXXgDcXic
	0y3Sg0GNnqLqUPPpQ4sjxk8NXFHCzTqoiV5UFArwJ3t/F6m3D+d6dsUlgDOqETDBf3jlns15JWQ4e
	fi1eDcYV/gJS9vtKWJNiokKm4ubzBB9PWBPACbNEdtpV0dPjNRtVVqeSlJ8smzy+79ad1kAa2yphR
	s2uQb4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hD-00000008mep-04rr;
	Tue, 21 Jul 2026 08:19:23 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5h0-00000008mUd-0IZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=B6B3Gao3CM3hLw8ujO0Qq5QsLTpHvJFrMR8p5PSsAXY=;
	b=AdCiGYI8A8KoydTh1/IldScgqbMkAmZbBsJNyxB82Q/JL5wixzDJATHG4in9BaEh+iiMsbUjm
	QBf6fPc/imWDqQ1EHokeN6tBsOp2jPQ9qB3kmdaIl9Xb7WqK59FxqO47SDV3ULDID3SkUrtv/PY
	tezZPJgpjiZXumwzbu8TPtc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h496J4f8pzpStj;
	Tue, 21 Jul 2026 16:10:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BC514203C8;
	Tue, 21 Jul 2026 16:19:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:19:02 +0800
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
Subject: [PATCH v17 05/15] arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
Date: Tue, 21 Jul 2026 16:18:48 +0800
Message-ID: <20260721081858.1169276-6-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260721_011910_486346_E37E6718 
X-CRM114-Status: GOOD (  14.62  )
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
task's instruction pointer via PTRACE_SETREGSET (with NT_PRSTATUS). This
leads to an inconsistency where rseq may analyze a post-trace PC instead
of the actual PC at the time of syscall exit.

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

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4c7dba12629c..a7091333a9e9 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2511,6 +2511,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2519,8 +2521,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1


