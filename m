Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5187CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWnGuIDH8coFdp7LkOu+vl1fCvswvcymwLh9fcmP7Yc=; b=FYsVCLuw9vcvi6rf4krvftFNLR
	zTyTRNUyF2s0egEE1PGRG5uNqev0STq+SzfzKu2QD8qcF+9vMl5sAJ8AkRzUXUocJvwhJBlmuNGW9
	HQujf7eeN3BMMQk9zInuO0oABm1v8N0naIDN6fxLI1TqHmI2zuQfsPswk3qSI88zl6G+yKJy99IqZ
	pg6cU6YOQuENco2TEEDlo02nZQxviY9pCiHvnCqHOsZ1862fht+EzuAzw1DK/riLUFaU6GX3yBgKD
	7uSa4UKbacfZxauuvxRgdMoZNGcWwXNJsLGu461jpPiSkxyXnoNiCXSTK9LFssQpqdu0ODeSLFviE
	oC0/ncBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZojC-0000000HG9I-1lV4;
	Wed, 17 Jun 2026 11:46:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZojA-0000000HG7u-2Gzr;
	Wed, 17 Jun 2026 11:46:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781696789; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AFMJi1DswncZUEWEYB44nFn/u1aEnd/CKzHVYPzjDw+3pD+u9u8+LPA/hpSWeZ7LFmOAqZ+GkK09juJzCWy80DLkrz0kuIM2fu14CqbjIdTClZhlOrQ8W73b2OVyKVL65HeU5EgUPYR2zZ8hGE7l3rx4X1WEns3hwHwF+HQPICY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781696789; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rWnGuIDH8coFdp7LkOu+vl1fCvswvcymwLh9fcmP7Yc=; 
	b=DEtM+S5Rd4Sdf7QF4nggrer3dAsoOYhwum7upYBnUOZzaNCYEMGYSGwcPygwdNvFh7T3R77Y2KoYj1LUAsB9NBBow9XxT0Cye2P18JUOUtrUnaGTvPeNievb4E/GA9au3Jfee0UKSn5fppwQNnbsRV1De5dTzXuKbhRG7Xcvabk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781696789;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=rWnGuIDH8coFdp7LkOu+vl1fCvswvcymwLh9fcmP7Yc=;
	b=P096ENKawLnG2ujh/TmnuwXb3mwAJ2W+cpDpFqEkI2dqQG2FNXlSFZn9nD6S2BXa
	ytyGoMMikmchnZ2J8l+2Id/KOQbuRs0VmrGexLShy5qzAhsTx3m4UP/1u9DkW0wHb0W
	+r+mX68K4pUb0PhXi54/1RzXLEY1yR4Z/BBT9Q5k=
Received: by mx.zohomail.com with SMTPS id 178169678637923.794530340782558;
	Wed, 17 Jun 2026 04:46:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Jun 2026 13:46:04 +0200
Subject: [PATCH] Revert "ASoC: rockchip: rockchip_sai: Use guard() for spin
 locks"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0JmbSPtoghXMSzaMugYS3WmEBLC3
 a3i8iXvv7+BIBMKdNUGjAsJpamAPlUQ7m66oaKhMJja2NrqRokjVUTkrC5j451uW2uChzJ4MY6
 0/mLX/mCZ/QND/hb+BuN7Li/50MA7QRVSjJS7Kide3HOQc3SSkaHf9w8Ka1ccoQAAAA==
X-Change-ID: 20260617-sai-revert-8f7ba19962cb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: bui duc phuc <phucduc.bui@gmail.com>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_044640_653465_5EB6F19B 
X-CRM114-Status: GOOD (  19.19  )
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

This reverts commit f7fe9f7073602958d6b63cc58a144094533377fa.

This is very noisy pointless churn that was not tested by the submitter,
nor was it addressed to the driver's maintainer. It mixes unrelated
whitespace changes (eliminating the blank line between the includes -
why?) with hard to review diffs that add a whole indentation level to
the function for no benefit, while also not following kernel code style
by doing stuff like "ret == 0".

The driver is better off without these changes, and they're not worth
the time to validate whether they really do make no functional changes.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 sound/soc/rockchip/rockchip_sai.c | 262 +++++++++++++++++++-------------------
 1 file changed, 133 insertions(+), 129 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..ed393e5034a4 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -18,6 +18,7 @@
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/tlv.h>
+
 #include "rockchip_sai.h"
 
 #define DRV_NAME		"rockchip-sai"
@@ -215,12 +216,14 @@ static void rockchip_sai_xfer_clk_stop_and_wait(struct rk_sai_dev *sai, unsigned
 static int rockchip_sai_runtime_suspend(struct device *dev)
 {
 	struct rk_sai_dev *sai = dev_get_drvdata(dev);
+	unsigned long flags;
 
 	rockchip_sai_fsync_lost_detect(sai, 0);
 	rockchip_sai_fsync_err_detect(sai, 0);
 
-	scoped_guard(spinlock_irqsave, &sai->xfer_lock)
-		rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
+	spin_lock_irqsave(&sai->xfer_lock, flags);
+	rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
+	spin_unlock_irqrestore(&sai->xfer_lock, flags);
 
 	regcache_cache_only(sai->regmap, true);
 	/*
@@ -480,6 +483,7 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
 	unsigned int clk_gates;
+	unsigned long flags;
 	int ret = 0;
 
 	pm_runtime_get_sync(dai->dev);
@@ -495,56 +499,56 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		sai->is_master_mode = false;
 		break;
 	default:
-		pm_runtime_put(dai->dev);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
-	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
-		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-		if (sai->initialized) {
-			if (sai->has_capture && sai->has_playback)
-				rockchip_sai_xfer_stop(sai, -1);
-			else if (sai->has_capture)
-				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
-			else
-				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
-		} else {
-			rockchip_sai_clear(sai, 0);
-			sai->initialized = true;
-		}
+	spin_lock_irqsave(&sai->xfer_lock, flags);
+	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+	if (sai->initialized) {
+		if (sai->has_capture && sai->has_playback)
+			rockchip_sai_xfer_stop(sai, -1);
+		else if (sai->has_capture)
+			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
+		else
+			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
+	} else {
+		rockchip_sai_clear(sai, 0);
+		sai->initialized = true;
+	}
 
-		regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
-
-		mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
-		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-		case SND_SOC_DAIFMT_NB_NF:
-			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
-			break;
-		case SND_SOC_DAIFMT_NB_IF:
-			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
-			break;
-		case SND_SOC_DAIFMT_IB_NF:
-			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
-			break;
-		case SND_SOC_DAIFMT_IB_IF:
-			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
-			break;
-		default:
-			ret = -EINVAL;
-			break;
-		}
+	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
 
-		if (ret == 0) {
-			regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
-			rockchip_sai_fmt_create(sai, fmt);
-		}
-
-		if (clk_gates)
-			regmap_update_bits(sai->regmap, SAI_XFER,
-					SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-					clk_gates);
+	mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_xfer_unlock;
 	}
 
+	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+
+	rockchip_sai_fmt_create(sai, fmt);
+
+err_xfer_unlock:
+	if (clk_gates)
+		regmap_update_bits(sai->regmap, SAI_XFER,
+				SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+				clk_gates);
+	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+err_pm_put:
 	pm_runtime_put(dai->dev);
 
 	return ret;
@@ -560,6 +564,7 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int ch_per_lane, slot_width;
 	unsigned int val, fscr, reg;
 	unsigned int lanes, req_lanes;
+	unsigned long flags;
 	int ret = 0;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
@@ -586,8 +591,8 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 			dev_err(sai->dev, "not enough lanes (%d) for requested number of %s channels (%d)\n",
 				lanes, reg == SAI_TXCR ? "playback" : "capture",
 				params_channels(params));
-			pm_runtime_put(sai->dev);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_pm_put;
 		} else {
 			lanes = req_lanes;
 		}
@@ -613,88 +618,84 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 		val = SAI_XCR_VDW(32);
 		break;
 	default:
-		pm_runtime_put(sai->dev);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	val |= SAI_XCR_CSR(lanes);
 
-	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
+	spin_lock_irqsave(&sai->xfer_lock, flags);
+
+	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
 
-		regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
+	if (!sai->is_tdm)
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(params_physical_width(params)));
 
-		if (!sai->is_tdm)
-			regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
-					   SAI_XCR_SBW(params_physical_width(params)));
+	regmap_read(sai->regmap, reg, &val);
 
-		regmap_read(sai->regmap, reg, &val);
+	slot_width = SAI_XCR_SBW_V(val);
+	ch_per_lane = params_channels(params) / lanes;
 
-		slot_width = SAI_XCR_SBW_V(val);
-		ch_per_lane = params_channels(params) / lanes;
+	regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
+			   SAI_XCR_SNB(ch_per_lane));
 
-		regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
-				   SAI_XCR_SNB(ch_per_lane));
+	fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
 
-		fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
+	switch (sai->fpw) {
+	case FPW_ONE_BCLK_WIDTH:
+		fscr |= SAI_FSCR_FPW(1);
+		break;
+	case FPW_ONE_SLOT_WIDTH:
+		fscr |= SAI_FSCR_FPW(slot_width);
+		break;
+	case FPW_HALF_FRAME_WIDTH:
+		fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
+		break;
+	default:
+		dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
+		ret = -EINVAL;
+		goto err_xfer_unlock;
+	}
 
-		switch (sai->fpw) {
-		case FPW_ONE_BCLK_WIDTH:
-			fscr |= SAI_FSCR_FPW(1);
-			break;
-		case FPW_ONE_SLOT_WIDTH:
-			fscr |= SAI_FSCR_FPW(slot_width);
-			break;
-		case FPW_HALF_FRAME_WIDTH:
-			fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
-			break;
-		default:
-			dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
+	regmap_update_bits(sai->regmap, SAI_FSCR,
+			   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
+
+	if (sai->is_master_mode) {
+		bclk_rate = sai->fw_ratio * slot_width * ch_per_lane * params_rate(params);
+		ret = clk_set_rate(sai->mclk, sai->mclk_rate);
+		if (ret) {
+			dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
+				sai->mclk_rate, ERR_PTR(ret));
+			goto err_xfer_unlock;
+		}
+
+		mclk_rate = clk_get_rate(sai->mclk);
+		if (mclk_rate < bclk_rate) {
+			dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
+				mclk_rate, bclk_rate);
 			ret = -EINVAL;
-			break;
+			goto err_xfer_unlock;
 		}
 
-		if (ret == 0) {
-			regmap_update_bits(sai->regmap, SAI_FSCR,
-					   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
-
-			if (sai->is_master_mode) {
-				bclk_rate = sai->fw_ratio * slot_width *
-						ch_per_lane * params_rate(params);
-				ret = clk_set_rate(sai->mclk, sai->mclk_rate);
-				if (ret)
-					dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
-						sai->mclk_rate, ERR_PTR(ret));
-				else {
-					mclk_rate = clk_get_rate(sai->mclk);
-					if (mclk_rate < bclk_rate) {
-						dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
-							mclk_rate, bclk_rate);
-						ret = -EINVAL;
-					} else {
-
-						div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
-						mclk_req_rate = bclk_rate * div_bclk;
-
-						if (mclk_rate <
-							mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
-						    mclk_rate >
-							mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
-							dev_err(sai->dev,
-								"Mismatch mclk: %u, expected %u (+/- %dHz)\n",
-								mclk_rate, mclk_req_rate,
-								CLK_SHIFT_RATE_HZ_MAX);
-							ret = -EINVAL;
-						} else
-							regmap_update_bits(sai->regmap,
-									SAI_CKR,
-									SAI_CKR_MDIV_MASK,
-									SAI_CKR_MDIV(div_bclk));
-					}
-				}
-			}
+		div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
+		mclk_req_rate = bclk_rate * div_bclk;
+
+		if (mclk_rate < mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
+		    mclk_rate > mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
+			dev_err(sai->dev, "Mismatch mclk: %u, expected %u (+/- %dHz)\n",
+				mclk_rate, mclk_req_rate, CLK_SHIFT_RATE_HZ_MAX);
+			ret = -EINVAL;
+			goto err_xfer_unlock;
 		}
+
+		regmap_update_bits(sai->regmap, SAI_CKR, SAI_CKR_MDIV_MASK,
+				   SAI_CKR_MDIV(div_bclk));
 	}
 
+err_xfer_unlock:
+	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+err_pm_put:
 	pm_runtime_put(sai->dev);
 
 	return ret;
@@ -704,6 +705,7 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
+	unsigned long flags;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
 		return 0;
@@ -724,12 +726,13 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 		 * udelay falls short.
 		 */
 		udelay(20);
-		scoped_guard(spinlock_irqsave, &sai->xfer_lock)
-			regmap_update_bits(sai->regmap, SAI_XFER,
-					   SAI_XFER_CLK_MASK |
-					   SAI_XFER_FSS_MASK,
-					   SAI_XFER_CLK_EN |
-					   SAI_XFER_FSS_EN);
+		spin_lock_irqsave(&sai->xfer_lock, flags);
+		regmap_update_bits(sai->regmap, SAI_XFER,
+				   SAI_XFER_CLK_MASK |
+				   SAI_XFER_FSS_MASK,
+				   SAI_XFER_CLK_EN |
+				   SAI_XFER_FSS_EN);
+		spin_unlock_irqrestore(&sai->xfer_lock, flags);
 	}
 
 	rockchip_sai_fsync_lost_detect(sai, 1);
@@ -912,6 +915,7 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 				     int slots, int slot_width)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
+	unsigned long flags;
 	unsigned int clk_gates;
 	int sw = slot_width;
 
@@ -927,16 +931,16 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	pm_runtime_get_sync(dai->dev);
-	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
-		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-		regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
-				   SAI_XCR_SBW(sw));
-		regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
-				   SAI_XCR_SBW(sw));
-		regmap_update_bits(sai->regmap, SAI_XFER,
-				   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-				   clk_gates);
-	}
+	spin_lock_irqsave(&sai->xfer_lock, flags);
+	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+	regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
+			   SAI_XCR_SBW(sw));
+	regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
+			   SAI_XCR_SBW(sw));
+	regmap_update_bits(sai->regmap, SAI_XFER,
+			   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+			   clk_gates);
+	spin_unlock_irqrestore(&sai->xfer_lock, flags);
 	pm_runtime_put(dai->dev);
 
 	return 0;

---
base-commit: 5b33fc6492a7b7a62359157db0f92f5b6e9af690
change-id: 20260617-sai-revert-8f7ba19962cb

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


