Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DF5C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=; b=ek3VAzE4MY/OACUamenG0gI8/F
	NajnflaKykxUKbqNfIe7kq2jo3R4fxo6KYSYEwB1yr+9sLSI8F4e1uIL9XkrS0GvTWKxkw+McJK6g
	KqfqSAEdPdaJ6Bw7K+mDm++j0W2TIBYzZNuEeT+P6Mtjby0kDgoRuT7qZCDBuHI048bZF/faZLU0v
	eU9SDJv3jar+KQ+RUS2UCgC6cO3spncHDmWhrODKzOW+JYoj6UkMlfNpFwsFiZaa+uHgZbQ1UOxED
	GG5e80g5j5abMPoWH2284PfJ130oktjFrHybQJcbqIN5RuervmNFyXxRiaOGAinVJzMczCWriuwXB
	MkWwfx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlV-00000008VOn-436G;
	Tue, 08 Sep 2026 09:05:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlO-00000008VG4-25dv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=; b=l/CkAGiivXOX5/KFQ4LuwibzBv
	OEfNkbcVfJKJvCMcTtFUwvnDrPH48U8TrodScRp2uUlydN4wy3QUXw8kiLcNw0C3sjCjZSj/P54Dz
	pTWG+3byqaywUTpx5Dd/bRmQkoZ5Li91i1TkRf0Ef0+q9scSTDQSONLxIkqmZxMiFNSX1oYrambkL
	lDQqJvf0b2d7tdES8XONP3yrZ1Ton81gJvG6DrpUjOqi/JzanM5HVV5csZw+0Amz2VxpF66J7ZvmZ
	JkoPYi1QeRz0bDRKtiK0/bqnOOydyH8nMUMY+apg+TZ4fSdILBqlGdmTAVSEPC5amHF9Ohz2NfqdT
	vzaz7WJQ==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rlK-0000000HAFf-3pBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2531f453eeso605478466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858305; x=1789463105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=;
        b=JeqC8LZsyr6bXcBZW77O6mKA82S+AMkceSNyhFSPQ6UO1yFEL6ZyJMmyIvzJrItVxs
         LJwte3O+UD5wC+2RX5NdW8nSb4z9hcFDWR16YIBUP972nLxEeuMw6Y643QdLKlW3sedX
         Kavnmm6TySa3c1dIGQBYe+G/Tkvo19YIBiAsTLvjWz+hNzbDcparVkOypFfCj70Uq+5T
         ovz8jsPg8oxqaw4pQ7IBV15OINfL5bm21UiaG5pswWhCDPHX+giQT2C/I6mXyMRQMoiK
         DZJvh2B3oU3vFpJxMnsKVje8dGKciFHwa1lh8Ro8oz0vmB9GuGBa5ENLDJuIocW6flxd
         NLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858305; x=1789463105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=;
        b=pAPeudwfn7MD3a6cE4deh3lZEFKvfKAx6KgmI+R2Wi/MVzZztZ+rGmXBL278DyRVYm
         Z0U042gkQrvH+Zd0urQyzIdzW6QSx/sKQW8LM0t6ToLQWpMu+MP4oH7FglIs0LKNwF4f
         iAVLh4N7uzsUlayVp7SORNKTlrxmHB4PUDga9obebeTMmwUbGD1BKbrL8RvRZtey9Gji
         yGjU3ZIzqie0zCfTpfoZUmHXuORN7kQQstoXtB4d0pPhrZp/Kj1jw+QSd37qwiEmJcGX
         eYURvRi8cYXIMm9Uu3ThP9FiuxdePAwFq+y0WG/fLqw9k3qP1zNC2GSbomWoAzw7nVqk
         DKIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUl/DeD82Kx+D5e/XOuAH2cLI6E6pyNflx6rAn3y0QmyQzW2yqSFyYr2fiMQxEFmGA+y+H3bmoaHDBYvZ3Onm2@lists.infradead.org
X-Gm-Message-State: AFuF++ldTDH5wH2DfdODoZvR9J78YewJBSzl48D3WI3D1ro51baC7hHG
	KJO94p6alxFQcr8KvGe2qb+Cc2cVXSon3/cpiRl071yWAmpMke6eHkHM
X-Gm-Gg: AYBFou2BJIHc2G7/Qwe56q0K3xY9tAf/Vzr7Y0XdU5TZSHp+sxe2EEiJjW7gxYgYFu4
	IXdoL/Hpkm138uDwNBgfH32Pe9uS9bSasqMVD6utMXIQBsJgJC0HfPHd7EZ/JnaEvxm2UlrYNju
	y7jcPclhD5VCdrszX75rd5EXXDaBJJ+JJpmjDQGG2CPQIJyLxPji8mza5sbWyrJUY+5ArvF+3g0
	L7a00IOuSZmdfGgzjURu8QAm1SJFybxeSBrwHT2s4Azf1ycAQTvcCqXsBR+fiP+Pkgkh/NwAO4E
	eGV2FknT6jxiS5GvZreezFnhQzRHRL/43JAcKxgwxeyWrEP/THuQGf9bxTJsQtQlo6pCdWmK2Ca
	jL2RtJs37/fUYDj+aJra5P9xiNWom0XU2QtdQu4EAQPp5sSflab8QBgueE/zHVaMR9AvknMPnhW
	e9PUedwfzduJd0SO06zdg1pIMjoH5jczI+Rdv25vuYNg/1r8cHak1oU9YpQyxrVc3e9seir3TB5
	qsX/ow1Oz7ntpFZg+0KeYdaSQmsX0k+yJrSxMesA/k28JSknVFu
X-Received: by 2002:a17:906:7956:b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c260ca323dcmr1963636366b.19.1788858305144;
        Tue, 08 Sep 2026 02:05:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 5/5] ASoC: airoha: Add machine driver for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:47 +0200
Message-ID: <20260908090448.3332-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100507_093464_01AC1973 
X-CRM114-Status: GOOD (  27.05  )
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

Add support for the machine driver for Airoha AN7581 paired with the WM8960
i2c codec. This driver creates the sound card for the AFE driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/Kconfig                |  10 ++
 sound/soc/mediatek/an7581/Makefile        |   1 +
 sound/soc/mediatek/an7581/an7581-wm8960.c | 161 ++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index eb6f2a443b23..ff2869641a35 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -16,6 +16,16 @@ config SND_SOC_AN7581
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_AN7581_WM8960
+	tristate "ASoc Audio driver for Airoha AN7581 with WM8960 codec"
+	depends on SND_SOC_AN7581 && I2C
+	select SND_SOC_WM8960
+	help
+	  This adds support for ASoC machine driver for Airoha AN7581
+	  boards with the WM8960 codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
 endmenu
 
 menu "Mediatek"
diff --git a/sound/soc/mediatek/an7581/Makefile b/sound/soc/mediatek/an7581/Makefile
index d6de5ee1668e..f48cd0269bea 100644
--- a/sound/soc/mediatek/an7581/Makefile
+++ b/sound/soc/mediatek/an7581/Makefile
@@ -6,3 +6,4 @@ snd-soc-an7581-afe-y := \
 	an7581-dai-etdm.o
 
 obj-$(CONFIG_SND_SOC_AN7581) += snd-soc-an7581-afe.o
+obj-$(CONFIG_SND_SOC_AN7581_WM8960) += an7581-wm8960.o
diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediatek/an7581/an7581-wm8960.c
new file mode 100644
index 000000000000..03ea5732563c
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Airoha ALSA SoC I2S platform driver for AN7581
+ *
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+
+#include "an7581-afe-common.h"
+
+SND_SOC_DAILINK_DEFS(playback,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+static struct snd_soc_dai_link an7581_wm8960_dai_links[] = {
+	/* FE */
+	{
+		.name = "wm8960-playback",
+		.stream_name = "wm8960-playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback),
+	},
+	{
+		.name = "wm8960-capture",
+		.stream_name = "wm8960-capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture),
+	},
+	/* BE */
+	{
+		.name = "wm8960-codec",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBP_CFP |
+			SND_SOC_DAIFMT_GATED,
+		SND_SOC_DAILINK_REG(codec),
+	},
+};
+
+static struct snd_soc_card an7581_wm8960_card = {
+	.name = "an7581-wm8960",
+	.owner = THIS_MODULE,
+	.dai_link = an7581_wm8960_dai_links,
+	.num_links = ARRAY_SIZE(an7581_wm8960_dai_links),
+};
+
+static int an7581_wm8960_machine_probe(struct platform_device *pdev)
+{
+	struct device_node *platform_dai_node, *codec_dai_node;
+	struct snd_soc_card *card = &an7581_wm8960_card;
+	struct device_node *of_platform, *codec;
+	struct snd_soc_dai_link *dai_link;
+	int i, d, ret;
+
+	card->dev = &pdev->dev;
+
+	of_platform = of_get_child_by_name(pdev->dev.of_node, "platform");
+
+	if (of_platform) {
+		platform_dai_node = of_parse_phandle(of_platform, "sound-dai", 0);
+		of_node_put(of_platform);
+
+		if (!platform_dai_node) {
+			dev_err(&pdev->dev, "Failed to parse platform/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		struct snd_soc_dai_link_component *platform;
+
+		dai_link->num_platforms = 2;
+		for_each_link_platforms(dai_link, d, platform) {
+			if (platform->name)
+				continue;
+			platform->of_node = platform_dai_node;
+		}
+	}
+
+	codec = of_get_child_by_name(pdev->dev.of_node, "codec");
+
+	if (codec) {
+		codec_dai_node = of_parse_phandle(codec, "sound-dai", 0);
+		of_node_put(codec);
+
+		if (!codec_dai_node) {
+			of_node_put(platform_dai_node);
+			dev_err(&pdev->dev, "Failed to parse codec/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		of_node_put(platform_dai_node);
+		dev_err(&pdev->dev, "Property 'codec' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->codecs->name)
+			continue;
+		dai_link->codecs->of_node = codec_dai_node;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
+		goto err_of_node_put;
+	}
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
+		goto err_of_node_put;
+	}
+
+	return 0;
+
+err_of_node_put:
+	of_node_put(platform_dai_node);
+	of_node_put(codec_dai_node);
+	return ret;
+}
+
+static const struct of_device_id an7581_wm8960_machine_dt_match[] = {
+	{ .compatible = "airoha,an7581-wm8960-sound" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an7581_wm8960_machine_dt_match);
+
+static struct platform_driver an7581_wm8960_driver = {
+	.driver = {
+		   .name = "an7581-wm8960",
+		   .of_match_table = an7581_wm8960_machine_dt_match,
+	},
+	.probe = an7581_wm8960_machine_probe,
+};
+module_platform_driver(an7581_wm8960_driver);
+
+MODULE_DESCRIPTION("Airoha SoC I2S platform driver for ALSA AN7581");
+MODULE_LICENSE("GPL");
-- 
2.53.0


