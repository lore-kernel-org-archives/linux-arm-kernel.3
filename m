Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C34CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=0RkmEuo++F1ArAuls0QsmbsOau
	yDOQy3BJYFwbdO26DiOPcrDHiJ6LBiZbmYpBYbNslgM4P83L0UVpQJqPop0aGpmzQl+2JgmMFCwIc
	HFDpbGO67OALyMWiVKOnILwapXkDo6yzfrn1/4aKS9bLcX3JXTYH5NuRtaTmN7qwIkSf7s4v64noH
	n3oHYXC9uzJBEq6dXtkc5D5fhWf6DFFVsTm8g6VknrXsrAtgJXCVF/7tiZyA3e3nwnThqZa8TfFQN
	poHa6PCVzkCtKFM/f2YK5+cM8cPLVcAgfPRZHPmQVSCKNUBGGeS5RLWsrCCYhM52uGzjunK28dFKQ
	01T9PFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3So-000000049Xn-0i8a;
	Fri, 10 Jul 2026 05:07:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Sl-000000049Tb-1AVC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so482648b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660066; x=1784264866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=O4M6QhmtWF8RvKrMLDIIFbKIr3ycBrODFzz/CUDkkr55WoAu2vFEpORbBpbSqSAUg8
         rEZOY6L7N1TWxUp4MEDGlYn5i6QNNzN6bHcy3hZoOBK0XhQDgozGogsteGoH8twChG3C
         v3BPSJI7SIrE6Gaj38F0jvK0Fc49ngbuaUGpiMn6eUOiu0OUwxJq5M2xzNpfmaHqFoY7
         pNme0IPXOUj6iXFXlfMiBucwnHPcwyfzh3+GxiZxZiRCjrjFwDxRzZNlS4SD+YgjDTu3
         21p2IIGT3HGX69RjwVcBkDi8gmT86mbTxLDUZuv1n3UYgCMzL/KyH6C3b8zn1NJJ2175
         eprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660066; x=1784264866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=fOitSf/L3YBT47r8QU6KokKgFArGj4QVu3+N+rE17uxyRuBLy7CMaVE6Ixs7TuZp0T
         NENvrsmf5V8c0lKBCheWh8RJzF2pI+Qe5UYB8l6G4S39HD8QAlF55QXz/MsxDlQ16alx
         fBUJRjuaus7Cw08MvkiMeAipTTcsjr3QNQnYqxPpqOsZQbTwRtFSc/48c7zzhrAD4KTb
         XdId/ErbF2ghm+RqCrBc3D4h6yGA6A6h4439lA6VjJnrwQJrDPEtxEjrP6KoEoDCnnu0
         AgkAjkJgardFxWc+0/raFj47+yt3vubBRemBOez4s7pGcHMbeXwb0F0jeJIeQJJczvrb
         j1oA==
X-Forwarded-Encrypted: i=1; AHgh+RpLGuBEbyaLppcDI0skZsIYuVRNpXO1LnrIOTm8JWGGsyfheg9RjkceZylF0YPpKf1A6qCKFu9k0ltO33SOKDap@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPjp5LHJBzNhHS0qpElEZ0qxxNOu0VFZR+IgyEPYKYl67JN/3
	gPu4j/TZw5vFaci/7St1O1JfIP2IBf8cBKTKwtjNPwEALvB7uT4dxrsY
X-Gm-Gg: AfdE7ckuNPK5m383wY5bZ7MUShZyT5RUq03HhjHuFytDdnqHJtOZX3QOcL8zFQemGnU
	zfWjRywhrL9TBlNX+TbKbjVSyXLr9gDlU7SaPSpOAqV9+1DZWA/oek3L8buNgBKvCm5mzIS5nKK
	IFWs7xgONVdMYV3TKAcvDQIBbsFFynWdXbuU/Qw49ixk0NlzUxoGSM+JUVoBL/XJM5/3sVassHy
	a17p7M0OTlFtT6wdh2inDgsb1JEb9Zn+iXTWrW8eTP397ZC6/LDpbUEJPrf9QyY8RKL36e5JEDC
	awahqd5Xu770+o5LBk5IeH446Qto0sGma0AgoaFD7Wn1lhchh1X8redkpgMlUvL3D0AsGajMvKN
	K8fObpYySawdT9hx+5s3ocoP8fBq4xB9bm02ZA1bDYpf2JOVrIGd2p48xYmF1pm9ySAMDRcnfYl
	KG0GueUjHX9Za/vjPS7rQTN8zeskp0E8m2aaH8IkZ464OyBlk=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr507140b3a.67.1783660066423;
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
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
Subject: [PATCH v3 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:03 +0700
Message-ID: <20260710050511.14439-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220747_350339_FB3BE8A4 
X-CRM114-Status: GOOD (  11.79  )
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


