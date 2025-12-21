Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D0EE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=; b=JWUcE/0U5C6aUnvI88ps4+fVNo
	U7MhRcSXy389fc+lkdP+LGME1/6WzC0zIuOHBfFR5zEKE/CRQjDCyfGkpO1zss/WBehcRYaHj4Ulf
	zMNNw+BTFEpuVW6riZ+fhJs4U/WGZ3l6j40rnVEqcx/x/liRP63UkbzJnj560nTPdCbs+/MsL6a3i
	8WC1dloNMVUi3RMCrCIejP6adEZGxeuVHt333Z8vzNNe5ZywZVgwnpFlMGKR8foyOT8vVrI/m2D3b
	4u3hjh2iAN7HB4ggQXrHenh6u49Wt10s/M4HSbBe1x5sunwNN8QnJ9sCDBz4j/E70430uy/f/MGny
	2MCSYUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsR-0000000CIF3-39Gx;
	Sun, 21 Dec 2025 09:37:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsP-0000000CID2-0Nlj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:37:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0bb2f093aso31823305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309840; x=1766914640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=aPtlG1OOmOsVMmojh41ALdP2OxB3LA7X4543GN7KxPWXyzZXthpQ6wQpOkn6DNolTQ
         sFAaKWDRgx6VIWJw/btn52PU1AEhNHgkXhXSphiV/hiS2kZLQ4Z4TM4xANOqywjpHBD1
         FXVqAtRMdclk0lt3LhqKmpEk0JkgVq1+LyPYyfRHlWtCIL0d2EGi+l+51o3Wr/wgWY0z
         PyRNpORTc9jaY+NPXDqf7AhWY8kiS2u2khR1yatoQNbokU3bcEk6qZLbxbaSFy8Llkpg
         5KSsE/mYdbNWx9L3yOcHzBbESJBviKm8VteVKn2UsM9k1x9zaYPtwyOBKhgb8vTYCR1k
         3Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309840; x=1766914640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=rlHNY1XFEchV2YygGClbSW56S/qtrjLqvroJEVtGuPr1fq6jzGtoc8/+mECWYUdEwT
         4VqMob7li+SzkUmF/v8mUEaXwL4O/23LBEn0NyKIwbVIUrCx13wsksS93N1FtxcvtWd5
         y+NJQA0RCwHdMt0nrRfw0WKBv9SO7+y9tYjhptaP1nvWz+VY6Jel88J+KqrovOYE8sD2
         /CrFhMwJnhab7HC35AuGNAZ0YoQFnsqOWJgEQwTDissTB5XcSmDJcOfeGP/6gon2CxH6
         ImTJ9NtrqZoIY2EU1vCM1V1dmEEchNlQbOIRd7zq2/dNGYhcN/gY1OzAFxUPm3YMFhH4
         fwtA==
X-Forwarded-Encrypted: i=1; AJvYcCUdoosDk1v7Ji6UxdjUN2Ov9BG9Ue2EPj8UgG4aojCvV7gauzPlWJqqG/d3dbFt1z9tVACPsaVCQCPb2rkmHN4e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9HnNvq1q+DNTqrhy+aaA93kBkHL4jZEwyrpFfl8oyAcplUNnl
	s8YZkh8HpB8qsrOh/iRGEX9XoLbqHw9X5x8JYMp/P3ksLds74bre8nGW
X-Gm-Gg: AY/fxX5ytTgQ7/ai4GbDGrB2AwDA0N8DaRXmUB93HF9qZWQw2REuqaO9Je7R7XBDVVl
	T4nUBzze6l+0JlsZo53GorZCahYZKm64R4gGLIcoVqYnTB6SDEAdSywtm5nF7M7IZXvpPbMLO59
	M9Ep2fDbMq9GnpeIYvica4bUB8QxhlocVb3CbsQt3oi7hcfNgCTDvbWtkSIax0Y8ekUoUvU0FeP
	/0juO14vKRr0Omh837SgTj0Gnt/e+lAUJE61kypsehyltBV0IIaMXHPZRESghgLR8TJS37sQf2H
	NiE9IG+Z+c95f/3fiM19YENaXpJQlb2Y0j3o9FQCstb3O9tWfFg85uQW9spaDi7UcDASUsIOfyl
	Zwo16e+P/ZRh1pRsexQKpe98wel94AvM7AKBEZUUpLqGq65QzOWzWlEzjiJUFCwnu0l/v66YsXi
	jtVEMdWm3CyALltePzn9fDPzwrKq+uuNVttTP0HFXJnwhfTjrk5BThNui1K6f4CBputIZFtC21I
	ibdGalZPDli4/ONLrnpUlbqGjPfXkelzwTIhdILxxaU1KUGLU/rbOsGfPYQtoLe2KcA7O+pjoOG
	z7qDHeMjkfEwCtinoBoPXJ3YfjG8IREIm0Wh0tdn99wVpkPKpnc=
X-Google-Smtp-Source: AGHT+IG3qoMi1pT3L1mx8WGusEqRkmhnU95IldSZ76zQsfA/ovZNAZJZT0w8l8bvTDKlgtAC1QBfZg==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr79985445ad.18.1766309840329;
        Sun, 21 Dec 2025 01:37:20 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:03 +1000
Subject: [PATCH v2 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-7-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfrR21YfWKb47yGtwc+xpW/9c6z/JkwvT6vOXraG
 cUJZmskOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNt+oDhf9rmVdsiknuYdpu3fMtLPui2w+6rv+XNqN5K1Qs2BV2aSxgZNsq6aS5
 aNXflmtX5286cmq/g+1sz6eHq6U9fZc14/rAngRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013721_146576_0127FE3A 
X-CRM114-Status: GOOD (  16.70  )
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


