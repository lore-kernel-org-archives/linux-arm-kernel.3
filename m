Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A0DC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NaS0fs1sqDcgE/8Lvzs7S7HBVlJ2TLFKX7uIm1cAuNY=; b=kEXX6Vzs2aaH+4rCtaX4gRnqPM
	rwY/UV1Va1sDz7b/M/vr4gjqtj4MquGyR2rJKVaAPX0qWEJQqk2hf/mhoXc9Vf6aBDuS5kz3p4qx0
	JEg/xoi5trffFE8oRAXO47ekXobAAUXzWuiCDeIdoPHEvOuSE6RK1hdu+KbCtHQWQqoIUl1xdsSs6
	siSOzAOiwCe6R+TL4JHlYEelGWLnYsgCvQZaGxDx3h3w6qppkZ018YDd4opLdqzT8Qkuo1QQXvPEt
	hO1ubfLP+vQQYTpDWQpFBvknJK5EvL6icLkOo/CmXraAG3mlbprmMTM8M3ZdnXW/2rNHQtpmhxFDp
	9oNPMSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHX6-00000007xiV-3O25;
	Wed, 29 Jan 2025 23:31:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHVl-00000007xcI-0Pox
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AE7AA41CAC;
	Wed, 29 Jan 2025 23:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735BEC4CED1;
	Wed, 29 Jan 2025 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738193419;
	bh=wUAJ/v7od0Gk1yKWDiIdIZiAOmZif9syfzaEjk1XI98=;
	h=From:To:Cc:Subject:Date:From;
	b=sFKI3DC/0dh9WCpYNoY1rOI8OJq2KVdOEeiWXMUrstkGDrDmBf0vMC3KwtGEGyd/A
	 2NFu3zxaXhYyoK3hbcbS0zgI6aPGxQlN6QcOJBPN4CAN8+AqfDBYKi2sg79/GLNc/p
	 1OijCbNAD4tJmDVrgrbNaZSF3x+6oVuy30+Nqyw9j10ZqTqA4noOqz+9WjRZo30WyU
	 glWg6lqBo+ysYEXeDfj97P03eYZBRDCGnLnQ7OUVXadbylJV0j5FKUDIqDTiC1dVX/
	 Pz5WNxapg7SZHo+qaiHZtV6dQgZd+nPqkHN09LFgpGNvSybSt4Av/6jhwwN4eFJJhL
	 K/M3XfBR6YjBA==
From: Song Liu <song@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	surajjs@amazon.com,
	duwe@suse.de,
	song@kernel.org,
	kernel-team@meta.com
Subject: [RFC 1/2] arm64: Implement arch_stack_walk_reliable
Date: Wed, 29 Jan 2025 15:29:35 -0800
Message-ID: <20250129232936.1795412-1-song@kernel.org>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_153021_267770_6F7D57C9 
X-CRM114-Status: GOOD (  14.31  )
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

Let do_kunwind() and kunwind_stack_walk() return the state of stack walk
properly to the caller, and use them in arch_stack_walk_reliable(). This
can be used to enable livepatching for arm64.

Signed-off-by: Song Liu <song@kernel.org>
---
 arch/arm64/Kconfig             |  2 +-
 arch/arm64/kernel/stacktrace.c | 35 +++++++++++++++++++++++++++-------
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 213f42d5ca27..f5af6faf9e2b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -271,6 +271,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2495,4 +2496,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..280dd6839a18 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -277,22 +277,28 @@ kunwind_next(struct kunwind_state *state)
 
 typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, void *cookie);
 
-static __always_inline void
+static __always_inline int
 do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 	   void *cookie)
 {
+	int ret;
+
 	if (kunwind_recover_return_address(state))
-		return;
+		return -EINVAL;
 
 	while (1) {
-		int ret;
 
-		if (!consume_state(state, cookie))
+		ret = consume_state(state, cookie);
+		if (!ret)
 			break;
 		ret = kunwind_next(state);
 		if (ret < 0)
 			break;
 	}
+	/* Unwind terminated successfully */
+	if (ret == -ENOENT)
+		ret = 0;
+	return ret;
 }
 
 /*
@@ -324,7 +330,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			: stackinfo_get_unknown();		\
 	})
 
-static __always_inline void
+static __always_inline int
 kunwind_stack_walk(kunwind_consume_fn consume_state,
 		   void *cookie, struct task_struct *task,
 		   struct pt_regs *regs)
@@ -352,7 +358,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 
 	if (regs) {
 		if (task != current)
-			return;
+			return -EINVAL;
 		kunwind_init_from_regs(&state, regs);
 	} else if (task == current) {
 		kunwind_init_from_caller(&state);
@@ -360,7 +366,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		kunwind_init_from_task(&state, task);
 	}
 
-	do_kunwind(&state, consume_state, cookie);
+	return do_kunwind(&state, consume_state, cookie);
 }
 
 struct kunwind_consume_entry_data {
@@ -387,6 +393,21 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+			void *cookie, struct task_struct *task)
+{
+	int ret;
+
+	struct kunwind_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	ret = kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL);
+
+	return ret;
+}
+
 struct bpf_unwind_consume_entry_data {
 	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
 	void *cookie;
-- 
2.43.5


