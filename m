Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC65C5B56B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJzRrfMiAeq9hEEnMnT51sVekTd63QTotkOeZ5k9/ug=; b=MFjf+FHuoGdojxgOHuyYNvRufv
	Tnl8pm2MedlcHD3qByxKquA9MNI3H1AXQA3yPOe/CP4axgSpk8ecOGsF2qGuD5A0ewa9dbz0sxn9F
	1lLfnnntbfrou9NTPVhrccAfXS+diqvtoPnBRIWn/pKQZBKjpoG4os5N4EZXSnhUzxC2V+j2VIRHy
	JaoosxWLx5Ln0EfiBenN+8f//21QirCzqQxZOKk/yzfYtlnfgdW+8s+IWi4QATYGPSBN0odpwkl5A
	zUFg3m9wmRRkq9WGAdkQodQCtQcPLLo8+nxkp2T8zwPV/U/J5H3oIMgm/ByZhmu7atqPD3Tjut2ty
	UsSuPjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpY-0000000Bh8f-35bf;
	Mon, 10 Aug 2026 12:10:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpW-0000000Bh7P-3jKR;
	Mon, 10 Aug 2026 12:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A03243ED1;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AE93C2BCFD;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786363810;
	bh=4AhIU7paKP+4zIyqwRVCjFlL8baFK0VWf5Xqf9HLh0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gt/QYLDq331jEv1E/do6FmNzo9bzHI9rLNsXg76UjbDZfV6+HFgVd361x61Do51L9
	 zr4F1uVmmCD4wyvnquq43zKfPM6F2gYQbSlYCTtv3ydITF75k83upV91fgenpaSP5P
	 yMztYeybrRrKlrNTFDSZUF7dQ+SQHyx6cQWyFQtLOjWrlzEC1bIwL0S3B+3B0ItqVR
	 Q1bKBQnLeB1O+cdmU9s3xYavlvfWfiaDpNOBnntimtAnWm0DHQV5eFjx5fDjLKpc9m
	 Qw983q265c1GFyhVYN1kZ6HRCe7mvn/8NaZQ+6c/WNHmU6y6PuX5D+0SlOwWgwliO+
	 c654AkI/wAxgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1824C5B569;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:10:11 +0800
Subject: [PATCH v3 3/5] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dcphy-rx-v1-v3-3-a2d25c29adfc@gmail.com>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
In-Reply-To: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786363808; l=2833;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=KTWIu7JKaaQ7XBkf3u7iorhkMyVw5yi2Dq6JGKsEO8E=;
 b=XG6qusYZ28b7SLCI4va8Ob/qRskpAUJSaaJPh1jpmqAmt+ZStqyTC5lbWy1I6AjsbQcV4Ikly
 RF6x7wVog+2BLmGkqjBfYGiymht9evfs5pP7QpT2oJr+37FZWQizWqH
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

To prepare for adding a receiver (CSI) PHY next to the existing
transmitter (DSI) one, rename the transmitter power-on helper to
samsung_mipi_dphy_tx_power_on() and gather its teardown into a new
samsung_mipi_dphy_tx_power_off(), so transmitter and receiver can
later be powered on and off through symmetric helpers.

With both arms of the type switch reduced to plain returns, turn it
into an early guard for the not yet supported C-PHY and drop the
unreachable trailing return.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 33 +++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index cbd780556da8..99ca0e1cc574 100644
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
@@ -1366,33 +1374,22 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	udelay(1);
 	reset_control_deassert(samsung->apb_rst);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	return 0;
+	return samsung_mipi_dphy_tx_power_on(samsung);
 }
 
 static int samsung_mipi_dcphy_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
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



