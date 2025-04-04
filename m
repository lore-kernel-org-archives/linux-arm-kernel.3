Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E615C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAhGbtmQmHw/NZLI92StPB8qVxht4n/61+8HsGthBRM=; b=Q8oJlS5TpBTqcoZumtQm9gBphx
	5ysHAI54Xa/WiLWGPWtINLULp5SXJUcsIhsRB5HsAoJDqY9/DIfBthNbifMDANOpx0wIj+4GMff3w
	k8YSv1M2ZnanTt/W6j5p/UtP95kWk0u4uZfK6m2Ta2nzLPekfWx+LpPuvvkwsv+sK8fvvvE//ZWnB
	XGkWnl3ccm61n2fFAhtRM1/TZUIrIMAXVN3QZ/SIjzFi63BDwwDq/Ukl4dPUJgqt0EuIyAW6Fv5bK
	VYvd8NuQrCV6xjLIF2iFnZMXafwOQiw9ga4zOUn+wI1bBEqHnjAenwCt70J9m4oXWB4Fw1HrcpJAf
	rMtwDXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lO4-0000000CUB8-1PF1;
	Fri, 04 Apr 2025 18:03:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l6C-0000000CRRJ-2tbQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:45:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 711C31515;
	Fri,  4 Apr 2025 10:45:02 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6FA93F63F;
	Fri,  4 Apr 2025 10:44:58 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 09/14] arm64/fpsimd: Reset FPMR upon exec()
Date: Fri,  4 Apr 2025 18:44:30 +0100
Message-Id: <20250404174435.3288106-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104500_783186_677A96C6 
X-CRM114-Status: GOOD (  10.25  )
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

An exec() is expected to reset all FPSIMD/SVE/SME state, and barring
special handling of the vector lengths, the state is expected to reset
to zero. This reset is handled in fpsimd_flush_thread(), which the core
exec() code calls via flush_thread().

When support was added for FPMR, no logic was added to
fpsimd_flush_thread() to reset the FPMR value, and thus it is
erroneously inherited across an exec().

Add the missing reset of FPMR.

Fixes: 203f2b95a882dc46 ("arm64/fpsimd: Support FEAT_FPMR")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 4a0b0bb3a3fad..0b6fda5b7bad5 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1638,6 +1638,9 @@ void fpsimd_flush_thread(void)
 		current->thread.svcr = 0;
 	}
 
+	if (system_supports_fpmr())
+		current->thread.uw.fpmr = 0;
+
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
 	put_cpu_fpsimd_context();
-- 
2.30.2


