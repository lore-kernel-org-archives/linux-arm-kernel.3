Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B627FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyY9G+TpSKpweHm5kQNAg6JQKS/x6D4lbPKE8/3PcuQ=; b=ym5rIctH2kYZvnaIoj4Y83NxeA
	CVsy7IJFPtNn179oeHy6rUCcKQ9Uj8j/GLD3Y67PNPVggtANyuwfnI+pEWeWlChzNdmMeNxXoD+N6
	gC+CwbtBGamke4qNJnn7T5B7ltN6BAAEwPBlNb5E/CWv7TyWP6ANHJa2JAHrkhNgIIyGzqH8s3xvN
	c4O6GnGH9rBBFNHr55qNwKh7tcRJlIT7SB077m055PENjsCQfwRLY954ozvDuDaMepfoij13LdW02
	LJjnWKLT5FQ26Ys9zzGnoQI5P9qSDYZd/51VEHphD8vBm9xsj8gdnBtargkaF+JBIHzGEHZBIgQze
	CdlBuJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpd-0000000AwUW-2bNq;
	Sun, 01 Mar 2026 08:07:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpI-0000000AwPm-1aLW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:07:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-359832fc558so506527a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352415; x=1772957215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyY9G+TpSKpweHm5kQNAg6JQKS/x6D4lbPKE8/3PcuQ=;
        b=luP5TqfSqkDolr3i5XohcDq9IrxZ+Fhhh1bz6GD5uP9Z8hm94a4+rkoPxwWVu2nAu6
         97b5JHr8h7HYJi3BKjSZRyr2pC8Us0uULSBdsDPm9Ls5D4UKZy79RHPqOnLlMEjaaUmT
         0YwgcGEs+d8Y1pQacZIv8XIWiLp7ntNtHIAbYqcVZ5iHGCAFUB7ouyEmd3vBlGjMLrsF
         Hem1aC+R+2e34M2n79XNvj9m62uxUqbX32hyUO85o/oyCzVQmGgbz1KBbSLriO+y6T5f
         9JaKWck0nhW+3F8PlEnD+by8qdo3jzmyFXKQGSRQ7huFwbFezxU8v7IC6g8snXk63LDE
         96cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352415; x=1772957215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyY9G+TpSKpweHm5kQNAg6JQKS/x6D4lbPKE8/3PcuQ=;
        b=CA2VMw68cortwxQ0QXDrttpH+wDU1nBXgWVXxuX8PY/Hs2xo+xntYkfSUOD9rux65n
         JAWkhFJFsjGPAIF9qaN95PcxEBPzJzRyrewVN5aHPK3Mox8lKB+ENNY4vMTac9vOuRXu
         jsqlV9aU3eC5YCy3HlkFtMY4A4iXfV1ZGwWI6WTWTmlnazMe75D35LVfncAMEsf2LLlr
         SSOuzptdWQyQ+bRBQq8qXHLGkcRA5Qq4U2UFS+8RAdtgo9RxL6vanoIpRp+2QBIz4Opp
         SnuVubUmR3vToXmqpJ0/hWBRTNodAbpmOkIAN4F6WAuMZOP/idg1wbwL6RMOQifNadPE
         XiPw==
X-Forwarded-Encrypted: i=1; AJvYcCVfs5Rlxv4G7V0enNCa7azZrmjBEDdk87mEizelHfpw5kmkQ9ruXGhcRex5lZF/W3CObw5M2MSS09peE/7rsmEe@lists.infradead.org
X-Gm-Message-State: AOJu0YxE8b+u8Xl3g43PTUak/cECcdxcF+I1keY/JSphFHzRlL5CLQ1C
	KHSZGBeLBZ29JYgH1ZDSDTk3UYMPJSPEKU7sW39sSb6lXmmv2ydJh6vw
X-Gm-Gg: ATEYQzxKBMClTVAW87FOnDQOgqt7iOj6zCfmay7qhfFraJQxqYlww6LYScBGNgKZw3L
	W6sw7kVckzAf671WhHmbrLcH2QnNyXgOXtt4JSBLGNO5bnI9EVDa/gC47JP4M+QbhC+bPBZ1ouF
	QiHpO/JH/AeihRMb/uGqfSLSmTrqVsYPxR17tVYMBEVI/SdjNS2nJjwUB32LTjgO6EXP3o/Te2F
	EAOr1lo0t8hRm2bZGrS8mopc/Q+zSohvOzhsSExOY3h+B/XMWMbLaOpiIimhRx7hC7M9MRrQttE
	iead/DHRvVZE3Jfygfn2M8EElFTBJ15JAy2gBJofDn26U5vEEl2cGoyxtQ5vfZzP3tV450jH4XC
	oum5plcR9HjqIR2PNKDtIDe6jamyFMK7v2HW1t6cLvtlIAdkmJzyNHbsfsIJTuYL0gCFvU/IpPs
	AifDL83ptxUZ6LfuiMILs3yNdx746FXFo04mAU1Knbku3LP8IM6IIxWPiA+srbjjmzcpcK+NIfP
	HLldX7kL+SU2fpcPOJqHMJ1VdLIae2o6yujSZQCB/pTVD6NFVUYWhn8WTbvaf9Tv7XF6C7JgTMM
X-Received: by 2002:a17:90b:5843:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-35965cc7144mr7861675a91.26.1772352415479;
        Sun, 01 Mar 2026 00:06:55 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:25 +1000
Subject: [PATCH v3 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-6-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Vu++GF5ETzV25pFIC4PFfCrxUq2vxpmKW9zJn8nLbis=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fbzXi237ksdNkrtpPrtvx/flhkTavndm4hKccDN
 kseZh793jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqjiBGhjXHfFdmNmrrbLe9FOwu6+jap7PBkn3f461fXm3L4omqfs3I8DS37Gn
 DnLMuwmz8VWHXDmvO6nbbOzuB8ejCRHdh0zU2zAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000713_911921_43D8BA05 
X-CRM114-Status: GOOD (  19.91  )
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

TAS2764, and the Apple-exclusive variant SN012776, include bus keepers
on the SDOUT pin that can be configured to alter the behaviour of the
SDOUT pin during specified TDM slots. The chip can either leave the
bus floating (default/uninitialised behaviour) or fill the specified
slots with zeroes.

Expose the SDOUT bus keeper and allow it to be configured using the
set_tdm_idle DAI op. The mask must be cropped to only cover slots
valid for the configured BCLK ratio, so introduce a set_bclk_ratio
op that properly configures this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++
 2 files changed, 106 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 36e25e48b354..423b7073b302 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -44,6 +44,11 @@ struct tas2764_priv {
 
 	bool dac_powered;
 	bool unmuted;
+
+	struct {
+		int tx_mode;
+		unsigned int tx_mask;
+	} idle_slot_config;
 };
 
 #include "tas2764-quirks.h"
@@ -509,11 +514,101 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2764_write_sdout_idle_mask(struct tas2764_priv *tas2764, u32 mask)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int i, ret;
+
+	/* Hardware supports up to 64 slots, but we don't */
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component,
+					      TAS2764_SDOUT_HIZ_1 + i,
+					      (mask >> (i * 8)) & 0xff);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tas2764_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything on SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2764->idle_slot_config.tx_mask == tx_mask &&
+	    tas2764->idle_slot_config.tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		if (!tx_mask)
+			return -EINVAL;
+
+		ret = tas2764_write_sdout_idle_mask(tas2764, tx_mask);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = tx_mask;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		/* HiZ mode does not support a slot mask */
+		ret = tas2764_write_sdout_idle_mask(tas2764, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN, 0);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = 0;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/* The SDOUT idle slot mask must be cropped based on the BCLK ratio */
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(dai->component);
+
+	if (!tas2764->idle_slot_config.tx_mask)
+		return 0;
+
+	tas2764->idle_slot_config.tx_mask &= GENMASK((ratio / 8) - 1, 0);
+
+	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
+}
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
 	.set_fmt    = tas2764_set_fmt,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+	.set_tdm_idle = tas2764_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 538290ed3d92..4494bc4889dc 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -126,4 +126,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1            TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2            TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3            TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4            TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5            TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6            TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7            TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8            TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9            TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.53.0


