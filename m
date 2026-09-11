Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC025C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=; b=J6l9Yt2nbYIpZ+E6JWyYT3haVz
	Tr2j0hc7wgvLS+B3IJ3vg7Ixgtxj1b+WTK9ZZxIjxV7WJlU9rsfDcJ3U0fGw590QuEzYCs5Ni54AI
	16uGZmpsZI9zd+5zv8DGmsEzSMlH3LB4fuK5We+eWNrUbPkMLd/LCSB6O9dsLgehKFBFHFgQWD0y7
	8GaYcFouKcRfViTUVbNO9IyfMZ2sEsSzAubF4smChk/Dxk0HVHG+OstXLgwBAW53CEjyz0AwTOnKc
	lgZ5NwNOi1Ma8qrwUOATzckUIsDnHapf07XgZLsj8tY16rTm7q6JMbZnqK6D89XuKf4CGvloNDdMq
	G1LDY5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gX-000000009uo-2J9J;
	Fri, 11 Sep 2026 21:21:25 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gO-000000009nq-2sAc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:21:18 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c294496989aso63140366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161675; x=1789766475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=VLo/zEpapCWfzmU5ExlJKdBIRfVzyLKPWgolh2RYgwlXyN5c9UpC9q3DF8evU24eXi
         UV4qJaHsB2E841iW0xraFbOGbBTfgnaAxS4PAg+Sn+CrhqRixXfRzxQhhLpNGPdOE0Pu
         JTCBefVLuuYQvSKt0UUHkxruv88rbayvKPYjYFHm0huss00N9GzmwnQD8LTKDCJCjqOP
         hGlS4tWJ1/EAhLTm539jFdzNuhz+F83HHPsNS4xMt2rgtbiuMMEN80cGE7aWBrWRe+hn
         /NShwSbUy9h7/BKnlvnhJagxcg74yWN5Ui+YePFn1SnRVJtLEhbR4kuYqAGZ0SOzMntZ
         FQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161675; x=1789766475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=KBPWkeCBhDLsXy6zEIOINBkjruWoKIJatmo48jxY8a8yYALoClgNARpPA/aglNSEbe
         IpfcY3WjRQgJb32FOc3EFlhpIGQD/asQLaO+R+0bL4Z/1L2Pbx2g9woDWxe6RxLpDJ4x
         /Yp67h2jxt73KVBPUWlXrTbnf0DeIKxBV32qqFQlfp0HslDnhv1yJVb8GEQYuq8gf90V
         qX/vw8QF2yOTucUVc7j7Pdy+8VEvy1xFzupDCgTQp7KgwR2UiNKDZFvrbz3c6XxcXIZO
         PCvHeRXVeqtl+nPrezUwDHgkSkR6VPQBilzX4BC+FE4FT28DJdfNUlPlhV24xXxVSHop
         SQWg==
X-Forwarded-Encrypted: i=1; AKwUvBykY9wQaDao+NQ2+mpDzk9zwRxzydO4rsywZUne3EbWW2Rb/EkgEx2x+ONdgPpxrekOrT8rawGz5btQT014jAOC@lists.infradead.org
X-Gm-Message-State: AFuF++kj/N3xN2x/l8GhNBtD5dCIjJZgiBvNqJU9XcDXMfALOSjECkYo
	H7OL/ShyCBjQD1XWRGWseskF36WBgHJSMWQ0ncPMze0BOyptmKD2y1yqzUmRlW8T8xI=
X-Gm-Gg: AYBFou1M6Og3Pr0hxxLe5ZCTHjzQ20ST1ZYJg071nO6sRIsqZVHHRdbSLOC2AWxXYLa
	X37dAo4V3cGnUOORzbMLk8bOuS//jHSDj9Z4KDv5zYrFhehhLyTjuVosxvGt2wmVVlSSX5wlDmH
	xT4eRUwEbqdLHSHwCF8ImXMoTZ3/Eh0P1sLHxVHdoP2hk4VtGOdNX3UCP53vMgJA7Wd4jOuyBLX
	fXeyClpjBJgNcHwYWKFlxOgNlCySweY+39r/lXHRkokwV6jghePIt1YRigv4VlkjyYu5AzQ+ByZ
	C/KRPBB/1RBepZEkOStO+5oIAO0kHK8y3BwqnMZ1tcVO6DX78Er4EX/93+atr/XL5ThRp/yPFPM
	L4TLyM142S+7FBIqEC7BzNktIp/FCYZv8qUwHuesOrBHtIa39WoqsLOUrakwEjC1UB3Enqf9yAj
	Yw9zyvy9lebt/RZGm8em0wlCi66j1U6mCbYJbLX54n08RiX4qFWdvCcDTRRxMzfSitDSWlvN3j5
	jOq4uBjY+UslEI1+Afevv/+U4DtVMvAucwal+33+3iMrW31vlEPT7kOUxVhxoMabQ==
X-Received: by 2002:a17:907:6d0f:b0:c25:1b4f:6d95 with SMTP id a640c23a62f3a-c296650ef6bmr266540666b.6.1789161675053;
        Fri, 11 Sep 2026 14:21:15 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Sep 2026 21:21:06 +0000
Subject: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5946;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=VB6oO/0/aP3anKWJoqBgbBJ4sY9p6fnK67zg5+eEZ9M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHzEijWCf5mE/ywG6gZ00CigmowyI36StKG
 HawX3dSwmWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 unoJD/9g5EpIQMsuKWJGdcGUJ/1Q3cLmc5iRMaXFcXKRRNNlmQyfwhjwmdzrUqjc/GzrWrWRqFA
 mk9NTrlWN0G/ZnnfBltZmYjJxgnqcEKXQo0SjN5kG0q2kvr40lu/nlbzx0rX0nxK+UVKfXeiHPY
 ttvXD+QErU05cm5EOIJXOiarJ5rCk+9UeDfdLBjmdn+T7wL2nfuEXW3kNAiTpY+JFyzL3skLOtk
 cnaLW7wXEL0TO6dBFtT5EzeXlF50ayjk31yafAiv08ncNMaO8OkO5FjKpay69TklnRP6Cw0a6Yz
 BPOYvVNiGRV+Al4hDtGlvrsC42hrfP6ct9ByLxOuR8Q9O5aME5HXCk/q6vrlmsbK2HYxSU/kmsj
 i1Y0a3zBceTr/GDtEijxlo1X89vAb31W6Mpixr80/KgpO4UHrNXZJB3Dmd7nydt7z/yUpzfuznz
 xPJNBPniX7Mz6XLciY4Nb9dev99DHTpFTw97okrfPUg3VmkVjDFixKYoA0/05SHz4yFVWk2g0cF
 R+x4kfEGIk+j3b34vAArwX46HNB8O57zU2FF3q9pms/VU+ulA7eYMXVDItuC6Bh1athAkXoO+V5
 4X9EPSOmO8ncYqj9VzhXH80guhjWpBeBHnCs4pPcoZp9SzM0ZTmSE6B5wpCCistAkcs59xTyuRO
 W5m1PFSqOy2/Ivg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_142116_780342_FED3DD58 
X-CRM114-Status: GOOD (  18.83  )
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

The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
integration where the AxPROT[2] signal is always 1, which makes all
transactions appear as instructions.

To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
unprivilieged writable buffers are treated as Privileged Execute-Never
(PXN)), as a software workaround we make use of the INSTCFG override
feature to force all incoming traffic to data.

To enable this workaround, the "arm,instdata-override" DT property can be
provided in the device tree entry for the SMMU, similar to how existing
errata workarounds are handled by this driver.

Note this is added for "stage-1" and "stage-2" but we intentionally leave
out "bypass" as nothing is downstream of the SMMU that makes use of the
Instruction/Data attribute.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
[peter.griffin: ported to upstream, updated commit message, remove
feature flag]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
 - Fixup incorrect bracket (Sashiko / Nicolin)
 - Add more verbose description of the issue (Will/Robin)
 - Add note about why "bypass" is not required (Nicolin)
 - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
 - Move check closer to IDR1_ATTR_TYPES_OVR read
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122d..f88647be94475 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -91,6 +91,7 @@ DEFINE_MUTEX(arm_smmu_asid_lock);
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
+	{ ARM_SMMU_OPT_OVR_INSTCFG_DATA, "arm,instdata-override"},
 	{ 0, NULL},
 };
 
@@ -1271,7 +1272,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1287,7 +1289,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1900,7 +1903,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			 STRTAB_STE_1_S1STALLD :
 			 0) |
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if ((smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) &&
 	    s1dss == STRTAB_STE_1_S1DSS_BYPASS)
@@ -1952,7 +1959,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 
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
@@ -5155,6 +5166,12 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
+	if ((smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA) &&
+	    !(reg & IDR1_ATTR_PERMS_OVR)) {
+		dev_err(smmu->dev, "Inst/Data attribute override not supported\n");
+		return -ENXIO;
+	}
+
 	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
 					     FIELD_GET(IDR1_CMDQS, reg));
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd2fee2f560e6..efbac8ca6d7a0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -52,6 +52,7 @@ struct arm_vsmmu;
 #define IDR1_QUEUES_PRESET		(1 << 29)
 #define IDR1_REL			(1 << 28)
 #define IDR1_ATTR_TYPES_OVR		(1 << 27)
+#define IDR1_ATTR_PERMS_OVR		(1 << 26)
 #define IDR1_CMDQS			GENMASK(25, 21)
 #define IDR1_EVTQS			GENMASK(20, 16)
 #define IDR1_PRIQS			GENMASK(15, 11)
@@ -285,6 +286,10 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
 #define STRTAB_STE_1_SHCFG_INCOMING	1UL
 
+#define STRTAB_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define STRTAB_STE_1_INSTCFG_INCOMING	0UL
+#define STRTAB_STE_1_INSTCFG_DATA	2UL
+
 #define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
 #define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
 #define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
@@ -934,6 +939,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
+#define ARM_SMMU_OPT_OVR_INSTCFG_DATA	(1 << 5)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;

-- 
2.55.0.1007.g17ff1f9808-goog


