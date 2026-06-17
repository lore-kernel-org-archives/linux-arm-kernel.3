Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE33CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=; b=nYY/CQxuVRYyiEF3waICn1Yxpz
	/BqkHRiywhcb4NNx1bD5QkuOq3hYLZ204ygYD8AYwOQgjdtgfj2BiSnfMYcvsTgmXBfM8ldSVEDOC
	4wql279oaTHLqv9w1QifYcxmbbJbpz7LCuOjd3t4misbEllOLWYuOjmaXi7Y/8UGzer8cw+Z08HNp
	N2mDACcIl1gIEwL8CE3F0Kh+L4X0ikryiaZPEsKVtEVvInWZCEeQaDfASIsBexY+TOSoQYdtpEnu1
	2RP/x3mh3vMumvqlpzo7RMI2U/7OrUwUJQOMv/iP4MUDLIA6ZiNhljvyIPRL+/VrfVQzR3io0YMla
	YYHpVMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnb8-0000000H4MF-2REf;
	Wed, 17 Jun 2026 10:34:18 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnb4-0000000H4JA-2acc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:16 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30b6dad2382so6289296eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692454; x=1782297254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=K7MVPmPq93932w+0keRRqvTTipZxhLZBklA92QwMFB6S6VrjdfyNcczNkeMsLauG9x
         LepWld/2a1UBoekufYE8yyBj+00cvdvoN9OCfEq1ltzZJtfMa6kQG5s/OZPHL4EVdk3Y
         6EOY8xCVHhNbGoTdoEMY3SloCCkkpDT/zg/M3QE1cK9AGEVSVcCwGEafPcGydANhU/yS
         eXDuyGoMI0j8gajNdYzyC+DwywBb8Fi4y371YckE6V/0bgLAUqh4y8SLXpAv17tD4Inn
         F8twjeqSmgCFQWVQ/NVWYqSa9ghAGnnI6O9gPs6mBOnro50ixyz1xjf7/b2ftdGOnxlX
         AS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692454; x=1782297254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=FF9cHfs+Cro3OYPwSS8jfpqafK0jFAfGsQrXRbSBhm2cTpMQwkyiVxh9FAiWxXmrlB
         vd4f81fAkJNXQnLfRE/PUs1ZARWAG8GfGXo0gB7Fz6SEq0psuuHOovMvfvKuWXzmHVa6
         gh1n+syQJr2TpK48DSrx3qpNFXS8Nsk0Ry7eLVfN5tB17O/35YHQ6Yr09f703pHBvL4F
         DEvgAV08gPdKNTBZz7Ppx2EHZmk28tfPYqU7nwPxi54x2vvPc1CPs6ueSulf7jCqDJXX
         xauCEKAZacz32snnVy9IcJGXLFyVLtKuiyf7st94MsihqcfWDUiMhP9LhuQ4T4MudsPc
         MVtw==
X-Forwarded-Encrypted: i=1; AFNElJ+9DLvAbEWS//oqfOxpbD0aKYVnYKwVD1oVO0WdWTzdKg1sSYtqvoQ8NMPOmLDjeU8DjM8LOz+cSbiHYaB+eaWY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzaiq5fnuA1qmFzenTQv/dd/3U29AEKxECGAwKze4J4Gb9DPZnD
	sUzNVq20CCRNTHB/PlwLutnAIozkKUX6q+j4rtjx//lxRqaWmXq/O2nA
X-Gm-Gg: AfdE7ckVnq9OnVVIDY8Yxr9drOTYg7vMAt6T4UVlthuLP2aU7Kyz4GXhe1fzCnvJ+jF
	Uu5GuZPDM+HveRl7PO4QwwtsSx+2mOe9tm2mnHexNV0fF3d7wu7ZsZfSKCMZ1Ai56aBrfdrfzgr
	LD9mhMHdRPSAJqDFkHqMBYlMaN5kfii0E8am3Esotun9lQph0WAmH7zYgNssOsxzqAfLpnMW9IH
	S9b3dnmpqpd7EFGyxtHKvBwuAgZmuUlse6LmFr3ZJSRBE4t/xUp53pi42MifCa0lC6SF1GUjN8K
	CgxcHA9/dmFVjtYp2RGGiSi+vFLLMDUNIAvDOofasMR5wLIMiEWQobKKRLfuDI9sDZA5a4a+TyD
	GOqiQ9PZCgS5kVKxTxiprolPB1He8xNGsIgXqAbBiVE6c31JeH8riXMbXnFW9eao9YoiRgTprFX
	cOPomFMigpIp1TpI0pF/G5NmlmiTboSWdopRPhtN9wloYRupg=
X-Received: by 2002:a05:693c:3105:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-30bcae074bcmr1680486eec.17.1781692453941;
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
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
Subject: [PATCH 08/78] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:25 +0700
Message-ID: <20260617103235.449609-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033414_652288_95F9DD2E 
X-CRM114-Status: GOOD (  12.16  )
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
 sound/soc/codecs/aw88261.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..1bdcbbf5e3b9 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -960,11 +960,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +972,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1035,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1046,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1184,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0


