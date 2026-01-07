Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38389D0D155
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUx1Fo7qyJMbzBNEphgT3F/LkjP0KnzUqE/OFfqqPMk=; b=LyJuZd5srAal467R0NmTzOkL6D
	GODgPRszQL5OX5GmdZf0LmEEIFmUqG+0Wyiavgxe/rA6oQ3fzfWDRO/yFR3VNq6eVjrBX3e4cJ2E0
	n5ACnzNj/ZPC/A087ZS1fmBLnZ3Q3nPVfL5NH2VW+6eh6cowdUyjXDjusqftNIhaIxZ/4pqH6hVs1
	JCZ0d9vobYO2tn4RyYJuKJmyTlExbPQIQsYc6YewngqX2cIVqX7JHNQbl4NzmQX0M4jXF5pldDKUh
	h1xyHRCmcydePahAV+sQn0BaMKwesfxkQ2rQYDUFfQoXy7ldD/k68JMG1sZTBpGB3PQ0+o4X5KfjY
	oBHlfgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw9-0000000FQJN-0bpR;
	Wed, 07 Jan 2026 18:07:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw5-0000000FQH7-1FH5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:07:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F299644169;
	Wed,  7 Jan 2026 18:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D0DC4CEF7;
	Wed,  7 Jan 2026 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767809228;
	bh=xXE/PlTwR8mL0+jghSbaljIqMREGIinKz771yCV9QtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1vdAJjtamO6TJmlh2ImsjLWtgjJX7WbIZZ+PoGkhVgyyEfrJlRUYUvAj94g1AyGr
	 CTKabkogo2XFQ2z1rLmBY3FZQdsPFYFf58M3DX8yBLWl757sQd9DXDvzWHkDU0I65L
	 OCtGtKkHxOVFz2UndTaP6if6QW4oNB7SCc5cOUALrwQFxLDf3bBSSzG00nHyJBUruK
	 LPisK2J/uMaFH7LgPDqTK6yNrc1fcJqzhSYndhrsID4BEpNZNCmL6+fqXG/6Su4Erp
	 XU5j4abvo3sowRKwWVrMdswU4+M4vBzL2bwNVXa+awdzEs14kp/ju3q9M8as06UydA
	 6iz47Rhbk7a0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdXw2-00000000A9B-28Wh;
	Wed, 07 Jan 2026 18:07:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/3] arm64: Unconditionally enable EPAN support
Date: Wed,  7 Jan 2026 18:07:01 +0000
Message-ID: <20260107180701.2858276-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107180701.2858276-1-maz@kernel.org>
References: <20260107180701.2858276-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_100709_382171_8CA21774 
X-CRM114-Status: GOOD (  12.72  )
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

While FEAT_PAN3 is pretty recent, having it permanently enabled costs
exactly nothing, and does help with exec-only mappings on these fancy
ARMv9.2 machines that are rumoured to exist.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig                  | 13 -------------
 arch/arm64/configs/hardening.config |  3 ---
 arch/arm64/include/asm/cpucaps.h    |  2 --
 arch/arm64/kernel/cpufeature.c      |  2 --
 4 files changed, 20 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcfb62ec4bae8..c31079f4b611a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2120,19 +2120,6 @@ config ARM64_MTE
 
 endmenu # "ARMv8.5 architectural features"
 
-menu "ARMv8.7 architectural features"
-
-config ARM64_EPAN
-	bool "Enable support for Enhanced Privileged Access Never (EPAN)"
-	default y
-	help
-	  Enhanced Privileged Access Never (EPAN) allows Privileged
-	  Access Never to be used with Execute-only mappings.
-
-	  The feature is detected at runtime, and will remain disabled
-	  if the cpu does not implement the feature.
-endmenu # "ARMv8.7 architectural features"
-
 config AS_HAS_MOPS
 	def_bool $(as-instr,.arch_extension mops)
 
diff --git a/arch/arm64/configs/hardening.config b/arch/arm64/configs/hardening.config
index 24179722927e1..e59034e7af256 100644
--- a/arch/arm64/configs/hardening.config
+++ b/arch/arm64/configs/hardening.config
@@ -18,6 +18,3 @@ CONFIG_ARM64_BTI_KERNEL=y
 CONFIG_ARM64_MTE=y
 CONFIG_KASAN_HW_TAGS=y
 CONFIG_ARM64_E0PD=y
-
-# Available in ARMv8.7 and later.
-CONFIG_ARM64_EPAN=y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 177c691914f87..13c0fa54ea19f 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -19,8 +19,6 @@ cpucap_is_possible(const unsigned int cap)
 			   "cap must be < ARM64_NCAPS");
 
 	switch (cap) {
-	case ARM64_HAS_EPAN:
-		return IS_ENABLED(CONFIG_ARM64_EPAN);
 	case ARM64_SVE:
 		return IS_ENABLED(CONFIG_ARM64_SVE);
 	case ARM64_SME:
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 716440d147a2d..30eea68178c87 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2547,7 +2547,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_enable_pan,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, PAN, IMP)
 	},
-#ifdef CONFIG_ARM64_EPAN
 	{
 		.desc = "Enhanced Privileged Access Never",
 		.capability = ARM64_HAS_EPAN,
@@ -2555,7 +2554,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, PAN, PAN3)
 	},
-#endif /* CONFIG_ARM64_EPAN */
 	{
 		.desc = "LSE atomic instructions",
 		.capability = ARM64_HAS_LSE_ATOMICS,
-- 
2.47.3


