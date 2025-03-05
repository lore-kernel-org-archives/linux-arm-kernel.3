Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A000CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUEvfbDvqFJX8BS/qTLkrdVfCLPJHXz8LJB2C2M4iGg=; b=EOahNueBmNBPHuvvW86GVeyr1a
	h+sfX3QjVVBRnJ6Zw9EpByaEDSej0xw9OOCZ+9V9iIO0d0L6EDGn8M0muZGY3lQCHu0TVueIf4OQg
	lKQNADrTyZv7QG4MY354pA5Bmn/YpMu4sni+npgIod+HWTaj+HqZtcWM/wa8yfVY6FaiDIEuxsoED
	/E8D8Dr/JOt9qO/E6Fa/UUV10Gd5wFYnAcMPQyJ0zdUer9ZifGFG7J9JCLx6Pop59tD4T1gjTyyZN
	ziDiHghkr/udkcBOELohu05ibQupcJZa/R2sWExCrp8q5J+og3Pse3yMAE0hK9Cq1U4q+HfqtUQfI
	RB1BamRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvR5-00000009ELp-1Ggs;
	Wed, 05 Mar 2025 20:33:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyy-000000090Tb-3okd;
	Wed, 05 Mar 2025 19:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201239;
	bh=+Xc6IIOKZkGqVJGEvJQSuFw6mN/ozG3/FVvAqN7VwII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mBuCKKNT447dwqs28x1gxkklz/uKTpGXc73NT0EFCy4ZyrwV5IivAmcdYcPhX2FDi
	 3Nn3YFrVZKi5HJojDgNvUWVsH6J4onywbjJm9531D36r7p7Q8xIjYO1cRC7gtAYWJc
	 pG3EGpPlhKM/0ir5fDEdlCMvhHFArammhQpYPMaq1jt7DKaKydOJjtAQ0dX55O/TTV
	 kiv1ejP4fZZtLA//Rciza4KneOqngif90POX2lIBPW8yxE3LW7DgHZdlZ+Z0Z1KT0A
	 5Hh2gehoeODE/tLvdK8UZnHPkL0P0Ftu438gqTHFnYrmvDQvdQ5eviQ6s7vuGy2k+4
	 Zenj0YYopkVHw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B0C117E0649;
	Wed,  5 Mar 2025 20:00:34 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:29 -0300
Subject: [PATCH v4 14/19] ASoC: mediatek: mt6359-accdet: Always set
 micbias1 to 2.8V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-14-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110041_084315_9A78822A 
X-CRM114-Status: GOOD (  14.80  )
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

The driver currently reads a mediatek,mic-vol property from DT to
determine the micbias1 setting to configure in hardware. Since there are
no current users of the property and the default value (2.8V) is known
to work on multiple boards, remove the code handling this property and
instead always configure the micbias1 to 2.8V. The property can be
properly introduced in the binding in the future if it really turns out
that different boards need different configurations.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 23 +++--------------------
 sound/soc/codecs/mt6359-accdet.h |  1 -
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 83e65b6d5845dea00a8a77d68df4b7df1f62a87c..a31e084560c7643b14fb71871699e3167075d9d9 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -494,11 +494,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (!node)
 		return -EINVAL;
 
-	ret = of_property_read_u32(node, "mediatek,mic-vol",
-				   &priv->data->mic_vol);
-	if (ret)
-		priv->data->mic_vol = 8;
-
 	ret = of_property_read_u32(node, "mediatek,mic-mode",
 				   &priv->data->mic_mode);
 	if (ret)
@@ -657,22 +652,10 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 		      ACCDET_RISE_DELAY));
 
 	regmap_read(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR, &reg);
-	if (priv->data->mic_vol <= 7) {
-		/* micbias1 <= 2.7V */
-		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
-			     reg | (priv->data->mic_vol << RG_AUDMICBIAS1VREF_SFT) |
-			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
-	} else if (priv->data->mic_vol == 8) {
-		/* micbias1 = 2.8v */
-		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
-			     reg | (3 << RG_AUDMICBIAS1HVEN_SFT) |
+	/* micbias1 = 2.8v */
+	regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+		     reg | (3 << RG_AUDMICBIAS1HVEN_SFT) |
 			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
-	} else if (priv->data->mic_vol == 9) {
-		/* micbias1 = 2.85v */
-		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
-			     reg | (1 << RG_AUDMICBIAS1HVEN_SFT) |
-			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
-	}
 	/* mic mode setting */
 	regmap_read(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR, &reg);
 	if (priv->data->mic_mode == HEADSET_MODE_1) {
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index ff5cd6ea1b06f045b6e1b9f6bc53ef80d78e3b92..46dcd4759230a5190434b9b7c785e8b9ed12fd3d 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -51,7 +51,6 @@ enum {
 };
 
 struct dts_data {
-	unsigned int mic_vol;
 	unsigned int mic_mode;
 	bool hp_eint_high;
 	unsigned int eint_comp_vth;

-- 
2.48.1


