Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5DAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGlUGFG/cEJ/gfrzvBfQhy1iAufA2q1lsN2qQazCkh0=; b=SyJfhbM0LEpgdD+oTkJaBfgHjR
	Am/3qXiUj1G4M6wcRxB81laH7+uo19UmyU2kUvSO6CimHNNs5C7i5YiIpg/6YZJZFDQrjBOYs0DnM
	oZo3LfRsb746WH6+1C6jNDTGTAtGKty+/k4QBdCekr54YoLYvu3ZJLu1xwf+44/sC1cylHbftHdxJ
	qlgpCRoJ0IBdhyCA5lSvPq9MAdIkjBFqtYB4OKAv64n8LDXq0jp9MKwPmzQ/GCIvBVL+o9czAMrY8
	i/PiUlmN20Eb3GxZvRNr/pDTB0b29HbGiJc/JH4ZaCfgabTFmATwC0rLbmG0PkH4eoc/M5IU2qSoc
	doHIl1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxCu-0000000Cy3k-2MuG;
	Thu, 09 Jan 2025 18:24:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxBh-0000000CxwA-1egw;
	Thu, 09 Jan 2025 18:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB934A4255D;
	Thu,  9 Jan 2025 18:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A58C4CED2;
	Thu,  9 Jan 2025 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736447000;
	bh=30wB/WI/0/f7UcIF3TPsN2HMLACXVtv2YkGpGhKaM+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=mVCmatJNDUWzfqTMCBQzuH+/WwFgR7ZiBEoOhRtVouJ4etPjdmWg8Cml95dH3zBzr
	 EZImpKYehXgqxOAL7HNgiFnu2mIv96I8uSxiD1WdKPeEnahEFdOxjxHYbWEOoOBfZd
	 HSEcBX6LluhfuZPUj+SDfkxftr/NbjA9eFJMay7qZgcX1xjQlJdiyrP52hyw6wOkUy
	 bLhfUzQW/8afz1h4rAVINdftN71VP4ew+B54zL1hyNbk/p99O71NYpjk0PgU12vWKt
	 L85RvKCytBmp5jxrJFdTV6dPa3y95fqH5YPJHBLszrofzsrWUiZGjYkzJ0eLtXgKlm
	 TgKOaRnUFGjNA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: Use of_property_present() for non-boolean properties
Date: Thu,  9 Jan 2025 12:23:00 -0600
Message-ID: <20250109182303.3973082-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_102321_577795_7F3312C5 
X-CRM114-Status: GOOD (  14.42  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c                    | 2 +-
 sound/soc/fsl/imx-audmux.c                       | 2 +-
 sound/soc/fsl/imx-card.c                         | 2 +-
 sound/soc/fsl/imx-rpmsg.c                        | 2 +-
 sound/soc/generic/simple-card-utils.c            | 4 ++--
 sound/soc/intel/keembay/kmb_platform.c           | 2 +-
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 4 ++--
 sound/soc/qcom/common.c                          | 6 +++---
 sound/soc/qcom/sc7180.c                          | 2 +-
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 02e1594e8223..2bad9cb1daaf 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -932,7 +932,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	if (!asrc_pdev)
 		priv->card.num_dapm_routes /= 2;
 
-	if (of_property_read_bool(np, "audio-routing")) {
+	if (of_property_present(np, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 43e14f2eca8d..cc2918ee2cf5 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -237,7 +237,7 @@ static int imx_audmux_parse_dt_defaults(struct platform_device *pdev,
 					child);
 			continue;
 		}
-		if (!of_property_read_bool(child, "fsl,port-config")) {
+		if (!of_property_present(child, "fsl,port-config")) {
 			dev_warn(&pdev->dev, "child node \"%pOF\" does not have property fsl,port-config\n",
 					child);
 			continue;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 95a57fda0250..ac043ad367ac 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -529,7 +529,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	}
 
 	/* DAPM routes */
-	if (of_property_read_bool(dev->of_node, "audio-routing")) {
+	if (of_property_present(dev->of_node, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret)
 			return ret;
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index ce98d2288193..7cd3aa4c8706 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -218,7 +218,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	if (of_property_read_bool(np, "audio-routing")) {
+	if (of_property_present(np, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(&data->card, "audio-routing");
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a0c3111f7e08..91325286894e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -713,7 +713,7 @@ int simple_util_parse_routing(struct snd_soc_card *card,
 
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "routing");
 
-	if (!of_property_read_bool(node, prop))
+	if (!of_property_present(node, prop))
 		return 0;
 
 	return snd_soc_of_parse_audio_routing(card, prop);
@@ -731,7 +731,7 @@ int simple_util_parse_widgets(struct snd_soc_card *card,
 
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "widgets");
 
-	if (of_property_read_bool(node, prop))
+	if (of_property_present(node, prop))
 		return snd_soc_of_parse_audio_simple_widgets(card, prop);
 
 	/* no widgets is not error */
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index aa5de167e790..4ed71d11ad77 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -869,7 +869,7 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 
 	kmb_i2s->fifo_th = (1 << COMP1_FIFO_DEPTH(comp1_reg)) / 2;
 
-	kmb_i2s->use_pio = !(of_property_read_bool(np, "dmas"));
+	kmb_i2s->use_pio = !of_property_present(np, "dmas");
 
 	if (kmb_i2s->use_pio) {
 		irq = platform_get_irq_optional(pdev, 0);
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 3bbf42c42805..f4314dddc460 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -221,7 +221,7 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 		card->name = pdata->card_name;
 	}
 
-	needs_legacy_probe = !of_property_read_bool(pdev->dev.of_node, "audio-routing");
+	needs_legacy_probe = !of_property_present(pdev->dev.of_node, "audio-routing");
 	if (needs_legacy_probe) {
 		/*
 		 * If we have no .soc_probe() callback there's no way of using
@@ -262,7 +262,7 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 		adsp_node = NULL;
 
 	if (adsp_node) {
-		if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+		if (of_property_present(pdev->dev.of_node, "mediatek,dai-link")) {
 			ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
 						       "mediatek,dai-link",
 						       card->dai_link, card->num_links);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 928cf5cb5999..7ee60a58a336 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -44,20 +44,20 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		return ret;
 	}
 
-	if (of_property_read_bool(dev->of_node, "widgets")) {
+	if (of_property_present(dev->of_node, "widgets")) {
 		ret = snd_soc_of_parse_audio_simple_widgets(card, "widgets");
 		if (ret)
 			return ret;
 	}
 
 	/* DAPM routes */
-	if (of_property_read_bool(dev->of_node, "audio-routing")) {
+	if (of_property_present(dev->of_node, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret)
 			return ret;
 	}
 	/* Deprecated, only for compatibility with old device trees */
-	if (of_property_read_bool(dev->of_node, "qcom,audio-routing")) {
+	if (of_property_present(dev->of_node, "qcom,audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card, "qcom,audio-routing");
 		if (ret)
 			return ret;
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index bc030ce29680..d95710b1ea4e 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -513,7 +513,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->controls = sc7180_snd_controls;
 	card->num_controls = ARRAY_SIZE(sc7180_snd_controls);
 
-	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
+	if (of_property_present(dev->of_node, "dmic-gpios")) {
 		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
 		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
 		card->controls = sc7180_snd_dual_mic_controls,
-- 
2.45.2


