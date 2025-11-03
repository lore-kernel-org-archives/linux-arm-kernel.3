Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FCCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om6wHCpy7rTQ5fiCmhmBYc/5JN7l85iZJ6/YxQjLX1c=; b=BUwBe7/MyIonfusAr6Ao9hMYPe
	I5Cx/eaM4RUYXySlWW0LXD6arhpvVmJMBZseudjwT5IJgLk5WXCeDxhawNT3fOoRIoOG22a8T09qh
	y4ubwQpVo86pR483hO8xF7J9oTbyz4e3roWC+gq41K0Wf1Eda84sjKRN6563LNyQn1qTDI57vcrXT
	kLz1YLqAwdpyfnjp+THj0FDUKjfrl+6L/RA8HnlWOSNKB2OxLTy4PjAFXDhsTsWypc39dXvj8hh6t
	i2X2x1CaP8sMWxuBDE+5hmGxSUiW7Vuy1w/eO57LaYaxvbMFdhY9GBCUbY8bGfdLNhg2VMApRrKuK
	g6J++FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs87-00000009fBD-1WdO;
	Mon, 03 Nov 2025 10:49:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs85-00000009f8c-15j8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:49:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD01AC0D7A9;
	Mon,  3 Nov 2025 10:49:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A93DF60628;
	Mon,  3 Nov 2025 10:49:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55E0510B50014;
	Mon,  3 Nov 2025 11:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166978; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=om6wHCpy7rTQ5fiCmhmBYc/5JN7l85iZJ6/YxQjLX1c=;
	b=g0VtCmZgHjb0pB3bwDcm4QpSfQDoVXlx0ge0ujYmBzpxsc12xZLGyWFZTAaYNfbId3dhGV
	olfOQFok4HXzsdG3dY6uxHaIeX3RL2InA90S6PHg8MBTgwKvJt3wAuvBFO3E6v1B8DtBzg
	269c+J6DqN7glyEr4XK55f+Wnkq+qO6I6uU6a5b81PfosIlPgoZKHFgrqH3baCFxq63WJ+
	WnDVFKDnZh3OxNWxvkSMTGJMytT2Rz7fY/7sykFBAaTkXzZ6nIuUBeUunIqQzoE2iiC5eC
	tP2QiWAzjjIvjCaSoOmpKay4VAahWk1XtqYi1fZpEzxzDR8fH4vPUOWxitaaDg==
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
Subject: [PATCH net-next v2 3/4] net: altera-tse: Don't use netdev name for the PCS mdio bus
Date: Mon,  3 Nov 2025 11:49:26 +0100
Message-ID: <20251103104928.58461-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024941_449801_FDF01B9B 
X-CRM114-Status: GOOD (  11.53  )
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

The PCS mdio bus must be created before registering the net_device. To
do that, we musn't depend on the netdev name to create the mdio bus
name. Let's use the device's name instead.

Note that this changes the bus name in /sys/bus/mdiobus

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 343c78a493a1..003df8970998 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1404,7 +1404,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 			 (unsigned long) control_port->start, priv->rx_irq,
 			 priv->tx_irq);
 
-	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev->name);
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", dev_name(&pdev->dev));
 	pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
 	if (IS_ERR(pcs_bus)) {
 		ret = PTR_ERR(pcs_bus);
-- 
2.49.0


