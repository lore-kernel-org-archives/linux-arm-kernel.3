Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFD760A6F70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FHNlX0pN;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=NVqw7Lp7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aFcLdqnEIhkV5k1glsDX1/kR5E9pECkLZvvjtAi3TNA=; b=FHNlX0pN4whAR6
	qiEfIRE+t/eCwcDMWCC9vyL9DJieAK2FfnawUdE0MBpR4pkNPseDaWoIv1JazSQAaGQwKcVHKqpk2
	yWqvNNH+y30AHHNfm93F5ZTpIKomdJnl/0qEqnAhNY6kLUHHZhecDSOuafvBWIO0zdY5W8q64opz0
	BuKQI/1c7xcz+hp8Mf/6ewrt1/m1QS4KZ3yN3l4M45X9AclMcp5wygU3IB0psVbOBIXIaIZrldhLN
	g1tRz5nudmO++lZztYUSKLqnZUp2xEp4buxLOqj9I68UtuW7H6HLPYN/Sv7DvK1jkG3jGkttVP0tA
	2TuUgHQWLpSrqI+vppTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pe-00000001MuZ-0fdH;
	Sun, 25 Oct 2026 19:24:38 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pY-00000001Mkt-2Azs;
	Sun, 25 Oct 2026 19:24:33 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ig518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:21 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ig518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956262;
	bh=aFcLdqnEIhkV5k1glsDX1/kR5E9pECkLZvvjtAi3TNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVqw7Lp71L2MjRoTl1gj/Iuy1AO7VsQsPgBm8r8VAmTRXmsNKojncPZmPHgvqMYBP
	 ySk0FC3WHrA4NeRksLjAmcFXFwDP6l/dzh2UyUc4zTX0kydGb/o+yXlqDdNtdZbVWs
	 b4TrGkaSppJmKyNGVzKl+FRMa8RV0Z2peXvXv2MM=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 7/7] ASoC: meson: g12a-tohdmitx: add S4 support
Date: Sun, 25 Oct 2026 20:24:04 +0100
Message-ID: <20261025192404.209695-8-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122432_895794_974FF4C3 
X-CRM114-Status: GOOD (  13.69  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

S4 replaces the single ENABLE bit of the G12A HDMI TX glue with
separate data and clock enables for each of the I2S and SPDIF paths.
Model the clock enables as supply widgets and give S4 its own component
driver, selected through match data.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
[ckoever@outlook.de: rebased, use the SPDIF data bit for the SPDIF
 output enable, style fixes]
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 sound/soc/meson/g12a-tohdmitx.c | 80 ++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 967109ca2b57..eafade3d7474 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -31,6 +31,15 @@
 #define  CTRL0_SPDIF_SEL		(0x1 << CTRL0_SPDIF_SEL_SHIFT)
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
+#define  CTRL0_I2S_DATA_SHIFT		29
+#define  CTRL0_I2S_CLK_SHIFT		28
+#define  CTRL0_SPDIF_DATA_SHIFT		31
+#define  CTRL0_SPDIF_CLK_SHIFT		30
+
+struct g12a_tohdmitx_match_data {
+	const struct snd_soc_component_driver *component_drv;
+};
+
 static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
@@ -130,6 +139,13 @@ static const struct snd_kcontrol_new g12a_tohdmitx_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
 
+static const struct snd_kcontrol_new s4_i2s_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
+				    CTRL0_I2S_DATA_SHIFT, 1, 0);
+static const struct snd_kcontrol_new s4_spdif_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
+				    CTRL0_SPDIF_DATA_SHIFT, 1, 0);
+
 static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 	SND_SOC_DAPM_MUX("I2S SRC", SND_SOC_NOPM, 0, 0,
 			 &g12a_tohdmitx_i2s_mux),
@@ -141,6 +157,21 @@ static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 			    &g12a_tohdmitx_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_tohdmitx_widgets[] = {
+	SND_SOC_DAPM_MUX("I2S SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_i2s_mux),
+	SND_SOC_DAPM_SWITCH("I2S OUT EN", SND_SOC_NOPM, 0, 0,
+			    &s4_i2s_out_enable),
+	SND_SOC_DAPM_MUX("SPDIF SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_spdif_mux),
+	SND_SOC_DAPM_SWITCH("SPDIF OUT EN", SND_SOC_NOPM, 0, 0,
+			    &s4_spdif_out_enable),
+	SND_SOC_DAPM_SUPPLY("I2S CLK Gate", TOHDMITX_CTRL0,
+			    CTRL0_I2S_CLK_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SPDIF CLK Gate", TOHDMITX_CTRL0,
+			    CTRL0_SPDIF_CLK_SHIFT, 0, NULL, 0),
+};
+
 static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
 	.probe		= meson_codec_glue_input_dai_probe,
 	.remove		= meson_codec_glue_input_dai_remove,
@@ -221,6 +252,20 @@ static const struct snd_soc_dapm_route g12a_tohdmitx_routes[] = {
 	{ "SPDIF OUT Capture", NULL, "SPDIF OUT EN" },
 };
 
+static const struct snd_soc_dapm_route s4_tohdmitx_routes[] = {
+	{ "I2S SRC", "I2S A", "I2S IN A Playback" },
+	{ "I2S SRC", "I2S B", "I2S IN B Playback" },
+	{ "I2S SRC", "I2S C", "I2S IN C Playback" },
+	{ "I2S OUT EN", "Switch", "I2S SRC" },
+	{ "I2S OUT EN", NULL, "I2S CLK Gate" },
+	{ "I2S OUT Capture", NULL, "I2S OUT EN" },
+	{ "SPDIF SRC", "SPDIF A", "SPDIF IN A Playback" },
+	{ "SPDIF SRC", "SPDIF B", "SPDIF IN B Playback" },
+	{ "SPDIF OUT EN", "Switch", "SPDIF SRC" },
+	{ "SPDIF OUT EN", NULL, "SPDIF CLK Gate" },
+	{ "SPDIF OUT Capture", NULL, "SPDIF OUT EN" },
+};
+
 static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.probe			= g12a_tohdmi_component_probe,
 	.dapm_widgets		= g12a_tohdmitx_widgets,
@@ -230,25 +275,56 @@ static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver s4_tohdmitx_component_drv = {
+	.probe			= g12a_tohdmi_component_probe,
+	.dapm_widgets		= s4_tohdmitx_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(s4_tohdmitx_widgets),
+	.dapm_routes		= s4_tohdmitx_routes,
+	.num_dapm_routes	= ARRAY_SIZE(s4_tohdmitx_routes),
+	.endianness		= 1,
+};
+
 static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 };
 
+static const struct g12a_tohdmitx_match_data g12a_hdmitx_match_data = {
+	.component_drv	= &g12a_tohdmitx_component_drv,
+};
+
+static const struct g12a_tohdmitx_match_data s4_hdmitx_match_data = {
+	.component_drv	= &s4_tohdmitx_component_drv,
+};
+
 static const struct of_device_id g12a_tohdmitx_of_match[] = {
-	{ .compatible = "amlogic,g12a-tohdmitx", },
+	{
+		.compatible = "amlogic,g12a-tohdmitx",
+		.data = &g12a_hdmitx_match_data,
+	},
+	{
+		.compatible = "amlogic,s4-tohdmitx",
+		.data = &s4_hdmitx_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_tohdmitx_of_match);
 
 static int g12a_tohdmitx_probe(struct platform_device *pdev)
 {
+	const struct g12a_tohdmitx_match_data *data;
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
 	ret = device_reset(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset device\n");
@@ -265,7 +341,7 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	}
 
 	return devm_snd_soc_register_component(dev,
-			&g12a_tohdmitx_component_drv, g12a_tohdmitx_dai_drv,
+			data->component_drv, g12a_tohdmitx_dai_drv,
 			ARRAY_SIZE(g12a_tohdmitx_dai_drv));
 }
 
-- 
2.56.0


