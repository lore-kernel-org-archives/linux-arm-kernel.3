Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7796EC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sI54x/ez5T6fsA2elcHz3RaGZcESZ5CGlXIm7sI1To0=; b=naz83wEttPZZLoz7IR5BkRunZm
	sFa5eCCm5jCaqRGFb1LPfV71pqb3VWWFQPJJ0dyHkOYHaTI5PWpbeiuRK2raK6YiJwCUpdHLJy3PU
	+gB2vfG8kQEF3uc/Kc3tIjXfZW7rM+ZAYUDleKW4/+Dvt1+tWaU3yDnvwiTlBFJItAQzA52o8t1QU
	Ol37Ygudm+OeepBiGEEgU/mbNGPuEjmJoz4HzB9kHz0kgNczFmuRqxFlyGJm0xfgwnpLeNlGbgHWY
	H6ZI17QCEfm7pgpd/2qVBbHK3ScoGgW1HjIUWzpoircPkJ5KglfGeF3inNWEFSMMNMLUi8trKLsqx
	vEkK2Hcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BoP-0000000BMlP-0JUU;
	Thu, 17 Sep 2026 13:06:01 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BoM-0000000BMjn-1RcY;
	Thu, 17 Sep 2026 13:05:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 211744BA1CE;
	Thu, 17 Sep 2026 15:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789650350; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sI54x/ez5T6fsA2elcHz3RaGZcESZ5CGlXIm7sI1To0=;
	b=dvdAoZxR7+zpdIT9didapD0CnUxXZbgsxzFNbc8GaOUiMocOHERVj+2HE+WHqLEaiBlq96
	4k2dImmfjZV4lOGTQzFOeDC1F3A5eBPZCveyRIeEOS5CdrlcXFub3etJTRd0BxO9YyXgrM
	tEY3g62eK+rDHUk5XgQZT+gc/dhzVWHNhZS5jNUPgm7HhY2L0XogJ5u1ygLlTENnq/Cq2y
	A2yQDHvUp0gjTdiYbvCHvMQI2PtRovIkkrbYUMNmimHwYnbz5iMxEGEVUZ9i8NfjgnZIlE
	R26Wzw5LaWNZodaXthaZq3gpGHKbpUFm2A43e3TK7yTp+3drllO6+izKcEgTkA==
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
Subject: [PATCH v6 net-next] net: phy: mediatek: support MT7530 PHYs on EN71221 MCM
Date: Thu, 17 Sep 2026 13:05:34 +0000
Message-Id: <20260917130534.297930-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_060558_749838_3AA29A97 
X-CRM114-Status: GOOD (  16.47  )
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
 drivers/net/phy/mediatek/mtk-ge.c | 81 ++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 96d8ac5154e5..62e3eff37b80 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -101,6 +102,69 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
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
+static bool mt7530_is_gphy(struct phy_device *phydev)
+{
+	return phydev->phy_id == MTK_GPHY_ID_MT7530 &&
+	       (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
+}
+
+static int mt7530_phy_match(struct phy_device *phydev,
+			    const struct phy_driver *phydrv)
+{
+	return mt7530_is_gphy(phydev) && !en751221_is_mcm_phy(phydev);
+}
+
+static int en751221_phy_match(struct phy_device *phydev,
+			      const struct phy_driver *phydrv)
+{
+	return mt7530_is_gphy(phydev) && en751221_is_mcm_phy(phydev);
+}
+
 static int mt7531_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -126,7 +190,6 @@ static int mt7531_phy_config_init(struct phy_device *phydev)
 
 static struct phy_driver mtk_gephy_driver[] = {
 	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
 		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
@@ -135,6 +198,22 @@ static struct phy_driver mtk_gephy_driver[] = {
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


