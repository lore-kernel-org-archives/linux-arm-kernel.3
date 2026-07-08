Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=; b=q4q5LhVS2CLy8feePkYOS470uY
	FuXOL7MWJIx76isX+P/gHllDCNj6xzMfUKz2zGq83pb5kw9R8XjIwh6ISVu0vIDG0CC2lv5HqaSbS
	TbJ5SaFl43qJ++HxkcVD3Y2wBWX6cuF2frL3SovxlzfWTlMoK62A24U0tmxVUJj2+SSojwXSbyAET
	OMJBDaXyJ52FgqMczWvdZb+gsc6le16iS7RNb8AC/pEh3QO5+Sxa9tDj4yNf/ha+gDkTgXUhZ/v7l
	P6JiwjbI0DbGQkBlvQThIdjyqKo4K6Prk5RTJvK2mQc5i5kdUCkkZ8noZ6wl5jVTZgoxxivVyKDEi
	iOpuk3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7R-0000000HGDy-2r1T;
	Wed, 08 Jul 2026 14:19:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7P-0000000HGCJ-2kRj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caced6038eso9602905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520359; x=1784125159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=X/I2Dt42a9pVcBGKX6UeVvpfuPW86TWlohvRLAHBFqnjATL8VNGKeUljrY+8QkIU4K
         ZVr4gm1OtZiJHC8A9TP5ZSIUpJJvnkRkN6L1vfaa7kx/hOMiPb4tWktH5Cj5nPAZKdc1
         egpNGIe8lh/qX7ZPHQNVllLr781ikIJ17FB/S46xta/tOoToWKNOx1PqRwLv1jDDR1Lu
         xRwSSgI+xNiPXuciNjD6GFlkxPpX+rqpcIzXYAmYBV6sElTc+gDFz4n2/bLGHcYJAPxn
         UErUgKqVMZygZSSbpwX721L/ePDnyV5HbC9C873xlyHSEjO8Jo/u2g6EbdukByqP4KSL
         mS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520359; x=1784125159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=JB41jRi0S9o5tSChd2IweWTe3AsCh7RsyeTnKo5qi1KLIIAi+PD8hNC4cpuBBQEwvG
         KnOsUB2+l68YH7k58Z06zd3dqdIIU3GxGFcE2sUa1xWdSoGU75zT2lvkUtn2YuyfBvQ/
         M1g9abIoUAvinwXvodnx9/3rU0/Ee56kEPSqW2SZBIosoUwy48TkoJxhR4ghlfN+w/z6
         kqRWaDZQR14mmlNBTBeHSYCCPWy3BaIdFekunEaNe5bp3m03kw5QZgzkq3Eimh6b3qk6
         oEi5fcP6M8zkmX2DIqfb34e+1Se16l+YKY1FdIc2p5zTg1uG8SvApNxgFemqVwujHnP+
         UkAA==
X-Forwarded-Encrypted: i=1; AHgh+RoYhDueTsE2F0VDYtQYpyfYuG02VcCxRMTsXvHOYaVash4p6tlNYJb4P6/zmEF8fLS+aqLJ409XmkEileUzS5qj@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhleVI9JXag0JFLNsRU+TXNUZWytQIjDkHfAQp0ul84AMXCQd
	4qmvybWiiuKOcaZTkq3uLX+C1/53mQmWWUDnJVDbdjWao/TYx+jTU2Xn
X-Gm-Gg: AfdE7ck4nG14sbdqX6w6chrsYqvVW6J6fF+/8GP0ReBBeojkc+TOw2s5+Dym6mQJnt4
	RDQ3b6JbHvHVSoOb7XuEkLK6gha+Ocj36JnxzIxMuJs+Vgd8ov/bSERHNMCGfG5zYL5qFFGU+Pp
	deLv/iom6AoE+KFMker6LpICdL3ZK8eAVRi47UeelSiKA/cBIYzIU7MATNqiDjBnPUSD7ptWNre
	CWXzVtB0rT3Pi0nXq/pBEuNkl9SWEMzwYu4AO9LF5k7o+6El0Za2zP95xzjbC3RkNKUyr4Cu2Qw
	/2ps1Kk+QC8rmQW8JV4vgSgVVPQ6ZC4yVfMb5WoDziHtOecK0hsPx6hX+Azt57OqqtXzOMpQx1+
	cfwbtWpde8yhX79J0P7Og3keKWwp5woNGt95hPx/7LHsK7XkqHdObxg5jwhSUun/L6OOj+D92yl
	BRKVh7h2QYNT/AUA/YxjcSoyV7e4v4DKnHTjt4zym2FogATNU=
X-Received: by 2002:a17:902:ce82:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2cccadc6e24mr67354425ad.22.1783520359028;
        Wed, 08 Jul 2026 07:19:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:18 -0700 (PDT)
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
Subject: [PATCH v2 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:09 +0700
Message-ID: <20260708141734.578926-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071919_722521_3234D9EB 
X-CRM114-Status: GOOD (  15.63  )
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


