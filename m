Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2vfaOnFC7/1nB20cS53MVssmSMJc4X+W5RiRjOHV4U=; b=pFfgeHBR5r4UDwTmG2HQhFQAGg
	ZP5DGGQB7/0Ti4waTRKISrLjHjxFzWcKxQtJlqFFX3D+GduG4CZOprPreo6g9exvdDqeSkCaStI1g
	PpJVzeK14sj0g7J0IeBmY69fntqN8u1LsksLqcq2Zqg/A80dbdyrPHk4PiDSxBiRXSk4jVf0gPuNH
	3mqKOXcMnLFuoQveJEmmd9y4MbDTZD+PjQ7DDZsa8J9GQnkCHElPDgUPYBXjxAgaUlqWoUNfjnn5o
	lH0Dy780p/L8UdCAHfLPgSWhIGm3SE0PXCZI5q9Ve55Dzv7UhGUBkgZAgCndGDMm1cEA0AGavl5KX
	Rejen/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QWt-00000005wKi-3bP2;
	Tue, 15 Sep 2026 10:36:47 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QWr-00000005wJu-0o3B;
	Tue, 15 Sep 2026 10:36:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60FCA477DB6;
	Tue, 15 Sep 2026 12:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789468601; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=K2vfaOnFC7/1nB20cS53MVssmSMJc4X+W5RiRjOHV4U=;
	b=Jm3Jx9a6tYw3fTkcU6hTEPftfoIJK9sHuHZJ7rCc5E5UCLe296b3E4aja8sRYUIOiZi86A
	AIe+e0BgxtP57oUV95thz3/BAcCqks+Q7yVN5/PcihFn9WPJzUyNPfkALTMam0HW3eR/1D
	oeIxGrM33tEnX0PE0kGgGXL2ondBiiMin3qXXiv8DK+94Ff836IORKyOiJwcE5zXUUi7To
	km+WTfLFNBiZyEcsJrf1v001kqWUrzr8HQgU2pB6cUEe8qw8plo4xxpM55s0W3Dqza+Xp8
	mtpLH3XCcRko/SxQCg2hzBh9ZXjCbsQvj7ucR9W+rBOOEUl+eT9X7xst+AvVqQ==
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
Subject: [PATCH v4 net-next] net: phy: mediatek: support MT7530 PHYs on EN71221 MCM
Date: Tue, 15 Sep 2026 10:35:50 +0000
Message-Id: <20260915103550.79957-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033645_651139_8BDD3EDB 
X-CRM114-Status: GOOD (  15.66  )
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

Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/mtk-ge.c | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 96d8ac5154e5..07687b0aa59d 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -101,6 +102,65 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+/*
+ * The EcoNet EN751221 "G" multi-chip module MT7530 requires additional PHY
+ * configuration.
+ */
+static int en751221_mcm_phy_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_soft_reset(phydev);
+	if (ret)
+		return ret;
+
+	ret = phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_1,
+			      MTK_PHY_AUX_CTRL_AND_STATUS, 0x3a04);
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
+	return mt7530_phy_config_init(phydev);
+}
+
+static bool en751221_is_mcm_phy(struct phy_device *phydev)
+{
+	struct device *parent = phydev->mdio.bus->parent;
+
+	return parent && parent->of_node &&
+	       of_device_is_compatible(parent->of_node, "econet,en751221");
+}
+
+/*
+ * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
+ * does not advertise ESTATUS_1000_TFULL.
+ */
+static int mt7530_phy_match(struct phy_device *phydev,
+			    const struct phy_driver *phydrv)
+{
+	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&
+		!en751221_is_mcm_phy(phydev);
+}
+
+static int en751221_phy_match(struct phy_device *phydev,
+			      const struct phy_driver *phydrv)
+{
+	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&
+		en751221_is_mcm_phy(phydev);
+}
+
 static int mt7531_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -135,6 +195,23 @@ static struct phy_driver mtk_gephy_driver[] = {
 		 */
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.match_phy_device = mt7530_phy_match,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
+	},
+	{
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
+		.name		= "EcoNet EN751221 MCM PHY",
+		.probe		= mt7530_phy_probe,
+		.config_init	= en751221_mcm_phy_config_init,
+		/* Interrupts are handled by the switch, not the PHY
+		 * itself.
+		 */
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.match_phy_device = en751221_phy_match,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= mtk_phy_read_page,
-- 
2.39.5


