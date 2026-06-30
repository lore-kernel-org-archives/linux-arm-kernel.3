Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=; b=wfNblLl/eY7ku9L9UslmWMSYDk
	4CDdgVq2uV+2rkB+cddYi4ignhH9WqQGGEvVQgCVnseeJF0jVxgBQmON4BBCwS4SP5k4k2siuHnI8
	hmDS3mz5hoZNCXSlLu1d4pu0h3v/jFPQXOxWm6sNYTve3O7n5/b4Vm9THAaIdMvyhALbmdDSBDRht
	lro80DpuhlxfTNySaLOXCV6G+EMwnJ192tv1Tk5NWMHRTEpqWsO+Mop3N7LI38WkfdGDsz14RQSUH
	WRg8W9dWYwAgLlFouKK/9XX1wDxy04LhCq4fTVmVC+Lt1SWW88+BodeAv355O0E1S+2J+eAVm1j7p
	eHzV6biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4A-0000000FxsH-1Kss;
	Tue, 30 Jun 2026 06:35:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS48-0000000FxqQ-0ah3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=; b=QGGzfimA+0GXUC4Wrx7q/eGDjx
	9EJdT3MNo4IHstVqiokPxCvdGhfbIsK/AOMr4imvm2E00GfElw5HbzN0srbuVWWD+J3FO0LNYg+ib
	35xJaBfaIaeQcWvXFfooAdLhcN4GPJ98GufBgo6a4yD1XPBSmd4yXnje5igI2eOLqQG3oBm2MfoOw
	B5Um4J3/zxU+wVGx3QHxGvxo7AOXk4V3x63YgmJ8y9hSOlSfAF2eSby/Khu5hr2PYTfJmQb27NswG
	QNCOeEeSW/14zTYnb5Iaa0ioeBbFuSA39vjop6MVqZT0MLV2OrRg/RV8u6LrKhcKgO6XMJZ56bI6A
	/GY1kBJA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS44-00000001Z4o-1Iwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-846970f0acaso1587993b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801322; x=1783406122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=VoROSIIh8DNlQHm9IgBo3Sv0I4PkG1+0K4IeK2KMs23ihAI0+vTdTj96YuTfw6nnyO
         XmkLmpweVBCfKzTMWN8ZRiAITZigJNwwBE8qPRR7y8EzE46ANfMTO+ACZcNnx7DQQFtM
         U9lXRo5ATabTN+u6gaMiAnEDdZVQ/te6SDZpR+DKUSFybXJ/szo3a8jx/zMiB+SaL9Hd
         HmeEubMgo9uNlGSUCvROzegeNSQ+D3ZCBoSjcVXPf1s/0osbXduZcdbr3BIxA7890Cpi
         37SzehFpt/DoSeFXyWHJ/R2yrnn43A9d5MLXzdVvBbQbas8XGRMgJ8B9/w3wH2JW+ZCl
         dkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801322; x=1783406122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=mWsx3tVaIQm2CT9hah/bJfB1aTFjTNCjoNw7I7u4ViegO6addEGSOj0Sm+RkYLIqJD
         qgt711z1RU0o3W7RoLk1YzOLYLyq+ifynj7WCJDtBVDP/qAp37VT8puq2eW6s8BidSBl
         A1xJ4nTPJYIaervKwnaxfDiBXqBMDX2cgcIw3mgNiGS3fv3V9/exgNZ0bpxITgrtzSFR
         O6eu2zL+qM4AS7YLAvqkYvvhPpGcTnPpACELPQBYtif9Gr0XyZ1SAgPhwn5Ui/w9OZBJ
         x4lq6Lm4xklm3So9y0g063AIlJ+rVQcQRXgHuq0t0x+Hdtbtjiv27i3iNzQXR0SorojD
         T1kw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ52gCcTiwb1DwSy75RYx1e0oDnhLkQSrZ/aSVEmluHRlbRy8P2R8t20U/ylVNLnGX/wUD1GPYFUI0ns3ZhBan@lists.infradead.org
X-Gm-Message-State: AOJu0YwBI1TktUwvHtzPTz16QSEre5C1npTT7xQnZ3uQd/n6BDZn2yQi
	OP1rKAVRte43Rjfq/MtQT+aFv6HcXmIVcnM04BBmormM3XmBCM7FFuDv
X-Gm-Gg: AfdE7clZP0MYG3AIMvqc+sL5ymrOJ/FDBTrkCCDr92OQODjxUWH2AFUWAsRRFLLXBBO
	XVQpnqb4E/2G0FK8tVkPZMyaVEoyYnc10zE8O1ZBA9sz6HujX3lLBgI9vi0kjre+iNYkdEbxjSD
	zN8p5gimIGjzbw6B2TH22K/wO1IQ8fnLmO4JBPIkzqSvBPfTzRTbr7hGyDpw+Fu5oEIXwgimcX3
	rKJMheR5qQcN4wlbQA4so85txvptK+2ZQ22uGSDRZPY8QEAEFgxxCv5OrVcgoy38bi0fUDFF+Dj
	xZVztP5/m3fWvloSHiKlAzVLoNqJg0pasuVP2zKbodzQPr/UjTiyi2NHJOeoc5LgoE7E5lCFPFJ
	h0Ts/DIhUa3VglVTE0+VQ8mr++73p7Hx+xozsMUHTVEI1bDRv844DdZrrj1/AYuxepEn0DX4hsC
	31yPuBiXZXlwOyoKorFGH/vuF00YIAx48YF7zNg4qH8stsF9k=
X-Received: by 2002:a05:6a00:b481:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-8479f1702f7mr1952682b3a.27.1782801322126;
        Mon, 29 Jun 2026 23:35:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:21 -0700 (PDT)
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
Subject: [PATCH 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:24 +0700
Message-ID: <20260630063449.503996-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073525_096059_2255A8DE 
X-CRM114-Status: GOOD (  15.07  )
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
 sound/soc/codecs/da7219.c | 55 ++++++++++++---------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..915b1d3b05ff 100644
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
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0


