Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7789DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZemU2vHK5SZ8bpC5yLoBk/aeVN3xtfESODK0XVaDsM=; b=vn6VOQeaHwG1bNk5N1xv9Z0Bz+
	cnX2uIZr+BJW915xNzsiV4fJ7jLlDi02P6PhSoSr1u12dlBRMot7NBqwiFyC0ozv6IIX87HlyTcdI
	AzmNR+q2A/36A3p6Ij2BscJ+Ir52xuzRhicZhXe4W8c9e5IXOOR82ASZQnxdPFo5JUsxuec2t4Amd
	/lr3+NMwKodHtgZCjIV0AR3puoqCNJIjeZRuaZc5TaxXyfoTlAbAmKxwKLVZEcHahqBj+LKtu/SIe
	lHp4NAwQDdoayUQ/F5yZoD/NVy+rWGLrZ2GfKSAv0oOXr4CNytYotvv6su8oVNyZx8/BBOZGwYiP5
	D2X7dbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqj21-0000000FzDE-1DxP;
	Sat, 08 Mar 2025 01:31:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiyr-0000000Fys0-1oOW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0958B5C65EC;
	Sat,  8 Mar 2025 01:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4860C4CED1;
	Sat,  8 Mar 2025 01:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741397276;
	bh=sIHNZlIzJdDqSwxWmFiuoinsaetd8EpvmKMg9ut31Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BAuwDe4SWQ2/jLzudLSBU34nrxJi6TAowDSMiXKz8FbAAeo8UYRT1VU5j++hrdia8
	 XkSWwh3kHAApSnTTRww1MCfyjp04jCrKII9bsd6PAVuK2tZaEqn9Jtq/+Jdu7/7oUk
	 IGj3kr8qzT05+3jMuQ4ku0AyopVsHCjddeLu4ExTEN5i3AGu1/swQImAYxUszmxcft
	 vbmkCoO7dgLKYF9r8Yi0p2RVD1S1IqwVnvcYl1E7x0C1gfazqV6sqVC9iZ/bnJLJ7t
	 BZcY69LBkUzFp0k6T9Gwh8rstTE28YTSY3g/nFklzLwDOavM2m44oG1/q7VI9Kwk/R
	 YLrggYcErTElw==
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
Subject: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Date: Fri,  7 Mar 2025 17:27:41 -0800
Message-ID: <20250308012742.3208215-2-song@kernel.org>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250308012742.3208215-1-song@kernel.org>
References: <20250308012742.3208215-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_172757_578138_5C4BA58E 
X-CRM114-Status: GOOD (  14.20  )
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

This version has been inspired by Weinan Liu's patch [1].

[1] https://lore.kernel.org/live-patching/20250127213310.2496133-7-wnliu@google.com/
Signed-off-by: Song Liu <song@kernel.org>
---
 arch/arm64/Kconfig                         |  2 +-
 arch/arm64/include/asm/stacktrace/common.h |  1 +
 arch/arm64/kernel/stacktrace.c             | 44 +++++++++++++++++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..ed4f7bf4a879 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -275,6 +275,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2499,4 +2500,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 821a8fdd31af..072469fd91b7 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -33,6 +33,7 @@ struct unwind_state {
 	struct stack_info stack;
 	struct stack_info *stacks;
 	int nr_stacks;
+	bool unreliable;
 };
 
 static inline struct stack_info stackinfo_get_unknown(void)
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..69d0567a0c38 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -230,8 +230,14 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	new_fp = READ_ONCE(record->fp);
 	new_pc = READ_ONCE(record->lr);
 
-	if (!new_fp && !new_pc)
+	if (!new_fp && !new_pc) {
+		/*
+		 * Searching across exception boundaries. The stack is now
+		 * unreliable.
+		 */
+		state->common.unreliable = true;
 		return kunwind_next_frame_record_meta(state);
+	}
 
 	unwind_consume_stack(&state->common, info, fp, sizeof(*record));
 
@@ -347,6 +353,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		.common = {
 			.stacks = stacks,
 			.nr_stacks = ARRAY_SIZE(stacks),
+			.unreliable = false,
 		},
 	};
 
@@ -387,6 +394,41 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+struct kunwind_reliable_consume_entry_data {
+	stack_trace_consume_fn consume_entry;
+	void *cookie;
+	bool unreliable;
+};
+
+static __always_inline bool
+arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
+{
+	struct kunwind_reliable_consume_entry_data *data = cookie;
+
+	if (state->common.unreliable) {
+		data->unreliable = true;
+		return false;
+	}
+	return data->consume_entry(data->cookie, state->common.pc);
+}
+
+noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+			void *cookie, struct task_struct *task)
+{
+	struct kunwind_reliable_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+		.unreliable = false,
+	};
+
+	kunwind_stack_walk(arch_kunwind_reliable_consume_entry, &data, task, NULL);
+
+	if (data.unreliable)
+		return -EINVAL;
+
+	return 0;
+}
+
 struct bpf_unwind_consume_entry_data {
 	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
 	void *cookie;
-- 
2.43.5


