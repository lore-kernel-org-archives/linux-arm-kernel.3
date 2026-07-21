Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73855C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=KoL90z9FXDU1O8Bl0uTTLvyNdj
	uH1mqgbld4gAua6KX+RFsA4bKH+8ZAz7ULdDMd3jt4YOt5NQhoTZny7fk20CahrtS51xSS4HWYD/3
	pajZdqzzdokYQvmsw++y62yFyfGt3eY5G3oJUf8U2bWgQUyuCwRlVgcSFly6m4lh5mcYml7EwOWP6
	aEpk4MBBUo4ythY7aZrS03/z0DcV+FpK5MfdH9jW4SLtfm+D1lmSlS1FVcCpgBVnm/Qgs2/vcBGW3
	fsdWUABqpOz+drJLRRmeg0b+To3zZdl3tEeWNI+ocU1c5AImSd8hz9MFtM80CQ9BJmpzZWv+IKyBc
	bE9F0eiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gF-000000097sb-07Qn;
	Tue, 21 Jul 2026 10:26:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gC-000000097qU-1EEY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cc891373e0so139026235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629587; x=1785234387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=GRGqYIuqZLuc314C5xtML5uSAKl81X3njk0309koHJtxoznDH+N9SrLmglifsVFpbm
         d63jq37MGRwflCVqk1+dzoIdrJRHVkEOZGSy+tqVhcZBzu8QqEXqdtNPEmH81mgz6Jc7
         /GuzZCAAewuBQ4XcNjHo6pBexRcdjBY6wrD/U/fcUF+Wsg9Who/Y+oxxc4aaluM40QZE
         uEExeu/fNtrKffQPs8vXxA3B7H+DRXzFRy0AttcLomsbkeRWrGB92sEvr5K8U9/kW7/R
         PWqmfUWp2UdgoKRjhBO6GJkqZKCbTD6AF+GHyJWtvXFpUSPdlOC+defU+8szCb/ZoFRo
         Cseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629587; x=1785234387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=Aywb1gg8hASZ4BzRrb8T284fpOtqOEHCUzecIvKFJKzfLlxMheG5stWd7MiYrau/jG
         YB4xHr25MlL874mYeYjXMEM21U6wQhHc49jggGZZEKmAXAWdifV7yFkB54SZhEX1L6y8
         Rm2lhSDqzNuLUGneA3THSViU39AL6Dg8zREfW17n22CseMre6w5Ao7AmQsODKDPD7eyk
         Fltm3HtlywjdLY0LQDzSEYtua3Vt0jr2Cp42nrVO4Lbyty5krgN40hWsqwRBbFAakdrY
         /eB+d3NE46s5F5P4fZkk2mi6np8jMkLVnHr3h9z+kG06WirAAb28eFNYmjNi0FH4EFmO
         PJnw==
X-Forwarded-Encrypted: i=1; AHgh+RrtRVX6l+lTzzlZY8m500s/WjNsb73M0Nnevb0OHbTeo8GaVoRc2OTzE/bfaag04FEc1Jnnaf+qZzy060ivQbw6@lists.infradead.org
X-Gm-Message-State: AOJu0YyupVWXLClldhDPbUYGmemH9cV2lvmbr7bNivx9/+f1fOfaKnPv
	BXZDR9avWqR2+QwEqB0OFPzfhNrYIVmgu73kgcY3Ul9mbepDruHXQsVZ
X-Gm-Gg: AR+sD10AuYUXH8DhkE8d1trnQIVkAs7Bc6PyCXqD4wlpQO3/PhRk8D+JxZZnILWjop/
	U15RKqhEeZJIQj45y9e7i3J6Tra2j01vWwZoI1wd3qmo0uthQWSP/gk0yKMMyN9mlfzAZo4eoME
	7Bjp5UPnNB8N1SNgxEdx14MXjn4Oq/R4g3qJlv9Bpes3+j4zyYVbEr898MvVpW9Yd2HfuuJVl0R
	6fXdjjRyk5t1FfS1/5s2PMTr0MC/Jow5lXQNTwGmJZPow4UzdjiR5150vwCAH4tiPJq6daa/eAa
	IEeUtj9tUH9ZQWM6zN0ssLK58jgscipY4pUrVBOasc4oCwAsMIdNWgDs4Bt8v+RRRw4Z8ihXdR0
	JJDhfaQyvJqyRFRUkzNsa5r+UPV5VRNRg+i5ak8EG/fSKMV4pZzH7N4TwA/0Oy2cw689gkTFcla
	4xJrc8VSlqKs8Fsp9G0O20HmKUuN3VmA1+T4q9YwLTZr31ZDU=
X-Received: by 2002:a17:903:1110:b0:2cc:89ce:2ef8 with SMTP id d9443c01a7336-2cf34a2ad90mr188368875ad.40.1784629587347;
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
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
Subject: [PATCH v4 01/29] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:32 +0700
Message-ID: <20260721102600.523199-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032628_347215_878772E0 
X-CRM114-Status: GOOD (  13.74  )
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
 sound/soc/codecs/da7213.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..923b997efbc4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -216,13 +217,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +228,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +239,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +250,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +454,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +487,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0


