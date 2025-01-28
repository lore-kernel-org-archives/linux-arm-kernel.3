Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F152C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2AtEGRg5bljsI9AagA1TqdJWOOKC8iw0D+1jOP6GMw=; b=xSyWTmt9pHfpobSA7hf9FYCJIM
	PEwcmq0lCGajuADaIuW4wQJSOWbHcV9JyY+rspfdZC6FgqOQPNxAZFs0XeGmSMisQ6dmfq+EAYoZX
	/GkJDQE3VBvDSIHLD5yYVaCoDKuLU6Ik2o0sp0tWh+xCPWkk4sHJPDNVxWL6dJf0re1PqP1yAnm3y
	4IJ0LQ5oCd4oIK0kv0lAl7V99A7VXvxDDf51gcvRWzRl7rQHq5scV+6kXeMSOlDIObYU5ijNL2DT5
	K6HMyhDnt/LTWCR9j1Nkmuky80OrdYdU51aKuwFAOjOBoT274pFf2f3gNKYB8u2gF5Magm7ODF76Q
	yTUxcBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoNI-00000005JFG-30sB;
	Tue, 28 Jan 2025 16:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnwX-00000005E8d-4Bla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:56:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FEC5497;
	Tue, 28 Jan 2025 07:56:28 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6CB53F694;
	Tue, 28 Jan 2025 07:55:59 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH 2/4] arm64: cpufeature: factor out cpu_is_meltdown_safe()
Date: Tue, 28 Jan 2025 15:54:26 +0000
Message-Id: <20250128155428.210645-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250128155428.210645-1-mark.rutland@arm.com>
References: <20250128155428.210645-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_075602_129042_95BD2DFD 
X-CRM114-Status: GOOD (  14.66  )
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

Currently needs_kpti() checks whether a CPU is immune to meltdown. The
ID_AA64PFR0_EL1.CSV3 ID register field allows a CPU to self report that
it is immune, and kpti_safe_list contains CPUs which are known to be
immune but predate the existence of ID_AA64PFR0_EL1.CSV3.

In future there may be additional reasons to enable KPTI for a CPU
regardless of whether that CPU is immune to meltdown.

Factor out the existing meltdown checks into a new
cpu_is_meltdown_safe() helper function. The ID_AA64PFR0_EL1.CSV3 field
description is removed from the capability structure and made explicit
within cpu_is_meltdown_safe(). As needs_kpti() is only called with
SCOPE_LOCAL, this should not result in any functional change.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marins <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 43 +++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 8fdcff3722696..b746bb16ee785 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1755,13 +1755,12 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 	return has_cpuid_feature(entry, scope);
 }
 
-static bool __meltdown_safe = true;
-static int __kpti_forced; /* 0: not forced, >0: forced on, <0: forced off */
-
-static bool needs_kpti(const struct arm64_cpu_capabilities *entry, int scope)
+static bool cpu_is_meltdown_safe(void)
 {
-	/* List of CPUs that are not vulnerable and don't need KPTI */
-	static const struct midr_range kpti_safe_list[] = {
+	u64 pfr0;
+
+	/* List of CPUs that are not vulnerable to meltdown */
+	static const struct midr_range meltdown_safe_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CAVIUM_THUNDERX2),
 		MIDR_ALL_VERSIONS(MIDR_BRCM_VULCAN),
 		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
@@ -1779,15 +1778,32 @@ static bool needs_kpti(const struct arm64_cpu_capabilities *entry, int scope)
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
 		{ /* sentinel */ }
 	};
+
+	if (is_midr_in_range_list(read_cpuid_id(), meltdown_safe_list))
+		return true;
+
+	/*
+	 * ID_AA64PFR0_EL1.CSV3 > 0 indicates that this CPU is not vulnerable
+	 * to meltdown.
+	 */
+	pfr0 = __read_sysreg_by_encoding(SYS_ID_AA64PFR0_EL1);
+	if (cpuid_feature_extract_unsigned_field(pfr0, ID_AA64PFR0_EL1_CSV3_SHIFT))
+		return true;
+
+	return false;
+}
+
+static bool __meltdown_safe = true;
+static int __kpti_forced; /* 0: not forced, >0: forced on, <0: forced off */
+
+static bool needs_kpti(const struct arm64_cpu_capabilities *entry, int scope)
+{
 	char const *str = "kpti command line option";
 	bool meltdown_safe;
 
-	meltdown_safe = is_midr_in_range_list(read_cpuid_id(), kpti_safe_list);
-
-	/* Defer to CPU feature registers */
-	if (has_cpuid_feature(entry, scope))
-		meltdown_safe = true;
+	WARN_ON(scope != SCOPE_LOCAL_CPU);
 
+	meltdown_safe = cpu_is_meltdown_safe();
 	if (!meltdown_safe)
 		__meltdown_safe = false;
 
@@ -2545,11 +2561,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_BOOT_RESTRICTED_CPU_LOCAL_FEATURE,
 		.cpu_enable = cpu_enable_kpti,
 		.matches = needs_kpti,
-		/*
-		 * The ID feature fields below are used to indicate that the
-		 * CPU doesn't need KPTI. See needs_kpti for more details.
-		 */
-		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, CSV3, IMP)
 	},
 	{
 		.capability = ARM64_HAS_FPSIMD,
-- 
2.30.2


