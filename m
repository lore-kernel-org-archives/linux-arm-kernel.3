Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639560A2614
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UuyZ8aIv;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=VDUTHKoW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ADqrrJvW23LFM0pGXYZQATdOejQwocht4yhLCBcfUYY=; b=UuyZ8aIvaukuor
	jpl8MbzZEKgtFUOqpH8ijSk8Yw+rr2gU0Uob+g75+bx1R9njwu93SlZlZ/q9nqwOIuoEDbGdZq0Tk
	fSxo2Zwd7ogsKOqZHva1hKQJHXcsdqQ2acSgrAsZuGS3WLPSXv0ff3JpWWrTNIfmFnbgy09magogI
	sWoEQRR53AvjKNV0RrOEHKhn7loOHUoI9MkSFF8sEHcfldauFvXEwh94W8HdtS54hkNULcFM6ZlKk
	6QFmkjXxFttXid+Ss8pIG1ovaT8CXA7Wm3UuOA3jcIKlhONX61uIowgveFtkhl4be2nd1Svkar8O+
	NA+x90NPdyQR+QAqjceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEv-00000006160-0YI7;
	Wed, 28 Oct 2026 01:14:05 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEn-000000060z9-17M9;
	Wed, 28 Oct 2026 01:13:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D88FB1497AB;
	Wed, 28 Oct 2026 02:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793150034; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ADqrrJvW23LFM0pGXYZQATdOejQwocht4yhLCBcfUYY=;
	b=VDUTHKoWLkmSLXIbTOCCmtykkplv8++xjvmWBHVbWRu7BG/coDf6i3CR33yr/VhxkNkJZr
	jCtfrO7SGQ2DCRhVpN4oY7++rz8tQyBvNf2FruzXFEAqrkepxlCwg7Bupumk2AqQK61NLJ
	xTajaQrdN9bmD9zABy8/nqMqoN9YeZ8ctMRSbIxXZzD2vuk8xQGCtC1HgzP1TVb8SldAw3
	aZ0+hWruelRT+zbWff5c2OG4f94zP5pgwokdcYZqdTbgyQWFwHycS6u3MOduBcn+S4ZRSu
	asaSbo9A0Q2Zq8oNiorR9f1FpTYXs1eWck0vFOWPvnq8y6SvfVYeez83EnJphg==
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
Subject: [PATCH v3 4/7] net: dsa: mediatek: support PLL setup on MMIO MT7530
Date: Wed, 28 Oct 2026 01:13:14 +0000
Message-Id: <20261028011317.1557238-5-cjd@cjdns.fr>
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181357_522251_4669885C 
X-CRM114-Status: GOOD (  13.05  )
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
index 3eb2e11d6985..d09ff207e2df 100644
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
@@ -2472,8 +2484,11 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
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


