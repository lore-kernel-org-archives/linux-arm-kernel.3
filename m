Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38AAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwdaJv1p1f03pvmV73v7i63rIbWdamxaEk7BesKB8Qw=; b=GaCfzsSwHMqQaeskMhk8WA3uUr
	+TfAtGcVisYOs/cxNdmvwQq/hYwBGMDgOXnZg7alAwrT4jKjPunlbl9wgULgHzJCAUXUO2yYPYOxn
	v5T4ILNpx97k7ezAiBb+idM0xMecaH6zUYb2myd70+pJRLcd/uVC2IClU6iTZgbgnCVmDC+OThX1v
	gT2tgi8plFPeSJkcCBwhOheR9VyZyLpndzgRVZ9j5tYBGwfFmXVS7g7SwLk8Na/MgADR/ImRIOkTl
	mlLh9EotAjcGRCgNEjNDLJ6FBHPX/6altM6FoCPpHlvwMRbQSqOzrLCG59pBip7Q9xRaB8sWMLPcn
	rWNLzdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yff-00000007wrw-05df;
	Wed, 09 Apr 2025 16:53:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTf-00000007uwE-46LL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB261C25;
	Wed,  9 Apr 2025 09:40:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A6463F59E;
	Wed,  9 Apr 2025 09:40:38 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 06/13] arm64/fpsimd: Don't corrupt FPMR when streaming mode changes
Date: Wed,  9 Apr 2025 17:40:03 +0100
Message-Id: <20250409164010.3480271-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094040_060483_B101DDFB 
X-CRM114-Status: GOOD (  13.57  )
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

From: Mark Brown <broonie@kernel.org>

When the effective value of PSTATE.SM is changed from 0 to 1 or from 1
to 0 by any method, an entry or exit to/from streaming SVE mode is
performed, and hardware automatically resets a number of registers. As
of ARM DDI 0487 L.a, this means:

* All implemented bits of the SVE vector registers are set to zero.

* All implemented bits of the SVE predicate registers are set to zero.

* All implemented bits of FFR are set to zero, if FFR is implemented in
  the new mode.

* FPSR is set to 0x0000_0000_0800_009f.

* FPMR is set to 0, if FPMR is implemented.

Currently task_fpsimd_load() restores FPMR before restoring SVCR (which
is an accessor for PSTATE.{SM,ZA}), and so the restored value of FPMR
may be clobbered if the restored value of PSTATE.SM happens to differ
from the initial value of PSTATE.SM.

Fix this by moving the restore of FPMR later.

Note: this was originally posted as [1].

Fixes: 203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/20241204-arm64-sme-reenable-v2-2-bae87728251d@kernel.org/ # [1]
[ Rutland: rewrite commit message ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/kernel/fpsimd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index b4858d85292b4..b19736f354a71 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -359,9 +359,6 @@ static void task_fpsimd_load(void)
 	WARN_ON(preemptible());
 	WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
 
-	if (system_supports_fpmr())
-		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
-
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
@@ -411,6 +408,9 @@ static void task_fpsimd_load(void)
 			restore_ffr = system_supports_fa64();
 	}
 
+	if (system_supports_fpmr())
+		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
+
 	if (restore_sve_regs) {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
 		sve_load_state(sve_pffr(&current->thread),
-- 
2.30.2


