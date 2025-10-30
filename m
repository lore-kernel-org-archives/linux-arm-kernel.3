Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D41CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYQO/J8iwjLT+7v/VfTgDA/2MnHjgHlcPgf4jpQ3AXs=; b=qndr49LqRg6ml7KErRa8CNTfMp
	EhPoCgCnaDtrD1sKuMYLfGa49UaXTSgjAaiyOrb0HGKO5sa5jdMEAhAxMjHRuup0axsew/q84GT8A
	HcHdUOeRP7VnOO679KbiBe6LGCSCGoBFrbcEa3Rq+384K0NFvacP+rO+cYlkSatAHhJGVUBkRkcwd
	quN+KQAP43GrnF8gx9yo+gf4nG0BZ/0Btg3cr+syqbiL9n2nDxZDAaTZ+3heVro7WybeUr5DLWGEf
	sAuz3z79ri6GT/WYOwY1opykA37lAB2uoLnWiTQqjwq+1ZDrS1OK4JrYIShpfam7eXwhNI+LAvm+h
	jgoHf2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpi-00000003yOC-1T8T;
	Thu, 30 Oct 2025 10:24:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpY-00000003yKB-1SR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:24:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF66C1A1777;
	Thu, 30 Oct 2025 10:24:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C66136068C;
	Thu, 30 Oct 2025 10:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A67E0102F2500;
	Thu, 30 Oct 2025 11:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761819870; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pYQO/J8iwjLT+7v/VfTgDA/2MnHjgHlcPgf4jpQ3AXs=;
	b=gZxe+zATPo1ZUR444y2TlDGvsM9lETqMy7I/JWzjj9wQNzpOdcT1fm+2wN4cCzHxZBj6WP
	cVF0v/YOfw0Feab6GlIKGwKAdIw9yNFLaU29abStuieUIn/eHDigSsmZAhvD34iB7yrmWM
	/kIko9F7NQHox/3C8nu/WQsXfsIB7evmNNfK5Fuf7Brl/Upabt0QOBZhNWGCeViOifPb2Z
	belpWKJXlcvvksH/XuoZd5wuzVgF6OrnfBHHebYgjnQMxDSz2nKfin85LD4N7oblPEgmnf
	fpsHuxEYvNduINWzIRxEfUSZ1u+8HoFj+4QeL3/0IOK6kD8BTRI+BfpEuxw+oA==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/4] net: altera-tse: Init PCS and phylink before registering netdev
Date: Thu, 30 Oct 2025 11:24:17 +0100
Message-ID: <20251030102418.114518-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032432_520855_A9000CFB 
X-CRM114-Status: GOOD (  13.16  )
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

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index a601ba57190e..4ffa3edf1d0c 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1390,20 +1390,6 @@ static int altera_tse_probe(struct platform_device *pdev)
 
 	priv->revision = ioread32(&priv->mac_dev->megacore_revision);
 
-	netif_carrier_off(ndev);
-	ret = register_netdev(ndev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register TSE net device\n");
-		goto err_register_netdev;
-	}
-
-	if (netif_msg_probe(priv))
-		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
-			 (priv->revision >> 8) & 0xff,
-			 priv->revision & 0xff,
-			 (unsigned long) control_port->start, priv->rx_irq,
-			 priv->tx_irq);
-
 	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", dev_name(&pdev->dev));
 	pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
 	if (IS_ERR(pcs_bus)) {
@@ -1441,12 +1427,26 @@ static int altera_tse_probe(struct platform_device *pdev)
 		goto err_init_phylink;
 	}
 
+	ret = register_netdev(ndev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register TSE net device\n");
+		goto err_register_netdev;
+	}
+
+	if (netif_msg_probe(priv))
+		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
+			 (priv->revision >> 8) & 0xff,
+			 priv->revision & 0xff,
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


