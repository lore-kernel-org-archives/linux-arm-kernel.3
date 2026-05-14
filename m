Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C897CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmGyVM5YVjSm9q1DM3xNQcfXG8d0gsrVHtcqTJJQD8M=; b=eppjatqV88ESQ44oPWobts0wcN
	RClcqD3U0uy11EByU/QEdLc8l7BDDfZcFdEqHuO8wqOESG5F91tkbRt0F5jwhHqF8OefqkbMm4x7Y
	NXsX57ZWu48xhT5rT3v9H1IhaoGlvxMMjGe/6Hb7uVsA73B9ftuw77VKeyUvt5ZCRdAnJ+qSyrcnV
	VYllLwsPZUMZtSTcvskalbRB3OJR8hv+x3zy9vzUXgruuGqS9NGkOTlq413Gek2ZnTr/BvDERfgXC
	sVYP/R9nJuI3DlrQZQ/v86b7gVQwXj2xCbcAasVzsPiB5fpyH4vs4eU7mlNsaI31jq9Mp65775Oac
	i9nclyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAg-000000051wg-363y;
	Thu, 14 May 2026 09:15:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAc-000000051rL-3i9O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3397179a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750154; x=1779354954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmGyVM5YVjSm9q1DM3xNQcfXG8d0gsrVHtcqTJJQD8M=;
        b=WJB2ywuSr8TFIslNgPfAdFX/913MMo4YnzDVpVKIWDjsAS6txCAqHd5UiLysmwqrHO
         h1ux/0s9IgM6EC5DvSVwt8iFOaWg90Lr7NWOEb8G49cGilIKwuhrcWcFgYGbcnN2X1KH
         KRA7TwxMQEmdJ5HSMIK865zl3V8uKETltvc4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750154; x=1779354954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VmGyVM5YVjSm9q1DM3xNQcfXG8d0gsrVHtcqTJJQD8M=;
        b=dErYDLxQ9wNSxp+Q/dNhLtKAoUAJL/skm0a3NGf96tVNhQuH8GdoD+xKVX4+Hny1gS
         YqeT3izEGsq4pCrKZRAaiAyp2y9m4q5zJ/3/t0kcTULZlsW24y6AF8lxK5xCfD7yZrN5
         fXeO9zbuuMA4WRdZdGKV48oDDCVSB96+BMK/jG8TEqrloywxXac28OF3x0/PnnmgTItr
         WBLUCCBBjkY3QUrEIFR4za2AuXOOsLL0suJ4vpUWY9jMCZgPg81Zc+GDFniPB96IYvLz
         TMzfztniETVTHKGMxAvk9YhRHf4ef+VUem85bEADjBmKhbfVegnFPqouY113oEo+TS+q
         vkWA==
X-Forwarded-Encrypted: i=1; AFNElJ8mJJmrG/LEHssYaDQ6KBbyS42eEI/WFQuPdMpOIyWhSjohbolgvszTwZUXqqMs3pvR2o4h/8Ki3Wb1Z6Mc/3nu@lists.infradead.org
X-Gm-Message-State: AOJu0YzXt77kmaK4j8yQjsQnbQI/6gcW5ltgND8KqWWRNOwbZjw7Kra0
	7FRA/WniDohekE0lDOi0RwXyEilouwjuyrfrZS8Nb51AAv8aBi55Zxpwb9EnEGbydg==
X-Gm-Gg: Acq92OFVxtznoNXXKgB2ndcAKKK3s6X3xaZKTtTI2ErNyq02UMl2VjUVUvXm9sEkD1S
	S5wEUbvyvIsXNQH8QP4Q5+gVqbElw+EOvjjQZsNN9SwBJ6ekIEe5D/Z9XbuPnk/B8SeUdageGSI
	FlK5v3V2+dAEOF6jLgZsh00BBImdDZuC94sSjTtx3jNFlgwVDHdEqkFe1+cGjKQoaWYVWzjiXqP
	i8RV3NX787exkru62Nf8OxgMjK/Y7kEmefiHQwqxEwtnGa3/0wticik6E+VZcmAnf3ZxSWBuyNR
	ZWzpW7C6ZkFzpr1JlolCsB9QQCVvqw9NKLJXaiLx0QquW9imQ38AQwcSjRVio6N6m+SNWOlye6x
	IuwNNG0AM8UdA1bdlYUIZhaICV1anXHXSQMm5w/Tj1XGL34OonAyxzsrnhYy79kXB/iBjJoo9tM
	P/poVqC0+KjEgOdk+5yeBC48pjJxFU3kftYNEYOplWu2cCiHFa8lW7fM5jPnr81x3AjeGKGp/Or
	5O8Rh25
X-Received: by 2002:a05:6a20:e293:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3af82287a7emr7784898637.31.1778750154016;
        Thu, 14 May 2026 02:15:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:53 -0700 (PDT)
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
Subject: [PATCH v4 6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
Date: Thu, 14 May 2026 17:15:19 +0800
Message-ID: <20260514091520.2718987-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021554_957205_B2FAA0ED 
X-CRM114-Status: GOOD (  24.40  )
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
Changes since v3:
- Fixed index off-by-one in error message in mt6359_sync_vcn33_setting()
  (Sashiko)
- Added check of return value from mt6359_sync_vcn33_setting() (Sashiko)

Changes since v1:
- Instead of dropping one regulator from each output, add a new one for
  each output; the existing *_(bt|wifi) ones are then supplied from the
  new one
---
 drivers/regulator/mt6359-regulator.c       | 184 +++++++++++++++++----
 include/linux/regulator/mt6359-regulator.h |  10 +-
 2 files changed, 159 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 46cafe93b24e..af0e0339fbdd 100644
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
@@ -951,27 +949,119 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
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
+			return dev_err_probe(dev, ret, "Failed to read VCN33_%u_WIFI setting\n",
+					     i + 1);
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
+					     i + 1, i + 1);
+
+		/* Disable VCN33_[12]_WIFI */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg,
+					 wifi_en_mask, 0);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to disable VCN33_%u_WIFI\n", i + 1);
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
+		ret = mt6359_sync_vcn33_setting(&pdev->dev, 1);
+		if (ret)
+			return ret;
+	} else {
 		mt6359_info = mt6359_regulators;
+		ret = mt6359_sync_vcn33_setting(&pdev->dev, 0);
+		if (ret)
+			return ret;
+	}
 
 	vio18_name = mt6359_info[MT6359_ID_VIO18].desc.name;
+	vcn33_1_name = mt6359_info[MT6359_ID_VCN33_1].desc.name;
+	vcn33_2_name = mt6359_info[MT6359_ID_VCN33_2].desc.name;
 
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
@@ -993,6 +1083,30 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
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
@@ -1002,6 +1116,14 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
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


