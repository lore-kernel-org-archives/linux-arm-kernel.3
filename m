Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111C0CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5etgYsBXYRY21dzsS1tcrTyoaXVxUAKaWNhCjUAI0nw=; b=pmf2EXfiaIaKyeAXzbu2lBfZIP
	iFnjf2flSSMv9LEWjuGuwu8aVzQtUSaDPJ+HvkLERBAk+cJ+ddp2hYqVahabYt4TFyv74RPPvV0+D
	ykLwy3N5PNRhCvI9itbSKgCgT6Tkmh9r7l8k0I7h9gXMYJzy00YZVRe64qMgKUSlheCPP2jZBZkBr
	pF70ja0aZjgnsQpm7A+rpXMKMnCo0PJc+ceoQsuzbv2NBw3T6O8HWbMLeBGII2py1uvFjT0NKBH15
	8CHFpsd0e2lMiLdNFW+pyq8IeWoGv6lEOKvLCyRDm5Qa+zi2im5wI4GmGSr40d8U7+iFqeweVapFD
	jBSasTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisw-0000000G9V2-4A32;
	Tue, 12 May 2026 08:54:38 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiss-0000000G9OE-24Ik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso2376472a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576074; x=1779180874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5etgYsBXYRY21dzsS1tcrTyoaXVxUAKaWNhCjUAI0nw=;
        b=PuCDPN6zGlclY7XRoDN3X9opBOJKFATBQFpXCSaS3QOsqvKBEknwWeJwlR8xfU3ujd
         LFO3BMMLPw1j1VtIKDgvwT90j2t/LrZMiqlvR2TYJnmBM5iy+kOvfbA1QUS+BxMdmCzV
         LUlKKBeegKVbRUKJSKfH0ORFSKnaatIBtBoFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576074; x=1779180874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5etgYsBXYRY21dzsS1tcrTyoaXVxUAKaWNhCjUAI0nw=;
        b=hr8UEy1H7ds9+hHmFmuvvmgs+SqxPBCKMdFqugXfyh78TwwrNYdFwGBNOBBOuR5vc3
         Sy5MVwt+jswJBB3+Y+Ha6/WywxBM6yii3MbtIa6pd+V337KcUrcYdDkNgyKJ7L2n94Yy
         0igGFdhFuOeuDMcSiKHIvkVJ++0VU8fcYKzN3OceqzfDnT0HaL3+ZAJFktOtNBdjM4sE
         c6mDkieI6SG3wtluwpmBKAt3jf5uAv7WUHTI7AMC22FAvqt9dfYm30pDsJR0cXo7y4eP
         K9nVlkQfMKBIUu+vCrJNcZo9hfDPFo/5tRPahHeJ6CsmzKtYhdSbm2APQurj0382qI0y
         EVcw==
X-Forwarded-Encrypted: i=1; AFNElJ/OEf+wi3ezxPYVjUz18H9afkdnSyW+x4QliRWYFvwot5OFXngmkAfzxK8pU6TxONXhrz/0YujvkXZEai/emi1T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz49zWHKgWNbGLgXhglggxV+DMWAGq4hit1PBaUToxcvOEPMJKe
	Q15jSlBv9g8JrcnfLBuO7d60Q6PCfbT6D861c9vXsLiKC4Mm8oJPLNAatZJwKLlWNg==
X-Gm-Gg: Acq92OEm9STOBriahehHmXc9cySTLe5AZLXK6jGGs8MTlNp81JpDSoR5Il7DgQm4v1G
	bZfFyiB7dfIw16aimzjkG3LJ+LWRtqRoNo0thRD3ogGiisxHTXoIirRzfghfqcSLK7iDnB8C1M4
	dPO00pvwQIGurstnZJOLvvjQjRgv4glaorDoBMjUPlUm6mk8tzSBrhgHrtIIAwgIgKoKzMcG55v
	wDookhVWVJ4XzifMI5B2WksPGljeuH7tI3LPmMJy2cb9Y7JJyI4QIatcTVTXzoQKmLX67f9uUWd
	yENpme5c9iflUQA9MSm5InfuBDOOFxjxdsCmG0C5+XUo0EkN+e/AP3XEjyImsm9SYkVF2jAssQl
	LFUP1ykyXEhFb4KNOLZ5nMDXzbqnAEPgNTouj6kUeetseoGXMZoFh0KUVafykK5g8oycIMl21Nk
	uF+SnkjqoA0/xYNlmySq/u+lMtyXB9kTokqFjt4dvHkmqjc+3T8njSdfGz7BQTfYdngM585mWCG
	O0LbDNb
X-Received: by 2002:a05:6a21:e081:b0:3ab:e30:ee9a with SMTP id adf61e73a8af0-3ad96c69768mr2580259637.20.1778576073844;
        Tue, 12 May 2026 01:54:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:33 -0700 (PDT)
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
Subject: [PATCH v3 6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
Date: Tue, 12 May 2026 16:53:54 +0800
Message-ID: <20260512085358.1693208-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015434_568299_9E6CAD2B 
X-CRM114-Status: GOOD (  25.87  )
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

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them. These have been deprecated in favor of proper
nodes matching the output.

Add proper ldo_vcn33_[12] regulators to replace the existing ones. The
enable status is synced to just one of the two enable bits, and the
other is forced off. This makes the handling in other bits simpler.

The existing *_(bt|wifi) regulators are converted to no-op regulators
that are fed from their new respective ldo_vcn33_[12] regulator. This
allows existing device trees to continue to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Instead of dropping one regulator from each output, add a new one for
  each output; the existing *_(bt|wifi) ones are then supplied from the
  new one
---
 drivers/regulator/mt6359-regulator.c       | 179 +++++++++++++++++----
 include/linux/regulator/mt6359-regulator.h |  10 +-
 2 files changed, 154 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index fa97c3189df5..cd489adf9a2a 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -166,6 +166,20 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),					\
 }
 
+#define MT6359_LDO_NOOP(match, _name, supply)		\
+[MT6359_ID_##_name] = {					\
+	.desc = {					\
+		.name = #_name,				\
+		.supply_name = supply,			\
+		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.ops = &mt6359_noop_ops,		\
+		.type = REGULATOR_VOLTAGE,		\
+		.id = MT6359_ID_##_name,		\
+		.owner = THIS_MODULE,			\
+	},						\
+}
+
 static const unsigned int vsim1_voltages[] = {
 	0, 0, 0, 1700000, 1800000, 0, 0, 0, 2700000, 0, 0, 3000000, 3100000,
 };
@@ -475,6 +489,9 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 	.get_status = mt6359_get_status,
 };
 
+/* Used for backward-compatible placeholder regulators */
+static const struct regulator_ops mt6359_noop_ops = {};
+
 /* The array is indexed by id(MT6359_ID_XXX) */
 static const struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
@@ -596,18 +613,12 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1", VCN33_1, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
@@ -644,18 +655,12 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
 		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2", VCN33_2, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
@@ -711,6 +716,11 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
+	/* Placeholders for DT backward compatibility */
+	MT6359_LDO_NOOP("ldo_vcn33_1_bt",   VCN33_1_BT,   "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_1_wifi", VCN33_1_WIFI, "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_bt",   VCN33_2_BT,   "LDO_VCN33_2"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_wifi", VCN33_2_WIFI, "LDO_VCN33_2"),
 };
 
 static const struct mt6359_regulator_info mt6359p_regulators[] = {
@@ -835,18 +845,12 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1", VCN33_1, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359P_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
@@ -885,18 +889,12 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2", VCN33_2, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
 		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
@@ -951,27 +949,114 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
+	/* Placeholders for DT backward compatibility */
+	MT6359_LDO_NOOP("ldo_vcn33_1_bt",   VCN33_1_BT,   "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_1_wifi", VCN33_1_WIFI, "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_bt",   VCN33_2_BT,   "LDO_VCN33_2"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_wifi", VCN33_2_WIFI, "LDO_VCN33_2"),
+};
+
+struct mt6359_vcn33_regs {
+	u32 wifi_en_reg;
+	u32 wifi_en_mask;
+	u32 bt_en_reg;
+	u32 bt_en_mask;
+};
+
+static const struct mt6359_vcn33_regs vcn33_regs[][2] = {
+	{ /* MT6359 */
+		{
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}, { /* MT6359P */
+		{
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}
 };
 
+static int mt6359_sync_vcn33_setting(struct device *dev, unsigned int idx)
+{
+	struct mt6397_chip *mt6397 = dev_get_drvdata(dev->parent);
+	unsigned int val;
+	int ret;
+
+	/*
+	 * VCN33_[12]_WIFI and VCN33_[12]_BT are two separate enable bits for
+	 * the same regulator. They share the same voltage setting and output
+	 * pin. Instead of having two potentially conflicting regulators, just
+	 * have one regulator. Sync the two enable bits and only use one in
+	 * the regulator device.
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(vcn33_regs[0]); i++) {
+		u32 bt_en_mask = vcn33_regs[idx][i].bt_en_mask;
+		u32 wifi_en_mask = vcn33_regs[idx][i].wifi_en_mask;
+
+		ret = regmap_read(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg, &val);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read VCN33_%u_WIFI setting\n", i);
+
+		if (!(val & wifi_en_mask))
+			continue;
+
+		/* Sync VCN33_[12]_WIFI enable status to VCN33_[12]_BT */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].bt_en_reg,
+					 bt_en_mask, bt_en_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to sync VCN33_%u_WIFI setting to VCN33_%u_BT\n",
+					     i, i);
+
+		/* Disable VCN33_[12]_WIFI */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg,
+					 wifi_en_mask, 0);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to disable VCN33_%u_WIFI\n", i);
+	}
+
+	return 0;
+}
+
 static int mt6359_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	const struct mt6359_regulator_info *mt6359_info;
-	const char *vio18_name;
+	const char *vio18_name, *vcn33_1_name, *vcn33_2_name;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
 	if (ret)
 		return ret;
 
-	if (hw_ver >= MT6359P_CHIP_VER)
+	if (hw_ver >= MT6359P_CHIP_VER) {
 		mt6359_info = mt6359p_regulators;
-	else
+		mt6359_sync_vcn33_setting(&pdev->dev, 1);
+	} else {
 		mt6359_info = mt6359_regulators;
+		mt6359_sync_vcn33_setting(&pdev->dev, 0);
+	}
 
 	vio18_name = mt6359_info[MT6359_ID_VIO18].desc.name;
+	vcn33_1_name = mt6359_info[MT6359_ID_VCN33_1].desc.name;
+	vcn33_2_name = mt6359_info[MT6359_ID_VCN33_2].desc.name;
 
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
@@ -993,6 +1078,30 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 			desc = _desc;
 		}
 
+		/* Use vcn33_1's actual name as supply_name for vcn33_1_(bt|wifi) */
+		if ((i == MT6359_ID_VCN33_1_BT || i == MT6359_ID_VCN33_1_WIFI) &&
+		    strcmp(desc->supply_name, vcn33_1_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vcn33_1_name;
+			desc = _desc;
+		}
+
+		/* Use vcn33_2's actual name as supply_name for vcn33_2_(bt|wifi) */
+		if ((i == MT6359_ID_VCN33_2_BT || i == MT6359_ID_VCN33_2_WIFI) &&
+		    strcmp(desc->supply_name, vcn33_2_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vcn33_2_name;
+			desc = _desc;
+		}
+
 		rdev = devm_regulator_register(&pdev->dev, desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
@@ -1002,6 +1111,14 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 		/* Save vio18 name for vbbck */
 		if (i == MT6359_ID_VIO18)
 			vio18_name = rdev_get_name(rdev);
+
+		/* Save vcn33_1 name for vbbck */
+		if (i == MT6359_ID_VCN33_1)
+			vcn33_1_name = rdev_get_name(rdev);
+
+		/* Save vcn33_2 name for vbbck */
+		if (i == MT6359_ID_VCN33_2)
+			vcn33_2_name = rdev_get_name(rdev);
 	}
 
 	return 0;
diff --git a/include/linux/regulator/mt6359-regulator.h b/include/linux/regulator/mt6359-regulator.h
index 6d6e5a58f482..ce2cd0fc9d95 100644
--- a/include/linux/regulator/mt6359-regulator.h
+++ b/include/linux/regulator/mt6359-regulator.h
@@ -29,8 +29,7 @@ enum {
 	MT6359_ID_VCN18,
 	MT6359_ID_VFE28,
 	MT6359_ID_VCN13,
-	MT6359_ID_VCN33_1_BT,
-	MT6359_ID_VCN33_1_WIFI,
+	MT6359_ID_VCN33_1,
 	MT6359_ID_VAUX18,
 	MT6359_ID_VSRAM_OTHERS,
 	MT6359_ID_VEFUSE,
@@ -39,8 +38,7 @@ enum {
 	MT6359_ID_VBIF28,
 	MT6359_ID_VIO28,
 	MT6359_ID_VEMC,
-	MT6359_ID_VCN33_2_BT,
-	MT6359_ID_VCN33_2_WIFI,
+	MT6359_ID_VCN33_2,
 	MT6359_ID_VA12,
 	MT6359_ID_VA09,
 	MT6359_ID_VRF18,
@@ -51,6 +49,10 @@ enum {
 	MT6359_ID_VSRAM_PROC1,
 	MT6359_ID_VSIM2,
 	MT6359_ID_VSRAM_OTHERS_SSHUB,
+	MT6359_ID_VCN33_1_BT,
+	MT6359_ID_VCN33_1_WIFI,
+	MT6359_ID_VCN33_2_BT,
+	MT6359_ID_VCN33_2_WIFI,
 	MT6359_ID_RG_MAX,
 };
 
-- 
2.54.0.563.g4f69b47b94-goog


