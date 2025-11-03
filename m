Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0525CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TPCTtZANNTp/VYFJqCDjc/4NduN0XXsteAOjwzluOs=; b=HVi+AXI1/HD06xtzCwqVbVo/EW
	63nZJoCKE0R0VK1FRYNQ05i2lPqZB19vdq+BSFxpwRg6hU3SQA8IAR49DGQ6/Z/Q8Al+472Ach9wo
	5UrOhK70KLfm568UIjYiALGoHLSRES0aeuwLmAOMRDLRZRAe5LGL56QdzeGhpu7zi+/vJ11wRQqIv
	YUxtJT/s3H0d0yBV5kxhsdtidFHfxhQe1n9evlfqSarAai0ja0LeKjbW+9DLxOcCqk/xAOXVg2DnS
	kVMBPwB/jVOSNUR9f5DRqcnb08oRngSs0K2oC1HfgwXkFj2TwPqb7NDLvprxF4Z+oTUHQc0vvGIxm
	a+zibwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs88-00000009fCQ-2raq;
	Mon, 03 Nov 2025 10:49:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs86-00000009f9I-2dDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:49:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3D6DAC0D7AA;
	Mon,  3 Nov 2025 10:49:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09F2B60628;
	Mon,  3 Nov 2025 10:49:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1F4210B50078;
	Mon,  3 Nov 2025 11:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166980; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8TPCTtZANNTp/VYFJqCDjc/4NduN0XXsteAOjwzluOs=;
	b=XZemZQeVyfmAD5Ol4lpacCnPomlQc5PGvGZtuF5hUmBD5HgGbMC/ffi/WPb3uMtmymsdCk
	+m/waRSCjN4WjF3vo0EmkX5HfPT9XCDA96d8HjbZU56WWtrfJ1Us1YdYQE8NUQn6YkKj+e
	QlWCvRndzfhnEXQVl10nYLKOPpDVo39S7ikz6LXwyqv+kbDysyGoRPJzOfqaowH5DgNsc+
	SAHrOwrZfHRokQ+bMw88vpYOCLUnvOsv9YXSS0mj8jwpi4T3+XwyRECA0FmaPgEUwPDZlY
	H3b27k5JroclJafsHX6JyZqL5t80gytpIjR0t9gxt8+hUSbO8Ec7iaHnRf00mw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 4/4] net: altera-tse: Init PCS and phylink before registering netdev
Date: Mon,  3 Nov 2025 11:49:27 +0100
Message-ID: <20251103104928.58461-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024942_827563_0A309CD8 
X-CRM114-Status: GOOD (  12.44  )
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

register_netdev() must be done only once all resources are ready, as
they may be used in .ndo_open() immediately upon registration.

Move the lynx PCS and phylink initialisation before registerng the
netdevice. We also remove the call to netif_carrier_off(), as phylink
takes care of that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 003df8970998..ca55c5fd11df 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1386,24 +1386,6 @@ static int altera_tse_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->tx_lock);
 	spin_lock_init(&priv->rxdma_irq_lock);
 
-	netif_carrier_off(ndev);
-	ret = register_netdev(ndev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register TSE net device\n");
-		goto err_register_netdev;
-	}
-
-	revision = ioread32(&priv->mac_dev->megacore_revision);
-
-	if (revision < 0xd00 || revision > 0xe00)
-		netdev_warn(ndev, "TSE revision %x\n", revision);
-
-	if (netif_msg_probe(priv))
-		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
-			 (revision >> 8) & 0xff, revision & 0xff,
-			 (unsigned long) control_port->start, priv->rx_irq,
-			 priv->tx_irq);
-
 	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", dev_name(&pdev->dev));
 	pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
 	if (IS_ERR(pcs_bus)) {
@@ -1441,12 +1423,30 @@ static int altera_tse_probe(struct platform_device *pdev)
 		goto err_init_phylink;
 	}
 
+	ret = register_netdev(ndev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register TSE net device\n");
+		goto err_register_netdev;
+	}
+
+	revision = ioread32(&priv->mac_dev->megacore_revision);
+
+	if (revision < 0xd00 || revision > 0xe00)
+		netdev_warn(ndev, "TSE revision %x\n", revision);
+
+	if (netif_msg_probe(priv))
+		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
+			 (revision >> 8) & 0xff, revision & 0xff,
+			 (unsigned long)control_port->start, priv->rx_irq,
+			 priv->tx_irq);
+
 	return 0;
+
+err_register_netdev:
+	phylink_destroy(priv->phylink);
 err_init_phylink:
 	lynx_pcs_destroy(priv->pcs);
 err_init_pcs:
-	unregister_netdev(ndev);
-err_register_netdev:
 	netif_napi_del(&priv->napi);
 	altera_tse_mdio_destroy(ndev);
 err_free_netdev:
-- 
2.49.0


