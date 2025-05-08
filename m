Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED17C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw4g6lZ5gmagJirsmwUxXsO+NktQBVEMChD7XJJOkAc=; b=xJbcvP2kThTv9BrtjbW7v3FPa3
	ltSLZ+3TAY95iO0GUvz8zro8G6IqndkjiaaPGRfWjJpnXf6K8/yBZRDSgN5Rl30au2BJB+f5QCmet
	KzWJY7t+WAHdg5OA7335VM6VDeoLrvz5e98naS+gj6OB8VW3vq1J6+s4YVFP+Uz1zJCxITFr1L/YM
	TY6mSCcHRWdaaz03UwY8/WlVyVL6gLJHC0uXKkJDFbATzBR0Ux410Zpll4i4D3HnTTwkTMjbxMUde
	K+T4JZD4jlWy9AUaUG/gKeZNo5fRREgZMaeG62N2zJRBg3bJ8AQXt8uKbURJsIaTuvbWy2j8fN623
	wPvl4WJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1X3-00000000n7K-1xDn;
	Thu, 08 May 2025 13:43:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hf-00000000kP7-2lI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24BE106F;
	Thu,  8 May 2025 06:27:20 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1BD33F58B;
	Thu,  8 May 2025 06:27:28 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 06/24] arm64/fpsimd: Clarify sve_sync_*() functions
Date: Thu,  8 May 2025 14:26:26 +0100
Message-Id: <20250508132644.1395904-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062731_780223_D8573297 
X-CRM114-Status: GOOD (  22.13  )
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

The sve_sync_{to,from}_fpsimd*() functions are intended to
extract/insert the currently effective FPSIMD state of a task regardless
of whether the task's state is saved in FPSIMD format or SVE format.
Historically they were only used by ptrace, but sve_sync_to_fpsimd() is
now used more widely, and sve_sync_from_fpsimd_zeropad() may be used
more widely in future.

When FPSIMD/SVE state tracking was changed across commits:

  baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
  a0136be443d5 (arm64/fpsimd: Load FP state based on recorded data type")
  bbc6172eefdb ("arm64/fpsimd: SME no longer requires SVE register state")
  8c845e273104 ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")

... sve_sync_to_fpsimd() was updated to consider task->thread.fp_type
rather than the task's TIF_SVE and PSTATE.SM, but (apparently due to an
oversight) sve_sync_from_fpsimd_zeropad() was left as-is, leaving the
two inconsistent.

Due to this, sve_sync_from_fpsimd_zeropad() may copy state from
task->thread.uw.fpsimd_state into task->thread.sve_state when
task->thread.fp_type == FP_STATE_FPSIMD. This is redundant (but benign)
as task->thread.uw.fpsimd_state is the effective state that will be
restored, and task->thread.sve_state will not be consumed. For
consistency, and to avoid the redundant work, it better for
sve_sync_from_fpsimd_zeropad() to consider task->thread.fp_type alone,
matching sve_sync_to_fpsimd().

The naming of both functions is somehat unfortunate, as it is unclear
when and why they copy state. It would be better to describe them in
terms of the effective state.

Considering all of the above, clean this up:

* Adjust sve_sync_from_fpsimd_zeropad() to consider
  task->thread.fp_type.

* Update comments to clarify the intended semantics/usage. I've removed
  the description that task->thread.sve_state must have been allocated,
  as this is only necessary when task->thread.fp_type == FP_STATE_SVE,
  which itself implies that task->thread.sve_state must have been
  allocated.

* Rename the functions to more clearly indicate when/why they copy
  state:

  - sve_sync_to_fpsimd() => fpsimd_sync_from_effective_state()

  - sve_sync_from_fpsimd_zeropad => fpsimd_sync_to_effective_state_zeropad()

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  8 ++++----
 arch/arm64/kernel/fpsimd.c      | 30 ++++++++++++------------------
 arch/arm64/kernel/ptrace.c      |  6 +++---
 arch/arm64/kernel/signal.c      |  2 +-
 4 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index da1bd5b9a7e70..c9e17d093fe23 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -198,8 +198,8 @@ struct vl_info {
 
 extern void sve_alloc(struct task_struct *task, bool flush);
 extern void fpsimd_release_task(struct task_struct *task);
-extern void sve_sync_to_fpsimd(struct task_struct *task);
-extern void sve_sync_from_fpsimd_zeropad(struct task_struct *task);
+extern void fpsimd_sync_from_effective_state(struct task_struct *task);
+extern void fpsimd_sync_to_effective_state_zeropad(struct task_struct *task);
 
 extern int vec_set_vector_length(struct task_struct *task, enum vec_type type,
 				 unsigned long vl, unsigned long flags);
@@ -299,8 +299,8 @@ size_t sve_state_size(struct task_struct const *task);
 
 static inline void sve_alloc(struct task_struct *task, bool flush) { }
 static inline void fpsimd_release_task(struct task_struct *task) { }
-static inline void sve_sync_to_fpsimd(struct task_struct *task) { }
-static inline void sve_sync_from_fpsimd_zeropad(struct task_struct *task) { }
+static inline void fpsimd_sync_from_effective_state(struct task_struct *task) { }
+static inline void fpsimd_sync_to_effective_state_zeropad(struct task_struct *task) { }
 
 static inline int sve_max_virtualisable_vl(void)
 {
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e06e4d8eda49e..dd6480087683c 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -760,39 +760,33 @@ void sve_alloc(struct task_struct *task, bool flush)
 }
 
 /*
- * Ensure that task->thread.uw.fpsimd_state is up to date with respect to
- * the user task, irrespective of whether SVE is in use or not.
+ * Ensure that task->thread.uw.fpsimd_state is up to date with respect to the
+ * task's currently effective FPSIMD/SVE state.
  *
- * This should only be called by ptrace.  task must be non-runnable.
- * task->thread.sve_state must point to at least sve_state_size(task)
- * bytes of allocated kernel memory.
+ * The task's FPSIMD/SVE/SME state must not be subject to concurrent
+ * manipulation.
  */
-void sve_sync_to_fpsimd(struct task_struct *task)
+void fpsimd_sync_from_effective_state(struct task_struct *task)
 {
 	if (task->thread.fp_type == FP_STATE_SVE)
 		sve_to_fpsimd(task);
 }
 
 /*
- * Ensure that task->thread.sve_state is up to date with respect to
- * the task->thread.uw.fpsimd_state.
+ * Ensure that the task's currently effective FPSIMD/SVE state is up to date
+ * with respect to task->thread.uw.fpsimd_state, zeroing any effective
+ * non-FPSIMD (S)SVE state.
  *
- * This should only be called by ptrace to merge new FPSIMD register
- * values into a task for which SVE is currently active.
- * task must be non-runnable.
- * task->thread.sve_state must point to at least sve_state_size(task)
- * bytes of allocated kernel memory.
- * task->thread.uw.fpsimd_state must already have been initialised with
- * the new FPSIMD register values to be merged in.
+ * The task's FPSIMD/SVE/SME state must not be subject to concurrent
+ * manipulation.
  */
-void sve_sync_from_fpsimd_zeropad(struct task_struct *task)
+void fpsimd_sync_to_effective_state_zeropad(struct task_struct *task)
 {
 	unsigned int vq;
 	void *sst = task->thread.sve_state;
 	struct user_fpsimd_state const *fst = &task->thread.uw.fpsimd_state;
 
-	if (!test_tsk_thread_flag(task, TIF_SVE) &&
-	    !thread_sm_enabled(&task->thread))
+	if (task->thread.fp_type != FP_STATE_SVE)
 		return;
 
 	vq = sve_vq_from_vl(thread_get_cur_vl(&task->thread));
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 259d90f70e025..bdba106a4cf29 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -594,7 +594,7 @@ static int __fpr_get(struct task_struct *target,
 {
 	struct user_fpsimd_state *uregs;
 
-	sve_sync_to_fpsimd(target);
+	fpsimd_sync_from_effective_state(target);
 
 	uregs = &target->thread.uw.fpsimd_state;
 
@@ -626,7 +626,7 @@ static int __fpr_set(struct task_struct *target,
 	 * Ensure target->thread.uw.fpsimd_state is up to date, so that a
 	 * short copyin can't resurrect stale data.
 	 */
-	sve_sync_to_fpsimd(target);
+	fpsimd_sync_from_effective_state(target);
 
 	newstate = target->thread.uw.fpsimd_state;
 
@@ -653,7 +653,7 @@ static int fpr_set(struct task_struct *target, const struct user_regset *regset,
 	if (ret)
 		return ret;
 
-	sve_sync_from_fpsimd_zeropad(target);
+	fpsimd_sync_to_effective_state_zeropad(target);
 	fpsimd_flush_task_state(target);
 
 	return ret;
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 87890d7be8de3..e9272878dd7df 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -250,7 +250,7 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
 		&current->thread.uw.fpsimd_state;
 	int err;
 
-	sve_sync_to_fpsimd(current);
+	fpsimd_sync_from_effective_state(current);
 
 	/* copy the FP and status/control registers */
 	err = __copy_to_user(ctx->vregs, fpsimd->vregs, sizeof(fpsimd->vregs));
-- 
2.30.2


