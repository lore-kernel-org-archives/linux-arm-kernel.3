Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B02BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=; b=x6NXbuh6LWWOUo9uTkq+TTOEj3
	OA8+zAyNZMBUpIBFFjs8F3IbyrYnqPcZjAcNPOvhlsu6vXYCj5btXYyfuUKN79WVuDvlQmjrAzHJR
	ml/FwQIxqpslRYjTLWUaZ5oqRK2AqJxH6+gMAHaRpCZVzMUj/NTV7SY8S4mdVfABy8XhKwyCf6Yet
	2wcuuM6WRkElMBpoM7pdOXX8XsrgPchK6D2WkRBkl0kklwrEgSdA/Nyst/dTyj+zYZQrsruW2h/Mx
	FohRVLNwsYboNF0FkvrQ3HN9Vf+X3hEL63Dv1O5KK8ci2bDrSgUQScj+YgMxtpwXl73sz5Q8ypY9Z
	Ou01iaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5w-0000000FzGo-2CzU;
	Tue, 30 Jun 2026 06:37:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5q-0000000FzAE-28aL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845438a46d4so1880880b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801433; x=1783406233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=no7XgcW98XTD8qXEXCN9iHDaltEG2qb0SFoPkMaNWzgOL8PPf0YuXtlDY0lR9VNTs+
         E3TXokBh4tT98qNFA+D71NPsuVGi4BFYVAHwdjwGXMjyOWpLfhcApV1Ilw/mewoTCRdN
         aeREWbW0gz2F5iCkKn4r3XM0kwFZCcbVAgCj0VZxvIaUnQfxUWzNAEFm0avF6L0LN94b
         l80az7YPcPvxlKYJDqNVpq/yyHsrQx3G+P/bgL9yPnUXsYm255kKMD9I2AqsvESVPj2v
         4TAYiRzwr0QvA11rYPMbYEdFhFarGc8DzcmnKazcPGno8pXUo8c/13nUYfajNaw8qeSH
         dYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801433; x=1783406233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=sw6U0TpnB5FsJRSkKdhk58/HtQhzAm/aPjI1ny1QzixUZ+YU6AaXDi7PwMmJCtcg7F
         obiMRPhcPtA50FleGWy/41iGcGLp9irORPfPJckUvVd+mTOyEkUYf6C6QYiVUz3MZPdK
         ITeIADFj3UydEkeFnAJoPh1yZA5ISn+68TUWuhsCTujDhfXpZT+1afpwqPvQOSJJwfGp
         I07HoQKWSfcdco2Y2A1z9nqzKCDz6REmAVLTvXH5nQB+WerRURakawt6OxP8wsE0XGzA
         ZxfcSL++aKQ72yvZAgKUHAMbyxaDIxwLKK3ITIneud5i03vOCP3tAXVAYrqUTa17QSwR
         k23w==
X-Forwarded-Encrypted: i=1; AHgh+RrgpeKwXAlmv/MNxKeaAE0ZWBkei9aOPgwCJ2JzqG2FNsUkdcxscFF9NnP/T4hZU/DEK8LUM14mBLHWrna8yf5A@lists.infradead.org
X-Gm-Message-State: AOJu0YzmY5jxpbXjmmmCg2iWTNGDxrLLU6hTKpYtseF1whBp8oA5tQ57
	V19noRFd1fobiyRPsWS2GwRJP66XhYx7vRWJEoTdmBaWEPxgaEvFJmoE
X-Gm-Gg: AfdE7cnOPnGR75LvbwNkhb0BG7AV9q6k1ghHhsrk6MvhaDiCfbg6RQqFmDiarD0rSmP
	p1/W4lsGSwip9chSqbb+W82WgL9ttukjkwn/cQgnw2X1fVDIMLfIMomF9FDCJXFDyjPIrlgNKgA
	PjbWbeVwARUbhuj017VgFWU0hXNBt/FBoVBPYwABuPLh9wgqjPIwiydsO6g2SE1ix/7xe+7Mmo7
	AbmNhzLUaEJKIsnXkPwHZpUDJmUrGGUypHOUPvMILV3UK7v1owaI6BAcpUB+oh3ctItbcXYLO6n
	eWnS5Ku/2L+7sUQRvfETo9iVTdikKY+M7L0ACaSm1jTG1/6orV0vpPXYk7lA7o4oMv6JjIht6Cl
	tr5YYYp3ORakTCpjYVNnSunLh8OoJb5OBj027JNhsWc38P3cSAiL4GIoBIaNqojZHlCYAnxj1Sj
	Rpk7k+VqcZBWOKz4J7/ontsf5yqeM0AOtPe4kDmrm4V0KQxQcRYGwoy9VEcg==
X-Received: by 2002:a05:6a00:3e12:b0:845:e9ff:5d97 with SMTP id d2e1a72fcca58-8479f105f11mr1877705b3a.12.1782801433517;
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:36 +0700
Message-ID: <20260630063449.503996-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233714_557011_52FE9173 
X-CRM114-Status: GOOD (  13.00  )
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
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..bc777a53dff3 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0


