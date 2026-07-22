Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F5C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvXvFJzKW/HRHrm6UsHFxHdpsh8N0J+Nr5kw/Vqhy3U=; b=kWGCq4ncwVy5cQEmhEV6jbqjr0
	iKIxXCF4E3Gs685DtX49IZC5Ld/jY1th+PAVUyaaf2weT1H/ynW05D5qDyjOtj1N12ZEcw2TulNDK
	91YkF/HsB5YAC0TwzwwavWZGsh+GZBULYjs8D5jLESnQGe54bfQcWjGjiyscd7Cfbe6AKEE7/Jqs6
	rjuTqxNDgiCdege1Y60Lqu6Ydc/MA5ui36omC3NJRSgCPAfysH/8vmGEkSyuAzfC5P4Iwq9/vHSxc
	3PSELzECZFTF2pqVf78t1l5pVq1kL4yCZdDmN/8/kLFxJyHLCzrzdhoBYhGX48xZ3Xwr2ETDV5q/u
	J5q3FTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcAL-0000000CbBz-41yE;
	Wed, 22 Jul 2026 18:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcAK-0000000Cb9a-1CN0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 18:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UvXvFJzKW/HRHrm6UsHFxHdpsh8N0J+Nr5kw/Vqhy3U=; b=MgmY60/EUJ1aUfaLmSNyE4EJfg
	D5U6VZ2IQ+QJQu5U7D+TMR/uGpB0ewJiLZPLbfrBczctIHNDF3FKbnsKIrH7r4SwpokjUm8SdMKmc
	CtkKwyfM2sltDH+W7/oXob5cqXTycloTLTrSdKVcJyPhBUvyFNs/Jg+28GuxD4h4WVz30+2EbIy+U
	MtldgoDHukGtmj5D1wzYz2YwizzyPc2xlcU0XW+v65CMugsN76X4xMxgvd/lq5cVYG2jBroRLE2vz
	MP5yWtIQOWXl2Yb4tqLtRvBR+bpt14i2PO7QtI9JS0s8sXlRKlR3wW5rJeWkfYxCWlyHb2cm+SC55
	phshLYVQ==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmcAH-0000000187s-0ZNL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 18:59:35 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0364B847B9;
	Wed, 22 Jul 2026 20:59:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXGRsNS74ewV; Wed, 22 Jul 2026 20:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784746757; bh=j5zx2Zv7OQbPH6wFcqtPgLJYRBg7b6u5ufPgbW3BiNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ByRGd02QMj5JJG0g2WL11iS27CdMBQBwkowhIETNf2mxN2zcBQHSumnAXy5gp/z1W
	 r4rl6CFP4m/qtNXU3FXV4+LzzEQH+TX4khAcNkAHLBNAtTmsIOb8GXXCd8OPivH8sQ
	 uqoc7YpkHT/v4SKuo1KGKRRUkp4SKYAbfVIq//gMQ7i3WoxfblKgkpU1xRkbU/ARCT
	 tpT/TH7HRgUTc6zxkDuSxC7RKyWKyfeWlw+drMghHRO9AToeBm67/QHuqMhes2mwhC
	 hOkhUohMN1qjGhpIBtiZMw8LJxnCqEIe+xJkfaDSUf1vUR29g3tyjLDoBwjPI68cob
	 R33zj2JnS0cyw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 23 Jul 2026 00:28:33 +0530
Subject: [PATCH v3 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
In-Reply-To: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_195933_252330_285BCAA2 
X-CRM114-Status: GOOD (  20.91  )
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

Stabilizing PLL needs to be waited for. This is done using a loop,
checking the PLL_STABLE bit in the status register.

DSIM fires an interrupt when the PLL is stabilized. Rely on this
functionality for stabilization wait, getting rid of the implicit loop.

This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
testing on all supported devices is less feasible, introduce a stop-gap
measure where the timeout has a gracious lower bound of 100
microseconds. This will (hopefully) prevent regressions due to timeout
on other devices.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 41 +++++++++++++++++++++++------------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index da753ff6eed4..866cff205e71 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -17,6 +17,7 @@
 #include <linux/export.h>
 #include <linux/irq.h>
 #include <linux/media-bus-format.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -788,7 +789,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long fin, fout;
-	int timeout;
+	unsigned int timeout;
 	u8 p, s;
 	u16 m;
 	u32 reg;
@@ -849,19 +850,26 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	if (dsi->swap_dn_dp_data)
 		reg |= DSIM_PLL_DPDNSWAP_DAT;
 
+	/*
+	 * The PLL_TIMER value is the product of the timeout delay and the APB
+	 * bus clock rate. Calcutate the timeout delay on-the-fly here.
+	 * It is assumed that the bus clock is the first clock in the provided
+	 * bulk clock data.
+	 */
+	timeout = 100;
+	fin = clk_get_rate(dsi->driver_data->clk_data[0].clk) / HZ_PER_MHZ;
+	if (fin)
+		timeout = max(dsi->driver_data->reg_values[PLL_TIMER] / fin,
+			      timeout);
+
+	reinit_completion(&dsi->pll_stabilized);
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 3000;
-	do {
-		if (timeout-- == 0) {
-			dev_err(dsi->dev, "PLL failed to stabilize\n");
-			return 0;
-		}
-		if (driver_data->has_legacy_status_reg)
-			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
-		else
-			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
+	if (wait_for_completion_timeout(&dsi->pll_stabilized,
+					usecs_to_jiffies(timeout))) {
+		dev_err(dsi->dev, "PLL failed to stabilize\n");
+		return 0;
+	}
 
 	dsi->hs_clock = fout;
 
@@ -1596,8 +1604,12 @@ static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
-			DSIM_INT_PLL_STABLE)))
+	if (status & DSIM_INT_PLL_STABLE) {
+		complete(&dsi->pll_stabilized);
+		return IRQ_HANDLED;
+	}
+
+	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
 		return IRQ_HANDLED;
 
 	if (samsung_dsim_transfer_finish(dsi))
@@ -2148,6 +2160,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi);
 
 	init_completion(&dsi->completed);
+	init_completion(&dsi->pll_stabilized);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 03005e474704..e3433da21ad0 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -123,6 +123,7 @@ struct samsung_dsim {
 	int state;
 	struct drm_property *brightness;
 	struct completion completed;
+	struct completion pll_stabilized;
 
 	spinlock_t transfer_lock; /* protects transfer_list */
 	struct list_head transfer_list;

-- 
2.54.0


