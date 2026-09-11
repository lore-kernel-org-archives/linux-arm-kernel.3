Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D3CC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo4UnkSqgoVO/9dO8RXktdnvzNuezQiQb7CLxdoU1PY=; b=rMm7uVYRucpu1OYo7hIjsHDrxg
	6xDmVastLT1KsvZ9DDTPUBkQ5oN3pfnxE3W6mDeReWIMF9GRMZgzDyIauN30sQv/ggMAwcBxT3+JG
	y3v03mlPgpvSeWHx6N/GriSOtM2wgHQz//4yKPBtkiAf6UV8QGXP7IPhiT6XioffEL1kz4tULS50J
	jVtat31GEproOgn3FLf2T+0bA9SBaKO8/ZZLgJ1Dz24lJCYKBm5HkiXkFblMQOXXH6oFtKuyWh6ke
	D4VyYCR66Ez9ckGSgwqtz/w2zQXtjfDPRvxP+hadriIkZlx+wHMvlP5wOoXljIXTMRkrL9Fa/BSxZ
	Zu6Di/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yfV-0000000GPBW-0hmd;
	Fri, 11 Sep 2026 10:39:41 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yfR-0000000GPAk-48M8;
	Fri, 11 Sep 2026 10:39:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E7E641CF51;
	Fri, 11 Sep 2026 12:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789123172; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bo4UnkSqgoVO/9dO8RXktdnvzNuezQiQb7CLxdoU1PY=;
	b=Dv7zqhUz6Borsnk3CfuMnJEVlc/bFwo0tGSrdrKkg7BSnJ805GhQar8b2DXuspk5hW1iTm
	mYFeBGB4hxvR1tbn7sncbekHPLr2I6Vs4jrDP5o/IWVALciaLo7ORQZLPTGaFxOIv+2vQy
	n9nG1R0c95VYCAuarTPeNLYpnu3odRoXRn5MjigOvOLqRnYx/BPqgW5UJv/Exie9TwLbX/
	v/Gp75ZVc+ZKYew4HR4+tMzTyo7H5B6/I1ozx08r0BzKy+4ItXlNj2OBdLO0FFsJH2H0Zf
	EsxlSw1jMpBWgKmfYVwE8J/2Cg0fIJs/486hjq9PFPrjEsYUpgiJZgxyt2Wsxg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: [PATCH v2 net-next] net: phy: mediatek: support MT7530 PHYs on EN71221 MCM
Date: Fri, 11 Sep 2026 10:39:10 +0000
Message-Id: <20260911103910.4123567-1-cjd@cjdns.fr>
In-Reply-To: <20260909213250.3184238-1-cjd@cjdns.fr>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_033938_395803_17CD186E 
X-CRM114-Status: GOOD (  15.74  )
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

The EcoNet EN751221 multi-chip module implementation of the MT7530
requires some additional configuration of the PHYs on startup.
The reason for this is not known, but it is possible that it has
to do with the fact that the EN751221 MCM implementation of the
MT7530 runs at an abnormal PLL frequency (362.5Mhz).

Detect whether the MT7530 PHY is attached to the MDIO bus of an
EcoNet EN751221 switch and if so, apply the necessary register
updates. Additionally, never attempt to configure an MT7530
identified PHY which does not have gigabit support because the same
ID is used for another (FE) PHY.

Of note: MDIO_AN_EEE_ADV must be zero at startup or else link will
fail to connect. Setting MDIO_AN_EEE_ADV to 6 after link is brought
up will make EEE work when cable is next plugged in, but link fails
to downgrade to 100mb if gigabit is not possible, leaving a
"connected" (nonfunctional) gigabit link.

Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/mtk-ge.c | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72f9d9e..42b06c40d703 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -62,8 +63,68 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static bool mt7530_phy_is_en751221_companion(struct phy_device *phydev)
+{
+	struct device *parent = phydev->mdio.bus->parent;
+
+	return parent && parent->of_node &&
+	       of_device_is_compatible(parent->of_node, "econet,en751221");
+}
+
+/*
+ * The EcoNet reference implementation applies additional tuning to
+ * the PHYs of the multi-chip module MT7530.
+ */
+static int mt7530_phy_en751221_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_soft_reset(phydev);
+	if (ret)
+		return ret;
+
+	/* Clause 22 local data. */
+	ret = phy_write(phydev, MII_CTRL1000, 0x1e00);
+	if (ret < 0)
+		return ret;
+
+	ret = phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_1, 0x14, 0x3a04);
+	if (ret < 0)
+		return ret;
+
+	/* Clause 45 global/local data from mt7530GePhyCfgLoad(E3.0). */
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x0417, 0x7775);
+	if (ret < 0)
+		return ret;
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x00a6, 0x0350);
+	if (ret < 0)
+		return ret;
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0012, 0xd210);
+	if (ret < 0)
+		return ret;
+
+	/* Vendor profile disables 100/1000BASE-T EEE advertisement. */
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, 0x003c, 0x0000);
+	if (ret < 0)
+		return ret;
+
+	phydev_info(phydev, "EN751221 companion MT7530 E3.0 PHY profile loaded\n");
+
+	return 0;
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
+	int ret;
+
+	if (mt7530_phy_is_en751221_companion(phydev)) {
+		ret = mt7530_phy_en751221_config_init(phydev);
+		if (ret)
+			return ret;
+	}
+
 	mtk_gephy_config_init(phydev);
 
 	/* Increase post_update_timer */
-- 
2.39.5


