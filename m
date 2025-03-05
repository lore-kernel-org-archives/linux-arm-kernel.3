Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3Jr1ifBgAUOTlSFImIY854lPBEJ8Tg18l+oA7ulQUw=; b=FW/X70OV2qHbybeEyew5dGg3t2
	szgyYwx4ZSpbivl+0bWvO8qerg5q8FzuqHFzwcImMB7/3Qaz2TDJNmMGVfZbq0iiOb09U/gD6jbnr
	6iskoA+scIvIcihqxLKlemByftli4ENvqtONvRSaWfVJKjjtjBWz3z20wQUAniUInaJmao54xaclG
	zPOz8OvTMQpqY3p/5t2VX30yIYJc1nB9AnJ3DbB6C30oa/4u/AIhF3UQrxkfn7FbqU1bT+PHjgx9i
	d32Wgy9xOUrzjAsy/yzP2mOqXjLxc9vOz66OZaq16/gkxawg9V1CYEEBVZS0A90Qpi31gkbyAL1WX
	2/jEo9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuOV-0000000947X-3bVZ;
	Wed, 05 Mar 2025 19:27:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptz4-000000090Vl-2Rr5;
	Wed, 05 Mar 2025 19:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201245;
	bh=rBci4f69I/d/dQvGhQC94bd2AW9ZiKT0dsBk2rxvf9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MeHRO+Ne0zhBlmqoR48VPl3x64Upn/204cmF/N3fkcX9Hjh1eQwCuvD5/4/qqfEX1
	 63v11+lJcN2qcNAVWOJhnqRUfET9r6y4TPkNYqYzW2gZkNSMKy5x55VHMyvzkKbEpi
	 KSB8uj+PXwSy62vtOV1s6GY3h2eGXb54FRC12mtyA9tlH+McOsAf5Fu66h6aiCEpyS
	 224p1W1vPb1ljbZoHUOO/3VVJ31KmAGFXhU90cHKSXfXZw7XuXnpU+dWLhOzlur18L
	 gyBrCeMKiPKBlHinGE4vUJweItwJhlHS/onQl1XcGFOg5L8BGWgGKQK06AGRb+ssXg
	 DmQPvUMLTqd6g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3170117E0147;
	Wed,  5 Mar 2025 20:00:40 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:30 -0300
Subject: [PATCH v4 15/19] ASoC: mediatek: mt6359-accdet: Always configure
 hardware as mic-mode 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-15-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110046_763294_4308BB03 
X-CRM114-Status: GOOD (  15.27  )
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

The driver currently reads a mediatek,mic-mode property from DT to
determine certain register configurations. Since there are no current
users of the property, the property doesn't directly reflect the
hardware  and the default value (2) is known to work on
multiple boards, remove the code handling this property and instead
always configure the hardware according to the known to work default.
This property can be properly introduced in the binding in the future
if it really turns out that different boards need different
configurations.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 43 ++++++----------------------------------
 sound/soc/codecs/mt6359-accdet.h |  5 -----
 2 files changed, 6 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index a31e084560c7643b14fb71871699e3167075d9d9..12697b02faff1be39317116cd7d8ffa359f2cd4e 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -494,11 +494,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (!node)
 		return -EINVAL;
 
-	ret = of_property_read_u32(node, "mediatek,mic-mode",
-				   &priv->data->mic_mode);
-	if (ret)
-		priv->data->mic_mode = 2;
-
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
 	ret = of_property_read_u32(node, "mediatek,eint-num", &tmp);
@@ -658,38 +653,12 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
 	/* mic mode setting */
 	regmap_read(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR, &reg);
-	if (priv->data->mic_mode == HEADSET_MODE_1) {
-		/* ACC mode*/
-		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
-			     reg | RG_ACCDET_MODE_ANA11_MODE1);
-		/* enable analog fast discharge */
-		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
-				   RG_ANALOGFDEN_MASK_SFT,
-				   BIT(RG_ANALOGFDEN_SFT));
-		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
-				   0x3 << 11, 0x3 << 11);
-	} else if (priv->data->mic_mode == HEADSET_MODE_2) {
-		/* DCC mode Low cost mode without internal bias */
-		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
-			     reg | RG_ACCDET_MODE_ANA11_MODE2);
-		/* enable analog fast discharge */
-		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
-				   0x3 << RG_ANALOGFDEN_SFT,
-				   0x3 << RG_ANALOGFDEN_SFT);
-	} else if (priv->data->mic_mode == HEADSET_MODE_6) {
-		/* DCC mode Low cost mode with internal bias,
-		 * bit8 = 1 to use internal bias
-		 */
-		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
-			     reg | RG_ACCDET_MODE_ANA11_MODE6);
-		regmap_update_bits(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
-				   RG_AUDMICBIAS1DCSW1PEN_MASK_SFT,
-				   BIT(RG_AUDMICBIAS1DCSW1PEN_SFT));
-		/* enable analog fast discharge */
-		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
-				   0x3 << RG_ANALOGFDEN_SFT,
-				   0x3 << RG_ANALOGFDEN_SFT);
-	}
+	/* DCC mode Low cost mode without internal bias */
+	regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+		     reg | RG_ACCDET_MODE_ANA11_MODE2);
+	/* enable analog fast discharge */
+	regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
+			   0x3 << RG_ANALOGFDEN_SFT, 0x3 << RG_ANALOGFDEN_SFT);
 
 	config_eint_init_by_mode(priv);
 	config_digital_init_by_mode(priv);
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 46dcd4759230a5190434b9b7c785e8b9ed12fd3d..579373807c414130b2a7384db4978e01cf1d046c 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -12,10 +12,6 @@
 
 #define ACCDET_DEVNAME "accdet"
 
-#define HEADSET_MODE_1		(1)
-#define HEADSET_MODE_2		(2)
-#define HEADSET_MODE_6		(6)
-
 #define MT6359_ACCDET_NUM_BUTTONS 4
 #define MT6359_ACCDET_JACK_MASK (SND_JACK_HEADPHONE | \
 				SND_JACK_HEADSET | \
@@ -51,7 +47,6 @@ enum {
 };
 
 struct dts_data {
-	unsigned int mic_mode;
 	bool hp_eint_high;
 	unsigned int eint_comp_vth;
 };

-- 
2.48.1


