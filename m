Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280ABC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrPKsqRSlVLnUqN5zpE0BPlVZ3YBXGn54sA8Dd/HNKE=; b=1Duatbsw7aSRNIOfm3ynGbdQZ0
	nFAsbL28hRwvdR99CCijaKhF3Jnu4U2wWMe1PiiT1sSFAn8uBgWRZJ1E+YnRwg53KOqdm4R23zHE6
	RyBUcE07YowqMMZ3pvrj+DyE0cy0EDVke0/iSdwnZYL9eYXd69Jt+3vi7hFrPE6i5e9U2VnGlPP4+
	ck2ecqXPkdMHYlruQx4+eWO6uhz2lOidMyXIP9DXlBy8DbeQsglqiJuPx4Wq07Ci6us3nDzmXs9J9
	5yky5cbRM4m1KTI838254g91nR+hlqfLhJE8Xzf+2XP2Kh6jyxDwLsrZDW2oGDAMWwO/omO8hRMtC
	SPUohLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsytg-0000000A5lh-1TNC;
	Sun, 09 Aug 2026 08:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsytf-0000000A5lA-0T5E
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 09 Aug 2026 08:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MrPKsqRSlVLnUqN5zpE0BPlVZ3YBXGn54sA8Dd/HNKE=; b=LEtY5nHAPYEWtfwAb5qM4yAreE
	5prrinAh+8wo2gmPAbo8nJ1o6MINSUj/dGNAaJ7tYJOb/LJPaeybDFE4Y82wALchkeRIUIdYF+rUW
	hRln2fFMxsxZZH+RkuKneV8WyrpJvt47cBe2N7EOYlF3aSbwqxMJOzzi9lau+dnhMkYvaAEn+CWCs
	9jAq2g3C13b0cE0rIoDIe37n3J3P8RwpTBJ97vUAtTqj7pMOXyUt+TFu1rAFglaRu1efBK6Dl54c6
	d5zU5kFmYYmFmYMI4etcvVD4URWHa7qwbcVN3+KvmZ5MoUPaFKX2ultcew4tz4/cLnpAFOPcIcBFi
	vcsGAJhg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsytb-0000000DEko-3j7V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 08:28:42 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BBC6C43092;
	Sun, 09 Aug 2026 10:28:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdaL4yVniJMY; Sun,  9 Aug 2026 10:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786264114; bh=9TT9CJ5yyDMdNry/NTuAsIsN0De4CnxEpXPpkHY+ljg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QfT+4o60gSuO6xHX+8Tw2kmL/E/jAybh39MXwlN+ZJF1KdsWCG/x8X6QuMLpqhckt
	 ++Xe+OJH6rlQ0eCmw8vwMD0cKYgHQs4TXByjqNBALJX7i5Z3MASjX9sxJODk9L2lhO
	 wJoOxjylQHNyusFSJ/BtgkMhuMUjvy+u77kRhVWbk2oioszlX7a1jTJxBVW7+VKEPo
	 2PAlql+bsFzMXURcOgx7vfLZQwjPH5CtZFUEmV+dcujPoLM/tdKeNoemr69VkolTO8
	 i+US13h/bfi/EyzdSjVk2uCpORw+gcNgW/gC7P9hRdR0upchdeuPfyFgGichKvCODb
	 bMEe/6nm38lkg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 09 Aug 2026 13:57:42 +0530
Subject: [PATCH v4 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-exynos-dsim-fixes-v4-2-ca67c51e61b7@disroot.org>
References: <20260809-exynos-dsim-fixes-v4-0-ca67c51e61b7@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v4-0-ca67c51e61b7@disroot.org>
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
X-CRM114-CacheID: sfid-20260809_092840_236465_9C4C5737 
X-CRM114-Status: GOOD (  21.80  )
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

To utilize this, explicitly unmask PLL_STABLE and SW_RST_RELEASE right
after reset, and wait for reset before setting up clock.

This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
testing on all supported devices is less feasible, introduce a stop-gap
measure where the timeout has a gracious lower bound of 100
microseconds. This will (hopefully) prevent regressions due to timeout
on other devices.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 49 +++++++++++++++++++++++++----------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index fc42acc6b9ef..9f58c7b1be53 100644
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
@@ -722,9 +723,14 @@ static void samsung_dsim_wait_for_reset(struct samsung_dsim *dsi)
 static void samsung_dsim_reset(struct samsung_dsim *dsi)
 {
 	u32 reset_val = dsi->driver_data->reg_values[RESET_TYPE];
+	u32 status;
 
 	reinit_completion(&dsi->completed);
 	samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
+
+	status = samsung_dsim_read(dsi, DSIM_INTMSK_REG);
+	status &= ~(DSIM_INT_PLL_STABLE | DSIM_INT_SW_RST_RELEASE);
+	samsung_dsim_write(dsi, DSIM_INTMSK_REG, status);
 }
 
 static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
@@ -787,8 +793,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 					  unsigned long freq)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
-	unsigned long fin, fout;
-	int timeout;
+	unsigned long fin, fout, timeout_us, bus_clk_mhz;
 	u8 p, s;
 	u16 m;
 	u32 reg;
@@ -849,19 +854,33 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	if (dsi->swap_dn_dp_data)
 		reg |= DSIM_PLL_DPDNSWAP_DAT;
 
+	/*
+	 * The PLL_TIMER value is the product of the timeout delay and the APB
+	 * bus clock rate. Calculate the timeout delay on-the-fly here.
+	 * It is assumed that the bus clock is the first clock in the provided
+	 * bulk clock data.
+	 */
+	timeout_us = 100;
+	bus_clk_mhz = clk_get_rate(dsi->driver_data->clk_data[0].clk) / HZ_PER_MHZ;
+	if (bus_clk_mhz)
+		timeout_us = max(driver_data->reg_values[PLL_TIMER] / bus_clk_mhz,
+				 timeout_us);
+
+	reinit_completion(&dsi->pll_stabilized);
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 3000;
-	do {
-		if (timeout-- == 0) {
-			dev_err(dsi->dev, "PLL failed to stabilize\n");
-			return 0;
-		}
+	if (!wait_for_completion_timeout(&dsi->pll_stabilized,
+					 usecs_to_jiffies(timeout_us))) {
 		if (driver_data->has_legacy_status_reg)
 			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 		else
 			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
+
+		if (!(reg & BIT(driver_data->pll_stable_bit))) {
+			dev_err(dsi->dev, "PLL failed to stabilize\n");
+			return 0;
+		}
+	}
 
 	dsi->hs_clock = fout;
 
@@ -1586,7 +1605,8 @@ static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 	samsung_dsim_write(dsi, DSIM_INTSRC_REG, status);
 
 	if (status & DSIM_INT_SW_RST_RELEASE) {
-		unsigned long mask = ~(DSIM_INT_RX_DONE |
+		unsigned long mask = ~(DSIM_INT_PLL_STABLE |
+				       DSIM_INT_RX_DONE |
 				       DSIM_INT_SFR_FIFO_EMPTY |
 				       DSIM_INT_SFR_HDR_FIFO_EMPTY |
 				       DSIM_INT_RX_ECC_ERR |
@@ -1596,8 +1616,10 @@ static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
-			DSIM_INT_PLL_STABLE)))
+	if (status & DSIM_INT_PLL_STABLE)
+		complete(&dsi->pll_stabilized);
+
+	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
 		return IRQ_HANDLED;
 
 	if (samsung_dsim_transfer_finish(dsi))
@@ -1635,9 +1657,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
 		samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
 
-	samsung_dsim_enable_clock(dsi);
 	if (driver_data->wait_for_reset)
 		samsung_dsim_wait_for_reset(dsi);
+	samsung_dsim_enable_clock(dsi);
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
@@ -2148,6 +2170,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
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


