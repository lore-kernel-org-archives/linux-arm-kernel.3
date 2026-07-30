Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E379C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgsYVT3l6iCHVps1iREv/tscFajn8p5GAEe8HQP8Gmk=; b=MdeoL4HlCfZvBxMxSAJX22c3N5
	3prlS4oE/hLCkDiC9a7+mXQhm5Ix6F6mpvgjGofFQTeXecSRM/5OegS9Ez2+76HfnIDT4rG0kWxAR
	yfA5SNy4/rj9q0fk2pG7k5tLOqorWg0WPiPmzEUrh+a7tIGuysdaH6wuba11hWl64SIPzD9zj2LgY
	SvJeG4O5d/Yc1G/42EPqwEezrMaltxlcW9Fhftn2UF5AviySDgNPnUgllv+xphKbP7Qk3N5uQzX9p
	V4YFSMJ1yUZAo3QK9I8Nv17cg/AcbzmGb1PRzsJbRBlpwV1H+1/zC+rxesoHn801N3vrauOBIeMmW
	tjecbIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEQn-000000099iB-1vwA;
	Thu, 30 Jul 2026 00:15:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEQP-000000099TT-3DUp;
	Thu, 30 Jul 2026 00:15:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wpEQJ-000000002fc-1daf;
	Thu, 30 Jul 2026 00:14:55 +0000
Date: Thu, 30 Jul 2026 01:14:52 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 3/5] net: dsa: mt7530: error out on failed reads in
 ATC/VTCR command polling
Message-ID: <b3158e751c5e8e3a36cd3bbb6b1c6f4ac9c17afd.1785368701.git.daniel@makrotopia.org>
References: <cover.1785368701.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785368701.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_171501_835981_98121413 
X-CRM114-Status: GOOD (  15.91  )
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
propagates them, and use the register value it already read back
instead of re-reading it. Take the MDIO bus lock across the sequence
as the switch regmap is set up with locking disabled.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2:
 * drop the extra regmap_read() after regmap_read_poll_timeout(); the
   macro already leaves the polled value in val (found by Sashiko AI
   review)
 * print ret in the error messages and stop mislabeling propagated bus
   errors as "reset timeout"/"poll timeout"

 drivers/net/dsa/mt7530.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f349b54c2d9e..aab26970f39b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -252,24 +252,26 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
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
+
+	mt7530_mutex_unlock(priv);
+
 	if (ret < 0) {
-		dev_err(priv->dev, "reset timeout\n");
+		dev_err(priv->dev, "ATC poll failed: %d\n", ret);
 		return ret;
 	}
 
 	/* Additional sanity for read command if the specified
 	 * entry is invalid
 	 */
-	val = mt7530_read(priv, MT7530_ATC);
 	if ((cmd == MT7530_FDB_READ) && (val & ATC_INVALID))
 		return -EINVAL;
 
@@ -1630,22 +1632,24 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
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
+
+	mt7530_mutex_unlock(priv);
+
 	if (ret < 0) {
-		dev_err(priv->dev, "poll timeout\n");
+		dev_err(priv->dev, "VTCR poll failed: %d\n", ret);
 		return ret;
 	}
 
-	val = mt7530_read(priv, MT7530_VTCR);
 	if (val & VTCR_INVALID) {
 		dev_err(priv->dev, "read VTCR invalid\n");
 		return -EINVAL;
-- 
2.55.0

