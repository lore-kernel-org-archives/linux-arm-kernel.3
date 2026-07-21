Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C433C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJaZSLBuhqMtQ0nYByw0vZcUCn5hN3L2y+d0nH5sVcM=; b=LhyFNFac0ZYsOcfXmoa8voE9bz
	JtNh7Uuk4eSya0knq01y6NeLyoBRzGOv6ZmTfGCemYg2vX0NwlwW6tHKx7Tcrw7HZYzRBONjyvxkN
	ggUZm8s51pqdQ0GAEpOf05GnbMfJSZgGNhdqo8CDP2FkBolQ6zUR8ZrkVhmAZFxwQ7e8tiuBSR1oI
	iKbQoWdEem4FFkRr9ZYvbQbMsgMF2kjwJhMjYGXNqS06vP6uAaqyuRujPveaBd+ohugP3+qQCpWxp
	/uXGaFLd41Srd2B6qqF2y0zj4i6VdvwHk5uK0VPITeiBiScD0yOIB+RQKfjN/opOhw6jxqWPTEF67
	2rGIpk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ju-00000009BNl-0F10;
	Tue, 21 Jul 2026 10:30:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jn-00000009BIT-2PaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:30:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ceb096e675so111501845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629811; x=1785234611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJaZSLBuhqMtQ0nYByw0vZcUCn5hN3L2y+d0nH5sVcM=;
        b=gA8Bo1R6uofKHd1BFB2tjWewyLi99L8ZcObTamn1HbVyGv5z2H6mibBYNXW8mfU1SM
         xn2mxckSaFFRr3fn4nJw8Cg2w9HJpDFi7qnSS8/ZjlneHfsJ50UpTuXt5ISpFpWS5sbx
         IARbS2Zos/1exqPuOdw0k5y/XqWcYtUwYwt7uzECnOL2QtJg4osXEU+DKCE5e1Ax4kb6
         c+l5S8eMmBuS4BwE7lql9owoXDHq7stnlvw/MWvTpMaEWkf4S0zjUKvYD1kE+m/ofhDY
         iAoIyw8MQXVqZSdCDHf+P1kL4GLYt6Vtr1XgCb4Q/KOLo6FXLlquRA7uwiKzy9MM/o47
         x1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629811; x=1785234611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJaZSLBuhqMtQ0nYByw0vZcUCn5hN3L2y+d0nH5sVcM=;
        b=dLaZhE2HjTexZAeLa4pXr4MTjnRzzuQJ+u50AwoInviEQb0Fu78m2XTo/NDdmjkNUI
         r55H4F/L5FgOm/GXrFj+8AnLxGoyYwL9I0f/DTDpbDBVyl2iKlihLMdr23quxSw7X0zp
         WHNo4oM+XpXZeJe71DXAzX1R39aB2gUFZ0kBMl5SpPbBvKS17LixsMIdBWfSqi64vS4d
         eL6UqDa/K1HSOfUw5HHzFKA1Bls8sdajFMSuEIIGe7B1MNqgOMTtYv2byUIp/So0Y82G
         PaRt++6RW96eI44PDLD4Z8welOXvevH2QHobvhi+6cm8a0C8Sw6m5H2L2U4Ztq1zamoB
         epeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFknhXcUf+Lyf2s+bUzYsBpfSGhnXiMYDRP0gdQZWxhjp/j9E5uDW1x8LZsxNd3GjjmsqzyKR4JdOJw8j/F2AZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJXzIcy+Qn9IhSY7euDK5C86O4MPGumGM9xCC8H8QGdnaZ4Wbf
	254jc/sop4W3/0Rek5VFYwQZ97sVV/vOemJv4nHVhuO0viBGbTRsuRrd
X-Gm-Gg: AR+sD12iSDPhQjM7J8Tek6e59XX8TtBKY/jSFfdxYeV+dSMLMYzMeOEf9beLRlZ/Dg6
	2Dp+h2AJnHNX4ma+mElQO2BMh1a25HRMLViFJSsMOS+ksoonBATiHoI1vzgil/vIHNl35dSsGYE
	Tb1nRMVFaQ2DLxOi2xLOEXq1baMnP/UOrPqOTy1MeRVbZXREmCMt5q/L24QQvFgjno2NIvZ1lwr
	/tEzk1mcQT5HPCYb6CHNLX+oH9vPGIwXCamQYtRdhvZnKLZ2PEVVq6Eb3oL4xHaMNHReNoaxlYV
	SX8KPAyTDrB8Qsf6RkwJp1SKkLiaMhrIXo0E4rVZyZqvAHLxhXJs6MSIWV5P2IqfrVEyyLXvc9+
	yLIXozQIggIaEy3IQGNUvwSFqpGSezw92lwjCA54FWbI0iIIh6ll/6lO5SJB9qO8j69eTvIfcrP
	yOzktwzso3dFfnCmS6ieWAvwS1stDPxX4g9Jsf
X-Received: by 2002:a17:902:d2d2:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cf34961d82mr214608165ad.25.1784629810737;
        Tue, 21 Jul 2026 03:30:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:30:10 -0700 (PDT)
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
Subject: [PATCH v4 29/29] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:26:00 +0700
Message-ID: <20260721102600.523199-30-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_033011_696958_B530AA90 
X-CRM114-Status: GOOD (  15.49  )
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
index d2db33b4f684..05e8e23f1f43 100644
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


