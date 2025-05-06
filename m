Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3261C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oj6f5YpCj2uikDmgrdm6rHoya7jQDoGyFayg0mN06AE=; b=QzVLU5JOXXv+q55EgEIDkYyBMP
	jSNgacvdvS0op7jmc+27n02+gIVlW6CLAe8Nfkeo9/n42tzyYKkQH4Jumknkj2GkmvAhjeXazi9+L
	i4Y1BRGwBpvUInoHDuoW7jKuT/+u2TwYiuqCPYaJsG7f8zkMz/Vz1BVqRsgW4qGlWYz6jdXNTUVtG
	3/aHtbTl8DELcIvfmc+OhWRhAY5+Xkjmx1VB7t9KZ1RUIt3iHxC8tXRqnpnWAYWneQPIJTbZLWkS5
	4yb5x0Al5gZK0VwlJXGtN0UGNL01AJeW1cYLoa4u4i7UrRVxxFfB7X3kLMMDdPEEvXHpyEUBs1MyV
	6cE2ef0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOIs-0000000DH0F-3Fbe;
	Tue, 06 May 2025 19:50:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBo-0000000CUcm-1A5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21E16339;
	Tue,  6 May 2025 08:26:26 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AADE3F58B;
	Tue,  6 May 2025 08:26:33 -0700 (PDT)
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
Subject: [PATCH 19/20] arm64/fpsimd: ptrace: Gracefully handle errors
Date: Tue,  6 May 2025 16:25:22 +0100
Message-Id: <20250506152523.1107431-20-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082636_403740_7C4CC8A1 
X-CRM114-Status: GOOD (  22.68  )
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

Within sve_set_common() we do not handle error conditions correctly:

* When writing to NT_ARM_SSVE, if sme_alloc() fails, the task will be
  left with task->thread.sme_state==NULL, but TIF_SME will be set and
  task->thread.fp_type==FP_STATE_SVE. This will result in a subsequent
  null pointer dereference when the task's state is loaded or otherwise
  manipulated.

* When writing to NT_ARM_SSVE, if sve_alloc() fails, the task will be
  left with task->thread.sve_state==NULL, but TIF_SME will be set,
  PSTATE.SM will be set, and task->thread.fp_type==FP_STATE_FPSIMD.
  This is not a legitimate state, and can result in various problems,
  including a subsequent null pointer dereference and/or the task
  inheriting stale streaming mode register state the next time its state
  is loaded into hardware.

* When writing to NT_ARM_SSVE, if the VL is changed but the resultign VL
  differs from that in the header, the task will be left with TIF_SME
  set, PSTATE.SM set, but task->thread.fp_type==FP_STATE_FPSIMD. This is
  not a legitimate state, and can result in various problems as
  described above.

Avoid these problems by allocating memory earlier, and by changing the
task's saved fp_type to FP_STATE_SVE before skipping register writes due
to a change of VL. To make this simpler I've pulled the flushing of task
state earlier and moved the setting of TIF_SVE earlier -- this will be
cleared when loading FPSIMD-only state, and so moving this has no
resulting functional change. When changlnig the

Note that we only allocate the memory for SVE state when SVE register
contents are provided, avoiding unnecessary memory allocations for tasks
which only use FPSIMD.

Fixes: e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")
Fixes: baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
Fixes: 5d0a8d2fba50 ("arm64/ptrace: Ensure that SME is set up for target when writing SSVE state")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 61 ++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index cff72b420eab8..a360e52db02fa 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -892,13 +892,15 @@ static int sve_set_common(struct task_struct *target,
 	unsigned long start, end;
 	bool fpsimd;
 
+	fpsimd_flush_task_state(target);
+
 	/* Header */
 	if (count < sizeof(header))
 		return -EINVAL;
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &header,
 				 0, sizeof(header));
 	if (ret)
-		goto out;
+		return ret;
 
 	/*
 	 * Streaming SVE data is always stored and presented in SVE format.
@@ -916,7 +918,21 @@ static int sve_set_common(struct task_struct *target,
 	ret = vec_set_vector_length(target, type, header.vl,
 		((unsigned long)header.flags & ~SVE_PT_REGS_MASK) << 16);
 	if (ret)
-		goto out;
+		return ret;
+
+	/* Allocate SME storage if necessary, preserving any existing ZA/ZT state */
+	if (type == ARM64_VEC_SME) {
+		sme_alloc(target, false);
+		if (!target->thread.sme_state)
+			return -ENOMEM;
+	}
+
+	/* Allocate SVE storage if necessary, zeroing any existing SVE state */
+	if (!fpsimd) {
+		sve_alloc(target, true);
+		if (!target->thread.sve_state)
+			return -ENOMEM;
+	}
 
 	/*
 	 * Actual VL set may be different from what the user asked
@@ -930,21 +946,15 @@ static int sve_set_common(struct task_struct *target,
 		switch (type) {
 		case ARM64_VEC_SVE:
 			target->thread.svcr &= ~SVCR_SM_MASK;
+			set_tsk_thread_flag(target, TIF_SVE);
 			break;
 		case ARM64_VEC_SME:
 			target->thread.svcr |= SVCR_SM_MASK;
-
-			/*
-			 * Disable traps and ensure there is SME storage but
-			 * preserve any currently set values in ZA/ZT.
-			 */
-			sme_alloc(target, false);
 			set_tsk_thread_flag(target, TIF_SME);
 			break;
 		default:
 			WARN_ON_ONCE(1);
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
 
@@ -960,37 +970,20 @@ static int sve_set_common(struct task_struct *target,
 		target->thread.fp_type = FP_STATE_FPSIMD;
 		ret = __fpr_set(target, regset, pos, count, kbuf, ubuf,
 				SVE_PT_FPSIMD_OFFSET);
-		goto out;
+		return ret;
 	}
 
 	/* Otherwise: no registers or full SVE case. */
 
+	target->thread.fp_type = FP_STATE_SVE;
+
 	/*
 	 * If setting a different VL from the requested VL and there is
 	 * register data, the data layout will be wrong: don't even
 	 * try to set the registers in this case.
 	 */
-	if (count && vq != sve_vq_from_vl(header.vl)) {
-		ret = -EIO;
-		goto out;
-	}
-
-	/* Always zero SVE state */
-	sve_alloc(target, true);
-	if (!target->thread.sve_state) {
-		ret = -ENOMEM;
-		clear_tsk_thread_flag(target, TIF_SVE);
-		target->thread.fp_type = FP_STATE_FPSIMD;
-		goto out;
-	}
-
-	/*
-	 * Only enable SVE if we are configuring normal SVE, a system with
-	 * streaming SVE may not have normal SVE.
-	 */
-	if (type == ARM64_VEC_SVE)
-		set_tsk_thread_flag(target, TIF_SVE);
-	target->thread.fp_type = FP_STATE_SVE;
+	if (count && vq != sve_vq_from_vl(header.vl))
+		return -EIO;
 
 	BUILD_BUG_ON(SVE_PT_SVE_OFFSET != sizeof(header));
 	start = SVE_PT_SVE_OFFSET;
@@ -999,7 +992,7 @@ static int sve_set_common(struct task_struct *target,
 				 target->thread.sve_state,
 				 start, end);
 	if (ret)
-		goto out;
+		return ret;
 
 	start = end;
 	end = SVE_PT_SVE_FPSR_OFFSET(vq);
@@ -1015,8 +1008,6 @@ static int sve_set_common(struct task_struct *target,
 				 &target->thread.uw.fpsimd_state.fpsr,
 				 start, end);
 
-out:
-	fpsimd_flush_task_state(target);
 	return ret;
 }
 
-- 
2.30.2


