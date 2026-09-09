Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACCDC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Otkn7qrD0QQsF9M2J+eNQoCf9Wvi4mx3LaCwu7r60wI=; b=Oo2AKBwCF0b4VVbiZj9FwMQoLT
	Uekx6AdH9UWeYTadBcQbHSTkqQX3kYLb4uFtn/0Fs9a4Mn/cKBjHxMvOXFEUzIHsdKCvYZe4HUqU3
	GT6Lau2huGNY5oX2cRKar+/BpKunUhGixrlqA/BEfNbdJ+BL3beYsOsWOfVsrMplRdZUtsSdgLwO3
	1LNVsoSDiXMK0MBr340WwGzTUJQRiUdLYvK9I/L2H0RV2UaUeaFi/WkxiXlVGkDnNMKMztn0ftoYy
	U+AlVecAV0ShMBgm6GoBJpoSEnv+Mw3DvO7vLv/U0owqo626+dGycYW0NNZph78MZmSq0SfXQAIG7
	L/xISA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Iud-0000000BsjM-0eiU;
	Wed, 09 Sep 2026 14:04:31 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IuX-0000000Bsal-0cw9;
	Wed, 09 Sep 2026 14:04:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C07953F5BB3;
	Wed,  9 Sep 2026 16:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788962662; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Otkn7qrD0QQsF9M2J+eNQoCf9Wvi4mx3LaCwu7r60wI=;
	b=mEngIkic16H62AjxFy6YMg7Re2h5vGQWsoEzDYVvXAhAlrtdA+hR3Wxr3jhuwMoGl/MSAz
	8zuzFGJLzc5rfBAq3L1eAyYqDiO8DQVPx4pff7TRGdNojeJo5jXtW3Ff6zNCHUcR44wsEp
	I3lQ9gViH/Dbi1IRig/lW6XeywOD5qjenYxG8Ql56a9HG5RXsReELYrclbrmoG+skL7AXx
	s0L1FOTPykuCmUzmbpHtxv7GNHbiTelSNS9Pg9JqkuRz6g61iKh08I2/NKLkCZc1z1p/VZ
	s2WbpSgl9Gw1VBMTs1ClTzP7ZG32cEt0WGJW7EhOwi4vl5PPcaib7wY2y2FQLA==
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
Subject: [PATCH net-next 5/7] net: dsa: mediatek: support MDIO switch downstream of MMIO switch
Date: Wed,  9 Sep 2026 14:03:44 +0000
Message-Id: <20260909140346.2861572-6-cjd@cjdns.fr>
In-Reply-To: <20260909140346.2861572-1-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_070425_643430_C1586CB9 
X-CRM114-Status: GOOD (  17.22  )
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
 drivers/net/dsa/mt7530-mmio.c |  7 ++++++-
 drivers/net/dsa/mt7530.c      |  7 ++++++-
 drivers/net/dsa/mt7530.h      | 10 ++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index cf3bdb23a2d5..29fbd0fc50d1 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -61,7 +61,12 @@ mt7988_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	return dsa_register_switch(priv->ds);
+	ret = dsa_register_switch(priv->ds);
+
+	if (ret)
+		return ret;
+
+	return mt7530_setup_mdio(priv);
 }
 
 static void mt7988_remove(struct platform_device *pdev)
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a165b4c8ed8d..0c0c5358b8b8 100644
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
@@ -2455,6 +2459,7 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	of_node_put(mnp);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mt7530_setup_mdio);
 
 static int
 mt7530_setup(struct dsa_switch *ds)
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


