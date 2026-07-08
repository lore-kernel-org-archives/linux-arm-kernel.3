Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03937C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=yJIvzap4Ey//rL5DzUPUJh/PIT
	AItYsUbwLbfyp7/Yj6GjDcvHFLuq4mN+MU5yusSpmglEG4/iTR93S6A8NAIezbcz+rM8RfW1slCWl
	g9Bmk3hFr8dkVLIn5g9ciqijPNupMLUYa+H5qYy5B7jAL1ZZjYFCo1iD252q0gwAPYovG5SxAVDp6
	fuiyi2bDJi/PqIwhAXxb/h4Dr9yUqdKFQJ7RDSWb26M3M2/wC47xgyEC6oJ/fuaceUvH+PyqP9z+y
	jWPYq+1XSXo4hWeH3JQgeOMpkDrTXR6AK84efgnlNcx2ds+YMQqMZD0B2ELw/bx2Sxpf/TEEs2/h6
	R970qrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9l-0000000HI6Q-2fW0;
	Wed, 08 Jul 2026 14:21:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9e-0000000HHzX-3so6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cad8076b01so8949705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520498; x=1784125298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=a+0rRsGYdwWnRKD+cgKO4ArWWuFbVAOfOTsaopDRpsEpCKjKNRgMQxTNic10N1ITjW
         aTup8QdVWtlcREAPvuVj5IRhCh3jZbCz42/Z+bDbr3qa2divlkaHEa8niyXYYxzKmE3G
         Bx/lAYlgoPPmtohBiYg1Mey2x35tohcTUaMnA8kQiM70d/58NZEjfUMf/YV8FH/21g56
         NyjGZVYu/nzdJWPPI3XQ/Tj7BSXuv1xrxpjZlWgUxto7E2Uks0jhsoMu5jHTem1lLgGJ
         fr8OSEMjb3o+q2p0OKjoNHoTTAD3HuDfPnp8pjWgH9M0ZcePcJBm9s7ppwu1WJVPhdL3
         k8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520498; x=1784125298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=FYzGBPd6NEW7TjDPdeEiImWbXQqePan6jS/7QoQXBMrJdO7kFJEsV/Hq4yurvQp0KG
         hMHZYSH3hAWeLGCE8yIRtdROurmNCwEY1vBBlCYgwi+lDyrcuQwgb1HJQE3Q02w8UFen
         VSs3gc7PuIsEJErfZ8PplWBtNCXPWlfkZBjeM4FMKVyi3Ii13bAxXDTIhlCVpiXWZ9nM
         PLrmUvO3rxeJ3bvs51EOdOqlNWyLiuB8EY6SymyspY8OchPuQl0doOGVeSFCRTxaHrBk
         aY7wQ+RlqEhBlvERq6Wto2ZvgY2vYpuuc4Jaiuw56+ewY+tLgGXH3mLfNaPKBfmm9JLd
         BHQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqolk5I93N0tFGZnNfMeaZUQhx2nUF9o2w6gObCFTZ//P37X2M49BJFY/ncQv6HUPwfQI23MT4IbWY65hY4hshO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr4N6uxeoGUDllXGLa4w7TSq+gwbFGdQvEjcngJCBa25sqPZkV
	lhWB0jAPTzgnUiab5mlXKg7HyKTZNEj5D3kGPnxUapXE+zbt1tKXWSgz
X-Gm-Gg: AfdE7cn1g1m/6Y7byraVmTR+pAkwBlMlRLo1M8HhGSWsj1AzkBhVTIl1dDrEAUSrBv5
	WoyRHKNDEx5sKqpQZ11pjRj18mvCDH59hut/bv1J4uLoQKNn18LkPgeGczK/Tu60RuyP8KfDoft
	O4y1vM7YPBjbAQ9T9uGoIzxFYJp5+PvnAIo3FnoSyXEznmxkN9u4eHhzMBvdq4tb70ilhQadHXP
	AFCjvk8bfCUOKVEnQktDmQwWEDRQ6PaefsyGIE9fCc7IH9I9NqZeQoM05dmM4lc2/x1tMGuINcT
	oCoE5SM0Uo5L2iHoyoGccGpLvunLTxySF0wDh38LgLCiMcHlIXSTXe8iXCT/eXhGQviOTDZmCoI
	8p5biu6LPb1vRcYML5hNIcG4Tk8NZVTIA8xtReWs/DI06znEO+6bD94F46gYlCPD4u2GVL7y2qp
	GcvdiM1YSKKIU07i4M5cR+ANH1CnuVRK1VHDqfDrS3bWDpOjg=
X-Received: by 2002:a17:902:ebd2:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ccea39354fmr32045325ad.18.1783520498057;
        Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:37 -0700 (PDT)
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
Subject: [PATCH v2 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:26 +0700
Message-ID: <20260708141734.578926-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072139_028767_16DB591C 
X-CRM114-Status: GOOD (  12.37  )
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
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0


