Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27203FD0056
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=; b=jHwS2R3X2URr0JsQuGGVr1rJhm
	NjivI6m3UuywUrBiWfdHVMmj3oCXfIcP8VC23qcJwosuTDJnrahAEZGPjOvHQPElz8iW8j2Wh2phz
	3byJUlJtOiSSdKiIM2ar3Phu670uf+GWPPnJbD+uLDjHi4WEf8Zij1q3xcQVSGquGzXQItqH+xuI2
	bPYyPybNf4HFec5mV2hw4uxYMdSQZA3X9YjIE77goSOX86xW9Hd8/GFZgKHrSJqvKyWFaeeA6JD1o
	IX+yWINYoVysqc2wCi38xi/6qndPWfT6u+4C7H3dMwYRAEbefOxmsOEyG67KBSxPYs+nDnDU+BXZV
	t1+Vb8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpd-0000000AwVD-4Apc;
	Sun, 01 Mar 2026 08:07:21 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpQ-0000000AwPt-1SBe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:07:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-359866a1d02so291180a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352423; x=1772957223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=GJkHcfb93oByWQnTzk8QnzBQ4vDVk+I2fD8E8Srgj3YEXcqai55ONwdRZWAoBx0dgg
         qptTyBu3TNdHJR1qDOynq0fOq8nU/ol/PRscbmtS3WKt5aMH0Ye2tdpW7FTNDlaC8Mls
         MFmVdm7wG+6c+N3LOtphPMBKAuZHgE2u3igf186IF9BkKUlFcva4WBkxP8jycsGzWbjP
         AelgiBM55qkorwJyQn3OTiHGoI9fC+3LyezRdbiSrQNfecHRbQVihxp5FVBL+Q4M3JxH
         P6Z+wysoX6LoKv+xYURRb8xXLYu7I5E7voYkQPTD70m7hoGX7NjyX8u7G3NPYQ2FA4Ul
         ONSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352423; x=1772957223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=YMhWIXFsoLRcCV/4HaunB/buL/ku7fGuExAOV+JNgp1TTCmJ+Nlb5Ytt4TZLyqNg7v
         sDQj9XSq4q3QsxSfiav444AZkESs0fnFFu9lp24PlxoiIe2i6xHUINaorqyCX6wanIbQ
         nY5RGN/2zvVdqFGwTh/377GSulB8/JgWhDRlaygzxl66Xg6kgxd5hu0+wf06MpS5CEaL
         DlPkl3Q11rTUMS4+fUMIwJ8W15+pA0J2Dmiyo4kVFNjBuFyjgsxByNDTm0/YGaDt37Hg
         GDHw4Dg5SBH3+f1vfg4VpEyJRG75iC0ct45fqlE4D86pqrGqfObxiLiE66GSoreaIKUf
         /rrw==
X-Forwarded-Encrypted: i=1; AJvYcCWPl5+4IUfTjTXSpsi78gFW7XUaeGl+DkRdQ5Pgz9Cz7/RTXy/RLJ1YGGSYLw7IDnBUH9JP/hKoZtpN8yJZGUvC@lists.infradead.org
X-Gm-Message-State: AOJu0YzJwpeJmsQ5+DIRVYSUzq2jYYj0gpMOL9GEeEeMX83vcC66Dkv5
	C9TsDz4M31QK4iLKUx+ZyOtejOHi3EMOmoAHGFd90WHoVhjf0sx6wAVI
X-Gm-Gg: ATEYQzwboE688xsfCLJjPUgdXuIU7ehXL3rfJpIO4mjXy7sgwy2SZ8fOvMqDdjZVv+s
	8xOepF/NOYdy/SJ6mEBXWXYGRjCQV1cLrZUtXR3EYSZVusujyp/6CDzcR76IBmTu8TxTplh0hM6
	p04D6ukkwBbQVM3S4SNjhTPgJIk/zn1SUX50TxwDtghIg6M7GohXsBpvaU9mt4xWoHKCEIZgpqW
	YdFL+GzsXq8+T7BlwChQAdRH+bXm/egkx9aTgbZaCwxh67yJ9uneirfOPXAK4thtvHMUgGWdsLq
	OQzO/zOOPH8VarPZcfDnPa/jhC3jepFLqV7meif2lK74MwTxBAlxGLCIn1y7AOiO80VcY4T/b33
	01u5iaU/TYO8awAd5wPiA+bLzRabGyOKiDovegXHCYCyADCG0MGjoT0ODPpkfoxJ5yx0Son4ieF
	sQ9QO2EkHneX206joXTd6z66tjykrAgNKX8327+8efMpATfi32Ypv+k1rfsexY7fEj8f2nAVfex
	lVk4dkYTEOgPryyhVteNijjHvdnv80PG2khT64llhnImjul2ST1enbRVRqUeoNe3xSLBBMPQ0Gi
X-Received: by 2002:a17:90a:e18f:b0:356:8719:f516 with SMTP id 98e67ed59e1d1-35965ceaf7dmr8142105a91.24.1772352423345;
        Sun, 01 Mar 2026 00:07:03 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:07:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:26 +1000
Subject: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tgaTiLnqDVU09V+sOch0MS59MDRnaMGowpS7pQpkHvk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP2dcTLpzemWex/bfGxXUDX58YpGPWnFnj8yUCo28u
 2eU9EtmdExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbaUpCR4YJRr9JVri/nYzdXH/q9TWVPg7Cu/fqlz6NSj7Bqmj44Y8PwT00yTkn
 RuGpje8r1VntOyysFth9LO+97iO69NGWv9stOdgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000713_907659_BC894C91 
X-CRM114-Status: GOOD (  17.35  )
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
2.53.0


