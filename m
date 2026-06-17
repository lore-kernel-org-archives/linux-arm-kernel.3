Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C62CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=; b=081LMoApfALFKbJDk1g025/fNy
	pY+V3ne5g1LePBwc06jD+6nHBubDZ43WzjMdexRQP/S5BV92n1p6TONiUTz4y0Bq3j4+FHiAsncKQ
	3HOyLsJffvum20AioKfBQDWtMKmb9Ww9tu84xjw/sml9Gs6ltPlMUdH14IoJEvemqPXVqjxtjPpUQ
	eGaILk7Tla63GwPIKvrSNoq0XE4daRwni0++5PHUc5xtwczUj1q8sTEToJaghIoHN8wjpxlTOgZTz
	q5lwTBsVCyKp4N+P4Hmendamhda1MefFHrxfuK+Ybi7CSH6lf3mQjbT3JL6O4dLJnrgtAHpPXkOC/
	/N+OhA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhd-0000000H9lV-1u3Y;
	Wed, 17 Jun 2026 10:41:01 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhZ-0000000H9iB-3Mte
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:59 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2732207eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692857; x=1782297657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=cX34vhuPO/mlD6RC+pBf+NDtr7nSFA7olErudnd5ZgC2MBK6FH/wa+6G3rP4RR8m2C
         mfXNW7LMUZsdbYd4Fpi2jj+8uBP5GhLtYq+ghemq4vKUOX0kO2mDNSNXu2P7iRdd2AYT
         DoPi0OgW759zaJJlVguiYv1AjozcOTzGxUCt0yMufXGPEoWDcGliWAPRZff318Dqx1Fx
         d40fKmb57A0oW2LcOC+XXa2p2vDeRhLwcl1HaNaxvItxrtCoNqZndBXrihSQOJoMfquJ
         Z4FdfgcUV1R0Y4lB1ezOnU+Aihkou1zMu3CNbg39q1+ZDn2BhkR8nvYOeliqXEd4cIT0
         HP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692857; x=1782297657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=kAn8tz2PyvVRmyLavaKgbHMR9vBwd1DnpcPUgXQwIZBGjUmxlCd6gz/XNTcj1yVwhH
         EUUV356AvpiP2fo/ANO32x6tHYLbL7p4H64B4i/YxpSaen9fIC6pjHwN8bRNWDHd05RJ
         wlRHtPe7C/9v910GT+CcgZYBpbXIg4FKPATUIx6iNzjr2K84cynFuupflexyQFz8kr2d
         ev96lihx6ThqOkvsBvFGWhc9qmr12Ys7dQuI08goe7Z7mJTzM0DwETwm5laF06qNu/U9
         CYLwg22nWR7HqHJu+zZDEQNXSe6aUWieiIkHdKvQ5TscN7faDwY9VGMPKubVPFHJt4kX
         D4QQ==
X-Forwarded-Encrypted: i=1; AFNElJ98awfPvmlgADW04doKagCbPlW/uOk0HWYTaYIMfVgixeGCfinDpaQb3rK9VS+iWRgwCIgDSifGmuczc889cqWG@lists.infradead.org
X-Gm-Message-State: AOJu0YwhtXOSxwLorh1D9jFxtyNIVfv74JIvkl5mEo1cyejMQ5ohf6lh
	I3BYFUok5xxOzeci4vm/Cj/GMKxYV+imb56Ec7mIeUsgjw2TedCbrpSw
X-Gm-Gg: AfdE7cmpRGgGAkZz5hKZqLyC7kfgceANSn1caNDFHGIupm6C1JllHBaDUYgrhjIlw2f
	lyjMrk01sQprgjb2O7EddzFTVbXuS4pAsy/bTFCUpfzZC14uW+zGeTIw9x7a+GSWsJflA2dat1l
	/zNA44OlXKejitGYR3hNwqjLP9HdApi5Iepw56Viqfg0p0dDW4zW4fJZAJqCVEQKRLmzsJKzdr0
	PXHhcFfH+xz73OW/qCZPth6EGQvhW0fedJaGzaS4+bApQscJEpX0kRoCvQq2/Orzfe8wjU9Nxla
	gpqRZBM4UPfZ9bD2kFMpgiYN359uD+e2358M1vtcKWVghmHWviCwTwedkrmfwH+ffJraEl2e/TZ
	rxwZ+x3DRaG1+GKbpo12GgjKB/dhJ16C8SHE6tl0fbQJdMfroAhKPEkX/1cSfMr7QXW435DolEg
	f4DspNkY536GL4DLpY7jPkYvcPvDi1FxLaH7tw7Rxknl1xZa4=
X-Received: by 2002:a05:7301:10c5:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30bc9cad496mr1423566eec.3.1781692856764;
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
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
Subject: [PATCH 51/78] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:08 +0700
Message-ID: <20260617103235.449609-52-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034057_924269_50850E15 
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
 sound/soc/codecs/rt722-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt722-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0f76492ff915..ca5a4ee6ce9e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -368,7 +368,7 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt722->disable_irq_lock);
+	guard(mutex)(&rt722->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt722->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -432,12 +432,9 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt722->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt722->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt722->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -514,13 +511,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +539,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..5fb5dc2ee3b4 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -294,7 +294,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +317,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


