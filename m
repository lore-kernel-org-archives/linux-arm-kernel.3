Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981EBCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=; b=EQPbYjDxN/60OeH8lM7AFBEGa8
	sjaIfTejvZoj4x98mnnRijHafwJZRAhJt63RshVRvclPcOGygiWT3jGKN7+I5dxdqkqb5O9ULZnal
	a6yUCuXx5wJgyXk2o/+Z3gr5D7c9mkBPfV+35gKV1ce9PfTUZMHsvMh5an693Ungfs4MIC+N6CWay
	c4uqhfcdBgkiiOygcXAZc+Xx8g0T4ZnSkI88JvsmT5x5c+gzzttD9lDVdR96qP28O9c/4vBMk0tZP
	JhyQ4N2BoAwfJzi6th7Z7vGNsjUyteq0k1OmpqZZRH46Ys/DgiYDorQg3j7Lp4teQyOF/QVCRrcdB
	slH+BFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnge-0000000H8ur-1n6F;
	Wed, 17 Jun 2026 10:40:00 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngb-0000000H8sE-0jMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:58 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30bd445db39so182571eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692796; x=1782297596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=DmYaOyYaD8tul5d6uLZLc4RMsymH5LhDFdAfdPhdB8HbSszJ507VHIj0WD9Y83cSZp
         pQ1OJPbWFB3U3cxlASPSX1GIt7/AbE6T1MJsoDay9rVGPNTyA8sSqUves/dOrFR6e6NQ
         P6oI7qTATO4LEEj9UM3NvD1zURf3pgf8Nsef7pNSQvqRlLDVmh0ofdJbY5JWr/63wTTg
         p/YwB1d00SJXS9SUlcSXauRKRqx9OmRe3EQ+KQRJGjfk8qT7b26JzxcAyVvkFtTcFeMh
         eUd0DYZPfPz0iicEwVNB8HirIB9BGNKLuAT9/5TJYHx7baTEnzlUUCEsImwwQG0AzCdJ
         GpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692796; x=1782297596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=RyVBX4igKtCWtsIuBFNlWLhBhkYS+DKvAwefuyXZc2EB8emQC2qTMtQr8fBHZP4iOK
         E73uzboi44lpQnq6yH/un+9lc35QvexQySIe7HyXgdIk1ZmchIScmH4MoTa2HIdQh+3z
         8WgiMHfWi0HZeivzN/aIyiO/vNx8qdEn7BZvsMlKJYeVGaGw7jrdpzx80J5qx71xfAKi
         sZQ1Qp3rDRxFUCzcEn7AwbmFIke86WM1uwUWqmytQ0cPB1yUaxJqa8JQUpG2+bopbXGr
         tQEekNofcvFVceGc/EGk5zMHrL/udYauHG3281RQWLAQnBpCwOTtb6UMLiSIuJvhJKVo
         zpdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7eabFBLd/EdFYW096j+2KGFJCFkuPLbyR2HwARNGENGjBrHoOQ8+qe7jNt/zkam0fn1ZEAJyw4f9tfF8Qlv+Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6TE/lVCBdu2ZmTyeo0r5daO63JjrF0jZj0EVkniYPDXDoolST
	7qsOWeXM3wmV9qzvmtiqeZhEDfBoVjU571VdjvBACdUV9eO6YqbiEVeu
X-Gm-Gg: AfdE7cn8zJ3oYEdXL+0IRSDUgg1GlVzJU3CLXZenjFVC/MYqWWLkKLHuAmDC+SlaxTS
	JsGrqbvRcy1jReGJwEcMGB9ixUBOBXa0bV7T543wjQOUiZw9hevNmQ8OYrzs7Jpe6AlHQ/mSqU1
	NtsJXDtNEaDix1RLAwxer3jSXGmD3XJUC8TUt/Tp+F+rk67uhJV0xmq55tB4URg/UBwYGmBpwbC
	DkFXYU6gPLquPfmpjBB17lje+VCYMh8cccuv91tECvpe6iMBIlDwvQLzJHtKuQG4QUX1Hp2HnLr
	mtt0XAyKmFQRmgnx5uHxrZhzCvl+uG5Ch5NE2T3zQQfWQ/GKEnl9++LE0MPTZehnyX+mzBey6Dm
	iaryhe7YsJp7pUuWkBDGQKGKXMX8RGmmgqsQ0EB8CsXX4sgUHxr6BLtzm4TSKNxMRuehlwkT3nu
	vOGb6cwTd5AQ2kBRhzQUOCpH+CxxoV2/SOapfxQ/oGpnyRcDecWnF9DsD6nA==
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr266574eec.3.1781692796467;
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
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
Subject: [PATCH 44/78] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:01 +0700
Message-ID: <20260617103235.449609-45-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033957_216514_365D9374 
X-CRM114-Status: GOOD (  10.17  )
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
 sound/soc/codecs/rt5668.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..1eba4d559c0f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -986,7 +986,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1053,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2354,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2398,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


