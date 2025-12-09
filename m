Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044AFD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=; b=CDkdWBBQu14nqZjkc4IXE6khJi
	0zwjA0A/CGRaVazFsqlZoFQnx4jGAXdjy57PCX2J/MtjOwKBjar1ffNWcNlFxlBjTG9vN0uxmn95O
	szdR+p2ce5NueW9D5aKQerYLQmEXkAWKvogDYDrbk8apabS0GoMo8zoWUKev0+yTGXv9sa1wfMrfe
	B57u3UUu7EABIf1WNeo7M+1J4H4UuHyPDCjztCBiw/elC7vzbeQ9Lfz4+yejXjnRH2uLwCOF+2En0
	M9uci7BjuamxuZOU0belNvg/dChgDIeYanW3NN9PAoq3aRj+EUu2dpAqqmUbN9CfTiY/D2C2Mbciy
	v52k+ajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4y-0000000E3Do-1kM3;
	Tue, 09 Dec 2025 09:32:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4v-0000000E3BP-3ILJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:32:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2953ad5517dso51658405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272737; x=1765877537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=KFg+ZUec3pM9mxycVXWNyAxHBQveiTyUkm3ZStR11UWj9tkPm5o/7gnLMNLulnF5Io
         HVHsTHzocIufH4J9ZM7hWys7l2W7QRqhhV1cV9o3JhPMbJ5DAXPd/XPFeCTu1HOuGnon
         WdW1jUA84kEPjwisiLJOFTKzXFkvQJG1xpFQOc1k2TaesaftKxaftmPj0ELiRnlMHh4K
         OE8TVhk9/eTOZZjQfHxf5D86xroKkHwjVIqP12sSFDWvXAsQmsyM/6cOanJKOFPEJz6C
         9cwxEjHRSPQ6CiRPEhaON3hhAGCd5B6kQ72suW0qzb1Jke2JRUv48aV1JZVcuqSrtuBX
         c3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272737; x=1765877537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=hbTQI0Jabgh9tWaMlTRxw7KwQ6Tju+ReCIdK/USPXECYQOhkI8lZ0yeqGu9itfGURw
         s1jQk8o0tot/goKir1CUvuXiD73IO8L6vixnDXNPcr8BGQj0fDoockHOgv36W3BCTciP
         DqUwtoXwEXLwGS4SVG1hkTddjr4JqtsMabrklAYWG/KnbUJRuBn2muH1XDFWihYr55jr
         Ob402MM2yXZdwH76wSmUix6ohvCzxYnsQbj/ejFgLomipc/j4/g7pPbYyBLDa5sLRzAQ
         Ku//ehbkSZWBkYCmJRbVhmr43aJp4ONCmUwXz8NVcNemBrjssdFZhrJN7XOCb8LhsNos
         MOwA==
X-Forwarded-Encrypted: i=1; AJvYcCWykMuhPur1jVZqsFDbHWSlVKhTFW0P8TLt4IO3zMGy/pB+A+xUlXOW51UxQuqrwvX+UKARNnQF314iPH+cuatC@lists.infradead.org
X-Gm-Message-State: AOJu0YyIgnIna8hzbogTA+KNUIgZm8PwDWEKrvedOdrT6AgsxOZsRobX
	Uh2m3EOGcQdGvsGh7KKM72dwBtPblBIeUfO2MyxBPhLOTMI1B9GovKPB
X-Gm-Gg: ASbGncu98YQFBzN13DG5iEe2nrImzLBJcGmhqK1PcQ89yPWNtZ1qZ6D10nG1YR76Str
	44JJOwR6SgdVt1eBYjzcKHtk4unpjXOpKB765zBvFAWW70P4i9sU5oQKUuntnBgtXJ10MUYXM7i
	/rmRayHFpLiyAARAayDGkBcicX50MEtKTCECYf4qg+BhS08HYuFcHEivIY51mataKvCMmCYsFKw
	gllz0Y1OneAm+aVgdHQd/GTCkQA7XmPBu8UufSi9c3SyqB2GeMYxj+kNqAH6rLbZ62sn/uIjG53
	ALvEqvKEPeT7Aipi6u0kbwLKu4LKefzbzeXVbswEweaikaSKQSo6SFfN9GSkE8MZVxkDCD9Sif0
	XRh2/tzrfqEGz88i8OFf3Y24TremjPZKHL10LpDvSrkYiZGasxE1bDXiVk0fNUP/God9Y7eeOHE
	bsnjs9w0WLyK9VxxbAqap42rpqRpv2beoG4r3x9f4rgIpkV6aAs1gjnYmzQTzXj3jaVrbctxIAR
	dULCfrJ26O/LTQvEPF86NU7/+1oY+IN/QlssbxZmJxyRyZgNgrrhTvJ5/jvopci6OdtxT80IRX8
	ONlBK1j73yvkEjNH3NI7oV3S/nXCgWrx6NV4lvCqGTqyqT2Tj4wh4xZBepMxlw==
X-Google-Smtp-Source: AGHT+IFotzk8vBpJPn3igE6lPKAddyobbStk24n2ejESg7hiOK8wrzqTNKlOE578VcVOs6JfDZz2qQ==
X-Received: by 2002:a17:90b:35cb:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-349a250ee48mr9384938a91.15.1765272736911;
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:19 +1000
Subject: [PATCH 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-6-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+drHU6Kv5dx2gWI6Rb8MzRIPjOqO6lKIV5+rr02mpIU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7JfL7h9ab2x4v5VXfeDrtgleVdwvmWYk9b4w7zy2
 8sdd+yvdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKb6xi6GP1y/mVemPYxX+hStFdmwwFavarPMj9QTcfuDGrtMjn48W8rwV+jP1Fa
 Wa6duhjKu/KD9X1tVgbXtvWZDDaN1WaBCvOcHFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013217_841152_C866CA63 
X-CRM114-Status: GOOD (  19.40  )
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
op that properly configures the bus keeper too.

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
2.52.0


