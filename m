Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BB4108B8ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyUAjH5aWCCCGKq0gjvpfn/bS7b3FTk3IuM2tMQEVWM=; b=H7RpVB5oHJwFQj/fHmWu8wpFUC
	MccO1YWufEiW5YZFKVfUvMomSXs7801KrVG6IP9B6nrJJEgHyBy2E3MSthgErnaCYgzVhulafrAub
	jinFVNxlvy94yKTdo9v/XlejnQFo6r7vsWfMEVcXGTerK5KIfFzGiYbix+DSYt8iMpNZuTFQ7LRrs
	M75rXTk7LbA6etXyrPc0HFLkRY1x3KY7xqaR5AYhvndKRSa8G57KsOHkYtwTcafV/6G11W4OcA8To
	dLwk0DlCvZzQsqKglRcfxrNk31nM7Dx4RyN1U+SpkAFHpyyGK+npNG5/7D3hDEimzNepmZjN653Zk
	0wKYpe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3B-0000000CaP1-2HiB;
	Fri, 20 Mar 2026 10:25:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2v-0000000CaHM-23Uh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=UyUAjH5aWCCCGKq0gjvpfn/bS7b3FTk3IuM2tMQEVWM=; b=GfDHv8gCbvQKz/4h641H7Gkss/
	M5165MOnNyO9LEgyg4AMt8tCGvidLYIdmvab/lTBJDxeHy9g4/S4Mdap3aMuYv90t5ccO22HIJ0iD
	KkGYQ7E5hiug+Oyg9e704bAelOs2h2rQNrk9rQ4wRFzm9OFwYKMteLe87moiODySUi5o5IPZ7c1Zy
	buXWLCyOD49nizvbmaAFbuV+ldKqtcdRw8gPndwI+l+E1N7us/lYsYNseksgK+ZZiD3+unByyF2OM
	SflyXxZ1dUG7UzP9rv/8xZyeWkXDKA3Y44y93sEcVDjgAjmdXrofZzeG/1L/Rm+ufpFzDQPQTl7t2
	K1JgXn2A==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2q-0000000FJlj-3HW7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UyUAjH5aWCCCGKq0gjvpfn/bS7b3FTk3IuM2tMQEVWM=;
	b=DpZ8NIt+MVM3bhRbGAoCCo43vX/T4rBVIbDp8XhQhnPwOU/C6l3cSrXuyBmscWHieKrIuMCD+
	S8lMKraU8sP/70H9UFvlMFNCeO6lWZ3BD64iuN4juabMVXu3njGxUozXGQog8puGmHIBldMkad1
	sCsVUHBLyZyrWMzBM/mx+mY=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fcdqc0S3vzRhR3;
	Fri, 20 Mar 2026 18:20:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 116D24056B;
	Fri, 20 Mar 2026 18:25:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:26 +0800
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
Subject: [PATCH v14 06/10] arm64: syscall: Introduce syscall_exit_to_user_mode_work()
Date: Fri, 20 Mar 2026 18:26:16 +0800
Message-ID: <20260320102620.1336796-7-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260320_102533_511758_D2A4C1D1 
X-CRM114-Status: GOOD (  16.46  )
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

Refactor the system call exit path to align with the generic entry
framework. This consolidates thread flag checking, rseq handling, and
syscall tracing into a structure that mirrors the generic
syscall_exit_to_user_mode_work() implementation.

[Rationale]
The generic entry code employs a hierarchical approach for
syscall exit work:

1. syscall_exit_to_user_mode_work(): The entry point that handles
   rseq and checks if further exit work (tracing/audit) is required.

2. syscall_exit_work(): Performs the actual tracing, auditing, and
   ptrace reporting.

[Changes]
- Rename and Encapsulate: Rename syscall_trace_exit() to
  syscall_exit_work() and make it static, as it is now an internal
  helper for the exit path.

- New Entry Point: Implement syscall_exit_to_user_mode_work() to
  replace the manual flag-reading logic in el0_svc_common(). This
  function now encapsulates the rseq_syscall() call and the
  conditional execution of syscall_exit_work().

- Simplify el0_svc_common(): Remove the complex conditional checks
  for tracing and CONFIG_DEBUG_RSEQ at the end of the syscall path,
  delegating this responsibility to the new helper.

- Helper Migration: Move has_syscall_work() to asm/syscall.h
  to allow its reuse across ptrace.c and syscall.c.

- Clean up RSEQ: Remove the explicit IS_ENABLED(CONFIG_DEBUG_RSEQ)
  check in the caller, as rseq_syscall() is already a no-op when the
  config is disabled.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h |  7 ++++++-
 arch/arm64/kernel/ptrace.c       | 14 +++++++++++---
 arch/arm64/kernel/syscall.c      | 20 +-------------------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 30b203ef156b..c469d09a7964 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,12 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
+static inline bool has_syscall_work(unsigned long flags)
+{
+	return unlikely(flags & _TIF_SYSCALL_WORK);
+}
+
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
+void syscall_exit_to_user_mode_work(struct pt_regs *regs);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 8245d1ae61cf..2c97de8a097c 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2454,10 +2454,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	return ret ? : syscall;
 }
 
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
+static void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
-	rseq_syscall(regs);
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2467,6 +2465,16 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 		report_syscall_exit(regs);
 }
 
+void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	rseq_syscall(regs);
+
+	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+		syscall_exit_work(regs, flags);
+}
+
 /*
  * SPSR_ELx bits which are always architecturally RES0 per ARM DDI 0487D.a.
  * We permit userspace to set SSBS (AArch64 bit 12, AArch32 bit 23) which is
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e8fd0d60ab09..66d4da641d97 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -65,11 +65,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	choose_random_kstack_offset(get_random_u16());
 }
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
@@ -130,21 +125,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
-	}
-
 trace_exit:
-	flags = read_thread_flags();
-	syscall_trace_exit(regs, flags);
+	syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


