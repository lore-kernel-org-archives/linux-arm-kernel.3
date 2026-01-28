Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80BAD35671
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 03:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/winTl3WYeNhZLFo886OhmhgHxj8matd5TvztlmrpLM=; b=TmQnH3NvFT6iW/sqc+xjkAYkGj
	7ZaqlNrjQYT5xZV/e8kjEv8f9fiTuINRXgwMKBbeBb/sk4ndKPIWvwBz88974aq1nGDIN9O6sWZOk
	p+7IPcM7YYru925L/QJOby4tVnXFncRQYVhE8TgsUDyuS2qvfd3Ms14tVwddnnBicjpyz6xd4g6uJ
	mbDu0NyAofz2iNj6gdb199juYrEefaRsiAAuX8gJnF2uIUQEihFzLyzTRkX2JOJB1XXy/4zlrOxJf
	4P8hsp7o6N60sBWx1HjI0U1RVe4XP5IWBIrjTKBsOErvIt1Lzlj7DPazqFfEj9jrQoQkEjSv15OzZ
	vLm1MobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkw6k-0000000FMjy-2hl1;
	Wed, 28 Jan 2026 03:20:42 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkw69-0000000FMHq-3pHa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 03:20:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/winTl3WYeNhZLFo886OhmhgHxj8matd5TvztlmrpLM=;
	b=UZ2mYVUNqPjG+gCmvbBhfM11qgbIbyFE7mlW7xQikSPioWdC3csAAY++lS7cdaTgFBGUuK5kj
	6QJA46WpH7lukA83W4WAu/KqR+L4h/Tgyj2IzN0yxiqyiq6ad5lsfjGVXCFKDFpIoLF8PWTpVnw
	rVCgJcX4Btjeyya/KbS0PTU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f16r226ZWzRhrt;
	Wed, 28 Jan 2026 11:16:34 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5387D2021A;
	Wed, 28 Jan 2026 11:20:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:20:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 13/14] entry: Inline syscall_exit_work() and syscall_trace_enter()
Date: Wed, 28 Jan 2026 11:19:33 +0800
Message-ID: <20260128031934.3906955-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_192006_266459_61BA3838 
X-CRM114-Status: GOOD (  20.73  )
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

After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
appeared because syscall_exit_work() is not inlined, so inline
syscall_exit_work(). Also inline syscall_trace_enter() to align with
syscall_exit_work().

On v6.19-rc1 with audit on, inline both syscall_trace_enter() and
syscall_exit_work() has 4% performance uplift on perf bench basic
syscall on kunpeng920 as below:

    | Metric     | W/O this patch | With this patch | Change  |
    | ---------- | -------------- | --------------- | ------  |
    | Total time | 2.353 [sec]    | 2.264 [sec]     |  ↓3.8%  |
    | usecs/op   | 0.235374       | 0.226472        |  ↓3.8%  |
    | ops/sec    | 4,248,588      | 4,415,554       |  ↑3.9%  |

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h         | 101 ++++++++++++++++++++++++++-
 kernel/entry/common.h                |   7 --
 kernel/entry/syscall-common.c        |  95 ++-----------------------
 kernel/entry/syscall_user_dispatch.c |   4 +-
 4 files changed, 105 insertions(+), 102 deletions(-)
 delete mode 100644 kernel/entry/common.h

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 48bdde74a3e1..c2d772c70b7c 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_ENTRYCOMMON_H
 #define __LINUX_ENTRYCOMMON_H
 
+#include <linux/audit.h>
 #include <linux/irq-entry-common.h>
 #include <linux/livepatch.h>
 #include <linux/ptrace.h>
@@ -64,7 +65,63 @@ static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs
 }
 #endif
 
-long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
+static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
+{
+	if (unlikely(audit_context())) {
+		unsigned long args[6];
+
+		syscall_get_arguments(current, regs, args);
+		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+	}
+}
+
+void __trace_sys_enter(struct pt_regs *regs, long syscall);
+bool syscall_user_dispatch(struct pt_regs *regs);
+
+static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
+{
+	long syscall, ret = 0;
+
+	/*
+	 * Handle Syscall User Dispatch.  This must comes first, since
+	 * the ABI here can be something that doesn't make sense for
+	 * other syscall_work features.
+	 */
+	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
+		if (syscall_user_dispatch(regs))
+			return -1L;
+	}
+
+	/* Handle ptrace */
+	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
+		ret = arch_ptrace_report_syscall_entry(regs);
+		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
+			return -1L;
+	}
+
+	/* Do seccomp after ptrace, to catch any tracer changes. */
+	if (work & SYSCALL_WORK_SECCOMP) {
+		ret = __secure_computing();
+		if (ret == -1L)
+			return ret;
+	}
+
+	/* Either of the above might have changed the syscall number */
+	syscall = syscall_get_nr(current, regs);
+
+	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
+		__trace_sys_enter(regs, syscall);
+		/*
+		 * Probes or BPF hooks in the tracepoint may have changed the
+		 * system call number as well.
+		 */
+		syscall = syscall_get_nr(current, regs);
+	}
+
+	syscall_enter_audit(regs, syscall);
+
+	return ret ? : syscall;
+}
 
 /**
  * syscall_enter_from_user_mode_work - Check and handle work before invoking
@@ -131,6 +188,19 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
 	return ret;
 }
 
+/*
+ * If SYSCALL_EMU is set, then the only reason to report is when
+ * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
+ * instruction has been already reported in syscall_enter_from_user_mode().
+ */
+static __always_inline bool report_single_step(unsigned long work)
+{
+	if (work & SYSCALL_WORK_SYSCALL_EMU)
+		return false;
+
+	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
+}
+
 /**
  * arch_ptrace_report_syscall_exit - Architecture specific
  *				     ptrace_report_syscall_exit.
@@ -151,6 +221,8 @@ static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs
 }
 #endif
 
+void __trace_sys_exit(struct pt_regs *regs, long ret);
+
 /**
  * syscall_exit_work - Handle work before returning to user mode
  * @regs:	Pointer to current pt_regs
@@ -158,7 +230,32 @@ static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs
  *
  * Do one-time syscall specific work.
  */
-void syscall_exit_work(struct pt_regs *regs, unsigned long work);
+static __always_inline void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+{
+	bool step;
+
+	/*
+	 * If the syscall was rolled back due to syscall user dispatching,
+	 * then the tracers below are not invoked for the same reason as
+	 * the entry side was not invoked in syscall_trace_enter(): The ABI
+	 * of these syscalls is unknown.
+	 */
+	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
+		if (unlikely(current->syscall_dispatch.on_dispatch)) {
+			current->syscall_dispatch.on_dispatch = false;
+			return;
+		}
+	}
+
+	audit_syscall_exit(regs);
+
+	if (work & SYSCALL_WORK_SYSCALL_TRACEPOINT)
+		__trace_sys_exit(regs, syscall_get_return_value(current, regs));
+
+	step = report_single_step(work);
+	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
+		arch_ptrace_report_syscall_exit(regs, step);
+}
 
 /**
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
diff --git a/kernel/entry/common.h b/kernel/entry/common.h
deleted file mode 100644
index f6e6d02f07fe..000000000000
--- a/kernel/entry/common.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _COMMON_H
-#define _COMMON_H
-
-bool syscall_user_dispatch(struct pt_regs *regs);
-
-#endif
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index bb5f61f5629d..10231d30405e 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -1,103 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/audit.h>
 #include <linux/entry-common.h>
-#include "common.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
-static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
+void __trace_sys_enter(struct pt_regs *regs, long syscall)
 {
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
-
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
+	trace_sys_enter(regs, syscall);
 }
 
-long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
+void __trace_sys_exit(struct pt_regs *regs, long ret)
 {
-	long syscall, ret = 0;
-
-	/*
-	 * Handle Syscall User Dispatch.  This must comes first, since
-	 * the ABI here can be something that doesn't make sense for
-	 * other syscall_work features.
-	 */
-	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
-		if (syscall_user_dispatch(regs))
-			return -1L;
-	}
-
-	/* Handle ptrace */
-	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
-		ret = arch_ptrace_report_syscall_entry(regs);
-		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
-			return -1L;
-	}
-
-	/* Do seccomp after ptrace, to catch any tracer changes. */
-	if (work & SYSCALL_WORK_SECCOMP) {
-		ret = __secure_computing();
-		if (ret == -1L)
-			return ret;
-	}
-
-	/* Either of the above might have changed the syscall number */
-	syscall = syscall_get_nr(current, regs);
-
-	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
-		trace_sys_enter(regs, syscall);
-		/*
-		 * Probes or BPF hooks in the tracepoint may have changed the
-		 * system call number as well.
-		 */
-		syscall = syscall_get_nr(current, regs);
-	}
-
-	syscall_enter_audit(regs, syscall);
-
-	return ret ? : syscall;
-}
-
-/*
- * If SYSCALL_EMU is set, then the only reason to report is when
- * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
- * instruction has been already reported in syscall_enter_from_user_mode().
- */
-static inline bool report_single_step(unsigned long work)
-{
-	if (work & SYSCALL_WORK_SYSCALL_EMU)
-		return false;
-
-	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
-}
-
-void syscall_exit_work(struct pt_regs *regs, unsigned long work)
-{
-	bool step;
-
-	/*
-	 * If the syscall was rolled back due to syscall user dispatching,
-	 * then the tracers below are not invoked for the same reason as
-	 * the entry side was not invoked in syscall_trace_enter(): The ABI
-	 * of these syscalls is unknown.
-	 */
-	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
-		if (unlikely(current->syscall_dispatch.on_dispatch)) {
-			current->syscall_dispatch.on_dispatch = false;
-			return;
-		}
-	}
-
-	audit_syscall_exit(regs);
-
-	if (work & SYSCALL_WORK_SYSCALL_TRACEPOINT)
-		trace_sys_exit(regs, syscall_get_return_value(current, regs));
-
-	step = report_single_step(work);
-	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
-		arch_ptrace_report_syscall_exit(regs, step);
+	trace_sys_exit(regs, ret);
 }
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index a9055eccb27e..d89dffcc2d64 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -2,6 +2,8 @@
 /*
  * Copyright (C) 2020 Collabora Ltd.
  */
+
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/prctl.h>
 #include <linux/ptrace.h>
@@ -15,8 +17,6 @@
 
 #include <asm/syscall.h>
 
-#include "common.h"
-
 static void trigger_sigsys(struct pt_regs *regs)
 {
 	struct kernel_siginfo info;
-- 
2.34.1


