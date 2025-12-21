Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE58D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=; b=etZeyvunxIHGYzoyvbyZSbepla
	Y3PwxrY+UOrcbhUeifdObfd/+DAAT1x8RbW9+qHUD8tjqyjVRH8I8lDBECqDtHQZUIUMNOmF2N1Gf
	u5XQDeGWWnHB5xmB8nUUoPBdil0t9saj5iX/n4G8d+YPyicFqH9NjSjK7zwTuo6PXIlChioTWH13O
	k9eyTpHqVcjeDuxqmGepV+SZIJNre98Uj9IKNIqjohigI3ARSsQEE8Plfo1OyKl62Tcnh9FkkV1jL
	jgtvBDSQWXhjHjw7F8UFQfcf3Ttu9y3GYoyjFSNWpdMowK7AXaVx4qpA/MV+MKKujU/XRMxSHHuhe
	YJcV0R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsK-0000000CIAZ-1nok;
	Sun, 21 Dec 2025 09:37:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsH-0000000CI85-37IV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:37:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29f30233d8aso39208255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309833; x=1766914633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=aLP2vhyNWpYU0iOZ/uQTpD4F/lh2yiwBB4lJUQaEcM/hlyineOCtntEZSGz1Gf+GqW
         ydlIewoPvkRfAP1I4S3nG/yxhEtoVn9aa2Fv0DtxjCWySLe7MWWLHliGdDnZs5KDiTCC
         tD2WqcNhyIdqR1OtDb6fu8TmIxAhlylRhHRaOfgI38ANh/ARxu510GlnDhq4rXeEhWGV
         jnmL0U9QgpbToIrka5Ew/6oxA/QfkJG2RcYXUZE0tgnaCHHJbcyLedFFnM9yXMF03eQT
         1CCD9ixwNvzkjCurU+0qNhpRvAKikwbIr/I2n4OU1Bp0rOwnN9X9iRp1Vk2SBgsWPpmU
         aIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309833; x=1766914633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=pceL/4sc/ayjPTPiiI+VLHj20xBjsD/ZqLtui5T/Lp/D3wsuVbOyjH6KOjnyjg8N+Z
         n4GhcMakABeedZh5mCSQ/KcSDWCeszQ1eoUCgSNRzTVsFXJmvFf80kJvntXDLWvfHIcp
         JrR2Tzv69BXnAWHZl+r1qR/qEr3lL5cpjq5AGJXSWgRK5SnJJKUh/VWOwDLqx5Opr7YS
         UsIEq1Z+9dZhyOrgGi2spgzWWjgxF3v06poeN5OJ9tCd7dGqwDH3cUzrDiyb+OkVOsyr
         EPlMcrozlGYNaHwo86H6M44ue5LlpYFdzfAMDxgZn+/BYG6wYf+zHAsBCTrXsqh+Brtl
         yBsw==
X-Forwarded-Encrypted: i=1; AJvYcCVdMGpFE621zQcixPv6SpiHDTpnWTxVvjd9svUky0OVlFvBRX4jtRB0cgYTLRfnfl/114Cdk9p2M/mfPvBtKNHn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm+v5V7KIbDth2mUmsx5rAkkwzA+9rHcpkd5oqSmUCzZtHQUzm
	0BPDc2y4cXctN6yga++8YYC6aHSosV9/wo2i18dU+T8B2+V128vvss4Q
X-Gm-Gg: AY/fxX7RnioERYtzKzqNyHEXl5zeESU9xmsgITvNMz72FVOXMPS0ycOlGG0N48YVdUz
	JERdX71+l/aoSg9t1RQhaJokxcqncwFvJWRB+GqPfzWIEXzni3vV+syiaaYjtkVFnJUb9Hm3YdN
	RpxOQOIEqxnNwwi6L4eDxx75ygJMhWr9wweqAy+Z0FWAdt6qB1Z4BRdmK56tJjijjYZhhM3KBcU
	ptmiofMBMQ+v9n+ZUWaUywK6uJ+TodnqMq+N5gY7ZYVpvuEVApV4wA4Ai94AtHsFj74z8ye1xmd
	xxS4JztNdd5nqR4wLn417I52EKiAO1LP619oWO4SDH3o+ga9IwWd7WLBZ+esZsOxtgYrRIpbcxz
	glOuUfpFgQgolOUDQVYGIGx7ly6Wp4ZP6xtfgCnsTtAphzElsbXncahp9KpHI0mhQYFDhaoFQpq
	fSOcoG5tsOjaRd8EcPUpbP6yPl+1NK9naNrYkx5qDXHgF881QD0IJcMbVAg1h39P+YdgCapgfut
	uz8fKZGKy+6bblXv++B7XNU++vrRcRfeQjrEwOio29n+/pXDFWUz4YpqEcyLUR6scyudcHDJpVL
	5nDw6JYuafKANkdZj6e5llJBuXN5BTuE9cMVwbznfUf+wx1fLxI=
X-Google-Smtp-Source: AGHT+IGMdyycbEEhzOfaP2Ty3g+HwuUlrykYJWMidFb++M717umnxFkAmzfzB53xMVODmVdckFRerQ==
X-Received: by 2002:a17:903:4b47:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a2f28335ffmr80140275ad.50.1766309832723;
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:02 +1000
Subject: [PATCH v2 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-6-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BcCWaQDqk2hqFZcbljTe5TshvfrnYl4MYwks/r0wuug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yeXTb3J8Yz9vVX1g5YygxSGhRIJQhKv88V+6ynkl
 dry++d1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApprhFMNvVq/fM9f3TeT60aaX+KHjVf/r6Qtvvb8j2Dvd+sMcxi2z4hgZ2o7JaDE
 r9c45+PQi8yW9U247y1WTJbRnm0ebf3E7s+IJGwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013713_809768_BB427847 
X-CRM114-Status: GOOD (  18.85  )
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
2.52.0


