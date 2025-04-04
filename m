Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903EAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA/RKwHC7mS+0+Bt1pgJ1xABFDPHflt6LFD6Rkl82dw=; b=PLk6Nh78Fwp7QIqiJc0KFmBo1m
	mCL47kGJQMP2vchaK0wuskszbZ5mI11j+FkXWZIuG1ZNr+EN0ZPNOlrZsw2OIRIP6NuhCkUootxh4
	hfpn7a4zqKCV8Sw0AyVVIKxtWdjF1qdOKaoXv3CyHOWfCXxZZ7ur2QqN9Ub9HrC75AMwfiliw1eCk
	4BTW16uvU6UZknnRKGWj7xw4CaKFWPsqGCgjbG1mKedHshfqsyQRQqm9ja3mLzWVqVH4Z0ifnLApB
	6n4blD/EaGj2oEliCUI39gBFrKkJiJed7B2ASbci1cKO9GbCIvWy+R/oSYhxqBMIdjJ995wpgi3wg
	ulP+mqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lGq-0000000CT8T-1VsH;
	Fri, 04 Apr 2025 17:56:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l64-0000000CRPH-2xrn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB0B1515;
	Fri,  4 Apr 2025 10:44:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABF1C3F63F;
	Fri,  4 Apr 2025 10:44:50 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 05/14] arm64/fpsimd: Remove opportunistic freeing of SME state
Date: Fri,  4 Apr 2025 18:44:26 +0100
Message-Id: <20250404174435.3288106-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104452_789971_885D1DAA 
X-CRM114-Status: GOOD (  10.49  )
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

When a task's SVE vector length (NSVL) is changed, and the task happens
to have SVCR.{SM,ZA}=={0,0}, vec_set_vector_length() opportunistically
frees the task's sme_state and clears TIF_SME.

The opportunistic freeing was added with no rationale in commit:

  d4d5be94a8787242 ("arm64/fpsimd: Ensure SME storage is allocated after SVE VL changes")

That commit fixed an unrelated problem where the task's sve_state was
freed while it could be used to store streaming mode register state,
where the fix was to re-allocate the task's sve_state.

There is no need to free and/or reallocate the task's sme_state when the
SVE vector length changes, and there is no need to clear TIF_SME. Given
the SME vector length (SVL) doesn't change, the task's sme_state remains
correctly sized.

Remove the unnecessary opportunistic freeing of the task's sme_state.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 757445d72e5b7..128774015772a 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -868,19 +868,10 @@ int vec_set_vector_length(struct task_struct *task, enum vec_type type,
 		task->thread.fp_type = FP_STATE_FPSIMD;
 	}
 
-	if (system_supports_sme()) {
-		if (type == ARM64_VEC_SME ||
-		    !(task->thread.svcr & (SVCR_SM_MASK | SVCR_ZA_MASK))) {
-			/*
-			 * We are changing the SME VL or weren't using
-			 * SME anyway, discard the state and force a
-			 * reallocation.
-			 */
-			task->thread.svcr &= ~(SVCR_SM_MASK |
-					       SVCR_ZA_MASK);
-			clear_tsk_thread_flag(task, TIF_SME);
-			free_sme = true;
-		}
+	if (system_supports_sme() && type == ARM64_VEC_SME) {
+		task->thread.svcr &= ~(SVCR_SM_MASK | SVCR_ZA_MASK);
+		clear_tsk_thread_flag(task, TIF_SME);
+		free_sme = true;
 	}
 
 	if (task == current)
-- 
2.30.2


