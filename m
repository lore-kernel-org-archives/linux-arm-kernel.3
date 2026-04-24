Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C5DFDEE5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nXxAMjS5Ig8FSdFFps69HGErHLsX7BmYRVtqry8Nho=; b=uaaHfP/5sl3L5wA+OxFO+QnUON
	5a/PL6bTlXmiP9Y0XAFilefkv55V9+m40qJXm+CWCyDKX/s/dW+k94v3IBC9RxZFOh0Bi77kzbAjr
	ESFq1xWLvzMB3NXi9z1KxHC6m1tPezaWsfEX75Mpvo2jF+B6y7zgcsLtRwkdIewmTybAnHc7Ko/g+
	uUiHmVwUQ6hWdLIMddxSYvZYAI8ujcdkx7CrvTxcZzgkNu2UpU32ZuDjmBb6959FhSTVxbkjjQK/x
	WB1SatXlW2/VNLQ/qCh78iwgGXTiNrpKT8zCJgNjc8qErCSBePjG43WbE2ocN/nhCQQaEdFfch0FH
	XVqbXwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6cq-0000000CX4Z-3wKY;
	Fri, 24 Apr 2026 02:50:41 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6co-0000000CX3c-13Dc;
	Fri, 24 Apr 2026 02:50:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wG6ch-000000002QS-1tRK;
	Fri, 24 Apr 2026 02:50:31 +0000
Date: Fri, 24 Apr 2026 03:50:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 6/9] ASoC: mediatek: mt2701: add machine driver for
 on-chip HDMI codec
Message-ID: <1dafc8147ee09d44de53b69bca792bdbfe13e8b0.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_195038_294770_989F7151 
X-CRM114-Status: GOOD (  21.73  )
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

Add a simple ASoC machine driver that wires the MT2701/MT7623N
AFE HDMI playback path to the on-chip HDMI transmitter exposed
as a generic hdmi-audio-codec "i2s-hifi" DAI.

The driver binds to "mediatek,mt2701-hdmi-audio". MT7623N device
trees carry "mediatek,mt7623n-hdmi-audio" as a board-specific
fallback, matching the dt-binding.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: no changes
v2: no changes

 sound/soc/mediatek/Kconfig              |  10 +++
 sound/soc/mediatek/mt2701/Makefile      |   1 +
 sound/soc/mediatek/mt2701/mt2701-hdmi.c | 114 ++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3a1e1fa3fe5c..fa076e7854ad 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -26,6 +26,16 @@ config SND_SOC_MT2701_CS42448
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_MT2701_HDMI
+	tristate "ASoC Audio driver for MT2701 with on-chip HDMI codec"
+	depends on SND_SOC_MT2701
+	select SND_SOC_HDMI_CODEC
+	help
+	  This adds the ASoC machine driver for MediaTek MT2701 and
+	  MT7623N boards routing the AFE I2S back-end to the on-chip
+	  HDMI transmitter via the generic HDMI codec.
+	  If unsure select "N".
+
 config SND_SOC_MT2701_WM8960
 	tristate "ASoc Audio driver for MT2701 with WM8960 codec"
 	depends on SND_SOC_MT2701 && I2C
diff --git a/sound/soc/mediatek/mt2701/Makefile b/sound/soc/mediatek/mt2701/Makefile
index 507fa26c3945..59623d3d3a03 100644
--- a/sound/soc/mediatek/mt2701/Makefile
+++ b/sound/soc/mediatek/mt2701/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_SND_SOC_MT2701) += snd-soc-mt2701-afe.o
 
 # machine driver
 obj-$(CONFIG_SND_SOC_MT2701_CS42448) += mt2701-cs42448.o
+obj-$(CONFIG_SND_SOC_MT2701_HDMI) += mt2701-hdmi.o
 obj-$(CONFIG_SND_SOC_MT2701_WM8960) += mt2701-wm8960.o
diff --git a/sound/soc/mediatek/mt2701/mt2701-hdmi.c b/sound/soc/mediatek/mt2701/mt2701-hdmi.c
new file mode 100644
index 000000000000..a84907879c04
--- /dev/null
+++ b/sound/soc/mediatek/mt2701/mt2701-hdmi.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt2701-hdmi.c -- MT2701 HDMI ALSA SoC machine driver
+ *
+ * Copyright (c) 2026 Daniel Golle <daniel@makrotopia.org>
+ *
+ * Based on mt2701-cs42448.c
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+
+enum {
+	DAI_LINK_FE_HDMI_OUT,
+	DAI_LINK_BE_HDMI_I2S,
+};
+
+SND_SOC_DAILINK_DEFS(fe_hdmi_out,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM_HDMI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_hdmi_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI I2S")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt2701_hdmi_dai_links[] = {
+	[DAI_LINK_FE_HDMI_OUT] = {
+		.name = "HDMI Playback",
+		.stream_name = "HDMI Playback",
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST,
+			     SND_SOC_DPCM_TRIGGER_POST },
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(fe_hdmi_out),
+	},
+	[DAI_LINK_BE_HDMI_I2S] = {
+		.name = "HDMI BE",
+		.no_pcm = 1,
+		.playback_only = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_CBC_CFC,
+		SND_SOC_DAILINK_REG(be_hdmi_i2s),
+	},
+};
+
+static struct snd_soc_card mt2701_hdmi_soc_card = {
+	.name = "mt2701-hdmi",
+	.owner = THIS_MODULE,
+	.dai_link = mt2701_hdmi_dai_links,
+	.num_links = ARRAY_SIZE(mt2701_hdmi_dai_links),
+};
+
+static int mt2701_hdmi_machine_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt2701_hdmi_soc_card;
+	struct device *dev = &pdev->dev;
+	struct device_node *platform_node;
+	struct device_node *codec_node;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
+	int i;
+
+	platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
+	if (!platform_node)
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'mediatek,platform' missing\n");
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->platforms->name)
+			continue;
+		dai_link->platforms->of_node = platform_node;
+	}
+
+	codec_node = of_parse_phandle(dev->of_node, "mediatek,audio-codec", 0);
+	if (!codec_node) {
+		of_node_put(platform_node);
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'mediatek,audio-codec' missing\n");
+	}
+	mt2701_hdmi_dai_links[DAI_LINK_BE_HDMI_I2S].codecs->of_node = codec_node;
+
+	card->dev = dev;
+
+	ret = devm_snd_soc_register_card(dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(codec_node);
+	return ret;
+}
+
+static const struct of_device_id mt2701_hdmi_machine_dt_match[] = {
+	{ .compatible = "mediatek,mt2701-hdmi-audio" },
+	{ .compatible = "mediatek,mt7623n-hdmi-audio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt2701_hdmi_machine_dt_match);
+
+static struct platform_driver mt2701_hdmi_machine = {
+	.driver = {
+		.name = "mt2701-hdmi",
+		.of_match_table = mt2701_hdmi_machine_dt_match,
+	},
+	.probe = mt2701_hdmi_machine_probe,
+};
+module_platform_driver(mt2701_hdmi_machine);
+
+MODULE_DESCRIPTION("MT2701 HDMI ALSA SoC machine driver");
+MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:mt2701-hdmi");
-- 
2.54.0

