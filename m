Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A862E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYQjSBvv5234BNm5vYmhB6uqfy3Ibfytzxm0HGRzyTs=; b=LAzkul3XB/69jqT3DUr6GZV3Iy
	D3PvGfT7OnDOBb4f7PrW6XUdCcu2MBRjzawgY39vvcZAf74+70/4m2Aw1WfVKi4eSO4FQsunHCz0c
	rhWqgNH5qfHalPNe4Cpwyk/YO7+tYzJK1B3T/tfulUBt2CjbA7RmD7E6qHNRfvh+kiKgvXLwM7dxO
	bLSI4+pnW2F1bTf0VFj+gR1GCzsIDU6ieOktBRkIQx9FIHhTcDpkFVC0QHmSOACZnxB95It2r7/Nj
	zqvuTh0Rr9b6KHpPMOL/WnFHGP4DPopMbomrHehT02mZM7my5S1IO9T6To0ZqBoX1jRdq+kKhf4ay
	8XwCpPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNQ3-0000000F6LQ-2YLB;
	Wed, 11 Dec 2024 14:10:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNMw-0000000F5gh-447A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:07:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93AFA1692;
	Wed, 11 Dec 2024 06:07:42 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D0093F720;
	Wed, 11 Dec 2024 06:07:13 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aishwarya.tcv@arm.com,
	catalin.marinas@arm.com,
	keescook@chromium.org,
	kent.overstreet@linux.dev,
	mark.rutland@arm.com,
	peterz@infradead.org,
	will@kernel.org
Subject: [PATCH 2/2] arm64: stacktrace: Don't WARN when unwinding other tasks
Date: Wed, 11 Dec 2024 14:07:04 +0000
Message-Id: <20241211140704.2498712-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241211140704.2498712-1-mark.rutland@arm.com>
References: <20241211140704.2498712-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060715_091816_9D5BA74A 
X-CRM114-Status: GOOD (  18.49  )
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

The arm64 stacktrace code has a few error conditions where a
WARN_ON_ONCE() is triggered before the stacktrace is terminated and an
error is returned to the caller. The conditions shouldn't be triggered
when unwinding the current task, but it is possible to trigger these
when unwinding another task which is not blocked, as the stack of that
task is concurrently modified. Kent reports that these warnings can be
triggered while running filesystem tests on bcachefs, which calls the
stacktrace code directly.

To produce a meaningful stacktrace of another task, the task in question
should be blocked, but the stacktrace code is expected to be robust to
cases where it is not blocked. Note that this is purely about not
unuduly scaring the user and/or crashing the kernel; stacktraces in such
cases are meaningless and may leak kernel secrets from the stack of the
task being unwound.

Ideally we'd pin the task in a blocked state during the unwind, as we do
for /proc/${PID}/wchan since commit:

  42a20f86dc19f928 ("sched: Add wrapper for get_wchan() to keep task blocked")

... but a bunch of places don't do that, notably /proc/${PID}/stack,
where we don't pin the task in a blocked state, but do restrict the
output to privileged users since commit:

  f8a00cef17206ecd ("proc: restrict kernel stack dumps to root")

... and so it's possible to trigger these warnings accidentally, e.g. by
reading /proc/*/stack (as root):

| for n in $(seq 1 10); do
|     while true; do cat /proc/*/stack > /dev/null 2>&1; done &
| done
| ------------[ cut here ]------------
| WARNING: CPU: 3 PID: 166 at arch/arm64/kernel/stacktrace.c:207 arch_stack_walk+0x1c8/0x370
| Modules linked in:
| CPU: 3 UID: 0 PID: 166 Comm: cat Not tainted 6.13.0-rc2-00003-g3dafa7a7925d #2
| Hardware name: linux,dummy-virt (DT)
| pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
| pc : arch_stack_walk+0x1c8/0x370
| lr : arch_stack_walk+0x1b0/0x370
| sp : ffff800080773890
| x29: ffff800080773930 x28: fff0000005c44500 x27: fff00000058fa038
| x26: 000000007ffff000 x25: 0000000000000000 x24: 0000000000000000
| x23: ffffa35a8d9600ec x22: 0000000000000000 x21: fff00000043a33c0
| x20: ffff800080773970 x19: ffffa35a8d960168 x18: 0000000000000000
| x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
| x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
| x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
| x8 : ffff8000807738e0 x7 : ffff8000806e3800 x6 : ffff8000806e3818
| x5 : ffff800080773920 x4 : ffff8000806e4000 x3 : ffff8000807738e0
| x2 : 0000000000000018 x1 : ffff8000806e3800 x0 : 0000000000000000
| Call trace:
|  arch_stack_walk+0x1c8/0x370 (P)
|  stack_trace_save_tsk+0x8c/0x108
|  proc_pid_stack+0xb0/0x134
|  proc_single_show+0x60/0x120
|  seq_read_iter+0x104/0x438
|  seq_read+0xf8/0x140
|  vfs_read+0xc4/0x31c
|  ksys_read+0x70/0x108
|  __arm64_sys_read+0x1c/0x28
|  invoke_syscall+0x48/0x104
|  el0_svc_common.constprop.0+0x40/0xe0
|  do_el0_svc+0x1c/0x28
|  el0_svc+0x30/0xcc
|  el0t_64_sync_handler+0x10c/0x138
|  el0t_64_sync+0x198/0x19c
| ---[ end trace 0000000000000000 ]---

Fix this by only warning when unwinding the current task. When unwinding
another task the error conditions will be handled by returning an error
without producing a warning.

The two warnings in kunwind_next_frame_record_meta() were added recently
as part of commit:

  c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")

The warning when recovering the fgraph return address has changed form
many times, but was originally introduced back in commit:

  9f416319f40cd857 ("arm64: fix unwind_frame() for filtered out fn for function graph tracing")

Fixes: c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")
Fixes: 9f416319f40cd857 ("arm64: fix unwind_frame() for filtered out fn for function graph tracing")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/stacktrace.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 4a08ad8158380..1d9d51d7627fd 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -137,8 +137,10 @@ kunwind_recover_return_address(struct kunwind_state *state)
 		orig_pc = ftrace_graph_ret_addr(state->task, &state->graph_idx,
 						state->common.pc,
 						(void *)state->common.fp);
-		if (WARN_ON_ONCE(state->common.pc == orig_pc))
+		if (state->common.pc == orig_pc) {
+			WARN_ON_ONCE(state->task == current);
 			return -EINVAL;
+		}
 		state->common.pc = orig_pc;
 		state->flags.fgraph = 1;
 	}
@@ -199,12 +201,12 @@ kunwind_next_frame_record_meta(struct kunwind_state *state)
 	case FRAME_META_TYPE_FINAL:
 		if (meta == &task_pt_regs(tsk)->stackframe)
 			return -ENOENT;
-		WARN_ON_ONCE(1);
+		WARN_ON_ONCE(tsk == current);
 		return -EINVAL;
 	case FRAME_META_TYPE_PT_REGS:
 		return kunwind_next_regs_pc(state);
 	default:
-		WARN_ON_ONCE(1);
+		WARN_ON_ONCE(tsk == current);
 		return -EINVAL;
 	}
 }
-- 
2.30.2


