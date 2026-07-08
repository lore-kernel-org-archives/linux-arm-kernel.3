Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A72FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=; b=Z9NPbtSjyVelgbqTQvLqG9Y7PB
	GmyMWBgc7IAWnA+Ym4df4lK1Ajo1rKntdxcb0QUmO7+XE6+89rBVKnM+l9UL6baIZbJXVV1UwOWtP
	xQ1/0ihQPjqCyN9c9CXTueabQM7SI3S7+eZX7PRpXsfviQCmxNiNI/+7Zw+butUM4w+bi/bbb9HEi
	nP54AajGeDc/T0b9gFz5/Ez2DfnRkkyegd+V7gqTU9sXDH1aH07e/7p1YmmOK7DgPBAVM1Pj00cKW
	/b6g09SBRqaOgTiu3788maPdiuqlFiYt4yJ3nlgHzv6x7xFHByuJ2BijIbNYSNmyEUvOrtfBmVvua
	IfgJkdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAi-0000000HIs7-0YkX;
	Wed, 08 Jul 2026 14:22:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAQ-0000000HIgX-41jm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc8e87f29bso6287025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520546; x=1784125346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=RpX0RIKcZzT55Vt5nxaMjB8xEmwuGHRZBuDG2NLJ7DuuuL8CnlKVXKjS3R/uo7P3An
         MsuhpMf4IeOFws0+5LsNEr9DJB4/mAKAFb+5AA6+xJegUI46hb4P+/R6yihDfe3Jkbxp
         TB7A7o0d9Hri2mbkDf9spn4ewmOwFqQgXTBiL+FbtW37gZrgHWroshnyun9xifP47Z39
         ZC1Td4EgavNLmAA3tHetgxDMmdSDeqsMz9bkJtcqyVAcruFzEDrpbnPLZOAfAjsdGJ0e
         CST3vjKPnH1mEmXGqEfWuSSfJKlzVWovXAeIa2mLg8czIInbEkvRcAzDjI0p6N+WpuaA
         nZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520546; x=1784125346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=OakGdnVZeNHX1g2+/v5po5VRPq/yxGXdwNrB1K0CKul90BTjCg5UA5NHLjrmtPv6ou
         PLrdh7p+cAKTsBvrgtBp0va5QNRNsMLix9P7vhXJyw+C701Dqdrsmro+SmD1NjbXD6/s
         XUBf9Pw7dUwOqHmB8e1A/mmmti9aNuG1K7xaX0rMYUsTNQOkj8J9DfFSLH+L1YRzFOFB
         qCLAIhsgGdRq8Y5xYUhSCgy1e8EbH9JrNfU28PV1WJ2t1LV2iGBiM4ctXuUnapsFoof5
         Gi73ddAkeiF9VaWgKD2Gtf/sMyrUbYVspl9J2ojWll4aeVtr6jKBlxuoutdd6eqUBKDn
         BI6A==
X-Forwarded-Encrypted: i=1; AHgh+RqWdBV1AkxQgH5IgzcarmS0oyx/Gn6j8GTBNyrDO8nAEXH7rrJYV/aiy+KJySyo4jdPtmrEeFp7A/xC0nfLubr7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+F/p++rBWxVsfQBOXhk7w4/v44AIWZ9MNsRqp5TpyRNd69bGA
	tmAwdzPa/ryMYtELnzwJ4jH0x9MI0S+xp7f+t7a82m/QSmNDxGWfW1fg
X-Gm-Gg: AfdE7cmJ75Yv1zMxM/XF5h3l4mKILAZ8/cDXUIZdKM9hSnIiDsRg2s2i97k8JNjZguP
	lBIlIkljTm6XPIwj/8CbP8pYAX+dTu/aUoCGGPsfSPCqx5y0uVWmtbZ9ZHaswM4OPNKI3M+kDw7
	DcmkbFNNLecnSfXPrAGdKcxqanQN3gxTl/V53LKu83KvYjPUl3VzvjQ7QeFJnXA15fqzD6RLWYE
	oFCoXAR5ZUtTTH47OUlNmnWX/ExMx90ZSsB+wyRm00ZVEQZou9enS0z1Amx9wjq9PMJtAfDyUmb
	eB+Km/6Ma6zhoYw+Ys994fxO/V/rJRsENgmBrwC5nuQE+F6NRSfgrVA9tTicPkEAR2I1YgRv2gG
	/YJAxzobDBzm4Tjm3E1PqICxK339mnh62A18q/lZ55Zfbzgz06I3t5ZDORRIR0lVrfe9GHIvYkS
	qx2jp3CKGA9do3awV0eZIwca3kDA9BsaU95eYKfnmCOD3FvzRB+ej6IVyHTw==
X-Received: by 2002:a17:902:cec2:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2ccea37bd1dmr28221235ad.26.1783520546188;
        Wed, 08 Jul 2026 07:22:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:25 -0700 (PDT)
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
Subject: [PATCH v2 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:32 +0700
Message-ID: <20260708141734.578926-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072226_995079_8ACD1F9D 
X-CRM114-Status: GOOD (  15.94  )
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  8 +++-----
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 2787524c796e..e784e8b7d167 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -428,13 +429,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
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
@@ -456,14 +457,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
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
index 4796fce084ff..5ab1d3961409 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -79,7 +80,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +127,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +403,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +450,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


