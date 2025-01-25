Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C48BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IoEO+9R8j8Un9cYoSvY/uysWqLsZR32aOL15xQ72n4=; b=4xDcIhuFXvAWylHgN7DWwgvTg3
	OG8C861KxNttAp8hSt6yODvFBe/anCKBVMqpKZN4CcX5p2xz9lQvPqprHkPeD03ehML3GhS/Btjv7
	ceRv3vuI5OxIoGQ1zb/0tl+DSM1kamOGyP3CZBwg68avE+9oRLoPJPLy3goXbITE0tG0BAJNp8pXK
	+riR/a31q9iAzG/6XFAgKpzh76CbRlrFBQfD+x5AddKJ9NCnySNZgsLwA5zTThGKVce7rfJref6L6
	zr1eYEKCkjO6Ne5/X2JkOwfqdiAeUmIZGcqWjGGSMbLH7e7VEMm+dlMzCu2cVbgzGntkC/bSZDbOs
	nlFmiLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaJs-0000000GC7n-0NII;
	Sat, 25 Jan 2025 07:11:04 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEb-0000000GBhe-2wf3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:39 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0B4B125400D9;
	Sat, 25 Jan 2025 02:05:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 25 Jan 2025 02:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788735; x=
	1737875135; bh=1IoEO+9R8j8Un9cYoSvY/uysWqLsZR32aOL15xQ72n4=; b=H
	pkQMzUWRU0IbTI5uVW6Du8Ief0tRebl8KNXKyjp036hksrhAWQfgvuyDQShJEsqo
	LZEaeJNvx9XewjVe1/kqsIZGC+X0tK8ATuCoeTQjC4p3UvwF4418t23exld/A+Mk
	tiQO+/h9Qq2lZh91LlYV8q3hkiKYHtyAYEN3wFb5V7pN2n/8HHHA55HD+1M7p7Fm
	TNHJ3m04eNFiJRkMnRv2WFoFMWEZkzDUpOGIxZqbG/lnqOEYAL8lQRcrde2Af6g9
	O5tkIdO6lbJ56KGrB5IY0RcBa+eoTVzUo8USsxKymhP4BfNG0R5f2LcWVG+FFNdL
	Q6MhDsiwHITV+I36c3hyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788735; x=1737875135; bh=1
	IoEO+9R8j8Un9cYoSvY/uysWqLsZR32aOL15xQ72n4=; b=kjwOkX5T+Xdcv5BN6
	fahiMD6uSdJJdV1G80LTI6uUtbfGeQHGGtopJNXlDgO2bY/HpPYhu7Zsi+2Tt9B0
	tzUutA5k0ixMV/G4qvHFqAEOM4co+vAcM1j3OF0woZtrJV5E15ZuRabmznklVBLE
	Sc6za2JkEFTvfzs/nzjHbXCpprMpWjl5CitKvR/N3GswwcslG36gDuWZmWqMrfNV
	hDndn/2WcqxyFpXa/3mmRLAZ6XOXnOFbg+pCIXVV+yXfi0MAB0DsW1RIueN+dkI9
	IVSMcqi9zxMk1vQXIsvlBQp1qB1WOR4vGLyTigy3/AUHZvACdsUHyGl8hqTwL2Cr
	imDTQ==
X-ME-Sender: <xms:P42UZ7-oNdreVZwqyAlM6DprcfidEtcGIJ0F184dUzKNgYKE1usP-A>
    <xme:P42UZ3uPfpgH9NsJeX49eGLBaeqUcSA3WBxjksYmxHAB6UNmwRuJBNDo1Y4wrlK86
    klQb9ajL0PgQrs4rQ>
X-ME-Received: <xmr:P42UZ5Dxj4lIdWklokx-U2FbvRqKrcFQByyALzdWWqZ7JL_ng5dVVZBrBMge-g_zyQqKulUngu7dN7_2jSGkvPDRdTksFbUU4XBbqWWmXZx6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:P42UZ3em9Lrca0xam9CONWr66ZtQ7n6cr_vqQ3B82-ZL16MMC1ISlg>
    <xmx:P42UZwOPsUtLS7x44vRkd6hKZYfrTyQG6QQrfAQNnWncUdvxmfpkOQ>
    <xmx:P42UZ5kywbLABuLpUro3I_efx2qgZARlaZcyQQHZtQDF6ozt_sk5_w>
    <xmx:P42UZ6uSYXWdT3_n_xYEG9NjAMq8LJYi260_bgkoybmKJ97UPkGKig>
    <xmx:P42UZyv-yd2c1rpmOkGgNU5qrc8YTAqhNPsb40PXXYMpjFE5DpLsUnlX>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:31 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 3/5] ASoC: sun4i-codec: support hp-det-gpios property
Date: Sat, 25 Jan 2025 20:00:13 +1300
Message-ID: <20250125070458.13822-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230537_799187_34F15A77 
X-CRM114-Status: GOOD (  18.09  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for GPIO headphone detection with the hp-det-gpios
property. In order for this to properly disable the path upon
removal of headphones, the output must be labelled Headphone which
is a common sink in the driver.

Describe a headphone jack and detection GPIO in the driver, check for
a corresponding device tree node, and enable jack detection in a new
machine init function if described.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Whitespace fixes.
- Remove vendor prefix from device tree string.
---
 sound/soc/sunxi/sun4i-codec.c | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f24bbefeb3923..3701f56c72756 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -22,6 +22,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -331,6 +332,7 @@ struct sun4i_codec {
 	struct clk	*clk_module;
 	struct reset_control *rst;
 	struct gpio_desc *gpio_pa;
+	struct gpio_desc *gpio_hp;
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
@@ -1583,6 +1585,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.ops = &dummy_dai_ops,
 };
 
+static struct snd_soc_jack sun4i_headphone_jack;
+
+static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] = {
+	{ .pin = "Headphone", .mask = SND_JACK_HEADPHONE },
+};
+
+static struct snd_soc_jack_gpio sun4i_headphone_jack_gpio = {
+	.name = "hp-det",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+};
+
+static int sun4i_codec_machine_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	if (scodec->gpio_hp) {
+		ret = snd_soc_card_jack_new_pins(card, "Headphone Jack",
+						 SND_JACK_HEADPHONE,
+						 &sun4i_headphone_jack,
+						 sun4i_headphone_jack_pins,
+						 ARRAY_SIZE(sun4i_headphone_jack_pins));
+		if (ret) {
+			dev_err(rtd->dev,
+				"Headphone jack creation failed: %d\n", ret);
+			return ret;
+		}
+
+		sun4i_headphone_jack_gpio.desc = scodec->gpio_hp;
+		ret = snd_soc_jack_add_gpios(&sun4i_headphone_jack, 1,
+					     &sun4i_headphone_jack_gpio);
+
+		if (ret) {
+			dev_err(rtd->dev, "Headphone GPIO not added: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 							int *num_links)
 {
@@ -1608,6 +1653,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 	link->codecs->name	= dev_name(dev);
 	link->platforms->name	= dev_name(dev);
 	link->dai_fmt		= SND_SOC_DAIFMT_I2S;
+	link->init		= sun4i_codec_machine_init;
 
 	*num_links = 1;
 
@@ -2302,6 +2348,13 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "hp-det", GPIOD_IN);
+	if (IS_ERR(scodec->gpio_hp)) {
+		ret = PTR_ERR(scodec->gpio_hp);
+		dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio\n");
+		return ret;
+	}
+
 	/* reg_field setup */
 	scodec->reg_adc_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
-- 
2.48.1


