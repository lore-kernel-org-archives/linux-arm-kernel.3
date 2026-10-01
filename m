Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A99CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RU8WLhsiAyX9KN91G8mKLkSoRZXqOOPUSJnUhgDNWTU=; b=wFbuJRygGk1700vcgZNupN+Q3z
	guCAeOq60lTgEN+kUyuu6QVuAaHzx8AmK5bopTzpHdeTqxH2l84pIGXgkwKs6aKtD6g0xYe3u+bNK
	4tdnus2GNVsVkOIaFpN1b8bKVyAzLN5sKnUaVWnimMVQKQ3vSEy6r8bdlty8aXDuk4cCokMd2OBwZ
	RjleRaX6K0Ulu80GOvdh0z6ndT+iCNeDE+WVG3NM8t7tMOych0q8lP5Hy8VMfL9WnxjK0ZDKRws2P
	tn2JOdLeeZDKTWYi1ki7gLG+e4/gZ7X3DSirdAQu3fNvsRbkY4RR+fKhi/B+uh3EXWG6fI/q5/ERl
	XEVeifuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGaz-00000009Bq7-0NSg;
	Thu, 01 Oct 2026 13:13:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGaw-00000009BnA-0xIQ;
	Thu, 01 Oct 2026 13:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=uFbEv/1TqnqlOuSGoR42a3bpiDveNN7733gqKv617I4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pPdrR9jI0cK58QWxUwsH4kGbXZ/FWujMugIZL+xfEcRoAsx7EXQVRq5A/KME9OZPN
	 euPKfEu3G77MbE/rLIVlKfEBuez7YLAFT7HNEXov2k6wHPK4dRcIGDQVaQtBms01TP
	 vZSEKbg5H82U1wkE2h4A+c7W5R2mxwpbnJH+2FcuOTHVmgY1rPerE2CGRGbcwAQHHh
	 S2t7EOHxVqwUJGHTMjd7+8PUrPki9qPkWst/Y8ezD40VAzs4ARusvsXzMuMzGK3ksw
	 dJ0hGsG9oxiZOSQne4ifdB9KOut4LmJCnYqk0cysMj67hJdGcyMVg188mS0al+8T07
	 MuyhTEBu+Vv1A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7569617E0667;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 277F8480030; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:41 +0200
Subject: [PATCH v2 3/4] phy: rockchip: inno-usb2: move suspend handling
 into new function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-3-e01bf509359e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uFbEv/1TqnqlOuSGoR42a3bpiDveNN7733gqKv617I4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF6B98k0YLaQ3k15aklynKvMPiCB6RPbD
 fRii1jNsvGscokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qa8usP/0ve5gpKWNGmuTNBPDErf2viFgWW//19Ku1xoBv2Kkg8XSD9ejdQYKx7R/qm/fhREH2
 Fzj4FCzWz4uOCjJZ+ff+1UGzUk78TsX3Ej88kqan2ykOMWBtp8nS3D/r77GxLJCoC8oXqiguil8
 m8rp8kWcsFPbjZ/0/N1qBqsgluPmeWK/0QR7VwtEdaWhRZpNsOoGJ0IKM77m78dlMw7Mrl6Wzgn
 aCDguu0xmWtJaTcA/Z4gmCByhH782hehHh6feYPmLyIJjdX8xjivHCYAJvDMl3eYvf9qDhSW//1
 emmK2A6lfYOU/H8v6EgFhKh+6RwxFLjmyIWxnsQYZHmPgvTxtl9gN06pJvEowcMbnmiBa1/gt10
 vwmFxXQdSMjOjcOmPDFXzZPHDsIQmrBEAS0X97ch17CBzNYxH7qS8YV1BM/mBtmVDYGFVT3XGJW
 e8Lp281/RUHedEcaEJzx4r9BQDyy8Zt+gZZHvDDMgDfomIaMcIbaI0TwGNyPgN3ORkJJEKwjvbD
 GjlagYbWwG0/okT3LGYt9iQ5DOfTbOtbMSvztHI4QTzOiCmRXLpnzLoD1ese+q/9ENL+PF/3KU8
 6CY7nutDg89IbdHcLGDOjBEViM5kuI7MCC+Kob2wNgyI9SpniItWc07nD/zrtnGXvWuKwx1Dl4F
 a7+NbC+hmB2aZyvwuDXI4tw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061306_442876_0F2D4424 
X-CRM114-Status: GOOD (  14.81  )
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

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e4d8abf935c1..925a03fee6bc 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -332,6 +332,35 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
+					struct rockchip_usb2phy_port *rport,
+					bool do_suspend)
+{
+	int ret;
+
+	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, !do_suspend);
+	if (ret)
+		return ret;
+
+	if (!do_suspend) {
+		/*
+		 * For rk3588, it needs to reset phy when exit from suspend
+		 * mode with common_on_n 1'b1(aka REFCLK_LOGIC, Bias, and PLL
+		 * blocks are powered down) for lower power consumption. If you
+		 * don't want to reset phy, please keep the common_on_n 1'b0 to
+		 * set these blocks remain powered.
+		 */
+		ret = rockchip_usb2phy_reset(rphy);
+		if (ret)
+			return ret;
+
+		/* waiting for the utmi_clk to become stable */
+		usleep_range(1500, 2000);
+	}
+
+	return 0;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -603,27 +632,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
 	if (ret) {
 		clk_disable_unprepare(rphy->clk480m);
 		return ret;
 	}
 
-	/*
-	 * For rk3588, it needs to reset phy when exit from
-	 * suspend mode with common_on_n 1'b1(aka REFCLK_LOGIC,
-	 * Bias, and PLL blocks are powered down) for lower
-	 * power consumption. If you don't want to reset phy,
-	 * please keep the common_on_n 1'b0 to set these blocks
-	 * remain powered.
-	 */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
-
-	/* waiting for the utmi_clk to become stable */
-	usleep_range(1500, 2000);
-
 	rport->suspended = false;
 	return 0;
 }
@@ -639,7 +653,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
 	if (ret)
 		return ret;
 

-- 
2.53.0


