Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43290E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG+EJlNXnjJ7JDFMF/sVSoAk1vTuv5u6deD2bDMNcE4=; b=EpAOU8E1t05dJmVnDQDtu2DmM/
	Crfwy5j8+qdm5BzKQvC6/1wfY4KhbqFGBUHAPjqe2nvj2G0QZLb0+0ZcZO+HjHzXK1T4zZ0RnlX2U
	KzseWJLDGJWp/E4P4aqI1qbBnepba4zpdsOFcJ2I5q5K7w0P+Gu0+k9ehHeJObAkhhzGp/UoQjzGZ
	UB0LtEiqVzhsboh1UWYlp1rk1+accCwSc9ZJKpCgELdDkYwAIF1AZRRTpWAH6xShROz1pybAItrKO
	bG34evPm8XkjUoy7Q2qmhqVoUlMkxlkcti6pblG6uj+VKwaLYTAEqFI3GHDKO0PfBubTWJzil00/w
	g/ifWiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjwV-00000000mfs-1RlL;
	Mon, 06 Jan 2025 10:02:39 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUju7-00000000m0x-3vNa;
	Mon, 06 Jan 2025 10:00:13 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c05:ad20::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7d57e693;
	Mon, 6 Jan 2025 18:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
Date: Mon,  6 Jan 2025 18:00:01 +0800
Message-Id: <20250106100001.1344418-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx1OVktDTRlCTU4ZGEseGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtOQRofSUtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a943b0eb88503a2kunm7d57e693
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pzo6Nyo*ETIONR8*HgFKHzxC
	GChPCSJVSlVKTEhNSk5MTUtDQ01CVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS05BGh9JS0FBSllXWQgBWUFKSU1ONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_020012_159354_11BB8482 
X-CRM114-Status: GOOD (  10.55  )
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

The device tree of RK3568 did not specify reset-names before.
So add fallback to old behaviour to be compatible with old DT.

Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index a1532ef8bbe9..8c3ce57f8915 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
-	priv->phy_rst = devm_reset_control_get(dev, "phy");
+	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
+	/* fallback to old behaviour */
+	if (PTR_ERR(priv->phy_rst) == -ENOENT)
+		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->phy_rst))
 		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
 
-- 
2.25.1


