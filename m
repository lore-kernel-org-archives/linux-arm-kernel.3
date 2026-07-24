Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE20C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhVyMdGRnv+s4U+VDOdlFYKRx5J7U77NP1muojAh9J0=; b=4xGz5fvghCZsuqE6SEfTsQi8D/
	0zS8E628REnYA2OVJJNApbQU8jejyBvi3JgqSnbRMLd+s0FD885zXjGI38BHDRPjGa4EY3O1ZFe5E
	rjXCK/nlguchvCH7xoYvr6X21RpVxuzqt49ug4dXqah6pHh/7JSPpmW0rbA4GG5Y954Up3doXjh4X
	6Lx5flDBmTueIm6xXxlNuAz2VgyiL2/vJXahgoQz7QxhxjrRq2Xq+/FuxH0tdu+JKMhrQQb65Uato
	TfCsqglKjYiQLwyYGLpXLlIksNv2w6upqwDsEBBpI+CKeFmWoGxSqAT1J/ynGF+TkznnYF7/wbupx
	0IxgY+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFCH-0000000GOek-2uLX;
	Fri, 24 Jul 2026 12:40:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFC8-0000000GOb4-2QUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:40:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so3256865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784896803; x=1785501603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhVyMdGRnv+s4U+VDOdlFYKRx5J7U77NP1muojAh9J0=;
        b=y7ENFzFTGoJTSWDJcrjO9C+ruHDyVCf5XQWhl78d1wQEcJI5AcuMW8MNSMUF9k+6/d
         fJTJCjqK7Lamb7KgJj6LJjbsvcTkofVb+nC4pwhcVRGelxMthVRfPUIoczgrwmbmz5ju
         4ICX5EnCuDDZ2B2GEHCcKJu5QOvnPnGMDOLXht8JXZ/UlE63AiN1zcsnKCazImmJrX4w
         AL2nZaKAhemRnndVjIx0adUx0JH3U7LUpH6/cvP63XMTa2UWfbTjkqcjRG/bkHZRB5Rt
         FjD3KdG76qzCdYy8WpTgOxBperL16hYnVTWATf1JTE0dhdaB9qc2lUPBbERDUf8hUQD2
         IpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896803; x=1785501603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhVyMdGRnv+s4U+VDOdlFYKRx5J7U77NP1muojAh9J0=;
        b=joDa5xAzO3Ly3nbG2MpKCecdeLtbwi0nc0jCafNBKQLnLoP+9qGxb4hzYrT2mdBJ9p
         l0Eb6lHzNP8Ty2Osc2y3JsCstPBAhXCOdzystjPwG3ArmFD090Q0BPrHCHaaFMH3eHVy
         yPnvLvyHUq3mGpLifQDvIDi65YC7TYGhCbLAieyz5urT1ypV2wxpCuhpIG7WZQyRMahg
         lA/lTv8ZhzjWfjf1Kp3xzakZ5Xfhg2Ipn9vF/DWLvcDCucdz36QmoLp9X6XsSSlQRJ7I
         Bq6LL+UPbvG/9A49siwcb6mkb4o5dXle1jTMx4KU0jUZAQqIU9FpfDqM9I94hBPjHAay
         ibww==
X-Forwarded-Encrypted: i=1; AHgh+RphYkrpj4kNFiXHT5MQJpHRO3k3x2KfRBSbISzEWXe3e3N3cycRBINDcUCOb8rpjr0Nh7IeNLpMHurgUl3wXkSR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv9amFTlMC/t085ql8AJZjmzMx3l/xVRrmI6mJQXwV9vxiCAqY
	7DfGacIB93ZCnD/fiUECRXobVHATZo3ISniBYDtgF9Zj1tLgT7mJIAZkFhWh3LboT9Y=
X-Gm-Gg: AR+sD104eahZyaLbEpEJfzP3NzmgmU6IBpRONKd6JMf/I5vww26dGExvK4wAIZK0bC5
	7GEwsJjDNYR3MsRLdTGrfSyqqn/y8qL9zOFzyEM9BM5OeBvmlxD0pjt6JvMCqj/ZglrxjM7bK/l
	ZZh+U+4fbpV1P+zRF6VLlc72dIwsE8zUrdpKwfnPJQEKBQIiyPj4+62ores2D3RN5FIHysL5aYo
	1zSt69Axah3FqnXzuhJ1sAk8uD1f3/nizNyvfSoFR0Zp9XEHAM3KE+kfxvmvm9ZY3u4Jqfe46id
	lObS64CmHYlpt9Mc470r+OONaQZfvoufZY3WnCcs3cli4tcTrHVLgT8jTgn+49NzxeH/Q0hPPL+
	ClfsKfPYtv0fgz/AEICw9UZFmo323PtAA4fwGPLv9F+GItl59zPPT9DnTV44Or7Fp8kEr8EL22x
	LMUfe9XSdzFp0/NQHCGS3LPVqwKJ3HCXOCzYw=
X-Received: by 2002:a05:600c:5650:b0:495:518a:d95a with SMTP id 5b1f17b1804b1-49573ce9854mr56174435e9.29.1784896802644;
        Fri, 24 Jul 2026 05:40:02 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:a07c:a901:acc1:9287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6b10esm71556795e9.5.2026.07.24.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:40:02 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Jul 2026 13:39:43 +0100
Subject: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=pFCouH9HStjiexnZEDkVmIrkzbMeK/R+DZXe5xtheZU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqY10fmZlGtcMy4zExtxtBdnG/RKzlRBqTBTSyr
 hR8TwwCSmeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamNdHwAKCRDO6LjWAjRy
 uhAgD/4ip5+/xRQQ4+PRCS/q2v6JzM4H0W5tRGA8jxDbOMqh0Gqg6BsbsmZvtyvUpxdQCrh+6/g
 xGbEHw6WfRnSiV0XhJ0J8q4TG5lU3v1ctEtzBp6LtUjdarJl3NYPaM23ag0mNt01IxRXh2RHpGY
 er2S/Sn1aNw9/dkKoU5aak0YMKTJe/Bw9mNTjxEtb2Eey2FHBbRkKoLTeg9+sJSTzqxxNkXl97k
 UqnUgjBvNpZXzFSxEr3t57nIq+cAmHqgT6Uh7xYhEbD9T+T64n1H7+iBj4Pj9sQj1XJhIl5nn83
 Bnn7PAK4DGTUMqRUzv6bttrvSW3q0bJKT5OkxRolenw49JErCkRqOxsYsqDGghk1dL6PW36GYrW
 3O6GMFIT4efoMWXkC77ceXh+11HxV9R2h2rEQwA3R/i6qwIokfsFcwTcyTKJqkwJRVdO7e0MpKM
 JvZw7Lip/zSYGV5TEgcuD+W7DiU5lprL0nMTlStzRsq6RBFDN7QOVOXWPt2uFNy0w3U84UFqv15
 hzp0dRLGEqMYOkulDk43R6QO2mlPpOUknjvKOKHVOpRFFPI77+T3Ug4wB5GRb694OcwJiheX6oi
 BAocIPcfvhad3kWV30EfkLytdd2Jh6BxHqxa5kz8X8AbLj40nd2i8e3hX3/KgsvRgukAvMgb2WF
 A8hw25P41jrdW2Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_054004_662433_2613BC24 
X-CRM114-Status: GOOD (  15.65  )
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

Add an option to override the instruction/data attribute
of incoming traffic to Data by setting the INSTCFG override
in all Stream Table Entries.

The option can be provided in the device tree entry for the SMMU
by adding the "arm,instdata-override" property.

Changes by Peter Griffin:
 - Make it apply on vanilla upstream arm-smmu-v3

Signed-off-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  7 +++++++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 57b750ebcd3d..2b39cb5aa49d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -82,6 +82,7 @@ DEFINE_MUTEX(arm_smmu_asid_lock);
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
+	{ ARM_SMMU_OPT_OVR_INSTCFG_DATA, "arm,instdata-override"},
 	{ 0, NULL},
 };
 
@@ -1206,7 +1207,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1835,7 +1838,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			 STRTAB_STE_1_S1STALLD :
 			 0) |
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0)) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING);
 
 	if ((smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) &&
 	    s1dss == STRTAB_STE_1_S1DSS_BYPASS)
@@ -1887,7 +1894,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 
 	target->data[1] = cpu_to_le64(
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_S2FWB)
 		target->data[1] |= cpu_to_le64(STRTAB_STE_1_S2FWB);
@@ -5087,6 +5098,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (smmu->sid_bits <= STRTAB_SPLIT)
 		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
 
+	if (reg & IDR1_ATTR_PERMS_OVR) {
+		smmu->features |= ARM_SMMU_FEAT_PERMS_OVR;
+	} else if (smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA) {
+		dev_err(smmu->dev, "Inst/Data attribute override not supported\n");
+		return -ENXIO;
+	}
+
 	/* IDR3 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
 	if (FIELD_GET(IDR3_RIL, reg))
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index c909c9a88538..e5f5c0bc6b8a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -51,6 +51,7 @@ struct arm_vsmmu;
 #define IDR1_QUEUES_PRESET		(1 << 29)
 #define IDR1_REL			(1 << 28)
 #define IDR1_ATTR_TYPES_OVR		(1 << 27)
+#define IDR1_ATTR_PERMS_OVR		(1 << 26)
 #define IDR1_CMDQS			GENMASK(25, 21)
 #define IDR1_EVTQS			GENMASK(20, 16)
 #define IDR1_PRIQS			GENMASK(15, 11)
@@ -283,6 +284,10 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
 #define STRTAB_STE_1_SHCFG_INCOMING	1UL
 
+#define STRTAB_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define STRTAB_STE_1_INSTCFG_INCOMING	0UL
+#define STRTAB_STE_1_INSTCFG_DATA	2UL
+
 #define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
 #define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
 #define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
@@ -921,6 +926,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_HD		(1 << 22)
 #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
 #define ARM_SMMU_FEAT_BBML2		(1 << 24)
+#define ARM_SMMU_FEAT_PERMS_OVR		(1 << 25)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
@@ -928,6 +934,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
+#define ARM_SMMU_OPT_OVR_INSTCFG_DATA	(1 << 5)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;

-- 
2.55.0.229.g6434b31f56-goog


