Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA20ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfdABhxo77Vq2hWxH97QPFhtQeZZYgJJr6yRSjPrA0g=; b=ODV7Kq8+YR6yFBgEtJRyhRRaRP
	Qq+xpJ52YLWS42isnP1fJYwzsCw82S9yGrQTNJzmk6cHJDXn3aYdqdB9v+4uKh53dr5veHBzAj0Vj
	3GOmQ4l3nPotVDxVfLmreHFfRnICGEWo8D4SGO9TW/jIhsJZ0RXX/lfJf0ZJat5B8bIFMZOqYGYqX
	+Jvlczgwgknc3pmkWtxVcaQpIA7ZsH3XktOnLHSy1Hzx/SXFZJRVnusc/V/C/9WodAdVjqvBwhdkT
	O5oIuslRI7xishhmueuzE6z71RFGLq4Qft0S/beoyYEid30iQHvOVnFgSmT9faYpO5zFwQTCE6qik
	hv8o6I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs85-00000009f92-1CKO;
	Mon, 03 Nov 2025 10:49:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs82-00000009f7h-0OFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:49:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C016C0D7A9;
	Mon,  3 Nov 2025 10:49:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15A3060628;
	Mon,  3 Nov 2025 10:49:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C00DF10B50003;
	Mon,  3 Nov 2025 11:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166975; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DfdABhxo77Vq2hWxH97QPFhtQeZZYgJJr6yRSjPrA0g=;
	b=gngyqhCs0gVqdt4b/ON+QymUFz/4cmLsE12V8lsFHKwdis7GNwIJWR9XoGh3+pszOiRbA2
	oEJrJDEfXd6/JDSJCVx7bFk0ScTYE8tk2wALSmTlYsw2v+xO0m5/Exg6+eVhA28SI9Ihi8
	G5e6wJyqXbCr5yiVxY4ql3dPXqoBjSQiU2oEY6b6hbuPF/76yjqV8p+a7xdLwgd2UOwESD
	jDRGtEL3EP3DW0JdtSmgmYsDb97fcGqMpGw8wh4JpipZ2BXFd/d0jufPPCzWAL+ZtoncjC
	0zqxZg+5wGpUkP7uz31rJgJSfbY1ELkzMfVaW2OYK5fU0z80XYMeB6U32ktXTg==
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
Subject: [PATCH net-next v2 1/4] net: altera-tse: Set platform drvdata before registering netdev
Date: Mon,  3 Nov 2025 11:49:24 +0100
Message-ID: <20251103104928.58461-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024938_284692_C759E958 
X-CRM114-Status: GOOD (  10.52  )
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

We don't have to wait until netdev is registered before setting it as the
pdev's drvdata. Move it at netdev alloc time.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 3f6204de9e6b..6ba1249f027d 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1150,6 +1150,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 	}
 
 	SET_NETDEV_DEV(ndev, &pdev->dev);
+	platform_set_drvdata(pdev, ndev);
 
 	priv = netdev_priv(ndev);
 	priv->device = &pdev->dev;
@@ -1394,8 +1395,6 @@ static int altera_tse_probe(struct platform_device *pdev)
 		goto err_register_netdev;
 	}
 
-	platform_set_drvdata(pdev, ndev);
-
 	priv->revision = ioread32(&priv->mac_dev->megacore_revision);
 
 	if (netif_msg_probe(priv))
-- 
2.49.0


