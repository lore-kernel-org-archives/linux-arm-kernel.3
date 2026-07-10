Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D09C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=OP6Mm+br5SFN6UbrWJxejjzktE
	etAev4ARhu/dC1AcPKA4QWvdV+/zxo98TC1oX+n6cZqjMfoqnl/Dl/c3+bEUiS7OrEKMaMGQhyn/b
	dVBsCDBqyHquDHsvmslhiiqW5zv0CEtaV5bkD3ZwLs65Qil33iRpUhXU1TyiKgmHnlY4LI5ujv+D2
	UKSJV6FVpDhyF42n2e+i3oF6SYN3Xl2blVsmExzexygpi/SOsYJHYpDtnAB9HYTYcvNPMkUiUeinz
	7j26g0ciDmdYRwkXZn7cK/2AvXS+Ye7gX5R1Yb29F7pS6lFQmnR1wjKgSGaXb7cytaLrG1bTV6+fH
	g5T+wDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENP-00000005K35-25kf;
	Fri, 10 Jul 2026 16:46:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMr-00000005J9D-3B5C;
	Fri, 10 Jul 2026 16:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+zf9ts3xmkxS19VSkZwdCH7Mg1uXUmZUvKDpQ9+XwGnr1xKtANgDDFEfuzogKuGx
	 pZ9bcu1TjkQUoE+J37DVgeoZgfee53lSmwGoYg8aNohAbzS4ig4qF4BovCza0mLPvS
	 AkQsPv1ic32/Og9yXUrxXSp1QEDIrMlHXVJeqcw9+O/WhC/MEbABHOOzVMFHjpCxFe
	 9RPjZg+kF6xBwZXiTIN1ntsLxaC3zB6modqO9ilrCaRsPSSM2JhFkFipVbdf978tJ5
	 xK5YI5g/udTzBKKcz+22tYsfzKq0lsGK6b6MD45u95kujcTOEMeonAQephd2gdHrrV
	 KDZbgcR+SlDEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B66C17E0EFE;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E4134480035; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:44 +0200
Subject: [PATCH v12 06/36] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-6-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdi6Z3cxDpnbnvAPqWEpG4UhgVaUCOrZg
 2mLK6E3sVFFl4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaChMP/jbNA7sQE6ZWvL/WALH85hw7hBt9rLcHcuxGkYSvs/+/Udcfofxi4jEddt0prNSGU6D
 NGMugr7TB9T5YXQJJ5SR6tWh+uchAjbMoiz0ZHQepcq+fMaeS6di6p67MI6mg03gJ3MKAzUAjKA
 yAAenURLqAhYjPmKtPRwOG4qCLYd3ug5737wkvzylH964hTCA07JsUHOtavIPq4WrPbsMS2F2xn
 8+q4vo5ObvhPabIxBR3nXLk/JNULDdCoNGOGafLCGzElwNbkXMI90zDwapFBhl/5IC5tllc6uW7
 0YOHK/t63R6k0SckJOPePcIcJNfiDAcll8WCl1Bsu8rr1mC6UHpX0IZijgZAMbquTQ43LzdB7lz
 MsUUSGIFDVgSv9aMHGVS87zWsCwtE0RAw/9dsxU16TpQ17KGWEh4YZO5V2jXp35tQKdxeMTmQXo
 H+4OLfGegF1qTPTSIzKpDV2leIsEth4Ta9htEIRngI7okkXMOnNJF7vgQ1DHUNZ8VOLzoy3KXin
 jKZT/mJ4V9xOKfHR7jCF3h0JIIKNdO0k5Sf2irFKqLUIFrgK8AQirwjzERWuuMsVyo4T0/jyb/Z
 41VdqTUi80IrRhZ9uoSNTh/1Ju9ORH3BHWQi+4he4BdJ32Mn7kX0fM2dp9sUadOpeGd8JuQfBnq
 lsVZWx7hLytM2Y2W5jD8sfg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094626_046946_BEE449D7 
X-CRM114-Status: GOOD (  13.01  )
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

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..6cb9f6b4dbf6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -452,11 +452,6 @@ static int rk_udphy_reset_assert_all(struct rk_udphy *udphy)
 	return reset_control_bulk_assert(udphy->num_rsts, udphy->rsts);
 }
 
-static int rk_udphy_reset_deassert_all(struct rk_udphy *udphy)
-{
-	return reset_control_bulk_deassert(udphy->num_rsts, udphy->rsts);
-}
-
 static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 {
 	struct reset_control_bulk_data *list = udphy->rsts;
@@ -924,28 +919,6 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
-{
-	int ret;
-	u32 value;
-
-	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
-	if (ret) {
-		dev_err(udphy->dev, "failed to enable clk\n");
-		return ret;
-	}
-
-	rk_udphy_reset_deassert_all(udphy);
-
-	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
-
-	return 0;
-}
-
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 {
 	struct device *dev = udphy->dev;
@@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rk_udphy_get_initial_status(udphy);
-	if (ret)
-		return ret;
-
 	mutex_init(&udphy->mutex);
 	platform_set_drvdata(pdev, udphy);
 

-- 
2.53.0


