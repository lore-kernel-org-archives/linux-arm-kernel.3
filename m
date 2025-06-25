Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DEC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ABoENGo5e6xeRDfJzO9G38fWVmc8C9R3OnQfE8uSZw=; b=JozLp6G7wW5UUzEhnvvIiNBZHc
	gVy4XShJdauEz5mbhUurmI5X7YzVYAe7eMS9NK736UtEpg0QjbWJaVQbtmxx7/rbDdfgTIiMg4KzP
	M6KXdPqInOAHI+PzkPwaY0MeDUP6FSUCscWiwmgWAfZuM1muoKhC3Dd2pOwtnXUIX5QIGIetp0/KC
	89qn1CKeMLNT/8kArwyF3/2Rf9wo8mURBEkFCq1YcKL7HmiWxXCqrjvfoV2ZYmheOLr6jD5kJk/Lu
	vwLGn4hCcjb/tPfoPQHHmceXJytYznnBArvcyhlCRCFfhgFM6e1tpU5HSL19DT5aBr597yeLEDAmF
	OK5cdqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSvu-00000009Gyx-0fjD;
	Wed, 25 Jun 2025 16:25:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOP1-00000008Up3-40Nw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FAD62050;
	Wed, 25 Jun 2025 04:34:37 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D6C3F58B;
	Wed, 25 Jun 2025 04:34:51 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	baohua@kernel.org,
	suzuki.poulose@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v8 2/4] arm64: Add BBM Level 2 cpu feature
Date: Wed, 25 Jun 2025 11:34:33 +0000
Message-ID: <20250625113435.26849-3-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625113435.26849-1-miko.lenczewski@arm.com>
References: <20250625113435.26849-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_043456_070930_ADB5224E 
X-CRM114-Status: GOOD (  17.24  )
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

The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
and this commit adds a dedicated BBML2 cpufeature to test against
support for.

To support BBML2 in as wide a range of contexts as we can, we want not
only the architectural guarantees that BBML2 makes, but additionally
want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
us having to prove that no recursive faults can be induced in any path
that uses BBML2, allowing its use for arbitrary kernel mappings.

This feature builds on the previous ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
as all early cpus must support BBML2 for us to enable it (and any later
cpus must also support it to be onlined).

Not onlining late cpus that do not support BBML2 is unavoidable, as we
might currently be using BBML2 semantics for kernel memory regions. This
could cause faults in the late cpus, and would be difficult to unwind,
so let us avoid the case altogether.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/cpufeature.h |  5 ++++
 arch/arm64/kernel/cpufeature.c      | 38 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 44 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 155ebd040c55..bf13d676aae2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -871,6 +871,11 @@ static inline bool system_supports_pmuv3(void)
 	return cpus_have_final_cap(ARM64_HAS_PMUV3);
 }
 
+static inline bool system_supports_bbml2_noabort(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index f9c947166322..7a3c404288d5 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2213,6 +2213,38 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }
 
+static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/*
+	 * We want to allow usage of BBML2 in as wide a range of kernel contexts
+	 * as possible. This list is therefore an allow-list of known-good
+	 * implementations that both support BBML2 and additionally, fulfill the
+	 * extra constraint of never generating TLB conflict aborts when using
+	 * the relaxed BBML2 semantics (such aborts make use of BBML2 in certain
+	 * kernel contexts difficult to prove safe against recursive aborts).
+	 *
+	 * Note that implementations can only be considered "known-good" if their
+	 * implementors attest to the fact that the implementation never raises
+	 * TLB conflict aborts for BBML2 mapping granularity changes.
+	 */
+	static const struct midr_range supports_bbml2_noabort_list[] = {
+		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
+		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		{}
+	};
+
+	/* Does our cpu guarantee to never raise TLB conflict aborts? */
+	if (!is_midr_in_range_list(supports_bbml2_noabort_list))
+		return false;
+
+	/*
+	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
+	 * about whether the MIDR check passes.
+	 */
+
+	return true;
+}
+
 #ifdef CONFIG_ARM64_PAN
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
@@ -2980,6 +3012,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
 	},
+	{
+		.desc = "BBM Level 2 without conflict abort",
+		.capability = ARM64_HAS_BBML2_NOABORT,
+		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
+		.matches = has_bbml2_noabort,
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..2bd2bfaeddcd 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -45,6 +45,7 @@ HAS_LPA2
 HAS_LSE_ATOMICS
 HAS_MOPS
 HAS_NESTED_VIRT
+HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
 HAS_S1PIE
-- 
2.49.0


