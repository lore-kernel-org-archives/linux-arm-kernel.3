Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAEC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6phv/hZhrcUfCVNphnPXkc+f3zazIfk9ZFMSlk6V38=; b=SBw+vRAMp8bYtxovw/8Y62/1gx
	N9udBCFvGFacw8kNhG7nXM+k+Ifz8l81aJD1NeN+oA44KcShph2/kPgOqbS2zxdMbbKlXDNANv0N2
	016dWTlRb73YFEJMQhQGkuuGzrDmCHWqGjY8VvsiLOBcp0AMH56dFau2/lAS5CBEsngiQPpjIXi6/
	EgLdVBa5utfrnwmRugIUj7xZIK7CCoSJ17W8f0Y6yqgMPnmOTXr+kZ0LOVOxOs4Q6wbEKNOIzk7df
	yyWi39JPUDJmUbeB8SBgbstOvGc4yUZI+erWsVJtZPERgcDC62ejAriisqOo/qYYbzLjcw7wTDz/C
	xDP1CuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Ye-00000000tny-2jWL;
	Tue, 04 Aug 2026 03:11:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Yc-00000000tm3-2Ry1;
	Tue, 04 Aug 2026 03:11:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wr5YW-0000000047y-2TLa;
	Tue, 04 Aug 2026 03:11:04 +0000
Date: Tue, 4 Aug 2026 04:11:01 +0100
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
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 6/6] net: dsa: mt7530: serialize the regmap IRQ chip
 like every other user
Message-ID: <818840879e9cd20f8d568789da29b3474c8f3ab9.1785811140.git.daniel@makrotopia.org>
References: <cover.1785811140.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785811140.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_201110_628732_B36410C3 
X-CRM114-Status: GOOD (  18.62  )
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

The switch register regmap is created with .disable_locking = true;
every other user in this driver calls mt7530_mutex_lock()/unlock()
around it, which takes priv->bus->mdio_lock, since the underlying
mt7530_regmap_read()/write() issue raw, unserialized bus->read()/
write() MDIO transactions.

mt7530_setup_irq() hands this same unlocked regmap straight to
devm_regmap_add_irq_chip_fwnode(), whose threaded IRQ handler then
calls regmap_read()/regmap_update_bits() on it without ever calling
mt7530_mutex_lock(). An interrupt firing while another thread is
mid-transaction on the same regmap (e.g. a paged register access, or
an indirect PHY access) can interleave with the IRQ handler's own
paged access and corrupt page selection on either side.

Use struct regmap_irq_chip's handle_mask_sync hook to call
mt7530_mutex_lock()/unlock() around the mask register write regmap-irq
issues whenever a consumer of one of the mapped sub-IRQs enables,
disables, requests or frees its line. This needs a per-device copy of
mt7530_regmap_irq_chip, since devm_regmap_add_irq_chip_fwnode() keeps
a pointer to it rather than copying it.

handle_pre_irq/handle_post_irq, which would additionally cover the
status read and ack write the threaded handler does directly, bracket
the whole handler including its handle_nested_irq() calls. Lockdep
caught this on hardware: those calls reach phy_interrupt() for the
per-port PHY IRQ lines mapped through this chip, which takes
phydev->lock, while phy_attach_direct() and this driver's own indirect
PHY access already establish the opposite order (phydev->lock, then
priv->bus->mdio_lock) elsewhere. Using them here would close that
cycle, so they are not used.

regmap_irq_sync_unlock() also has its own init_ack_masked path, used
by this chip, which unconditionally does its own regmap_write() to ack
currently-masked IRQs; that path has no per-driver hook. Together with
the threaded handler's own status read and ack write, these stay
unprotected -- a narrower, harder-to-hit gap than the recurring mask
sync above -- and will be closed once the switch regmap moves to
regmap's own locking in the driver-wide register access cleanup.

Fixes: 254f6b272e3b ("dsa: mt7530: Utilize REGMAP_IRQ for interrupt handling")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2: no changes

 drivers/net/dsa/mt7530.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c0437273270b..0b39f2348115 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2319,6 +2319,21 @@ static const struct regmap_irq mt7530_irqs[] = {
 	REGMAP_IRQ_REG_LINE(31, 32), /* ACL */
 };
 
+/* Serialize regmap-irq's mask sync like every other regmap user */
+static int mt7530_irq_mask_sync(int index, unsigned int mask_buf_def,
+				unsigned int mask_buf, void *irq_drv_data)
+{
+	struct mt7530_priv *priv = irq_drv_data;
+	int ret;
+
+	mt7530_mutex_lock(priv);
+	ret = regmap_update_bits(priv->regmap, MT7530_SYS_INT_EN,
+				 mask_buf_def, ~mask_buf);
+	mt7530_mutex_unlock(priv);
+
+	return ret;
+}
+
 static const struct regmap_irq_chip mt7530_regmap_irq_chip = {
 	.name = KBUILD_MODNAME,
 	.status_base = MT7530_SYS_INT_STS,
@@ -2328,12 +2343,14 @@ static const struct regmap_irq_chip mt7530_regmap_irq_chip = {
 	.irqs = mt7530_irqs,
 	.num_irqs = ARRAY_SIZE(mt7530_irqs),
 	.num_regs = 1,
+	.handle_mask_sync = mt7530_irq_mask_sync,
 };
 
 static int
 mt7530_setup_irq(struct mt7530_priv *priv)
 {
 	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip *chip;
 	struct device *dev = priv->dev;
 	struct device_node *np = dev->of_node;
 	int irq, ret;
@@ -2353,10 +2370,17 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
+	chip = devm_kmemdup(dev, &mt7530_regmap_irq_chip, sizeof(*chip),
+			    GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->irq_drv_data = priv;
+
 	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
 					      priv->regmap, irq,
 					      IRQF_ONESHOT,
-					      0, &mt7530_regmap_irq_chip,
+					      0, chip,
 					      &irq_data);
 	if (ret)
 		return ret;
-- 
2.55.0

