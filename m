Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61DBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=; b=si1ljvH9RKrjD1ftuZwPMk+x72
	Hua8TsyHzN1/a7ixn+KFIvU9D8D6n47PHRKs+BpDhzCkO2ji1iu8p+1civRw4GvSH2ZhJWfcLxg7G
	z1bmw2nUJauHIRmcjdbfBqbzvQbeXJpty+pJl25i4LEXZBLTewLO7k8WM4bFJ6PosHfjJ4w8Fm+tm
	IiPBfYXpHxWT5Lr9UuZxbogBs6churwgTy6OkNiPm/7X9axADbzrZ9d/TNvymz8tqq4JMQc2mbu1D
	mQzvhKitsa39lKWEpWo958yCLfZNHdtehe/NKiHMOr5tQgljzInhpF0fbS/k1wBv40xEuYeABqs4W
	djrZbhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGg-0000000GyXa-1Ccc;
	Wed, 08 Jul 2026 11:16:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGd-0000000GyVF-0sOV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so506550f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509397; x=1784114197; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=O5o2+JhV4Kl5anJwkFhaGsEwX0VcxJlyCckLjKD14qNXr8GAMvqysYxjwitIw+jbvF
         c8edbkg0/eUWtvwUKruCJZuaP0KTmsWrQBy2TdjRO7SJbzPQCeAJ3MT2rMxFJUYlO1be
         M3dQcND8Ww1gbTQ+6ZJ8dIXHK9Br+J9QfRIi8usxQhFmxf/aKK4LF8WzTKpqS+PxTcrp
         m1eca3WrKGOr42heGr8WhNUjt5+nbkwNwDceemn0fnDZ8WmH+nEbQXxki5lclBBV58D2
         pKV0U0tbDCuinwXB5g+HFOFmdQrXDX2XuMaS3V0yJsUNB8ncKf6qDXEM9Hc4EVPhueeM
         yvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509397; x=1784114197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=T4UpL9YumsFa1be/S9TWNQTQrFOApPchGJVuTwsAhwAVkU7WeAQCbMq6+G1wdEbWDF
         x3+qcM34gg2YVKpmzctn61wZ6+ZF9YcyWwZNwrtdyhjNsD1XJgwPg3H9VRT4kfvX/3SL
         EX7jBf8DfqKYRqgeW5wQu+Y+fSURQgLFriTfOFKO6XPOSA/Nqv19R8RCzuvjVWitQ3Rv
         FEzRD/pa5VH2KA+bP99CXUXO0Jhh+biyuqFNefDT1fOp2jbQgSKKbv7W1cz8TodfGR0b
         etSl2HKa38AoEMOdxQyvEqEvbGFudHHeU0nsTWEQX0mb0bjraMF0igATh4X5LinVvLPS
         g3vg==
X-Forwarded-Encrypted: i=1; AHgh+RopZlcEVYvexGBRrQ1zq2Qaozul5Rvym4/eBECC7t/XPQRthnkbMTyycAegxJg7poOxbA8bSMNri1lYksVqBYUX@lists.infradead.org
X-Gm-Message-State: AOJu0YzqIC3KIYfIDqJNbt6BLusPj6anTYyB4/JQyom6M3+iJzlAugMt
	Nonhs3gw0+6taq5HHNiAMu4QOFllUMZhx3FiWFrxf3NhjnrfKMN+5NZIt3EKqj3RIUs=
X-Gm-Gg: AfdE7cnVFiVOrdyGyot0LmmTEkWGIhgq5vnFZtRVEEH3fFqLY26SEj1pS06fs/fOGLY
	iVRNz+iDCeGlOkVx/QS5Gqb39o4iJurply6glK/CmF4CMshxJdb8Z4LqnVUEyuTq6ZpCHMzr0lB
	/WIWZ5wWwhgvsjNVJSfuCrO0bSIwd6GzDJnVJjH35uoPa66f/DkUMr8eNCpgnnmBjKx9zdUATZc
	dHzqoKX/3Iy19+Sr4GWDQ7JSrrU5HLp+s1pxWPbSUAL0wqM46n4nI+Ifvqe2LqzdVY7A/vXwC8B
	FSDfDZaIFqib7hAFzHfa+yAiKzjtuV/7YbwbAHNjDW+qJYSJ4xi7Fv4FtAcgsUiKv0Z3bYpPceg
	DDeAzgyEPikgZ1BefTh9KeaUPeWPLzOPRKEcK62N3W5CCq3Y4rAYk9XbEk1gkZwyYlatzo8G5u1
	1WpUVaWslOqx5rNyrEJeFEOv5FlAm7EI5Hh64IBHS+xyIu33IPA4k/5/yBJu+PP7bpxTjV2xJrT
	RJo
X-Received: by 2002:a05:6000:1ac6:b0:474:fd7a:93f2 with SMTP id ffacd0b85a97d-47df071e6d3mr2474928f8f.15.1783509397326;
        Wed, 08 Jul 2026 04:16:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8f1sm42676631f8f.3.2026.07.08.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/23] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Wed,  8 Jul 2026 13:15:08 +0200
Message-ID: <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjE/pluZyxrzVFbTyPl5jsOwP0Qa3t5vxaWaB QIKD034NZqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xPwAKCRCPgPtYfRL+ Tt4OCACCOMmYmXJE7xq+JazBPa9e5fYdSoDRlNOUwskyb1UIdVCDhSFBu3t3mOeLlqzs2Q/JqUg 9aywG+xKp8YD8JudHB/qOMog1fn0I0LrtCsFLOzcTLwv78TifwhDM38p5DRkTjPIKAFu/eZMg6S 0VT4T345q05ABPe1bJ4Pjak+s3x/F1LABTm5JeIDw6iz4Xp7xFE9xKiCiN2l6UheCra0raoWAoC cbwqbGAyPBgQvcjmy36MtsK+rRp/31KGIOa8dHRLaF8qtA5Sf3XcnhZn5/K5H5x7fapq8kTzJ6U UemEPOAhHX62n6Lxb4TeTv6cx9Msg3kuWVRNdoRemb4htW57
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041639_266886_620D97DB 
X-CRM114-Status: GOOD (  16.58  )
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

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.55.0.11.g153666a7d9bb


