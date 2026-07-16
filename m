Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F212FC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9NFVNmFFAtT3ZHw+Jh8sOxw1iDoOlME0vAg46dPD2Gk=; b=K8WI+y7DfaamVEpOORbz7xldXx
	/u9Oozwr+s1VThlaVN2+ZrvvImW6RLl/0gZ0G4LgQNERbD0EdSQJ40A3FOFYMFMW0b6RRFsQ4F+0O
	9yHti6Q3pfnpWZVvrHWajrNv0CTnUMXacgGKgLOxA44gDuV6o1VQ2nqXQ2GdkLI9+aeIWrkvSsJ5z
	3FWwf+E/GvrY14ShoIM//lXgCwdGZC3FQNyU/OOatEfnlHVOwUSCpxOPk6OWLUaD1ib7DfOexe3ry
	6fiWz/L5WlJvZIPMe9jClmk1yxRCtbh8VLSc6EWUZdsWyQ8kjoeFfmAhako2m3fd2PnQ7r6UkUq9C
	nxVMogNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKra-0000000HCif-2JEF;
	Thu, 16 Jul 2026 12:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKrY-0000000HCiX-2Nez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:06:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 269C440821;
	Thu, 16 Jul 2026 12:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7361F000E9;
	Thu, 16 Jul 2026 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784203608;
	bh=9NFVNmFFAtT3ZHw+Jh8sOxw1iDoOlME0vAg46dPD2Gk=;
	h=From:To:Cc:Subject:Date;
	b=mIR5XL/7R+tHMhAs32UmbKDsncggj8VNMo7lX8183XtxgB4XW4HPO+36Ky1/ItVPY
	 hTO4s3N6lYGKQJ2dhxcn5ZLJJ9L/u4rIoUqZRI0bIbAPRpcAXVEBZVXqsAlqq3et9n
	 RHLQrJhLmAXv6kK7bJF3eS6TQR4gj674VeQHXYPLZVBSeHhOnE1aLY08zwyNw83c/4
	 +ezL1sEYcWA25SWC72QXxvTPEiPyL5QaaD7+nyq/YZcmJNJyRjI5w4HjlyF3SaJc8v
	 8d9dzkCN8yeibUnOccyTNRm5PvQIecDoZGpnBX9RIsVdfdd8/nh0UytqXe49PuufDK
	 iZDHgcKV2Rpsw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
Date: Thu, 16 Jul 2026 13:06:39 +0100
Message-ID: <20260716120640.6590-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

When seccomp support was originally added to arm64 in a1ae65b21941
("arm64: add seccomp support"), seccomp was erroneously called _before_
the ptrace syscall-enter-stop and therefore the tracer could trivially
manipulate the syscall register state after the seccomp check had
passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
seccomp after ptrace") by moving the seccomp check after the tracer has
run. Unfortunately, a decade later, that fix has been reported to be
incomplete.

On arm64, both the first argument to a syscall and its eventual return
value are allocated to register x0. In order to facilitate syscall
restarting and querying of syscall arguments on the syscall exit path,
the original value of x0 is stashed in 'struct pt_regs::orig_x0' early
during the syscall entry path and is returned for the first argument by
syscall_get_arguments(). Unlike 32-bit Arm, this stashed value is not
directly exposed via ptrace() and so changes to register x0 made by the
tracer on a syscall-enter-stop are not reflected in 'orig_x0'. This
means that seccomp, syscall tracepoints and audit can observe a stale
value for the register compared to the argument that will be observed by
the actual syscall.

Re-sync 'orig_x0' from x0 on the syscall entry path following a
potential ptrace stop (i.e. PTRACE_EVENTMSG_SYSCALL_ENTRY or
SECCOMP_RET_TRACE). This behaviour is limited to native tasks (because
compat tasks expose 'orig_r0' to ptrace) where the syscall is not being
skipped (because x0 is updated to hold the return value of -ENOSYS in
that case).

Cc: Kees Cook <kees@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reported-by: Yiqi Sun <sunyiqixm@gmail.com>
Link: https://lore.kernel.org/all/20260529065444.1336608-1-sunyiqixm@gmail.com/
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: a5cd110cb836 ("arm64/ptrace: run seccomp after ptrace")
Signed-off-by: Will Deacon <will@kernel.org>
---

Changes since v1 (https://lore.kernel.org/r/20260714143600.23853-1-will@kernel.org):
  * Reworded and expanded comments and commit message per Jinjie's
    feedback

 arch/arm64/kernel/ptrace.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..390c9b2bd966 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
+{
+	/*
+	 * Keep orig_x0 authoritative so that seccomp (via
+	 * syscall_get_arguments()), audit and the restart path all see the same
+	 * first argument the syscall is dispatched with, even if it has been
+	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
+	 * or the tracer), as regs[0] holds the return value (see the comment in
+	 * el0_svc_common()) and can be unwound using syscall_rollback().
+	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
+	 */
+	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
+		regs->orig_x0 = regs->regs[0];
+}
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
@@ -2417,12 +2432,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+
+		/*
+		 * Ensure ptrace changes to x0 during a regular
+		 * syscall-enter-stop (PTRACE_SYSCALL) are visible to
+		 * subsequent seccomp checks, tracepoints and audit.
+		 */
+		update_syscall_orig_x0_after_ptrace(regs);
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
 	if (secure_computing() == -1)
 		return NO_SYSCALL;
 
+	/*
+	 * Ensure tracer changes to x0 during seccomp ptrace exit
+	 * processing (SECCOMP_RET_TRACE) are visible to tracepoints and
+	 * audit.
+	 */
+	update_syscall_orig_x0_after_ptrace(regs);
+
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-- 
2.55.0.141.g00534a21ce-goog


