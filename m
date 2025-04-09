Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4910CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pQGQTbc7NI3RtV8/96ZBrzkPcmhyUfEd59r7Ax4MQc=; b=xn6k37vaRObVie620LiE0q8VKa
	eFPf+xjecUzEYGpsCaHtqUZxhfBNC/D62Z9ukSCplTVByX77Hn/L7sq0zAxN+4X5lrnu1X4DSqn82
	JYg1/P+xuBVAAZfXiMNKame+xdH1FYm3VvWex+JXUgdlFox8tBvjOOpI8F/z+Ma98zJk1xUTX2w+A
	5uvO2l+aUaHV801uYsrWz8wVeY8w7az+bp+X44dfFkzINSlqdqEibuY2aF3RdRN2TLKnajNVQQUZX
	WvUCIdjA+sE5eKb3XimFob4Mhtjdsp0Me7ELFxS1lrCTtG7F+3akC/XqzmkiPGjkDg8X0TsReDmFi
	RGwCFhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yc9-00000007wDr-2Qct;
	Wed, 09 Apr 2025 16:49:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTb-00000007uvZ-3WgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E27E21C25;
	Wed,  9 Apr 2025 09:40:35 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B3443F59E;
	Wed,  9 Apr 2025 09:40:34 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 04/13] arm64/fpsimd: Remove opportunistic freeing of SME state
Date: Wed,  9 Apr 2025 17:40:01 +0100
Message-Id: <20250409164010.3480271-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094035_922826_2C79288D 
X-CRM114-Status: GOOD (  11.38  )
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

Remove the unnecessary opportunistic freeing of the task's sme_state
when the task's SVE vector length is changed. The task's sme_state is
still freed when the SME vector length is changed.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
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


