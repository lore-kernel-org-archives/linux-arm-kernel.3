Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C81C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYszs/DB4wFktP2QVNbwZIxZexG9SRiLd8NF1/clmJ8=; b=YrfrXxLpCv24rJW/1RPpa/3qnR
	Cg315xfDV3B2f7B+pwRUY5ZQxiBqawZcNqgnUqfVjmbmk2a1n045i+muk09YC5njYHImgXRxKtRsf
	CDKq4vcbx+/B9RP9jXGnLdqjxD+nEnSvckr1e4UujNnVmr5OAldkP3Gu/gggfOrkjfzLf417r/dNN
	hZNwrhtaWq+qoJvsJPkckqDm3SGU3TXNgTK1RZu4KvqkCuKZG9MbxBsK/waUdQ0H1cxd9RnGnLQKB
	3wDrGxKQzS4wXz+B4ErRZIKuBVKqoDm8tPfnHzW5f+Z/R2oG9gjHPe4odYFtCTdyNw2OZI6SRs06E
	eqDcxn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixdn-0000000FKAx-2bZp;
	Fri, 14 Feb 2025 15:30:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixPP-0000000FGiW-3Twd;
	Fri, 14 Feb 2025 15:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739546114;
	bh=gYGJtiW6FSC0FDX8qS6/krawDyDf5GHTiTmU7WJ3Af8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qX9YEGD0ml2gWVx35Ac2J306oISYovWOng1iOF0x/+LFzhhDxHVflwNrxOtJqod5W
	 RMCqYmSg5FwP/N363m6hjsMHKn3yMO0lL7RyVtYm2YZOSt/GQ8gUziuvbgZuGg5Erm
	 NrwHX6N1bHi5+qJ0uRK/6Y2CS/T6KY3Fj07xaoPI3TRG7kjNS2XXcnZNaMEMGOuXW8
	 /i4iSWsrDhPuH4dpv/X209rsVzmN2v6OUNJ3NT3fvN0JgtJ8LH0iFT+YcVmNppcc9n
	 eIPZ0uhmSIuF8gDqD9Ixnmz9afwDvzM3Y8T4s85qqnziGgpntg+QIqxLzJJmiknQ9t
	 NV5YO83cvkgtw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36BB717E1558;
	Fri, 14 Feb 2025 16:15:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 12:14:31 -0300
Subject: [PATCH 3/3] ASoC: mediatek: mt8188-mt6359: Add headset jack detect
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
In-Reply-To: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
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
X-CRM114-CacheID: sfid-20250214_071516_015018_3239070E 
X-CRM114-Status: GOOD (  13.29  )
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

Enable headset jack detection for MT8188 platforms using the MT6359
ACCDET block for it.

Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 2d0d04e0232da07ba43a030b14853322427d55e7..4e19e6cfad1e1f42863b2e2f27131f880c5883bf 100644
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
@@ -266,6 +267,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
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
@@ -500,6 +512,35 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
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
@@ -512,6 +553,8 @@ static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	/* mtkaif calibration */
 	mt8188_mt6359_mtkaif_calibration(rtd);
 
+	mt8188_mt6359_accdet_init(rtd);
+
 	return 0;
 }
 

-- 
2.48.1


