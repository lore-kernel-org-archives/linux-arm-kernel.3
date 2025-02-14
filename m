Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00979C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2iEi+8a/iY4+2lGVgKbqQZsZM5CzyZb/pE5l1vouSE=; b=IpwZ4kg/6/hh0zqOOOslmShSgz
	QJ6bXkEc7/64nu1vrsNLbV8BFv4sxVovZmbWsSuX2aZ/D0aNIZSW/z0CoM7MSTKlyq690GYa3atJu
	tKPtwH/tgpJcEOemnBfi4acMYa6YnzsZ1mdtpc/w46LNcv2WwdeYl8yxYe6jBRgTIrAAIJYzUIQB5
	DffYfSYYNo9pTLeLSESKwpVd3LSXsjsC5BURFwpkYIdGAbWAFTz0he6EIHnLH/mZ3CrOp1HoJVOch
	QbRv2IhH73StuYljH5hB8zjrP96xfYnnP28ukJY8HU67r+ZC9sZEEO0apG6skcLKYdfSGsv3V/pga
	k55GLugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilo1-0000000DPPB-04BM;
	Fri, 14 Feb 2025 02:51:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilD7-0000000DJXU-1QHV;
	Fri, 14 Feb 2025 02:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1263A5C5DC1;
	Fri, 14 Feb 2025 02:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AED8C4AF0B;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739499223;
	bh=lFWOMxS7WLv3mddppRnxt9dhcWIiaoUlHF8zFNDmJew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F3I+GeYXhHWkQH3kenKOBajPm5tCLZFiYJRgPfSrlY2Vy+JCTLadkZEuLUpX61P3J
	 bWJ8P6INJ1G8dpY9iJxUQqOppag8/HxZuQB7jfhynruuQSTu6p/XUmAyUmi055/jx+
	 CjfW3aNgD7DwRSb+o/Dm1tBvmUk90pPfNIAGUkdFJjmVSzCC5ZWmzxPzD3Dmlz65i3
	 EGjqHO4sH7aW9jfxm/65Eulc2ijT/kBGig57FySnur5nd7iWYUVEMjW5Nr3XS18kXu
	 p8PTWp/Sy34gjBk6tyx2rJhl2bVccd1i4CJRysgIdLYUZYpImRDXlRcGkZ6dMG6fvA
	 UoUN17H+gu7sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702BCC021A0;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 14 Feb 2025 10:13:43 +0800
Subject: [PATCH v2 4/5] ASoC: meson: s4:support audio tocodec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-audio_drvier-v2-4-37881fa37c9e@amlogic.com>
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
In-Reply-To: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739499221; l=5401;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=eXUWUTgRNxtkfjozKFzbYK8X23ie1+epvgjJGcGYKY0=;
 b=T7orzE/wHPHsEe6lx6Phy4L5n2VGQbsFswmFBS8Y4mXxekRHwsIucCneZWirrTq2ltR6F0fs4
 VbgECJZCQMyCnu74YQU/HOcDf1NWuysH2U6SUxWcHgE0whvagWozQRJ
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_181345_497182_37436680 
X-CRM114-Status: GOOD (  15.33  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

Add the audio tocodec for s4, add the 8 lane support,
add the mclk and sclk enable event when start data enable auto switch

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 sound/soc/meson/axg-card.c      |  3 +-
 sound/soc/meson/g12a-toacodec.c | 64 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a2dfccb7990f3a53f508fc6724b21de53b4494d8..5cef069c3370257d4aaf24d7270482651babcfe1 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
 	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
-		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
+		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec") ||
+		of_device_is_compatible(np, DT_PREFIX "s4-toacodec");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 531bb8707a3ec4c47814d6a0676d5c62c705da75..a93a91136e8ea00e856c3981b9c1e7e08d927a3b 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -41,6 +41,9 @@
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
 
+#define CTRL0_BCLK_ENABLE_SHIFT		30
+#define CTRL0_MCLK_ENABLE_SHIFT		29
+
 #define TOACODEC_OUT_CHMAX		2
 
 struct g12a_toacodec {
@@ -107,6 +110,33 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *control,
+			      int event)
+{
+	int ret = 0;
+	unsigned int mask = 0, val = 0;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
+		val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
+		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
+		val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_ENABLE_SHIFT;
+		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
+		break;
+	default:
+		dev_err(component->dev, "Unexpected event %d\n", event);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
 			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
@@ -143,6 +173,14 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &sm1_toacodec_mux),
+	SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
+			      &g12a_toacodec_out_enable, tocodec_clk_enable,
+			      (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -236,6 +274,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
 };
 
+static const struct snd_kcontrol_new s4_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -258,6 +300,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver s4_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= s4_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
+	.dapm_widgets		= s4_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
+	.dapm_routes		= g12a_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
+	.endianness		= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -278,6 +331,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
 };
 
+static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
+	.component_drv	= &s4_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
@@ -287,6 +347,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
 		.compatible = "amlogic,sm1-toacodec",
 		.data = &sm1_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,s4-toacodec",
+		.data = &s4_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
2.43.0



