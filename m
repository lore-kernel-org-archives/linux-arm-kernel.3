Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlBY2f5jEYHpFGgwI5JjWmBPthrq29vOp7+orYYMLZE=; b=KKzX+P+BSkdqbOIljTcE0xLWCH
	kjthaaJPiGhc8A3DZzv3EwygCX0HVsW9iPsOoDIQEsL0Y0ljZZmfEO99uIyPhsZvIRFoDSw74dTym
	4OpQqXVCNOWPYzgLuuBxVY/SjjBExI+15DHORXL6lwaHmTsxAmPWnSkOohaK9k8sXP6sos/OKPofI
	Krr6c+3h2cqln/Juj5NurXqAv2qVn0w1mELW0aNnPlbCJmpiYhk+nswB88lSJ3WZvR4yOa5CX+MXw
	wU38iAHJj4Rt6KkBYRXj9H1t60XwM7xxMLSR9AqudKHLfecLVB++8r/XSmdNsEaErgWf70bA94urA
	V5jU9AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tw-00000003BpA-42mq;
	Wed, 01 Jul 2026 23:36:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TM-00000003A1E-3jmI;
	Wed, 01 Jul 2026 23:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=bKDdZZCtkVklLvuOJ/CwoTUY1zBlabG6/ZcEjIw1OmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f49UkJ0GDxOqcGilDod4203usQoXervXpoBLylAUl5z4NcNhqXWtkNBPRBSYDxNrA
	 m0sbgwmD9mNvUrla+AzOmnjD3oIDL2/vINCMKhxoADfhgoSsjjXVXcGrXXN26GXgwl
	 Iw8rq3EohFcPm5nvV5VeYcmttWsEpsL3n4Hv7XWnvOUv2sXdLDR3b3zyteEOIRMLwA
	 YKyIdIJdbhVxRxcCUh9D6GS/HYpYodGFpbTEc9B4V1pvbLQ4mNz0g/qlXCP6JeFVCU
	 3JRCL8W2ZSgOqBC06mRfiomdF+XLC2zdVymn9LltHpntzBKCCTZLrx5a5lf3Z374lX
	 bwIgnSrQkR8gQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B03E17E3622;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E4D1948007E; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:16 +0200
Subject: [PATCH v9 38/38] phy: rockchip: usbdp: Power optimizations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-38-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bKDdZZCtkVklLvuOJ/CwoTUY1zBlabG6/ZcEjIw1OmU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFS3Jvf08sVJqltNC2CPns0KIRdL+kCAb
 PKg83xbtXFiG4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qazE4P/0Dhdsb1v+yhHFhIBMH8QIq1MQH+ZaVQrbXesc/qxdyrTP5H8jXCD97VTdDekUzg4e+
 PWlwKrZ31IniXwopFxBKu52GRxSkbU8ohI7v5rBOMkQ2TzwWbvIlqgIu4rzbuATAfUemvY7D9Rr
 ui/tX8hFXrTboCFmkW/435eQ6k0p/+CMi5lxff/zYOJk9+pHm4fXUVvev0Vh0btAWVMKGv1wvGE
 LEtoZBUoOySMmWUO7PFErGsaTLU6QpkuL5h40CIwC13ftqCMY4dcqWZjw0u2ZyD1KY7w3pOUUwF
 JFdWuf85dXzWl4ZyBgdWY8YyXKcKm5fsLft3uIETK3T8mKuSV+i8rDz0Sw/WhZ2dImG24M9aQ5y
 BGfSqAa0lH/TgSEf+8QOm/rn+Uv6P0wcGvAEeA98Y5GVFnE8oj/Aa6NSNTE0WdTGaInZC+/YZQB
 Ne1tZXbqPMGMFVY0qbpBD7dTsACtY7x7d7dvr13VkCEzMYo9AJMD68pj8w0LzzjmOb5Dn5o+U17
 +DbxBfX4hTz6bOTtYmQfbrC/JQj+NAoxBoU4lhSZeQ0AJw2yzyz0+5/zt9Mz1PIfiW9xu89mJ/V
 pwNl0CbJ3dbYmAk56TBNmEXtO0RMNnZwA6aDXZSZNLpS2TCnj0waTHYdJvO1gizE7WDL+NsFYaz
 nJO8n6/JyzJ7/9aExrrk6vA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163605_179203_517174F9 
X-CRM114-Status: GOOD (  16.64  )
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

Right now the initialization routine enables power for all modes
currently supported by the hardware instead of the combination of
hardware supported mode + software requestes modes. This wastes
some power for some use cases like having a USB-C hub plugged in
without the DP (or HDMI) port being used. Fix this by requesting
power for software requested modes, which are currently supported
by the hardware.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d056da53cb1c..7f90f666076c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -771,21 +771,21 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_init(struct rk_udphy *udphy)
+static int rk_udphy_init(struct rk_udphy *udphy, u8 mode)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_enabled_disabled(udphy->hw_mode & UDPHY_MODE_USB),
-		str_enabled_disabled(udphy->hw_mode & UDPHY_MODE_DP),
+		str_enabled_disabled(mode & UDPHY_MODE_USB),
+		str_enabled_disabled(mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->hw_mode & UDPHY_MODE_USB)
+	if (mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -822,13 +822,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->hw_mode & UDPHY_MODE_USB) {
+	if (mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->hw_mode & UDPHY_MODE_DP) {
+	if (mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -837,7 +837,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->hw_mode & UDPHY_MODE_USB) {
+	if (mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -860,7 +860,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	return ret;
 }
 
-static int rk_udphy_setup(struct rk_udphy *udphy)
+static int rk_udphy_setup(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
@@ -872,7 +872,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 		return ret;
 	}
 
-	ret = rk_udphy_init(udphy);
+	ret = rk_udphy_init(udphy, mode);
 	if (ret) {
 		dev_err(udphy->dev, "failed to init combophy\n");
 		clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
@@ -1039,7 +1039,7 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 
 	if (udphy->status == UDPHY_MODE_NONE) {
 		/* Power up (incl. clocks) */
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_setup(udphy, target_mode);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
@@ -1049,7 +1049,7 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 		rk_udphy_disable(udphy);
 	} else {
 		/* Mode change => re-init */
-		ret = rk_udphy_init(udphy);
+		ret = rk_udphy_init(udphy, target_mode);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;

-- 
2.53.0


