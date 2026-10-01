Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ED7CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=; b=aiW9lgGKWVUZFBOVJi/1f/2Mcs
	uCIYcRGagyfhPAOQKn0ZUd/rW7FV1wPUo+PW3wMlB4xzvaf60Up7UAIFHs2i/catzrnI3iR0rR2sv
	EiMgo2D6bbIeaJZ4f4PHHapZyykId50tgb7Pcnbxr6/qpjyDfnYFbTu5jlFwbAVHQdDaimlHbwSy/
	92bKh8pe8xJfWxKGGMgZXfyQjCrcmUKlA6jBlow4lHnRLgm7174X/wa9DqbCREOM5RhqtbusQzNXD
	gEGmOWGt3BKhWa2XJK2HB+xlnG2jg2qfl+4Ikf1crWNbPq7/r9vZrE1GYb9a7E/wR+0VKxOF0hJJe
	XgH1q0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ4-00000009dwv-1xSq;
	Thu, 01 Oct 2026 16:06:50 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIz-00000009dob-0O7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:47 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b0591cf85so825877f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870803; x=1791475603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=Bqf2DZNjvGdaU03V2ip0Bws/o2ca2OdCtXJhyYvHjbdXeK3unrBvtL7jwovLeQdAPf
         2a9EAFUMmz7Dav+mus7+4bfA7tGsgJuWv0om9d55YtxzjjE6zx/Z4d7PBfGeqc/sVDt9
         uu7Fl/0Xkytz2Sn/gcpG+VWsAd/XX7wEshNa3cy9Q20WnUGUgy/ylmCb9BKwVbYE3PsR
         kPP0kPThYisVKA2DKNSXowGPQDVMd1O2johTbFoow+58GjhzrqTS2n4fRDB7H8M8BDMb
         q9tX0PG2wXgJKqAccSx3OmoUZjB+TfzfKsU7Mn+sOrEmlAYVMCr81BHRlhIydANAzghd
         wqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870803; x=1791475603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=Q78remZCOMZ5hehvAtq1MciPWVeESw0J6NILFPOjZZhLJfXd2s1Wh1D1+YGDdM1ufW
         ANMCEQWP7hdq2E7KcdxbRDn6PoTknn5Ju0rSeatJB/FS0109CZR98KkHifU5PmgpYVtB
         t81vSBK5bu12gZKyBdH2ZtwxFyd/lH4K3l7p0B0xrmgl1216ldSiNlt83gC927K04FF+
         SooQGwhWLrAi1kRVZ5cngnpwL16rbDMXWaxEfq84DPZeIlZoHFx39wMQDPaUwvDCUDa2
         Sv6WlKBGSXOAuX0trY2DfGP3urq8YrYIGwTViNmqEDbV96BP5Z0XUvxGdsOmeGLFvw4A
         2Fwg==
X-Forwarded-Encrypted: i=1; AKwUvBySm7fpvT7zn2FqnP8WrrFOhcAhUfRagvGoCej4PhAPcQUIHfU4oYKt87aGkndWUqIOjZQYDi4545334gyIHOR9@lists.infradead.org
X-Gm-Message-State: AFuF++mTL94UGra0lXT/NGzNXw715tYpHUjDB0E6kc/WGUNfT+vmvItP
	L7WH9x/3C1Qkw8ad+X9yEwpMpBIW/iy76+krRSZJDKa8LO/OIPBQXvhYdgq1IZ8A2aJxQTx02jR
	Oxd34qt0=
X-Gm-Gg: AYBFou2ocfEK4ftQQurvBUtwcVWbpcWfYKPGrFqO9TN974Kb2iPZoHk7FF4MBq+Ifla
	oHztGizBBfbN/W0GzD4LjY61i37+rsBLtO5PReV6Spj7jQ1LDlWSL0T+9AhMHqyoJXOeLEmpBsk
	T2MEAfkRsXjvV3jByR8wMfI/dbKv1VlZ4p/j/EYd04qImjQ+C27YQX+JKjBctOGYgDMnDEsG90/
	/qUoq9KsZQhx7wd5ZJ91gTtJPnYj4wmuhRC7GoTktBGP43Fiag1n62RfIUgIjtqtdVPYocn7zVj
	7boyv9uZ2qWgU1u+j0TPt9arAuO0FqGW2wSg7PdkfHsnGx66pvB12rbYuDSnthw+RXJemeIEM4q
	dr312dTYYfX11t1gGjM3AVttjxqSX0w3Utz8VY8RMskPfsQSlNY5IUzupaFQ1UcKi6u3cmVegTq
	25RG5Bq6QM0cXFrb5gJSW9DSB2wQUg1zCmejRFRxz7Szne+xZBlnKPTrcn8FSOoVPB
X-Received: by 2002:a05:600d:8495:20b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a0276bca29mr1048545e9.16.1790870803622;
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:31 +0200
Subject: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrlFLqls2D3/ss7M453XpCf1M03b9P/4rsqyRY+NO
 hw63bIndZSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiHkcZGZZvr9qQ0HIlw70k
 /1mL9g6rXafOB7HPynRvX8jW8df1hDnD/8TDQby3bNlksp+s/d1+ve+JJMuF5XksSoEOIrs3edR
 VMAMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090645_300477_229F711B 
X-CRM114-Status: GOOD (  13.68  )
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


