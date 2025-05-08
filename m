Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F91C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aeXouU1geeoD6NhHxG9fjK96sMqZRlrjOL+jn1ZP9w=; b=fgVmTjHD0fPaFD6rv2n5tNM1Xs
	tHLuYv0JL/aUV90vTWrlOuNITX4WGVAgrqcKFVh2dtbkFU+v8Kh9l5qVYvwRqid7ut0ob2lJmFTRt
	L3p6XOwX4TZHuXAl7jPPr6PBg5v7g4B4l7Pey8F2uY+wFDYX7nnXVd4HAHTVB1dHXVXMlMk50jSgP
	a6o6qmrlmAZJtVJxPDRORgQakffINoXdgIr+jPiKEQkM2qGKYXFnm7gv913absSsu+H63Y19Qk8nE
	OqmeHujwADDdl8xRdPoK4n4fMDQxHNWqKKijRa4ivp03GClByLchnJWsBarFVg9olnva2pqzE7d4D
	+RHvd7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1oQ-00000000qSf-2pmH;
	Thu, 08 May 2025 14:01:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1I4-00000000kWX-3wA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23710106F;
	Thu,  8 May 2025 06:27:46 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2250E3F58B;
	Thu,  8 May 2025 06:27:53 -0700 (PDT)
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
Subject: [PATCH v2 15/24] arm64/fpsimd: ptrace/prctl: Ensure VL changes leave task in a valid state
Date: Thu,  8 May 2025 14:26:35 +0100
Message-Id: <20250508132644.1395904-16-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062757_066271_E6FECB9C 
X-CRM114-Status: GOOD (  27.11  )
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

Currently, vec_set_vector_length() can manipulate a task into an invalid
state as a result of a prctl/ptrace syscall which changes the SVE/SME
vector length, resulting in several problems:

(1) When changing the SVE vector length, if the task initially has
    PSTATE.ZA==1, and sve_alloc() fails to allocate memory, the task
    will be left with PSTATE.ZA==1 and sve_state==NULL. This is not a
    legitimate state, and could result in a subsequent null pointer
    dereference.

(2) When changing the SVE vector length, if the task initially has
    PSTATE.SM==1, the task will be left with PSTATE.SM==1 and
    fp_type==FP_STATE_FPSIMD. Streaming mode state always needs to be
    saved in SVE format, so this is not a legitimate state.

    Attempting to restore this state may cause a task to erroneously
    inherit stale streaming mode predicate registers and FFR contents,
    behaving non-deterministically and potentially leaving information
    from another task.

    While in this state, reads of the NT_ARM_SSVE regset will indicate
    that the registers are not stored in SVE format. For the NT_ARM_SSVE
    regset specifically, debuggers interpret this as meaning that
    PSTATE.SM==0.

(3) When changing the SME vector length, if the task initially has
    PSTATE.SM==1, the lower 128 bits of task's streaming mode vector
    state will be migrated to non-streaming mode, rather than these bits
    being zeroed as is usually the case for changes to PSTATE.SM.

To fix the first issue, we can eagerly allocate the new sve_state and
sme_state before modifying the task. This makes it possible to handle
memory allocation failure without modifying the task state at all, and
removes the need to clear TIF_SVE and TIF_SME.

To fix the second issue, we either need to clear PSTATE.SM or not change
the saved fp_type. Given we're going to eagerly allocate sve_state and
sme_state, the simplest option is to preserve PSTATE.SM and the saves
fp_type, and consistently truncate the SVE state. This ensures that the
task always stays in a valid state, and by virtue of not exiting
streaming mode, this also sidesteps the third issue.

I believe these changes should not be problematic for realistic usage:

* When the SVE/SME vector length is changed via prctl(), syscall entry
  will have cleared PSTATE.SM. Unless the task's state has been
  manipulated via ptrace after entry, the task will have PSTATE.SM==0.

* When the SVE/SME vector length is changed via a write to the
  NT_ARM_SVE or NT_ARM_SSVE regsets, PSTATE.SM will be forced
  immediately after the length change, and new vector state will be
  copied from userspace.

* When the SME vector length is changed via a write to the NT_ARM_ZA
  regset, the (S)SVE state is clobbered today, so anyone who cares about
  the specific state would need to install this after writing to the
  NT_ARM_ZA regset.

As we need to free the old SVE state while TIF_SVE may still be set, we
cannot use sve_free(), and using kfree() directly makes it clear that
the free pairs with the subsequent assignment. As this leaves sve_free()
unused, I've removed the existing sve_free() and renamed __sve_free() to
mirror sme_free().

Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
Fixes: baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 Documentation/arch/arm64/sme.rst |   2 +-
 arch/arm64/kernel/fpsimd.c       | 137 ++++++++++++++++---------------
 2 files changed, 73 insertions(+), 66 deletions(-)

diff --git a/Documentation/arch/arm64/sme.rst b/Documentation/arch/arm64/sme.rst
index 1c1e48d8bd1a5..4cb38330e7046 100644
--- a/Documentation/arch/arm64/sme.rst
+++ b/Documentation/arch/arm64/sme.rst
@@ -241,7 +241,7 @@ prctl(PR_SME_SET_VL, unsigned long arg)
       length, or calling PR_SME_SET_VL with the PR_SME_SET_VL_ONEXEC flag,
       does not constitute a change to the vector length for this purpose.
 
-    * Changing the vector length causes PSTATE.ZA and PSTATE.SM to be cleared.
+    * Changing the vector length causes PSTATE.ZA to be cleared.
       Calling PR_SME_SET_VL with vl equal to the thread's current vector
       length, or calling PR_SME_SET_VL with the PR_SME_SET_VL_ONEXEC flag,
       does not constitute a change to the vector length for this purpose.
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index faeedaab0558e..9c0d1068e7f28 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -724,23 +724,12 @@ void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__always_unused p)
 }
 
 #ifdef CONFIG_ARM64_SVE
-/*
- * Call __sve_free() directly only if you know task can't be scheduled
- * or preempted.
- */
-static void __sve_free(struct task_struct *task)
+static void sve_free(struct task_struct *task)
 {
 	kfree(task->thread.sve_state);
 	task->thread.sve_state = NULL;
 }
 
-static void sve_free(struct task_struct *task)
-{
-	WARN_ON(test_tsk_thread_flag(task, TIF_SVE));
-
-	__sve_free(task);
-}
-
 /*
  * Ensure that task->thread.sve_state is allocated and sufficiently large.
  *
@@ -801,10 +790,73 @@ void fpsimd_sync_to_effective_state_zeropad(struct task_struct *task)
 	__fpsimd_to_sve(sst, fst, vq);
 }
 
+static int change_live_vector_length(struct task_struct *task,
+				     enum vec_type type,
+				     unsigned long vl)
+{
+	unsigned int sve_vl = task_get_sve_vl(task);
+	unsigned int sme_vl = task_get_sme_vl(task);
+	void *sve_state = NULL, *sme_state = NULL;
+
+	if (type == ARM64_VEC_SME)
+		sme_vl = vl;
+	else
+		sve_vl = vl;
+
+	/*
+	 * Allocate the new sve_state and sme_state before freeing the old
+	 * copies so that allocation failure can be handled without needing to
+	 * mutate the task's state in any way.
+	 *
+	 * Changes to the SVE vector length must not discard live ZA state or
+	 * clear PSTATE.ZA, as userspace code which is unaware of the AAPCS64
+	 * ZA lazy saving scheme may attempt to change the SVE vector length
+	 * while unsaved/dormant ZA state exists.
+	 */
+	sve_state = kzalloc(__sve_state_size(sve_vl, sme_vl), GFP_KERNEL);
+	if (!sve_state)
+		goto out_mem;
+
+	if (type == ARM64_VEC_SME) {
+		sme_state = kzalloc(__sme_state_size(sme_vl), GFP_KERNEL);
+		if (!sme_state)
+			goto out_mem;
+	}
+
+	if (task == current)
+		fpsimd_save_and_flush_current_state();
+	else
+		fpsimd_flush_task_state(task);
+
+	/*
+	 * Always preserve PSTATE.SM and the effective FPSIMD state, zeroing
+	 * other SVE state.
+	 */
+	fpsimd_sync_from_effective_state(task);
+	task_set_vl(task, type, vl);
+	kfree(task->thread.sve_state);
+	task->thread.sve_state = sve_state;
+	fpsimd_sync_to_effective_state_zeropad(task);
+
+	if (type == ARM64_VEC_SME) {
+		task->thread.svcr &= ~SVCR_ZA_MASK;
+		kfree(task->thread.sme_state);
+		task->thread.sme_state = sme_state;
+	}
+
+	return 0;
+
+out_mem:
+	kfree(sve_state);
+	kfree(sme_state);
+	return -ENOMEM;
+}
+
 int vec_set_vector_length(struct task_struct *task, enum vec_type type,
 			  unsigned long vl, unsigned long flags)
 {
-	bool free_sme = false;
+	bool onexec = flags & PR_SVE_SET_VL_ONEXEC;
+	bool inherit = flags & PR_SVE_VL_INHERIT;
 
 	if (flags & ~(unsigned long)(PR_SVE_VL_INHERIT |
 				     PR_SVE_SET_VL_ONEXEC))
@@ -824,62 +876,17 @@ int vec_set_vector_length(struct task_struct *task, enum vec_type type,
 
 	vl = find_supported_vector_length(type, vl);
 
-	if (flags & (PR_SVE_VL_INHERIT |
-		     PR_SVE_SET_VL_ONEXEC))
+	if (!onexec && vl != task_get_vl(task, type)) {
+		if (change_live_vector_length(task, type, vl))
+			return -ENOMEM;
+	}
+
+	if (onexec || inherit)
 		task_set_vl_onexec(task, type, vl);
 	else
 		/* Reset VL to system default on next exec: */
 		task_set_vl_onexec(task, type, 0);
 
-	/* Only actually set the VL if not deferred: */
-	if (flags & PR_SVE_SET_VL_ONEXEC)
-		goto out;
-
-	if (vl == task_get_vl(task, type))
-		goto out;
-
-	/*
-	 * To ensure the FPSIMD bits of the SVE vector registers are preserved,
-	 * write any live register state back to task_struct, and convert to a
-	 * regular FPSIMD thread.
-	 */
-	if (task == current) {
-		get_cpu_fpsimd_context();
-
-		fpsimd_save_user_state();
-	}
-
-	fpsimd_flush_task_state(task);
-	if (test_and_clear_tsk_thread_flag(task, TIF_SVE) ||
-	    thread_sm_enabled(&task->thread)) {
-		fpsimd_sync_from_effective_state(task);
-		task->thread.fp_type = FP_STATE_FPSIMD;
-	}
-
-	if (system_supports_sme() && type == ARM64_VEC_SME) {
-		task->thread.svcr &= ~(SVCR_SM_MASK | SVCR_ZA_MASK);
-		clear_tsk_thread_flag(task, TIF_SME);
-		free_sme = true;
-	}
-
-	if (task == current)
-		put_cpu_fpsimd_context();
-
-	task_set_vl(task, type, vl);
-
-	/*
-	 * Free the changed states if they are not in use, SME will be
-	 * reallocated to the correct size on next use and we just
-	 * allocate SVE now in case it is needed for use in streaming
-	 * mode.
-	 */
-	sve_free(task);
-	sve_alloc(task, true);
-
-	if (free_sme)
-		sme_free(task);
-
-out:
 	update_tsk_thread_flag(task, vec_vl_inherit_flag(type),
 			       flags & PR_SVE_VL_INHERIT);
 
@@ -1175,7 +1182,7 @@ void __init sve_setup(void)
  */
 void fpsimd_release_task(struct task_struct *dead_task)
 {
-	__sve_free(dead_task);
+	sve_free(dead_task);
 	sme_free(dead_task);
 }
 
-- 
2.30.2


