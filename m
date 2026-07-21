Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7CCC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=; b=tRxfJrKYkG9NJOJqxR+7sygQeg
	HLn9I+auyYhrQ1nk04TU2kgpq3rqBR5JnvO+VYR9tuzxemZP9zLSUs6f1akFI+F4+UoZCRD9zKL6V
	JqGGQ1Cw55CFEOznsZQqbkTulY6U+BAlwWiLkWNBjRK2z+kpoCo2A6HVe+hYci+b+MicBVCBtj31f
	6C4m1aSY2T7YcjdUmu9qGNGXH1P8hYpNvX3NGo3pZz3LJz8RQajxCcH2twpob3UPfHmjiunNdz9Cs
	bbUzYUSO7TIOBWuwZ9Cz6WqJ8uPgj6sW9QaG0254ZN07pqfexQLcz1I7/nsor7tEDI+sDZnKdVUWm
	u1iEL9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gO-000000097xx-1Ajf;
	Tue, 21 Jul 2026 10:26:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gL-000000097w1-1j5h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ceb096e675so111466785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629596; x=1785234396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=JtA09GTMBGltxj6ZYDeZ8CWh2OK33DK6v6JzpgXvPVVJ9qQIddOvDOIAaQvEJJjljT
         38BGwNAf8hI1ghVD8hCtormvSv9KpYQJSTawXi3TdqbAJ/erdLS9pnBUsDivL9kiMJ5B
         kVsFbE5bn4DAN2aezsTZSbVf7rJ+DzJMGuzvOjlboanjiHXyXjbIdrRgyPJ1pebMLfMO
         w0i/qr7SSjrQy+uuL+uo2c1QVe2vlk86gzlEGQZUVtdQY4T8sNfoOionmlBjDKCKg30X
         j8NvoFAQm1OrSTvGFmZQtw2g96zC9Swf3SVTh1ziCkbcWK6SoZoU7ZLnRdRsZB5uzmgD
         Kw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629596; x=1785234396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=ZwkmqA9abDce+YDSzpHe6Bqmflnl9eg7fIxcwmlaelmALc/MvsKBLimvl6tSLKpAh9
         DRCm45+0/GCoNGFRgjAOoRsguy3p2bPYmTprW0n/9upfdtxS3O1UjgwNXq/fdI51XcIs
         oHH069O1jygZPwmb//wmvat6GNADpzzRKq0IsG20CD19PlDBadJ6VLfqH60jaYFEdgBt
         mzrJDwgqd/VmQWHk9cDP8ld9GsK5eegrNRFD7dSfs+iinRYz1EF/RaoejcZ9Fc7D/bKu
         gyeREMQv8FE96sFEA8STMiOXuqyOGTSstEXnJgWAcipgY0jgZka6Y9JGTM8cg3r6HqhC
         h95Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp+T1qYLWaeqmWbwGVdjrO5TE2upP4HNYljjUoa6XCyDucHTOsZpWu7UW3hLXRY7vQ0F/g7yqu/3erPGaBasSDD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzys5Q/JNfsBsV8fKtCuHDNq7u+4KkP0+fz7z23lEfODOet//9F
	KVr8lcstXaeBm0sz8JkhOLYhgS/YzQtotQFA4LaRLLiQ9W7Lpet59BzE
X-Gm-Gg: AR+sD13dx7jd6IxNRZwNkSwZiPm5DeDFRDCyHyiZwCe02fhaxJtvSlC+xUkIG6FfODa
	jyxaDa9GHFoD46c6S7JPQ2jQRMH+W4JZRwMCK9quAqk3wW322EnNwcKEdaGijWah1prHILhst1k
	DQrZO53ryTtTAdBq81oxKJiVlKtO0JUSCLy0bWZkCsdNFVWYJx7ZNeutW5B3tVMEsUEaNCHY8W4
	dNIOWznHrTQdF9A6vDHD4ntKkoyH0Q28u/LIW9kRsauTIvgmQfXdmc7I7eJq99XVDjLmhaV6hQH
	KN6l8/lejl1Bls86SxTgOQH/5S+pRyEPe/zZ8eRA+j+wQbNQP0BGE0l6HzhAKXaXiqvk5biK1GW
	uhtKhfvaVmFm8wvsQ27fx6VvKgDWqpe63Y7+cMXYdnoYHcSG7MZrv08uRqvURlr2oaJA915jV70
	OY2DCBMLW9d3/3aVrGLztgx9g7nVwDbRwRmeIg
X-Received: by 2002:a17:902:f693:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cf7f6b8e8emr33258775ad.30.1784629596463;
        Tue, 21 Jul 2026 03:26:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:36 -0700 (PDT)
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
Subject: [PATCH v4 02/29] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:33 +0700
Message-ID: <20260721102600.523199-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032637_449062_EA00C2FE 
X-CRM114-Status: GOOD (  15.19  )
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
 sound/soc/codecs/da7219.c | 62 ++++++++++++---------------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..f6d371e93549 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -256,13 +257,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +268,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +279,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +290,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +411,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +444,11 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+				       &val_new, sizeof(val_new));
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (da7219->clk_src == clk_id && da7219->mclk_rate == freq)
 		return 0;
-	}
 
-	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (freq < 2000000 || freq > 54000000) {
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1203,17 +1186,13 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		freq = clk_round_rate(da7219->mclk, freq);
 		ret = clk_set_rate(da7219->mclk, freq);
 		if (ret) {
-			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
-				freq);
-			mutex_unlock(&da7219->pll_lock);
+			dev_err(codec_dai->dev, "Failed to set clock rate %d\n", freq);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1296,13 +1275,10 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->pll_lock);
-	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	return ret;
+	return da7219_set_pll(component, source, fout);
 }
 
 static int da7219_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
-- 
2.43.0


