Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80823CA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaEwsvFdr7IwecRFw7qwe0gFEpilL7y2nZGz+I6GYWs=; b=ENNhrh70PZ5LLadI7oSAJLDNzW
	Y00RexYwaSPzVyEXSIc5IdMMjVvZ1ACRQgqGdEbie+wsS2KBTPVuNlQFXb6eY8M8mapV+7x5ZUIsX
	AWiAHFTmYqbLOAGy2jFPNCFOYOng3Clw6NSZDPzZfb7ExoAeL+t7oTCv8knYC75BawEJeUN2QMjbC
	Jdh9+aBJtSiEIUE0e1xfK/i8YQ9Q4iriDAH4aWqj5z5GHPpltl55RW/918iUT89y+6OeWMgO8OXpZ
	Gk4C/PBQpJn1dtCBJvDXdvhM5gMKi7r0h8hr5LjV+ONC4v0ytDTbB7Jfe7UOND9g4Ifo+8mGAAF0G
	EaXMhThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGay-00000009BpU-3Hjq;
	Thu, 01 Oct 2026 13:13:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGav-00000009Bn7-3jSh;
	Thu, 01 Oct 2026 13:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=LqRHdeRqB3JBonmJ1Qavl1AGpOkWFclCKjb3FPr6XEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D2gi/aP+Hmhci5z5zv6yzHBwoES/N7dsTJejP0CvCr00TPTWbp+fmPQEOGGbjM4QX
	 x4eJrkj43RXjig/pz6/o8hAc+PslXF5kgVriIwXaOH5mnBq2Ui/bEGD6qGte+I2aTJ
	 YPXtHPZ8Fr2l7A6RunrJ0Cp/Co2VRvw+/pyIsd1DHjfkYr2IKg7KRsz5E0imWi+fXa
	 7QZWVB1m8tHpCxeSdZZ+vNs97X32ZsK3jWwV2sCVceN5JTvowuqGJN98H/2ocN4ftw
	 /pDFYHxVx0pIw3RIwZ32F2jbih7ecloqwlVNPGHrcP8TMX+UACvihlWL2VMf5yZLb7
	 qiasat3U2O+ZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 769B617E0803;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 294ED480031; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:42 +0200
Subject: [PATCH v2 4/4] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-4-e01bf509359e@collabora.com>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LqRHdeRqB3JBonmJ1Qavl1AGpOkWFclCKjb3FPr6XEU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF76P9cQAjt6hMwhAFreZmNUhQKycK4P0
 1G/cgbYsIbnE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qap6EP/01UisRTHqF/46cdECa+p6iVGK/P8oHwCtPXo3CrkQrUoFyoqniD6UyspkztDobc3zy
 uzvHNXe4QATibVEqp8Zlh48SJcpQZXiNaCW39cXI4LN5NAFOv5cAq2iOR0nZAYbNx5oTld5sY41
 bwtnrpHAJOM8acEALV+J/Suj+ncev03vwjYxy6ry/j7/y87SGsjSqN3XPGpjRYZDnWZef+WapuF
 IwBZ+gAOhIIvGKZTJHImoT5QmGvkRRA687VLVjhy23xxYDWlPoYWOXXU8YIUoIwNMY8dZ7QLnBS
 6qhk5DZaH5L1+5zpXqHgPDjRjwoywkdZDoUt9EkCTGMWFwCnKqmWh3kbdgfoaBQF2HVLNP6zCZO
 r4i2sX9PmUNjW/e2zZjWYuXvlV0cy3Vepx3WDsKbOsPD0kDwUeOSXbOEcddcrhHXqwd73D58KbX
 mGj2Nzkv+o1bUTg3lBCXg90b8PBPd2QeJaqRL8fLM68kHygC71XnHmOlkQ2VbEIIyLPJtBlUNhX
 wKtvFhfNPkYb2mM5rC3vk8HAkr+J9VJ5FkbBMZPOPbpmRwqCvaYOBPe9NL3PTpTALzaYQbsueNs
 5sHYYIw4p2A+UfUDVgqLIBHywo99WyY2EVFkjIHtcDubuNqCJk6lsb4OSECDTFhxXLD/ZLqc1FL
 XeNORufyJDaO7UsnubwM1Ag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061306_100771_978F5B2C 
X-CRM114-Status: GOOD (  16.54  )
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

On RK3588 the 480MHz PHY clock must be running to access registers on
the OHCI and EHCI controllers. This requires that the clock output bit
is configured correctly (already happening) and that the PHY PLL itself
is running. The PHY PLL is only running when the PHY is not suspended.
This is currently handled independently of the clock and thus the clock
might be enabled with the PHY being suspended resulting in a
non-functional clock despite the clock being marked as prepared and
enabled according to the common clock framework.

This is especially a problem with OHCI system resume on RK3588, which
does:

ohci_platform_resume
    -> ohci_platform_resume_common
        -> deassert resets
        -> ohci_platform_power_on -> enable clocks
        -> ohci_resume
            -> ohci_readl(ohci, &ohci->regs->control); // SError !
            -> ...
        -> ...
    -> root hub resume (this resumes the PHY)

Fix this by fully powering the PHY from the clock prepare function.

This does not work on older platforms, which have multiple ports and
only one 480MHz clock as we do not know which port should be resumed.
But as far as I can tell these platforms do not have the clock
dependency from their USB controllers and thus are not affected.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 31 +++++++++++++++++++++------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 925a03fee6bc..cc923d12ef7b 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -363,6 +363,8 @@ static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 	int ret;
@@ -379,16 +381,27 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rphy->phy_cfg->num_ports == 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	if (rphy->phy_cfg->num_ports == 1)
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], true);
+
 	/* turn off 480m clk output */
 	property_enable(base, clkout_ctl, false);
 }
@@ -632,10 +645,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
-	if (ret) {
-		clk_disable_unprepare(rphy->clk480m);
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
+		if (ret) {
+			clk_disable_unprepare(rphy->clk480m);
+			return ret;
+		}
 	}
 
 	rport->suspended = false;
@@ -653,9 +668,11 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
-	if (ret)
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
+		if (ret)
+			return ret;
+	}
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0


