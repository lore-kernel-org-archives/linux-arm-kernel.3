Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD250CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvUMSgIU3B3ilTsGpCNLEttDMrzsuBUntqQsjjdex/k=; b=qGqPcCY1cGEMzi8A2CR+FOi5kn
	80fJpjvtIdt/+T7pWrPTy+Gbm8js3V2gd5bmfOyPfsxzmHI4wkaxX+TDztmSSewSlzsyxcixZp8JA
	cXf757YTwvw/kHFy9bMbcZir8/+Y+KkUOCguMJpS/YcC1+AXD5PjQWiQ2et4axiLbGRei6Y59GaAw
	j1JN7xMa1YpV3DY2p+1QkCsWFml7r08tGWGG/a//9LxpQPuyODrkR8/eHexfplDxKmAy2r/V8oDId
	TaGXF+cMtAD/XmpVC2S8sSWOMx+FUt7kYkg9B8F4/qPQZ2w0WmiFPioXEJ448n9QFoOFkWr/MjL0s
	cIJ+8CDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluj-00000006cfQ-2OWo;
	Fri, 01 May 2026 11:20:09 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlug-00000006ccB-02sC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:08 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44a122a5128so786467f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634404; x=1778239204; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvUMSgIU3B3ilTsGpCNLEttDMrzsuBUntqQsjjdex/k=;
        b=K2NfqQtLbFGOCWSexL12e4qcjMdBXRAIFDw1tpVjXeF5DuZ5btmXhU3WfzV+Sf0wTr
         YeA9WDmGLzxOVqePZjTkpQpr42KmfOyrADJl07fwkSVUE+sBbcUw+GcqIWYWj25Dq8bZ
         UMgcnV+s3csAUI0guOd+EbasqdzjvmnSaQUvXD3aPhmyjTnz5WW0etjZHBtOJnCyW1gA
         H8xj2fumwhJhJM+0209UlldUdhMhZHVBG25pW2S4Qp0IPXotJ5+bfd6zB+hSKIiz/K9G
         JE+uur39i8EU3erIMmJ+mjuI2KGP8icH6BwApoEk/Situ6i4ycYPeDq1oVmDQtzfGRzS
         gvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634404; x=1778239204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvUMSgIU3B3ilTsGpCNLEttDMrzsuBUntqQsjjdex/k=;
        b=sBfY9Dq1nZIsEMndQHMHfdzkacRsUnchN8J0v+cH73bDaNzrPxDJR4FtcmYuPN5BVP
         m679RTh80NhuUJAEFeTHZJ7Diwtsft6ahBbM/4/2tsXB4ZKPjprV3mB8v9CAdKOHYjhK
         679OuBcbU3T/RHwCoimb11ArphrtVnWTuTNuuy4Wpy3OYGo8qShQLkW1wzHIOBzrCrYK
         0VihXYg7XnIibJLDuBLGrnNlO1XBafAHK3FL3EckW7ruPQwhooj/5NeDOMr7kunlRWMD
         UhA7EMYpFmfy5jEzZhKjDsZ1BugN63ELzo8wybJaV1l7xEj4gk8IGV/WIdgNwkCeChQK
         lDWw==
X-Gm-Message-State: AOJu0Yx5QWn0AyGAFFPS2yweKoJv9Kf5zjQ2ALUR2t9S8gjhEtKjZHKa
	fGz1IqNgAVlEpST9sgnp37m1KHiS5XoiLztMIUqnB6nsPHaOlhOcj+fMxN7/eUoM1DmLcSkecn4
	DiqzFsiRmsuWtL6pcMNk2hAgm0uZbYPtcEdirk4CNrrzSiMF2qt7329wYJhQW0IK4LgrCqJF5j9
	ICNTwXgkGzgijqmy1yRe9j4fchgQ3mfyd8nQg3VISqGSxFE5Vherc+IBUXI52dYsh17Q==
X-Received: from wmoo5.prod.google.com ([2002:a05:600d:105:b0:488:9c2a:aeba])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e16:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48a8451cff6mr117057225e9.15.1777634403717;
 Fri, 01 May 2026 04:20:03 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:07 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-6-smostafa@google.com>
Subject: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042006_098256_1C969E92 
X-CRM114-Status: GOOD (  18.60  )
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

Move parsing of IDRs to functions so that it can be re-used
from the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 110 +++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 112 +++---------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   5 +
 3 files changed, 130 insertions(+), 97 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
index 62744c8548a8..e6dd087e2999 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
@@ -112,3 +112,113 @@ int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 
 	return 0;
 }
+
+u32 smmu_idr0_features(u32 reg)
+{
+	u32 features = 0;
+
+	/* 2-level structures */
+	if (FIELD_GET(IDR0_ST_LVL, reg) == IDR0_ST_LVL_2LVL)
+		features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	if (reg & IDR0_CD2L)
+		features |= ARM_SMMU_FEAT_2_LVL_CDTAB;
+
+	/*
+	 * Translation table endianness.
+	 * We currently require the same endianness as the CPU, but this
+	 * could be changed later by adding a new IO_PGTABLE_QUIRK.
+	 */
+	switch (FIELD_GET(IDR0_TTENDIAN, reg)) {
+	case IDR0_TTENDIAN_MIXED:
+		features |= ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE;
+		break;
+#ifdef __BIG_ENDIAN
+	case IDR0_TTENDIAN_BE:
+		features |= ARM_SMMU_FEAT_TT_BE;
+		break;
+#else
+	case IDR0_TTENDIAN_LE:
+		features |= ARM_SMMU_FEAT_TT_LE;
+		break;
+#endif
+	}
+
+	/* Boolean feature flags */
+	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
+		features |= ARM_SMMU_FEAT_PRI;
+
+	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
+		features |= ARM_SMMU_FEAT_ATS;
+
+	if (reg & IDR0_SEV)
+		features |= ARM_SMMU_FEAT_SEV;
+
+	if (reg & IDR0_MSI)
+		features |= ARM_SMMU_FEAT_MSI;
+
+	if (reg & IDR0_HYP)
+		features |= ARM_SMMU_FEAT_HYP;
+
+	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
+	case IDR0_STALL_MODEL_FORCE:
+		features |= ARM_SMMU_FEAT_STALL_FORCE;
+		fallthrough;
+	case IDR0_STALL_MODEL_STALL:
+		features |= ARM_SMMU_FEAT_STALLS;
+	}
+
+	if (reg & IDR0_S1P)
+		features |= ARM_SMMU_FEAT_TRANS_S1;
+
+	if (reg & IDR0_S2P)
+		features |= ARM_SMMU_FEAT_TRANS_S2;
+
+	return features;
+}
+
+u32 smmu_idr3_features(u32 reg)
+{
+	u32 features = 0;
+
+	if (FIELD_GET(IDR3_RIL, reg))
+		features |= ARM_SMMU_FEAT_RANGE_INV;
+	if (FIELD_GET(IDR3_FWB, reg))
+		features |= ARM_SMMU_FEAT_S2FWB;
+
+	return features;
+}
+
+u32 smmu_idr5_to_oas(u32 reg)
+{
+	switch (FIELD_GET(IDR5_OAS, reg)) {
+	case IDR5_OAS_32_BIT:
+		return 32;
+	case IDR5_OAS_36_BIT:
+		return 36;
+	case IDR5_OAS_40_BIT:
+		return 40;
+	case IDR5_OAS_42_BIT:
+		return 42;
+	case IDR5_OAS_44_BIT:
+		return 44;
+	case IDR5_OAS_48_BIT:
+		return 48;
+	case IDR5_OAS_52_BIT:
+		return 52;
+	}
+	return 0;
+}
+
+unsigned long smmu_idr5_to_pgsize(u32 reg)
+{
+	unsigned long pgsize_bitmap = 0;
+
+	if (reg & IDR5_GRAN64K)
+		pgsize_bitmap |= SZ_64K | SZ_512M;
+	if (reg & IDR5_GRAN16K)
+		pgsize_bitmap |= SZ_16K | SZ_32M;
+	if (reg & IDR5_GRAN4K)
+		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+	return pgsize_bitmap;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c22832d26495..96d5e7f80ce7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4815,57 +4815,17 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	/* IDR0 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
 
-	/* 2-level structures */
-	if (FIELD_GET(IDR0_ST_LVL, reg) == IDR0_ST_LVL_2LVL)
-		smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
-
-	if (reg & IDR0_CD2L)
-		smmu->features |= ARM_SMMU_FEAT_2_LVL_CDTAB;
-
-	/*
-	 * Translation table endianness.
-	 * We currently require the same endianness as the CPU, but this
-	 * could be changed later by adding a new IO_PGTABLE_QUIRK.
-	 */
-	switch (FIELD_GET(IDR0_TTENDIAN, reg)) {
-	case IDR0_TTENDIAN_MIXED:
-		smmu->features |= ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE;
-		break;
-#ifdef __BIG_ENDIAN
-	case IDR0_TTENDIAN_BE:
-		smmu->features |= ARM_SMMU_FEAT_TT_BE;
-		break;
-#else
-	case IDR0_TTENDIAN_LE:
-		smmu->features |= ARM_SMMU_FEAT_TT_LE;
-		break;
-#endif
-	default:
+	smmu->features |= smmu_idr0_features(reg);
+	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE))) {
 		dev_err(smmu->dev, "unknown/unsupported TT endianness!\n");
 		return -ENXIO;
 	}
-
-	/* Boolean feature flags */
-	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
-		smmu->features |= ARM_SMMU_FEAT_PRI;
-
-	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
-		smmu->features |= ARM_SMMU_FEAT_ATS;
-
-	if (reg & IDR0_SEV)
-		smmu->features |= ARM_SMMU_FEAT_SEV;
-
-	if (reg & IDR0_MSI) {
-		smmu->features |= ARM_SMMU_FEAT_MSI;
-		if (coherent && !disable_msipolling)
-			smmu->options |= ARM_SMMU_OPT_MSIPOLL;
-	}
-
-	if (reg & IDR0_HYP) {
-		smmu->features |= ARM_SMMU_FEAT_HYP;
-		if (cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
-			smmu->features |= ARM_SMMU_FEAT_E2H;
-	}
+	if (coherent && !disable_msipolling &&
+	    smmu->features & ARM_SMMU_FEAT_MSI)
+		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
+	if (smmu->features & ARM_SMMU_FEAT_HYP &&
+	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
+		smmu->features |= ARM_SMMU_FEAT_E2H;
 
 	arm_smmu_get_httu(smmu, reg);
 
@@ -4877,21 +4837,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
 			 str_true_false(coherent));
 
-	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
-	case IDR0_STALL_MODEL_FORCE:
-		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
-		fallthrough;
-	case IDR0_STALL_MODEL_STALL:
-		smmu->features |= ARM_SMMU_FEAT_STALLS;
-	}
-
-	if (reg & IDR0_S1P)
-		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
-
-	if (reg & IDR0_S2P)
-		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
-
-	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+	if (!(smmu->features & (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
 		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
@@ -4950,10 +4896,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	/* IDR3 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
-	if (FIELD_GET(IDR3_RIL, reg))
-		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
-	if (FIELD_GET(IDR3_FWB, reg))
-		smmu->features |= ARM_SMMU_FEAT_S2FWB;
+	smmu->features |= smmu_idr3_features(reg);
 
 	if (FIELD_GET(IDR3_BBM, reg) == 2)
 		smmu->features |= ARM_SMMU_FEAT_BBML2;
@@ -4965,43 +4908,18 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
 
 	/* Page sizes */
-	if (reg & IDR5_GRAN64K)
-		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
-	if (reg & IDR5_GRAN16K)
-		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
-	if (reg & IDR5_GRAN4K)
-		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+	smmu->pgsize_bitmap = smmu_idr5_to_pgsize(reg);
 
 	/* Input address size */
 	if (FIELD_GET(IDR5_VAX, reg) == IDR5_VAX_52_BIT)
 		smmu->features |= ARM_SMMU_FEAT_VAX;
 
-	/* Output address size */
-	switch (FIELD_GET(IDR5_OAS, reg)) {
-	case IDR5_OAS_32_BIT:
-		smmu->oas = 32;
-		break;
-	case IDR5_OAS_36_BIT:
-		smmu->oas = 36;
-		break;
-	case IDR5_OAS_40_BIT:
-		smmu->oas = 40;
-		break;
-	case IDR5_OAS_42_BIT:
-		smmu->oas = 42;
-		break;
-	case IDR5_OAS_44_BIT:
-		smmu->oas = 44;
-		break;
-	case IDR5_OAS_52_BIT:
-		smmu->oas = 52;
+	smmu->oas = smmu_idr5_to_oas(reg);
+	if (smmu->oas == 52)
 		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
-		break;
-	default:
+	else if (!smmu->oas) {
 		dev_info(smmu->dev,
-			"unknown output address size. Truncating to 48-bit\n");
-		fallthrough;
-	case IDR5_OAS_48_BIT:
+			 "unknown output address size. Truncating to 48-bit\n");
 		smmu->oas = 48;
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 7be41dbe5aaa..64618299d03a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1144,6 +1144,11 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				bool sync);
 int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent);
 
+u32 smmu_idr0_features(u32 reg);
+u32 smmu_idr3_features(u32 reg);
+u32 smmu_idr5_to_oas(u32 reg);
+unsigned long smmu_idr5_to_pgsize(u32 reg);
+
 /* Queue functions shared between kernel and hyp. */
 static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
 {
-- 
2.54.0.545.g6539524ca2-goog


