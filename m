Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iQDQsc59ksOHtvDkgxoCvh5YAWSsI1newC+9ZPwxzo=; b=kulUDyIyIzVJGJ20Aoe6DpWikE
	aXQ5O56xFa4UfUOqm4RMsuakNhvss31gKcLNt6ZfrNYp6KkTKCMU3A9kaN9EI0o38xW/Jlz8LBSnv
	7t1/ZtQi3VFVWxAQMO/sn/S3BsmiV4g1uBoXTpXQYdwF6uBD0ercmcr6aMiDEDWtUVe2kdDQCDp4P
	Cl1AEbhfrhWwKuBKeBz49xp9eJnCFi23/gfQbKouZnLmZq5Quz7vfYjN54u6Dr1xkNGclnWRYGd/j
	2Xtp4xNpeP6twsjg6cYQGPn9pOVT4yu5Ad1TukQabdmShD/lxplYqNN+zaBT3umxWgQBRwg4pAJ2d
	MbjctPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Tu-00000004AXi-22sd;
	Fri, 10 Jul 2026 05:08:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Tq-00000004ATg-1fnH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-842338c18e0so427606b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660133; x=1784264933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iQDQsc59ksOHtvDkgxoCvh5YAWSsI1newC+9ZPwxzo=;
        b=FbhiUbv6gEX+GzfkglHEfVp4DJLQE+1xWg0k41CceG6Trccbq9m9JmkHlwsUPCIeBi
         2g5ejASgkiJw8pzoQXg77Jv+7qCWTL3w0LmTGAxt/btdIXw/NlVoG+qXJk1ik8PA3up/
         HogjNb5j9f/Rv6Y3LYkZr4BXx37/xEVWpb0fzcb4IftHGX694MDENkO98jJJDJa+MpbP
         W3btFHeFCRXM2KrFuHJPSg1u7tFebJMul27FI69j2rgfUPVXZ9ghA+z/F98bEii1xzs2
         IimPsWb6yayP7F4TgfOleae15+YewjrPPf0ZKE2mCrTZvGRjeYIvpBjTg2YBwjd9aiEq
         0CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660133; x=1784264933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iQDQsc59ksOHtvDkgxoCvh5YAWSsI1newC+9ZPwxzo=;
        b=Uq4RXIhpdjCKJKlte5Wco2j/1aUt6qyQluQCIsP1Xt7x4FhdmL3m6IJk23GHUMlDeg
         xCOxnQCUHcDD0C5bcgZ52CmPBC7J4AHeXp9AjQDTI2SnQbTNSFDkwI3Ozb8FIDOPvY0v
         xcrszH2T6SrG/ZysY62de2AzgVL7eaf6ncXQz12YYcxa1iw222Vol9aOeVQofU4Pfwqd
         S26dBZ0WKQN3bbJ/bpLy+J2T7TU+rlBcgt4T4dWs5NguPIMgK/P9m8cRMAQmZ7juxKA0
         vtGTaiTCCRTjsVFSYOymW+lBmosE3VRB7JoZWhNbYPhPTcic+es7Km7ia7Dw2E5E0fEk
         c/7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8tqY/9t+1121Kd8Zz9/yS2788bbCJkWLguWYMVNzWY2nYyMsECTmDijpT+3UtITNaxEhuNjUlTgvovtjW22oI@lists.infradead.org
X-Gm-Message-State: AOJu0YwNhX9f6J+gveKiSXLmjbScC1xisvbHsjvIRGS5xLL4Jh4a3jr7
	dhRktaDWW6r0k5XaW4FOqI4SsituW+TG9vnm/o66gAVnvnqK57ezmXcD
X-Gm-Gg: AfdE7cnujbWDXyRPNTiSwY8nkXG5Ou1zf3o7F5jCikFnwiHk5SpLp4qdegagrQM7yfn
	o/+bRkIa9g9YRbqG4HzmANA0v0MgtD3KoByr81eUw9cnZ/fLDlpLfBSR3pB+TNOTDq3qZTYK4QV
	Eg5lpxhyk4VOLIQegPEkNKSZkxiJgEQVRvqlbnnLGjgFc/MstaK98w3y04X1Eo8WrNEEO8Glmnv
	oL1HIhKliDbM86yKgorh53dqJHFJ8WFqPM5uQTcxUaZ95zOzZ0pJmaiChkAbTLqSFLYRAB3O5Ns
	35OcPi39bJ7w+swUDdoZZeIn7gKKU02QU6jJy860rhnMyWgvJm99dosyp3c+bOkmwmldx0MJ9q2
	X9IkQ4GMjIPTCOsnoqsuwysaFhsjiHQbAIYX1/XYrMlu48foXYf1jUQXTw6nY/gCqR0LZer05E5
	y++roKSnS+ifW00UMRWAo8347isixvqfaWB3jhcmhtaP3Xz1k=
X-Received: by 2002:a05:6a00:bd0d:b0:848:6698:2d5a with SMTP id d2e1a72fcca58-848669830bfmr3555077b3a.20.1783660133566;
        Thu, 09 Jul 2026 22:08:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:53 -0700 (PDT)
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
Subject: [PATCH v3 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:11 +0700
Message-ID: <20260710050511.14439-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220854_449509_95EFC6E3 
X-CRM114-Status: GOOD (  15.35  )
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index e68aa0350a5b..db1aeea2ecb3 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -513,13 +514,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
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
@@ -541,13 +542,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
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
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


