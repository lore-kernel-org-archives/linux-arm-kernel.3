Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598DFC44538
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgBexwpj/OEKX+erHWaoGqMnF1WFACkRVhpEtBjt1zw=; b=JU80TFGIVG7ZpK9NjSQRgF2+KH
	d9G+DLpRu6Owf3lsLf8SdArT7bWfqlVNuuxqXCS43g6Jfm8+BwZ8eUwHmRur2gFw/LxgVa7CUEk/O
	l5vGcG2gk6qw7pjismBkeauOtl6K/E9GApRLmanOqawfWN7NI4pDIGm70LMebyLp0kQz60YKO06IR
	vxKqGiktrkDIBLEDr7gg/f/z65nMu1YcGJ3HclApBrVpS7xVN5hUCfWvb0JdHiJDFK0oxiegaVZIF
	qL61VL9cZlzjlbI2LDnLDPI0v0fDYoU2J9xiG6LqBJ8hajwCl+lvFlrLlMV6xeMDYBcdLcQK04OM3
	upM328Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7or-00000009DJV-0siv;
	Tue, 21 Jul 2026 10:35:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7op-00000009DGK-1oOS;
	Tue, 21 Jul 2026 10:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB53C60AA5;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84B51C2BCFB;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=AhRTLnCcwo6Mxg5rxROPb+PhKIVmCT4avAH9ngSVIfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lcXaowgVVDEmx1GchFtINXI6E6M7xDabymranzZPjF81F0I4h+2PUyfn81YjInh6r
	 IwkGKjajFdomMOsOiCY0reCctIelfPAPNV0WagBV9Fr1dJ5ai5x1fUufMzP7GhPJIn
	 FOy9xEXkP6CvqnnqfUIorRyJRJv5UZv+AIzDb2LAEN2CjJUyeFIT6IX0n5Bl0UkowH
	 KfiAFPFwpZGkdMTR6GimFawNKv5wHfhNJ5HF8lxNhb5kDqh+qm1pbQZP7reN70nydY
	 IQ6y/faq1PvGBMvNYF74fVOmrQPWfLmM0y80C8860ENPYV6FtuyoK0/Wd/PeZBhNei
	 KZ9JD5ahiVkiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E5CC44529;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 21 Jul 2026 18:35:20 +0800
Subject: [PATCH 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY power
 on/off into helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dcphy-rx-v1-v1-2-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
In-Reply-To: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=2365;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4GcNX0JppuDhi+PdI+Mfy3wrN0LmkfCuqWcPPnXARtM=;
 b=WyxM8NMEq4WZ7Ic0mfu0q9LQ7+49eB9EWcUg16azkFqHpHAFyZA/o9RvVzdZ+BT8wBxYDPhV+
 oG2R5dmESqPClHCersw+Wwrvfe7joPZxI6oS5eJSMXh5jKL235KWGVR
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

To prepare for adding a receiver (CSI) direction next to the existing
transmitter (DSI) one, rename the transmitter power-on helper to
samsung_mipi_dphy_tx_power_on() and gather its teardown into a new
samsung_mipi_dphy_tx_power_off(), so both directions can later be
powered on and off through symmetric helpers.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index cbd780556da8..d0d77421bd4b 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1332,7 +1332,7 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
@@ -1358,6 +1358,14 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
+static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	samsung_mipi_dphy_lane_disable(samsung);
+	samsung_mipi_dcphy_pll_disable(samsung);
+
+	return 0;
+}
+
 static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
@@ -1368,7 +1376,7 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1383,16 +1391,11 @@ static int samsung_mipi_dcphy_power_off(struct phy *phy)
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
-		break;
+		return samsung_mipi_dphy_tx_power_off(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
 	}
-
-	samsung_mipi_dcphy_pll_disable(samsung);
-
-	return 0;
 }
 
 static int

-- 
2.43.0



