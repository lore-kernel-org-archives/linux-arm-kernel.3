Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ECC606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0C7n5diD;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=vxeOA49F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AgybJpxOfMLvjOr4vA9iNTA134E7lJeRScneIqIN0/o=; b=0C7n5diDnQ+vhA
	1HXaGIOXC+O6+dDYMEOLRQ12tcJxzozO7GC6TK8PvOU0mocO6oXULxtG9q9mGGnUVYOTe1S7IT7sx
	UJitDdslWXf5N9UdJes+7/436OwKuXfMo7zPlCYyc0VnAVC5lptd6wTdZ71ebY+WuOFJo1EMBEmOt
	a1mNrfCiyF3y6+n9o4+tuRsX1q6g0RuxzXaj4V6TDSBhJqto4JwkeV3lC4uyYxmWXRlXJ9dr0gr1D
	s4zYME6OTELNcovYshlGyVw0rNplUOf82M9QbYJ9go2Il8zE9mIfJid0X4PphAyn83zlHfFAPtoq0
	dPC7EE/BemHYRl1Klfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV5O-0000000A8ha-0hAx;
	Thu, 29 Oct 2026 18:42:50 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV58-0000000A8Uy-2LY0;
	Thu, 29 Oct 2026 18:42:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 920D11AAD99;
	Thu, 29 Oct 2026 19:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793299351; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AgybJpxOfMLvjOr4vA9iNTA134E7lJeRScneIqIN0/o=;
	b=vxeOA49FKEyaosAYD5FV4VSKTUtRJ0mMQ3/Btmjr8YV4hhe5Cf71IIb9jUzteyCNNgWQ+H
	RdJzpLXmPfipSAyegDx9qS2Ua5ixFSF5xGg4RF9YqNOcuKDkAIMGd75FBVPlAdRra4ixEH
	VCqdI1wpK/wYNXp1hSFscO1x8QLRCzDOw9Un0adUa8CnDnPNK2jE/sXRagQPtYdfGlEgov
	+faznw1Xt0LXvvnNJcMVz9Yinqcnj0DXXkHHwyz5ESrDFstBrysEdZ6zwrkW8hjHKkuPja
	G8tRpRYsLSPHRe9bYknp2YRtyaoilMPO3ZwxWzSBiVJrD/BN7EC3bP2lBJSF1A==
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
Subject: [PATCH v4 4/7] net: dsa: mediatek: support PLL setup on MMIO MT7530
Date: Thu, 29 Oct 2026 18:41:59 +0000
Message-Id: <20261029184202.1859843-5-cjd@cjdns.fr>
In-Reply-To: <20261029184202.1859843-1-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114234_784428_CD216DE5 
X-CRM114-Status: GOOD (  12.92  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT7530 and MT7531, PHYs are an integral part of the switch. However,
on MT7530, certain configuration such as PLL setup is done via special
registers on one of the PHYs.

In an MMIO implementation, the MDIO bus is part of the switch itself.
This bus is already setup for PHY calibration so begin using it for
core switch PLL setup.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530.c | 15 +++++++++++++++
 drivers/net/dsa/mt7530.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c5b3b00acb95..d45388e2efc8 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -77,6 +77,12 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 	struct mii_bus *bus = priv->bus;
 	int ret;
 
+	if (!bus)
+		bus = priv->child_bus;
+
+	if (WARN_ON_ONCE(!bus))
+		return;
+
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
@@ -112,6 +118,12 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	u32 val;
 	int ret;
 
+	if (!bus)
+		bus = priv->child_bus;
+
+	if (WARN_ON_ONCE(!bus))
+		return;
+
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
@@ -2534,8 +2546,11 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	if (priv->irq_domain && !mnp)
 		mt7530_setup_mdio_irq(priv);
 
+	priv->child_bus = bus;
+
 	ret = devm_of_mdiobus_register(dev, bus, mnp);
 	if (ret) {
+		priv->child_bus = NULL;
 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
 		if (priv->irq_domain && !mnp)
 			mt7530_free_mdio_irq(priv);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 108c831dd012..5b7394f6383c 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -886,6 +886,9 @@ struct mt753x_info {
  * @dev:		The device pointer
  * @ds:			The pointer to the dsa core structure
  * @bus:		The bus used for the device and built-in PHY
+ * @child_bus:		The bus created by the device, on MDIO implementations
+ *			this is bus indirectly accesses `bus`, on MMIO
+ *			implementations this bus is part of the switch.
  * @regmap:		The regmap instance representing all switch registers
  * @rstc:		The pointer to reset control used by MCM
  * @core_pwr:		The power supplied into the core
@@ -914,6 +917,7 @@ struct mt7530_priv {
 	struct device		*dev;
 	struct dsa_switch	*ds;
 	struct mii_bus		*bus;
+	struct mii_bus		*child_bus;
 	struct regmap		*regmap;
 	struct reset_control	*rstc;
 	struct regulator	*core_pwr;
-- 
2.39.5


