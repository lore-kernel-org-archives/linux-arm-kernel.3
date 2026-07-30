Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14680C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1ce9Ymnjm2nvkI/rfJMKPQme2TzcwLsmyRKNNh3nXE=; b=qXhYSKp4+sKWWvO/6b+pGYiToL
	tlBkY2O6y/JjiM58TW0Xg3A66TTk1aztIuQolbR0QlmQKYsJAcpAUDSxO6L5XqRBulrufhiNBYtyx
	uTHnLxEAsAwGr6I+Z2dZKd5hXSviqhyAPeZZKYLSnv1eDi28qVaRd5Sbtp8ztcFWh5w4am2H9/Une
	LYeeqeztHGMl1sL+3LqU/3NAx5WcUXZYMRjKKZHvgR0KNqhwQKihWtzV1cX3FJNI97riOpUXVaZng
	NsFWfJsZWaLmE4pFsPDxlZbOV0LgmoB6OT1Z5UXnsZGO3UquBNuD+DfPpRDak/a2DEG+BouwOaooM
	I1ptrb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQmx-0000000Aalc-3sIY;
	Thu, 30 Jul 2026 13:27:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQmq-0000000Aak9-2gQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30F7143D40;
	Thu, 30 Jul 2026 13:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4831F00A3A;
	Thu, 30 Jul 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418020;
	bh=C1ce9Ymnjm2nvkI/rfJMKPQme2TzcwLsmyRKNNh3nXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XaMQFSAg2lP3SZP3BaGZA7T/nQ97aZZVkldAI4noIpromQOZbtuIevxGS9qSg0waC
	 DMWY/k6wXqF+g2lW345EAvNe0XxuO36ivlUE4YCy+wUqWRtDfoTHaYhDbnLx+oid6f
	 6pHDdIF/SdgsGbF1JcOMBasGNpzg/PM8f+i4yfndhbsayoq9eOnqZx7dI1fud7UIf/
	 cKQRNe4oxn29e3J45KEVHWbynavi+MHdMFcvMzY9VqvI7hU43P5CAng6jOiin7p5/i
	 vDj+x0BO6h6xf+9irhJoJWSbHcLP+w7i/iDHHI9ur7v0Kc9h6W1iXfuw4Tp8ujuRu3
	 VPql/QSDtYD4A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH v4 1/2] arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
Date: Thu, 30 Jul 2026 14:26:50 +0100
Message-ID: <20260730132651.25993-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730132651.25993-1-will@kernel.org>
References: <20260730132651.25993-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit e057b9477232 ("arm64: syscall: Ensure saved x0 is kept in-sync
with tracer updates") attempted to resolve a long-standing issue with
syscall entry tracing, where a tracer is able to manipulate the first
syscall argument without being subjected to seccomp or audit checking.

Unfortunately, that fix was incomplete [1], as it failed to update
'orig_x0' between a tracer updating x0 during a seccomp ptrace exit
(SECCOMP_RET_TRACE) and the seccomp filter being re-evaluated.

Rather than add hooks to the core seccomp code, instead move the
synchronisation code into the ptrace GPR and syscall setting code so
that 'orig_x0' is kept up to date with x0 whenever we're stopped on the
syscall entry path.

Cc: Kees Cook <kees@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org [1]
Reported-by: Yiqi Sun <sunyiqixm@gmail.com>
Link: https://lore.kernel.org/all/20260529065444.1336608-1-sunyiqixm@gmail.com/
Fixes: e057b9477232 ("arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates")
Fixes: a5cd110cb836 ("arm64/ptrace: run seccomp after ptrace")
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..7a97865acb79 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -560,6 +560,42 @@ static int gpr_get(struct task_struct *target,
 	return membuf_write(&to, uregs, sizeof(*uregs));
 }
 
+static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
+{
+	struct pt_regs *regs = task_pt_regs(target);
+	struct kernel_siginfo *info = target->last_siginfo;
+
+	/*
+	 * Skip the update for NO_SYSCALL (set either by the user or the
+	 * tracer), as regs[0] holds the return value (see the comment in
+	 * el0_svc_common()) and can be unwound using syscall_rollback().
+	 */
+	if (regs->syscallno == NO_SYSCALL)
+		return;
+
+	/* We should only be called when target is in a ptrace stop */
+	if (WARN_ON_ONCE(!info))
+		return;
+
+	/*
+	 * For compat tasks, orig_r0 is provided directly through GPR index
+	 * 17.
+	 */
+	if (is_compat_thread(task_thread_info(target)))
+		return;
+
+	/*
+	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
+	 * return value of the system call.
+	 */
+	if ((info->si_code & ~0x80) == SIGTRAP &&
+	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
+		return;
+	}
+
+	regs->orig_x0 = regs->regs[0];
+}
+
 static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 		   unsigned int pos, unsigned int count,
 		   const void *kbuf, const void __user *ubuf)
@@ -575,6 +611,14 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 		return -EINVAL;
 
 	task_pt_regs(target)->user_regs = newregs;
+
+	/*
+	 * Keep orig_x0 authoritative so that seccomp (via
+	 * syscall_get_arguments()), audit and the restart path all see the same
+	 * first argument the syscall is dispatched with, even if it has been
+	 * updated by a tracer.
+	 */
+	update_syscall_orig_x0_after_ptrace(target);
 	return 0;
 }
 
@@ -753,6 +797,12 @@ static int system_call_set(struct task_struct *target,
 		return ret;
 
 	task_pt_regs(target)->syscallno = syscallno;
+
+	/*
+	 * Re-sync orig_x0 in case the syscall number has been changed
+	 * from NO_SYSCALL.
+	 */
+	update_syscall_orig_x0_after_ptrace(target);
 	return ret;
 }
 
-- 
2.55.0.508.g3f0d502094-goog


