Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=; b=n8Gxv9/SPBPhT85e85AJMkxtdv
	+Euq+ouahYCaDRsbhyqOJjl1CKMMau5SAxvaQMNHryPyczUCmfOjC2n2gCRoR1IeCD2ZkcWujcFlG
	ZGmOdQ2JqhPDkYdh3mBeu9Ye/cxb92ZtOmTRoc1Qp86okbjhRXMtuMw4qYwwl7rNJ5sNACGopGPCm
	KmXAsocerAARqTH8xXwpODLiAuXDES292c8BUnC1FJ0onDA/Itv/G/2ZcjXlcJB6u7CqmufXQyY2V
	Kxi3n1jJ8mL4S3/2li3vocte4YNnA9R9wMRWp6nBJOCpt7a7X7FpuHRGnQoXsfS/rUk2NbRvn3wiV
	vhB1Evnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TU-00000004A9z-23G3;
	Fri, 10 Jul 2026 05:08:32 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TR-00000004A7D-1Cme
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:31 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so295834a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660108; x=1784264908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=;
        b=IJ8pfn9iV9IUUJjRZx/B1VJs586BU1wB43h9SSM+4R4aj5qeVPFw0uhHLnxg2MLcNn
         rGWPSWOtHiMt5jj7J0Hs76CskG+Yef/xvHTRso82SVX0L8aKYVh0pDNnFsh321LTDWzl
         lxyx2pGTbOggEMpIrytUQK2e5JA9VW8tPDMDguHf2GBcgkmPnmx33Q95Bs/iO+4TBseq
         ITGDsiAoAMlsPN+UkNa+hdq39n6H5o3Er1c980GLhBpKlHLPD7QQlQZ4lRO+Aos11Fgc
         8WmgBcJQc91Y8JzsHiLqH6ydS6KnjfYItNDoIxVTmUZsyvC18TBuRihJ/3vjjoKk2mNN
         WjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660108; x=1784264908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=;
        b=WeXwD+oMJp6vXTWDfvArYfHMv1dw4DQ+JkAspSDHO4Uj4qgplhnKr4SRaTPDvIKxnI
         PJZFQ8l0cvuGSW7R6DABLE4NoMi4DK3aP3daheVugJZZ1vdD+BspQ0uBUmbfokvpV7Oa
         PgG++1LvZAHtcAP/eFW8Ik4Ms9d3ZGNTlA5G5WaiSSd3A27XE2QrbuHWoQ0rGgWNEXR+
         eJsrVYl2K/LDRYMBdAcT/aBiLnLOCCWsdJTllmwpaE84sDaDXf3PVAyEpgI+srTbgUPr
         d8zTwIx7kNB8IcFbqSLmm/d2QZTukj1E7Vxtm4yqKlMKUI6IF1ioh9UASnSb6QjFYlev
         plyg==
X-Forwarded-Encrypted: i=1; AHgh+RpKHJ6E1s72qqCNICA5mRxRQZuHS+aJa4lagzbUdDGFEkxg7ivmHDKhpPqnpDWc6Zt0+hPcxvNlWK3kDOTmlB+h@lists.infradead.org
X-Gm-Message-State: AOJu0YyfSYB1RhFnHoP9d1o87S3LRZCxhIcT7SZyyKYXpED4cGSVCnJw
	Nbjmboo2DbbURCD5GeK0uyUvPndnuQQyGJ9sw5GvvSV6qqHFu2dmaNpB
X-Gm-Gg: AfdE7cmvSnLqSi9BJpQg1K0gAS9OMtvizs7ME4uj5EiMLk0fsNFYIwnJltMZWyoOPvd
	HKpHhqMXok0teuga6hj3YpaAA5ZlXn5EawPNy14VP/Uyo8UVs5MzWaGR0SFfA/VisX1w7Bxj6Xq
	TExy5EyklSFj0q7vetAG4Fr572t3IXZnjBWIHZOyXG93oiZ8aIdvAMmSR4JRwDeoGrBWiQ64J7E
	Gnl9mzQZWSd0j+TysezzEtIeFbsNg11DZKmwABlPO/dBCUB38JvsWLl2e8lXamyqZDwULrevYVa
	VcD698uo9IcXj27PUtGg/LCxD5tSaBX4TZF8BypvZfl78eIXgSh3mqTIiuqQHTtoVOGHVvofv0T
	vk4wlJZm4a7+DdbUJuK1lmRvtr+Mj84/pb+9Ryt79dj2C1TWkMFr8AYVHRP6kufD0DKc5GEkl1m
	vC75MH0C//oel9z51xECHx7efHIm83o/WN7MDs29NOtZ5r0LfEWCQ3wC7kzw==
X-Received: by 2002:a05:6a00:94db:b0:848:760e:eb76 with SMTP id d2e1a72fcca58-848760f2415mr1344232b3a.61.1783660107924;
        Thu, 09 Jul 2026 22:08:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:27 -0700 (PDT)
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
Subject: [PATCH v3 24/27] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:08 +0700
Message-ID: <20260710050511.14439-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220829_356887_A64E9069 
X-CRM114-Status: GOOD (  18.27  )
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
 sound/soc/codecs/rt711-sdca-sdw.c | 29 ++++++++++--------
 sound/soc/codecs/rt711-sdca.c     |  5 ++--
 sound/soc/codecs/rt711-sdw.c      | 24 +++++++--------
 sound/soc/codecs/rt711.c          | 50 +++++++++++++++----------------
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index e028a1c3a9ac..e292b28b029e 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -415,13 +416,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711_sdca->disable_irq_lock);
-	rt711_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt711_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt711_sdca->disable_irq_lock) {
+		rt711_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -443,13 +444,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 3a26c782d800..9781f289f8ad 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -450,7 +451,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +516,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index a0c6a9efa840..4ad2b1da1954 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -422,12 +423,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -509,11 +509,11 @@ static int rt711_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
-	rt711->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt711->disable_irq_lock);
+	scoped_guard(mutex, &rt711->disable_irq_lock) {
+		rt711->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -535,12 +535,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..3e49c3d0f25b 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -89,24 +90,24 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	dev = regmap_get_device(regmap);
 
 	/* Calibration manual mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG, RT711_FSM_CTL,
-		0xf, 0x0);
+				0xf, 0x0);
 
 	/* trigger */
 	rt711_index_update_bits(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
-		RT711_DAC_DC_CALI_TRIGGER);
+				RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
+				RT711_DAC_DC_CALI_TRIGGER);
 
 	/* wait for calibration process */
 	rt711_index_read(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, &val);
+			 RT711_DAC_DC_CALI_CTL1, &val);
 
 	while (val & RT711_DAC_DC_CALI_TRIGGER) {
 		if (loop >= 500) {
@@ -119,16 +120,15 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 		usleep_range(10000, 11000);
 		rt711_index_read(regmap, RT711_VENDOR_CALI,
-			RT711_DAC_DC_CALI_CTL1, &val);
+				 RT711_DAC_DC_CALI_CTL1, &val);
 	}
 
 	/* depop mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
-		RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
+				RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
 
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,24 +362,24 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	if (rt711->hs_jack) {
 		/* unsolicited response & IRQ control */
 		regmap_write(rt711->regmap,
-			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
+			     RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
 		regmap_write(rt711->regmap,
-			RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
+			     RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
 		regmap_write(rt711->regmap,
-			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
+			     RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x10, 0x2420);
+				  0x10, 0x2420);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x19, 0x2e11);
+				  0x19, 0x2e11);
 
 		switch (rt711->jd_src) {
 		case RT711_JD1:
@@ -449,8 +449,7 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	/* power off */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +510,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +598,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +906,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				     RT711_SET_AUDIO_POWER_STATE,
+				     AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0


