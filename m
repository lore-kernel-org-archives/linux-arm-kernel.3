Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D217CC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/qlTnUfYfGp2JdX/hItZG5Gee2j7Ew0nxnFZ6sxuQ4=; b=J7Twb9SO4tvfUMGVcLYLVFvdZj
	AjEj4WBSL1B+5T52LLi/2gZ2dcUIkWuzY2lbc5BUCnxTWYctTyNsZu7gm5Ee6tK3iJ/xwZF/iMHad
	mtPdzT8P7Y8bKB3p0Acb1ZuK8jTH84s9M/LfnApFSDUiSp7lTEA9trXpOPYpTmcNB2DhcrxgvThME
	ml05lDS/PzeHjlSTBQY9+rICghk2ErYEoOF7wZqhg1XnTOBkOvTLS+Z4A7f0Mn/o8ddlf6b3HQVA8
	V6xgnHTgut5z7BSMqBSeKNDQb6k9me+YxYFC39Txw7+TL7SP/SgxZR/zmByPy6E+JK3pLTmKFlRv6
	WUysNjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Puu-0000000CtQS-2ZJ2;
	Wed, 09 Sep 2026 21:33:16 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pur-0000000CtPf-1bC5;
	Wed, 09 Sep 2026 21:33:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D76408E9C;
	Wed,  9 Sep 2026 23:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788989589; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=V/qlTnUfYfGp2JdX/hItZG5Gee2j7Ew0nxnFZ6sxuQ4=;
	b=njbNHfNmVsDqxX50TMx4/HC1qNAlT73XFtEcqOCX+5q5vZN+umf7CVN2biX8IYFOq7QTmY
	fPkiBhd8WynUvTvHrd6efRjK5N+Sbtaq3XTkjYOXX4bRr+V+rrGdh2n3VYzYoTocINjWgP
	BUSJT38c1rt9hxPDekC0tPn0FXUgC0wVkrmbTKOSEKUlQl+99LgczV5aZ8HSQCQ6MRWsI6
	jV0SE3HZ46FstACiVBZMtrnt+7jaX8iFk3285cZlcxT1VLES+IOAZBS0L1gwEcCIbPrK+J
	lGsgQe3MsVoKmGLIcoRwV/9P5TGvDVOFmtUNhunF4QUD9PNjrQyvyE4nZSn4kA==
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
Subject: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on EN71221 MCM
Date: Wed,  9 Sep 2026 21:32:50 +0000
Message-Id: <20260909213250.3184238-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_143313_665126_0E32D0AF 
X-CRM114-Status: GOOD (  12.52  )
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
updates.

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


