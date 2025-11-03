Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17DCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVnvhYZYcU/MclyC3ag8i28LJKKIP3ycGDnvcI+cCrM=; b=1xeF+NhphsLMOQl5Rd5W0eoA3u
	BMlkajbYqWNahvR5hLumDEWG8bSS1JAtRNf79Z3XQBoq7y3mE7MN1plcAiUZ4jQJUxxKH1KpgVrUo
	lTmg1x9q7hQM6dJd9iKxdwheSV8gL4N1tEr54RusNACfT6WgZSC6kMbMZnqoalBymb116oEsJcR1h
	8cUh1rubfm7mADjOluNRWxAN2t4+u4bn65nVXsam+sEgIycDvchAzTFE12x2ccgOoo8W0tjANW/Sv
	uPuVfIBqcqKKtC2mJkMzC5owp6IhgkBqFDiloDHWdydiiouNF0DHfxnCpzN/I7ExmQTQw1086NyUI
	xzk0rf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs86-00000009f9y-0JTa;
	Mon, 03 Nov 2025 10:49:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs83-00000009f7x-1Okm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:49:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00F4BC0D7A8;
	Mon,  3 Nov 2025 10:49:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFB5B60628;
	Mon,  3 Nov 2025 10:49:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BBC810B50018;
	Mon,  3 Nov 2025 11:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166977; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JVnvhYZYcU/MclyC3ag8i28LJKKIP3ycGDnvcI+cCrM=;
	b=AhoXYc8Uu+j1QbV8gyNQGU3NxKrGG6bxDtTswfcKaEJVkaR4cXNKt0SzI2XLwHe/sKMyGr
	r2tW1w0Viqc+i1WpSCrR+gKxqfv3X8+dl0p/Ibn7FcnJBPR8Wilycs9K8PnGG4CcbibvmG
	ENCAHVgUP89bfgfRW3gJMvLWM5Nzn9GL+eDXOGjDe3IEE+ry1nmCilamze3On9f1tDSGqE
	vC2BEGzaAlMUONHSkkpsn81EZB2pWhxTReiK8QXQ1H2UmVis68YI5IolQlzgNvXQgNhQ5M
	+VkP8QlVFKmLx/mmC1HLhb5pGZwzHUiUFXfozf32pDYq6ZxQYnZA1aVRIcQFWA==
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
Subject: [PATCH net-next v2 2/4] net: altera-tse: Warn on bad revision at probe time
Date: Mon,  3 Nov 2025 11:49:25 +0100
Message-ID: <20251103104928.58461-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024939_522059_AD8E39CF 
X-CRM114-Status: GOOD (  14.78  )
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

Instead of reading the core revision at probe time, and print a warning
for an unexecpected version at .ndo_open() time, let's print that
warning directly in .probe().

This allows getting rid of the "revision" private field, and also
prevent a potential race between reading the revision in .probe() after
netdev registration, and accessing that revision in .ndo_open().

By printing the warning after register_netdev(), we are sure that we
have a netdev name, and that we try to print the revision after having
read it from the internal registers.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse.h      |  3 ---
 drivers/net/ethernet/altera/altera_tse_main.c | 12 ++++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
index 82f2363a45cd..e5a56bb989da 100644
--- a/drivers/net/ethernet/altera/altera_tse.h
+++ b/drivers/net/ethernet/altera/altera_tse.h
@@ -401,9 +401,6 @@ struct altera_tse_private {
 	/* MAC address space */
 	struct altera_tse_mac __iomem *mac_dev;
 
-	/* TSE Revision */
-	u32	revision;
-
 	/* mSGDMA Rx Dispatcher address space */
 	void __iomem *rx_dma_csr;
 	void __iomem *rx_dma_desc;
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 6ba1249f027d..343c78a493a1 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -892,9 +892,6 @@ static int tse_open(struct net_device *dev)
 		netdev_warn(dev, "device MAC address %pM\n",
 			    dev->dev_addr);
 
-	if ((priv->revision < 0xd00) || (priv->revision > 0xe00))
-		netdev_warn(dev, "TSE revision %x\n", priv->revision);
-
 	spin_lock(&priv->mac_cfg_lock);
 
 	ret = reset_mac(priv);
@@ -1142,6 +1139,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	void __iomem *descmap;
 	int ret = -ENODEV;
+	u32 revision;
 
 	ndev = alloc_etherdev(sizeof(struct altera_tse_private));
 	if (!ndev) {
@@ -1395,12 +1393,14 @@ static int altera_tse_probe(struct platform_device *pdev)
 		goto err_register_netdev;
 	}
 
-	priv->revision = ioread32(&priv->mac_dev->megacore_revision);
+	revision = ioread32(&priv->mac_dev->megacore_revision);
+
+	if (revision < 0xd00 || revision > 0xe00)
+		netdev_warn(ndev, "TSE revision %x\n", revision);
 
 	if (netif_msg_probe(priv))
 		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
-			 (priv->revision >> 8) & 0xff,
-			 priv->revision & 0xff,
+			 (revision >> 8) & 0xff, revision & 0xff,
 			 (unsigned long) control_port->start, priv->rx_irq,
 			 priv->tx_irq);
 
-- 
2.49.0


