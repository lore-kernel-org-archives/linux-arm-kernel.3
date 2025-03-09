Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FBBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIx0W1LfWeznA2Pzk63TeCGu+WicnlgfsVi9g83ynS8=; b=ezhijJtMbAiEg21CR/gtr4zAjh
	v03qX2xYC/I5K3loAv1t7OyfSblt6+VKV9zuTP7GnCaNWgkNDt7R1jgr6NZGNVW0woBdzXjVyZN6I
	Nnp8xCrVDw7sQ8aB7RtUbjRJBTT0LMyjpSGTLxJ+UgSLgLO2FXSnYupNPgzZKXDpMA1QBzaoMR5hV
	XxYMtrMhwi6UAoOVIATwFQ0ayBGRFLDMo72kBNvLGYd2KNdFjmvRIXCAXE2XNNZaU7GdLThaYU2xK
	2tshctEhoCa+8Mi+03W4jsww7wOTDY/BdVE8p1HGLJwuaH1M241VYsAYqAfvMpX0l/PhN9J5LSZA0
	td72yp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLXu-00000000zBg-2RBC;
	Sun, 09 Mar 2025 18:38:42 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLC5-00000000wf0-2HCl;
	Sun, 09 Mar 2025 18:16:11 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1DA57100008;
	Sun,  9 Mar 2025 21:16:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1DA57100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544168;
	bh=eIx0W1LfWeznA2Pzk63TeCGu+WicnlgfsVi9g83ynS8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Z+mc+EbZWuDgUgBTqYf+GlzTeFxTFodC8Tl6Qli37SaqZlmiZetcBK7+ahR1FmFhr
	 aK+JORJYFeZXe1QU/c68fhwXf4y6IbYRmTihX6DgVU0+2HysrOXfs/1hQItwqK7Qhe
	 KQCOhT400Y5LRPQEyBGsvCQUBspS8PSv4qAnRowPN7Qd0ymZwr2Vr8aJu3Vo+yMm7O
	 +DOG+MYb6jW6JcEA4d5i+AQybwYnPY4heN+xya3ii7jZB7XvfklfLlAg6Kiumx8eY/
	 LkT+i8HWU3UovQZL/5CcEy4Ho/tLgq2NNwQDa7zT/+n06Wtut9YKCM387XeI4gM0i/
	 4zWTPNhY1Ph8g==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:07 +0300 (MSK)
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
Subject: [PATCH v2 4/4] ASoC: meson: g12a-toacodec: add support for A1 SoC family
Date: Sun, 9 Mar 2025 21:16:00 +0300
Message-ID: <20250309181600.1322701-5-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
References: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
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
X-CRM114-CacheID: sfid-20250309_111609_959607_A871156F 
X-CRM114-Status: GOOD (  22.28  )
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

Internal codec on A1 SoC has ADC and this commit adds support for
capturing from it.

Also, regmap now uses caching for all platforms. Values that are written
to toacodec's register on A1 SoC can not be read back, that breaks
regmap_update_bits() functionality. Let's hope the caching will not
break anything on other platforms. Since .max_register now is explicitly
equal to 0, .reg_stride is also removed.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/g12a-toacodec.c | 197 +++++++++++++++++++++++++++++---
 1 file changed, 184 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 03bde8d8d192..431fcd364001 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -31,6 +31,8 @@ struct g12a_toacodec {
 
 struct g12a_toacodec_match_data {
 	const struct snd_soc_component_driver *component_drv;
+	struct snd_soc_dai_driver *dai_drv;
+	int num_dai_drv;
 	struct reg_field field_dat_sel;
 	struct reg_field field_lrclk_sel;
 	struct reg_field field_bclk_sel;
@@ -40,6 +42,10 @@ static const char * const g12a_toacodec_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
 
+static const char * const a1_toacodec_mux_texts[] = {
+	"I2S A", "I2S B",
+};
+
 static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -93,8 +99,11 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0, 14,
 static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0, 18,
 			    g12a_toacodec_mux_texts);
 
-static const struct snd_kcontrol_new g12a_toacodec_mux =
-	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
+static SOC_ENUM_SINGLE_DECL(a1_toacodec_mux_enum, TOACODEC_CTRL0, 19,
+			    a1_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new a1_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", a1_toacodec_mux_enum,
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
@@ -103,9 +112,20 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+static const struct snd_kcontrol_new g12a_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0, 31, 1, 0);
 
+/* Don't use AUTODISABLE unlike G12A. On A1 it causes noise after playback
+ * is stopped.
+ */
+static const struct snd_kcontrol_new a1_toacodec_enable =
+	SOC_DAPM_SINGLE("Switch", TOACODEC_CTRL0, 31, 1, 0);
+
 static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
 	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
 			 &g12a_toacodec_mux),
@@ -120,19 +140,34 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
-static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *params,
-					 struct snd_soc_dai *dai)
+static const struct snd_soc_dapm_widget a1_toacodec_widgets[] = {
+	SND_SOC_DAPM_SWITCH("EN", SND_SOC_NOPM, 0, 0,
+			    &a1_toacodec_enable),
+	SND_SOC_DAPM_MUX("Playback SRC", SND_SOC_NOPM, 0, 0,
+			 &a1_toacodec_mux),
+	SND_SOC_DAPM_MUX("Capture SRC A", SND_SOC_NOPM, 0, 0,
+			 &a1_toacodec_mux),
+	SND_SOC_DAPM_MUX("Capture SRC B", SND_SOC_NOPM, 0, 0,
+			 &a1_toacodec_mux),
+};
+
+static int g12a_toacodec_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai,
+				   bool playback)
 {
 	struct meson_codec_glue_input *data;
 	int ret;
 
-	ret = meson_codec_glue_input_hw_params(substream, params, dai);
+	ret = playback ? meson_codec_glue_input_hw_params(substream, params, dai)
+		       : meson_codec_glue_capture_output_hw_params(substream,
+								   params, dai);
 	if (ret)
 		return ret;
 
 	/* The glue will provide 1 lane out of the 4 to the output */
-	data = meson_codec_glue_input_get_data(dai);
+	data = playback ? meson_codec_glue_input_get_data(dai)
+			: meson_codec_glue_capture_output_get_data(dai);
 	data->params.channels_min = min_t(unsigned int, TOACODEC_OUT_CHMAX,
 					data->params.channels_min);
 	data->params.channels_max = min_t(unsigned int, TOACODEC_OUT_CHMAX,
@@ -141,6 +176,21 @@ static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct snd_soc_dai *dai)
+{
+	return g12a_toacodec_hw_params(substream, params, dai, true);
+}
+
+static int
+g12a_toacodec_capture_output_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params,
+				       struct snd_soc_dai *dai)
+{
+	return g12a_toacodec_hw_params(substream, params, dai, false);
+}
+
 static const struct snd_soc_dai_ops g12a_toacodec_input_ops = {
 	.probe		= meson_codec_glue_input_dai_probe,
 	.remove		= meson_codec_glue_input_dai_remove,
@@ -152,6 +202,17 @@ static const struct snd_soc_dai_ops g12a_toacodec_output_ops = {
 	.startup	= meson_codec_glue_output_startup,
 };
 
+static const struct snd_soc_dai_ops g12a_toacodec_capture_output_ops = {
+	.probe		= meson_codec_glue_capture_output_dai_probe,
+	.remove		= meson_codec_glue_capture_output_dai_remove,
+	.hw_params	= g12a_toacodec_capture_output_hw_params,
+	.set_fmt	= meson_codec_glue_capture_output_set_fmt,
+};
+
+static const struct snd_soc_dai_ops g12a_toacodec_capture_input_ops = {
+	.startup	= meson_codec_glue_capture_input_startup,
+};
+
 #define TOACODEC_STREAM(xname, xsuffix, xchmax)			\
 {								\
 	.stream_name	= xname " " xsuffix,			\
@@ -176,6 +237,20 @@ static const struct snd_soc_dai_ops g12a_toacodec_output_ops = {
 	.ops = &g12a_toacodec_output_ops,				\
 }
 
+#define TOACODEC_CAPTURE_INPUT(xname, xid) {				\
+	.name = xname,							\
+	.id = (xid),							\
+	.playback = TOACODEC_STREAM(xname, "Playback", 2),		\
+	.ops = &g12a_toacodec_capture_input_ops,			\
+}
+
+#define TOACODEC_CAPTURE_OUTPUT(xname, xid) {				\
+	.name = xname,							\
+	.id = (xid),							\
+	.capture = TOACODEC_STREAM(xname, "Capture", 2),		\
+	.ops = &g12a_toacodec_capture_output_ops,			\
+}
+
 static struct snd_soc_dai_driver g12a_toacodec_dai_drv[] = {
 	TOACODEC_INPUT("IN A", TOACODEC_IN_A),
 	TOACODEC_INPUT("IN B", TOACODEC_IN_B),
@@ -183,6 +258,16 @@ static struct snd_soc_dai_driver g12a_toacodec_dai_drv[] = {
 	TOACODEC_OUTPUT("OUT", TOACODEC_OUT),
 };
 
+static struct snd_soc_dai_driver a1_toacodec_dai_drv[] = {
+	TOACODEC_INPUT("IN A", TOACODEC_IN_A),
+	TOACODEC_INPUT("IN B", TOACODEC_IN_B),
+	TOACODEC_OUTPUT("OUT", TOACODEC_OUT),
+
+	TOACODEC_CAPTURE_OUTPUT("OUT A", TOACODEC_CAPTURE_OUT_A),
+	TOACODEC_CAPTURE_OUTPUT("OUT B", TOACODEC_CAPTURE_OUT_B),
+	TOACODEC_CAPTURE_INPUT("IN", TOACODEC_CAPTURE_IN),
+};
+
 static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
@@ -195,6 +280,31 @@ static int sm1_toacodec_component_probe(struct snd_soc_component *c)
 	return snd_soc_component_write(c, TOACODEC_CTRL0, BIT(9));
 }
 
+static int a1_toacodec_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOACODEC_CTRL0, BIT(9));
+}
+
+static int a1_toacodec_of_xlate_dai_name(struct snd_soc_component *component,
+					 const struct of_phandle_args *args,
+					 const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	for_each_component_dais(component, dai) {
+		if (dai->id == args->args[0]) {
+			*dai_name = dai->driver->name;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "SRC", "I2S A", "IN A Playback" },
 	{ "SRC", "I2S B", "IN B Playback" },
@@ -203,6 +313,19 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "OUT Capture", NULL, "OUT EN" },
 };
 
+static const struct snd_soc_dapm_route a1_toacodec_routes[] = {
+	{ "Playback SRC", "I2S A", "IN A Playback" },
+	{ "Playback SRC", "I2S B", "IN B Playback" },
+	{ "EN", "Switch", "Playback SRC" },
+	{ "OUT Capture", NULL, "Playback SRC" },
+
+	{ "EN", "Switch", "IN Playback" },
+	{ "Capture SRC A", "I2S A", "EN" },
+	{ "Capture SRC B", "I2S B", "EN" },
+	{ "OUT A Capture", NULL, "Capture SRC A" },
+	{ "OUT B Capture", NULL, "Capture SRC B" },
+};
+
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, 12, 3, 0),
 };
@@ -211,6 +334,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, 16, 3, 0),
 };
 
+static const struct snd_kcontrol_new a1_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, 16, 3, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -233,14 +360,43 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver a1_toacodec_component_drv = {
+	.probe			= a1_toacodec_component_probe,
+	.of_xlate_dai_name	= a1_toacodec_of_xlate_dai_name,
+	.controls		= a1_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(a1_toacodec_controls),
+	.dapm_widgets		= a1_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(a1_toacodec_widgets),
+	.dapm_routes		= a1_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(a1_toacodec_routes),
+	.endianness		= 1,
+};
+
+static const struct reg_default g12a_toacodec_reg_default[] = {
+	{ TOACODEC_CTRL0, 0x0 },
+};
+
+static bool g12_toacodec_readable_reg(struct device *dev, unsigned int reg)
+{
+	/* There are no readable registers */
+	return false;
+}
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.max_register		= TOACODEC_CTRL0,
+	.max_register_is_0	= true,
+	.cache_type		= REGCACHE_FLAT,
+	.reg_defaults		= g12a_toacodec_reg_default,
+	.num_reg_defaults	= ARRAY_SIZE(g12a_toacodec_reg_default),
+	.readable_reg		= g12_toacodec_readable_reg,
 };
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
 	.component_drv	= &g12a_toacodec_component_drv,
+	.dai_drv	= g12a_toacodec_dai_drv,
+	.num_dai_drv	= ARRAY_SIZE(g12a_toacodec_dai_drv),
 	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
 	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
@@ -248,11 +404,22 @@ static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
 
 static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.component_drv	= &sm1_toacodec_component_drv,
+	.dai_drv	= g12a_toacodec_dai_drv,
+	.num_dai_drv	= ARRAY_SIZE(g12a_toacodec_dai_drv),
 	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
 	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
 };
 
+static const struct g12a_toacodec_match_data a1_toacodec_match_data = {
+	.component_drv	= &a1_toacodec_component_drv,
+	.dai_drv	= a1_toacodec_dai_drv,
+	.num_dai_drv	= ARRAY_SIZE(a1_toacodec_dai_drv),
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 19),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
@@ -262,6 +429,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
 		.compatible = "amlogic,sm1-toacodec",
 		.data = &sm1_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,a1-toacodec",
+		.data = &a1_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
@@ -314,9 +485,9 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->field_bclk_sel))
 		return PTR_ERR(priv->field_bclk_sel);
 
-	return devm_snd_soc_register_component(dev,
-			data->component_drv, g12a_toacodec_dai_drv,
-			ARRAY_SIZE(g12a_toacodec_dai_drv));
+	return devm_snd_soc_register_component(dev, data->component_drv,
+					       data->dai_drv,
+					       data->num_dai_drv);
 }
 
 static struct platform_driver g12a_toacodec_pdrv = {
-- 
2.34.1


