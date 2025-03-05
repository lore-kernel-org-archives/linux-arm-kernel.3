Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFFCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiTb+asUUCMpg2G5cuZKZ2+VdFpb4I2J3EOF5uTEW7c=; b=EIvW1z0eBu+vZs30itqLbqormg
	vVclO1CgcbYVyx8yppJXrRCjxms0q5sJopuLeHTGdei1RhHqPSYEqf0298ofEBxuznHqO3uymZTVC
	0rZzgs1C7GH2PvrU//AsKRjrfgnwyz8J/NHXhAL20/I3OdX1bUmaGq97T6+d+E5/OOJYbT3zf/MCF
	Vn+s0/5MtRW7Lumbyo2AfZuThMxH65NNHjQXMV9aGjvZhkyTbz9nMVn+qKfgL4Ju/iuUlXc25MNs5
	jp/DNg3PqNHIKae/m7nwFBp8k9yJ0sbLKBLOCWSQYWNiFIZhgwFXCBv9MqF2K3c6HbRA99zxzyt8C
	bKRpeLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuIG-000000093YT-0QRX;
	Wed, 05 Mar 2025 19:20:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyh-000000090O2-3ouY;
	Wed, 05 Mar 2025 19:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201222;
	bh=Vr2iMt1JwvPbsT2boRLW+AKpWeiECbyHNYOMDVwTEG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ACTFevo+bRvpLn+18qWQAf+W/aQUKIFAGYcXCqo0jPTJFUKcqZI+5/qaIPLQO6aM2
	 a2L4rFfit/CTPIwtsvxS0+oKAOvQZMv4GGPty2NateqfugQSlsbeCLa2uo9PipXiyg
	 sAjElkRyUyUonpe5fTwB0B7lqBK0Lq6r8+9leSPYjaU3gR+IvVv5PndSrI5sfcoRo4
	 QDL/1XpNzD31/Cuh85IP3/IMNQNTXtb3eN1MERunKsyLNs3FQV3RaIhWVmwjGSzhi6
	 Xiex4q4meIg1TrAp/73Q+6WHT98Z+BBZYg7G/age/VKV9XyT8Q+U//QtPmG64+LznE
	 zrQSLV4XhChug==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A583517E017D;
	Wed,  5 Mar 2025 20:00:17 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:26 -0300
Subject: [PATCH v4 11/19] ASoC: mediatek: mt6359-accdet: Always use
 internal resistor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-11-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110024_087587_139FD28E 
X-CRM114-Status: GOOD (  14.30  )
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

The code currently reads a property mediatek,eint-use-ext-res with
values ranging between 0 and 4. Not only should this be a boolean
property, but there's no need for it to even be a DT property, seeing as
all current boards will use the internal resistor anyway. Since there's
no current dt-binding or Devicetree user of this property, remove its
handling and make the driver always configure the internal resistor.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 53 +++++++++++-----------------------------
 sound/soc/codecs/mt6359-accdet.h |  1 -
 2 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index d78d7516342a5c2273b1c2962c0346646aa6390f..e04cfb9a607aa5d38d46329eb1387545fda37ccc 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -82,14 +82,10 @@ static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
 					   RG_EINT1CONFIGACCDET_MASK_SFT,
 					   BIT(RG_EINT1CONFIGACCDET_SFT));
 		}
-		if (priv->data->eint_use_ext_res == 0x3 ||
-		    priv->data->eint_use_ext_res == 0x4) {
-			/*select 500k, use internal resistor */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0HIRENB_ADDR,
-					   RG_EINT0HIRENB_MASK_SFT,
-					   BIT(RG_EINT0HIRENB_SFT));
-		}
+		/*select 500k, use internal resistor */
+		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+				   RG_EINT0HIRENB_MASK_SFT,
+				   BIT(RG_EINT0HIRENB_SFT));
 	}
 	return 0;
 }
@@ -543,13 +539,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	else if (tmp == 2)
 		priv->caps |= ACCDET_PMIC_BI_EINT;
 
-	ret = of_property_read_u32(node, "mediatek,eint-use-ext-res",
-				   &priv->data->eint_use_ext_res);
-	if (ret) {
-		/* eint use internal resister */
-		priv->data->eint_use_ext_res = 0x0;
-	}
-
 	ret = of_property_read_u32(node, "mediatek,eint-comp-vth",
 				   &priv->data->eint_comp_vth);
 	if (ret)
@@ -651,30 +640,16 @@ static void config_eint_init_by_mode(struct mt6359_accdet *priv)
 	if (priv->data->eint_detect_mode == 0x1 ||
 	    priv->data->eint_detect_mode == 0x2 ||
 	    priv->data->eint_detect_mode == 0x3) {
-		if (priv->data->eint_use_ext_res == 0x1) {
-			if (priv->caps & ACCDET_PMIC_EINT0) {
-				regmap_update_bits(priv->regmap,
-						   RG_EINT0CONFIGACCDET_ADDR,
-						   RG_EINT0CONFIGACCDET_MASK_SFT,
-						   0);
-			} else if (priv->caps & ACCDET_PMIC_EINT1) {
-				regmap_update_bits(priv->regmap,
-						   RG_EINT1CONFIGACCDET_ADDR,
-						   RG_EINT1CONFIGACCDET_MASK_SFT,
-						   0);
-			}
-		} else {
-			if (priv->caps & ACCDET_PMIC_EINT0) {
-				regmap_update_bits(priv->regmap,
-						   RG_EINT0CONFIGACCDET_ADDR,
-						   RG_EINT0CONFIGACCDET_MASK_SFT,
-						   BIT(RG_EINT0CONFIGACCDET_SFT));
-			} else if (priv->caps & ACCDET_PMIC_EINT1) {
-				regmap_update_bits(priv->regmap,
-						   RG_EINT1CONFIGACCDET_ADDR,
-						   RG_EINT1CONFIGACCDET_MASK_SFT,
-						   BIT(RG_EINT1CONFIGACCDET_SFT));
-			}
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			regmap_update_bits(priv->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   RG_EINT0CONFIGACCDET_MASK_SFT,
+					   BIT(RG_EINT0CONFIGACCDET_SFT));
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			regmap_update_bits(priv->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   RG_EINT1CONFIGACCDET_MASK_SFT,
+					   BIT(RG_EINT1CONFIGACCDET_SFT));
 		}
 	}
 
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 38c36d59b9cc68bd90e16137a05a62b521b75ac1..99de5037a2294b62cb8535fc45dbf4c6fafb5c7f 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -75,7 +75,6 @@ struct dts_data {
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
 	unsigned int eint_detect_mode;
-	unsigned int eint_use_ext_res;
 	unsigned int eint_comp_vth;
 };
 

-- 
2.48.1


