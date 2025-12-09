Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B776D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=; b=CWTtkcybh6YkkPcodNUC7SinqV
	rq0vhP1HtPHUD2OfqcG+0TS5zCZcBdy8xwB5tPZMutzhVkYjhX84K36uXFj7ZayiGzCo7m2BbwYfe
	wgzl56BuGxKsZltxH/+jtIntTTWISkS70RI3HgRmVK0jdQGadH2JOq9UV3MDXtk2vKyT7QfUtdzvg
	WxsxXCI7yq76u9mXivgkqnb+JN8d/CSWCxhS6rPffNXkQOJa3kXkNw9f66qkci7+ul5OGaoXBUaZD
	tQhQZ4aOSVhjyJTUil4YzrlWYfYSvFt/MuCGDg7TmVEEac2fs9x4fNHTFkEWn+F3jJCt6VyADTA6Y
	7WD30Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu55-0000000E3Im-3EVY;
	Tue, 09 Dec 2025 09:32:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu53-0000000E3Gt-1bXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:32:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-349ae58a7baso2152326a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272744; x=1765877544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=mmYdsbEvzADcZZMXOl9Eadtlfe5k/4WuPO/9GjdbBl3HK9Q14c5skSbtpaZibytsST
         tsT1gpXfg9kZWrl5A8C5LDutqwhtBlvceyBTWa1+cIPViH+Vma+s/DILdrE7/DC9i3U9
         MfWcyJl38VzJIbXqJpgOrT0k5u/LLOGqqGD5f2y4QkIGris/KRrf71eRxWskVEpnCb6g
         FbQ/HELVinsVrDzxq2+UOqdbDFJc15ywtu3UYpsvS+8htttqZSp8F3CA1Ndj+uQ277tq
         h1/R6U0PQp6fVS9T5hxkprgN2TKmzXtF/tU4gM1Ry1GL+UdbqvS2aOkqrSfLQ6J6Sgv9
         FHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272744; x=1765877544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=J98ceSgTEYkF0IfqUUkGLGtuRMi2Ood2js6FqLvSeDb70tIlhuxIpQqIaweMU3FZGo
         oLrPkzX+wBkcyXkE+YXLZ4n3vIocFRsToyG/H1i6scgtNzbtoT87FgahO36AWGTjvo6k
         L5DF8U37afTMlhZiOJBKZqhy3b6gq//fvlI38W83Ykf0q/foBxlCeR3v1IGnQrwrDBSZ
         fNNxubZdkqfqbkOAkDF3iw4to1duclr5WQAX6ZeBwErvFP9kcfDQ+XK2Z4OsY9W6qaIV
         Ein9VIQodzKKtWIjV9DppIci5seEHP++SyLIsT1BYLvOEOd3WRxeljxx6obldgBEQt7c
         Levw==
X-Forwarded-Encrypted: i=1; AJvYcCUH+pX15Ty97j666WW8dmEr2ZVhochTDcezMSiNQQDrucGEALz0U0xEVoVGrfK8c6LrN4oCI6jkQRUa0/aWtt+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+Ayx8qzKoDtPD4VKeFo9h05IyYy6eYnSxvwgYFPAfESNvM31
	OwqKHZo7T0ivWXZ7PWSX9wtBIYDjud9IS3FpCQT/mCp78XuQAZlqtxN/
X-Gm-Gg: ASbGnctqBO33OdSmYDKxdWyEys7sPgqD63BUqI41JhU5ksJxJiTfpWQVt0HoT14kvEE
	nmmKLuX4EB+P9atbCqxfNBpkbvFkofhX2Cp4dOIGFdw89Dg9P2273K8NvD4IenTHUxNFiR3EFtI
	ftNOVrBph5/9XUVpoiRF/NFTtQ+zITYsE+Nd2hjFoQAvdqw0OmvvVrB3PBYbAkXet3UtGg9GfKh
	qB8IiPUy+RxrQMMFJDI0/jRdYgfvFdZj7o7pjfFMyms8LYdXlI6Z7AakdeSp6XuoAxAoT4Um6xH
	z/JQCgTIHgUHIyVaf5G3WcLLc/L4mOVoyE6l0beNZfPt2zVP6YhosybDENmB7xhQop2A/4YOifv
	yNxTaMOhnbBehmZobhn5ciWEy9STC2rr2IVY6esSjkpIHcl6opxgpra5Or/ohpsqgc9zIer8gNy
	iZRrrx5rJVEzdIF37ye70FBdylKoXk61YnzjFDqb1dhuQJU8qhFh3vuHz00x5TqBEj2c78gE75r
	Sf6LP4ZLmussqZvs1pmVr4Z8FTVytjfB4UhcGHYsRmdTOGtUw0JmLeeI+PcQ1izuYpogX+BK9ak
	jvzkAnG9XVv36ShoF1V0DD6IJjzTu5BmaNbl/OlSsspvJbVg57bbh+WPqdVvzA==
X-Google-Smtp-Source: AGHT+IHshWKoIvDGYXvDIhmbIHXx+eRzKnkbv3j7ltjnhSQGKLSVw2gL9b8YPyFcCo5W0olsRE/M9w==
X-Received: by 2002:a17:90b:390f:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-349a268665bmr9074422a91.17.1765272744486;
        Tue, 09 Dec 2025 01:32:24 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:24 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:20 +1000
Subject: [PATCH 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-7-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7IPlyhL6Uu6eG8tPd/1Q3SR2v6KynBNJ+Oqo+syC
 zJyDzN3TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApvpPJsM/020srMGnkqR/HGyTX+x85Moq67CKyEOXP/GGJqm+Fr2/ipFhuf4ktV0
 Fqk9nqfjJLHtnY16gJWL952ahxyKW61suer3kAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013225_431880_A4C0101B 
X-CRM114-Status: GOOD (  16.71  )
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

TAS2770 includes a bus keeper which can be used to control the behaviour
of the SDOUT pin during specified TDM slots. The chip can either pull
the pin to ground, actively transmit zeroes, or keep the pin floating
(default/uninitialised behaviour).

Expose the bus keeper via the set_tdm_idle DAI op so that it can be
configured by consumers.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 75 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h | 12 ++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 6f878b01716f..d4d7d056141b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -492,11 +492,86 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask,
+				    unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything for SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2770->idle_tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT,
+						    TAS2770_DIN_PD_SDOUT);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL,
+						    TAS2770_TDM_CFG_REG4_TX_FILL);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT, 0);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
+		if (ret)
+			return ret;
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	tas2770->idle_tx_mode = tx_mode;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
+	.set_tdm_idle = tas2770_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 3fd2e7003c50..102040b6bdf8 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -67,6 +67,14 @@
 #define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
 #define TAS2770_TDM_CFG_REG3_30_MASK  GENMASK(3, 0)
 #define TAS2770_TDM_CFG_REG3_30_SHIFT 0
+    /* TDM Configuration Reg4 */
+#define TAS2770_TDM_CFG_REG4  TAS2770_REG(0X0, 0x0E)
+#define TAS2770_TDM_CFG_REG4_TX_LSB_CFG BIT(7)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER_CFG BIT(6)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER BIT(5)
+#define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
+#define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
@@ -115,6 +123,9 @@
 #define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
     /* Interrupt Configuration */
 #define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Data In Pull-Down */
+#define TAS2770_DIN_PD  TAS2770_REG(0X0, 0x31)
+#define TAS2770_DIN_PD_SDOUT BIT(7)
     /* Misc IRQ */
 #define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
     /* Clock Configuration */
@@ -146,6 +157,7 @@ struct tas2770_priv {
 	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
+	int idle_tx_mode;
 };
 
 #endif /* __TAS2770__ */

-- 
2.52.0


