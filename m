Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89E606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TLXvaH1U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib2c4A+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WUGVc7xGhesi9ft5V8dRkv2WnCKFYSeZ1vC2X2DJvP4=; b=TLXvaH1UXm478S
	D/KHAPhOW5ppCaEVWk5C0wl4Ic0k4P/Mwi7Mln0eISd1C4h2KmwheuNk8jnYrYs+BdwUmONyR6MLv
	pLLhQc3la3QwjDPj4DIc+2biHiI/BWmE5X+C3CTm+yWCdQni6o/eBxUwvc2QoMBEarNEvLeF4xRGy
	ZlYHFwf0KEaOsNcsCtDGVHk4JyZ9jCqOElEUTUYf8ms0XSJjWCvFze/MYCNWs7RIQtd46EK5LnucP
	U38Y7/sDtdjFrSFV412WtLEmWK63FUSZhC28FVnq694MgRTYmbDp9QgJPtmjmw3a56ith+2x02MPN
	zpcY9j6FuQIU5IFuS1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQg-000000096hA-061J;
	Thu, 05 Nov 2026 13:22:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQZ-000000096di-3pyu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A451943F81;
	Thu,  5 Nov 2026 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADC91F00A15;
	Thu,  5 Nov 2026 13:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884971;
	bh=WUGVc7xGhesi9ft5V8dRkv2WnCKFYSeZ1vC2X2DJvP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ib2c4A+P31yKpGkbCoaMlHGkN+xELYUBo1yc1OWMWo204tIUE3AdcTqoMvKaq3t2L
	 wXNREBWCZL2RFcsUsT+yTW+ao0/wXhfC7SM3VcVuLtzXwCWz/FD9c+QYv0DwCbqFlu
	 1GUPimWe53wlP/3S8QC5UsR54VzxnEQIVpcvLlNayZjboSU/171+3EYiRgk6+/gM/U
	 89DVAuThANUTq+5KhURcuX3wd/tuI66866/fnDSJGHA8uOnke5L10I5I4lcwDJoTjs
	 WDSFSkFptyc6CvEYvinxqjLVGw+62kQuICmYivzdSC2D+RsaVFyfzpyPQnij/a9Uwx
	 ZdrCSLDkBoWFw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 13:00:14 +0000
Subject: [PATCH v2 3/3] arm64/gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-gcs-store-gcscre0-v2-3-954d5bffd69f@kernel.org>
References: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
In-Reply-To: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9811; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7QdKKfZioNu6hZo5aZjAILbFEIe0otN5H3E9/jrJdRI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeNCtzhT2TkfF848fe01CvN/dF4SI+Qy6+0u2bG/ilL
 yQ8Wnu8o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPxX8nwV3SO4UzWsgfpD77b
 N1gqTb5/vE60VnKO7O/kz47RHm2vChn+57xtSVPUlnXuvlDcdfr5RbXqHtY5xrt3TKpo2eQ7l12
 LBwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently we track which GCS features are enabled by storing the mode
bits set by userspace in the task struct, rather than a value for use
with the hardware.  While this is the value needed by most of the code
the main place that needs the value configured in the hardware is in the
context switch path which is the most performance sensitive, everything
else that works with the flags is much more of a slow path.

Since there is a direct mapping between mode bits and bits in
GCSCRE0_EL1, the register that controls these features for EL0,
it is easy to translate between the two ways of storing the value so
refactor to store the GCSCRE0_EL1 which we need in the hot path and
translate into the userspace flags as needed.  Provide helpers
gcs_get_el0_mode() and gcs_set_el0_mode() for reading and writing the
mode that wrap up the translation for all the users which replace access
to the value stored in the task struct. Move the update of the hardware
register when updating the state for current into the same function to
avoid missing updates.

Since the context switch path is now just a single register write make it
unconditional, avoiding the need for branches.

This means that kernel threads will now write 0 instead of GCSCRE0_EL1_nTR
to GCSCRE0_EL1, since they should not be executing any code at EL0 this
should have no functional impact.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h       | 10 ++++-----
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/kernel/process.c        | 11 +++++-----
 arch/arm64/kernel/ptrace.c         |  4 ++--
 arch/arm64/kernel/signal.c         |  6 +++---
 arch/arm64/mm/gcs.c                | 43 +++++++++++++++++++++++++-------------
 6 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 3e6eeeebd282..7811b072b8a2 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -56,12 +56,13 @@ static inline u64 gcsss2(void)
 
 #ifdef CONFIG_ARM64_GCS
 
-static inline bool task_gcs_el0_enabled(struct task_struct *task)
+static inline bool task_gcs_el0_enabled(const struct task_struct *task)
 {
-	return task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE;
+	return task->thread.gcscre0_el1 & GCSCRE0_EL1_PCRSEL;
 }
 
-void gcs_set_el0_mode(struct task_struct *task);
+void gcs_set_el0_mode(struct task_struct *task, u64 flags);
+u64 gcs_get_el0_mode(const struct task_struct *task);
 int gcs_check_locked(struct task_struct *task, unsigned long new_val);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
@@ -146,12 +147,11 @@ static inline u64 pop_user_gcs(int *err)
 
 #else
 
-static inline bool task_gcs_el0_enabled(struct task_struct *task)
+static inline bool task_gcs_el0_enabled(const struct task_struct *task)
 {
 	return false;
 }
 
-static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
 static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 481f1999f7c1..a6967ab1d267 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -196,7 +196,7 @@ struct thread_struct {
 	u64			tpidr2_el0;
 	u64			por_el0;
 #ifdef CONFIG_ARM64_GCS
-	unsigned int		gcs_el0_mode;
+	u64			gcscre0_el1;
 	unsigned int		gcs_el0_locked;
 	u64			gcspr_el0;
 	u64			gcs_base;
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42b15b0c069f..9ef21d031de0 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -293,9 +293,10 @@ static void flush_gcs(void)
 	current->thread.gcspr_el0 = 0;
 	current->thread.gcs_base = 0;
 	current->thread.gcs_size = 0;
-	current->thread.gcs_el0_mode = 0;
 	current->thread.gcs_el0_locked = 0;
-	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
+	current->thread.gcscre0_el1 = GCSCRE0_EL1_nTR;
+
+	write_sysreg_s(current->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
 	write_sysreg_s(0, SYS_GCSPR_EL0);
 }
 
@@ -310,7 +311,7 @@ static int copy_thread_gcs(struct task_struct *p,
 	p->thread.gcs_base = 0;
 	p->thread.gcs_size = 0;
 
-	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
+	p->thread.gcscre0_el1 = current->thread.gcscre0_el1;
 	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;
 
 	gcs = gcs_alloc_thread_stack(p, args);
@@ -610,9 +611,7 @@ static void gcs_thread_switch(struct task_struct *next)
 	/* GCSPR_EL0 is always readable */
 	gcs_preserve_current_state();
 	write_sysreg_s(next->thread.gcspr_el0, SYS_GCSPR_EL0);
-
-	if (current->thread.gcs_el0_mode != next->thread.gcs_el0_mode)
-		gcs_set_el0_mode(next);
+	write_sysreg_s(next->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
 
 	/*
 	 * Ensure that GCS memory effects of the 'prev' thread are
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 7405c76724bf..98e93998f5c3 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1568,7 +1568,7 @@ static int poe_set(struct task_struct *target, const struct
 static void task_gcs_to_user(struct user_gcs *user_gcs,
 			     const struct task_struct *target)
 {
-	user_gcs->features_enabled = target->thread.gcs_el0_mode;
+	user_gcs->features_enabled = gcs_get_el0_mode(target);
 	user_gcs->features_locked = target->thread.gcs_el0_locked;
 	user_gcs->gcspr_el0 = target->thread.gcspr_el0;
 }
@@ -1576,7 +1576,7 @@ static void task_gcs_to_user(struct user_gcs *user_gcs,
 static void task_gcs_from_user(struct task_struct *target,
 			       const struct user_gcs *user_gcs)
 {
-	target->thread.gcs_el0_mode = user_gcs->features_enabled;
+	gcs_set_el0_mode(target, user_gcs->features_enabled);
 	target->thread.gcs_el0_locked = user_gcs->features_locked;
 	target->thread.gcspr_el0 = user_gcs->gcspr_el0;
 }
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 80398ac83c3b..9d0aabd8ee23 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -718,6 +718,7 @@ static int preserve_gcs_context(struct gcs_context __user *ctx)
 {
 	int err = 0;
 	u64 gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+	u64 mode = gcs_get_el0_mode(current);
 
 	/*
 	 * If GCS is enabled we will add a cap token to the frame,
@@ -733,8 +734,7 @@ static int preserve_gcs_context(struct gcs_context __user *ctx)
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
 	__put_user_error(gcspr, &ctx->gcspr, err);
 	__put_user_error(0, &ctx->reserved, err);
-	__put_user_error(current->thread.gcs_el0_mode,
-			 &ctx->features_enabled, err);
+	__put_user_error(mode, &ctx->features_enabled, err);
 
 	return err;
 }
@@ -1066,7 +1066,7 @@ static int gcs_restore_signal(void)
 	if (!system_supports_gcs())
 		return 0;
 
-	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
+	if (!task_gcs_el0_enabled(current))
 		return 0;
 
 	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 84add924dc60..a4aa1e453fbd 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -120,29 +120,43 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
 	return addr;
 }
 
-/*
- * Apply the GCS mode configured for the specified task to the
- * hardware.
- */
-void gcs_set_el0_mode(struct task_struct *task)
+void gcs_set_el0_mode(struct task_struct *task, u64 flags)
 {
 	u64 gcscre0_el1 = GCSCRE0_EL1_nTR;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE)
+	if (flags & PR_SHADOW_STACK_ENABLE)
 		gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_WRITE)
+	if (flags & PR_SHADOW_STACK_WRITE)
 		gcscre0_el1 |= GCSCRE0_EL1_STREn;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_PUSH)
+	if (flags & PR_SHADOW_STACK_PUSH)
 		gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
 
-	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
+	WRITE_ONCE(task->thread.gcscre0_el1, gcscre0_el1);
+	if (task == current)
+		write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
+}
+
+u64 gcs_get_el0_mode(const struct task_struct *task)
+{
+	u64 flags = 0;
+
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_PCRSEL)
+		flags |= PR_SHADOW_STACK_ENABLE;
+
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_STREn)
+		flags |= PR_SHADOW_STACK_WRITE;
+
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_PUSHMEn)
+		flags |= PR_SHADOW_STACK_PUSH;
+
+	return flags;
 }
 
 int gcs_check_locked(struct task_struct *task, unsigned long new_val)
 {
-	unsigned long cur_val = task->thread.gcs_el0_mode;
+	unsigned long cur_val = gcs_get_el0_mode(task);
 
 	cur_val &= task->thread.gcs_el0_locked;
 	new_val &= task->thread.gcs_el0_locked;
@@ -211,9 +225,7 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 				       SYS_GCSPR_EL0);
 	}
 
-	task->thread.gcs_el0_mode = arg;
-	if (task == current)
-		gcs_set_el0_mode(task);
+	gcs_set_el0_mode(task, arg);
 
 	return 0;
 }
@@ -221,13 +233,16 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 int arch_get_shadow_stack_status(struct task_struct *task,
 				 unsigned long __user *arg)
 {
+	u64 mode;
+
 	if (!system_supports_gcs())
 		return -EINVAL;
 
 	if (is_compat_thread(task_thread_info(task)))
 		return -EINVAL;
 
-	return put_user(task->thread.gcs_el0_mode, arg);
+	mode = gcs_get_el0_mode(task);
+	return put_user(mode, arg);
 }
 
 int arch_lock_shadow_stack_status(struct task_struct *task,

-- 
2.47.3


