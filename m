Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB1DC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 04:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkSZGNAKERLw0r4rm5+mRvEPG1N+dAz2Bpo8RU1VFZk=; b=HWSXjBzIc61sRgCwjFou6u2Pdl
	5juYrA/KUeHRyDXjN9kEgwrDpzcx7Wudlm4GyxpjXCCviLbwucVFuwsiBP7h0NSbZK7fTw0+j5x23
	FCBVtHeJEiuL/RiUC4f0MPG49a+LtEERBPuCj8s4vUiU6b/wQsbgHniorDKNyAFz6I4/avGpUkw9F
	Xkgh18hi1upb4zU2ZOyX3P9JtoXvkxnaFfdxaVfJgFDeRtlm7xwfD/g4HvJn2+kXyvKQxiWU4ZyKZ
	V14+HN+q08Pz5R+K7qdEFglwFPn7llaAWw59s0NxtMG5ro4CpFH9orJPZti2Olv3eiozApZuD6S/A
	bem4XXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZo4-00000004Paf-0OCG;
	Tue, 28 Jul 2026 04:52:44 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZny-00000004PX7-0p04;
	Tue, 28 Jul 2026 04:52:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1woZns-000000004xS-1W8y;
	Tue, 28 Jul 2026 04:52:32 +0000
Date: Tue, 28 Jul 2026 05:52:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 3/3] net: dsa: mt7530: error out on failed reads in
 MT7531 PHY polling
Message-ID: <79e85d68d210cc37342978171aa6432aa2954333.1785213071.git.daniel@makrotopia.org>
References: <cover.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_215238_245118_CF7745D0 
X-CRM114-Status: GOOD (  11.62  )
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

The MT7531 indirect PHY access functions poll MT7531_PHY_IAC through
a helper which returns 0 when the underlying read fails, so a failed
bus transaction clears MT7531_PHY_ACS_ST and the access carries on,
returning garbage PHY register data to phylib.

Poll using regmap_read_poll_timeout(), which stops on read errors and
propagates them. These functions hold the MDIO bus lock across the
whole sequence, so the unlocked regmap accesses remain correct. Remove
the now-unused _mt7530_unlocked_read().

Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 58 ++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 51555060b5eb..55131bfd11f6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -191,12 +191,6 @@ mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 	mt7530_mutex_unlock(priv);
 }
 
-static u32
-_mt7530_unlocked_read(struct mt7530_dummy_poll *p)
-{
-	return mt7530_mii_read(p->priv, p->reg);
-}
-
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
@@ -553,16 +547,13 @@ static int
 mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 			int regnum)
 {
-	struct mt7530_dummy_poll p;
 	u32 reg, val;
 	int ret;
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-
 	mt7530_mutex_lock(priv);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -572,8 +563,8 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 	      MT7531_MDIO_DEV_ADDR(devad) | regnum;
 	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -583,8 +574,8 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 	      MT7531_MDIO_DEV_ADDR(devad);
 	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -601,16 +592,13 @@ static int
 mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 			 int regnum, u16 data)
 {
-	struct mt7530_dummy_poll p;
 	u32 val, reg;
 	int ret;
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-
 	mt7530_mutex_lock(priv);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -620,8 +608,8 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	      MT7531_MDIO_DEV_ADDR(devad) | regnum;
 	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -631,8 +619,8 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	      MT7531_MDIO_DEV_ADDR(devad) | data;
 	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -647,16 +635,13 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 static int
 mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 {
-	struct mt7530_dummy_poll p;
 	int ret;
 	u32 val;
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-
 	mt7530_mutex_lock(priv);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -667,8 +652,8 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	mt7530_mii_write(priv, MT7531_PHY_IAC, val | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
-				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, val,
+				       !(val & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -685,16 +670,13 @@ static int
 mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 			 u16 data)
 {
-	struct mt7530_dummy_poll p;
 	int ret;
 	u32 reg;
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-
 	mt7530_mutex_lock(priv);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
-				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, reg,
+				       !(reg & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
@@ -705,8 +687,8 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 
 	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | MT7531_PHY_ACS_ST);
 
-	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
-				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT7531_PHY_IAC, reg,
+				       !(reg & MT7531_PHY_ACS_ST), 20, 100000);
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		goto out;
-- 
2.55.0

