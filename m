Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A214FC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 04:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyHL1M+FyUFACebIlEgp1TCU21fxnyJgg6ZicQjKCjM=; b=hZ9r+dWxy7I8n2rbR8wfNBk5Mw
	Jf9UjDn+OITnaR5CUXgK0M3dThVh/wUvo+Euugst0wS44Z9+XIwWGhcaXSBQeMheDmL2IFLroStLu
	rKZb41dW9EO6Eh+FVeb6HDDZ1yGJ67LuqhcOnhXI0lFOm+mX6+8l0m5bHvBBWgGDluVrx7i/jBEOM
	+V/ztPFK7Vl59wy3KfLZJ7qVrutBLpCbVD0LKyVCw1MJJP+tCusN4F8dF9AGxku9zaRGN5BH9PNHP
	+JNPLz+jx9ZiC7ST6v0vQ4vDKsFHxr82UY1nHHccEMm78ljiffYL7mUQ67wpBWepWkq3ZGt1xRF+E
	Ai/mykHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZnw-00000004PWv-2uDm;
	Tue, 28 Jul 2026 04:52:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZnq-00000004PT7-11g2;
	Tue, 28 Jul 2026 04:52:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1woZnk-000000004x0-2h8i;
	Tue, 28 Jul 2026 04:52:24 +0000
Date: Tue, 28 Jul 2026 05:52:21 +0100
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
Subject: [PATCH net 2/3] net: dsa: mt7530: error out on failed reads in
 ATC/VTCR command polling
Message-ID: <eea1d8f15c54375b3770c23e09fb3217df487169.1785213071.git.daniel@makrotopia.org>
References: <cover.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_215230_293306_DC878559 
X-CRM114-Status: GOOD (  14.83  )
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

mt7530_fdb_cmd() and mt7530_vlan_cmd() poll the command register
through a helper which returns 0 when the underlying read fails. A
failed bus transaction thus clears ATC_BUSY/VTCR_BUSY and is treated
as successful command completion, and the subsequent ATC_INVALID and
VTCR_INVALID checks are defeated the same way.

Poll using regmap_read_poll_timeout(), which stops on read errors and
propagates them, and check the completion status read as well. Take
the MDIO bus lock across the sequence as the switch regmap is set up
with locking disabled.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6c8ed00ee9e7..51555060b5eb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -248,15 +248,20 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 {
 	u32 val;
 	int ret;
-	struct mt7530_dummy_poll p;
 
 	/* Set the command operating upon the MAC address entries */
 	val = ATC_BUSY | ATC_MAT(0) | cmd;
 	mt7530_write(priv, MT7530_ATC, val);
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_ATC);
-	ret = readx_poll_timeout(_mt7530_read, &p, val,
-				 !(val & ATC_BUSY), 20, 20000);
+	mt7530_mutex_lock(priv);
+
+	ret = regmap_read_poll_timeout(priv->regmap, MT7530_ATC, val,
+				       !(val & ATC_BUSY), 20, 20000);
+	if (!ret)
+		ret = regmap_read(priv->regmap, MT7530_ATC, &val);
+
+	mt7530_mutex_unlock(priv);
+
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
 		return ret;
@@ -265,7 +270,6 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 	/* Additional sanity for read command if the specified
 	 * entry is invalid
 	 */
-	val = mt7530_read(priv, MT7530_ATC);
 	if ((cmd == MT7530_FDB_READ) && (val & ATC_INVALID))
 		return -EINVAL;
 
@@ -1626,22 +1630,26 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 static int
 mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
 {
-	struct mt7530_dummy_poll p;
 	u32 val;
 	int ret;
 
 	val = VTCR_BUSY | VTCR_FUNC(cmd) | vid;
 	mt7530_write(priv, MT7530_VTCR, val);
 
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_VTCR);
-	ret = readx_poll_timeout(_mt7530_read, &p, val,
-				 !(val & VTCR_BUSY), 20, 20000);
+	mt7530_mutex_lock(priv);
+
+	ret = regmap_read_poll_timeout(priv->regmap, MT7530_VTCR, val,
+				       !(val & VTCR_BUSY), 20, 20000);
+	if (!ret)
+		ret = regmap_read(priv->regmap, MT7530_VTCR, &val);
+
+	mt7530_mutex_unlock(priv);
+
 	if (ret < 0) {
 		dev_err(priv->dev, "poll timeout\n");
 		return ret;
 	}
 
-	val = mt7530_read(priv, MT7530_VTCR);
 	if (val & VTCR_INVALID) {
 		dev_err(priv->dev, "read VTCR invalid\n");
 		return -EINVAL;
-- 
2.55.0

