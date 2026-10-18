Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E3CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=; b=0w8P8WgW+kuZMAtDAgb1z8cwGO
	P/AmC8OlRPlcfPqkVLPEX+pNvce3fUyQ7HXOmIfus3nyeIa6WsivQejRkc/H3E2Z44+rWxSXMbaM+
	D37vr5BOdHCTTycYLbxSPjXNCBVssfCwS/LQgsM2Wa4nrEwUOCxAzD+t1iIsKKLu7/Yqf4/a81LVs
	oSEboTUR9GW/0yc8vRhl8jnefYkaGOsKc2Vz4vhT/MEmYs0+r1rq3jOkjuzZQdrf064CuOA5tcnNm
	gsjOVopfxkV7mgLQwlq7GYHzpHiHIoXd52QPli5RUmXfJEH84nykMouwi3NKbhcBqhcCezkoajuch
	sc2Gdj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyv-00000005jxH-3FNm;
	Sun, 18 Oct 2026 10:19:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINya-00000005jhz-0FkB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15290735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318726; x=1792923526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=I0PSvQGSKqx/a6ho9eKpno2gNI+r4ISSHeXWYRHFGy8FU2c3GYIVH5KY00QOS4tEr9
         wBfXE1BKYbFxHJk9U4qD3vmujHk9g6tCNUUjPDsiCa7bO8wjmww9fGs9/8tkZD8Cfagr
         XondKcdtPLnnYRaJPqSg1WDOPQ1zW+UiRkczN5BKTLsXstqg2qHDuRujjHiwoDyCFgPe
         jq+tcLqOpGt3pnCw/0lnxkC0PYeJbDXf2jEtcwZDyvJB2sFZw+3Z/DD3SNKelvv+BkAg
         InilEtkM97GnvIALw4TGpe3IAr0QonJFQJrHffLS6Px9S4UC5fAnxz7cbWMC4MZFmAbt
         Xx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318726; x=1792923526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=eWC/kY2ksJsURxkA8861qX1DSD3OmM/V6BWYfkkHN8n2pjFOrAqPtUXbgyR8GNVMGN
         xHC5ECQ4ZVzYkSy2iBenYY7O6tDkcuk6B+wQOONMmUDOqxAqG1eb5yRO+Jl5F7FmSzU1
         u9oe0Gw23Opc90X/cRstBsqq6YthpnWUspsgaDbaxH0HHruAxAhsoV8whjtYgcSsX6ws
         7vnXAzzB6uAR+9u6YLaTeMFzdL4scGF3k1SIe224plptElUN96G29NgbDmpQG5iS7y6g
         lRqaY8+gAfrOm3xpuQVfGRKlMruZqjgid/pZrxKDN95qs5uNx3H6rDDUaL85o0BtCbzO
         zWDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4716PXIk/YjUfbU9p4IR/lyELbw8poEp+21KR1v8lBtNLz8nfiauk2IPG9S0jXvYSWVhD4O7zHzST0f2d1FAx@lists.infradead.org
X-Gm-Message-State: AFq9FYLgEVLjMNlFGDiciXbQfyD4B3RZHI3SbRZFqckhPizHqH+2Z33Z
	7s1yZrsy459K0/6IHcaD299z0ssCliikdqu06GliXjSkBwfkctcqNoe0qe/MNQbhy6c=
X-Gm-Gg: AYBFou16ze8BHf26gSgxZskimlg8fNZavxT1AnZiRgxXFwEwJ7QXiMDZlDq5S6sU3Mg
	nHUluq6pxbeY4eokWQ+KJKd+TUVMnDpf1J6dgAfaW75VB5VpOJRoZE7PbcKC4lKcIQpOVU0hx70
	zEgq1CVHDONN+Bjiy7LKS/JZXYgDctF4GpkoUxbb6p+rH40nejlOFFyxo398MqnntKIwyRKJCrO
	jOtYtkYxtcyuAmF7DFciK8coKIvTZdAbKA0LUcNMLieVfXQKS2LFrNVSua7b961c8CHAtIYRH+L
	iy4s/fOBBG+COJLl+BUfOCnmho9DI3ZeeZdgPkhh+z/9ki6DnQqU/VV+9Lu1gyuKF8XyZjPcBFZ
	48cB2IKsyRzDMsS6vs9MiMNbCJBvftPuwSRdoE6T0LaKZcLQFLL04lYyRmBWTYxrDWWBvj35HS3
	iif+uoCCv+4ksMpjFPfi88Vw02H7DBribG7zkvu1e3DJGpLOArJ8M2FB4Oi+lJyvc8RQnY
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr89775225e9.15.1792318726464;
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:03 +0200
Subject: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O69LbaRDhE5Mnt4Cws91GlWiqFPHvQzlvOmeDgLwXLk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vwOZ/e5mJF+j32W++2crf9qcl+mHuSxvaakfEAzK
 0M+UOZ/RykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy7gYjwzTz01GubckscY/7
 Ai32BAq2lh4U8riczaAteG9pxwPLs4wMDdPk5zhPzzjZ2+WTwF+9c93ha2UOs1Su2Gw5uUahlSm
 cFQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031848_965799_FCC0A1F4 
X-CRM114-Status: GOOD (  13.30  )
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

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..7e9b34e02275 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3


