Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68883C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu6qZkZ1iHy77wxTGZ2aX47sKcBovBFRU4IVLIRcIeE=; b=KBFeuSYD+3Wj8HQaz4uyV3CLna
	zJAu1oa3uOJQShNwA/o/zpGAvnlPtIzzroBn+pTVFc3erQ4OfwxOCdU93ZSvoErjROsTjzdT+BLOh
	IkGQi00FpPOwPhiuIWRs8RYpiP5kMvM8WPJR55N87Pbume8PXm0U+DwAPsgPD6+xgRWM8ulU1etRF
	LMxdu/FbxMa4AXP3fGI95/IrSPuHVnYtHC3aO0h99rICZRZIA6NN1aC1XbkuKlWKYJDsr1gLD4bfF
	6fOUqdQgx0WrUq2Q4TTYS6fVqRXWJf3Tan4p1nLLmN4/61KMvRPgErjpnSyRJDMHSOL8A7fxTrIQc
	Bn9YOwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuRe-000000094eX-3ZdX;
	Wed, 05 Mar 2025 19:30:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptzG-000000090Yd-1Pn2;
	Wed, 05 Mar 2025 19:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201256;
	bh=wjZmjmhM6PnilSdM4uO4ct3TDNZO044budbRnrFXjT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ISNG8ZiTf1EZqXrPOGc3dX2beGSO99sRgCdoFefvRb3ktXWf7jWdmNiuRqQ4jBg33
	 CjYMNviP1e8021oHLyNgluyAn+GGe6V4MmTW9PPJAXnsmtmJzDjoP6aquYutEE4B5A
	 t08rkuupDRV/BqYrJ0E3FQEbJ1ZYllk46OfQH8Sz4JpL1Ls8rFNyvvcS+EgDjThHjG
	 40FbFU8ruAImXYDRjDAZq3ozeCCJtI+NSJRHRJf9f/oFQJh4oldmZYabLsrlAyG3Au
	 GLZGpl3rDYhDdrrJeg+pU6QqneDYkNeBBV44ZkBAOyLGZSH2FMJZkv/eSI0ytNXPrg
	 EXKbH47A+GDJA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 581DA17E0147;
	Wed,  5 Mar 2025 20:00:51 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:32 -0300
Subject: [PATCH v4 17/19] ASoC: mediatek: mt6359-accdet: Always use EINT0
 IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-17-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110058_711887_95F4FD6C 
X-CRM114-Status: GOOD (  20.54  )
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

The ACCDET block can generate two distinct EINT interrupts: EINT0 and
EINT1, and which is enabled is currently determined by mediatek,eint-num
property in DT. However, only EINT0 is used on the boards that are
known to have working ACCDET. Since there are no current users of the
property, remove its handling and instead always enable EINT0. The
property can be properly introduced in the binding in the future if it
really turns out that other boards require EINT1.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 187 +++++++++------------------------------
 sound/soc/codecs/mt6359-accdet.h |   1 -
 2 files changed, 43 insertions(+), 145 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 3f6a97e8de8d174e59e512d53135fadc5765b5c1..b1e63f3f7fa44687b1cac47c0e33f68a28e15a47 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -31,10 +31,6 @@
 #define REGISTER_VAL(x)	((x) - 1)
 
 /* mt6359 accdet capability */
-#define ACCDET_PMIC_EINT0		BIT(2)
-#define ACCDET_PMIC_EINT1		BIT(3)
-#define ACCDET_PMIC_BI_EINT		BIT(4)
-
 #define ACCDET_PMIC_RSV_EINT		BIT(7)
 
 #define ACCDET_RSV_KEY			BIT(11)
@@ -84,17 +80,10 @@ static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
 {
 	/* ESD switches off */
 	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 0);
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* enable RG_EINT0CONFIGACCDET */
-		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
-				   RG_EINT0CONFIGACCDET_MASK_SFT,
-				   BIT(RG_EINT0CONFIGACCDET_SFT));
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* enable RG_EINT1CONFIGACCDET */
-		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
-				   RG_EINT1CONFIGACCDET_MASK_SFT,
-				   BIT(RG_EINT1CONFIGACCDET_SFT));
-	}
+	/* enable RG_EINT0CONFIGACCDET */
+	regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+			   RG_EINT0CONFIGACCDET_MASK_SFT,
+			   BIT(RG_EINT0CONFIGACCDET_SFT));
 	/*select 500k, use internal resistor */
 	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
 			   RG_EINT0HIRENB_MASK_SFT, BIT(RG_EINT0HIRENB_SFT));
@@ -103,27 +92,13 @@ static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
 
 static unsigned int adjust_eint_digital_setting(struct mt6359_accdet *priv)
 {
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* disable inverter */
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT, 0);
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* disable inverter */
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT, 0);
-	}
+	/* disable inverter */
+	regmap_update_bits(priv->regmap, ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+			   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT, 0);
 
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* set DA stable signal */
-		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
-				   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* set DA stable signal */
-		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
-				   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
-	}
+	/* set DA stable signal */
+	regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+			   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
 	return 0;
 }
 
@@ -149,55 +124,26 @@ static void recover_eint_analog_setting(struct mt6359_accdet *priv)
 {
 	/* ESD switches on */
 	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 1 << 8);
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* disable RG_EINT0CONFIGACCDET */
-		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
-				   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* disable RG_EINT1CONFIGACCDET */
-		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
-				   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
-	}
+	/* disable RG_EINT0CONFIGACCDET */
+	regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+			   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
 	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
 			   RG_EINT0HIRENB_MASK_SFT, 0);
 }
 
 static void recover_eint_digital_setting(struct mt6359_accdet *priv)
 {
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT0_M_SW_EN_ADDR,
-				   ACCDET_EINT0_M_SW_EN_MASK_SFT, 0);
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT1_M_SW_EN_ADDR,
-				   ACCDET_EINT1_M_SW_EN_MASK_SFT, 0);
-	}
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* enable eint0cen */
-		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
-				   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
-				   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* enable eint1cen */
-		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
-				   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
-				   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
-	}
-
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		/* enable inverter */
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		/* enable inverter */
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-	}
+	regmap_update_bits(priv->regmap, ACCDET_EINT0_M_SW_EN_ADDR,
+			   ACCDET_EINT0_M_SW_EN_MASK_SFT, 0);
+	/* enable eint0cen */
+	regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+			   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
+			   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+
+	/* enable inverter */
+	regmap_update_bits(priv->regmap, ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+			   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+			   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
 }
 
 static void recover_eint_setting(struct mt6359_accdet *priv)
@@ -486,10 +432,8 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 {
-	int ret;
 	struct device *dev = priv->dev;
 	struct device_node *node = NULL;
-	unsigned int tmp = 0;
 
 	node = of_get_child_by_name(dev->parent->of_node, "accdet");
 	if (!node)
@@ -497,16 +441,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
-	ret = of_property_read_u32(node, "mediatek,eint-num", &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0)
-		priv->caps |= ACCDET_PMIC_EINT0;
-	else if (tmp == 1)
-		priv->caps |= ACCDET_PMIC_EINT1;
-	else if (tmp == 2)
-		priv->caps |= ACCDET_PMIC_BI_EINT;
-
 	of_node_put(node);
 	dev_warn(priv->dev, "accdet caps=%x\n", priv->caps);
 
@@ -520,13 +454,8 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 		     (ACCDET_EINT_CMPMEN_PWM_WIDTH_400MS << 4 |
 		      ACCDET_EINT_CMPMEN_PWM_THRESH_2MS));
 	/* DA signal stable */
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
-			     ACCDET_EINT0_STABLE_VAL);
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
-			     ACCDET_EINT1_STABLE_VAL);
-	}
+	regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
+		     ACCDET_EINT0_STABLE_VAL);
 	/* after receive n+1 number, interrupt issued. */
 	regmap_update_bits(priv->regmap, ACCDET_EINT_M_PLUG_IN_NUM_ADDR,
 			   ACCDET_EINT_M_PLUG_IN_NUM_MASK_SFT,
@@ -543,17 +472,9 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 	/* enable PWM */
 	regmap_write(priv->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x67);
 	/* enable inverter detection */
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		regmap_update_bits(priv->regmap,
-				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-	}
+	regmap_update_bits(priv->regmap, ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+			   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+			   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
 
 	if (priv->data->hp_eint_high) {
 		/* EINT polarity inverse */
@@ -571,13 +492,8 @@ static void config_eint_init_by_mode(struct mt6359_accdet *priv)
 {
 	unsigned int val = 0;
 
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		regmap_update_bits(priv->regmap, RG_EINT0EN_ADDR,
-				   RG_EINT0EN_MASK_SFT, BIT(RG_EINT0EN_SFT));
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		regmap_update_bits(priv->regmap, RG_EINT1EN_ADDR,
-				   RG_EINT1EN_MASK_SFT, BIT(RG_EINT1EN_SFT));
-	}
+	regmap_update_bits(priv->regmap, RG_EINT0EN_ADDR, RG_EINT0EN_MASK_SFT,
+			   BIT(RG_EINT0EN_SFT));
 	/* ESD switches on */
 	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
 			   1 << 8, 1 << 8);
@@ -727,35 +643,18 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (priv->caps & ACCDET_PMIC_EINT0) {
-		priv->accdet_eint0 = platform_get_irq(pdev, 1);
-		if (priv->accdet_eint0 >= 0) {
-			ret = devm_request_threaded_irq(&pdev->dev,
-							priv->accdet_eint0,
-							NULL, mt6359_accdet_irq,
-							IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-							"ACCDET_EINT0", priv);
-			if (ret) {
-				dev_err(&pdev->dev,
-					"Failed to request eint0 IRQ (%d)\n",
-					ret);
-				return ret;
-			}
-		}
-	} else if (priv->caps & ACCDET_PMIC_EINT1) {
-		priv->accdet_eint1 = platform_get_irq(pdev, 2);
-		if (priv->accdet_eint1 >= 0) {
-			ret = devm_request_threaded_irq(&pdev->dev,
-							priv->accdet_eint1,
-							NULL, mt6359_accdet_irq,
-							IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-							"ACCDET_EINT1", priv);
-			if (ret) {
-				dev_err(&pdev->dev,
-					"Failed to request eint1 IRQ (%d)\n",
-					ret);
-				return ret;
-			}
+	priv->accdet_eint0 = platform_get_irq(pdev, 1);
+	if (priv->accdet_eint0 >= 0) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+						priv->accdet_eint0,
+						NULL, mt6359_accdet_irq,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_EINT0", priv);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to request eint0 IRQ (%d)\n",
+				ret);
+			return ret;
 		}
 	}
 
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 288b8fbf7c5efaee6520a2c0a5845e156f3b805d..4156cbc7f0a1744226d5f28746bd13fec6c615b4 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -58,7 +58,6 @@ struct mt6359_accdet {
 	unsigned int caps;
 	int accdet_irq;
 	int accdet_eint0;
-	int accdet_eint1;
 	struct mutex res_lock; /* lock protection */
 	bool jack_plugged;
 	unsigned int jack_type;

-- 
2.48.1


