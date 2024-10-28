Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503EFD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r0XkKCkIV0VttGmWfz8BNo6AjiFKEbQQk81gPYGYLY=; b=vvrNlmzh2Mp5KLvxbTjYBycr5t
	8S0bp4S98syvQmSGI2vaGO1GCvom12Llcg+iIJ1o34P4579iB11Kx4TzfJcdA13ya/MnRcGhGEzIk
	Us/+1Yjkhk0jdsGuoXuaYOLPpta/wploZC47Dq4kGHyW4VJ0EvJi9g2a6Dqu8Zmutm5Co1K1raiSL
	bL8Cw13QUBt18B1E3zEefWgRpD8dRB2lEOLSJWT5z6zJy0gooACdnSiTU2ZxZLiC5zyVFj96sL0oq
	8vxuri6HRcY12rYWg+BzsVXkAfgQMA98EWNEsj5BXRhs7N+kLykUsbH4+xq0C8IXaoyzuP9ZomKWy
	qqO4Zfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MS5-0000000AJbm-1EqU;
	Mon, 28 Oct 2024 09:54:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MEt-0000000AGQs-0yQN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8B66A41B2F;
	Mon, 28 Oct 2024 09:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7022BC4CEC3;
	Mon, 28 Oct 2024 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730108441;
	bh=RL1PZZNf/Qj/0CoaY+xr8w3mCVtSPwhdkys11uyrEvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HlSAs4nHSi8Xsp1PizspeIZXy72a6PgV2vUn6GZDzYeFo5s/f3OEKccFiiaEfWYo6
	 KbLSASzGtqlGRfJWRpeJbqkFUcS25er91XoEvH9eGWzp+wUWoGSM69I/9zz3ZG4yKD
	 XDbv63ZzJhUTGzbyDugx79sYl2qD8AAohXOmhVAPtLIHXk4gnGtT+nYnUpYIi04ks5
	 NJXKMmA196rgn3y6KQEBsJUwCEgvnjD2YRrYEZKAW84wFeUB7JyIr0kzqXBXEV2yMw
	 +tBdbjz+OHqAaHAqDqyaI1Ml64RYfZH1XH+UkuSCkF8/H/l+evz/FTk8pLSI2pNasd
	 ucGbLvsHnKKoQ==
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
Subject: [PATCH 2/4] arm64: cpufeature: add Allocation Tag Access Permission (MTE_PERM) feature
Date: Mon, 28 Oct 2024 15:10:12 +0530
Message-ID: <20241028094014.2596619-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024043_415232_87D6E0E4 
X-CRM114-Status: GOOD (  12.61  )
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h | 5 +++++
 arch/arm64/include/asm/memory.h     | 2 ++
 arch/arm64/kernel/cpufeature.c      | 9 +++++++++
 arch/arm64/tools/cpucaps            | 1 +
 4 files changed, 17 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 3d261cc123c1..6e6631890021 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -805,6 +805,11 @@ static inline bool system_supports_mte(void)
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
index ca42f6d87c16..006a649d4ac7 100644
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
index 718728a85430..608e24e313ad 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -305,6 +305,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEPERM_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
 
@@ -2742,6 +2743,14 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index eedb5acc21ed..81c6599d2a95 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -62,6 +62,7 @@ KVM_PROTECTED_MODE
 MISMATCHED_CACHE_TYPE
 MTE
 MTE_ASYMM
+MTE_PERM
 SME
 SME_FA64
 SME2
-- 
2.43.0


