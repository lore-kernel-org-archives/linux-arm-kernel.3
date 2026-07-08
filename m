Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D9BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=; b=J9lh2Ds4VSl6aUuFbZTVPfc6kf
	NV1dDYqPhSfURuela+ZNysFdhVVZgaxNje7qStQApTlsO0gabtDnFcOP8Q5gg04e8sd9rHT45+LL9
	FUjfcb9KIOgrox0RbwvzIjYmbhrrmWxAD5G5iOivEoAfItLpHKyJjwf27s34A8hW/lYppnLCj83rj
	jkqd0gUMy/Amfj89f0t7YCFJJ21I4iu1Pwzhtm9SDHsYjIpKLDozaW+HqUM5QEzLPoT0ocHOgig05
	QOSp3BAMKvnftKNmkmN6gaFFwdl5GlQQkjR2ZTDCEeRxcdOOYORBq4Cqu558RtNW5x9HahNMnmfCu
	yfVjVetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAJ-0000000HIZf-0l8I;
	Wed, 08 Jul 2026 14:22:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTA3-0000000HINB-0MQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ca70925c25so10434735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520522; x=1784125322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=sDz4Oy15wz8ponjK5oFbksixhNLx93dYmFIVe8Up1Pn2UBWObZC3twFU3CdjpJDikt
         T7xGz75BX8yIevG9S4dh/EsJc7AtR+tT06dwwso8uPS6aeSVtZcacfiPF8LrWLrFb5aO
         1UNxkK2Wi8LOKbhFfjDLNgYOvWFDWWm3hlXQPP3bH6BH6U2YzLe1sw+xWem/TUwX+Eih
         Qr7APXkOwtRuDX6XsxvWCWiol2Mj2g8xdybQ5qXVEJ4Ig9cBKGTWmgPnHwH1Sw4ZGxaQ
         zXcH7pDjeJT/5z6NwZa1IU8YC1NIgpfgATWjYWRf5ainE99e+1etHWnxOLC4kBFTKwnG
         yqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520522; x=1784125322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=ZvWZwdOHSrc/hFH5etPnbJiiQlH9b1qN0VqtV2MX15BksoMBvOi2/X+yhdEMLJM8Mi
         wm2zFeFZF2UT1bxdejImc2uvceFMFhTAOu6AR+5VQlMM3e+eDp9v/w9ZyJdCYHb8W+q1
         8KyuHf/xPU0XyDhlxJaLYEWf19oG0AFZUE8zchYll9y1B1/sEy/8G3BsL6gD+vqqJl+i
         Cl414SbBQR4PP1xDXCfVjHxnqL1dfpIpmh+GZ6Z/LGvWTLmfnMGQA42uFQ8n67aYlwkq
         4Cgeea2UoJ8GfFiWbjTznPhE3hDAu1IZoJt2TB0qvg1fpn2JMhPqjM4C1ykmO7koJiau
         qp5w==
X-Forwarded-Encrypted: i=1; AHgh+RrR+1fI5ne6FzezbPl2MvjHkJzDurSZyvhNoFwV6Wh2abfRUaFkjl3hJ1X6wF0+eLlKA2Crh2475QMmtVz/1LSx@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFFu8iE9MV75B8P45E+p4/ROCE5Ixm0DKnbdifa9SaIDFOssz
	vn7FVKTCSP4XDSt/ZXfzzFIveSD3WCIZ02yr3pc/zlzozQDIHvpql0eZ
X-Gm-Gg: AfdE7cl8jcFIMNmHcmqdu996h8yNi992te3KQ7tX9a3mncNt5ojI9mN0WjXHx1GR9J7
	CyCWJfLIzi7W4+VPYAK4nZVjidDrTH7FU5I7hOL04Z72iHwP9Ck2aVKisR/hN9gUYjrke5rf0N6
	qwgMip9weAr0oSXweuRiXShVE42iIGCu6WPT4tvpW5tfrmV5hI37a20JTEIHEePPaFsg7gypkYJ
	nMpaAnafQb+LBLApKHTDrqBz0Ulz2c9XKFBC99T9QsXTdk7z4E3PNBPACsninkj/1A/bP1kpW5v
	rENpPQ0MPeYzJKUg1FUfD9AwQB0VwCDXaQ2Ji82bGMGEFhx9kFiQh8iJRlvDTfgSbfSrdoyls4c
	vkrp6b0G8xx1GGCtPWcAByPCg9crsWmSOmsJJhcCzboKjg+lxzkQyLA9+PQMBUizQFdHk5H5axG
	5nWOXrLhHx4Zhxqu0kWwD8dX/GJct5JvAs4d5fPDAaapnXs7g=
X-Received: by 2002:a17:903:2acb:b0:2cc:fa3c:3112 with SMTP id d9443c01a7336-2ccfa3c37femr3310995ad.38.1783520522330;
        Wed, 08 Jul 2026 07:22:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:01 -0700 (PDT)
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
Subject: [PATCH v2 22/27] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:29 +0700
Message-ID: <20260708141734.578926-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072203_152730_B777DFD5 
X-CRM114-Status: GOOD (  17.05  )
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
 sound/soc/codecs/rt5682-sdw.c | 24 ++++++++++++------------
 sound/soc/codecs/rt5682.c     |  5 ++---
 sound/soc/codecs/rt5682s.c    | 17 +++++------------
 3 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index dec8c2147d68..e7dc4f722fc1 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -6,6 +6,7 @@
 // Author: Oder Chiou <oder_chiou@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -660,12 +661,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt5682->disable_irq_lock);
+	guard(mutex)(&rt5682->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt5682->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 	}
-	mutex_unlock(&rt5682->disable_irq_lock);
 
 	return 0;
 }
@@ -736,11 +736,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt5682->disable_irq_lock);
-	rt5682->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt5682->disable_irq_lock);
+	scoped_guard(mutex, &rt5682->disable_irq_lock) {
+		rt5682->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -760,12 +760,12 @@ static int rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt5682->disable_irq_lock);
-		if (rt5682->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt5682->disable_irq = false;
+		scoped_guard(mutex, &rt5682->disable_irq_lock) {
+			if (rt5682->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt5682->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt5682->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4b82e07d3b2c..6f7e68c20d13 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -6,6 +6,7 @@
 // Author: Bard Liao <bardliao@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3125,7 +3126,7 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
-	mutex_lock(&rt5682->calibrate_mutex);
+	guard(mutex)(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
@@ -3175,8 +3176,6 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
-
-	mutex_unlock(&rt5682->calibrate_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0..34997cfb465b 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -6,6 +6,7 @@
 // Author: Derek Fang <derek.fang@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -648,7 +649,7 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5682s->sar_mutex);
+	guard(mutex)(&rt5682s->sar_mutex);
 
 	switch (mode) {
 	case SAR_PWR_SAVING:
@@ -695,8 +696,6 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 		dev_err(component->dev, "Invalid SAR Power mode: %d\n", mode);
 		break;
 	}
-
-	mutex_unlock(&rt5682s->sar_mutex);
 }
 
 static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
@@ -2534,7 +2533,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
@@ -2556,8 +2555,6 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 
 	rt5682s->wclk_enabled = 1;
 
-	mutex_unlock(&rt5682s->wclk_mutex);
-
 	return 0;
 }
 
@@ -2570,7 +2567,7 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
@@ -2585,8 +2582,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	rt5682s_set_pllb_power(rt5682s, 0);
 
 	rt5682s->wclk_enabled = 0;
-
-	mutex_unlock(&rt5682s->wclk_mutex);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
@@ -2997,7 +2992,7 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 {
 	unsigned int count, value;
 
-	mutex_lock(&rt5682s->calibrate_mutex);
+	guard(mutex)(&rt5682s->calibrate_mutex);
 
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0xaa80);
 	usleep_range(15000, 20000);
@@ -3034,8 +3029,6 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 	regmap_write(rt5682s->regmap, RT5682S_PWR_DIG_1, 0x00c0);
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0x0800);
 	regmap_write(rt5682s->regmap, RT5682S_GLB_CLK, 0x0000);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
 }
 
 static const struct regmap_config rt5682s_regmap = {
-- 
2.43.0


