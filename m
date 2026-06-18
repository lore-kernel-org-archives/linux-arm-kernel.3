Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45892CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=; b=U8saMuR9+wCwuEM++SMjdKFqrh
	KV+GsqpjwzDeeJWxcTgKU9E1HxkFCAux0i3tnIpQcoUnhLG8bQfqqZxOZjsPWvHEnENr840JvMTFW
	OstRnuIT4qLUN2iOQaI1aNZLAhzHZmeryrJpgd06E1WTRndChvBZMFI1Tc3XaZlIlrXZuVV+40WFs
	y+gnaFkjE3pKyootULqWOhQQHJ9bNWxooFi/wPY9pkNpZ9qlti1mSPQ4p4g+61WBhKEhcPSn5Ll7L
	Vzbu+sGh5RGbmRIVOBWuvoaJ7Z1iBrGNEAPr0be31DhoSK4kO7K4cda7h6h67PfpdbjFT0fDTuqRG
	C7F6b9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdL-000000019gL-0h4E;
	Thu, 18 Jun 2026 11:10:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdH-000000019dg-3WuT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c40397e746so5401455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781003; x=1782385803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=tNnmmymnQwCH1vkfkPcVYSAfZLWsS98V7r0I+4gHksLlrckgZ3JmVKBzjkjSYeMaln
         hnmaqIj1kaRrjUiAHsexo6glXSP0DRPqcp5o00zBG6jJe92vgQiRuhrfyEhLeEfzmHDo
         aR38KcUBssngcAr9Lsgr7OShHe71fqIoBtILhJKuv8R6gH7Z1VXwuiUfBXMMvy5bae/0
         P+QYptUwS25HKIyZ0fq1DE05hbMO6G0Gcqe3znCeETmchJr1tEpxXlFzZjk7hpqP45KA
         /3GEfD1+WPdZ+TzYnz6mv9o/OQVPOj8lzRsa30B0KMkgiBUElpr95b8kgRMhDT50tulY
         IrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781003; x=1782385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=PAJCHOkTwsuj2rmJw9daB5PAerxfLylBWmeUVbEnp30erPOQJd90AbubQfna4U/hQg
         RcA07MnqjamfHhJtBLacERO2hZesAkTX5tGOOa1pdeZBIQUbBrK5/BgXrj6oBhT8Dvhj
         eO8TQ7QEtW/8uJKZuxvGy94uxlpHbknweHr05Nqk4nCLOPp+GFtdYrPaJ0gPNt+yBpXJ
         OLPgP65zLXk8A8nuQQcEO/jSqLmTj7x5WyvEn/k6tql/AgeicEffbn7aOuRhKZ3VZh7e
         YwDS/v3MsLHj/V1NF4XKtW5kWY9CMOoT9P0WkUT9egtk+rb95UVC2aCsGJ62H1xFerwV
         KjAg==
X-Forwarded-Encrypted: i=1; AFNElJ/pvcZPBzzQAYhrmJ507HyNgLkHK6r4Fxks3LmJjSM2aJ7UeW3FZ60QugwkXPzN7p03aFX+GzN0MrB2qxpnUAi+@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfOhuemOIpQy4uvN2jgz7jUvXS+GdBOC8YPyeoZTu3fv9fRMN
	Z7eC56eXi4WDf7uF7mD/RE08hEJnNCntTb5Ld/f71Z2IkoYEgtnAGUs3
X-Gm-Gg: AfdE7cl/L7Ea6n3PqWGIESqgQbQrG+VM97Om0Fb+Nx6aY8sBHR6cA5sgjO8ggfSnfbI
	wiAEUAowufPcBdVJ7ZTkSF7gyCpF75Qg9TZ4qO7NszxKf6lfNDK0XiirBfVP3c5/bbRHIKqpzfg
	L7xjvpgLg2kK7lYN8s3/TaPPWzfGXEtC8afuSnf0FhcsZ+yp8ihqCKPVKzej9NejvYdVOUTS+m4
	BVy6ejexnj+MwdVj3Lu72vB1pKrvSpBcATe+Rm5DB5fvdkw5FwKdgCaUX8BSCuCDJZ1TlD0ii5N
	WZRlwD97nruIxthAchxnL3hsw7sw/v2nQyeDXOzX7LnHSYcctaLS20fqaACFAkUm1P7XzpNCPPt
	ZeAE+1x5+BDeX/tH303N2tvOQEXSWlWhdjt1F4u3iu1L5md1TW2sSovOBSTwWrhqIye/w9b8oOB
	AjUoAYBnvt3r/pvetU0iZLrv+UM6a5813t0+aI+t5eLS0uWD8=
X-Received: by 2002:a17:903:249:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c6f347409fmr21914825ad.31.1781781003000;
        Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 65/78] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:14 +0700
Message-ID: <20260618110827.232983-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041003_875388_2061E94D 
X-CRM114-Status: GOOD (  14.31  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wcd937x.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..8336316866ea 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1056,7 +1056,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1136,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1459,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1474,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1489,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1514,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


