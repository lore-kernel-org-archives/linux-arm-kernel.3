Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NHim9kvMApMuV/SoKqhnDQUAViWnujC4QS+pREWznH4=; b=nJanCNIW40aHmB0MRzKFMZwc50
	Lu6bk7gZKxUYIjqmaTrvIN3N/4Q5gsKu5bXS4+XIgtxqs1a0r6fmLasyUQ5v84BlOhry8XtVcdqLn
	yrj85k6EwQHTM+NWnIO5ouH3U5kKqz928yG9mWwJ/UeMIN9OqtCvpVeeOccVT2XA/LEkORlKh5u1v
	Gu19DHyuO9+QOU+cnELBM5JiUGK/t3GYvsL6juOu6dPGos5Zl6UAsIRc2MmpQmXbwktIphp7greMB
	+czJAGRavXp5/7av5DFIApm9GitwoYMsh7IS02Kr3mUdiXtxJi7VyyQmIXjI9USKGnHpJaxNe/mSi
	o9MLzrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJo5-0000000E4I1-2Cha;
	Wed, 10 Sep 2025 12:20:13 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJo2-0000000E4Fq-1MYy;
	Wed, 10 Sep 2025 12:20:12 +0000
Received: from localhost.localdomain (unknown [119.122.213.26])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2258dbfa4;
	Wed, 10 Sep 2025 20:20:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] phy: rockchip: naneng-combphy: use existing DT property check for rk3528
Date: Wed, 10 Sep 2025 20:20:00 +0800
Message-Id: <20250910122000.951100-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9933919ce703a2kunm0b30bd90142f2c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxOVh9DTE5JT0xJSBhNQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJTVlXWRYaDxIVHRRZQVlPS0hVSktIS0pITVVKS0tVS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_052010_556361_4ED96D8C 
X-CRM114-Status: GOOD (  10.02  )
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

The naneng-combphy driver already has DT property checks for
"rockchip,enable-ssc" and "rockchip,ext-refclk", use it for
the rk3528_combphy_cfg. Also aligned the indentation of the
rk3528_combphy_grfcfgs parameters (using tabs).

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index a3ef19807b9e..ad6c8a11951b 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -518,7 +518,7 @@ static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
 		return -EINVAL;
 	}
 
-	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
+	if (priv->ext_refclk) {
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
 
 		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
@@ -543,11 +543,9 @@ static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
 		}
 	}
 
-	if (priv->type == PHY_TYPE_PCIE) {
-		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
-			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
-						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
-	}
+	if (priv->type == PHY_TYPE_PCIE && priv->enable_ssc)
+		rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
+					 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
 
 	return 0;
 }
@@ -571,7 +569,7 @@ static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
 	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
 	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
 	/* pipe-grf */
-	.u3otg0_port_en         = { 0x0044, 15, 0, 0x0181, 0x1100 },
+	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },
 };
 
 static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
-- 
2.25.1


