Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85968D3409B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mknfTtXCo23W3lqkR4Cj4T86n2nm3eZ2PJ92k2F1m+8=; b=B1wVDFxi348SsBV7BDzuPGeToL
	iRTaDi18rXxCtX8rWzitumxnzmlmt4CHW2Z25NKhlfb42AQE2hTNLdaclkYXpiQFs9mt4GIFRb1GM
	JPmCVVwubHY4l3UaVs8uEe/HDt4EkvT0akCXn86pMApwAu9MLIZUJVA2dFayUCNuMIjAkIL4gk3Uu
	2kmC2bg7ruC0yFgfTg/iwSseiC5phZco2IPoXZ85wRnAHZZ+IIFU6GjJIWmDLFIsUzlDW7j9WXINm
	QYUNjpvPBfpFWVOCJKrgH+8mu+KWdfJETzGTlMgMJP3yX1i+QzLEx283IUEfGIHX7MtYwLYsekYGc
	EdK5/DgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcp-0000000Ec9u-2GzD;
	Tue, 27 Jan 2026 16:09:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcd-0000000Ec0K-3NvD;
	Tue, 27 Jan 2026 16:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=No+BNRoccsHf+NUA8GkCc9/TqVGutQZy/sMq+w/CZQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YnjN0joQp5Te2kW0fRX3E1yejb2/Jm2aJiU6hZ6dg9Wvx0hVu+cP9MUEUMxt5FgEh
	 ZKVXUEyLbVSICmAXcsOgvR4bHtC9icPcazBYZuYM4Aex7mL5AbmVhp4G2sWbfs9mQ0
	 XoNcNWWrDeOrNyZdRaVKDH7bimCAgKv5GJ/Hv1scotCgyOSyQDnONOS/RMugs1vIaS
	 +eB6uKgOMvM9pwred0Kam0xO6riLusH+CCSPmWiiDbA5rU9pJkH9+d5yy9nejM1Gp6
	 ptnIy8v08NTcgBQ/BPxgEsbdhr8Mda75rzigwcHYQLBunq01asvXAOJZUWRMn6vDqd
	 jLcpdOI6LihFg==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 03B3717E1543;
	Tue, 27 Jan 2026 17:08:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3CC3B480066; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:28 +0100
Subject: [PATCH 08/10] ASoC: rockchip: spdif: Add support for format S32_LE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-8-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ioPETteiBdv5BnyEvaF4eaVsZWupHXbFC60Wx7hFpEE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xGS8LOF1xOkuIWQ+M/xPTBCFex19N5CF
 kioY6tXaCjckokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMRAAoJENju1/PI
 O/qa9ggQAJj24jtc72bB+skrp5GUfggHW/4PRPyhLGRv4vUSDzAe+wF9bPA5VJxZPLzzf1kXKyY
 12/7QiHMZDhi9s8MhSypMgr1kX1enCn+tGLdbvj38A0MOft6etoUB7pGf9urkUCI5MquQxtjkaX
 xE+W9mU71FL4qdsJMkKCBSsLTjW8TMbMCLtGA6UUJ2cL0tBXdOMkP+4JXX3OF9GGmUVyd/KyuDy
 nUUocTO0zG95PGuriO77Xit+is88lRwZC6XwqzOdZJ198c6mw3aph7Dda8OJl/SOId7FtB2iI+j
 gafMZMLKR9Yw6s2afn2wNkrxqYToG+A2NEI6Ft4PLku3kc+NrEWOnuaXbl6nNwZImhZ8DyCfEHU
 kimwpHv3HaIaLE34d3nRQHep1E8fSxQnLuFO8JvtORkrmryPV00J9xEuGl6gyOIL45Uu4llJtP5
 CWJQuqG7d0TPN69Pc+4O1ppPGxzU30ePThPJjmRHWMzU4qJ9UGi+oaV2ZGe9T1NEPFORfu1EOb4
 lKMQY2idy99LJEYtfZvNkmvgP28ktjgMgDirkDQWEfuRb1SiPsa7RHT92x3yW51ILFgqwK3F571
 W37sf81QV4DiCzN5qK91x9fn267xUwpnmxfxw7Jy1fooFcOL1bb6JluH5YZRiP1d5WJQ2VfLCfJ
 36DCfpCX5qyeXuz/IJGQ3Fg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080856_005930_0094FFA5 
X-CRM114-Status: GOOD (  14.73  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Treat 32 bit sample width as if it was 24 bits using only the
24 most significant bits.

Co-developed-by: Zohn Ni <zohn.ni@rock-chips.com>
Signed-off-by: Zohn Ni <zohn.ni@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
[I've merged the channel-swapping fix from Zohn Ni into Sugar Zhang's
patch introducing the problem in the first place]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 22 ++++++++++++++++++++--
 sound/soc/rockchip/rockchip_spdif.h |  8 ++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 8cf54470f931..5e9504220a1e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -99,21 +99,38 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val |= SPDIF_CFGR_VDW_16;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
 		val |= SPDIF_CFGR_VDW_20;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		val |= SPDIF_CFGR_VDW_24;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val |= SPDIF_CFGR_VDW_24;
+		val |= SPDIF_CFGR_ADJ_LEFT_J;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/*
+	 * clear MCLK domain logic before setting Fmclk and Fsdo to ensure
+	 * that switching between S16_LE and S32_LE audio does not result
+	 * in accidential channels swap.
+	 */
+	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CLR_MASK,
+			   SPDIF_CFGR_CLR_EN);
+	udelay(1);
+
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
 				 SPDIF_CFGR_HALFWORD_ENABLE |
-				 SDPIF_CFGR_VDW_MASK, val);
+				 SDPIF_CFGR_VDW_MASK |
+				 SPDIF_CFGR_ADJ_MASK, val);
 
 	return ret;
 }
@@ -203,7 +220,8 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
 			    SNDRV_PCM_FMTBIT_S20_3LE |
-			    SNDRV_PCM_FMTBIT_S24_LE),
+			    SNDRV_PCM_FMTBIT_S24_LE |
+			    SNDRV_PCM_FMTBIT_S32_LE),
 	},
 	.ops = &rk_spdif_dai_ops,
 };
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index fcc28b6c4f58..acf64986a2e0 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -17,6 +17,14 @@
 #define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
 #define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
 
+#define SPDIF_CFGR_CLR_MASK		BIT(7)
+#define SPDIF_CFGR_CLR_EN		BIT(7)
+#define SPDIF_CFGR_CLR_DIS		0
+
+#define SPDIF_CFGR_ADJ_MASK		BIT(3)
+#define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
+#define SPDIF_CFGR_ADJ_RIGHT_J		0
+
 #define SPDIF_CFGR_HALFWORD_SHIFT	2
 #define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)
 #define SPDIF_CFGR_HALFWORD_ENABLE	(1 << SPDIF_CFGR_HALFWORD_SHIFT)

-- 
2.51.0


