Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245DC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vYpEqcmiHAaAvGgWCPkFkmErwNTi4SKKROlAjX2OAA=; b=FuVXYx9CU8MMNJyX9XCEcG3YGP
	Eaneh6tyfXE2Q7jWIvl8vLCNcISGA/F6czTMNxmPrSwh7JA8ydscw3DKses4KHDbAuslSg6zvyGlm
	M3VDJ9Y1/VXCwxHa/3WpOBzeJpqK9T8onSghrjLnySYj+SDhkwlt/4Qvq0stuCdiXaNGjQ7dCyIkq
	dwsMIu4EfH8YKQDlSfZa7zALt6m6F0lMH6Uhx2jpOeZ4Dc8AIVImJzxvGisFM6AQ5QKYU5r/lMc5I
	IFmXB46GB2m57orbdbyLJf3wMUjyF1DqEyaZuufn5XAs1KXZmVJsSAjJ9/dJ6JvZPabMQia1xI+Yj
	PgIGxMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jj-00000009BEU-2Oih;
	Tue, 21 Jul 2026 10:30:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jf-00000009BBY-3n5F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:30:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ccf2360620so70689535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629803; x=1785234603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vYpEqcmiHAaAvGgWCPkFkmErwNTi4SKKROlAjX2OAA=;
        b=VjRCauvwtVos2VTZnIE9vc77AH0UbM9OL8IUL3KAmlgJbHzdjwZ7Qj3IQo3H18pTE/
         oKxXXN2TvCy/iHLM/p2X28uYLJj5QrJ4VQjSOPOPyxd2hPlM+wObXgAhbRbhQFNFhS+e
         gCr9Rw9gatcg+hkgyDauDZ1nP6aSa3hYNL1oXufIrItl7eEDWOF8YLvWsCSX+9cO5tlv
         Y7m6DYSbxXHXPox6ZvyakyavO/89CJbQZSePL7PzleorVLC+OT6acX+ucP2OywDR1tVz
         EYVwvf3uMTHp2bC/8jcvd56HbcXHojPSaqnin2oafrHR16fdBR96JbVL56kdyrH4FJ8Z
         oC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629803; x=1785234603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vYpEqcmiHAaAvGgWCPkFkmErwNTi4SKKROlAjX2OAA=;
        b=m6rFRgFbl7oULn6vWXVLoSNpW9WKvvXdYlflMANI5qYUCeiTREoWHECA6ATkTHVykv
         O0fcVHROp0NUCDaLR15Etjpag16q9p0yBCDjlPqlyIWnT1JoDAmHFjTrqh70exEoBC+j
         2I4w5NiA9qTZNLWFRVLwS2aHHF/ZeWkky+cUOagofqgwG+lFXGaR39Wep/lxa0aYpmjT
         1H6LtnhYaLqpoAJaqk7fsJJC7YFWn2WYxQw8WoPO2gueWd5AJGPMI7A1R+453C/Q4TJM
         e2KZDiD8RK3J1qwTrWINLzPKygj5UtWNbDA3z4Hpa5QHAcmmM53E9yl6W352nN8Tz0oD
         euEA==
X-Forwarded-Encrypted: i=1; AHgh+RoVqk5qTZ7VfAJttNC9aCR0WLWA09AZrPMhcdEOlh/6thSesn/w5TzuDvPdekUJlMDuHJ9B505nd2H551WCuhKU@lists.infradead.org
X-Gm-Message-State: AOJu0YweUj/+d0y+C7HpivlrQgPT/1kAK3kuqvT3qZvlCQHnY6IwNqL+
	n7pu1m3pHX069wM+ZPSk8kHfiysbd6saqQW8ugglueaorEfFnUIClble
X-Gm-Gg: AR+sD10x7qgd3C4QDY3P+xc+49246lVIX6QBJ0Scly7fvWZJXrSRddRR0DCi1SsItVi
	zaaxSsKImcmNInijRrYCvkc3oO7ZkYb3B9S9/UJroAupqWz/DTvcO5ORI2dAslk32lZVcsJ36A2
	rgEoHQgIdaSXpxv6uxU+RGpcjehlCvRtLd0IQZKEAzcrC6pvf7JBPIdynMtH36rFYNPFsHexpNu
	hrL7+d5jAQxcQXhXb4uKzmxHdNDuRtodcAFWoPBD6oYRooiH0V6DGYj3KWEm6/nSbX4Tptyaq2Q
	xXZGZRko6BdZehlVseFUMnOd9pn0XvDAStOxr1UtM9q2e2EKdjL0jrrI/EkO8ZtpkFvg89y+f1w
	pTsRAtCMbOwO+vVdPyMOLTyDWmSPoCreps40wE0XKeoudzRRafZPXjTRE3zkOY0tcNX4WZgK/w1
	q9SEe6W8w6py/94N+OhBCpOyzRBZgPQkCi2XZQ
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr191643455ad.44.1784629803048;
        Tue, 21 Jul 2026 03:30:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:30:02 -0700 (PDT)
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
Subject: [PATCH v4 28/29] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:59 +0700
Message-ID: <20260721102600.523199-29-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_033003_942798_64170CB2 
X-CRM114-Status: GOOD (  14.89  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6411df4eede7..eae7d662efae 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -466,13 +467,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -494,13 +495,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


