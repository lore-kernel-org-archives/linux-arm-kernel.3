Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA82AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIURXDk/31vyLyONnKEzi5byuR3Ty4QIUpEbqaN617Y=; b=wA69yNKvOWur3AeP0gDTmh4IIr
	zWiiJaxLP7o83rlPfoPCgC+prnDyWrOyVXNm0pZ7gj18tB7uwgFO6o4iBXfiatQn6I3lqlS7CDLeF
	4RzKswfM6XaMlkQYn4UMAch5ynxY9rWc9U3YVTV9xrsY+C/957DLlNrX1H9FlM1s68E0gJcDXyn/s
	+QBe0UXKsOr1vXPxZhqX9MK1JC5/F8tTT7ZIfT8zrHG311FBpNoxyWSImd2LhGdA3oUo9B8LbPOof
	6jkktTh7X4RJIDtf9kwuJSHEgO11VlyAZ+cxhCYXFuzek0vRHxJs34NBwtQCxEEnIqC3j7lVrB2RP
	F8EhP/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhSb-0000000FbhT-1haQ;
	Wed, 21 May 2025 11:18:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhKy-0000000FafJ-1rpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:10:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62FAD25E9;
	Wed, 21 May 2025 04:10:02 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 249DD3F6A8;
	Wed, 21 May 2025 04:10:14 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: andrea.porta@suse.com,
	catalin.marinas@arm.com,
	jpoimboe@kernel.org,
	leitao@debian.org,
	linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org,
	mark.rutland@arm.com,
	mbenes@suse.cz,
	pmladek@suse.com,
	song@kernel.org,
	will@kernel.org
Subject: [PATCH 2/2] arm64: stacktrace: Implement arch_stack_walk_reliable()
Date: Wed, 21 May 2025 12:10:00 +0100
Message-Id: <20250521111000.2237470-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250521111000.2237470-1-mark.rutland@arm.com>
References: <20250521111000.2237470-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_041016_569749_905724A3 
X-CRM114-Status: GOOD (  17.66  )
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

From: Song Liu <song@kernel.org>

Add arch_stack_walk_reliable(), which will be used during kernel live
patching to detect when threads have completed executing old versions of
functions.

Note that arch_stack_walk_reliable() only needs to guarantee that it
returns an error code when it cannot provide a reliable stacktrace. It
is not required to provide a reliable stacktrace in all scenarios so
long as it returns said error code.

At present we can only reliably unwind up to an exception boundary. In
future we should be able to improve this with additional data from the
compiler (e.g. sframe).

Signed-off-by: Song Liu <song@kernel.org>
Link: https://lore.kernel.org/r/20250320171559.3423224-2-song@kernel.org
[ Mark: Simplify logic, clarify commit message ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Cc: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Song Liu <song@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig             |  2 +-
 arch/arm64/kernel/stacktrace.c | 53 +++++++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..7a3463bafb274 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -279,6 +279,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2512,4 +2513,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index f6494c0942144..acf682afbd478 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -279,21 +279,24 @@ kunwind_next(struct kunwind_state *state)
 
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
 
@@ -326,7 +329,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			: stackinfo_get_unknown();		\
 	})
 
-static __always_inline void
+static __always_inline int
 kunwind_stack_walk(kunwind_consume_fn consume_state,
 		   void *cookie, struct task_struct *task,
 		   struct pt_regs *regs)
@@ -354,7 +357,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 
 	if (regs) {
 		if (task != current)
-			return;
+			return -EINVAL;
 		kunwind_init_from_regs(&state, regs);
 	} else if (task == current) {
 		kunwind_init_from_caller(&state);
@@ -362,7 +365,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		kunwind_init_from_task(&state, task);
 	}
 
-	do_kunwind(&state, consume_state, cookie);
+	return do_kunwind(&state, consume_state, cookie);
 }
 
 struct kunwind_consume_entry_data {
@@ -389,6 +392,36 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+static __always_inline bool
+arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
+{
+	/*
+	 * At an exception boundary we can reliably consume the saved PC. We do
+	 * not know whether the LR was live when the exception was taken, and
+	 * so we cannot perform the next unwind step reliably.
+	 *
+	 * All that matters is whether the *entire* unwind is reliable, so give
+	 * up as soon as we hit an exception boundary.
+	 */
+	if (state->source == KUNWIND_SOURCE_REGS_PC)
+		return false;
+
+	return arch_kunwind_consume_entry(state, cookie);
+}
+
+noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+					      void *cookie,
+					      struct task_struct *task)
+{
+	struct kunwind_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	return kunwind_stack_walk(arch_reliable_kunwind_consume_entry, &data,
+				  task, NULL);
+}
+
 struct bpf_unwind_consume_entry_data {
 	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
 	void *cookie;
-- 
2.30.2


