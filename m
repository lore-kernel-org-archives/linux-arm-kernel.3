Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EE7C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21vUyi7K+kEoEDI7cJRalDEdEnSV2omSUb/Jt0XHM9c=; b=D8bZkZqOS+mosJiptwy6nnz1pS
	jl2MhjxiJBVf1vXF1KSXlp+KPzCTdBkQX/LS22rFUemTxvRzLWFiQwRi94TpIkY2c3+4gFNTeA86w
	0qhCGLi6nFsgYODkuf/Bc7+ehV5JHEfxc5SQIIVvADwbX2TAnYVFLqfz3dwpIutIM3pM3qk9fSSBK
	W+XLD8Ocm5fb9o73YUlulzQvZ3SsIG4P9Kot5XhIgqT6MGQUpT3iP+QwFdqHkLmSdW4ab/qWHTcSS
	3iiTN3CDa7O2u8BZsMSKQ0FsPFoHzF9Yl+w/zCVDeZbIPNQVI0U8OpAJovoJZRaOpRkyBB/YQKPas
	7TgYcggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFO-00000007d6U-1hEA;
	Tue, 15 Sep 2026 17:47:10 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFI-00000007d52-3idX;
	Tue, 15 Sep 2026 17:47:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC6A748FE85;
	Tue, 15 Sep 2026 19:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789494422; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=21vUyi7K+kEoEDI7cJRalDEdEnSV2omSUb/Jt0XHM9c=;
	b=fRijTCb3AT5QBwGoe/Krb0ze6yISm2hsArZksSwu4Lzar3DR6TQS/8qMB5mn3uRh9U91Iw
	y1gbVDIk98jZLqFw5TBNM8rlEdorK4edEfPMlzQu6RWy8E9GbdqVArk/GJUHwYFDH75RXU
	JPyD5wKgxdiG0TGYGKvvH+4i24aBizdG4F2uf3OxnunxTDCBppIu8KFskwrJh/tBJ3e+hG
	ko5i/vIqw9knwdBVYfWBAK9JlvA5PwyRiWfdbZ5YQfabbVX8ZLvoV99ThTjm4XqlmR6rPH
	sAfGoTxiADsxgHMny749pQ0MeF4/0H2vQFGzk+7k1EwIjWCbnQAi9rfDqf8pWg==
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
Subject: [PATCH v2 net-next 1/7] net: dsa: mt7530: get ctrl phy addr using a function
Date: Tue, 15 Sep 2026 17:46:37 +0000
Message-Id: <20260915174643.253660-2-cjd@cjdns.fr>
In-Reply-To: <20260915174643.253660-1-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_104707_756077_6DC32392 
X-CRM114-Status: GOOD (  16.39  )
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
index 14692497e1a6..54d931002bc1 100644
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
@@ -2674,8 +2679,11 @@ mt7531_setup(struct dsa_switch *ds)
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
@@ -2743,25 +2751,21 @@ mt7531_setup(struct dsa_switch *ds)
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


