Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A75FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic+OZ7nYn48w9tiM8ZxAJ9YbDge6f3PVBtso/XTbadU=; b=wBUy/DEc9437xe9mA+2V5BsMXs
	hS2AJS60wvOX9eJRQ+3ISGPARtHAsvkPxRh7QFxVKjxsJRTF4ndALAu1DqpU+M1wJHCNnTBQLJBxZ
	qQdNJbDA/nek8oUVYb9kCQ5c0wktC+M7SODYOODcEoTmMB0TIABk1HXBUDgRh1L4Yle4MVjgkrNvC
	UmTpVs0MiaI4T3nrQfTL9jZ0E71bVJYmV8kXAUTV+yn6C6Qu5X/b174Coj4LbRa7UbsKezyWi2BR3
	VfWvAx0ZTP8rSWGqGCZ2QHFpiHZ24/tU4meHX/s1PxMcCPN46/DCdcAdZk6lHzF8sR4ml+QgLkIGZ
	qeZWcLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOw3p-00000006o0V-3iJH;
	Sat, 21 Dec 2024 09:46:13 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOvzX-00000006nLL-1wot
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 09:41:48 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D9D071140157;
	Sat, 21 Dec 2024 04:41:46 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 21 Dec 2024 04:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1734774106; x=
	1734860506; bh=ic+OZ7nYn48w9tiM8ZxAJ9YbDge6f3PVBtso/XTbadU=; b=e
	bgzXI655/AIg2Jj1OWoYkYKVJYJhN/tLS5q7DRj8xYoNfyqCTw46HMYUvle3dVIG
	5VD825ytUSYqk0jgESSUB1nJH2Skt8yeNvzyXe82DSPh01+gB065l73ziahiC4r8
	UY+qpbSpoa1IdgsOcS9HvKUFnHOCZHbX/sF44BirGqMG+W4W8UbQm6PUQgtP8DlQ
	7uH0hb/A5F8LkPZO0hLXisWf7kJKVcltd3sdZx4dcXsc8sg1JNwiQxNq3+rNkyy2
	aPPVkfZmFj1pn4RyjGD+cqNmhgQ9ezNj2LtWBOj+Le8M84ntEJtLQucBbuvWTVqf
	PH9OOI+EYkutNo7Xr9JeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1734774106; x=1734860506; bh=i
	c+OZ7nYn48w9tiM8ZxAJ9YbDge6f3PVBtso/XTbadU=; b=XuI+IoOqTm6F4rpY3
	Frbl3nUg/U3+1dYsAxgpcrr8xtyLWhPoT+3lDPJYKHPkmdVTth5l3eP1PufKaHqb
	vYrn0+qPEEWJxXs71CaCTTLuNGOKXoJ/1D1cPV9ej1DiwmnQazUwbE3sLa+wlV45
	qCCDHH5oOb/xnsYTCoVN3O2J/Q9msbH/C2ZGAcsp9C+WmaSbS1fzTaS/k1HIAeOf
	CM5OS4a+0mMlvSA4FLsTXWJ1PzPT1Qq0P/DvTMhAE6a+XPOGhZyKuVF7YWPGGEVo
	ilEBAdNsuYoZrCWluALHdNmhpb/j9diCcTW4LK4gBoGCiwnGiQc6WLKti+BfGer2
	cNi3Q==
X-ME-Sender: <xms:Wo1mZ2otyArIGcDI5Y5UBzZUsbO67VodGoviawyDZvCgIVaiK7hKyA>
    <xme:Wo1mZ0qutoEfQ-WkMfaufRjKyw24i7HNj8auluGKa4Rr0bEiLQsGBq28moWQSX2gT
    -b1Ivy9BN2987ELkA>
X-ME-Received: <xmr:Wo1mZ7MJ9yrIHqzuLlL3ETx_5ItlTc7POcFHfK97RX2fhka35eUxR4vPbDAtIYDalZftCr9RVNJdgSh6CY3udhBoyKOOAR5vD0ui7hlqTnYn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Wo1mZ15fza1ppsM5jiIETjo0059YNfAWcQnMxC7DQTozyIXTtP89QA>
    <xmx:Wo1mZ17TCy_bsLaL30NQhkS4XNP2CPUSVMZkuGLdat3-2TJLab_qDg>
    <xmx:Wo1mZ1gPfofqUGNcRaMTP5MYPl705swq-9fXe3btuu2WaN7mVNyrGw>
    <xmx:Wo1mZ_4pM9pxX4BxPwMjU6hyigft7sRBQk0QECWqcknNoFSmNi2zEA>
    <xmx:Wo1mZ0LCbDQrv1x8BRuuSj1PLbyPgWoEuhXbopbXJJJE-jLj3xPR5--x>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 04:41:42 -0500 (EST)
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
Subject: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
Date: Sat, 21 Dec 2024 22:26:33 +1300
Message-ID: <20241221094122.27325-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221094122.27325-1-ryan@testtoast.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_014147_576615_9FC50177 
X-CRM114-Status: GOOD (  18.62  )
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
is a common sink in the driver. Note this patch also adds the output
of Headphone for the H616 codec.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 sound/soc/sunxi/sun4i-codec.c | 59 +++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 933a0913237c8..5f718dd3fcf0a 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -21,6 +21,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -272,6 +273,7 @@ struct sun4i_codec {
 	struct clk	*clk_module;
 	struct reset_control *rst;
 	struct gpio_desc *gpio_pa;
+	struct gpio_desc *gpio_hp;
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
@@ -1302,6 +1304,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.ops = &dummy_dai_ops,
 };
 
+static struct snd_soc_jack sun4i_headphone_jack;
+
+static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] = {
+	{ .pin = "Headphone", .mask = SND_JACK_HEADPHONE},
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
+			        "Headphone jack creation failed: %d\n", ret);
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
@@ -1327,6 +1372,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 	link->codecs->name	= dev_name(dev);
 	link->platforms->name	= dev_name(dev);
 	link->dai_fmt		= SND_SOC_DAIFMT_I2S;
+	link->init		= sun4i_codec_machine_init;
 
 	*num_links = 1;
 
@@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
 };
 
 static const struct snd_kcontrol_new sun50i_h616_card_controls[] = {
-	SOC_DAPM_PIN_SWITCH("LINEOUT"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
 static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
 };
@@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
-	card->name		= "H616 Audio Codec";
+	card->name		= "h616-audio-codec";
 	card->driver_name	= "sun4i-codec";
 	card->controls		= sun50i_h616_card_controls;
 	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
@@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "allwinner,hp-det",
+	                                          GPIOD_IN);
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
2.47.1


