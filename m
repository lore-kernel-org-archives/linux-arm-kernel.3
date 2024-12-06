Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F49E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ggFYVlAtBTFNftEAEPFIPikrXepmvCLQdo7YJGuXuk=; b=tn0E+jp89JVOXznugRZDZMg6W7
	NmVDQE2H616XiSDx4W7+6hCOiYQAkYtK5oD8Emxp457h1eykpoxbyGn80dkhvs49qv0eLTF2KcXyk
	mos3FJGx8DUy3+6+jJxrXhg1vkvTvxQ2HEubPvpKHDKK20ezFwkdzC+3vum3HBHepNU8RmINlCaC9
	yamObnd2el2fCJIyIt//jXIj7OZhcf+9C/MUCYvtgPJUH2fAk3FgEr3bR0MYv5zElJX7GhnFCUPkJ
	tDIxyRXeck5R5be1bMhtO55JrqOtvkOJMR4MWYDLo/R5zB0ORYgPNpodRfLWmQFgU1BHYfGxvNqlC
	bUxTRJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgUb-00000002rQ9-2E73;
	Fri, 06 Dec 2024 22:08:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgQa-00000002qhI-3lDo;
	Fri, 06 Dec 2024 22:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733522639;
	bh=BtZlCg7zrnpqKFSnMbzeaKu5nXKTQv2xjkndYTOjR+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mdyMa7vKYn4H1ynchfOGmmeWUN0Qiylma9FHLI1kmvthIqklX9UqmkctFQYWvXkwg
	 bgj9MYg9s+TBvmpedEL9FUXLZny7p1hOkdytDkOy0gbnkb02cPtX78nFO/DF8B0Vkf
	 PdkzNFQaVrgnOAv7B7CC9/U+kHbuHutVs+8gxrJOsCMbVzAZlQkr98/x4OdtlcXpPP
	 OfpD6CG7UboyXk/0WEQ7/3Dt3Wj2jpcPUsyX37SL0xrk0N4y27SMyj6cN2KyEKVUhJ
	 zEfnAW36dpbb2ihKd3+mMkHTruTumi4CXC79ycBDV4GrrXyG8QJosvAtXcriN3jCQ1
	 Q8V3g9bB95aZw==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA7B817E380B;
	Fri,  6 Dec 2024 23:03:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 07 Dec 2024 00:03:43 +0200
Subject: [PATCH 3/4] phy: rockchip: samsung-hdptx: Setup TMDS char rate via
 phy_configure_opts_hdmi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241207-phy-sam-hdptx-bpc-v1-3-03c2e4d6d797@collabora.com>
References: <20241207-phy-sam-hdptx-bpc-v1-0-03c2e4d6d797@collabora.com>
In-Reply-To: <20241207-phy-sam-hdptx-bpc-v1-0-03c2e4d6d797@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_140401_085318_F8A6EAB3 
X-CRM114-Status: GOOD (  14.24  )
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

The current workaround to setup the TMDS character rate relies on the
unconventional usage of phy_set_bus_width().

Make use of the recently introduced HDMI PHY configuration API for this
purpose.  The workaround will be dropped as soon as the switch has been
completed on both ends.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 42 ++++++++++++++++++-----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index ceab9c71d3b53ae0b746a10c081fcfaa7d5c5ae7..eeadebdc476caa87aebbbd82f7102b62b22a0ea6 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -273,6 +273,7 @@ struct rk_hdptx_phy {
 	struct clk_bulk_data *clks;
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
+	unsigned long tmds_char_rate;
 
 	/* clk provider */
 	struct clk_hw hw;
@@ -902,18 +903,20 @@ static int rk_hdptx_phy_consumer_put(struct rk_hdptx_phy *hdptx, bool force)
 static int rk_hdptx_phy_power_on(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
-	int bus_width = phy_get_bus_width(hdptx->phy);
+	unsigned int rate = hdptx->tmds_char_rate / 100;
 	int ret;
 
-	/*
-	 * FIXME: Temporary workaround to pass pixel_clk_rate
-	 * from the HDMI bridge driver until phy_configure_opts_hdmi
-	 * becomes available in the PHY API.
-	 */
-	unsigned int rate = bus_width & 0xfffffff;
+	if (rate == 0) {
+		/*
+		 * FIXME: Temporary workaround to setup TMDS char rate
+		 * from the RK HDMI bridge driver.
+		 * Will be removed as soon the switch to the HDMI PHY
+		 * configuration API has been completed on both ends.
+		 */
+		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+	}
 
-	dev_dbg(hdptx->dev, "%s bus_width=%x rate=%u\n",
-		__func__, bus_width, rate);
+	dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
 
 	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
 	if (ret)
@@ -933,9 +936,20 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
 	return rk_hdptx_phy_consumer_put(hdptx, false);
 }
 
+static int rk_hdptx_phy_configure(struct phy *phy,
+				  union phy_configure_opts *opts)
+{
+	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
+
+	hdptx->tmds_char_rate = opts->hdmi.tmds_char_rate;
+
+	return 0;
+}
+
 static const struct phy_ops rk_hdptx_phy_ops = {
 	.power_on  = rk_hdptx_phy_power_on,
 	.power_off = rk_hdptx_phy_power_off,
+	.configure = rk_hdptx_phy_configure,
 	.owner	   = THIS_MODULE,
 };
 
@@ -991,6 +1005,16 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
+	/*
+	 * The TMDS char rate set via phy_configure(), if any, has
+	 * precedence over the rate provided via clk_set_rate().
+	 */
+	if (hdptx->tmds_char_rate && hdptx->tmds_char_rate != rate) {
+		dev_dbg(hdptx->dev, "Replaced clk_set_rate=%lu with tmds_char_rate=%lu\n",
+			rate, hdptx->tmds_char_rate);
+		rate = hdptx->tmds_char_rate;
+	}
+
 	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
 }
 

-- 
2.47.0


