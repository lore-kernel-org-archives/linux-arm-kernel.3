Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEDAC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=; b=hS3Ola6uixzkaJjKFByu5S9+wY
	OV2ubtVcIJSQnw4LnWfEQfweDrm4HLQFY5l5sel4kR/6fLtI7QK6lr7uzz568DRTWRjiLZu6Mbalf
	4obQjqLaypI0cA9ahBVlDEpzBAql+6mB8G1Xkge64A9Nt4GcoHJiMPtZqQNX/o/yVYaw6gmDZ4jXC
	XouiZGoCP+bkkHjBQ8EqWMqTb1mz+NXz4vBtvO0lh/9CJ+mJZN2bdyKd0EsORhpb1Hf40EhhYvAUZ
	3DqeIj2tPIT7bctF4+1Q7iXDV2qPJ9WljJirnMmCXYkl/kG6f5U//Aw0vZuLqEWYhKJWD2jUAJYfD
	3v/mnY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOP-00000009W2M-0uKE;
	Wed, 19 Aug 2026 10:19:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-00000009VnG-0QSX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8060835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134752; x=1787739552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=T/5GKaE9iu+a0TB/pVH2+ja/lMzjT5NpKx4ibm8syUyrAQ/7AW9X3UyLq85UxDUkC4
         /HCc0Wl1HHbgtENrBbDmaIBkGq3aSoXoqvi7yi4+jvLcu+2+BAdkeMv78KlejhxyZw4M
         xAi+hJ7hctMik58pO2bepdVXno20dYs/eStZxU6sSQhFFli7Yf2IHdFD/aWkt/GzYD2W
         cCzsR9w6TiOUQ9Bn90teSvBJDX4t/NB53ssJXZf6Y0lu6htOAXoBoQN1UiEDMF67oPSs
         YfLYnDI9E7/EGkO+Jx0z1T3TYb62hKq9w3BMRPvt//3Xmo+DA8nGkyyfoqP9zle6oAoC
         0Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134752; x=1787739552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=r78VRR+j64YYawUwSlQfoYf8T9nQ9hMogtmoBrO1TuE2tN5rKRHv+ZdK8tQFjL5ZhV
         Ed2Y4dD/6UKlG4068DXXMUMz9qi62p/UadlZwRGp9USwxEEmYvazf+L2B8r7+jx9voQD
         +qZB/WWEx0IOGBkgCovIBhGL9di5dnwxs+D9ffJuDQ9AZwej22fufp0AQIphjKQuETwz
         zRPD4f5JQW49sE65XlTeDQa8Kp87zSpanpMAy87X52GalZc2pnOQ7GR90Nog9RcvJPEM
         Gqyip5MBmw34w4wxxQ+UaxR1SnaVKt5SYIlBDo+e2bHx0Bka53+6BHvjMkBokRVu2XWR
         RYBg==
X-Forwarded-Encrypted: i=1; AHgh+RoUqfXxt5dZmcv4iZ7OgcAq5TaHYYJxgfo03M9dVmEararaVklRQ3wIuPQnwuINjFKQCb+0BouQcWR7wi8joqIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMkXPPeqjjyt4RKGm/JzUwWJNcLgGXUFCDcA/YAYPK1CIly9F
	O0ncD/m5ue0cSujOi3mlOXPMNWhZkln16LvcTsmJKxRwXCKuC2w5+RFo
X-Gm-Gg: AR+sD12dXH+djGRQhe3xTaxBRyvQjacBC0/XCFwE0paRVbjOd7lgYqKVsT/nBDtm5Wa
	5UTUAFcCoyXeHSHoeT3DGQxVRDQzXzEaARDvR/A9I7fnhjW1S1nTwdmFNXBCANrm68l2dAXLjAm
	T0TGE8vGHRV3Om9LCKe/PlhVNjybDAE8EatX9om+1IbGdwx1Rfe75hjaJQaChkoVslky0Mnicz6
	UaqjaXXx0z6VqdPfPUfU5WmCwDYjUgEGTyABFSF1fU0FsC4z9e1oI1mqQeybdoT/OR7NKPTkCdZ
	nYxoEsgWKX0GE1Q3s6SDBM3hiiKyeOBi3dvd5jIS4UtKdCSSRzFedry3t+vRg7Gy5n9JMQLRSpd
	5NJueYEsLWi8tmMcscDtlkGaDKptECQviTsMLK8y8kmCfpMwRXdaH7VJtdmxIxzsbYxECr0wvnI
	r88SlhMZzmB9Q/fv8HYC5P67WP1D/XMQ0vSgpYnSung6Wu2oCo/YkmvQ==
X-Received: by 2002:a05:600c:4e01:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-499aa1d0747mr66690555e9.11.1787134752059;
        Wed, 19 Aug 2026 03:19:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Wed, 19 Aug 2026 12:16:23 +0200
Message-ID: <20260819101853.44681-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031914_415811_F5B7386B 
X-CRM114-Status: GOOD (  14.25  )
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

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..f8208fb0f723 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


