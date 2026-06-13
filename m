Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9ABCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 01:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZD6856zHzg43YYyFDVLOmRJEsQfZtbvcTANuAXKZI/w=; b=NQr+90gAYQDc3TYn5V81Luwt01
	jh7GNuFqVVlXS4j92Re05FbQ4GZ3Ij4A1JbwT43te2Dm2CyFvxkgt/XizmHnb2DmhKoUBBkXlXMEQ
	SUrFMpygX/kd1GIwJNQOiESg58UpTiYkIlA0rIbF2X9cpUpW0Sn3VOEN4Y74qN62ZvjgssUpWpZXn
	9D0c5epH8fSPvb0aoIlwfiz1iwrSe3UKnhaKidrlnaHHyJhPkkKk5CiLCwwHc0bshzlgvfHcscj4z
	+Agy0R/efD9xgRflsdJnRvdWAFE3r5EphpLN2Qj615V8O/ECs/XZtENMWemhxosACEA1DjBjB6QD6
	KiN3MCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCu4-0000000Bs1H-3kBP;
	Sat, 13 Jun 2026 01:11:16 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCu0-0000000Bry5-2ahN;
	Sat, 13 Jun 2026 01:11:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYCtv-000000007Jk-11lX;
	Sat, 13 Jun 2026 01:11:07 +0000
Date: Sat, 13 Jun 2026 02:11:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 2/8] net: dsa: mt7530: fold mt7530_mii_write/read
 into mt7530_write/read
Message-ID: <f28efe1c9a7f2fe2ef1523f4f278d58e674666b7.1781312667.git.daniel@makrotopia.org>
References: <cover.1781312667.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781312667.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_181113_200206_A9917135 
X-CRM114-Status: GOOD (  11.68  )
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

With the lock wrappers removed in the previous commit, mt7530_write()
was a trivial wrapper around mt7530_mii_write(), and mt7530_read()
around mt7530_mii_read() via _mt7530_read(). Fold the function bodies
and eliminate the intermediate functions.

The _mt7530_unlocked_read() and _mt7530_read() poll helpers, which
existed as locked/unlocked variants for readx_poll_timeout(), are
consolidated into a single mt7530_mii_poll() that calls mt7530_read().

Callers are updated using the following semantic patch:

@@
expression E1, E2, E3;
@@
-mt7530_mii_write(E1, E2, E3)
+mt7530_write(E1, E2, E3)

@@
expression E1, E2;
@@
-mt7530_mii_read(E1, E2)
+mt7530_read(E1, E2)

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 drivers/net/dsa/mt7530.c | 78 ++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 51 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5f56a423b147..9ccc848195cf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -150,22 +150,19 @@ core_clear(struct mt7530_priv *priv, u32 reg, u32 val)
 	core_rmw(priv, reg, val, 0);
 }
 
-static int
-mt7530_mii_write(struct mt7530_priv *priv, u32 reg, u32 val)
+static void
+mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
 	int ret;
 
 	ret = regmap_write(priv->regmap, reg, val);
-
 	if (ret < 0)
 		dev_err(priv->dev,
 			"failed to write mt7530 register\n");
-
-	return ret;
 }
 
 static u32
-mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
+mt7530_read(struct mt7530_priv *priv, u32 reg)
 {
 	int ret;
 	u32 val;
@@ -181,31 +178,10 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 	return val;
 }
 
-static void
-mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
-{
-	mt7530_mii_write(priv, reg, val);
-}
-
 static u32
-_mt7530_unlocked_read(struct mt7530_dummy_poll *p)
+mt7530_mii_poll(struct mt7530_dummy_poll *p)
 {
-	return mt7530_mii_read(p->priv, p->reg);
-}
-
-static u32
-_mt7530_read(struct mt7530_dummy_poll *p)
-{
-	return mt7530_mii_read(p->priv, p->reg);
-}
-
-static u32
-mt7530_read(struct mt7530_priv *priv, u32 reg)
-{
-	struct mt7530_dummy_poll p;
-
-	INIT_MT7530_DUMMY_POLL(&p, priv, reg);
-	return _mt7530_read(&p);
+	return mt7530_read(p->priv, p->reg);
 }
 
 static void
@@ -239,7 +215,7 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 	mt7530_write(priv, MT7530_ATC, val);
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_ATC);
-	ret = readx_poll_timeout(_mt7530_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & ATC_BUSY), 20, 20000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
@@ -541,7 +517,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	mutex_lock(&priv->reg_mutex);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -550,9 +526,9 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	reg = MT7531_MDIO_CL45_ADDR | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_DEV_ADDR(devad) | regnum;
-	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -561,9 +537,9 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	reg = MT7531_MDIO_CL45_READ | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_DEV_ADDR(devad);
-	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -589,7 +565,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 
 	mutex_lock(&priv->reg_mutex);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -598,9 +574,9 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 
 	reg = MT7531_MDIO_CL45_ADDR | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_DEV_ADDR(devad) | regnum;
-	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -609,9 +585,9 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 
 	reg = MT7531_MDIO_CL45_WRITE | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_DEV_ADDR(devad) | data;
-	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -635,7 +611,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	mutex_lock(&priv->reg_mutex);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -645,9 +621,9 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 	val = MT7531_MDIO_CL22_READ | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_REG_ADDR(regnum);
 
-	mt7530_mii_write(priv, MT7531_PHY_IAC, val | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, val | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -673,7 +649,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 
 	mutex_lock(&priv->reg_mutex);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, reg,
 				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -683,9 +659,9 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	reg = MT7531_MDIO_CL22_WRITE | MT7531_MDIO_PHY_ADDR(port) |
 	      MT7531_MDIO_REG_ADDR(regnum) | data;
 
-	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
+	mt7530_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, reg,
 				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -1428,7 +1404,7 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	val = mt7530_mii_read(priv, MT7530_GMACCR);
+	val = mt7530_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
 
 	/* RX length also includes Ethernet header, MTK tag, and FCS length */
@@ -1445,7 +1421,7 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 		val |= MAX_RX_PKT_LEN_JUMBO;
 	}
 
-	mt7530_mii_write(priv, MT7530_GMACCR, val);
+	mt7530_write(priv, MT7530_GMACCR, val);
 
 	return 0;
 }
@@ -1614,7 +1590,7 @@ mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
 	mt7530_write(priv, MT7530_VTCR, val);
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_VTCR);
-	ret = readx_poll_timeout(_mt7530_read, &p, val,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
 				 !(val & VTCR_BUSY), 20, 20000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
@@ -2465,7 +2441,7 @@ mt7530_setup(struct dsa_switch *ds)
 
 	/* Waiting for MT7530 got to stable */
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT753X_TRAP);
-	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val, val != 0,
 				 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
@@ -2706,7 +2682,7 @@ mt7531_setup(struct dsa_switch *ds)
 
 	/* Waiting for MT7530 got to stable */
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT753X_TRAP);
-	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val, val != 0,
 				 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
-- 
2.54.0

