Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D75C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQTl2yWBxu//zbP5sWSZfsZGIV4BkU9peMdt+WBASkE=; b=2hckM4pwJU23u7rf6lt2rUXHXv
	ovk/0NayGmUaAObNjlteWa/TiW6Ct+yiEBYwOfSCThKdWC4ZE4La0H/7NfIvhF5OvbJk8r8OAemt5
	TxLLLUc5NiShTU9Z+cJr0ObRxndlWZJEe36w3qb6pqGL34GRsAaMH9AyRXHdpeQTR9uRX2Kmg1Pl5
	gVsFiUhyV2Ryf7mSJyUPxWQsAj35NoxO/azm0VzxQNh03k7DS9ahyZNC7JyvlFHvBNdTvK8xENJQe
	vjPUNPaxlDobuwMRTri3b8SgIjnVFde1HQKMtc19BtKZf5ZNgi5r0mfMyXhAZmjuhlVKainWBNZrj
	ZX+GC8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3rh-0000000GLgg-3mCC;
	Fri, 14 Feb 2025 22:08:53 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3mJ-0000000GKuZ-2eaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:03:20 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A531D2540160;
	Fri, 14 Feb 2025 17:03:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 14 Feb 2025 17:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570598; x=
	1739656998; bh=yQTl2yWBxu//zbP5sWSZfsZGIV4BkU9peMdt+WBASkE=; b=A
	07uP8uRFfo/ZmZ1tqW2W+6UpvSREqOJDLX5jBILeQBP5UlJrz+RfbuBrLqYf41ww
	bR7Irqlb4HVXMV+ZKp349SognNu9W3dIZT8n2x4vtsVmR4e7ZSgZ4ZgMI170wBUb
	VjcNhCwPjyo8DuD2VH06c/9yBnuu7rNqf2+CkJXE3Ewu8KhH8Q1t2FU3nQESqDUu
	QTjXoNsN8RfKCtbgBNSSvjFmeb2CJgsxe3ahMlj9U1MFkz24pDaTC9JWMM3XcWH0
	4AVTRhPQ8DUbBLh7/Gy93yOu1EJTC9OzRoohUHZb3P+1wvZs1BOYFahcszyCgyCU
	qwG2sHxr14r1goSy7D2pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570598; x=1739656998; bh=y
	QTl2yWBxu//zbP5sWSZfsZGIV4BkU9peMdt+WBASkE=; b=O68Ivs0sRRGjv1io4
	r+dpnT769VZRxjQ1UFjWwArNTGkcUctQNy7wqfraeqW+bNaFaRI7EakbZgx+Lhly
	Q/KL+T+ldftfWsjzIFA/PkLEPXs8GPmOCscTT1lpPu914H6jSuxvQCnkb9C987ww
	2ratELoRpRsqr/o3uaBF7i1RPMQstMcU9rvvq8qgXoK/RDk4gMSpMghUGbbTR60U
	/H2akzErkI1FlGT0CiMkUP+6KM/E20daa6Uw0+c3c7fLnU7jHG+mJ4jB7O3LsPGr
	uTvj72B7nG53hfIbiJmosIuVrdjcTZUU9+7mNDSHQbB1d+hMmKjL3t5ZcpZEQHkW
	oaOzw==
X-ME-Sender: <xms:pr2vZ0gWIT28-N10dWxVMubAgtuWDV9T_YZxan2PjY-SAfSDtyjyXA>
    <xme:pr2vZ9BIcQPCsIP0xU80RceuLCFVr8lQXTFBNwwfv_Slzkt1R3QYSTnur6HwX-T8Z
    R150EkCT9_g1FVESg>
X-ME-Received: <xmr:pr2vZ8E4x7Vd_R18XB4rSdMJwEs3Y8juRoH4cw4RATVRQW7CdoZL1ewkWAv6oqGbL4YIYyJyx6foEPUd5WdcrRaflme0-rBfdKRhd8i_iRgz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:pr2vZ1T8n1f-x3lIjcRNB2gzSpnT5GIXmFQUfa1KlwH4QjlmBgbscA>
    <xmx:pr2vZxyshb3whw4n1e8AKh8bxbC1oVAYoi516UHbRVa8a7ar9ZhBEA>
    <xmx:pr2vZz4MQj3WsSEOaEXCwg90I91Aj_r7AQBdlpdc5zgxnPe-Gvd_sQ>
    <xmx:pr2vZ-x75Otj5S5KgSpVAHLfPvXaXeG7sLpIBoTy5Iz_UsgtCukQqg>
    <xmx:pr2vZ5AILt15Ngyp6qOR-cBP9YuPdRn81rkYU_8AJjuFuEF3ng-oLg4V>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:13 -0500 (EST)
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
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 3/5] ASoC: sun4i-codec: support hp-det-gpios property
Date: Sat, 15 Feb 2025 11:02:25 +1300
Message-ID: <20250214220247.10810-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_140319_727550_18E7C0FF 
X-CRM114-Status: GOOD (  17.87  )
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
- Separate DAPM changes into separate patch and add rationale.
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


