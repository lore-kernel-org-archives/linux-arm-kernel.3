Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7358DCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=; b=oXF8m8sBja+32QWasHuDS1EySR
	FiV0UaUtWaDWyWlpNZkak3nhyWAbq87/cW9ZLGg3WQHktVbQDMBRAdyfvEE+h3+jHIQK1D5UBz/70
	8UZ9xrwFzq5dFHJsP/OKqDGogeiOwaPoA1FzwFmT8A3QtdiYFfsPJEFCX50aBSgOBvyjfyN9appqh
	ymk9EhGhl5FMKelDle0jLAfWtKmmO9+JZDwPbE9cRdeFOEXHDP4qP70yRyJdeIlGG+pOfv2y8Hv7D
	8kZRmDIhq7tWApLCArpT6tJw4YWiWBzwQx/SmcuQr2uNVPFHVnzKovzkTvaoeGtFeqGD12SlecNiH
	WZt1xqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhM-0000000H9Wg-1HhR;
	Wed, 17 Jun 2026 10:40:44 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhJ-0000000H9Tg-0a2A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:42 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30759632453so8918863eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692840; x=1782297640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=d7Ehd9P7wSQVOG32OzQ7ayo2GAB6tO1tvs/LenkCeY+n1Xd3d19XYnV+H6M8zNysmk
         X0CYhB+Wbag/ww5yXSneOooLoq31iNS7g5yFLT1UsF2JrayhlgafFbKYbDfl9O4Hx/3q
         d8y5zCO6f3Qaxu7p56BdQyuPmp7VurIR/GUfRGPHdgvrXa4fTEvwtRNL1xAF4KaAJ5sv
         4IwNj+fZYMY3InQ2G4EbEQoMoG4neqxLxtJ1GDTtSlBcS5s3yYvT3yieb+xr08XF5kKn
         w+tYMXdDBU91PM18KSci9ywlsH4sHh4ZWZ12suiMMxIbB/xKE3HBICDI7JtEUgcVaXva
         MruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692840; x=1782297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=Qc/CPL/ENM6abyQyySTUlkeqycPaERt8L9lAPjMzzZTdu9kybsKkPnLvPX8qSMrfb2
         Vo+l8w4Ml7ewNDbaZ2rKnbmPYXRyo7W+tEAuDvWAp2iA5OSO/iyssHNmHL8LOfZXYNNW
         /FxUqC4rtIilsjNOQvO0np19f0nRTc79TKpNzn2GMMHoeialRALSqg4VqVgKRF25BEoO
         5ZHdvsh23an57jANcts2EGj4UzZZ3vyhxBYlWpYTo0hZJGAn94S3RYoe5dxeP91zbkhO
         Tnl5CRWA9uWjpW28mFKmiZdwBF7iIXGZllstq2WcYsog1Fzou4a05RHBsDEvB4vMxpQr
         4stw==
X-Forwarded-Encrypted: i=1; AFNElJ9D0BPsbsdzjmFJalVp6lEPxJlQr0vzc2VVOwBlZYLVJ0wQinr8aDp7a5QQgtD6gZdD3nvOt8SAHzfxOJ9eJFLs@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSxwJo86N2BO8RqBabaWiVD3I68CFcTfjW/19p1TozTB5aY2t
	PgKO6Cr+DQiNL810WjpSywg3y7+jN0INAgFK+FVsQZFi7TVZQPAU6DwW
X-Gm-Gg: AfdE7cmkn12T78EyroucH7rfmGlcNMaXFCxwS4PasQY7AcpoYSISXmARRN5VkrR3Tvm
	lkdZMmWMnKTeiF429Q9KLBV+99zS91fHx5AhEs5PaizeuHv2rtqJo/6u0ahPLXqwy6uOXs5wCdf
	mRkre3zKxxckq25LtTVt4ZoXcJKPlh4pQkTRVB2ugqPa1OV3w4GXglbBBEZBxuMwZqH1pKjY1vt
	yC5Xp1eJztLUaui+MzrHbqptopAdCClMlqthsikKd4RQ491lC2j0DPTVhADPqO8S6c7dKhoSacO
	QxsS1O6dn9MEcOxuC5aIg+S3V1jQe/u1uRyFH2Ea2p85aLWTcLNQHWPQzyPANbWnVRzc1O9YKYS
	2ADSZxjbybs5cUSm1RwC9FyxSLpNQ9wlHODjgIO4wDrtHdJ77HotPlyvFIC8geuCSw+B7if0W1y
	dildAL33UFYmFdwZiltqdsIDmN+JHUQ5Tu8UVISNa7tNgHCZDez2nwybvrmQ==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1722160eec.29.1781692840150;
        Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:39 -0700 (PDT)
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
Subject: [PATCH 49/78] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:06 +0700
Message-ID: <20260617103235.449609-50-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034041_172265_485E668D 
X-CRM114-Status: GOOD (  14.09  )
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
 sound/soc/codecs/rt712-sdca-sdw.c | 34 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.c     |  7 ++-----
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 581732180473..066d15399bd9 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -277,7 +277,7 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt712->disable_irq_lock);
+	guard(mutex)(&rt712->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -341,12 +341,9 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt712->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt712->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt712->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -428,13 +425,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +453,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5db478633f17 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -79,7 +79,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +126,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +402,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +449,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


