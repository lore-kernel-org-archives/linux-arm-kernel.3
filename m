Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA169C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=; b=BNjDgrMXoC0bq5uypiCsA8Goqo
	R2iJPbRFemFr7U+00VN46YiPP5/TSi2Mdbu6Z78CCttKtFhCrGQGOWZHqywcJ+FwEWLwoXnPvHcBs
	3YnC/oUfta2jqKgaE5HcNDz0qPLkTiQfk5tKCymQTXO+x6yWtQcIeoh4xhvcatRzXT+kwIQnW9CuL
	akVQ2ks0pW6oZlJ3GFQgjI4yyGewFU5mIMg+VsNMsm11Y1wzQylYV8daKvmkQwTPfkABmcILSmAaP
	kqWFRBDW1RN3pMXqgatJpRaNsK6zzOqkvi43dmGIjfVi66C1lCDNW6CoRwIQWM6+ww3KjPtVOxqjQ
	Jme14Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jW-00000009B3Y-3wgQ;
	Tue, 21 Jul 2026 10:29:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jQ-00000009AyB-1cCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf41bab353so49365565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629787; x=1785234587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=AqAZUCPnQcgVBO+fAK+z/AFRybzxmXa56hy1mKBcEwIIXQ0C02dJp/Gz478fS+GSRm
         5Cg/Im0vtHYUH6d1kZhOmuJ9L9wPSHhIElqmmaTAF98lW0wOXt1aZn9alvrXSF/N2SQQ
         qiMu2FY3zjosqtsRlPJXydjSXgcBO0OoomdE077HfD58AP/HGheAAUs2kvjuXKCo/Ud4
         hITJFFRCnXZ9j3NpbYZH2GacCYTp0T2RMont4bUJBRq1655ThMyrupEYm2lCzwk0UF8h
         Awl95qB4Ur4W7cKugiKAGEOukA5KX/jyQmllyMlJJrtlKozMvrA2rfFkU1WmztZPLn3h
         VY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629787; x=1785234587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=nq53XkoL09gr/zytNAp4ikaDBMYCtKVkltI86qm5oYK5ZRTt72OFdOAE59O+Qw2tFL
         GyKc5GF7vBrR6peQg5N/U8hjZWHQjYCzsI+ginZfh+pt6WN8yabGR+6UOvrfWPQebvUi
         JHtgFt678NCoaeljyPyAjp61wllxt0wga3w5u6G8ABWWIY7k5+i6CRFi6YnYl0O/ZREh
         IUvGHD7mvwneWk6x3XdTHYsi+cC20bQV/+pB8Jr7nBrLsQ9cUjB2cy2r30cGXx1leeG2
         HxSXW1qKMh5bGNWXWt6RXC8VgdRftNBL+dJb/z23O40qTq2w8qLQAj3NTB4qoPpjkHjN
         tM5A==
X-Forwarded-Encrypted: i=1; AHgh+Rpv9W5jbvy0KxSuYNAVyUdG0BffzGQKXXN5mF556ST2kGxgmxV6Jl9g6X1E7QvJ3ZICZsk7sNyBjDEAH+sFkkcs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/HbEg/aG8UpGj2BnbljZp9H6wjuJzgLcosQxjPz5Oxdx2mTOw
	JjS4xDCTEDqGAx2+2OzbF5CKOl1MxXGSRIgvOHjwZq3SUeharPeeeJOi
X-Gm-Gg: AR+sD12nhOz9WQUfWPqCt0WDnz35FAhv9yjIGTih9WJ5PXlkVzFZcV+QMSSlFVKbbWz
	KtxqfgbU6TSG7XgziZDRgNtdWKF61TfOmU2RVxRjnhWHQU9g2j2G4CuHGw+OxwJq2jJ1d6Bpmee
	VLZ1VoOA37esT1e4iah78tyA0yp+1qbOq0+Ac4iK0GEzJ5E6oZhY1ecpxP66Mc59p004voj2Sno
	VVtw1mjMT3dxyp4zT13buZDVzgecyqQrl1Mn9MuBxzalBZpwnyFYDs3qaMDQgj7IqVZq34XNJlA
	i1wWtyxhK8K0xou1wvCIW/FD249Qz9LH98MNUn5bLJ/t6pHlpNsaHRZQxWC2Ck5GB0J08b49hoF
	4TxHlBvMx2N5f+S9CXOLmxMjz8PicXtGC5LiJ0ouXNM2NLeHMEea51iQd5F7bSdRFp2EzZELMSR
	C52o6wgFc2JmJVmWCA8ay3qhckKvXOogQcPzCU
X-Received: by 2002:a17:903:3d0e:b0:2cf:6dba:b294 with SMTP id d9443c01a7336-2cf6dbab68emr73742545ad.22.1784629787546;
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
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
Subject: [PATCH v4 26/29] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:57 +0700
Message-ID: <20260721102600.523199-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032948_463557_10D4F036 
X-CRM114-Status: GOOD (  15.03  )
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
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index e23501ed87a7..c50e74e20a88 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
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
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
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
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


