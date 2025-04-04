Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvEJXAwiIYvDdL2Da1ynSRl36Og8jx7xSRRU2gHkMLs=; b=d5D81KyNiqYdVEHKdjH3spApex
	84yxd7lfial74HfS5ZyJX+pVSMvOQI0oU7xChN9w6TjPX/3hVfQ0cinSNmTlngD7HdoJdA8nX5hFi
	RrBRBZn7QgK+tQPfZSJy+bCsmRindu6B/fjR+qvJfEESwUj9/74yMOKAv3D+XYPn2dIzGxCT0AFR2
	8ozye/l6j8zobGF2n7PAw/tNADPhu4rnDjQmybVlvnQ23mcm2ZkRR3YXrbESij5voJni6ZKRQrZzg
	mv7z6vXpPOS5BjMtt61D+v/yGEGW3JY6FAs4Obs+5a7ochfDc9BtiyBosSLt/sxBAWGnEus2Z2VDH
	fsfAoUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lF1-0000000CSeQ-2GnZ;
	Fri, 04 Apr 2025 17:54:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l62-0000000CROf-0mRe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ABCD1515;
	Fri,  4 Apr 2025 10:44:52 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99A803F63F;
	Fri,  4 Apr 2025 10:44:48 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 04/14] arm64/fpsimd: Remove redundant SVE trap manipulation
Date: Fri,  4 Apr 2025 18:44:25 +0100
Message-Id: <20250404174435.3288106-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104450_268275_92CC7432 
X-CRM114-Status: GOOD (  11.76  )
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

When task_fpsimd_load() loads the saved FPSIMD/SVE/SME state, it
configures EL0 SVE traps by calling sve_user_{enable,disable}(). This is
unnecessary, and this is suspicious/confusing as task_fpsimd_load() does
not configure EL0 SME traps.

All calls to task_fpsimd_load() are followed by a call to
fpsimd_bind_task_to_cpu(), where the latter configures traps for SVE and
SME dependent upon the current values of TIF_SVE and TIF_SME, overriding
any trap configuration performed by task_fpsimd_load().

The calls to sve_user_{enable,disable}() calls in task_fpsimd_load()
have been redundant (though benign) since they were introduced in
commit:

  a0136be443d51803 ("arm64/fpsimd: Load FP state based on recorded data type")

Remove the unnecessary and confusing SVE trap manipulation.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 1391a491f2226..757445d72e5b7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -366,13 +366,11 @@ static void task_fpsimd_load(void)
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
 			/* Stop tracking SVE for this task until next use. */
-			if (test_and_clear_thread_flag(TIF_SVE))
-				sve_user_disable();
+			clear_thread_flag(TIF_SVE);
 			break;
 		case FP_STATE_SVE:
-			if (!thread_sm_enabled(&current->thread) &&
-			    !WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE)))
-				sve_user_enable();
+			if (!thread_sm_enabled(&current->thread))
+				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
 			if (test_thread_flag(TIF_SVE))
 				sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
-- 
2.30.2


