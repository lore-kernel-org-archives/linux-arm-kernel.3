Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313D4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGMudrUCMS2gxSmJHi8C7oS5YKQtVFZGM0QA7wuLy6A=; b=OtIfgS3uaHaCSJ//x2sqlmwgk2
	vEcmniPkWL9YC9oX1gdV8/4Mk/s/gJ6kMjqjPuBjgF4tFkm7Fh1GTngMSTJf+3czyvRDNwHPxK03t
	mBezMJg2HumH8xE/9AjD+D4pX5MUezRzVyTLbcbKsIMGlA098nzjGaOEhU0++F9waDmN4XGMOAiCz
	YhN/IyyodD0croKpDYb48zKMY+gE5OdrpLiNckkAmtsZt9aWU4fIDSxoOIZPHfYlHeAlcFOh+4pfD
	QkmTDUKAlfEbMD+h6E0ZzMQurfT6mLTRY0vN6JTW/9K4t9LaWEk8Y7b34vUg+/Ck3Pzj6sUQ8Y+KK
	im3XYNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuDX-000000092lQ-3kkA;
	Wed, 05 Mar 2025 19:15:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyR-000000090Jg-0vuy;
	Wed, 05 Mar 2025 19:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201205;
	bh=IdQRXefJHAutmxRMMaOnaOXyfBJYqlOoGdfVopRotEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kqcx5xgOXgioSF8LMYYs15i0oSPUR8vn88I04kemDVYvx0tEdEvMCoMPvc4E0tlmA
	 o2neAwtuSm1/D7XHkgtRaJcYyRsJfT3CPRKc/hd6aq97zkE7YTH1pfumcRkQ/PNIZk
	 gDcDQXAtPq+wTHDlQLsJrIx6hkT8ePLADmBIy5Xhr4VgwvH8HnIaF/oZZskCslRHc4
	 GK4RH2N3vBHToGQe+GiNgyyf5GY2ZZSbAyQglwp6rvaL/hh9ZZ57FMqOPV6Y3i2ua+
	 Z2KDoRcfXp4uMafcwy/R8T82Ae4j0WG/kThUWbWH9uk6rekZbM24M94Xy4XH3ODGe3
	 OzEPEZ4fHa16Q==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D67F17E0147;
	Wed,  5 Mar 2025 20:00:00 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:23 -0300
Subject: [PATCH v4 08/19] ASoC: mediatek: mt6359-accdet: Drop dead code for
 button detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-8-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110007_399236_22A2119B 
X-CRM114-Status: GOOD (  17.12  )
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

The button detection functionality depends on a calibration voltage
value which is currently not updated anywhere in the driver code, and
hence it doesn't actually do anything. Remove this unused code.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 92 ++--------------------------------------
 sound/soc/codecs/mt6359-accdet.h | 17 --------
 2 files changed, 3 insertions(+), 106 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index a21c6544174517e3eebc8cf25d1ea3029ba014f6..6b0178976d91e37c32540991693ebfd8e29c11f5 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -37,9 +37,6 @@
 
 #define ACCDET_PMIC_RSV_EINT		BIT(7)
 
-#define ACCDET_THREE_KEY		BIT(8)
-#define ACCDET_FOUR_KEY			BIT(9)
-#define ACCDET_TRI_KEY_CDD		BIT(10)
 #define ACCDET_RSV_KEY			BIT(11)
 
 #define ACCDET_ANALOG_FASTDISCHARGE	BIT(12)
@@ -255,7 +252,6 @@ static void mt6359_accdet_recover_jd_setting(struct mt6359_accdet *priv)
 			    priv->data->pwm_deb->debounce3);
 
 	priv->jack_type = 0;
-	priv->btn_type = 0;
 	priv->accdet_status = 0x3;
 	mt6359_accdet_jack_report(priv);
 }
@@ -318,45 +314,10 @@ static void mt6359_accdet_jack_report(struct mt6359_accdet *priv)
 	if (!priv->jack)
 		return;
 
-	report = priv->jack_type | priv->btn_type;
+	report = priv->jack_type;
 	snd_soc_jack_report(priv->jack, report, MT6359_ACCDET_JACK_MASK);
 }
 
-static unsigned int check_button(struct mt6359_accdet *priv, unsigned int v)
-{
-	if (priv->caps & ACCDET_FOUR_KEY) {
-		if (v < priv->data->four_key.down &&
-		    v >= priv->data->four_key.up)
-			priv->btn_type = SND_JACK_BTN_1;
-		if (v < priv->data->four_key.up &&
-		    v >= priv->data->four_key.voice)
-			priv->btn_type = SND_JACK_BTN_2;
-		if (v < priv->data->four_key.voice &&
-		    v >= priv->data->four_key.mid)
-			priv->btn_type = SND_JACK_BTN_3;
-		if (v < priv->data->four_key.mid)
-			priv->btn_type = SND_JACK_BTN_0;
-	} else {
-		if (v < priv->data->three_key.down &&
-		    v >= priv->data->three_key.up)
-			priv->btn_type = SND_JACK_BTN_1;
-		if (v < priv->data->three_key.up &&
-		    v >= priv->data->three_key.mid)
-			priv->btn_type = SND_JACK_BTN_2;
-		if (v < priv->data->three_key.mid)
-			priv->btn_type = SND_JACK_BTN_0;
-	}
-	return 0;
-}
-
-static void is_key_pressed(struct mt6359_accdet *priv, bool pressed)
-{
-	priv->btn_type = priv->jack_type & ~MT6359_ACCDET_BTN_MASK;
-
-	if (pressed)
-		check_button(priv, priv->cali_voltage);
-}
-
 static inline void check_jack_btn_type(struct mt6359_accdet *priv)
 {
 	unsigned int val = 0;
@@ -368,15 +329,11 @@ static inline void check_jack_btn_type(struct mt6359_accdet *priv)
 
 	switch (priv->accdet_status) {
 	case 0:
-		if (priv->jack_type == SND_JACK_HEADSET)
-			is_key_pressed(priv, true);
-		else
+		if (priv->jack_type != SND_JACK_HEADSET)
 			priv->jack_type = SND_JACK_HEADPHONE;
 		break;
 	case 1:
-		if (priv->jack_type == SND_JACK_HEADSET) {
-			is_key_pressed(priv, false);
-		} else {
+		if (priv->jack_type != SND_JACK_HEADSET) {
 			priv->jack_type = SND_JACK_HEADSET;
 			accdet_set_debounce(priv, eint_state011, 0x1);
 		}
@@ -603,48 +560,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->eint_comp_vth = 0x0;
 
-	ret = of_property_read_u32(node, "mediatek,key-mode", &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0) {
-		int three_key[4];
-
-		priv->caps |= ACCDET_THREE_KEY;
-		ret = of_property_read_u32_array(node,
-						 "mediatek,three-key-thr",
-						 three_key,
-						 ARRAY_SIZE(three_key));
-		if (!ret)
-			memcpy(&priv->data->three_key, three_key + 1,
-			       sizeof(struct three_key_threshold));
-	} else if (tmp == 1) {
-		int four_key[5];
-
-		priv->caps |= ACCDET_FOUR_KEY;
-		ret = of_property_read_u32_array(node,
-						 "mediatek,four-key-thr",
-						 four_key,
-						 ARRAY_SIZE(four_key));
-		if (!ret) {
-			memcpy(&priv->data->four_key, four_key + 1,
-			       sizeof(struct four_key_threshold));
-		} else {
-			dev_warn(priv->dev,
-				 "accdet no 4-key-thrsh dts, use efuse\n");
-		}
-	} else if (tmp == 2) {
-		int three_key[4];
-
-		priv->caps |= ACCDET_TRI_KEY_CDD;
-		ret = of_property_read_u32_array(node,
-						 "mediatek,tri-key-cdd-thr",
-						 three_key,
-						 ARRAY_SIZE(three_key));
-		if (!ret)
-			memcpy(&priv->data->three_key, three_key + 1,
-			       sizeof(struct three_key_threshold));
-	}
-
 	of_node_put(node);
 	dev_warn(priv->dev, "accdet caps=%x\n", priv->caps);
 
@@ -1015,7 +930,6 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 
 	priv->jd_sts = M_PLUG_OUT;
 	priv->jack_type = 0;
-	priv->btn_type = 0;
 	priv->accdet_status = 0x3;
 	mt6359_accdet_init(priv);
 
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index a54a328bdf3797ce642da446c0cc6792f72ec939..09e1072b61a4c929bf6b764b4fab3c4b26f7cf4a 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -50,19 +50,6 @@ enum {
 	eint_inverter_state000,
 };
 
-struct three_key_threshold {
-	unsigned int mid;
-	unsigned int up;
-	unsigned int down;
-};
-
-struct four_key_threshold {
-	unsigned int mid;
-	unsigned int voice;
-	unsigned int up;
-	unsigned int down;
-};
-
 struct pwm_deb_settings {
 	unsigned int pwm_width;
 	unsigned int pwm_thresh;
@@ -88,8 +75,6 @@ struct dts_data {
 	unsigned int plugout_deb;
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
-	struct three_key_threshold three_key;
-	struct four_key_threshold four_key;
 	unsigned int moisture_detect_enable;
 	unsigned int eint_detect_mode;
 	unsigned int eint_use_ext_res;
@@ -112,10 +97,8 @@ struct mt6359_accdet {
 	struct mutex res_lock; /* lock protection */
 	bool jack_plugged;
 	unsigned int jack_type;
-	unsigned int btn_type;
 	unsigned int accdet_status;
 	unsigned int pre_accdet_status;
-	unsigned int cali_voltage;
 	unsigned int jd_sts;
 	struct work_struct accdet_work;
 	struct workqueue_struct *accdet_workqueue;

-- 
2.48.1


