Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D56C71151
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Dh6M1yk89339NqCnwtpskYIgHs3LduCgLeIotgavL0=; b=dpV8Vy85pOCKLAgZj0m5vS0w+m
	Gg+9qOraCLSb2nZyBISm0m2mabIwualNWIfPlcZJgCrNCD2yzg9aKwAfeG4GwrlObQsBV9xKKr65l
	Yvr49Yz3edZ1nr2dPG68YLUiOCFWa4oWhjAFuAMlYxVhRVALuuGQnKpn9rJKJ67VHnoIDsQJb/CQb
	aqC1CpWH8phwFi2WXvCkNiq5fTjWq0avPEyAAFc4IE1NQjKiBIvRhkG/HswmoAfKwAwtl07ZHKtsr
	lj8iH7Axc38v2hfufz8Uqjj727xphfAYYub2ZvGvxB70gbmytjoo731Cxv3l42bfBkE51xvwrXdT+
	Tbu3zB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq70-0000000EjE3-0g8i;
	Thu, 12 Jun 2025 22:09:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjhR-0000000DkxT-1bys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:18:42 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 35F3925BB3;
	Thu, 12 Jun 2025 17:18:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM5PEKpx_US1; Thu, 12 Jun 2025 17:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741519; bh=ga+CnJtjgV5748cza4LG4gu4ebkb1JvJHswsAx84vNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=erHma7rfWlcmU4IJ6Bs6NFwqER9uJ54B9mCdJkblbfhy+4NKpC+yviv6pGU7HwAwr
	 omeKioAEH5enRlMtXDi/KXK6AeFIydGo5LXDwrSgnryO5V84MQ3MmYxwrPRpt0YI3F
	 pmuOpjmS1c22/kFMEyvk5bbhpTddbSWTIzlXxq4ysu1ppjLK9zVDZEFv+or4SGiMhA
	 Hmpu05GujyhxIpKvnR/nmprfBIFiQJh6PLV2ywV9MxGkpHVjusIe7C6v71JUvgM6+Y
	 vcDtOW6YVd7rnbR7ZaSZCz0MIiOCEAMP20UE8memj5M8xTSjM3q7igXl6eQrlXQEsY
	 V528ze6Bo+hWA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:05 +0530
Subject: [PATCH 01/12] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-1-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=2711;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ga+CnJtjgV5748cza4LG4gu4ebkb1JvJHswsAx84vNM=;
 b=PKgLap9WeJx5HzuIdAn6iuuhJVjSoSKJGa6O6hmCk52Vt42aAUOVv9Q69GbKopFEwfuJqLPtg
 Atf3Bb82hifBLO8Q0gzr4Ds47Vb8rmO49CtYPI68tz3luHplM1mRqsK
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081841_559163_947F7BA8 
X-CRM114-Status: GOOD (  12.87  )
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

Exynos7870's DSIM has separate registers for LINK and DPHY status. This
is in contrast to other devices in the driver which use a single
register for both.

Add their respective entries in the register list. Devices having a
single status register have been assigned the same offset for both
entries.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..c418d9e30222ec47eec05bbdefef3df8b7fec3c4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -29,7 +29,7 @@
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
 
-/* DSIM_STATUS */
+/* DSIM_DPHY_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
@@ -238,7 +238,8 @@ enum samsung_dsim_transfer_type {
 };
 
 enum reg_idx {
-	DSIM_STATUS_REG,	/* Status register */
+	DSIM_LINK_STATUS_REG,	/* Link status register */
+	DSIM_DPHY_STATUS_REG,	/* D-PHY status register */
 	DSIM_SWRST_REG,		/* Software reset register */
 	DSIM_CLKCTRL_REG,	/* Clock control register */
 	DSIM_TIMEOUT_REG,	/* Time out register */
@@ -263,7 +264,8 @@ enum reg_idx {
 };
 
 static const unsigned int exynos_reg_ofs[] = {
-	[DSIM_STATUS_REG] =  0x00,
+	[DSIM_LINK_STATUS_REG] =  0x00,
+	[DSIM_DPHY_STATUS_REG] =  0x00,
 	[DSIM_SWRST_REG] =  0x04,
 	[DSIM_CLKCTRL_REG] =  0x08,
 	[DSIM_TIMEOUT_REG] =  0x0c,
@@ -287,7 +289,8 @@ static const unsigned int exynos_reg_ofs[] = {
 };
 
 static const unsigned int exynos5433_reg_ofs[] = {
-	[DSIM_STATUS_REG] = 0x04,
+	[DSIM_LINK_STATUS_REG] = 0x04,
+	[DSIM_DPHY_STATUS_REG] = 0x04,
 	[DSIM_SWRST_REG] = 0x0C,
 	[DSIM_CLKCTRL_REG] = 0x10,
 	[DSIM_TIMEOUT_REG] = 0x14,
@@ -689,7 +692,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	dsi->hs_clock = fout;
@@ -965,7 +968,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 			return -EFAULT;
 		}
 
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;

-- 
2.49.0


