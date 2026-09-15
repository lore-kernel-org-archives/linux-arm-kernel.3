Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EE0C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMESSO5uRX+BzGOQEPo7sGcRIjoMAuqIfwV5Ju1NceI=; b=WhumAOH7augY10HLbFb/t4KLFZ
	k8aWVg5FeDC3qmyzHh+6/s31XpCTWjMuG1tHesgtYFww3Ov0Q1Oli1ZAtxn+5ahKP6WtqPYrF1JiC
	E2qHNLfADvKnYMwGNvJx+1Fof0RKockdQKyFDvUERmpbkgPNy9L6lk0JVtvjj3VGnsLE/p43bl0Po
	aoClDXbWVBVjZcYyrUTF9RDEO/uHqIQXTEADExmA+7OKWMCKEE2TAWWOufY9KF1gXEoz2UyIbcUqi
	0ejTuVs0pxAQPcqvbEcsfB8M0pppzaluf5Y8ckEBlHKnv6YEnJQfUaFw7AEewkn3UnO6H/3cWWTJ8
	5gfSjQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFp-00000007dPL-11ko;
	Tue, 15 Sep 2026 17:47:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFk-00000007dMF-3Tzf;
	Tue, 15 Sep 2026 17:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GMESSO5uRX+BzGOQEPo7sGcRIjoMAuqIfwV5Ju1NceI=; b=WpeVLOQEFgw+HKMQrJJhQGX+xy
	GZ8rJyG90X6TBCu/L95llWgJAw8na3OY+bcraQ08RcZsh0SbwVrtvlA9LSRVblBKxFS4ZTLqai+5b
	53fWafUAYjhfMb4P2jchyniKvMa1kXahaDVqbBsymnebsBHoZmjlGSFqbgnTRG+4efoVmCKo6iMUX
	/m9xSPcU9FEoeaG7gx92x5X8zLDzugS3SHzt5u75cac4nA7OUrXF0UOlqM7xnakfuoey8WLci1sPr
	ijP9DuJHroKVkh7wyB2vqxEjZW7y4HYG5hZCBFYBWvgwfLh9sS5J7fRqoTBIb/egYDtK/Q0YeC1Ca
	nHg5h34A==;
Received: from mail.cjdns.fr ([5.135.140.105])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XFh-000000076Nf-41YJ;
	Tue, 15 Sep 2026 17:47:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 546B848DAF7;
	Tue, 15 Sep 2026 19:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789494446; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GMESSO5uRX+BzGOQEPo7sGcRIjoMAuqIfwV5Ju1NceI=;
	b=PCBxyxZmsZ9p0ZoT7lAV1pmvyKUa8WO3gEnQU390/z2piesrzcQ57X7rAjNSk22EbXJ+im
	jH8woiC9991zRxSmaH47CwgJy7MXBh6HrEhhK1Th6ZBlNzAMe+VzYhqSw5O+7UmRgCZzKP
	WWlinS1s2itKlo8A69V0Q6bAOVucWqEjjfFlTdbkj2ewyhF/62gX03Vaxhc2cgqW9HegPN
	IeTnSmi+hV3LHjLdbXY76qwGsazkhOa+ETYJw+PHQ4Fjy8FbNKGxL8YCAALkZDioMqpCFp
	i6sVSfFudX0/ZzoH5rdI/LaPbLrFrBd28dTmgtkPsKwTHXChkz2R124BEVlRiQ==
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
Subject: [PATCH v2 net-next 5/7] net: dsa: mediatek: support MDIO switch downstream of MMIO switch
Date: Tue, 15 Sep 2026 17:46:41 +0000
Message-Id: <20260915174643.253660-6-cjd@cjdns.fr>
In-Reply-To: <20260915174643.253660-1-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_184730_232857_D30AD926 
X-CRM114-Status: GOOD (  19.39  )
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

The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
the switch provides its own MDIO bus which connects to its integrated
PHYs, but also can be connected to other things, such as another
switch.

If the MDIO bus contains another switch, then the upstream switch
will register but it will not setup the DSA tree because the
downstream switch is missing. Without the complete DSA tree,
mt753x_setup() will not be called on the switch and therefore
mt7530_setup_mdio() is never called so the downstream switch never
registers.

Update mt7530_setup_mdio() so that it can be called multiple times,
export the symbol, and call it again after dsa_register_switch()
from mt7988_probe().

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530-mmio.c |  9 ++++++++-
 drivers/net/dsa/mt7530.c      | 13 +++++++++----
 drivers/net/dsa/mt7530.h      | 10 ++++++++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index cf3bdb23a2d5..f387190a9539 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -61,7 +61,14 @@ mt7988_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	return dsa_register_switch(priv->ds);
+	ret = dsa_register_switch(priv->ds);
+
+	if (ret)
+		return ret;
+
+	mt7530_setup_mdio(priv);
+
+	return 0;
 }
 
 static void mt7988_remove(struct platform_device *pdev)
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b152b73315d5..fe93be1ece7d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2404,7 +2404,7 @@ mt7530_free_mdio_irq(struct mt7530_priv *priv)
 	}
 }
 
-static int
+int
 mt7530_setup_mdio(struct mt7530_priv *priv)
 {
 	struct device_node *mnp, *np = priv->dev->of_node;
@@ -2414,6 +2414,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	static int idx;
 	int ret = 0;
 
+	/* Already done */
+	if (priv->child_bus)
+		return 0;
+
 	mnp = of_get_child_by_name(np, "mdio");
 
 	if (mnp && !of_device_is_available(mnp))
@@ -2438,9 +2442,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	bus->parent = dev;
 	bus->phy_mask = ~ds->phys_mii_mask;
 
-	if (priv->irq_domain && !mnp)
-		mt7530_setup_mdio_irq(priv);
-
 	priv->child_bus = bus;
 
 	ret = devm_of_mdiobus_register(dev, bus, mnp);
@@ -2455,6 +2456,7 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	of_node_put(mnp);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mt7530_setup_mdio);
 
 static int
 mt7530_setup(struct dsa_switch *ds)
@@ -3285,6 +3287,9 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
+	if (priv->irq_domain && ds->user_mii_bus)
+		mt7530_setup_mdio_irq(priv);
+
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {
 		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5b7394f6383c..c86bc4bca29b 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -969,6 +969,16 @@ struct mt7530_hw_stats {
 int mt7530_probe_common(struct mt7530_priv *priv);
 void mt7530_remove_common(struct mt7530_priv *priv);
 
+/*
+ * When an MMIO based switch has an MDIO bus which contains a downstream MDIO
+ * switch, the MDIO bus is not normally setup until mt753x_setup() has been
+ * called. But mt753x_setup() is not called until DSA sees that every switch in
+ * the tree has been probed. Calling mt7530_setup_mdio() after at the end of
+ * the MMIO probe function allows the downstream switch to register, completing
+ * the tree.
+ */
+int mt7530_setup_mdio(struct mt7530_priv *priv);
+
 extern const struct mt753x_info mt753x_table[];
 
 #endif /* __MT7530_H */
-- 
2.39.5


