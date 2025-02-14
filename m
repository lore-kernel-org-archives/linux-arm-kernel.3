Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1BAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5I057EwsM9dm/8zKehPLXZGKKJS10uPtxocqaP3/pI=; b=Iic68aT9fC1NVPbjLHHE/sUNTt
	H4o57HGk4F+uKy2RhWKz0J/7hI/7UDTkKd0kvyOF3OvBwXL7Ay9LuNSSThSkeaE0JBv7Z6d67h/Qt
	nGCZwV4QWF5Mfav/jlnBcuVvmyp2cqmT/+Msn9zftmdCzB/xG0VHa8vBNNAkG9TiZYtn+Uo1jWTG5
	gBgbgivMe6BZsyiEPEC9uheDZq1R9PajeTsMoJmmyyK4vTipDwO6cKY/CQE3Zfxsw7WTN2LX0SVmb
	HjIMm7x3DEEYPn7zX9rlG7Gr1wa3HZkx8vPiw0cTt470cLK2dnUAX45yda4rLhxE/dnc411v5HKDT
	7fcr7ZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj05u-0000000FoeX-0i5F;
	Fri, 14 Feb 2025 18:07:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizMO-0000000FgAY-44R3;
	Fri, 14 Feb 2025 17:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553615;
	bh=vSj0waEcx17dh7fvzqeAr6f2FKcw3vDK6V0f2tcErhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ryz+EwqXUQc8bryYPPZtwdHaMkEyfPKmTk+BW6/8Hfl+FzlC2+s/y+yJk9vFI8bH0
	 KNCowMDpEMe62aG3YNlFW43bFJ7rXGBBO3M0VGXDKjOcTMxNuh54+8XwaaGwQDR1OU
	 EI/MJS+gZJnvhAijOzLHK4xm5vVeyJ3/XlDoEr5/oIWWJkq+jDZ88eysEtLNweLx0K
	 jPlzKL8qo0Q7if3Gh4gNA1oqLIigLV2UI67LSU5oDGQu9N79075ufAoNhAZDSWXCKd
	 HQ8BLJkmGGDk9QbrZBBckXBhT066MzsBiRf5uwhp0PMfwIFMti7x0MFsB/5gye2TP1
	 ow68EqiFADeog==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA84917E0FC1;
	Fri, 14 Feb 2025 18:20:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:43 -0300
Subject: [PATCH 12/13] ASoC: mediatek: mt6359-accdet: Split
 mediatek,pwm-deb-setting properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-12-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_092017_182013_27E123AF 
X-CRM114-Status: GOOD (  11.97  )
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

Instead of parsing an array of 15 integers from the
mediatek,pwm-deb-setting property, which makes them harder to identify,
parse each value individually from its own property.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 44 +++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 646cdd4e0b57f2a007fdcfcaecb7534e08ae61c4..eca8a0eeb1f868a41c808cc0b853e77db3b0bf59 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -501,9 +501,13 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	int ret;
 	struct device *dev = priv->dev;
 	struct device_node *node = NULL;
-	int pwm_deb[15] = {0};
+	struct pwm_deb_settings *pwm_deb;
 	unsigned int tmp = 0;
 
+	pwm_deb = devm_kzalloc(dev, sizeof(struct pwm_deb_settings), GFP_KERNEL);
+	if (!pwm_deb)
+		return -ENOMEM;
+
 	node = of_get_child_by_name(dev->parent->of_node, "accdet");
 	if (!node)
 		return -EINVAL;
@@ -518,11 +522,33 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->mic_mode = 2;
 
-	ret = of_property_read_u32_array(node, "mediatek,pwm-deb-setting",
-					 pwm_deb, ARRAY_SIZE(pwm_deb));
-	/* debounce8(auxadc debounce) is default, needn't get from dts */
-	if (!ret)
-		memcpy(priv->data->pwm_deb, pwm_deb, sizeof(pwm_deb));
+	of_property_read_u32(node, "mediatek,pwm-width", &pwm_deb->pwm_width);
+	of_property_read_u32(node, "mediatek,pwm-thresh", &pwm_deb->pwm_thresh);
+	of_property_read_u32(node, "mediatek,pwm-rise-delay",
+			     &pwm_deb->rise_delay);
+	of_property_read_u32(node, "mediatek,pwm-fall-delay",
+			     &pwm_deb->fall_delay);
+	of_property_read_u32(node, "mediatek,debounce0", &pwm_deb->debounce0);
+	of_property_read_u32(node, "mediatek,debounce1", &pwm_deb->debounce1);
+	of_property_read_u32(node, "mediatek,debounce3", &pwm_deb->debounce3);
+	of_property_read_u32(node, "mediatek,debounce-auxadc",
+			     &pwm_deb->debounce4);
+	of_property_read_u32(node, "mediatek,eint-cmpmen-pwm-width",
+			     &pwm_deb->eint_pwm_width);
+	of_property_read_u32(node, "mediatek,eint-cmpmen-pwm-thresh",
+			     &pwm_deb->eint_pwm_thresh);
+	of_property_read_u32(node, "mediatek,eint-debounce0",
+			     &pwm_deb->eint_debounce0);
+	of_property_read_u32(node, "mediatek,eint-debounce1",
+			     &pwm_deb->eint_debounce1);
+	of_property_read_u32(node, "mediatek,eint-debounce2",
+			     &pwm_deb->eint_debounce2);
+	of_property_read_u32(node, "mediatek,eint-debounce3",
+			     &pwm_deb->eint_debounce3);
+	of_property_read_u32(node, "mediatek,eint-inverter-debounce",
+			     &pwm_deb->eint_inverter_debounce);
+
+	priv->data->pwm_deb = pwm_deb;
 
 	ret = of_property_read_u32(node, "mediatek,eint-level-pol",
 				   &priv->data->eint_pol);
@@ -834,12 +860,6 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
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

-- 
2.48.1


