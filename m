Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6E2CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=; b=XdSazisdpi3tSLFVl5UvdYXwdb
	iFIdDSF/coLFjTQnFsBLidxiRu3dCPakgxCESWhheimfu3DScFL7yx4PfedAa9/ryygfvN/YF/0Z2
	oDZRq9F2cpJS81vcTnBviWVvPjXHZ8w5TT6mksnuDNeqXJVPJ6N2AdvwCpeZfL9Cv445efp6AM2J1
	pyvKO0SPllwQ5xXfqsNGXs9bqovhKWayC8z6/Yt0+PYhxBqy3kgl1jhYaz4mZHPOO4YFTw0nUPSR0
	LNW62MMw9xfI3VR+LOuBMeXOkAj6olFy4s38IYMDGwuXcCxRohICZRjqlwakG689FnAJrNdG+/Tk+
	ZYradG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcB-000000018vQ-3LzZ;
	Thu, 18 Jun 2026 11:08:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAc9-000000018uk-0kfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:08:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5608585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780932; x=1782385732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=or90lKnubYwUHSeA6ZM7Ir2Vofukt4wydffQQxdZlFeN1b/MyigD3qDhWGZzaLeoYb
         tfzZSB7WFY0OU9UWVBt3BfHbb87fgk5BE+7N7vcCt3mSOtgGZzwnM2kXlk1up5O5x35E
         38l8jGa9UBFFZZRdjRZizg77iM2r4qAKsMgriqD6jwx97tzy3vhxE+oWRNLpJXnbNp+x
         zgyOWgwmgeRv7ZMtLylqPcU0C5LEd+Uhl1wGPFhQj5xYm1uxb0DV3ECQSIbEyZOdw+Nk
         REJw9o/lgZeIOLXriOXqqa1XcKIOKeUef1hD9GVMZgiIMOdO6IhjNzyKMCOYEXPBrD6F
         d/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780932; x=1782385732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=rZteb/z1RoFVt80JEUXz7mC9TdrAI1Lb6ryg7xaNIojdRgBp64R6kOcQBiB6+M0p2h
         BP67lGlacYoBRFzx/Sf6OOI+td3INkkrQNCA2Hsc258JOIAcWpO31BDV1JhVUJZRp4Zv
         uDZ1Xvq2wMBibFwz+ekHTR4j9twQg4CAbQYYDL3ErBJS1CqTi0RmqaPBz8AQ05Dl4+nY
         Zf6XfU/kyQ1Y1DC+ah5kniIYIljFcGUiQp9jPUgPEg++ABt5Km6on58uCIuH9JtM8O4g
         TPTcPOt7Zm6yEtQ5fNCJPiqfhbO6g8i9dBxR8Yx+ognjuDPbDmxNXVHrZR/hcxfa+kWV
         qwjw==
X-Forwarded-Encrypted: i=1; AFNElJ/yOjzoezMiwGJZHP2mij5QhnXSPBOpjwjZksWqoI/kZAcAUvlqAYurRBwggcueTqZXJrk7gpuiRpSfVT5N8rDl@lists.infradead.org
X-Gm-Message-State: AOJu0YxcdoXrGDt+DgtHtEywH8pf5lRAGlwzd4vnOed2ufPYNkQ4VAjk
	SR2aQHehkworqLiJ4mYm6WpxVF7yLc/LnKnW2HYcGyZbAYkXomys/iNI
X-Gm-Gg: AfdE7ckU/W5LNrwiRNJ8zeOlYgS1fBGIauDekpbOIQxkdQhDaOeYsWHRt2UqxjsF1+H
	yM7OdArIIK2KfiIJ0XZQl/AHt+V6wP3ljDZCUen/sEzV5d60ju0/NSeboRjS35lfJgm5lQqufWT
	vTJp98CrXjrHXzk76A0UimL26lHfiZ/0WVGcuAHXYo/1llNVwwKH4QyURnzjmfrJpk6iUQI2HVT
	nhCwA3s/HOp/tHUa2EEsFCJIm2WiwAaHQ8ru+2Gs6VRuhlUpRo3LjlSB9uFJT2Wqvt8TJWbvlg3
	deZJgDlYdgPEHzm0T3thKg5FsndB/X6KsGR3Psc6NFw2DbuliGA1TEze09JeKX5rsF1rnBx7RCI
	mvs6t6F3L8AqIb7KILvShlhVP0DMOgXY1bCTWy+ewqBcQzB42XYIF0oo4leH2wwUozBxxTv9Obv
	oAyDmnnXoRivrtktX06Dqs1y/xUbzhH+EK9PeC286h5U56WlFAQEquhBnwFg==
X-Received: by 2002:a17:903:2447:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c6f34218aamr24583345ad.12.1781780932102;
        Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:08:51 -0700 (PDT)
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
Subject: [PATCH 57/78] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:06 +0700
Message-ID: <20260618110827.232983-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040853_336083_107843EE 
X-CRM114-Status: GOOD (  12.40  )
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
 sound/soc/codecs/tas5805m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f21670dab0f4 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -230,10 +230,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -255,7 +254,7 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -267,7 +266,6 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m_refresh(tas5805m);
 		ret = 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
 	return ret;
 }
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0


