Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A420ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKUwYRq411Fq4Xkzy3EUVsGEYUhUD2Bh/DLagwG0Hb0=; b=kozdx6acf7FhGbkX8JvAqCMpLh
	WnvwwX4/Xkj8YZSUZO/SzOJXyyoeK5FFE5KUSXGTZwtywYwTGXl9d/ShM0fitbrTNIWdA6Pf8C1hw
	unIZRx2Hoza75x8gGY0HOjLO8R0+d5UDNzsiszKmNf63FBQSiuGfRAMpI7sUM67lV1cftgBf4lovT
	nAs029ni4cFY7c1ANzwDhet7H6JcsrtfUM49laE8ha1SdWJOzyWfspZlrlrPLKwRDPKuEnLVWYLCq
	jSpCGIXAiZH5EJn6XBiaAQxZPT/DJ/b7AxoY/A6vVLtzJks6cNjY9eUR5BtAA6lFCiZ//Ji/9Hka5
	g+PzC5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckm-0000000EDt9-2ihw;
	Wed, 03 Jun 2026 03:58:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckk-0000000EDqY-0Btf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:58:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf114b0cf9so34577785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459129; x=1781063929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKUwYRq411Fq4Xkzy3EUVsGEYUhUD2Bh/DLagwG0Hb0=;
        b=HGpm4azabLngfFs+pGqLf/L9JRb6qot8BeVvU40Pct48dBM2c257YACNc0r8zjHDD4
         J4TJp8vO5IBCg+kixxlNcEnhH1OnavpICBBNM9DdQzMMIY/1v4AmgXA7aFKrg0JFgXef
         bIQHOt4dwY4IRFRy1XcxgyzZ9pvsg/sgcKX8ps0d0jp9TRu4M/X1me+m14Bq7wIKCDH9
         9lA7/hWtYQGZ5quPltxEL6WV887wmZQj1wPmbNMrR982mUobAG7M6QML83io7vxtX/Wm
         PptKZ8lJtTDpEAvIR/PyBkkuDkopt7Vq8Bgu4NkmHYlAHVtShqaMr+JCXxE4CXQ+ub81
         N2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459129; x=1781063929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKUwYRq411Fq4Xkzy3EUVsGEYUhUD2Bh/DLagwG0Hb0=;
        b=rRCTTNCpt5mcmoS6HtnaGDaVzODENgegsr3YwUGOxkE0by+Zv0Xga5xMhDMU9c0eYz
         oVibdSYlaPWawHq7tIV9QD4o/aoUIdrU3aEmFz5WwtySHQrYMniu4dPqpaWfmT6IjvHX
         AjeknwsITI8GLxfbVLV3q3vIhx6yyho1hFf0+Po25r9UEXfkDRs27j6jB6IK3msZoYPa
         jdIVxF8eIkIDaoEkvqLBs4QkXVULtPhu/uXTgGR0DOkCXqmvO9ffEfTmeqMiJJgmMOoc
         7LiVj9bzBTwSdemXH2tXOYTTOcXT2LqEwfJahJw+KOSzJL+XtFmbTTcgBj1ha5uFUY9C
         JsYg==
X-Forwarded-Encrypted: i=1; AFNElJ82TfyKAxjRof6XJEnBOW00GgExOO1NS68Yr79dlDsKchQMXn1u8G3hAkZud4Qm+425HNjAD/JvaPbjk5LIaXhQ@lists.infradead.org
X-Gm-Message-State: AOJu0YweomuZiR3q/FL1ljJTRhAggwZa+vPj0tyuxHvA3IcA5gjOKqhY
	XvJIED+spNBpLg5O1O64mQfupujQVEhYqaHyVNRT9RRfv0+Yrkmi7QLK
X-Gm-Gg: Acq92OG3W4fF6xc48g+nVewRZuGj97fWriPjbkVFG4tsJWUFNblv2kP2Z0pqbEhjLs+
	LejXc5nAAjfZDrMsxipVLUrEEOi/cTwE0jECutNsfQ9WgbOxyVKxB2ZZ3Xw/XjfvQXLUsrEu0QO
	cozNYlcnKsUAnP02lH2FpyjwBZDItSVfQLvN6DUyFB/KiOwQZs7K1YIe+0fp68ndQ1i36fSr+38
	06rXaiCySsW023oWRHlHeZUfxmdId3gD2RW6dG6XO7qIjuDG8Gzvy2wIHVuO5TPo3CafyWpoJ6I
	19c+xdDkZkl5hRoJz2uhb8UHyc46PJ7G0jcTc60Q76kMkkNzoDriyLSTsn6YV7DsEVJJf3E6sxn
	t9GivXaK5JQyeBqxoShCxq1TjFMFot4VEl8cQovsDXzm128R9S27Zu/1AJhWzUfy0F4d0pWWE+2
	BUeFbk/Gdb1GbqQ4hwoxsvpPCoAnFRJ7iIi7CNplefEDy++MForWgkrKnTGGJCMGmRrYrdq0Blk
	gdBBxg=
X-Received: by 2002:a17:903:240b:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c163a2cca5mr15715565ad.11.1780459129060;
        Tue, 02 Jun 2026 20:58:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:41 +0700
Message-ID: <20260603035741.68893-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603035741.68893-1-phucduc.bui@gmail.com>
References: <20260603035741.68893-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_205850_104087_07F61135 
X-CRM114-Status: GOOD (  19.83  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_sai.c | 258 +++++++++++++++---------------
 1 file changed, 127 insertions(+), 131 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index ed393e5034a4..9104f4dedb15 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -18,7 +18,6 @@
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/tlv.h>
-
 #include "rockchip_sai.h"
 
 #define DRV_NAME		"rockchip-sai"
@@ -216,14 +215,12 @@ static void rockchip_sai_xfer_clk_stop_and_wait(struct rk_sai_dev *sai, unsigned
 static int rockchip_sai_runtime_suspend(struct device *dev)
 {
 	struct rk_sai_dev *sai = dev_get_drvdata(dev);
-	unsigned long flags;
 
 	rockchip_sai_fsync_lost_detect(sai, 0);
 	rockchip_sai_fsync_err_detect(sai, 0);
 
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock)
+		rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
 
 	regcache_cache_only(sai->regmap, true);
 	/*
@@ -483,7 +480,6 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
 	unsigned int clk_gates;
-	unsigned long flags;
 	int ret = 0;
 
 	pm_runtime_get_sync(dai->dev);
@@ -499,56 +495,56 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		sai->is_master_mode = false;
 		break;
 	default:
-		ret = -EINVAL;
-		goto err_pm_put;
-	}
-
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-	if (sai->initialized) {
-		if (sai->has_capture && sai->has_playback)
-			rockchip_sai_xfer_stop(sai, -1);
-		else if (sai->has_capture)
-			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
-		else
-			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
-	} else {
-		rockchip_sai_clear(sai, 0);
-		sai->initialized = true;
+		pm_runtime_put(dai->dev);
+		return -EINVAL;
 	}
 
-	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
+		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+		if (sai->initialized) {
+			if (sai->has_capture && sai->has_playback)
+				rockchip_sai_xfer_stop(sai, -1);
+			else if (sai->has_capture)
+				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
+			else
+				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
+		} else {
+			rockchip_sai_clear(sai, 0);
+			sai->initialized = true;
+		}
 
-	mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
-		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
-		break;
-	default:
-		ret = -EINVAL;
-		goto err_xfer_unlock;
-	}
+		regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+
+		mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
+		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+		case SND_SOC_DAIFMT_NB_NF:
+			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
+			break;
+		case SND_SOC_DAIFMT_NB_IF:
+			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
+			break;
+		case SND_SOC_DAIFMT_IB_NF:
+			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
+			break;
+		case SND_SOC_DAIFMT_IB_IF:
+			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
 
-	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+		if (ret == 0) {
+			regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+			rockchip_sai_fmt_create(sai, fmt);
+		}
 
-	rockchip_sai_fmt_create(sai, fmt);
+		if (clk_gates)
+			regmap_update_bits(sai->regmap, SAI_XFER,
+					SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+					clk_gates);
+	}
 
-err_xfer_unlock:
-	if (clk_gates)
-		regmap_update_bits(sai->regmap, SAI_XFER,
-				SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-				clk_gates);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
-err_pm_put:
 	pm_runtime_put(dai->dev);
 
 	return ret;
@@ -564,7 +560,6 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int ch_per_lane, slot_width;
 	unsigned int val, fscr, reg;
 	unsigned int lanes, req_lanes;
-	unsigned long flags;
 	int ret = 0;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
@@ -618,84 +613,88 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 		val = SAI_XCR_VDW(32);
 		break;
 	default:
-		ret = -EINVAL;
-		goto err_pm_put;
+		pm_runtime_put(sai->dev);
+		return -EINVAL;
 	}
 
 	val |= SAI_XCR_CSR(lanes);
 
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-
-	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
-
-	if (!sai->is_tdm)
-		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
-				   SAI_XCR_SBW(params_physical_width(params)));
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
 
-	regmap_read(sai->regmap, reg, &val);
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
 
-	slot_width = SAI_XCR_SBW_V(val);
-	ch_per_lane = params_channels(params) / lanes;
+		if (!sai->is_tdm)
+			regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
+					   SAI_XCR_SBW(params_physical_width(params)));
 
-	regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
-			   SAI_XCR_SNB(ch_per_lane));
+		regmap_read(sai->regmap, reg, &val);
 
-	fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
-
-	switch (sai->fpw) {
-	case FPW_ONE_BCLK_WIDTH:
-		fscr |= SAI_FSCR_FPW(1);
-		break;
-	case FPW_ONE_SLOT_WIDTH:
-		fscr |= SAI_FSCR_FPW(slot_width);
-		break;
-	case FPW_HALF_FRAME_WIDTH:
-		fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
-		break;
-	default:
-		dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
-		ret = -EINVAL;
-		goto err_xfer_unlock;
-	}
+		slot_width = SAI_XCR_SBW_V(val);
+		ch_per_lane = params_channels(params) / lanes;
 
-	regmap_update_bits(sai->regmap, SAI_FSCR,
-			   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
+				   SAI_XCR_SNB(ch_per_lane));
 
-	if (sai->is_master_mode) {
-		bclk_rate = sai->fw_ratio * slot_width * ch_per_lane * params_rate(params);
-		ret = clk_set_rate(sai->mclk, sai->mclk_rate);
-		if (ret) {
-			dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
-				sai->mclk_rate, ERR_PTR(ret));
-			goto err_xfer_unlock;
-		}
+		fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
 
-		mclk_rate = clk_get_rate(sai->mclk);
-		if (mclk_rate < bclk_rate) {
-			dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
-				mclk_rate, bclk_rate);
+		switch (sai->fpw) {
+		case FPW_ONE_BCLK_WIDTH:
+			fscr |= SAI_FSCR_FPW(1);
+			break;
+		case FPW_ONE_SLOT_WIDTH:
+			fscr |= SAI_FSCR_FPW(slot_width);
+			break;
+		case FPW_HALF_FRAME_WIDTH:
+			fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
+			break;
+		default:
+			dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
 			ret = -EINVAL;
-			goto err_xfer_unlock;
+			break;
 		}
 
-		div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
-		mclk_req_rate = bclk_rate * div_bclk;
-
-		if (mclk_rate < mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
-		    mclk_rate > mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
-			dev_err(sai->dev, "Mismatch mclk: %u, expected %u (+/- %dHz)\n",
-				mclk_rate, mclk_req_rate, CLK_SHIFT_RATE_HZ_MAX);
-			ret = -EINVAL;
-			goto err_xfer_unlock;
+		if (ret == 0) {
+			regmap_update_bits(sai->regmap, SAI_FSCR,
+					   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
+
+			if (sai->is_master_mode) {
+				bclk_rate = sai->fw_ratio * slot_width *
+						ch_per_lane * params_rate(params);
+				ret = clk_set_rate(sai->mclk, sai->mclk_rate);
+				if (ret)
+					dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
+						sai->mclk_rate, ERR_PTR(ret));
+				else {
+					mclk_rate = clk_get_rate(sai->mclk);
+					if (mclk_rate < bclk_rate) {
+						dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
+							mclk_rate, bclk_rate);
+						ret = -EINVAL;
+					} else {
+
+						div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
+						mclk_req_rate = bclk_rate * div_bclk;
+
+						if (mclk_rate <
+							mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
+						    mclk_rate >
+							mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
+							dev_err(sai->dev,
+								"Mismatch mclk: %u, expected %u (+/- %dHz)\n",
+								mclk_rate, mclk_req_rate,
+								CLK_SHIFT_RATE_HZ_MAX);
+							ret = -EINVAL;
+						} else
+							regmap_update_bits(sai->regmap,
+									SAI_CKR,
+									SAI_CKR_MDIV_MASK,
+									SAI_CKR_MDIV(div_bclk));
+					}
+				}
+			}
 		}
-
-		regmap_update_bits(sai->regmap, SAI_CKR, SAI_CKR_MDIV_MASK,
-				   SAI_CKR_MDIV(div_bclk));
 	}
 
-err_xfer_unlock:
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
-err_pm_put:
 	pm_runtime_put(sai->dev);
 
 	return ret;
@@ -705,7 +704,6 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
-	unsigned long flags;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
 		return 0;
@@ -726,13 +724,12 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 		 * udelay falls short.
 		 */
 		udelay(20);
-		spin_lock_irqsave(&sai->xfer_lock, flags);
-		regmap_update_bits(sai->regmap, SAI_XFER,
-				   SAI_XFER_CLK_MASK |
-				   SAI_XFER_FSS_MASK,
-				   SAI_XFER_CLK_EN |
-				   SAI_XFER_FSS_EN);
-		spin_unlock_irqrestore(&sai->xfer_lock, flags);
+		scoped_guard(spinlock_irqsave, &sai->xfer_lock)
+			regmap_update_bits(sai->regmap, SAI_XFER,
+					   SAI_XFER_CLK_MASK |
+					   SAI_XFER_FSS_MASK,
+					   SAI_XFER_CLK_EN |
+					   SAI_XFER_FSS_EN);
 	}
 
 	rockchip_sai_fsync_lost_detect(sai, 1);
@@ -915,7 +912,6 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 				     int slots, int slot_width)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
-	unsigned long flags;
 	unsigned int clk_gates;
 	int sw = slot_width;
 
@@ -931,16 +927,16 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	pm_runtime_get_sync(dai->dev);
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-	regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
-			   SAI_XCR_SBW(sw));
-	regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
-			   SAI_XCR_SBW(sw));
-	regmap_update_bits(sai->regmap, SAI_XFER,
-			   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-			   clk_gates);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
+		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+		regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(sw));
+		regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(sw));
+		regmap_update_bits(sai->regmap, SAI_XFER,
+				   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+				   clk_gates);
+	}
 	pm_runtime_put(dai->dev);
 
 	return 0;
-- 
2.43.0


