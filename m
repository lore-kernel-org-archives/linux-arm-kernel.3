Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB4C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=S+PNsBg8GXemPV4HCIqiano4wI
	R6V8oBJM7zungohwwfvGIjfkbWAE0qLZsndC8n/g5Llv+k3hJwtCmChjFeuW2lByWBQ95FDY4nQsD
	6c02kXaOwKugpyCrNK66lZfo2qpRLdcB4uDimQ8qGV29N0XG/KbuZOXtOMDoR9i5rxU2+hs6OZrIl
	zHT76G/7TvpnYpyhKDQ+I6T0NNDl/KvM3aLqk3DVrCVF5po+bR4HAFUyyiNv2C87s0d+EKhegGym4
	UUzmbj26lwB9UjUFYV//xFCgr7/ewQUJlsUcM7PsyqO9r8LA4wPGLXj6d/BWUS5yO9xe9uM5HGYtk
	YVwNU/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ib-00000009A8m-14lR;
	Tue, 21 Jul 2026 10:28:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iV-00000009A2Y-279W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2caf228a910so87749925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629731; x=1785234531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=pMB+o+zhEcHVsqgFP7MSk4DbkhO2wbM0JgFa6eVnIBA2rCqNgPJpX/XfclABEDc6fG
         ZLN2uHB+IsvSukg/7fBf4BsBgaK96wNV/QLPYkdIxAZ1cZL8QAuEV9VaX8In5hUi09Eg
         6vb/1meM6qhlvbOkO0T67BfYyt0x52DtHxCmW8xmULJaZJtNMnR1P5pca4+tD7ShWVY3
         H7YS95Q9vWGkON6TLagj1PhU7zf7Rcp1pAfPgSyVIKmWT988+KELs8qO+qRNqTRwkbtQ
         1Z83zAx9KqUnIni2CdJzzPXS8FoCxr4ipsQJ4UEeKKCFeziZlX5SAEbLmfba3JSRmSPM
         L/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629731; x=1785234531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=qGhCta4X5IZsZIRH7qsCPPqTuMHPydLdqFpxcuEDeX/r3NXQLwwtzxAN68o2BJOQN4
         hMs5y9tDCu45WPI2WQfIhzDc72iBVYFExgu57XAAW2vocygTeYZtbdNY3RnS8wR+/+YD
         xTGVouwMIeBVKMXZEC/ve2EdSqEjPW22T1UR8K+unozGDM0AuV70VjhTkXIOXNcbkBk+
         7ugyBegwnPFMtklMMFxCM35oUgKp0kd7aOvWQBKmSQraQu23lFO7LGw2TIy59B/L19eM
         b00OVP8f/JyzjzekNIK3YOEaAytIakMpYnK+OqZ7w+i3kKV32KfmfuuCtJ+1E6OJYebN
         VJ5w==
X-Forwarded-Encrypted: i=1; AHgh+RqCTGExrzhspuauU9wYpwUJAvnEwDLQpFKRoJ0Ggr/VXWyLdzKEhGmTGiBFU4hKy2HkYcQzmSYh6qXdVWF/3II8@lists.infradead.org
X-Gm-Message-State: AOJu0YyeVEHayuK3OfnNikP0aQIhsaxUxpILr8Nkz807T0kBWr2rQ9Sm
	c/7l0YLuAN0WuAoCX2l/aDR1VxE+ze+IZmheyJKPnajNSsVu9M8n8dLy
X-Gm-Gg: AR+sD11RcTCiXzyziRTfCkQQ+NQaPw67dq/P3MsZ878XYmUqBW0G8yjg8SDl60q/A9n
	cnNrEA1Ljd3xQ4DwFkc3WbPic5tLqvctGpKaY5zan72PRKjI/UMhCX6bhJhVA64t1ASauY3u781
	rzprt0a4InmltxMsqY34Bjl5fZUbn+n3i+k7Yyhc6NDtVfJp+buoGsGlgy/cdRVWT3sYyG3L1SQ
	2CmOq79epqTZY3muirZnfWIjQY0EjJzcRH3QNkWOP3mWkPzITLDbmux6EUERj3TE6C3r5T5hg/I
	JLhjZnGMTFZw7uNkht96ytOpBqjNxABhl1VOJCPs8wQikMGWFXdVUJ4SG2ebQeIqnGCkgeTCOSQ
	KKW0STfbn5VqWkLAtcL7j9XpkLhRehU2/YyAhakdL36Todkoq6ySciSLOYQH/oJNiULGTRBoR7d
	m9v0EE9fa1r65i7f2eg2yrWY2XMLtr9tGO2oij
X-Received: by 2002:a17:902:ce07:b0:2cf:7d0d:ddde with SMTP id d9443c01a7336-2cf7d1d27camr38565945ad.0.1784629730842;
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
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
Subject: [PATCH v4 19/29] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:50 +0700
Message-ID: <20260721102600.523199-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032851_591708_F5570363 
X-CRM114-Status: GOOD (  11.92  )
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


