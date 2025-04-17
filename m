Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E909C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fxziHulNjE4YZN7A3123UDCbQScsXOmC7twyXSuCh0=; b=CumWwq51gspJzM7fs75pPatjRX
	zMIBvHeyeHTg8H5YHsSEAuaGHBcuaZorvXhvprgTGT6E6Cv/wT1cKzUHSs6zud54uKlN3yUEnn3p2
	3M9yf2rYi0FpmBI9zCrfggTpNdbm1kM8js3CGMt8lf2p85Rjr/wtj6JCQbCdK+rSuoPinIZP45xih
	10TEhOd4CgK2vIFUaqMuaIn8QCgPxvDKRBCR/7Npib2LvG5v8piaZnrYdHJKimKThXwipD1wT1qxk
	eC82335658HLISy9Lz+xL0C9MBk7WXo3hrZxcO8PX8310ZK4OSHfBeCzfEXP8qMW8SYhrSrm+qnlH
	T/ZzXZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L3Q-0000000CLyB-0sfT;
	Thu, 17 Apr 2025 08:57:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrO-0000000CJdy-0zUA;
	Thu, 17 Apr 2025 08:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879476;
	bh=rqpmpGxXSGELcHRBTPCV1yQQmzMmHIT+7KC+3I/Dg/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g0DZUto7oinMejVddqxdiSlIz8jM0b6HaiX7wY4U5JyCrtSl41eiPvibCv0HwHc3W
	 Mv/j1k5NtEpz+lmQJYfdvRsLOzeuAUdFG0I5xJkt7jFpNpT0fZGqrvbrCwXv18Aurr
	 CnAGxzJkvASl95Y7sxujh5K8SMBgclJAxYhsgtcvoqat2cxclo4aC/5E7uEi0EjBfK
	 LoS3z6AVSVqRSWikAYUUlksMFUQ/XwD/W4ItD4wyYCE0g3GXmkFYqWnVmk1vKV+yhQ
	 pS6WL60kOwdDrXk+kXncNkqlwh5q24OnB2kNOO6djkvFUdLUvYLJu/CtHPEheMwHHo
	 pS6lUfnwkwsZg==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 992CF17E10F7;
	Thu, 17 Apr 2025 10:44:35 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:32 +0200
Subject: [PATCH 1/6] ASoC: mediatek: mt8195: Move rt5682 specific dapm
 routes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-1-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014438_427512_32A1C9D4 
X-CRM114-Status: GOOD (  13.05  )
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

'HPOL', 'HPOR', and 'Headset Mic' are rt5682 specific,
move these routes to mt8195_rt5682_init so we keep
'mt8195_rt5682_routes' for connection between mt8195 and
mt6359.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index df29a9fa5aee5b6aedf34972cdf53402366d2ac2..f0bb59cf581b1e3bcfa66406d31de446a917c6c6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -92,10 +92,6 @@ static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
-	/* headset */
-	{ "Headphone", NULL, "HPOL" },
-	{ "Headphone", NULL, "HPOR" },
-	{ "IN1P", NULL, "Headset Mic" },
 	/* SOF Uplink */
 	{SOF_DMA_UL4, NULL, "O034"},
 	{SOF_DMA_UL4, NULL, "O035"},
@@ -131,6 +127,13 @@ static const struct snd_kcontrol_new mt8195_speaker_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Ext Spk"),
 };
 
+static const struct snd_soc_dapm_route mt8195_rt5682_routes[] = {
+	/* headset */
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
 static const struct snd_soc_dapm_route mt8195_rt1011_routes[] = {
 	{ "Left Spk", NULL, "Left SPO" },
 	{ "Right Spk", NULL, "Right SPO" },
@@ -447,6 +450,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_card *card = rtd->card;
 	int ret;
 
 	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
@@ -473,7 +477,12 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return 0;
+	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt5682_routes,
+				      ARRAY_SIZE(mt8195_rt5682_routes));
+	if (ret)
+		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
+
+	return ret;
 };
 
 static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,

-- 
2.49.0


