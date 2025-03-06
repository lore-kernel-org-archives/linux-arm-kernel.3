Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF8CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwsCU5p/+hKjfIpFpaFryIREeHoWDESBG0yzoObH5dc=; b=JUZqvwICsvpinaXTavO6/j0+wV
	BzT8tqq5XDbcs1Hzr+SIpZefyPyneacZMEGL8Iebcjt5pELKT7ivgbzwVzBY976ZUCNfgyc1DuR+K
	GUd6WvVb143uVANmEmACvzlJXO/U+k6l2K9AiVcXaulXy25tSuwGvuIAWDOpdWrgYCkQU+Ixul0W6
	h8svwEeB8aQlCbsp0Adu5XfXl0Zw3aEVF0hyYvwPfabJMW+lkPyet7fuW/TkUOKpdhVrh8JrdYgKt
	NAwsUwSUi39JBvc2VWwozjnZQ4aejdjqYjuiMOgxGQDnstqoouycjN4m3D2CHXoDpLF+MwDd1fa7v
	n0u0Gwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHPB-0000000C4bf-1xeb;
	Thu, 06 Mar 2025 20:01:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHHU-0000000C3fp-1WAY;
	Thu, 06 Mar 2025 19:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741290799;
	bh=3Q8MSA2wNdR0EUiQxluJI3UNGeMjPm/pGs/aDkttMcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FXV0qYSdbUJaiGw7aWUOKDNl4LkS4msRrc0oNx6njVWV7DQlhLkqLmj5VQpQqANRD
	 4D7Z+4uFKYYy/AHdSvl6vHk4BQrWgUou6XHBNcXTJ/NtNamNcWVbFEzl0hF8UTXPBG
	 9VutigQjHoAuvo2RFCiRjHhGt93bD6o/Vpr2IKR2NvWJN9TxmSHF41xp1k1E28ZCnK
	 rq3PhvRP/Pk3GsjcdqvAKBlAP+e2N42OcclOz8gx+c25U7TN/d2ttg+VCtguERQX+C
	 NSPUFhIT250yN1S+k41q6xvN3/tRsZOQBUYmsNhQAvYkKlJKsI/fQKDBL1EUgQmI91
	 SChiFBIB53Vqw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC36A17E05F7;
	Thu,  6 Mar 2025 20:53:14 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 06 Mar 2025 16:52:18 -0300
Subject: [PATCH v3 4/4] ASoC: mediatek: mt8188-mt6359: Add accdet headset
 jack detect support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-mt8188-accdet-v3-4-7828e835ff4b@collabora.com>
References: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
In-Reply-To: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115320_544891_7B92E1F7 
X-CRM114-Status: GOOD (  13.62  )
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

Enable headset jack detection for MT8188 platforms that use the MT6359
ACCDET block for it, indicated by the mediatek,accdet property in DT.
For those platforms, register a jack and initialize the ACCDET block to
report jack events through it.

Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 420b1427b71dc1424a52f7ab6140c14659036733..20dc9470ba76b2a750e79a5ae3dafabd7c597f40 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -17,6 +17,7 @@
 #include "mt8188-afe-common.h"
 #include "../../codecs/nau8825.h"
 #include "../../codecs/mt6359.h"
+#include "../../codecs/mt6359-accdet.h"
 #include "../../codecs/rt5682.h"
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
@@ -271,6 +272,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_pin mt8188_headset_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 static const struct snd_kcontrol_new mt8188_dumb_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Ext Spk"),
 };
@@ -506,6 +518,35 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int mt8188_mt6359_accdet_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8188_JACK_HEADSET];
+	int ret;
+
+	if (!soc_card_data->accdet)
+		return 0;
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+				   SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				   SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				   SND_JACK_BTN_3,
+				   jack, mt8188_headset_jack_pins,
+				   ARRAY_SIZE(mt8188_headset_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack create failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mt6359_accdet_enable_jack_detect(soc_card_data->accdet, jack);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack enable failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
@@ -518,6 +559,8 @@ static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	/* mtkaif calibration */
 	mt8188_mt6359_mtkaif_calibration(rtd);
 
+	mt8188_mt6359_accdet_init(rtd);
+
 	return 0;
 }
 

-- 
2.48.1


