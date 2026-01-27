Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D92BD3409E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOhRdmfl+RcJte6KwjJ2pWlutqOTijx6zPHeINAJBL0=; b=oEdc+DNrVd5zZhLimRJEWhjVQ7
	kW/V0r485S+00wfQEXBtLCZ0dDB5WT6N0wDX0cflrfZVWXZzheySnNHyshUg1idHVqMKYK5IZ3Lgc
	OM0CgVd0kDLP53G2IG9A5bLw6VC1mHQHckrmADt6TZASnTYcnwMZZNMe/8B6qzRqqXOAvamsk3KU2
	9ep2zt/sSn8G1yMg/Yv/kMe/fOs3Wuw9+fdqjeAq2Zw/BYtc0jHJ+RnGntCmGc2MDTRLEcuL+GYQy
	uec6a0xUScZDl+7YHHzDUuUw5uQuvdW6r6zYkCLg6c7BubXLc88RBTFyujU4Zl18yf6uj6L8AjVn/
	1+L7zSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklco-0000000Ec8h-3knX;
	Tue, 27 Jan 2026 16:09:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcd-0000000Ec0A-1oTo;
	Tue, 27 Jan 2026 16:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=ZkYfC6duc4bUhSQdw6hDQFgF5OjCNUVsbKwgm9O0VTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UxUsD3AtphZ6XhEwpd+c0jnsK8uHlqLLchrmR5KQ0N3ACLPfztV5uQZNWW+i4IEjs
	 UvpjOgEE4WqXCuxfe45EWqZ+t6mlF5WDIRwJ11g3NJrySPTvfRgJwZBTthcZ7j9W5c
	 X6AIFp5vPspVajirhkqmqQXezYun1/QWmA1ZHbYSvj+Cd6YT58L1cjT5tncINVkg8l
	 lsPM0t9ECzlgRSHQtikuXKfFJqEodSxdLG/umcbIuy5lM5TgYKwyOO90pU/3S8ZoCH
	 9tTDzE0N2r27+m3/oDvejVLtaI6JrgzJSOo9lTADm2vf8XsTFJMLzUjCl3eM8V+saB
	 FQKx2crK071jg==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E70A517E151C;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3B6D2480065; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:27 +0100
Subject: [PATCH 07/10] ASoC: rockchip: spdif: Add support for set mclk rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-7-a7c547072bbb@collabora.com>
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
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+Y4VwKdyUFJF0hJYIqqEATW6JI13QJ4cOJ751oD6NdI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xHWkH++fRqe4XrooNhXaLC7HzhfrgUD+
 2UshGN3quDUPYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMRAAoJENju1/PI
 O/qacgoP/098DON1WSwaqzcFi+tA0sOpG2JjKGAKxYy9DtTPSyZ/SHWwpyRSWYWRXVw5vFs6GXF
 BTJSkBGX7NPaI1KEe25LNVweWvg7zpin1Q7Gd/1BcTF2SBQIxECbLtCIeiDAj6rt1v1dU+w7Opz
 ZnsSbS4PucCjWtMEUIuKHEzeHThA1kCSCEx2TUnnPXsyUASRILsuWpwfQO1TWNoRHA7P8G9VO5T
 5obDmGfwprOC5cBX9pV9SbchI2VnNCjcQ7mwLP5D/b/BITK9a1qXhSRu0LYw8cexsZ8GLnH4udj
 GWK31+6dZnBXAMo5npiJXCpGujDn4/Ltp3v6LP04XzlBy0rXtG5RCOANGTXo7Wd+klNKLBRPMZl
 hohEhVym7V/wsPTc12yXAVPmlMojo5qgUummfSJMn78zkQsPlo1LiRkLGzj8RRiQGdkpTD5mznh
 ApynfTi3YavU9g1srmBxt13qnaYkT7c1EOY0aQ9QtLDQaBGXZE+MFqEW/gMgD2zWA8G7zu6Nhhr
 kUDlJbb/XATVK+r9BNKZ7v/WH+zigcrBPQqbIJk7+0hqM7VGxZ6f5q+hYdlVQ/Vo/++JbLCdtvS
 /q1MS+qvjpKVcQs1ooLVWSs/oh1Khzvw4x1d5CT+QgAT4lcHpcydwJ4rIDFyS/voXXW4DnXU6Hd
 T6BvpzxPs1OMgrALGwAosUA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080855_633245_FD017C08 
X-CRM114-Status: GOOD (  16.65  )
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

Allow setting the mclk rate from the machine driver.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 34 +++++++++++++++++++++++-----------
 sound/soc/rockchip/rockchip_spdif.h |  2 +-
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 1a3b0a8e556c..8cf54470f931 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -86,12 +86,15 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
 	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
-	int srate, mclk;
+	int bmc, div;
 	int ret;
 
-	srate = params_rate(params);
-	mclk = srate * 128;
+	/* bmc = 128fs */
+	bmc = 128 * params_rate(params);
+	div = DIV_ROUND_CLOSEST(mclk_rate, bmc);
+	val |= SPDIF_CFGR_CLK_DIV(div);
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -107,14 +110,6 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* Set clock and calculate divider */
-	ret = clk_set_rate(spdif->mclk, mclk);
-	if (ret != 0) {
-		dev_err(spdif->dev, "Failed to set module clock rate: %d\n",
-			ret);
-		return ret;
-	}
-
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
 				 SPDIF_CFGR_HALFWORD_ENABLE |
@@ -177,7 +172,24 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static int rk_spdif_set_sysclk(struct snd_soc_dai *dai,
+			       int clk_id, unsigned int freq, int dir)
+{
+	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	if (!freq)
+		return 0;
+
+	ret = clk_set_rate(spdif->mclk, freq);
+	if (ret)
+		dev_err(spdif->dev, "Failed to set mclk: %d\n", ret);
+
+	return ret;
+}
+
 static const struct snd_soc_dai_ops rk_spdif_dai_ops = {
+	.set_sysclk = rk_spdif_set_sysclk,
 	.probe = rk_spdif_dai_probe,
 	.hw_params = rk_spdif_hw_params,
 	.trigger = rk_spdif_trigger,
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index d8be9aae5b19..fcc28b6c4f58 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -15,7 +15,7 @@
 */
 #define SPDIF_CFGR_CLK_DIV_SHIFT	(16)
 #define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
-#define SPDIF_CFGR_CLK_DIV(x)		(x << SPDIF_CFGR_CLK_DIV_SHIFT)
+#define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
 
 #define SPDIF_CFGR_HALFWORD_SHIFT	2
 #define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)

-- 
2.51.0


