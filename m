Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A9CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=; b=k0ZpatU5hCfBblt1cHNl3xROJ9
	1rMwOjt+98X0DyL7nQE69JO4HzkoZ7Cd0UJ0XGDYUorafT5IdRSJVykCbsBQKGlqdM5Fr3kejKTaG
	uVNWEh0nP0kDboxqIDi2p566Az5zQVD1WajZtaS0aqE4SzYzMe5YJ8w2bji0+/KWQsaV82ptIO/IV
	myBAjPbrb7UDM+DL0OsuIO1EC+XVYof94e2uc65oY6zDIIBvbrgrycDtGi/gkQZn8UfiuD3PQui1a
	1sEuoIo14xV4GA2Ufobj4RalQ2+gEjUWvsqxL3MgGuQmRd1Kz6b+RPsXWhl0XIVYBTFOxmp5gYtHg
	2AkBO06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhs-0000000H9y6-28Px;
	Wed, 17 Jun 2026 10:41:16 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhq-0000000H9vs-0OyS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:16 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152986eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692873; x=1782297673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=SBCbQY1CCycF6C+MmQ+2h4zWzffx/sRTfJFal0QbYOO+nrCliIEcc3JIc9uDkRRdW7
         lsgoMdpfxHESJZi+X6X5FiILvGGEVLf2VUVwcko4ruLdOSm+26+eK09EuUWdFCdMA2ev
         fA0fQuiea+q79D3HQ3IUUNTVhhveu1L9o5GnOi5MF4QuksXqdJl7nWe9qPaE2UxxHcL8
         lcH/LQN0LVnfGjEAZ905oXTbaHzWUkUKiv78p0noLWzg1rECy0ITEfmlec/u/q/cb9EI
         bg4SvvfVGEZGs7HHC6pMDYFayf4a2SGYXcg2vrY7LH3PTPWiZO/ymXSJfGTinBAQAmAS
         4Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692873; x=1782297673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=pMIvIiD0Kx5kStwaW6pCuukBfTpt4Ap1qt4B1UJtv6drs326w4QfBttIGg+UNeByx/
         /DQnRsFSDgEtXfxEu2QEyr1LeThzykjO+WeeXyIhwdht/6gK+RfAsGWtfFfA9P8x6qaB
         HcI2BSKWvBeyR5Iq/rzt7ciCc3g2bYx564vndqTNwvLSyC9wDV83795Kn6mec9XuIFwy
         CbrJp9BvalpDPlsOHyWxG2sYX/lqrM5L9wkeCMyQik+AZ10D8qJCG5mpLnh8A7Q7J4Hc
         v8qAxkbni/mXfhYQdUf67J2frOpLEBPmgxF3oyXkP/orCBqUKu+Uc04Tfg/qm17g2DmP
         GNuw==
X-Forwarded-Encrypted: i=1; AFNElJ/5UmP6gAI6e7NHJaKoqxOupHzUqBOSX1ETmgdSNh+q3vag+oXyMwtGncSQngMr90nx1rGIGdbPVBF2d398S/KN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo0StrHD34vu9dZo+YeZQBfzeN/u3GRhXnBWO6HFkLjcIVlKcr
	lJcJSKdQG6WN+mI9g7l0d5n90arF7Ba/BIuoyIM5U/XSLx0kGJsluQ/4
X-Gm-Gg: AfdE7ckXxVZTDhkrKYpNUY/Tr/NCYKWaI/L5r+IZgC3Fx2/Z7BiStnJ+i2KWSOdyaOl
	7ZsAYNHJvQ1TVtWe+5kS3kiU+ibXDLYa8wsZue2Pb8Q0vw4CxveO183E2ho96JnPi2IexO1Vtcv
	p3DWt9PX8MuwZfH2ngG82x9/RsXFeN+1TL1sqj3HujilmCEXTQvxPjG5S2fJyEikl3B64/LMVu4
	qN+1mjoxRnz5X0PBKmi6baqXZBl4+RToV7JtwqZKb5UtZJ5StCIAigvFZ7YSxfiamQV4i6msTR6
	O3V9rr+Mp8yDj8dLJOc+71OgraYe/V/eHKs3QMbnRSVne9YrWzzv6K+QpEYkIVceBExoJWwkDc8
	TpW8ZW3aPYv5g0aRfJN8exxdMHDBCXi8YyhOX4PTUKI4YDeMfbiVl8DdvKzA5ekSL7Apgxx+hFP
	qFlkxlPRvyEymtl9HhZmO4oUVHi8fMLjeWkMd4yjT5kCGYwak=
X-Received: by 2002:a05:7301:60d:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30bcf6002c1mr1306991eec.10.1781692873410;
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
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
Subject: [PATCH 53/78] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:10 +0700
Message-ID: <20260617103235.449609-54-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034114_142168_28197D73 
X-CRM114-Status: GOOD (  12.67  )
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
 sound/soc/codecs/sta350.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..b1e2f346c647 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -306,9 +306,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -325,8 +325,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	} else if (numcoef == 5) {
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
 	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < 3 * numcoef; i++) {
@@ -334,10 +333,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0


