Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2zRY+aiT;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k1ybb7Vc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GGPiwocUUGruVk53aOCSJl4Ce/u14Zhe1s+QmynwCt0=; b=2zRY+aiTU4bI95
	yh8fK1ukK2Gt1sgP0beepjouHp7Vp2Vkl3GF7E05iil1WV7Y4nqaMb8qusnSOcULtRxwsX+bsjw7i
	9FFG9+/dysw+eCxZf/Zi9ovmMlmbv4Ls2eE4BICHE1z3wIMUAVNWFOpRqhlUqEkJGPQvGNd0DWb8Q
	DnY7rmfwVXS13+6MSZ26Rc3NAIcrju8dC7uUj8WT/BvEyPD85OTtdGOs83nzrF6FrJFzADr+RBIj6
	5XqmdyENzSm8EDaYLj0SayAyTavtF+340XAA4QRDzfPsw1P2yGQ17Lfien2u1GcT6LgwM5IV7tuhQ
	DdJlK4C8tmTGdiMCgIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMlo-0000000Dr8Y-0GOp;
	Sun, 01 Nov 2026 04:02:12 +0000
Received: from mail-m12875.netease.com ([103.209.128.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1f-1XjR;
	Sun, 01 Nov 2026 04:02:05 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d8413f;
	Sun, 1 Nov 2026 12:01:51 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 2/6] ASoC: codecs: rk3308: expose per-channel microphone boost
Date: Sun,  1 Nov 2026 12:01:21 +0800
Message-Id: <20261101040125.1864141-3-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1954556e403a8kunm8fccdc7416d2a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGR8YVkgZGktNGh4aS0oaQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=k1ybb7VcrrC/CYard0Hg4cC9JHYsBt7YF0YSeFW75B0WQIlN4Jkmv/5w1VDk/gGVwcO0jzivA0A9oVgs0pzXA9JoV6hjEPtSNvw3UxLBKkGvG9KP5Np9LUyGX5rFxbqSrYXMhVVE8yZQSDxrRpNN6St8i2dlfB2Xh9nvMI/r9WY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GGPiwocUUGruVk53aOCSJl4Ce/u14Zhe1s+QmynwCt0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_644661_76C58C41 
X-CRM114-Status: GOOD (  12.44  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The existing MIC Capture Volume controls adjust the ALC gain stage,
leaving the preceding microphone boost stage inaccessible. Add
independent boost controls for all eight inputs without changing the
existing controls or reset gains.

Use the revision-specific dB scales. Revision A permits only the 0 dB
and 20 dB encodings; reject its reserved intermediate settings while
allowing all four settings on revisions B and C.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 80 ++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 7a18ff45e391..fc7e20e82700 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -66,6 +66,84 @@ static const DECLARE_TLV_DB_RANGE(rk3308_codec_dac_lineout_gain_tlv,
 	3, 3, TLV_DB_SCALE_ITEM(0,    0, 0),
 );
 
+static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_a,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_b,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	1, 1, TLV_DB_SCALE_ITEM(660, 0, 0),
+	2, 2, TLV_DB_SCALE_ITEM(1300, 0, 0),
+	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
+);
+
+static int rk3308_codec_mic_boost_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	long gain = ucontrol->value.integer.value[0];
+
+	if (rk3308->codec_ver == ACODEC_VERSION_A && gain != 0 && gain != 3)
+		return -EINVAL;
+
+	return snd_soc_put_volsw(kcontrol, ucontrol);
+}
+
+static const struct snd_kcontrol_new rk3308_codec_mic_boost_controls[] = {
+	SOC_SINGLE_EXT_TLV("MIC1 Boost Volume", RK3308_ADC_ANA_CON01(0),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC2 Boost Volume", RK3308_ADC_ANA_CON01(0),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC3 Boost Volume", RK3308_ADC_ANA_CON01(1),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC4 Boost Volume", RK3308_ADC_ANA_CON01(1),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC5 Boost Volume", RK3308_ADC_ANA_CON01(2),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC6 Boost Volume", RK3308_ADC_ANA_CON01(2),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC7 Boost Volume", RK3308_ADC_ANA_CON01(3),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC8 Boost Volume", RK3308_ADC_ANA_CON01(3),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+};
+
+static int rk3308_codec_add_mic_boost_controls(struct snd_soc_component *component)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(rk3308_codec_mic_boost_controls); i++) {
+		struct snd_kcontrol_new control = rk3308_codec_mic_boost_controls[i];
+
+		if (rk3308->codec_ver == ACODEC_VERSION_A)
+			control.tlv.p = rk3308_codec_adc_mic_gain_tlv_a;
+		ret = snd_soc_add_component_controls(component, &control, 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const char * const rk3308_codec_hpf_cutoff_text[] = {
 	"20 Hz", "245 Hz", "612 Hz"
 };
@@ -891,7 +969,7 @@ static int rk3308_codec_probe(struct snd_soc_component *component)
 	rk3308_codec_reset(component);
 	rk3308_codec_initialize(rk3308);
 
-	return 0;
+	return rk3308_codec_add_mic_boost_controls(component);
 }
 
 static int rk3308_codec_set_bias_level(struct snd_soc_component *component,

