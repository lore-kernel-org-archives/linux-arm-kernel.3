Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ED4C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa5KphsoygewJSmkYI/LNyFy2FrxGkMJEtWoK57gW+8=; b=2XKNBOGJ5RV90Touc666i8EfFj
	uIX84Tf3WpmPg3q/A7dnAL5LFSU4vv9oH5jNKbU4kBBtI9EiOOvK13ffWd6K3ugu9H7AF4V0a9zwa
	JlViIgCJZQ97jdQXphqn25rvHzHwlhBfgPt2jC1xupboh2Hj0PqQsdmAnmru9S7JUIKG1bA91Rt+q
	sfoWwLEZa8L2DxsGse3Y5OVjCH20m5w+ZuQVbLJMxMzWCkUq01vr8O5wAuF9zFxnqA8Nr5BVBHORu
	vuKTrIQaz/HZh2YUbxUodqnfdWOd8SCXLSk2vV6A1XK14PRoqeX/ji12MZOSf1l+nJiduTqmAVI26
	HK9mXPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1cq-00000000ohK-1guA;
	Thu, 08 May 2025 13:49:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Ho-00000000kRx-0GtX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50C47106F;
	Thu,  8 May 2025 06:27:29 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FC973F58B;
	Thu,  8 May 2025 06:27:37 -0700 (PDT)
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
Subject: [PATCH v2 09/24] arm64/fpsimd: signal: Use SMSTOP behaviour in setup_return()
Date: Thu,  8 May 2025 14:26:29 +0100
Message-Id: <20250508132644.1395904-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062740_148443_3F58DD12 
X-CRM114-Status: GOOD (  12.20  )
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

Historically the behaviour of setup_return() was nondeterministic,
depending on whether the task's FSIMD/SVE/SME state happened to be live.
We fixed most of that in commit:

  929fa99b1215 ("arm64/fpsimd: signal: Always save+flush state early")

... but we didn't decide on how clearing PSTATE.SM should behave, and left a
TODO comment to that effect.

Use the new task_smstop_sm() helper to make this behave as if an SMSTOP
instruction was used to exit streaming mode. This would have been the
most common behaviour prior to the commit above.

Fixes: 40a8e87bb328 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index e9272878dd7df..3c271ab401980 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1476,22 +1476,8 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 
 	/* Signal handlers are invoked with ZA and streaming mode disabled */
 	if (system_supports_sme()) {
-		/*
-		 * If we were in streaming mode the saved register
-		 * state was SVE but we will exit SM and use the
-		 * FPSIMD register state.
-		 *
-		 * TODO: decide if this should behave as SMSTOP (e.g. reset
-		 * FPSR + FPMR), or whether this should only clear the scalable
-		 * registers + ZA state.
-		 */
-		if (current->thread.svcr & SVCR_SM_MASK) {
-			memset(&current->thread.uw.fpsimd_state, 0,
-			       sizeof(current->thread.uw.fpsimd_state));
-			current->thread.fp_type = FP_STATE_FPSIMD;
-		}
-
-		current->thread.svcr &= ~(SVCR_ZA_MASK | SVCR_SM_MASK);
+		task_smstop_sm(current);
+		current->thread.svcr &= ~SVCR_ZA_MASK;
 		write_sysreg_s(0, SYS_TPIDR2_EL0);
 	}
 
-- 
2.30.2


