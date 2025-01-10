Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0703CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvev6jpspqefAesy9QvGgapMJJ1vdiikr3E2bymm/Rs=; b=tCE6PiFKd/5bZQXRc1xZy3gIWn
	Y23dIXj4Iw2EtZ7LMsjZLD37QMZefNHk8tkv3e3b6eNx0yELQGlRP4XFW/96BtnvvXzJb4bkqIu0x
	sHl+UhZJ1YQ5ExuQpedDjgW7yQAKMaTRlAgqehtGmmXgF5yXTgc20YApQ+drodWMl88MHqMMAj8UL
	1X12NYE9iyi7EFwERT75LRY1YqdH+MdxeHwy7cktNDMD5J3rHD77jk2BxzAW4kgWmkZkCbvO+SgyC
	Ez0ke4awvsk9CXx2Gg0juRaBavWCdik2Fp3+emo4AgWrJABSc+JKx6Uf8pMzAWTDHAEhlhgNjkw2u
	prBccUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCpW-0000000F3Nq-1cAj;
	Fri, 10 Jan 2025 11:05:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCkz-0000000F2fF-16o0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD62A5C5B55;
	Fri, 10 Jan 2025 11:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8556EC4CED6;
	Fri, 10 Jan 2025 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506848;
	bh=7t6+J0/0kwwj5Ro61nODugDvQ9MdrD/SAj9fDOldBM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQr6L/82jf4fmSGVwkard9Zw/C+Dv4VOW8HIEIzxoTNP+hVS32DeYAJngDbbwHAbL
	 KtD3SkEGPfJnXsTngjN2p/N8RrdOmjmv5pYsz8ibpgcm89/c8bocob3uZYLH1CnMng
	 LkhkXGreehb4S7hhNRn1mQ4M2wozEA7sybXL1JA+f30A4GUMluSGsg9jsfZjSmSoe7
	 UTTRtesKkBdQyHRWvHTotG1lOGhJ6Td6JWWHkgoD3X4v7S8UBi5CEYOVPMLfAQ6LMh
	 bFzxrnqEO+ZXpg0284J0cE1EiNmrEHcB9ruoKvwD2gHHAM8r6sz108axGxKGyMr/99
	 XYuX8gOn33GVQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH v2 3/7] arm64: cpufeature: add Allocation Tag Access Permission (MTE_PERM) feature
Date: Fri, 10 Jan 2025 16:30:19 +0530
Message-ID: <20250110110023.2963795-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030049_386757_D96900D1 
X-CRM114-Status: GOOD (  13.43  )
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

This indicates if the system supports MTE_PERM. This will be used by KVM
for stage 2 mapping. This is a CPUCAP_SYSTEM feature because if we enable
the feature all cpus must have it.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h | 5 +++++
 arch/arm64/include/asm/memory.h     | 2 ++
 arch/arm64/kernel/cpufeature.c      | 9 +++++++++
 arch/arm64/tools/cpucaps            | 1 +
 4 files changed, 17 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8b4e5a3cd24c..d70d60ca1cf7 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -813,6 +813,11 @@ static inline bool system_supports_mte(void)
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
+static inline bool system_supports_notagaccess(void)
+{
+	return alternative_has_cap_unlikely(ARM64_MTE_PERM);
+}
+
 static inline bool system_has_prio_mask_debugging(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index cb244668954c..6939e4700a5e 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -179,6 +179,7 @@
  * Memory types for Stage-2 translation
  */
 #define MT_S2_NORMAL			0b1111
+#define MT_S2_NORMAL_NOTAGACCESS	0b0100
 #define MT_S2_NORMAL_NC			0b0101
 #define MT_S2_DEVICE_nGnRE		0b0001
 
@@ -187,6 +188,7 @@
  * Stage-2 enforces Normal-WB and Device-nGnRE
  */
 #define MT_S2_FWB_NORMAL		0b0110
+#define MT_S2_FWB_NORMAL_NOTAGACCESS	0b1110
 #define MT_S2_FWB_NORMAL_NC		0b0101
 #define MT_S2_FWB_DEVICE_nGnRE		0b0001
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed8..c9cd0735aaf5 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -309,6 +309,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEPERM_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
 
@@ -2818,6 +2819,14 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE3)
 	},
+	{
+		.desc = "MTE Allocation Tag Access Permission",
+		.capability = ARM64_MTE_PERM,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTEPERM, IMP)
+	},
+
 #endif /* CONFIG_ARM64_MTE */
 	{
 		.desc = "RCpc load-acquire (LDAPR)",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eb17f59e543c..10e01cf8ad96 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -66,6 +66,7 @@ MPAM
 MPAM_HCR
 MTE
 MTE_ASYMM
+MTE_PERM
 SME
 SME_FA64
 SME2
-- 
2.43.0


