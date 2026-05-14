Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E266CCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEmMzvi06Mk1dcb9sw04x2u6XfLWH/tjvZolJW+xLNw=; b=x2CaMPQcvlHBvwjOSArrDgHKWE
	U5t9kUlMGcn3CWb6QOrfe6tQkA9pmrXYsTfqrbQDeeYxuYfYsAnrU7cnN6mNdPh1rDkZoUkww3C/4
	WijSEPUCYcX7goCo9I/M6ypOihBZsyKfMO9CPkYwsNWpY52xxSUYVexPb8+ZGgFq57ufK04ALUQ3r
	7cmL2GZyGbix2PA/ndINKMgtoskF7DqlV2VXdb9YYjPyGhM4DyMF9VNTb/WBNq4sECQ1ZJ2R69gwK
	0v+hMu4d6jzp5RCziMldAS4V50Rk0j2uvWmOi5qanxyLY7D3YbVULQ1KhKwI/Y9xNQTTsoAasLTzc
	oYkD92Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAg-000000051w6-1AGT;
	Thu, 14 May 2026 09:15:58 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAZ-000000051mu-3reh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:54 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3397141a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750151; x=1779354951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEmMzvi06Mk1dcb9sw04x2u6XfLWH/tjvZolJW+xLNw=;
        b=DxGVmG+46DxltNx9IsLW87BzkH8BP6SxoRJfELDB1zcbVrGkr3EU7wXpCO0erFtYGt
         f+dqysesgS9Lb5ByRphw362HlidglMgx0Po7tXQU+WLkGYkq3rSsqBrlmeOCzGMA65uN
         n/caAf4WDDJ1DX7dXcZhhGQv8COS/cmpTUcZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750151; x=1779354951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jEmMzvi06Mk1dcb9sw04x2u6XfLWH/tjvZolJW+xLNw=;
        b=pfHdH7vgAw/VDNCc3v6ccJkCeFalf8fqZc1sBmDvfFzeipqQ9FTq2VhdhRTCFQR+f1
         QQEs8rIbtfEXdUpDc8eGy1LkkL9E9DxuYImcYtUrDN+3e4+NE/qYcJfOo6baz6L19MN+
         zDClXowVac563BSTdlYZceGcsREwOsES10pheOKFPUt7g2jMY+Cek5jnehl0dlCFSzu/
         jcOP4gl7/6nJKWTa9U+rwUdCpM4GWjgKhYeyhAXXrZyUuMGx4HHXlf4JX28y4zCAtEnm
         5d8B27GezUuGU8ApMPBrbBQEYliAx4jEaWLYcH9FgI966DskDpdlIRPVdBNwLGejQyFc
         7TZA==
X-Forwarded-Encrypted: i=1; AFNElJ8q4djXc9bJsEBxNPinh6+NGZHFmBsT7xcqdAKpNlYMIBALF2HIvzcAY95BGjdbIcNU6ACuZikcfl2+vYO3gFQT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3SgxzpANyYczVs3n5oGb2nDFA9sls7+/KJFdrtFdAanMee7oo
	Nljq/K2g3G1ZcV2hiuu4t8mgR5Jlr7qE4ekMDcs6WlpgcaPvk5YRPjZj4/Xy+rfsPA==
X-Gm-Gg: Acq92OE0eNxr/3/V87QuDJ+aRWYdv74kreB9mSTJpjkgli/aRL0C7Q2dgu0mvg0qTkn
	MvZlC5CQ8LIGGS5RgmO48H3eKiUHgiaPUtriz2FkAGc35pOqzsJg5ep57QumcULhrIW7u/pRVHw
	zIUmJehme5V/Bf5SLPUbP0sH2jSTqj4oUy+t+z3/LbANifhHaIqVTMclZCr8sRkpnNiju8cqDsd
	59v7SttVT27qYbaEgVCecHUWcYc5u/d+L/M0e9UhhVcW/O0CLoUoPvh2lf6ScWQNEN2h/DTS17C
	5U62na3TDDkFXeGbwzFezGO7NKH45lNuDMiz1WvwE+nWIasHbTWtliAeonwFC/gycs43oFKvqHQ
	NCtY9uDDQuUHrByJg/Qy+PEFpTZh2dQzTKo6ZVSgSZh2dHXe9uQneu82gq1wmviFwa2zq/6NDTH
	tRTywi5kp3N3vYq/+H2NuliP4IMoyvAzNVncP8nRlCWzec0coDa60pZJNcS28MzywxH1RCnz+QY
	TB4UXY7
X-Received: by 2002:a05:6a20:6a04:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3af80e78eafmr7968633637.23.1778750150908;
        Thu, 14 May 2026 02:15:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/6] regulator: mt6359: Add regulator supply names
Date: Thu, 14 May 2026 17:15:18 +0800
Message-ID: <20260514091520.2718987-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021552_145397_C883FA04 
X-CRM114-Status: GOOD (  15.68  )
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

The MT6359 regulator DT binding defines the supply names for the PMIC.

Add support for them by adding .supply_name field settings for each
regulator. The buck regulators each have their own supply. The name
of the supply is related to the name of the buck regulator. The LDOs
have shared supplies.

Add the supply name to the declaration of each regulator. At the moment
they are declared explicitly, but the buck regulator macro can be made
to derive both the match string and supply name from the base name once
the *_sshub regulators are figured out and removed. For context, the
*_sshub regulators are not separate regulators, but separate settings
for the same name regulators without the "_sshub" suffix.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v3:
- Changed vbbck's supply name to 'VIO18' to match vio18's default name
  (Sashiko)

Changes since v1:
- Handle vbbck's supply internally
---
 drivers/regulator/mt6359-regulator.c | 220 +++++++++++++++------------
 1 file changed, 125 insertions(+), 95 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index bcf9a476a34e..46cafe93b24e 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -38,7 +38,7 @@ struct mt6359_regulator_info {
 	u32 lp_mode_mask;
 };
 
-#define MT6359_BUCK(match, _name, min, max, step,		\
+#define MT6359_BUCK(match, _name, supply, min, max, step,	\
 	_enable_reg, _status_reg,				\
 	_vsel_reg, _vsel_mask,					\
 	_lp_mode_reg, _lp_mode_shift,				\
@@ -46,6 +46,7 @@ struct mt6359_regulator_info {
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_linear_ops,			\
@@ -69,11 +70,12 @@ struct mt6359_regulator_info {
 	.modeset_mask = BIT(_modeset_shift),			\
 }
 
-#define MT6359_LDO_LINEAR(match, _name, min, max, step,		\
+#define MT6359_LDO_LINEAR(match, _name, supply, min, max, step,	\
 	_enable_reg, _status_reg, _vsel_reg, _vsel_mask)	\
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_linear_ops,			\
@@ -92,12 +94,13 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),						\
 }
 
-#define MT6359_LDO(match, _name, _volt_table,			\
+#define MT6359_LDO(match, _name, supply, _volt_table,		\
 	_enable_reg, _enable_mask, _status_reg,			\
 	_vsel_reg, _vsel_mask, _en_delay)			\
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_table_ops,			\
@@ -116,11 +119,13 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),						\
 }
 
-#define MT6359_REG_FIXED(match, _name, _enable_reg,	\
-	_status_reg, _fixed_volt)			\
+#define MT6359_REG_FIXED(match, _name, supply,		\
+			 _enable_reg, _status_reg,	\
+			 _fixed_volt)			\
 [MT6359_ID_##_name] = {					\
 	.desc = {					\
 		.name = #_name,				\
+		.supply_name = supply,			\
 		.of_match = of_match_ptr(match),	\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_fixed_ops,		\
@@ -136,12 +141,14 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),					\
 }
 
-#define MT6359P_LDO1(match, _name, _ops, _volt_table,	\
-	_enable_reg, _enable_mask, _status_reg,		\
-	_vsel_reg, _vsel_mask)				\
+#define MT6359P_LDO1(match, _name, supply, _ops,	\
+		     _volt_table, _enable_reg,		\
+		     _enable_mask, _status_reg,		\
+		     _vsel_reg, _vsel_mask)		\
 [MT6359_ID_##_name] = {					\
 	.desc = {					\
 		.name = #_name,				\
+		.supply_name = supply,			\
 		.of_match = of_match_ptr(match),	\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &_ops,				\
@@ -470,14 +477,14 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 
 /* The array is indexed by id(MT6359_ID_XXX) */
 static const struct mt6359_regulator_info mt6359_regulators[] = {
-	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
+	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS1_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS1_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS1_LP_ADDR, MT6359_RG_BUCK_VS1_LP_SHIFT,
 		    MT6359_RG_VS1_FPWM_ADDR, MT6359_RG_VS1_FPWM_SHIFT),
-	MT6359_BUCK("buck_vgpu11", VGPU11, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11", VGPU11, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VGPU11_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR, MT6359_RG_BUCK_VGPU11_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VGPU11_VOSEL_MASK <<
@@ -485,7 +492,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_BUCK("buck_vmodem", VMODEM, 400000, 1100000, 6250,
+	MT6359_BUCK("buck_vmodem", VMODEM, "vsys-vmodem", 400000, 1100000, 6250,
 		    MT6359_RG_BUCK_VMODEM_EN_ADDR,
 		    MT6359_DA_VMODEM_EN_ADDR, MT6359_RG_BUCK_VMODEM_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VMODEM_VOSEL_MASK <<
@@ -493,35 +500,35 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VMODEM_LP_ADDR,
 		    MT6359_RG_BUCK_VMODEM_LP_SHIFT,
 		    MT6359_RG_VMODEM_FCCM_ADDR, MT6359_RG_VMODEM_FCCM_SHIFT),
-	MT6359_BUCK("buck_vpu", VPU, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vpu", VPU, "vsys-vpu", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPU_EN_ADDR,
 		    MT6359_DA_VPU_EN_ADDR, MT6359_RG_BUCK_VPU_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPU_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPU_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPU_LP_ADDR, MT6359_RG_BUCK_VPU_LP_SHIFT,
 		    MT6359_RG_VPU_FCCM_ADDR, MT6359_RG_VPU_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore", VCORE, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vcore", VCORE, "vsys-vcore", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VCORE_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR, MT6359_RG_BUCK_VCORE_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VCORE_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VCORE_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_BUCK("buck_vs2", VS2, 800000, 1600000, 12500,
+	MT6359_BUCK("buck_vs2", VS2, "vsys-vs2", 800000, 1600000, 12500,
 		    MT6359_RG_BUCK_VS2_EN_ADDR,
 		    MT6359_DA_VS2_EN_ADDR, MT6359_RG_BUCK_VS2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS2_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS2_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS2_LP_ADDR, MT6359_RG_BUCK_VS2_LP_SHIFT,
 		    MT6359_RG_VS2_FPWM_ADDR, MT6359_RG_VS2_FPWM_SHIFT),
-	MT6359_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+	MT6359_BUCK("buck_vpa", VPA, "vsys-vpa", 500000, 3650000, 50000,
 		    MT6359_RG_BUCK_VPA_EN_ADDR,
 		    MT6359_DA_VPA_EN_ADDR, MT6359_RG_BUCK_VPA_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPA_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPA_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPA_LP_ADDR, MT6359_RG_BUCK_VPA_LP_SHIFT,
 		    MT6359_RG_VPA_MODESET_ADDR, MT6359_RG_VPA_MODESET_SHIFT),
-	MT6359_BUCK("buck_vproc2", VPROC2, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc2", VPROC2, "vsys-vproc2", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC2_EN_ADDR,
 		    MT6359_DA_VPROC2_EN_ADDR, MT6359_RG_BUCK_VPROC2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC2_VOSEL_MASK <<
@@ -529,7 +536,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VPROC2_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC2_LP_SHIFT,
 		    MT6359_RG_VPROC2_FCCM_ADDR, MT6359_RG_VPROC2_FCCM_SHIFT),
-	MT6359_BUCK("buck_vproc1", VPROC1, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc1", VPROC1, "vsys-vproc1", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC1_EN_ADDR,
 		    MT6359_DA_VPROC1_EN_ADDR, MT6359_RG_BUCK_VPROC1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC1_VOSEL_MASK <<
@@ -537,7 +544,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VPROC1_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC1_LP_SHIFT,
 		    MT6359_RG_VPROC1_FCCM_ADDR, MT6359_RG_VPROC1_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore_sshub", VCORE_SSHUB, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vcore_sshub", VCORE_SSHUB, "vsys-vcore", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VCORE_SSHUB_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR,
 		    MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_ADDR,
@@ -545,158 +552,159 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_REG_FIXED("ldo_vaud18", VAUD18, MT6359_RG_LDO_VAUD18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaud18", VAUD18, "vs1-ldo1", MT6359_RG_LDO_VAUD18_EN_ADDR,
 			 MT6359_DA_VAUD18_B_EN_ADDR, 1800000),
-	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
+	MT6359_LDO("ldo_vsim1", VSIM1, "vsys-ldo2", vsim1_voltages,
 		   MT6359_RG_LDO_VSIM1_EN_ADDR, MT6359_RG_LDO_VSIM1_EN_SHIFT,
 		   MT6359_DA_VSIM1_B_EN_ADDR, MT6359_RG_VSIM1_VOSEL_ADDR,
 		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
+	MT6359_LDO("ldo_vibr", VIBR, "vsys-ldo1", vibr_voltages,
 		   MT6359_RG_LDO_VIBR_EN_ADDR, MT6359_RG_LDO_VIBR_EN_SHIFT,
 		   MT6359_DA_VIBR_B_EN_ADDR, MT6359_RG_VIBR_VOSEL_ADDR,
 		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
+	MT6359_LDO("ldo_vrf12", VRF12, "vs2-ldo2", vrf12_voltages,
 		   MT6359_RG_LDO_VRF12_EN_ADDR, MT6359_RG_LDO_VRF12_EN_SHIFT,
 		   MT6359_DA_VRF12_B_EN_ADDR, MT6359_RG_VRF12_VOSEL_ADDR,
 		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
 		   120),
-	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359_RG_LDO_VUSB_EN_0_ADDR,
+	MT6359_REG_FIXED("ldo_vusb", VUSB, "vsys-ldo2", MT6359_RG_LDO_VUSB_EN_0_ADDR,
 			 MT6359_DA_VUSB_B_EN_ADDR, 3000000),
-	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_PROC2_EN_ADDR,
 			  MT6359_DA_VSRAM_PROC2_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
+	MT6359_LDO("ldo_vio18", VIO18, "vs1-ldo2", volt18_voltages,
 		   MT6359_RG_LDO_VIO18_EN_ADDR, MT6359_RG_LDO_VIO18_EN_SHIFT,
 		   MT6359_DA_VIO18_B_EN_ADDR, MT6359_RG_VIO18_VOSEL_ADDR,
 		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
+	MT6359_LDO("ldo_vcamio", VCAMIO, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VCAMIO_EN_ADDR, MT6359_RG_LDO_VCAMIO_EN_SHIFT,
 		   MT6359_DA_VCAMIO_B_EN_ADDR, MT6359_RG_VCAMIO_VOSEL_ADDR,
 		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
 		   1290),
-	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359_RG_LDO_VCN18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vcn18", VCN18, "vs1-ldo2", MT6359_RG_LDO_VCN18_EN_ADDR,
 			 MT6359_DA_VCN18_B_EN_ADDR, 1800000),
-	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359_RG_LDO_VFE28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vfe28", VFE28, "vsys-ldo1", MT6359_RG_LDO_VFE28_EN_ADDR,
 			 MT6359_DA_VFE28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
+	MT6359_LDO("ldo_vcn13", VCN13, "vs2-ldo2", vcn13_voltages,
 		   MT6359_RG_LDO_VCN13_EN_ADDR, MT6359_RG_LDO_VCN13_EN_SHIFT,
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359_RG_LDO_VAUX18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
-	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
+	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
 			  6250,
 			  MT6359_RG_LDO_VSRAM_OTHERS_EN_ADDR,
 			  MT6359_DA_VSRAM_OTHERS_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
+	MT6359_LDO("ldo_vefuse", VEFUSE, "vs1-ldo2", vefuse_voltages,
 		   MT6359_RG_LDO_VEFUSE_EN_ADDR, MT6359_RG_LDO_VEFUSE_EN_SHIFT,
 		   MT6359_DA_VEFUSE_B_EN_ADDR, MT6359_RG_VEFUSE_VOSEL_ADDR,
 		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
+	MT6359_LDO("ldo_vxo22", VXO22, "vsys-ldo2", vxo22_voltages,
 		   MT6359_RG_LDO_VXO22_EN_ADDR, MT6359_RG_LDO_VXO22_EN_SHIFT,
 		   MT6359_DA_VXO22_B_EN_ADDR, MT6359_RG_VXO22_VOSEL_ADDR,
 		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
 		   120),
-	MT6359_LDO("ldo_vrfck", VRFCK, vrfck_voltages,
+	MT6359_LDO("ldo_vrfck", VRFCK, "vsys-ldo2", vrfck_voltages,
 		   MT6359_RG_LDO_VRFCK_EN_ADDR, MT6359_RG_LDO_VRFCK_EN_SHIFT,
 		   MT6359_DA_VRFCK_B_EN_ADDR, MT6359_RG_VRFCK_VOSEL_ADDR,
 		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359_RG_LDO_VBIF28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vbif28", VBIF28, "vsys-ldo2", MT6359_RG_LDO_VBIF28_EN_ADDR,
 			 MT6359_DA_VBIF28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
+	MT6359_LDO("ldo_vio28", VIO28, "vsys-ldo2", vio28_voltages,
 		   MT6359_RG_LDO_VIO28_EN_ADDR, MT6359_RG_LDO_VIO28_EN_SHIFT,
 		   MT6359_DA_VIO28_B_EN_ADDR, MT6359_RG_VIO28_VOSEL_ADDR,
 		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vemc", VEMC, vemc_voltages,
+	MT6359_LDO("ldo_vemc", VEMC, "vsys-ldo2", vemc_voltages,
 		   MT6359_RG_LDO_VEMC_EN_ADDR, MT6359_RG_LDO_VEMC_EN_SHIFT,
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
 		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_va12", VA12, va12_voltages,
+	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
 		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_va09", VA09, va09_voltages,
+	MT6359_LDO("ldo_va09", VA09, "vs2-ldo2", va09_voltages,
 		   MT6359_RG_LDO_VA09_EN_ADDR, MT6359_RG_LDO_VA09_EN_SHIFT,
 		   MT6359_DA_VA09_B_EN_ADDR, MT6359_RG_VA09_VOSEL_ADDR,
 		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
+	MT6359_LDO("ldo_vrf18", VRF18, "vs1-ldo2", vrf18_voltages,
 		   MT6359_RG_LDO_VRF18_EN_ADDR, MT6359_RG_LDO_VRF18_EN_SHIFT,
 		   MT6359_DA_VRF18_B_EN_ADDR, MT6359_RG_VRF18_VOSEL_ADDR,
 		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
 		   120),
-	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1100000, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, "vs2-ldo1", 500000, 1100000, 6250,
 			  MT6359_RG_LDO_VSRAM_MD_EN_ADDR,
 			  MT6359_DA_VSRAM_MD_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
+	MT6359_LDO("ldo_vufs", VUFS, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VUFS_EN_ADDR, MT6359_RG_LDO_VUFS_EN_SHIFT,
 		   MT6359_DA_VUFS_B_EN_ADDR, MT6359_RG_VUFS_VOSEL_ADDR,
 		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
+	MT6359_LDO("ldo_vm18", VM18, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VM18_EN_ADDR, MT6359_RG_LDO_VM18_EN_SHIFT,
 		   MT6359_DA_VM18_B_EN_ADDR, MT6359_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
+	/* vbbck is fed from vio18 internally. */
+	MT6359_LDO("ldo_vbbck", VBBCK, "VIO18", vbbck_voltages,
 		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359_DA_VBBCK_B_EN_ADDR, MT6359_RG_VBBCK_VOSEL_ADDR,
 		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_PROC1_EN_ADDR,
 			  MT6359_DA_VSRAM_PROC1_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
+	MT6359_LDO("ldo_vsim2", VSIM2, "vsys-ldo2", vsim2_voltages,
 		   MT6359_RG_LDO_VSIM2_EN_ADDR, MT6359_RG_LDO_VSIM2_EN_SHIFT,
 		   MT6359_DA_VSIM2_B_EN_ADDR, MT6359_RG_VSIM2_VOSEL_ADDR,
 		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
+	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, "vs2-ldo1",
 			  500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
 			  MT6359_DA_VSRAM_OTHERS_B_EN_ADDR,
@@ -706,14 +714,14 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 };
 
 static const struct mt6359_regulator_info mt6359p_regulators[] = {
-	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
+	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS1_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS1_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS1_LP_ADDR, MT6359_RG_BUCK_VS1_LP_SHIFT,
 		    MT6359_RG_VS1_FPWM_ADDR, MT6359_RG_VS1_FPWM_SHIFT),
-	MT6359_BUCK("buck_vgpu11", VGPU11, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11", VGPU11, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VGPU11_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR, MT6359P_RG_BUCK_VGPU11_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VGPU11_VOSEL_MASK <<
@@ -721,7 +729,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_BUCK("buck_vmodem", VMODEM, 400000, 1100000, 6250,
+	MT6359_BUCK("buck_vmodem", VMODEM, "vsys-vmodem", 400000, 1100000, 6250,
 		    MT6359_RG_BUCK_VMODEM_EN_ADDR,
 		    MT6359_DA_VMODEM_EN_ADDR, MT6359_RG_BUCK_VMODEM_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VMODEM_VOSEL_MASK <<
@@ -729,35 +737,35 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VMODEM_LP_ADDR,
 		    MT6359_RG_BUCK_VMODEM_LP_SHIFT,
 		    MT6359_RG_VMODEM_FCCM_ADDR, MT6359_RG_VMODEM_FCCM_SHIFT),
-	MT6359_BUCK("buck_vpu", VPU, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vpu", VPU, "vsys-vpu", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPU_EN_ADDR,
 		    MT6359_DA_VPU_EN_ADDR, MT6359_RG_BUCK_VPU_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPU_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPU_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPU_LP_ADDR, MT6359_RG_BUCK_VPU_LP_SHIFT,
 		    MT6359_RG_VPU_FCCM_ADDR, MT6359_RG_VPU_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore", VCORE, 506250, 1300000, 6250,
+	MT6359_BUCK("buck_vcore", VCORE, "vsys-vcore", 506250, 1300000, 6250,
 		    MT6359_RG_BUCK_VCORE_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR, MT6359P_RG_BUCK_VCORE_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VCORE_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VCORE_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_BUCK("buck_vs2", VS2, 800000, 1600000, 12500,
+	MT6359_BUCK("buck_vs2", VS2, "vsys-vs2", 800000, 1600000, 12500,
 		    MT6359_RG_BUCK_VS2_EN_ADDR,
 		    MT6359_DA_VS2_EN_ADDR, MT6359_RG_BUCK_VS2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS2_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS2_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS2_LP_ADDR, MT6359_RG_BUCK_VS2_LP_SHIFT,
 		    MT6359_RG_VS2_FPWM_ADDR, MT6359_RG_VS2_FPWM_SHIFT),
-	MT6359_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+	MT6359_BUCK("buck_vpa", VPA, "vsys-vpa", 500000, 3650000, 50000,
 		    MT6359_RG_BUCK_VPA_EN_ADDR,
 		    MT6359_DA_VPA_EN_ADDR, MT6359_RG_BUCK_VPA_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPA_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPA_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPA_LP_ADDR, MT6359_RG_BUCK_VPA_LP_SHIFT,
 		    MT6359_RG_VPA_MODESET_ADDR, MT6359_RG_VPA_MODESET_SHIFT),
-	MT6359_BUCK("buck_vproc2", VPROC2, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc2", VPROC2, "vsys-vproc2", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC2_EN_ADDR,
 		    MT6359_DA_VPROC2_EN_ADDR, MT6359_RG_BUCK_VPROC2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC2_VOSEL_MASK <<
@@ -765,7 +773,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VPROC2_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC2_LP_SHIFT,
 		    MT6359_RG_VPROC2_FCCM_ADDR, MT6359_RG_VPROC2_FCCM_SHIFT),
-	MT6359_BUCK("buck_vproc1", VPROC1, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc1", VPROC1, "vsys-vproc1", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC1_EN_ADDR,
 		    MT6359_DA_VPROC1_EN_ADDR, MT6359_RG_BUCK_VPROC1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC1_VOSEL_MASK <<
@@ -773,7 +781,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VPROC1_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC1_LP_SHIFT,
 		    MT6359_RG_VPROC1_FCCM_ADDR, MT6359_RG_VPROC1_FCCM_SHIFT),
-	MT6359_BUCK("buck_vgpu11_sshub", VGPU11_SSHUB, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11_sshub", VGPU11_SSHUB, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359P_RG_BUCK_VGPU11_SSHUB_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR,
 		    MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_ADDR,
@@ -782,161 +790,161 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_REG_FIXED("ldo_vaud18", VAUD18, MT6359P_RG_LDO_VAUD18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaud18", VAUD18, "vs1-ldo1", MT6359P_RG_LDO_VAUD18_EN_ADDR,
 			 MT6359P_DA_VAUD18_B_EN_ADDR, 1800000),
-	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
+	MT6359_LDO("ldo_vsim1", VSIM1, "vsys-ldo2", vsim1_voltages,
 		   MT6359P_RG_LDO_VSIM1_EN_ADDR, MT6359P_RG_LDO_VSIM1_EN_SHIFT,
 		   MT6359P_DA_VSIM1_B_EN_ADDR, MT6359P_RG_VSIM1_VOSEL_ADDR,
 		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
+	MT6359_LDO("ldo_vibr", VIBR, "vsys-ldo1", vibr_voltages,
 		   MT6359P_RG_LDO_VIBR_EN_ADDR, MT6359P_RG_LDO_VIBR_EN_SHIFT,
 		   MT6359P_DA_VIBR_B_EN_ADDR, MT6359P_RG_VIBR_VOSEL_ADDR,
 		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
+	MT6359_LDO("ldo_vrf12", VRF12, "vs2-ldo2", vrf12_voltages,
 		   MT6359P_RG_LDO_VRF12_EN_ADDR, MT6359P_RG_LDO_VRF12_EN_SHIFT,
 		   MT6359P_DA_VRF12_B_EN_ADDR, MT6359P_RG_VRF12_VOSEL_ADDR,
 		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359P_RG_LDO_VUSB_EN_0_ADDR,
+	MT6359_REG_FIXED("ldo_vusb", VUSB, "vsys-ldo2", MT6359P_RG_LDO_VUSB_EN_0_ADDR,
 			 MT6359P_DA_VUSB_B_EN_ADDR, 3000000),
-	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_PROC2_EN_ADDR,
 			  MT6359P_DA_VSRAM_PROC2_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_PROC2_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
+	MT6359_LDO("ldo_vio18", VIO18, "vs1-ldo2", volt18_voltages,
 		   MT6359P_RG_LDO_VIO18_EN_ADDR, MT6359P_RG_LDO_VIO18_EN_SHIFT,
 		   MT6359P_DA_VIO18_B_EN_ADDR, MT6359P_RG_VIO18_VOSEL_ADDR,
 		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
+	MT6359_LDO("ldo_vcamio", VCAMIO, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VCAMIO_EN_ADDR,
 		   MT6359P_RG_LDO_VCAMIO_EN_SHIFT,
 		   MT6359P_DA_VCAMIO_B_EN_ADDR, MT6359P_RG_VCAMIO_VOSEL_ADDR,
 		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
 		   1290),
-	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359P_RG_LDO_VCN18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vcn18", VCN18, "vs1-ldo2", MT6359P_RG_LDO_VCN18_EN_ADDR,
 			 MT6359P_DA_VCN18_B_EN_ADDR, 1800000),
-	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359P_RG_LDO_VFE28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vfe28", VFE28, "vsys-ldo1", MT6359P_RG_LDO_VFE28_EN_ADDR,
 			 MT6359P_DA_VFE28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
+	MT6359_LDO("ldo_vcn13", VCN13, "vs2-ldo2", vcn13_voltages,
 		   MT6359P_RG_LDO_VCN13_EN_ADDR, MT6359P_RG_LDO_VCN13_EN_SHIFT,
 		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
 		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359P_RG_LDO_VAUX18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359P_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
-	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
+	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
 			  6250,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_EN_ADDR,
 			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
+	MT6359_LDO("ldo_vefuse", VEFUSE, "vs1-ldo2", vefuse_voltages,
 		   MT6359P_RG_LDO_VEFUSE_EN_ADDR,
 		   MT6359P_RG_LDO_VEFUSE_EN_SHIFT,
 		   MT6359P_DA_VEFUSE_B_EN_ADDR, MT6359P_RG_VEFUSE_VOSEL_ADDR,
 		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
+	MT6359_LDO("ldo_vxo22", VXO22, "vsys-ldo2", vxo22_voltages,
 		   MT6359P_RG_LDO_VXO22_EN_ADDR, MT6359P_RG_LDO_VXO22_EN_SHIFT,
 		   MT6359P_DA_VXO22_B_EN_ADDR, MT6359P_RG_VXO22_VOSEL_ADDR,
 		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vrfck_1", VRFCK, vrfck_voltages_1,
+	MT6359_LDO("ldo_vrfck_1", VRFCK, "vsys-ldo2", vrfck_voltages_1,
 		   MT6359P_RG_LDO_VRFCK_EN_ADDR, MT6359P_RG_LDO_VRFCK_EN_SHIFT,
 		   MT6359P_DA_VRFCK_B_EN_ADDR, MT6359P_RG_VRFCK_VOSEL_ADDR,
 		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359P_RG_LDO_VBIF28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vbif28", VBIF28, "vsys-ldo2", MT6359P_RG_LDO_VBIF28_EN_ADDR,
 			 MT6359P_DA_VBIF28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
+	MT6359_LDO("ldo_vio28", VIO28, "vsys-ldo2", vio28_voltages,
 		   MT6359P_RG_LDO_VIO28_EN_ADDR, MT6359P_RG_LDO_VIO28_EN_SHIFT,
 		   MT6359P_DA_VIO28_B_EN_ADDR, MT6359P_RG_VIO28_VOSEL_ADDR,
 		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
 		   1920),
-	MT6359P_LDO1("ldo_vemc_1", VEMC, mt6359p_vemc_ops, vemc_voltages_1,
+	MT6359P_LDO1("ldo_vemc_1", VEMC, "vsys-ldo2", mt6359p_vemc_ops, vemc_voltages_1,
 		     MT6359P_RG_LDO_VEMC_EN_ADDR, MT6359P_RG_LDO_VEMC_EN_SHIFT,
 		     MT6359P_DA_VEMC_B_EN_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_va12", VA12, va12_voltages,
+	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
 		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
 		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_va09", VA09, va09_voltages,
+	MT6359_LDO("ldo_va09", VA09, "vs2-ldo2", va09_voltages,
 		   MT6359P_RG_LDO_VA09_EN_ADDR, MT6359P_RG_LDO_VA09_EN_SHIFT,
 		   MT6359P_DA_VA09_B_EN_ADDR, MT6359P_RG_VA09_VOSEL_ADDR,
 		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
+	MT6359_LDO("ldo_vrf18", VRF18, "vs1-ldo2", vrf18_voltages,
 		   MT6359P_RG_LDO_VRF18_EN_ADDR, MT6359P_RG_LDO_VRF18_EN_SHIFT,
 		   MT6359P_DA_VRF18_B_EN_ADDR, MT6359P_RG_VRF18_VOSEL_ADDR,
 		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_MD_EN_ADDR,
 			  MT6359P_DA_VSRAM_MD_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_MD_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
+	MT6359_LDO("ldo_vufs", VUFS, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VUFS_EN_ADDR, MT6359P_RG_LDO_VUFS_EN_SHIFT,
 		   MT6359P_DA_VUFS_B_EN_ADDR, MT6359P_RG_VUFS_VOSEL_ADDR,
 		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
+	MT6359_LDO("ldo_vm18", VM18, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SHIFT,
 		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
+	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
 		   MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_PROC1_EN_ADDR,
 			  MT6359P_DA_VSRAM_PROC1_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_PROC1_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
+	MT6359_LDO("ldo_vsim2", VSIM2, "vsys-ldo2", vsim2_voltages,
 		   MT6359P_RG_LDO_VSIM2_EN_ADDR, MT6359P_RG_LDO_VSIM2_EN_SHIFT,
 		   MT6359P_DA_VSIM2_B_EN_ADDR, MT6359P_RG_VSIM2_VOSEL_ADDR,
 		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
+	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, "vs2-ldo1",
 			  500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
 			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
@@ -951,6 +959,7 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	const struct mt6359_regulator_info *mt6359_info;
+	const char *vio18_name;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
@@ -962,16 +971,37 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	else
 		mt6359_info = mt6359_regulators;
 
+	vio18_name = mt6359_info[MT6359_ID_VIO18].desc.name;
+
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
 	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
+		const struct regulator_desc *desc = &mt6359_info->desc;
+		struct regulator_desc *_desc;
+
 		/* drop const here, but all uses in the driver are const */
 		config.driver_data = (void *)mt6359_info;
-		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
+
+		/* Use vio18's actual name as supply_name for vbbck */
+		if (i == MT6359_ID_VBBCK && strcmp(desc->supply_name, vio18_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vio18_name;
+			desc = _desc;
+		}
+
+		rdev = devm_regulator_register(&pdev->dev, desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
 			return PTR_ERR(rdev);
 		}
+
+		/* Save vio18 name for vbbck */
+		if (i == MT6359_ID_VIO18)
+			vio18_name = rdev_get_name(rdev);
 	}
 
 	return 0;
-- 
2.54.0.563.g4f69b47b94-goog


