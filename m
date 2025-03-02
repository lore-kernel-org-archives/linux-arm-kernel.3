Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB08C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTGguG1InwPeM8Zdoc2kuvPS+tlTY8ez0QbSd3+eDaI=; b=J69Qohs4Tv4UI0OsTLvUcSW15s
	MjTGh9Bv4E+SDzg0/SV953QWIfXEoBaKyc77CLWshmk2ZcmVfRiDpHFE3sbQ9m6ollcqqI7xdo48w
	V5DDiU8HrsK0RfDdku92t+SIPqSYssML2qSo4WhIdrGu7qn/koQ1tupRQRUE5YhtTgCYRV2ojQVKu
	PrFu5yRDlJ8vGvtTMP6xFGZdurarVazNBRujST6acpkmwqYFVQkvRldAgdFRswkXbmrWOY1RWEAy0
	OonLmyf0WdIcSc8ubohGXNZkprck9mvxJ2dcv8E7CTM0dE1FBVS/f1YEt0Dmgi8n/X8QjC6E6ycKf
	FOS1+l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomaX-0000000GNkO-3Mk6;
	Sun, 02 Mar 2025 16:54:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomEj-0000000GKXn-11Yi;
	Sun, 02 Mar 2025 16:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933135;
	bh=dkyZL8Ll+sShg6MHgOZ7FrAdbANx4Hqmy6yr0yQHymI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CZlJm9Igmy1eJXBXLcfJEk+ySl7VBxuL/gpum500LF+q6co283Om8TsDAubUL3lEE
	 Wpz9WxNQLqZ6Sbs9eZ7zopwto6m78t4qtWdm0Xlhfc7SQyMJUJ/ROpmn9v/C11xtrO
	 /NF17KjKsyl18KsixGeDgR7NW+jUwnvJfeg9UJU38WJNU7zRD8dH3E/yHeIFNuBhiS
	 cC3qbuYL1a1ESC+l62QYcW5nuoJrpsY5Ul9Z4pFUf7VMTvCHNJA577qhjlTnE8Zh0U
	 FnJvFuE7e8wb4pPSZxLuAOPCcFNLuVoORGpCo9cZvyc9Us+MyYG/u53DC3IH/nK7ra
	 lsJj4Fdn7tPQA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F13DC17E05EA;
	Sun,  2 Mar 2025 17:32:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:53 -0300
Subject: [PATCH v2 14/20] ASoC: mediatek: mt6359-accdet: Always use eint
 detect mode 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-14-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083217_430031_5CAC9B46 
X-CRM114-Status: GOOD (  15.19  )
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

The driver currently reads a mediatek,eint-detect-mode property from DT,
which determines certain register configurations. Since there are no
users of the property, it doesn't directly describe the hardware, and
the default value (4) is known to work across multiple boards, remove
the handling for this property and always assume mode 4 is used. The
property can be properly introduced in the binding in the future if
different boards actually need different configurations.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 208 +++++++++++++--------------------------
 sound/soc/codecs/mt6359-accdet.h |   1 -
 2 files changed, 70 insertions(+), 139 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6728f1018c992fc9d4e4133dbaf091d256567683..83e65b6d5845dea00a8a77d68df4b7df1f62a87c 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -81,31 +81,22 @@ static void recover_eint_setting(struct mt6359_accdet *priv);
 
 static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
 {
-	if (priv->data->eint_detect_mode == 0x3 ||
-	    priv->data->eint_detect_mode == 0x4) {
-		/* ESD switches off */
-		regmap_update_bits(priv->regmap,
-				   RG_ACCDETSPARE_ADDR, 1 << 8, 0);
-	}
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable RG_EINT0CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT0CONFIGACCDET_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable RG_EINT1CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT1CONFIGACCDET_SFT));
-		}
-		/*select 500k, use internal resistor */
-		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
-				   RG_EINT0HIRENB_MASK_SFT,
-				   BIT(RG_EINT0HIRENB_SFT));
+	/* ESD switches off */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 0);
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* enable RG_EINT0CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+				   RG_EINT0CONFIGACCDET_MASK_SFT,
+				   BIT(RG_EINT0CONFIGACCDET_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable RG_EINT1CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
+				   RG_EINT1CONFIGACCDET_MASK_SFT,
+				   BIT(RG_EINT1CONFIGACCDET_SFT));
 	}
+	/*select 500k, use internal resistor */
+	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+			   RG_EINT0HIRENB_MASK_SFT, BIT(RG_EINT0HIRENB_SFT));
 	return 0;
 }
 
@@ -123,18 +114,14 @@ static unsigned int adjust_eint_digital_setting(struct mt6359_accdet *priv)
 				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT, 0);
 	}
 
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* set DA stable signal */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* set DA stable signal */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* set DA stable signal */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* set DA stable signal */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
 	}
 	return 0;
 }
@@ -159,27 +146,19 @@ static unsigned int mt6359_accdet_jd_setting(struct mt6359_accdet *priv)
 
 static void recover_eint_analog_setting(struct mt6359_accdet *priv)
 {
-	if (priv->data->eint_detect_mode == 0x3 ||
-	    priv->data->eint_detect_mode == 0x4) {
-		/* ESD switches on */
-		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
-				   1 << 8, 1 << 8);
-	}
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* disable RG_EINT0CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* disable RG_EINT1CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
-		}
-		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
-				   RG_EINT0HIRENB_MASK_SFT, 0);
+	/* ESD switches on */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 1 << 8);
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* disable RG_EINT0CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+				   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* disable RG_EINT1CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
+				   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
 	}
+	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+			   RG_EINT0HIRENB_MASK_SFT, 0);
 }
 
 static void recover_eint_digital_setting(struct mt6359_accdet *priv)
@@ -193,37 +172,30 @@ static void recover_eint_digital_setting(struct mt6359_accdet *priv)
 				   ACCDET_EINT1_M_SW_EN_ADDR,
 				   ACCDET_EINT1_M_SW_EN_MASK_SFT, 0);
 	}
-	if (priv->data->eint_detect_mode == 0x4) {
+	if (priv->caps & ACCDET_PMIC_EINT0) {
 		/* enable eint0cen */
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable eint0cen */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
-					   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable eint1cen */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
-					   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
-		}
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
+				   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable eint1cen */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
+				   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
 	}
 
-	if (priv->data->eint_detect_mode != 0x1) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable inverter */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable inverter */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* enable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 	}
 }
 
@@ -534,13 +506,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
-	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
-				   &priv->data->eint_detect_mode);
-	if (ret) {
-		/* eint detection mode equals to EINT HW Mode */
-		priv->data->eint_detect_mode = 0x4;
-	}
-
 	ret = of_property_read_u32(node, "mediatek,eint-num", &tmp);
 	if (ret)
 		tmp = 0;
@@ -592,31 +557,16 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 	/* enable PWM */
 	regmap_write(priv->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x67);
 	/* enable inverter detection */
-	if (priv->data->eint_detect_mode == 0x1) {
-		/* disable inverter detection */
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   0);
-		}
-	} else {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 	}
 
 	if (priv->data->hp_eint_high) {
@@ -649,28 +599,10 @@ static void config_eint_init_by_mode(struct mt6359_accdet *priv)
 	regmap_update_bits(priv->regmap, RG_NCP_PDDIS_EN_ADDR,
 			   RG_NCP_PDDIS_EN_MASK_SFT, BIT(RG_NCP_PDDIS_EN_SFT));
 
-	if (priv->data->eint_detect_mode == 0x1 ||
-	    priv->data->eint_detect_mode == 0x2 ||
-	    priv->data->eint_detect_mode == 0x3) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT0CONFIGACCDET_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT1CONFIGACCDET_SFT));
-		}
-	}
-
-	if (priv->data->eint_detect_mode != 0x1) {
-		/* current detect set 0.25uA */
-		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
-				   0x3 << RG_ACCDETSPARE_SFT,
-				   0x3 << RG_ACCDETSPARE_SFT);
-	}
+	/* current detect set 0.25uA */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+			   0x3 << RG_ACCDETSPARE_SFT,
+			   0x3 << RG_ACCDETSPARE_SFT);
 	regmap_write(priv->regmap, RG_EINTCOMPVTH_ADDR,
 		     val | priv->data->eint_comp_vth << RG_EINTCOMPVTH_SFT);
 }
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 287201eebe0330fa170093fd6192bf5694c30469..ff5cd6ea1b06f045b6e1b9f6bc53ef80d78e3b92 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -54,7 +54,6 @@ struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
 	bool hp_eint_high;
-	unsigned int eint_detect_mode;
 	unsigned int eint_comp_vth;
 };
 

-- 
2.48.1


