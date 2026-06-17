Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A2CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=; b=gowJgRJyk2n/lX+F/PUmWdhA73
	ISrzU+7ghhbNA3aNbblN5MYhQh14My0gY94UM6LWcywrsWygkfJ8KuH7kBeKdX1Rqz27fDHJycCFe
	ql1+Pvd1nh/7flibbwBqaFm83SnaZ1t4NTJPBXO+v/VDDPYiK+VswFNBgZ7l1WaeOZAuco98sukb7
	iWWCIj++s8koKrayuOGRfo8Qr0OKFLvIDrU4qXX3xXyE4FPR/DoRVDskKeIyyni3ZINzGW6xL7rv/
	rHWLRlTA1igMQqYXP7fXhYHndUrEBj+uKoKDFknWMsd1BmsQ2uusszuxnJmL3zLeOYMxnWsDKgQTc
	EpnuJ3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZni0-0000000HA6C-3OFd;
	Wed, 17 Jun 2026 10:41:24 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhy-0000000HA3N-1m7z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:23 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1200624eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692882; x=1782297682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=ckoIiRtXOnd7Jy2wAFHaAJObzIlkOsAEtjQBcEvz2ddFP/f3Rro/JgQZBFhc/kHOBZ
         BYC+6ycKK2ra1aRQGa3c9+EhqxXAIsUXV8kSQdod7ZNF/sexIGxlRp2ULWGx1AJWB1QN
         hjbdOG5kxqNZV7M0dDAhx2Rc8ZmcFXDQVpOiUkie3DZp/J5GDdzMHGCUGnZkLZpLS3Gj
         04BaVHMVmM/1w/d8wQai+YdkS+DNC04Jya5G0UmlrbmezjNaSwN9sq1CAJwMxkk8uj7R
         J8Ewe4TSilfsI4qWWq+vasKCmbAUvLdZ4GqLNTY81vaVwlB/wGobxOiurxYUxLuXjwqJ
         LvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692882; x=1782297682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=N8bDq/hUepNS8+F0OvLcLE9OVg1PG/QPwkKrPOC2U4Ajg9hxo/koIYHgEcP+m5teAt
         ysQEHN13NmpcDRiLGoWv+R6TT5AfghX3+/QYxhq5TbFEQ37bviSINphjpQvJrG4nCd2x
         jCdw8aUT3F7kKTOyDw+Mfg9Iv7dK3EcbRt2VEv+DVmLlGaexKlNplQsoA+UB87zGZmg1
         oJ9jYUC8jZEiiUyOr8XYdVB6XbGNkL10JtFlcu6AUY6khsUYoDImA/lIis8RGDbAy0T/
         klkpr2BNDB1eELSS3EF7YbkLhwKW7N2a2sLuXQ9VpBWScU8M/F5FlJ/oljiH84WsveJD
         f9sw==
X-Forwarded-Encrypted: i=1; AFNElJ8mfaOnRoJxVUL//FTNoBBvZPI3VozWBxkjzt7vttzRnVbKDde2Pgjnd3abT9AiTlPkkf+RE144Wuyj5nqHqRTW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy2YMQzhaver6Ixvad3AfZEFgGI3CrcPI2lOId+HvucIN1EEaL
	DFxbJghAILSsxY/hNLJ/SBpB352yEpEpwpp2rO224Y7ui8PVhki8unw1
X-Gm-Gg: AfdE7ckILJeORq/xt5G96wF8D5F8GUxZDJghKjJ/d6aDA7Fl5BF6DzVaL+XrJe6TY6Q
	DSzTQrtK0cCO8aW2l9fkLykvA9xZsOOD2hwCjsPEVxFAF8ac5Ijd5/DTpxDZoqHcjZeJniLIUvD
	xEBuqOwDK61WN6Z8Dr0cYVUqWekwQC0hwhaf+E0L5BbwgVmlX2/EeAoTrTVajbbWwhXsuXpXhmt
	cZKLilt9kTcScM8E5G6zVvYi7EPOSgcYjWyS+YiE3eIDkMaMUVTlMdeh5gvTP8WYiQugRJm8ED5
	vxccT6+RcM4Md5ANB+spfTCsbWFiYLCNm3jO4ikOXPeqqim0VWmYXgm5sQ4Zi3AL7Qda9bzYk6c
	M6ynTUI93AHnZ7U3diFYsoeHIpIbZtKubiWlh5N5Xqpmck/W2isvLUTSdZwOb0RPx6Id9O7tMj/
	ar38aD1Gixd7m/4rMCkBVL3TAE1BfBFt8XPBcgmwbrRnXAMRg=
X-Received: by 2002:a05:693c:2d88:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30bc9f57d3amr1910340eec.16.1781692881708;
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
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
Subject: [PATCH 54/78] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:11 +0700
Message-ID: <20260617103235.449609-55-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034122_477203_9875885B 
X-CRM114-Status: GOOD (  13.03  )
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
 sound/soc/codecs/sta32x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..61703e6e0586 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -271,7 +271,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	unsigned int cfud, val;
 	int i, ret = 0;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -287,19 +287,15 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
 	} else if (numcoef == 5) {
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	} else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
 	return ret;
 }
 
-- 
2.43.0


