Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D635BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEU4xz69QdJMpcTrXP9zPbEym/xCe6WuZGRi7t7DB8o=; b=Y3D1zUQmVTAU5C/c6PGn6FeaQh
	Gic0wBg0fdNYa73ZlDPWNMwjSpbZVDas/ftzFyMUO8j1/iImawpc0KD+B9PpMCs7gfsiwmdljoA2+
	GzOUf+GaYEP1aTZQTWfDbpDpWTkjL0yi6aPcMJD5TdD7SmBPtGySTxw0qDa4ebl3YiZCMHzXLpvOC
	cclJMDaDStJplfXPr6m9M5blFerLDQLrJE8LVEdr0zlh4hlYwJoWntCYgbowwdOxdLH2WPoTdToDi
	Crro7TH0YTHrCNo84DUwrNG6UQYVFmHsKIohZ+Zc720dMNjR3vcj91aRIhDiMwLgz2RbCVld3Ul2W
	SkW1cl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvR3-00000009EK2-1vHy;
	Wed, 05 Mar 2025 20:33:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyn-000000090QJ-2iXl;
	Wed, 05 Mar 2025 19:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201228;
	bh=hn1gBR+tSRv7Ed94tUAvjpBP/2EKao1MU4M0g6tP780=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pJD6NFbYMimfnF69UsoPodzG+iZkNJaIxcDzxkk6Mzcn+dJ/6a8yaHZUua7ZPW6o4
	 w/XZqBRZ84hj27LKJl/M93jYsfeFliwdpgMQnkUTz4/SrfLUMx8Jp9nnShcgTzidme
	 inxTy4HVcKYpaLFH2LaKfyfzt0YkwfzSO/N0Anyv/4CCx7PU81Hv6iO4dCmvxaU6Vu
	 k051pAPi4SfjU3444olTNBH5wFr3Py4CE4A6gTVV5KnFaE5lrZs7WqO2pdi8eeGxJy
	 48Tw8pzU/DLaWv47qG/ocnz9oEwJ/pKjQhEq5Ea8Jj/P2D8tXglu4uhphshcVnGZcd
	 EiHrWHvWq3qgw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3119F17E0D13;
	Wed,  5 Mar 2025 20:00:22 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:27 -0300
Subject: [PATCH v4 12/19] ASoC: mediatek: mt6359-accdet: Make PWM debounce
 settings internal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-12-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110029_827692_92ED42B3 
X-CRM114-Status: GOOD (  18.59  )
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

Instead of reading a bunch of PWM debounce settings from the Devicetree,
set reasonable values inside the driver that are known to work across
multiple boards. There are no current users of these DT properties, so
no backward compatibility needs to be maintained. The properties can be
properly introduced in the binding in the future if different boards
really need to override them.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 70 ++++++++++++++++++++++------------------
 sound/soc/codecs/mt6359-accdet.h | 20 ------------
 2 files changed, 38 insertions(+), 52 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index e04cfb9a607aa5d38d46329eb1387545fda37ccc..6728f1018c992fc9d4e4133dbaf091d256567683 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -43,6 +43,25 @@
 #define ACCDET_DIGITAL_FASTDISCHARGE	BIT(13)
 #define ACCDET_AD_FASTDISCHRAGE		BIT(14)
 
+/* Debounce time = (DEBOUNCE/32768) sec */
+#define ACCDET_DEBOUNCE0_625MS 0x800
+#define ACCDET_DEBOUNCE1_625MS 0x800
+#define ACCDET_DEBOUNCE3_976US 0x20
+#define ACCDET_DEBOUNCE_AUXADC_2MS 0x44
+/* PWM frequency = 32768/(PWM_WIDTH + 1) Hz */
+#define ACCDET_PWM_WIDTH_25_580HZ 0x500
+/* Duty cycle = (PWM_THRESH + 1) / (PWM_WIDTH + 1) */
+#define ACCDET_PWM_THRESH_100PERCENT ACCDET_PWM_WIDTH_25_580HZ
+#define ACCDET_RISE_DELAY 0x1f0
+#define ACCDET_FALL_DELAY 1
+#define ACCDET_EINT_DEBOUNCE0_1MS 5
+#define ACCDET_EINT_DEBOUNCE1_900US 3
+#define ACCDET_EINT_DEBOUNCE2_900US 3
+#define ACCDET_EINT_DEBOUNCE3_1MS 5
+#define ACCDET_EINT_INVERTER_DEBOUNCE_256MS 0xe
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_400MS 4
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_2MS 1
+
 static struct platform_driver mt6359_accdet_driver;
 static const struct snd_soc_component_driver mt6359_accdet_soc_driver;
 
@@ -130,7 +149,7 @@ static unsigned int mt6359_accdet_jd_setting(struct mt6359_accdet *priv)
 	} else if (priv->jd_sts == M_PLUG_OUT) {
 		/* set debounce to 1ms */
 		accdet_set_debounce(priv, eint_state000,
-				    priv->data->pwm_deb->eint_debounce0);
+				    ACCDET_EINT_DEBOUNCE0_1MS);
 	} else {
 		dev_dbg(priv->dev, "should not be here %s()\n", __func__);
 	}
@@ -241,11 +260,11 @@ static void mt6359_accdet_recover_jd_setting(struct mt6359_accdet *priv)
 
 	/* recover accdet debounce0,3 */
 	accdet_set_debounce(priv, accdet_state000,
-			    priv->data->pwm_deb->debounce0);
+			    ACCDET_DEBOUNCE0_625MS);
 	accdet_set_debounce(priv, accdet_state001,
-			    priv->data->pwm_deb->debounce1);
+			    ACCDET_DEBOUNCE1_625MS);
 	accdet_set_debounce(priv, accdet_state011,
-			    priv->data->pwm_deb->debounce3);
+			    ACCDET_DEBOUNCE3_976US);
 
 	priv->jack_type = 0;
 	priv->accdet_status = 0x3;
@@ -390,7 +409,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 		priv->jack_plugged = false;
 
 		accdet_set_debounce(priv, accdet_state011,
-				    priv->data->pwm_deb->debounce3);
+				    ACCDET_DEBOUNCE3_976US);
 		regmap_update_bits(priv->regmap, ACCDET_SW_EN_ADDR,
 				   ACCDET_SW_EN_MASK_SFT, 0);
 		mt6359_accdet_recover_jd_setting(priv);
@@ -497,7 +516,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	int ret;
 	struct device *dev = priv->dev;
 	struct device_node *node = NULL;
-	int pwm_deb[15] = {0};
 	unsigned int tmp = 0;
 
 	node = of_get_child_by_name(dev->parent->of_node, "accdet");
@@ -514,12 +532,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->mic_mode = 2;
 
-	ret = of_property_read_u32_array(node, "mediatek,pwm-deb-setting",
-					 pwm_deb, ARRAY_SIZE(pwm_deb));
-	/* debounce8(auxadc debounce) is default, needn't get from dts */
-	if (!ret)
-		memcpy(priv->data->pwm_deb, pwm_deb, sizeof(pwm_deb));
-
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
 	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
@@ -554,8 +566,8 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 {
 	/* enable eint cmpmem pwm */
 	regmap_write(priv->regmap, ACCDET_EINT_CMPMEN_PWM_THRESH_ADDR,
-		     (priv->data->pwm_deb->eint_pwm_width << 4 |
-		     priv->data->pwm_deb->eint_pwm_thresh));
+		     (ACCDET_EINT_CMPMEN_PWM_WIDTH_400MS << 4 |
+		      ACCDET_EINT_CMPMEN_PWM_THRESH_2MS));
 	/* DA signal stable */
 	if (priv->caps & ACCDET_PMIC_EINT0) {
 		regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
@@ -675,22 +687,22 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 	mdelay(1);
 	/* init the debounce time (debounce/32768)sec */
 	accdet_set_debounce(priv, accdet_state000,
-			    priv->data->pwm_deb->debounce0);
+			    ACCDET_DEBOUNCE0_625MS);
 	accdet_set_debounce(priv, accdet_state001,
-			    priv->data->pwm_deb->debounce1);
+			    ACCDET_DEBOUNCE1_625MS);
 	accdet_set_debounce(priv, accdet_state011,
-			    priv->data->pwm_deb->debounce3);
+			    ACCDET_DEBOUNCE3_976US);
 	accdet_set_debounce(priv, accdet_auxadc,
-			    priv->data->pwm_deb->debounce4);
+			    ACCDET_DEBOUNCE_AUXADC_2MS);
 
 	accdet_set_debounce(priv, eint_state000,
-			    priv->data->pwm_deb->eint_debounce0);
+			    ACCDET_EINT_DEBOUNCE0_1MS);
 	accdet_set_debounce(priv, eint_state001,
-			    priv->data->pwm_deb->eint_debounce1);
+			    ACCDET_EINT_DEBOUNCE1_900US);
 	accdet_set_debounce(priv, eint_state011,
-			    priv->data->pwm_deb->eint_debounce3);
+			    ACCDET_EINT_DEBOUNCE3_1MS);
 	accdet_set_debounce(priv, eint_inverter_state000,
-			    priv->data->pwm_deb->eint_inverter_debounce);
+			    ACCDET_EINT_INVERTER_DEBOUNCE_256MS);
 
 	regmap_update_bits(priv->regmap, RG_ACCDET_RST_ADDR,
 			   RG_ACCDET_RST_MASK_SFT, BIT(RG_ACCDET_RST_SFT));
@@ -705,12 +717,12 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 
 	/* init pwm frequency, duty & rise/falling delay */
 	regmap_write(priv->regmap, ACCDET_PWM_WIDTH_ADDR,
-		     REGISTER_VAL(priv->data->pwm_deb->pwm_width));
+		     REGISTER_VAL(ACCDET_PWM_WIDTH_25_580HZ));
 	regmap_write(priv->regmap, ACCDET_PWM_THRESH_ADDR,
-		     REGISTER_VAL(priv->data->pwm_deb->pwm_thresh));
+		     REGISTER_VAL(ACCDET_PWM_THRESH_100PERCENT));
 	regmap_write(priv->regmap, ACCDET_RISE_DELAY_ADDR,
-		     (priv->data->pwm_deb->fall_delay << 15 |
-		      priv->data->pwm_deb->rise_delay));
+		     (ACCDET_FALL_DELAY << 15 |
+		      ACCDET_RISE_DELAY));
 
 	regmap_read(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR, &reg);
 	if (priv->data->mic_vol <= 7) {
@@ -806,12 +818,6 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	if (!priv->data)
 		return -ENOMEM;
 
-	priv->data->pwm_deb = devm_kzalloc(&pdev->dev,
-					   sizeof(struct pwm_deb_settings),
-					   GFP_KERNEL);
-	if (!priv->data->pwm_deb)
-		return -ENOMEM;
-
 	priv->regmap = mt6397->regmap;
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 99de5037a2294b62cb8535fc45dbf4c6fafb5c7f..287201eebe0330fa170093fd6192bf5694c30469 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -50,30 +50,10 @@ enum {
 	eint_inverter_state000,
 };
 
-struct pwm_deb_settings {
-	unsigned int pwm_width;
-	unsigned int pwm_thresh;
-	unsigned int fall_delay;
-	unsigned int rise_delay;
-	unsigned int debounce0;
-	unsigned int debounce1;
-	unsigned int debounce3;
-	unsigned int debounce4;
-	unsigned int eint_pwm_width;
-	unsigned int eint_pwm_thresh;
-	unsigned int eint_debounce0;
-	unsigned int eint_debounce1;
-	unsigned int eint_debounce2;
-	unsigned int eint_debounce3;
-	unsigned int eint_inverter_debounce;
-
-};
-
 struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
 	bool hp_eint_high;
-	struct pwm_deb_settings *pwm_deb;
 	unsigned int eint_detect_mode;
 	unsigned int eint_comp_vth;
 };

-- 
2.48.1


