Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110F6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d9dUcTSe5Y6WYDonPie5MfCzdgvBZJtuRSWHader5s=; b=Z+VbnGTstEteObUVGO9bWwyxhc
	z20XZ+5mMJWLaLxgfn4w0xgsJL7ESSolbUcbd5S5G/RCt7sZQEPhlOd0MJel9GGb0SMNhSoK/rzFB
	71jOCW3scOSrBNEgweUdBwbOL+VoxsO2zMU7ql5EAFHDW8xq5FvpD/bF8VV00MmmiUy3J08YyQwDr
	hvay76yVIpRf/bTenZQ34//QnECntriDZcvQfplZA88Iz6xFkbq2xtpcQ2J9PIs7klGoQpWevIqZA
	o7kDhgPkH+N/6PpnTt7EOE+zZcR23N+ieUsyL7gYFK90mokYqMf9ad+B+j9HyM3WM5uFYP/zxZgW0
	bYsk1GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfIY-0000000EtVz-1Ioa;
	Tue, 17 Dec 2024 21:40:10 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf26-0000000Eqmx-0C6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:23:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d9dUcTSe5Y6WYDonPie5MfCzdgvBZJtuRSWHader5s=;
	b=YVLjQJ/RQf4Iu/Lwu0uHZzu1gNLndqestRfF2O3jNtWCqsbHYL7t/WUVjyZqFDNmSDuIBL
	z7JBGneKH0n0Vb3o21JhUsd7ZB0BSMf+42s3PTetIpVxe50vSLPbPH8FEU12muUt4XX6TG
	QYUySjfTHsaJe8YEO/Jau24gnc19kfE=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 15/18] arm64: Enable IMP DEF PMUv3 traps on Apple M2
Date: Tue, 17 Dec 2024 13:22:55 -0800
Message-Id: <20241217212255.3709400-1-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132310_229331_26D3BA64 
X-CRM114-Status: GOOD (  10.13  )
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

Apple M2 CPUs support IMPDEF traps of the PMUv3 sysregs, allowing a
hypervisor to virtualize an architectural PMU for a VM. Flip the
appropriate bit in HACR_EL2 on supporting hardware.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kernel/cpu_errata.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index a78f247029ae..441ee4ffc770 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -194,6 +194,37 @@ has_neoverse_n1_erratum_1542419(const struct arm64_cpu_capabilities *entry,
 	return is_midr_in_range(midr, &range) && has_dic;
 }
 
+static const struct midr_range impdef_pmuv3_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_MAX),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_MAX),
+	{},
+};
+
+static bool has_impdef_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	u64 dfr0 = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
+	unsigned int pmuver;
+
+	if (!is_kernel_in_hyp_mode())
+		return false;
+
+	pmuver = cpuid_feature_extract_unsigned_field(dfr0,
+						      ID_AA64DFR0_EL1_PMUVer_SHIFT);
+	if (pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
+		return false;
+
+	return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_cpus);
+}
+
+static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *__unused)
+{
+	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
+}
+
 #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
 static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
@@ -786,6 +817,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_38_list),
 	},
 #endif
+	{
+		.desc = "Apple IMPDEF PMUv3 Traps",
+		.capability = ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
+		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+		.matches = has_impdef_pmuv3,
+		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
+	},
 	{
 	}
 };
-- 
2.39.5


