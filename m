Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47415C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP9WOknrRbVdbGNkYn+teVTFAjIHNQKQcJ7aLUia5sQ=; b=UD7y4crh5xc8Mof2ZP7rFCPPY5
	imblUziU/+3unsMXF1oSW/2KLMVkLo52zSgjj2UZYbLeYI/DD5EO5bdeof3KxsB38lh4mA78qhPEm
	qkS4IFAOscW8wiYo5hxLXz3FHgMoSXhIkhfCuAX4JgTOOT0alFhNSw4Sv6XZVoY+FrRwkTas+Wmay
	KM9joHPcHOTo20fD6XGLq3nJLG2fosEc5R5ADugxHzfmztInTFsYhTQp89BgmJ6m1DGyu2kEBbGXz
	hlCDxAm6CVDQEGKs0gHXe7GLV+zltH+yT1YPdWh/X7CjCNl7nWYBjfAAhT6/XLUtX7YHjIrJQNGZJ
	Jqirybpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxN-0000000DG35-3wtu;
	Fri, 21 Aug 2026 12:02:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxE-0000000DFwF-1onG;
	Fri, 21 Aug 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D24E444084;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A0AC2BCFF;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=TnI1p+P/50A7HWM9Y8HyRkngg4ldec9pgu0d66QJY5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TroQY1etFEyAwtSBl2bnHKcPIyWCaSr94DsOSVADzv9hdB1dFykOsP7dpp1oSgljr
	 /41jAxzMxhQav2Pp7GF93hS+bK8Ys59TOPfnVQb/s8cjQV33X3YtrE808HV3QaA8ZV
	 6i6rgrQCg/4A6RpOLBix2Hhq60uGjDloZvPvpvBzTpczayO6MGN8oCUKN3Q23EAh1a
	 kvkF+JryigXrpFKxQz9PKlcIsCRLZ10nSinBNv59hQ4iMKRRIwtwbTpfKZdP0pfENr
	 zGOuP1MyCXkBoYMGwDBgvSabq5A5EfUlMM09ofX/WwjRHE0/sbxvf22Ef/hdUj90qw
	 LGoGUbQRUgZBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AA8C5DF87;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:33 +0800
Subject: [PATCH v4 5/7] phy: rockchip-samsung-dcphy: Factor the transmitter
 teardown into a helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=2267;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=H9C3dBUKHCEqAqQXc3SD6EcAQzNiujpzdtKGk2VKgQE=;
 b=8OIV6ztcFUOG7ZAoX7MY1eISvfkc4VkrqMa6/7vGpV8pyY1fPXRP+0w9sUvq3clP/0n8GrXdG
 gtvDeMyM04IBjhrl25Y471zayq7Zy61zpJBQZYAB+Si2HHJHvA6nygk
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

The transmitter's power-on path is in samsung_mipi_dphy_tx_power_on(),
but the power_off callback still does the teardown itself.

Move the teardown into samsung_mipi_dphy_tx_power_off(), so that
power-on and power-off are a matching pair. Both callbacks then have a
type switch whose arms are plain returns. Turn each into an early guard
for the not yet supported C-PHY and drop the unreachable trailing
return.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 31 ++++++++++-------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index f58907dec733..5d9d44a1d6a2 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1361,37 +1361,34 @@ static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
+static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	samsung_mipi_dphy_tx_lane_disable(samsung);
+	samsung_mipi_dcphy_pll_disable(samsung);
+
+	return 0;
+}
+
 static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_tx_power_on(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	return 0;
+	return samsung_mipi_dphy_tx_power_on(samsung);
 }
 
 static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_tx_lane_disable(samsung);
-		break;
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	samsung_mipi_dcphy_pll_disable(samsung);
-
-	return 0;
+	return samsung_mipi_dphy_tx_power_off(samsung);
 }
 
 static int

-- 
2.43.0



