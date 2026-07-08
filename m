Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC643C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=s6Ha0EEnUKTWYRmdbucE6KNm3e
	diHebSuDCCib5qkExJytyyl8FjfFeA+1pv6c4Fulj/z0J/RaMueKk8QEKf+1EH8mPAUCEDw1gx5pl
	lIyq7ZvNhl4lt8yKuA5Tt14w5Y4mRuehHixvBHGnO/5GugRDOuoebIPj7S3i37l5ApaEvH6Vf7sXv
	I3GDIMYhh+CiA9kjWxm7qQk5gAtfQNusxYpB5eYx1YJHMruznwRifGiAYlZrrttXJewgjXwkyWvyL
	Buu1Sz4zS70/WIpGNPLRZgX9JuDLkwR0uJR+ZGqGXTKtTKjZOi3JI0GgiZHWOtS+qZ5qkktfZiKdz
	3mXIjpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7K-0000000HG91-1qN0;
	Wed, 08 Jul 2026 14:19:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7I-0000000HG7g-0Hn8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2caed617615so7518005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520351; x=1784125151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=FHPJ/2LK2DAeXgq0riH8s5lPEFzfgr4F6zRScgrS/DPXdXpcgRf6u1jU5qcBAefcx5
         BI39xSCITWqqAtSSobLLoj3Fudu4kCjwy6S0ARu8BT21EKjnkc7G8kraJ3lhymZT0ZYH
         RnuTFzIMSiMrboqvTU9NvjoEracK1dty7jNey2dPKOtJxJBjnTwxf0miPTVeEMr966E1
         KOh73YOt72iDvV+uCOo7jWVFTB7P/2vcHeKtvVXs3JyGUiraFugEJlTxJXeYGSW+/oBi
         piiBb3W+cAIucs5J0OhCqYJ38pzCJ60sBKtcF31cUHg6XjZPkikYknArb27kH8Ssy9ca
         7Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=EzEGWD2IImuurCIeR4U4JbssMRFWFAa16pyeXC/2Oo91wA8YWD23Bxxwjuvb1E0PkA
         lxkYsXrDs8DHiQAQATGYI8f43iCztEzxYZg3BAH39dJYfXNF88W290+3tEEF4h+rff4F
         rPXxi2dseM0vCJ9c0J55GFAxSyE4jdd223owalqZemeMCyBotUCSBQmXLLsPJh7QVuUq
         m0qngr3QretT8su0V4SyRp2O8EEiPd3Z7zFKcAaxqg43ATgHKoZXLiuizzHIKCTP8hoE
         y1svCUBlNVL2bAy6kI5MybkMT2o1+1/hH0pnzjh6d7Seb9NLlY6Jpp5kP2pCHnrXuS3M
         XVLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrs411v6qg1m0FM6qUwZYNkFR/YNEj1/2ISy1dr6OReJ7d1LzPLEIlOlwS8uPNdHNvKXxqigJ/sQaMmWg+wa5zK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz13qrNHpUKp78l2e50cU1uYFl7Ri6T6Al5HcpQS/Ao+eN1BUL+
	49tH7S2zrJZr03FHcNtbFmPjgQQ6ldDnEJtmHNpdnh3LV1BSxZyFX9I+i/pvaA==
X-Gm-Gg: AfdE7clWsVP/35vwWDxMilygacrUGcW1sQeOBSHx035NSU+QOYBtysr5e9xOUWEoNdv
	PNTCWZdtLP2vzSazPndNrYB8ujkaVXK1HGiCBzhGyOZEqKi7eJPomLzl6z8G9/FYAo0OU3Lxb8U
	m+DqSg62HnV+YYc5M3/T8T5ncnS+cLtX3urHtaIS322MS/NPHJa39aWXBYlv6zTbtgO2+uq7wTe
	gZtfepPh6dQtaAfdoqq3k/vHggsvhkq7eOuPXudI/5GFczNmy4q5+70K/KibZnmi7ICNcRqi+g4
	OF9Jwl+CGNN9XZ98cdpXGcHvjoyWUrGb1uXRLiNVhoaIovWY2Tub2KUqZ2qeYYYNnFWPq0bjwmF
	Z4VHK8eogVBeW14h30ZXODQVUsJlWTzMFpmW0Q+wRjPVd86Wrm0/HSYdcejXoWj3EGtasYTT+Hd
	hIuDbqoI6Pdlw4iDzTsVznD/apHQyOBnwcHxKDqH43q4H+phA=
X-Received: by 2002:a17:902:f64d:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ccea48bc51mr27117655ad.37.1783520351057;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
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
Subject: [PATCH v2 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:08 +0700
Message-ID: <20260708141734.578926-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071912_137622_3C60409A 
X-CRM114-Status: GOOD (  14.18  )
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


