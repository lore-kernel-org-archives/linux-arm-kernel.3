Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0ECC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxxkzZ4yEhQf7opIsCfnBNmnUUhOHrkOhB3UxKquZO8=; b=pmOP2c60FS33e6pUI7YZJfkr2+
	xorWSApK80iQtvGllzxdLKh0q5XG5H7KU8CHljozyozbwuNwsMrR9XrexR2C3O77VrMRNzcpujWqP
	dNV32bhNmIoAmBUXdv0RMD3qx6+rPOrVlp2BskhxMvzvSrvoMTH7S25B9oka844e9FzDmRgmkx2Su
	C3zpqKX2Pp6yLVs2ZJd1xSKn/40kOPVR05S/2dCkw2/ngSLkHoY4hFB3FkqeRJcv19CptJyUh2HKD
	bALsQiuv/MSx7+eyzX/i/It6DPaAAQcSKhvnL6y1WtZdB3OAxSRhxabo7HCEq6j9GBUhOXXJQvmlC
	Y/JBEC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszKs-0000000A78s-3sZL;
	Sun, 09 Aug 2026 08:56:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszKq-0000000A77s-1Ihf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 08:56:49 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8351242C2F;
	Sun, 09 Aug 2026 10:56:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5a2gwA-ajPo8; Sun,  9 Aug 2026 10:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786265799; bh=KkCb88jpb3D1kBUtynsLp4Zj81VOJWY1vhwCs7mKWUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jPnHcDwsXkaZQQylVP4a2dD9xTWzBDA24HuB3SXecErTuRnvVHajXSaL6yCJvwXhz
	 f0F7bnmz+CT5yMRoA/phNg9wCIMgDjznuPzCYRDxpq5w6CyBb2Mj+2HYG0Wf/4OqkG
	 xDQP7FqnW0UEll1YNyUS1KXH7xWHdH9cmckEuQHd3yfKOOdbuGr+b3NSeNpARTQz86
	 V3RoFtBakIm+U/cR9d9IJiKu3KApGfytKsiGvIFPxhyto3U8SGLDfB3ZDerXgX9U6U
	 49ZW04bkX8pW03Fb2H56RxCwjZY/6a+Ddr8zkctBL92z9OWzGaYJQ7ruIdlXnyd/R6
	 euhzGV3dvRqfw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 09 Aug 2026 14:25:59 +0530
Subject: [PATCH v5 1/3] drm/bridge: samsung-dsim: enable MFLUSH_VS for
 Exynos 7870 DSIM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-exynos-dsim-fixes-v5-1-6e63dc6c238f@disroot.org>
References: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
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
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_015648_485359_9DA48DBF 
X-CRM114-Status: GOOD (  10.35  )
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

Commit a36c533ad3e1 ("drm/bridge: samsung-dsim: Always flush display
FIFO on vsync pulse") intends to enable FIFO flushing at v-sync pulse by
not setting the active-low MFLUSH_VS bit.

However, in Exynos 7870 DSIM, the MFLUSH_VS bit is active-high. There is
no publicly available documentation to the best of my knowledge, but
downstream kernel code [1] supports this claim. Enable the bit for
Exynos 7870.

Fixes: a36c533ad3e1 ("drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse")
Cc: stable@vger.kernel.org # v6.17 and later
Link: https://github.com/samsungexynos7870/android_kernel_samsung_exynos7870/blob/a3762bb1761ae/drivers/video/fbdev/exynos/decon_7870/dsim_reg_7870.c#L699 [1]
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 25ab475309e8..fc42acc6b9ef 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1089,6 +1089,13 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 			reg |= DSIM_HBP_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
 			reg |= DSIM_HSA_DISABLE_MODE;
+
+		/*
+		 * For some hardware types, DSIM_MFLUSH_VS bit needs to be
+		 * enabled as its active-high.
+		 */
+		if (dsi->plat_data->hw_type == DSIM_TYPE_EXYNOS7870)
+			reg |= DSIM_MFLUSH_VS;
 	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)

-- 
2.54.0


