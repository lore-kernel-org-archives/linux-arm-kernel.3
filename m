Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5F7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2Fk9ynsoms6SbafZDmk8Pz5BAewC5p9SQQnIzzSYps=; b=xw/hkUCdBwLKG7oRYs/Io/V6TH
	GLoQShUAXvg+Tf+Dd0rE5bFTI6AiwZ6Xot2VeuZUId8OsczuSt7vTcCx0GVutrzu1ZV5KCHq2yG7w
	aK1WbV3PmLICA3eOvI3Q0LIzP8jzkhpWsqISEixIqBgedoqQocIqHcONMJkc+vSHZR+rfrnZnMhHO
	cUyiD4AuDY/QmS5I1ACFg6qxg3dhgcPgvROs81hUcJDMhaGCeWvaq7YvNVw2Gsy5cZtHDcCwvcKQZ
	gAti5Emw54WIbdDdo0FmM3F0VnUOmhBUWRwUYKCF/OjvryWR3yRKowgd3zaUzt3jsZQTvWs51CuvD
	3jm09EgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngx-0000000H9Au-1Lf0;
	Wed, 17 Jun 2026 10:40:19 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngt-0000000H97p-1N65
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:18 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-307d0405e07so8461947eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692815; x=1782297615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2Fk9ynsoms6SbafZDmk8Pz5BAewC5p9SQQnIzzSYps=;
        b=T+pOFmbYpFg/h/ZkpsRxZ+zeSLwt8mH9NmVke4lpTCRx6XgsBEI2VtYe4zbAeesngB
         PXmIG//Cxe9U5ZXt7kV9Y8XjWQdNg+GrhLy69/FEycYmlq5ViJIuYGdIOWO8Ed5dhbzC
         uCEk4tmGHLA7poorvv+/OuvpU4qIMvREtsLp0Tf/MGcGVCNIN48UvjYPjnwPaZhy6Vbp
         xBJlkYJmdl7FII8jVv5kp4j/HezFfOv4enCdj11jP9DKfgRciWtbbgnlyxLYu55LBKmZ
         Q2QqvECY7+HGRIqo7bFsH822OCgzyIsulqlTdhkS5kfNwt/j/rnGrLwzV7qrLMbs8wbk
         xVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692815; x=1782297615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2Fk9ynsoms6SbafZDmk8Pz5BAewC5p9SQQnIzzSYps=;
        b=jgZuT+oEx9zDLsKfLWQs9VOOY9ENpg1S2S2bBjDOjick6/S4JSZ0syYow6LnWvGnYa
         KMg17jGb1KvT9yz/Ie1N+/awkFzKA3tO3pYZjJo8ftzywKhRAKOWXVdDuvEWEq6CqakY
         2yxbnRPvsuAAy9sK9d2MpEHXgPzv0b67pzfIXC1fAFUgL0d8GWqQCOqzvvlfzraGJDVF
         ciVYU95GWr2vChX65hRwZ7UqguBOU6/rmSTD/VWR1nYU1mNdO3nwi0RLKRsbTT93FzB0
         ppPAzACuwU3WGavy9Ff9HVTltHeCtr8JbmOc0q7M1QC5KbCytEMXu0w6kM5A09nOvhHf
         TfLA==
X-Forwarded-Encrypted: i=1; AFNElJ9OFwNt9k6sD1ZnNc6TrXj9FKUJPtijtlkPPXaJJyhuQuGhrmEkBeZLYBOOnjH2nMr+NZwajQiU+212kPDrz03V@lists.infradead.org
X-Gm-Message-State: AOJu0YyQmi9WI3wpXJn5zv+UY2He9Lvb4z3RnmnLo9plSLkLNTGu765j
	wnM8dtFyQZfOViovla3W1ZTY9quSJZBVmOW/qIEkGDYR5IFcCvLjsv2V
X-Gm-Gg: AfdE7ckiz2YYkOyuwAUytZ0BjGo55zBSinnufzBoMgYEs42he0Q14v5z9l9P5C6ptgX
	CG06/VulC2ZfI111e+Tj720oUjxTTcPWaS3dFaXZPYNXc2oWu8sVLx9nClv58U/HAf7gm0loVWf
	azhsCOi0c3bWxQm4eJo07IfYRCZPu3mBnAp2iJRw4Q6i1NsKP8mlEws3299QzIpdhjEOViFKkNR
	5WOdH4zsHmLXAjNa3Xbav8GmtwWu0WOBqXL6aiXQsCKEyGlTWD9jdREdCKUdLkiYsQUftDFiqh0
	6/9TKwrpWTYbY+TAbiJLo+RR1kMaDIj0K0rDmJ3F9a+ODJAfe++mu0zgJHYawsQ/3acvCeuK8AC
	sjGMygWcutJP9svg+TdH/QZnaYmz9kc2YUoQWQXU/iFLRAWVYwnKgthY26ak2l4fi+0wRoOH4yT
	HAL8M4IC17t5NBADSWDqXouldczrKSnlhsos4Z09OECoB08fA=
X-Received: by 2002:a05:7301:5f8b:b0:2ce:25be:c8e8 with SMTP id 5a478bee46e88-30bca0ab35amr1737019eec.17.1781692814574;
        Wed, 17 Jun 2026 03:40:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:14 -0700 (PDT)
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
Subject: [PATCH 46/78] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:03 +0700
Message-ID: <20260617103235.449609-47-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034015_373814_AF73AADC 
X-CRM114-Status: GOOD (  15.52  )
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
 sound/soc/codecs/rt5682-sdw.c | 23 +++++++++++------------
 sound/soc/codecs/rt5682.c     |  4 +---
 sound/soc/codecs/rt5682s.c    | 16 ++++------------
 3 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index ec2a35a0cacd..2b23c84cf203 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -660,12 +660,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
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
@@ -736,11 +735,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
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
@@ -760,12 +759,12 @@ static int rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt5682->disable_irq_lock);
-		if (rt5682->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt5682->disable_irq = false;
+		scoped_guard(mutex, &rt5682->disable_irq_lock) {
+			if (rt5682->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt5682->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt5682->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4b82e07d3b2c..7a7dd99777c7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3125,7 +3125,7 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
-	mutex_lock(&rt5682->calibrate_mutex);
+	guard(mutex)(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
@@ -3175,8 +3175,6 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
-
-	mutex_unlock(&rt5682->calibrate_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0..4510f59f68fb 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -648,7 +648,7 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5682s->sar_mutex);
+	guard(mutex)(&rt5682s->sar_mutex);
 
 	switch (mode) {
 	case SAR_PWR_SAVING:
@@ -695,8 +695,6 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 		dev_err(component->dev, "Invalid SAR Power mode: %d\n", mode);
 		break;
 	}
-
-	mutex_unlock(&rt5682s->sar_mutex);
 }
 
 static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
@@ -2534,7 +2532,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
@@ -2556,8 +2554,6 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 
 	rt5682s->wclk_enabled = 1;
 
-	mutex_unlock(&rt5682s->wclk_mutex);
-
 	return 0;
 }
 
@@ -2570,7 +2566,7 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
@@ -2585,8 +2581,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	rt5682s_set_pllb_power(rt5682s, 0);
 
 	rt5682s->wclk_enabled = 0;
-
-	mutex_unlock(&rt5682s->wclk_mutex);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
@@ -2997,7 +2991,7 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 {
 	unsigned int count, value;
 
-	mutex_lock(&rt5682s->calibrate_mutex);
+	guard(mutex)(&rt5682s->calibrate_mutex);
 
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0xaa80);
 	usleep_range(15000, 20000);
@@ -3034,8 +3028,6 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 	regmap_write(rt5682s->regmap, RT5682S_PWR_DIG_1, 0x00c0);
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0x0800);
 	regmap_write(rt5682s->regmap, RT5682S_GLB_CLK, 0x0000);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
 }
 
 static const struct regmap_config rt5682s_regmap = {
-- 
2.43.0


