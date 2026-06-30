Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D80C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=GMapqwePnd+1Zd5LNoTKeCV9jo
	8rPHHkifp58JIixnZCVlNuoAc5+nD2SAFJtGcXvIMRE6WNR4q/c8iPV/IJ3w6jExCl4Su+nzl/M0m
	fmdwdKdXErBYuKfBwGVOEtz0IXJHtxqf2ReSIAPIW2H92SFb9OTu+PdiCtN79F6ehI00QD8y3iVy3
	s2mRU9tqMbRHt7xo44Kse/SbGQH6lQcdgKSNEp8gzIZ+a8AnRJwG0icf1N2cIK7AhksPfkqnjHSHm
	4V7TxAvy5mvgTWf86WyxAhsGx2pxuKFK0IMluYeTmxKjJD2Ebsxpa37aKlS/5+60L9amXRrS36P7F
	7sKxwLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4X-0000000FyAI-3xzE;
	Tue, 30 Jun 2026 06:35:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4U-0000000Fy7S-1aDn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=ffqCsspPu+MwKDgEiTbTmUgwu9
	63+TeHCQYWxz+QRaAYeRdb/WA8lVlQ7avNOjZRwUMF/3p9wom9WxBqFsFljBdClgGe4Y3uQpu/gNB
	p53/tZrdNZAtlbiJE9lxHNQ1WBDcAfIfTuhnnP9b6rtnPuwczScMS9S40CkisYkS5jISP85eOkWCn
	zzDnVqyX/h99Kgo15FLKvSx0UD3i9VbWjNqHmUcs3azzPm8l5FE2q08aiC/oHdCU0i2Z4jdUdZ6OM
	Hlz/NBQAs+MiiS5eIMULbQRxlT8yAop8GM6dQPl9VQAe0pbAKK+J6oNHUPhZCuDFVm/6ds0ujG13n
	aBrfYufQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS4R-00000001Z83-0lue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-847968ca62fso921030b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801345; x=1783406145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=SX5D076v7M8/RgWFaz+NCoKO3GPRa1yBeSMSEZSei3gF3whWljB94iVgiI7pdLqFZe
         0rp1EwOBgm+m1leOLmOwqw23K7Xc3r28LzaJZ2fnN1RaixYpzxi+5T37sjHKGi4v0J2w
         mZF08EV72rzdrO0T+z7v5wzLxokcn7SiO5iqveZ3dFgm319s1Ui0Y4T0BD0ZZ/+uarUg
         H7xlkYJbmgIxvDEVyfqiQNYWKC17RCjUxh3BWAolg+8bUmJ30dHdO1pR71MeueBqf65M
         ZtkIuSsDckY+5v19SWVv7EPGGKW4Hp1u3PrVxbLgpbnspvsFyUl+sp3b2W5l/zvw9dan
         UTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801345; x=1783406145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=ZCHTDN5iJi7VQ+RgcG3yRSw+iUE9cgZCeX2uPE96Xqq/J2yI8BO40hl56MtAXEyvG7
         Qc+lEwf6h/ED+XJoo/eJxAslmzSlebmNJ5DbWDcHfnlsOjMqiTgLoloWYSxp8jxHSwU1
         Ix6L/XgvtgojNL5jUaAAMuKYnO7rmz1LOtX+2/WGBHidXR7j22GFwBeRYpc42EI1TX/G
         Vv0Zf+s+y4vY8ZbNNFg6ySkp8kQxIe5s00/joWVlAZSSpbLwbC+KsWp7qG1bLZwUFkrw
         4+4uQHi5eiFNYiAbP//wnJgElnfYFCTagFWV8Og50M5lus6uPvhokWHFzWSm0Gh/IqW9
         mqEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQrDUXi3reX0phNFrAU3Y9iNSjI/qmwgkGJXUJNiNW7H0AkhFWD/9ttcSVpKPoz7iACsKUTMsYtaJm7N+xxQSo@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkXYaYmkCsfGHYpJ5C2NF1hu/Nl/FXNg58fcZDaqTmovxjkGd
	JLcdXcyFUOAU/Z23FbJ1axsuZyHMFqSTr+PE3YYRS1UW4mjKYH1F0h3C
X-Gm-Gg: AfdE7cles46T3ZKKXmheyaRkJ+nns88IT7FcVfmbywR2528A3AO2kBkW6SBBxBEcWwR
	VlNDYe4PAxkW3lgn72oLIo2bx+3wb//MoNDBfUnPxcvNxZYYFc3VMRGB2emGSFxE9Qo/XHjJqp6
	UkN3NOUQH447+TZmvtoTNVmEWT9/rsYynQqtbLu79m0NEEga+OgtRgeAK4J0QU/g5miCp5UK17M
	LBtv8cq+1eQXYzUG+RhY2rs/UlxzPYGR7p2InTGr91gO4aIFBd2UQRYq3QffqiGNYIdaDJLYcbC
	SDa3eC0Rz5ZidhFFafan5ZNd3hQO1A/JYXqpCQXtMW9byH7pCLWPi5oiMSQpQiX4QR8DXGxnmW1
	RfilCmEapG2LuEemvZ5o35PuKIFAaQIhkJ2EuSutfZOAi14T77a4hLtA9sxNanL1Za9rQB7MOon
	CNJ97kSSOif26EFNY4BHBpc6kYIDygkVgMxOoE6X3kyz5TyOE=
X-Received: by 2002:a05:6a00:3e12:b0:845:e873:4248 with SMTP id d2e1a72fcca58-8479f3fa66emr1886818b3a.56.1782801344986;
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
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
Subject: [PATCH 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:27 +0700
Message-ID: <20260630063449.503996-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073547_519400_B3AA5A63 
X-CRM114-Status: GOOD (  13.17  )
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


