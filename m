Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A167E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PigfzsEfrcewOd46pQstW72tp64qufuYB66L5+CFhk=; b=CxmBATl3nS+XrXInM0UUwvaIrR
	TEANqgucEwKdO0YT0CBY+gJ8zcr7YOXLDjFp+gIeoddwis0O/Vf6/ihtksVYUmLURKcXcktzKfjCN
	jdiHq042a2rDzdA9Y+XoQ1NlGTPHfQQS+ZfZ4fKSEC2L6iYRSy734jT3kSKMFHnU502Qm3sm4+w2y
	ruv45oN7aFEwrGnAthz+DK8H4z5/u+nnZbSXei6zo8kvuhCsDxXk620gm9Yujt/l3NTjTbCluZzyU
	4RjxM7n3s7p4c2cnDuoDIAwA9fZx8GLdDY+Qb2iI285xsYZxBhrMov9nVJFw5XVm8SAC49byj+fRz
	AI5jOxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpW2-00000001l3w-17DB;
	Thu, 12 Dec 2024 20:10:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPk-00000001jjF-1R3V;
	Thu, 12 Dec 2024 20:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033838;
	bh=hKOtzEz0yS1DTlvWFo1dHi6pZi36HD1vcv4F1b6/OjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EyGp6yeyKvATJ4oEhqSLIay1oIe/R5dnuayt0prc1Xq35iv2v0+ZMgvYzA4yyeh4t
	 snUN0u1+3UwfmaEcYXzZrJ6avCbwnl7VJx5OtzFxx8PJBQc/owwwOUM1hUolsHOeTC
	 viGicSlhNPUB8hooUIITNHYWTCJ/9N/tsstAMjj52st1zSI/uEkVbacMBnJaFsxkYO
	 aNMdNKbVS0eg6ciuQSarI3/R2r9KJLMuOGlnfQf091SclCr7CqnEFWPcA1xy6conk9
	 6zA8aEGBADJF8rsmoc8AgiZtGQ9KpVCbDy7thwT8ZGFQHBPzliTNaxJQ7o+Nd0e1A3
	 LAQlkmxyUgv4g==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74BDD17E3801;
	Thu, 12 Dec 2024 21:03:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:36 +0200
Subject: [PATCH v2 5/8] phy: rockchip: samsung-hdptx: Setup TMDS char rate
 via phy_configure_opts_hdmi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-5-57e672c7c7c4@collabora.com>
References: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
In-Reply-To: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_120400_528565_CE39E079 
X-CRM114-Status: GOOD (  15.02  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 44 ++++++++++++++++++-----
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 1f5b7ffc0c5c47def33c93736bb1bd1491cd59d0..bf0c7d74e70b9204c97c571e08cb0c140131acb9 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -244,6 +244,9 @@ struct rk_hdptx_phy {
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
 
+	/* PHY config opts */
+	unsigned long tmds_char_rate;
+
 	/* clk provider */
 	struct clk_hw hw;
 	unsigned long rate;
@@ -872,18 +875,20 @@ static int rk_hdptx_phy_consumer_put(struct rk_hdptx_phy *hdptx, bool force)
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
@@ -903,9 +908,20 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
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
 
@@ -961,6 +977,16 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
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


