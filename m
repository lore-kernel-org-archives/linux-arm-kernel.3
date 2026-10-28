Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA3F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g2ryL7kg;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=sitUNFJm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qJKVlLd/OcgZk2RoyMDgtiW2rfsi11YQ8snNobdXGYo=; b=g2ryL7kgF768Co
	Pb+AgReETjVH7Aph1DrM6mFp+mWKdx163KIWoQfqECY2U7F1tjAqbAN2m8X25oOIj0N4QiNWWfijj
	wEfd8M5DN1NMPyjllnC02EFmDLbhAeCQBxlLGSHBFU8Qm+D1G0MsDeWwrVAhLy0roYVciZgwcmdEj
	KRvslKkc3lhrCmCf3/xV5/ev6mQh2DQIp92cD+kbjWaJc2+KKR+g+72Wy/mQBwNHV3mgKLyflYmmn
	J/5hPPs7bDuKXQcW5TQolW23LcgXHBNqRneY5wq1hvqcgcL0HNftVgB3l7bgRELhix//3mB06oVnI
	arEA/EUJyI0eug3fTLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEe-000000060uU-1uCu;
	Wed, 28 Oct 2026 01:13:48 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEb-000000060tL-0FLr;
	Wed, 28 Oct 2026 01:13:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84269148FAA;
	Wed, 28 Oct 2026 02:13:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793150022; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qJKVlLd/OcgZk2RoyMDgtiW2rfsi11YQ8snNobdXGYo=;
	b=sitUNFJmOlDK6AVGTJuRYgFOj6IDlay8qo63HPvV3G7w5ARCfLYVUPY6Ee3RnGHXnQqGUt
	Gch562XLHHuD+UFdlB07PCVtmyz8/L98uwqmnmhVjDFv+JezKi25TLgyhm0gjIXGxDvigN
	nffo3g4dVHsrGIYpb1W4IaUC7r+qwnpMUVLODjkZIGyZWLSCxoPut6Y+FXD8spKKyC3Qpp
	jJ98CCg0lgFpzB+6jMlS5LpbXUu9wITl5bxN3kNK7k4bdu9q+WOmlVQHtM+HWQ4B3zDWCG
	DOjiL5kzNz+obEfKmEepZ4spYi6h4OUV38WRxSDE0XKtfNcUAQND4GysE8Q0Ig==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 1/7] net: dsa: mt7530: get ctrl phy addr using a function
Date: Wed, 28 Oct 2026 01:13:11 +0000
Message-Id: <20261028011317.1557238-2-cjd@cjdns.fr>
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181345_488587_C6E3E898 
X-CRM114-Status: GOOD (  17.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS,T_SPF_HELO_TEMPERROR autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MDIO MT7530 has 5 integrated PHYs, of these, the first PHY has
the additional registers that are used for such things as configuring
the clock configuration for the switch. The switch is typically on
MDIO address 31 and the PHYs are 0, 1, 2, 3, and 4 with 0 being the
special one. So taking the address of mdiodev (the switch) add 1 and
modulo 31 finds the first PHY.

However there are a number of MMIO based implementations of MT7530
and on these, mdiodev is NULL though they often still have a control
PHY for the purpose. Move MT753X_CTRL_PHY_ADDR to a function which
handles the NULL condition somewhat more gracefully and allows a
place for MMIO implementations to add special case handling to
provide their control PHY address.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530.c | 54 +++++++++++++++++++++-------------------
 drivers/net/dsa/mt7530.h |  2 --
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4e6f..d10194488bde 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -46,6 +46,16 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, MT7530_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
 };
 
+static int
+mt753x_ctrl_phy_addr(struct mt7530_priv *priv)
+{
+	if (WARN_ON_ONCE(!priv->mdiodev))
+		return 0;
+
+	/* Default is 1st PHY */
+	return (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1);
+}
+
 static void
 mt7530_mutex_lock(struct mt7530_priv *priv)
 {
@@ -63,32 +73,30 @@ mt7530_mutex_unlock(struct mt7530_priv *priv)
 static void
 core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
+	int ctl_phy = mt753x_ctrl_phy_addr(priv);
 	struct mii_bus *bus = priv->bus;
 	int ret;
 
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_CTRL, MDIO_MMD_VEND2);
+	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, reg);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+	ret = bus->write(bus, ctl_phy,
 			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Write the data into MMD's selected register */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, val);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, val);
 err:
 	if (ret < 0)
 		dev_err(&bus->dev, "failed to write mmd register\n");
@@ -99,6 +107,7 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 static void
 core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 {
+	int ctl_phy = mt753x_ctrl_phy_addr(priv);
 	struct mii_bus *bus = priv->bus;
 	u32 val;
 	int ret;
@@ -106,26 +115,23 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_CTRL, MDIO_MMD_VEND2);
+	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, reg);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+	ret = bus->write(bus, ctl_phy,
 			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Read the content of the MMD's selected register */
-	ret = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			MII_MMD_DATA);
+	ret = bus->read(bus, ctl_phy, MII_MMD_DATA);
 	if (ret < 0)
 		goto err;
 	val = ret;
@@ -133,8 +139,7 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	val &= ~mask;
 	val |= set;
 	/* Write the data into MMD's selected register */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, val);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, val);
 err:
 	if (ret < 0)
 		dev_err(&bus->dev, "failed to write mmd register\n");
@@ -2668,8 +2673,11 @@ mt7531_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 val, id;
+	int ctl_phy;
 	int ret, i;
 
+	ctl_phy = mt753x_ctrl_phy_addr(priv);
+
 	/* Reset whole chip through gpio pin or memory-mapped registers for
 	 * different type of hardware
 	 */
@@ -2737,25 +2745,21 @@ mt7531_setup(struct dsa_switch *ds)
 	 * phy_[read,write]_mmd_indirect is called, we provide our own
 	 * mt7531_ind_mmd_phy_[read,write] to complete this function.
 	 */
-	ret = mt7531_ind_c45_phy_read(priv,
-				      MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-				      MDIO_MMD_VEND2, CORE_PLL_GROUP4);
+	ret = mt7531_ind_c45_phy_read(priv, ctl_phy, MDIO_MMD_VEND2,
+				      CORE_PLL_GROUP4);
 	if (ret < 0)
 		return ret;
 
 	val = ret;
 	val |= MT7531_RG_SYSPLL_DMY2 | MT7531_PHY_PLL_BYPASS_MODE;
 	val &= ~MT7531_PHY_PLL_OFF;
-	ret = mt7531_ind_c45_phy_write(priv,
-				       MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-				       MDIO_MMD_VEND2, CORE_PLL_GROUP4, val);
+	ret = mt7531_ind_c45_phy_write(priv, ctl_phy, MDIO_MMD_VEND2,
+				       CORE_PLL_GROUP4, val);
 	if (ret < 0)
 		return ret;
 
 	/* Disable EEE advertisement on the switch PHYs. */
-	for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
-	     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
-	     i++) {
+	for (i = ctl_phy; i < ctl_phy + MT7530_NUM_PHYS; i++) {
 		mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
 					 0);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 2bbbe617b52e..3dabbc99fbbc 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -747,8 +747,6 @@ enum mt7531_xtal_fsel {
 #define  MT7531_PHY_PLL_OFF		BIT(5)
 #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
 
-#define MT753X_CTRL_PHY_ADDR(addr)	(((addr) + 1) & (PHY_MAX_ADDR - 1))
-
 #define CORE_PLL_GROUP5			0x404
 #define  RG_LCDDS_PCW_NCPO1_MASK	GENMASK(15, 0)
 #define  RG_LCDDS_PCW_NCPO1(x)		FIELD_PREP(RG_LCDDS_PCW_NCPO1_MASK, x)
-- 
2.39.5


