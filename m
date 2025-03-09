Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F08C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOhTJF1m94YRb8vnMnDJmrMMQMYxHqwVlUi4dxU65dc=; b=yFKwjLG+RRNQudhifLRwMHpgiV
	qMDaBZsKUSX1YZU9Vhx/xnNhgdj8ZXqvv4Lu1HbqPvodL5C97dazLNlyHRvr4xaFy52FylfBE3VE1
	C4frCG36gtNaaoWdGr84DHZe5ZPRiQI6lIMtOe/AY+DKOSx8LA29oAHnk95fUqKGKPuiboS/8xcSx
	yvaBXIUJm0sG3WlEqAtWCrUAX+XYDSzr9WTz7pVRM78gNW6f/01zzpVrh8pQeIgRsahVGWOr3sL/y
	BeWW+Sto374tZoaG+GiBBG9Mf3u5lI0qyr+tTSXUXgSYyq7knHBoXMGRKWxHjm67NLcCv1gov7OOf
	A3nH1pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLb5-00000000zXl-2Iiv;
	Sun, 09 Mar 2025 18:41:59 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLCY-00000000wn9-0nvc;
	Sun, 09 Mar 2025 18:16:39 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CFD9F100006;
	Sun,  9 Mar 2025 21:16:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CFD9F100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544196;
	bh=FOhTJF1m94YRb8vnMnDJmrMMQMYxHqwVlUi4dxU65dc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oGpco80+PNb7jQKyS/TEc9NqqxkVvP5L98kQxSa3eUuFNHS5bY/tivxT8x0c4tAaj
	 hpg4urBMiHK4CVU0tvm93v6j691GJATzuTgpd4bDKfXEkvWQ6k6oASrIrKLvfdiU3n
	 WTA6zBugdfrbaJ8lq6ncFOrjr2fMkWw4Ptwp2hG0tmFOwK/J5OgkZnZ/Mak5Lwm6dk
	 NHImZZH5Vd3zWDN0WdZb1ZgAdXQLma84CG5CoK/nIy/3QbYT1If0eLQ7McJ75vXSa/
	 jxjSJFMun+Jd+XBwXLB0WxEzW67cyDB7oHqpq4uRpbvyZRpdUXrrIMwYCNPKQuO6Cv
	 UNOVNQ+kierAA==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:36 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Takashi Iwai
	<tiwai@suse.com>
Subject: [PATCH v2 1/3] ASoC: meson: t9015: prepare to adding new platforms
Date: Sun, 9 Mar 2025 21:16:28 +0300
Message-ID: <20250309181630.1322745-2-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
References: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_111638_581509_606F33CD 
X-CRM114-Status: GOOD (  20.44  )
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

Move platform specific code to make the reading of upcoming commit
easier.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/t9015.c | 71 ++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index a80e9c9d6288..919a2413038d 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -51,6 +51,12 @@ struct t9015 {
 	struct regulator *avdd;
 };
 
+struct t9015_match_data {
+	const struct snd_soc_component_driver *component_drv;
+	struct snd_soc_dai_driver *dai_drv;
+	unsigned int max_register;
+};
+
 static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -112,6 +118,11 @@ static SOC_ENUM_SINGLE_DECL(dacl_in_enum, BLOCK_EN, DACL_SRC, dacl_in_txt);
 static const char * const mono_txt[] = { "Stereo", "Mono"};
 static SOC_ENUM_SINGLE_DECL(mono_enum, VOL_CTRL1, DAC_MONO, mono_txt);
 
+static const struct snd_kcontrol_new t9015_right_dac_mux =
+	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
+static const struct snd_kcontrol_new t9015_left_dac_mux =
+	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
+
 static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	/* Volume Controls */
 	SOC_ENUM("Playback Channel Mode", mono_enum),
@@ -126,11 +137,6 @@ static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	SOC_SINGLE("Unmute Ramp Switch", VOL_CTRL1, UNMUTE_MODE, 1, 0),
 };
 
-static const struct snd_kcontrol_new t9015_right_dac_mux =
-	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
-static const struct snd_kcontrol_new t9015_left_dac_mux =
-	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
-
 static const struct snd_soc_dapm_widget t9015_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("Right IN", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("Left IN", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -223,7 +229,20 @@ static int t9015_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int t9015_component_probe(struct snd_soc_component *component)
+{
+	/*
+	 * Initialize output polarity:
+	 * ATM the output polarity is fixed but in the future it might useful
+	 * to add DT property to set this depending on the platform needs
+	 */
+	snd_soc_component_write(component, LINEOUT_CFG, 0x1111);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver t9015_codec_driver = {
+	.probe			= t9015_component_probe,
 	.set_bias_level		= t9015_set_bias_level,
 	.controls		= t9015_snd_controls,
 	.num_controls		= ARRAY_SIZE(t9015_snd_controls),
@@ -235,22 +254,25 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.endianness		= 1,
 };
 
-static const struct regmap_config t9015_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= POWER_CFG,
-};
-
 static int t9015_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct t9015_match_data *data;
 	struct t9015 *priv;
 	void __iomem *regs;
+	struct regmap_config config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+	};
 	struct regmap *regmap;
 	struct clk *pclk;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		dev_err_probe(dev, -ENODEV, "failed to match device\n");
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -276,25 +298,28 @@ static int t9015_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 	}
 
-	regmap = devm_regmap_init_mmio(dev, regs, &t9015_regmap_config);
+	config.max_register = data->max_register;
+	regmap = devm_regmap_init_mmio(dev, regs, &config);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(regmap);
 	}
 
-	/*
-	 * Initialize output polarity:
-	 * ATM the output polarity is fixed but in the future it might useful
-	 * to add DT property to set this depending on the platform needs
-	 */
-	regmap_write(regmap, LINEOUT_CFG, 0x1111);
-
-	return devm_snd_soc_register_component(dev, &t9015_codec_driver,
-					       &t9015_dai, 1);
+	return devm_snd_soc_register_component(dev, data->component_drv,
+					       data->dai_drv, 1);
 }
 
+static const struct t9015_match_data t9015_match_data = {
+	.component_drv = &t9015_codec_driver,
+	.dai_drv = &t9015_dai,
+	.max_register = POWER_CFG,
+};
+
 static const struct of_device_id t9015_ids[] __maybe_unused = {
-	{ .compatible = "amlogic,t9015", },
+	{
+		.compatible = "amlogic,t9015",
+		.data = &t9015_match_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, t9015_ids);
-- 
2.34.1


