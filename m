Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73E2C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtRShyk6o+mFaKWyYtGc4VUflNqLu4ta7SCv3amDFV8=; b=WdcNWyUdeotrPG7jwDaCbz0gjZ
	3FkZ+j1MMC1nzr+lUeo+CM/b6MAgJeSFwVNewr8JpcPpqCR3SO0bdfEHsqUuBPi9AIjK0XanSFNHX
	ZYn32x0fNTiOUCmaPWR6XAHiQ+KDmpyiiuPxkoYstVjnEzQeNthi06AkY2MrxYu0Z54MxIXtIy5oS
	ctAhpb2p8TC20qw56VdGSQp5kb6PzytbCQAJRIx7VBrMNvlRckjXS3MBYM33P46ZqKCswq4v721uZ
	gXNPkbgy+g9AqsrJm+DqVLr7DF9gYjphIZquCar6E3XYkydTUcmBe2c9gJWNPANibQlFQvsCS82xp
	U6npOtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1467-00000009ttL-1mrh;
	Mon, 31 Aug 2026 15:38:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1465-00000009tsY-1exF;
	Mon, 31 Aug 2026 15:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GtRShyk6o+mFaKWyYtGc4VUflNqLu4ta7SCv3amDFV8=; b=JHp2evgzzodRD1lWst66GS/TyF
	Y49KuhjuBzcMAjlQrnxCUn/amnHDYsS7uB6GHNxYXS5HTTEAIlcBw87dMi3KA3g1oL4KwWYf9gqRX
	nEA/F8j+47f1ZaTNPQK16h/MWbfZfDQU9x6Dle2Eqf3yu8iKpye0LefbpbvUCtYyoR75MkZImHxuK
	IdmaA4orAuxwHRQP4Vg8LvBrJHvCC+Wen8HbhGIQebA+VKpqS/9cwqqMnCw4p2heuwZRIvoA2IRcZ
	NOyb1YjgHPLJaQLjlh6ccaWne7uK+0UvXW4UpgKAAuAq2abl4/I+Trjh9oY/GdYrh+1WMzutdyEAh
	gEkUHBsg==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1462-0000000A0cO-2AIr;
	Mon, 31 Aug 2026 15:38:56 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x145x-000000007C7-2SVY;
	Mon, 31 Aug 2026 15:38:49 +0000
Date: Mon, 31 Aug 2026 16:38:46 +0100
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
Subject: [PATCH net-next v5 6/9] net: dsa: mt7530: drop the dummy poll
 machinery
Message-ID: <609dcd8dd0c335e36bbc8df41413da58af1dbfb4.1788190568.git.daniel@makrotopia.org>
References: <cover.1788190568.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788190568.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163854_684982_82FCEBBA 
X-CRM114-Status: GOOD (  14.61  )
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

Convert the two remaining switch reset polls to
regmap_read_poll_timeout() and remove struct mt7530_dummy_poll,
INIT_MT7530_DUMMY_POLL() and the mt7530_mii_poll() helper. As with the
command polls addressed by the preceding fixes, a failed read now
terminates the poll with an error instead of being fed to the loop
condition as a zero value.

Generated using the following semantic patch, plus removal of the two
now-unused definitions from mt7530.h:

// Poll the register through regmap so a failed read ends the poll.
@@
expression priv, reg;
identifier p, ret, val;
@@
-	INIT_MT7530_DUMMY_POLL(&p, priv, reg);
-	ret = readx_poll_timeout(mt7530_mii_poll, &p, val, val != 0,
-				 20, 1000000);
+	ret = regmap_read_poll_timeout(priv->regmap, reg, val, val != 0,
+				       20, 1000000);

@@
identifier p;
@@
- struct mt7530_dummy_poll p;
  ... when != p

@@
identifier p;
type T;
@@
-static T mt7530_mii_poll(struct mt7530_dummy_poll *p) { ... }

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: new patch
---
 drivers/net/dsa/mt7530.c | 22 ++++------------------
 drivers/net/dsa/mt7530.h | 12 ------------
 2 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 57f38d39058a..9a56b6875ad7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -154,16 +154,6 @@ core_clear(struct mt7530_priv *priv, u32 reg, u32 val)
 	core_rmw(priv, reg, val, 0);
 }
 
-static u32
-mt7530_mii_poll(struct mt7530_dummy_poll *p)
-{
-	u32 val;
-
-	regmap_read(p->priv->regmap, p->reg, &val);
-
-	return val;
-}
-
 static int
 mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 {
@@ -2379,7 +2369,6 @@ mt7530_setup(struct dsa_switch *ds)
 	struct device_node *dn = NULL;
 	struct device_node *phy_node;
 	struct device_node *mac_np;
-	struct mt7530_dummy_poll p;
 	phy_interface_t interface;
 	struct dsa_port *cpu_dp;
 	u32 id, val;
@@ -2440,9 +2429,8 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 
 	/* Waiting for MT7530 got to stable */
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT753X_TRAP);
-	ret = readx_poll_timeout(mt7530_mii_poll, &p, val, val != 0,
-				 20, 1000000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT753X_TRAP, val,
+				       val != 0, 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
 		return ret;
@@ -2665,7 +2653,6 @@ static int
 mt7531_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	struct mt7530_dummy_poll p;
 	u32 val, id;
 	int ret, i;
 
@@ -2683,9 +2670,8 @@ mt7531_setup(struct dsa_switch *ds)
 	}
 
 	/* Waiting for MT7530 got to stable */
-	INIT_MT7530_DUMMY_POLL(&p, priv, MT753X_TRAP);
-	ret = readx_poll_timeout(mt7530_mii_poll, &p, val, val != 0,
-				 20, 1000000);
+	ret = regmap_read_poll_timeout(priv->regmap, MT753X_TRAP, val,
+				       val != 0, 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
 		return ret;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5f1e841f42c0..ae93bb263249 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -933,18 +933,6 @@ struct mt7530_hw_stats {
 	u8		sizeof_stat;
 };
 
-struct mt7530_dummy_poll {
-	struct mt7530_priv *priv;
-	u32 reg;
-};
-
-static inline void INIT_MT7530_DUMMY_POLL(struct mt7530_dummy_poll *p,
-					  struct mt7530_priv *priv, u32 reg)
-{
-	p->priv = priv;
-	p->reg = reg;
-}
-
 int mt7530_probe_common(struct mt7530_priv *priv);
 void mt7530_remove_common(struct mt7530_priv *priv);
 
-- 
2.55.0

