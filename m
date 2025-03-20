Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39309C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izkjD6yTnP5j6NIkyzvQPArolLfNQIi3Qq8nA6tdTxg=; b=dsRqB6lMzwnMqV7s1jppdMvRPg
	jQGJ5sY/q15pXKoPiiixsHo9cWcn3CWYcFXvn0/tunxIT1+0AYR3V+Aal7kqRZCZtB+l8ZvszK5vc
	INdQxoV0sry6p7CT+F4uI6HaZXtgGjx+CQ7rBf8o+BR/H7qjKgF0+zpu8Xx7PuEC90QvlfE7WProx
	RG/1aqP/zfhWZVylY+1pEY9QUA7qGf/P9Ck+EsjSnqn17UWJk1p9Lrap8xKNO0cdutwA3B2vyAyoi
	KYVxVOYyU0nBpT5nTisNmJXc8AwuFdhEvKLKN1EZ9qn3UINAWIwuFYBoMNbBEDpLDkAyACEFopL1E
	AGV3YIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJcy-0000000CnFS-3yW6;
	Thu, 20 Mar 2025 17:24:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJVA-0000000CmCd-29iS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7935AA495BC;
	Thu, 20 Mar 2025 17:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55640C4CEDD;
	Thu, 20 Mar 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490975;
	bh=93BptoOqRVNyFCiKnHpDZo5E7NyEmw7OFNQMaCFMsOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdMz1U1svm/4L8hrxLq7fu0fIWjgK7YNV0P0hmjtoZdidcxGlN+c8CWY9XwBIFLxW
	 TubZI2sZROkpdT20h2nbq3zhTE8Fv9j5LsaD5JGbjpPsmZTb/G6eG8BestSS6MqDXN
	 I1O9IcFpuZJC+3dz5aJaSL+FeJyCDiLFz+x49k/q6bKGapPjgOScxWi9Co5AVUVX4C
	 KgG5k2bOVtz7cW5xH8GNN9pcxCx6u4Y3BrdvGhLISjcffthPg3pCbgjo7/q6k82HVW
	 R9Vp8yIJ1r4uu5jsA0OG3h52QeioNlWgVWJXf20DHdxg/FtPkXKJDX5WjyalA1fCY5
	 0gHs6Lsz/5RMg==
From: Song Liu <song@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org
Cc: indu.bhagat@oracle.com,
	puranjay@kernel.org,
	wnliu@google.com,
	irogers@google.com,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	roman.gushchin@linux.dev,
	rostedt@goodmis.org,
	will@kernel.org,
	kernel-team@meta.com,
	song@kernel.org
Subject: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Date: Thu, 20 Mar 2025 10:15:58 -0700
Message-ID: <20250320171559.3423224-2-song@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320171559.3423224-1-song@kernel.org>
References: <20250320171559.3423224-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_101616_682061_B67570B2 
X-CRM114-Status: GOOD (  17.43  )
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

With proper exception boundary detection, it is possible to implment
arch_stack_walk_reliable without sframe.

Note that, arch_stack_walk_reliable does not guarantee getting reliable
stack in all scenarios. Instead, it can reliably detect when the stack
trace is not reliable, which is enough to provide reliable livepatching.

Signed-off-by: Song Liu <song@kernel.org>
---
 arch/arm64/Kconfig             |  2 +-
 arch/arm64/kernel/stacktrace.c | 66 +++++++++++++++++++++++++---------
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 701d980ea921..31d5e1ee6089 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -276,6 +276,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2500,4 +2501,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..7e07911d8694 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -56,6 +56,7 @@ struct kunwind_state {
 	enum kunwind_source source;
 	union unwind_flags flags;
 	struct pt_regs *regs;
+	bool end_on_unreliable;
 };
 
 static __always_inline void
@@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	new_fp = READ_ONCE(record->fp);
 	new_pc = READ_ONCE(record->lr);
 
-	if (!new_fp && !new_pc)
-		return kunwind_next_frame_record_meta(state);
+	if (!new_fp && !new_pc) {
+		int ret;
+
+		ret = kunwind_next_frame_record_meta(state);
+		if (ret < 0) {
+			/*
+			 * This covers two different conditions:
+			 *  1. ret == -ENOENT, unwinding is done.
+			 *  2. ret == -EINVAL, unwinding hit error.
+			 */
+			return ret;
+		}
+		/*
+		 * Searching across exception boundaries. The stack is now
+		 * unreliable.
+		 */
+		if (state->end_on_unreliable)
+			return -EINVAL;
+		return 0;
+	}
 
 	unwind_consume_stack(&state->common, info, fp, sizeof(*record));
 
@@ -277,21 +296,24 @@ kunwind_next(struct kunwind_state *state)
 
 typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, void *cookie);
 
-static __always_inline void
+static __always_inline int
 do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 	   void *cookie)
 {
-	if (kunwind_recover_return_address(state))
-		return;
+	int ret;
 
-	while (1) {
-		int ret;
+	ret = kunwind_recover_return_address(state);
+	if (ret)
+		return ret;
 
+	while (1) {
 		if (!consume_state(state, cookie))
-			break;
+			return -EINVAL;
 		ret = kunwind_next(state);
+		if (ret == -ENOENT)
+			return 0;
 		if (ret < 0)
-			break;
+			return ret;
 	}
 }
 
@@ -324,10 +346,10 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			: stackinfo_get_unknown();		\
 	})
 
-static __always_inline void
+static __always_inline int
 kunwind_stack_walk(kunwind_consume_fn consume_state,
 		   void *cookie, struct task_struct *task,
-		   struct pt_regs *regs)
+		   struct pt_regs *regs, bool end_on_unreliable)
 {
 	struct stack_info stacks[] = {
 		stackinfo_get_task(task),
@@ -348,11 +370,12 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 			.stacks = stacks,
 			.nr_stacks = ARRAY_SIZE(stacks),
 		},
+		.end_on_unreliable = end_on_unreliable,
 	};
 
 	if (regs) {
 		if (task != current)
-			return;
+			return -EINVAL;
 		kunwind_init_from_regs(&state, regs);
 	} else if (task == current) {
 		kunwind_init_from_caller(&state);
@@ -360,7 +383,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		kunwind_init_from_task(&state, task);
 	}
 
-	do_kunwind(&state, consume_state, cookie);
+	return do_kunwind(&state, consume_state, cookie);
 }
 
 struct kunwind_consume_entry_data {
@@ -384,7 +407,18 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 		.cookie = cookie,
 	};
 
-	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
+	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs, false);
+}
+
+noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+			void *cookie, struct task_struct *task)
+{
+	struct kunwind_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	return kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL, true);
 }
 
 struct bpf_unwind_consume_entry_data {
@@ -409,7 +443,7 @@ noinline noinstr void arch_bpf_stack_walk(bool (*consume_entry)(void *cookie, u6
 		.cookie = cookie,
 	};
 
-	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL);
+	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL, false);
 }
 
 static const char *state_source_string(const struct kunwind_state *state)
@@ -456,7 +490,7 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 		return;
 
 	printk("%sCall trace:\n", loglvl);
-	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs);
+	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs, false);
 
 	put_task_stack(tsk);
 }
-- 
2.47.1


