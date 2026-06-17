Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77935CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=; b=zNHrFbHEi0na7fWOuEGXvGws0h
	JfDMmc3cY4rEg3skOIH7r+kq1KgC8s7kGuT3HKkPoI/eFl9l17HqhKc9sVLgHyy9JG3XCcObJ/ILA
	Vxb/qNZrMehbT5VSJQq38FBtShyfhctx3jGA9b70ce1AMGPRvPyTjq3WrsE5PLQv1gH8U9iv2OadJ
	F67B23LjyYk7yWbeELVSFDZdP4yCPBIIk+MmxGI8GLLZvVVv7ZoMGQMNc/ahZPFtpSRjVGisjWREy
	Id1piqts+yzYJA0FjiCkhUhdiEmjfzF+1l/MDpE7UouRNnnh6ruiBnBEBoJaaKnYjBGaUaWPvwxFd
	svXIcOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbP-0000000H4ay-1hj7;
	Wed, 17 Jun 2026 10:34:35 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbN-0000000H4ZS-2QPK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:34 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-30b6dad2382so6289698eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692473; x=1782297273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=o/ywFmy/dDbJuNXauAIMBcR7AY2/pX5wH/J9VFAthAcDQsd8hXiTm+DUCrhofV6hdc
         qsnPMTnaT8EwheWfaBD5IFlcVNh/aW2WgIevXNdLP932G3j2AMmmoixB97PRcZzhgY56
         JnEEHOawwtdmURvT9K3X42yiVXwSKPu6nwec6MgBLyEfi7a8y2J32ZBe3O6vbrTZ0AyZ
         eWq6DHKpT+B4aBz6VbAy2WGsj++sbZxLqJI7tJBQiEM9IbQdpyyWsPRQDCKxXsiBQDEu
         iY10q+KU8+quZ1LoooKhc4AAM6+i4T5bcSL3ezLdCkx+UoMLf8vR/EEnxsDQ1jgGfh6C
         nyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692473; x=1782297273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=ZoJN0pT1rXmscNpOBmd3edtpatya8SptETeGF13sC8Ly3HuIMAwBRtZfy4fDl00MoX
         ciLNhm7t6OAxCVrv0rr0BUCpoJvD+qLtyV7Rg0BI7JJkzqrsNMYTv3bdjjlzhY3UIX+y
         bQ/gzfVAxTOfpGZCkJNFQUnZbIbQmnCwGSWAx691T6ol7Qb+66WWi6yYg5jIAfouYCCN
         N1yKbQNS2PhG9ihGmfqSk4gclOFgue6gum0E49lkaqFgp4RUfGr0XVQ5vkYUpP2nLF6R
         3AAQBJaYWgAtOsl7eQ3U3BL7QxFydkBlmH+RB+GjTRbKgwrhmhC7GAuLZwoTZ5graXI+
         Q3lw==
X-Forwarded-Encrypted: i=1; AFNElJ8rX4wrh68aZ3dVNEJoI1G6gj85BaKRIS3yif4e1Khbjuyhgx2D/Jpg58CwdWoR0NvZwv2OmhpGp68dAjxAHbMd@lists.infradead.org
X-Gm-Message-State: AOJu0YwMe35OBJDyl6cMZsIKhz6j9s1YoV1opHtECw1gcyXuAAd/3vdp
	eX++yLnLZJhgCiPy/HxVt0hD7c++axQ7ijXuru6CIRvH218tBkF9fXij
X-Gm-Gg: AfdE7ckch+ZulUsfzBFX6cZmvVrHGh8+e1itF477fVzWfncOO93dz3jvbV8ffAqHXHz
	3lhJcNasdIEJXWKE+orl317TZM0Bi5EZHJ5iWaGSE2DbQMIAbSm58bLDrfapObpe6kX6L8xoYK8
	8plNPxuQoz9kodrqH8US5QeKloFsI4H6yPHclStxTY4qrEXGlrWcMlBhWFSGzjLzTUVaeWq39PZ
	Cpo7tpFFIKq3LpY/MrgyAb3IAjp2eRVLLcEAgWt+AEg8SSxMvY0LCdd1LLzE1IILAkUFSZ5ric0
	JQKJ7Eq0HpdInHi6WPqPVu2m9e4/jd0qPB4WbUPQ3syaVKjuaXAoMdzvisqdU3PJaOsVtja3z8o
	tEYyOc8Jz/hukCfkka1PTPzjkzaQGqLvikhIRgpbIIbEBdHqgBVkZMiv3d2RlH+asDJLnmperSg
	9rKdjSC/UGcSafVs0QwDSNvQAQiihLUXBDv9BcnR4Y4fqpC8I=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1485679eec.23.1781692472742;
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
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
Subject: [PATCH 10/78] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:27 +0700
Message-ID: <20260617103235.449609-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033433_619842_42AE43F1 
X-CRM114-Status: GOOD (  10.80  )
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
 sound/soc/codecs/aw88399.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..5691d3fd20b2 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1140,9 +1140,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1701,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1713,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1935,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1970,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1981,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0


