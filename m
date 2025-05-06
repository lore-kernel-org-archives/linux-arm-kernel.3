Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E609C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQeX9/v0ybI3+WthWo6rGRYYp3D76tMJ4Vp6Weerezs=; b=1r/8OpF/xVsyerz8YVzwWH0EuP
	kfDx52TkKjL0PLZhEXQl9mrUZeW/vdKRCTL18Sa9ZpXHfH05sa+ov2syWEP276FxiKGuFwboc69D4
	7vpBY8IK0QmDnhEM5S1faH6Nt8i5ifsTyRzU3J+Iqc4c4RO72x5y45T4Fa0xxAZQtf+XQUlhZfYTA
	WG0GUgLNOE7T+SgfNQacNcmxC2ch4tPqB8A+7748BfSu0aikgkGekXJi4hIQt7xZkUaOWbDb4sUHs
	UKHkEfCwxVCeJaszBaJnvNBlg643Lj0hw5fJcULAxiIVeaPuGg8UbuxXYBLTu5VxpXcyuB/t8Ee26
	d8ZwvsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNpk-0000000DDSy-3AnW;
	Tue, 06 May 2025 19:20:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKB5-0000000CUKR-2CN5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:25:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A72921007;
	Tue,  6 May 2025 08:25:39 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF9443F58B;
	Tue,  6 May 2025 08:25:46 -0700 (PDT)
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
Subject: [PATCH 05/20] arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE
Date: Tue,  6 May 2025 16:25:08 +0100
Message-Id: <20250506152523.1107431-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082551_647376_BC055E4D 
X-CRM114-Status: GOOD (  25.06  )
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

Partial writes to the NT_ARM_SVE and NT_ARM_SSVE regsets using an
payload are handled inconsistently and non-deterministically. A comment
within sve_set_common() indicates that we intended that a partial write
would preserve any effective FPSIMD/SVE state which was not overwritten,
but this has never worked consistently, and during syscalls the FPSIMD
vector state may be non-deterministically preserved and may be
erroneously migrated between streaming and non-streaming SVE modes.

The simplest fix is to handle a partial write by consistently zeroing
the remaining state. As detailed below I do not believe this will
adversely affect any real usage.

Neither GDB nor LLDB attempt partial writes to these regsets, and the
documentation (in Documentation/arch/arm64/sve.rst) has always indicated
that state preservation was not guaranteed, as is says:

| The effect of writing a partial, incomplete payload is unspecified.

When the logic was originally introduced in commit:

  43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")

... there were two potential behaviours, depending on TIF_SVE:

* When TIF_SVE was clear, all SVE state would be zeroed, excluding the
  low 128 bits of vectors shared with FPSIMD, FPSR, and FPCR.

* When TIF_SVE was set, all SVE state would be zeroed, including the
  low 128 bits of vectors shared with FPSIMD, but excluding FPSR and
  FPCR.

Note that as writing to NT_ARM_SVE would set TIF_SVE, partial writes to
NT_ARM_SVE would not be idempotent, and if a first write preserved the
low 128 bits, a subsequent (potentially identical) partial write would
discard the low 128 bits.

When support for the NT_ARM_SSVE regset was added in commit:

  e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")

... the above behaviour was retained for writes to the NT_ARM_SVE
regset, though writes to the NT_ARM_SSVE would always zero the SVE
registers and would not inherit FPSIMD register state. This happened as
fpsimd_sync_to_sve() only copied the FPSIMD regs when TIF_SVE was clear
and PSTATE.SM==0.

Subsequently, when FPSIMD/SVE state tracking was changed across commits:

  baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
  a0136be443d5 (arm64/fpsimd: Load FP state based on recorded data type")
  bbc6172eefdb ("arm64/fpsimd: SME no longer requires SVE register state")
  8c845e273104 ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")

... there was no corresponding update to the ptrace code, nor to
fpsimd_sync_to_sve(), which stil considers TIF_SVE and PSTATE.SM rather
than the saved fp_type. The saved state can be in the FPSIMD format
regardless of whether TIF_SVE is set or clear, and the saved type can
change non-deterministically during syscalls. Consequently a subsequent
partial write to the NT_ARM_SVE or NT_ARM_SSVE regsets may
non-deterministically preserve the FPSIMD state, and may migrate this
state between streaming and non-streaming modes.

Clean this up by never attempting to preserve ANY state when writing an
SVE payload to the NT_ARM_SVE/NT_ARM_SSVE regsets, zeroing all relevant
state including FPSR and FPCR. This simplifies the code, makes the
behaviour deterministic, and avoids migrating state between streaming
and non-streaming modes. As above, I do not believe this should
adversely affect existing userspace applications.

At the same time, remove fpsimd_sync_to_sve(). It is no longer used,
doesn't do what its documentation implies, and gets in the way of other
cleanups and fixes.

Fixes: 43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 -
 arch/arm64/kernel/fpsimd.c      | 15 ---------------
 arch/arm64/kernel/ptrace.c      | 26 +++++++++-----------------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 11b9c6a5e0377..da1bd5b9a7e70 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -198,7 +198,6 @@ struct vl_info {
 
 extern void sve_alloc(struct task_struct *task, bool flush);
 extern void fpsimd_release_task(struct task_struct *task);
-extern void fpsimd_sync_to_sve(struct task_struct *task);
 extern void sve_sync_to_fpsimd(struct task_struct *task);
 extern void sve_sync_from_fpsimd_zeropad(struct task_struct *task);
 
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 9f1890d692dfc..e06e4d8eda49e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -759,21 +759,6 @@ void sve_alloc(struct task_struct *task, bool flush)
 		kzalloc(sve_state_size(task), GFP_KERNEL);
 }
 
-/*
- * Ensure that task->thread.sve_state is up to date with respect to
- * the user task, irrespective of when SVE is in use or not.
- *
- * This should only be called by ptrace.  task must be non-runnable.
- * task->thread.sve_state must point to at least sve_state_size(task)
- * bytes of allocated kernel memory.
- */
-void fpsimd_sync_to_sve(struct task_struct *task)
-{
-	if (!test_tsk_thread_flag(task, TIF_SVE) &&
-	    !thread_sm_enabled(&task->thread))
-		fpsimd_to_sve(task);
-}
-
 /*
  * Ensure that task->thread.uw.fpsimd_state is up to date with respect to
  * the user task, irrespective of whether SVE is in use or not.
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f79b0d5f71ac9..259d90f70e025 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -910,8 +910,6 @@ static int sve_set_common(struct task_struct *target,
 
 	/* Enter/exit streaming mode */
 	if (system_supports_sme()) {
-		u64 old_svcr = target->thread.svcr;
-
 		switch (type) {
 		case ARM64_VEC_SVE:
 			target->thread.svcr &= ~SVCR_SM_MASK;
@@ -931,23 +929,20 @@ static int sve_set_common(struct task_struct *target,
 			ret = -EINVAL;
 			goto out;
 		}
-
-		/*
-		 * If we switched then invalidate any existing SVE
-		 * state and ensure there's storage.
-		 */
-		if (target->thread.svcr != old_svcr)
-			sve_alloc(target, true);
 	}
 
+	/* Always zero V regs, FPSR, and FPCR */
+	memset(&current->thread.uw.fpsimd_state, 0,
+	       sizeof(current->thread.uw.fpsimd_state));
+
 	/* Registers: FPSIMD-only case */
 
 	BUILD_BUG_ON(SVE_PT_FPSIMD_OFFSET != sizeof(header));
 	if ((header.flags & SVE_PT_REGS_MASK) == SVE_PT_REGS_FPSIMD) {
-		ret = __fpr_set(target, regset, pos, count, kbuf, ubuf,
-				SVE_PT_FPSIMD_OFFSET);
 		clear_tsk_thread_flag(target, TIF_SVE);
 		target->thread.fp_type = FP_STATE_FPSIMD;
+		ret = __fpr_set(target, regset, pos, count, kbuf, ubuf,
+				SVE_PT_FPSIMD_OFFSET);
 		goto out;
 	}
 
@@ -966,6 +961,7 @@ static int sve_set_common(struct task_struct *target,
 		goto out;
 	}
 
+	/* Always zero SVE state */
 	sve_alloc(target, true);
 	if (!target->thread.sve_state) {
 		ret = -ENOMEM;
@@ -975,13 +971,9 @@ static int sve_set_common(struct task_struct *target,
 	}
 
 	/*
-	 * Ensure target->thread.sve_state is up to date with target's
-	 * FPSIMD regs, so that a short copyin leaves trailing
-	 * registers unmodified.  Only enable SVE if we are
-	 * configuring normal SVE, a system with streaming SVE may not
-	 * have normal SVE.
+	 * Only enable SVE if we are configuring normal SVE, a system with
+	 * streaming SVE may not have normal SVE.
 	 */
-	fpsimd_sync_to_sve(target);
 	if (type == ARM64_VEC_SVE)
 		set_tsk_thread_flag(target, TIF_SVE);
 	target->thread.fp_type = FP_STATE_SVE;
-- 
2.30.2


