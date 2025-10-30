Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9F1CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoyBPsQbxCeIyoPQ2zrzEdmuX54xkmjv6HtTh7tX2pE=; b=HnkYZc1ZnnrUQ9aT/Ev+vvO4h7
	A3QVyLIQYo4bnyip7Vd+wsfCqfaDZ59o0rqJoovvXriFoUQ9mJY6FhYSbhft59feQteRSmzIh4Q6x
	XnLkADxnQrfTQ374B7/ysEqP0lCFXNNg3rRqq7LF0oNQBbCqK3t78KO3uDRc8TxrP9C6r8OiAMCPc
	KjnMPjFQIr4nl1jkY183H0i8Zi1btq+KZ3SyNjySzVbU1QnGnJLFWNljkGjmDIG9+YG7bHwOtUDga
	UQ3criLml9zOjyZ01IEFX2Cv++wOS4nIRqmHhIJAfRG+01v0xtFGkapcFteUAxvuyLpSvda+1G7SQ
	VHKPiyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpi-00000003yNv-0BjC;
	Thu, 30 Oct 2025 10:24:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpW-00000003yJK-2ui2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:24:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51D581A177B;
	Thu, 30 Oct 2025 10:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 284156068C;
	Thu, 30 Oct 2025 10:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D81911808821;
	Thu, 30 Oct 2025 11:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761819868; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RoyBPsQbxCeIyoPQ2zrzEdmuX54xkmjv6HtTh7tX2pE=;
	b=cuKxX9meA+bNJDneTgaqLKGwAeRY7C04U2PFcPPzTSTA9uWBDYQ0LRTaKNwIBFSD3I7Bzi
	ObVIj158RqAaCWrwRf9txLznrlOKryzaZB4nwF/0oqyKVx6pQk4raE090zw2mci+BK9iQT
	IibgK5D/5bmfhh3kOoQ/0WCrv+mWKZ6GYTSxggeieViKa0kDvlnHHMpZgXhRGX83uf6qMn
	LMz1d22VP5UDc72kb0mtMhlR5Nbd7K9ZX/GJJuets1I14b0pBELKf/wU/HCy6VqQjljV8h
	fEl0yPKiC2m8yS8kVIGzr9BoMaobqKdZWONokoR5helRQmT8GiWYVCRPXvtaUA==
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
Subject: [PATCH net-next 3/4] net: altera-tse: Don't use netdev name for the PCS mdio bus
Date: Thu, 30 Oct 2025 11:24:16 +0100
Message-ID: <20251030102418.114518-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032430_871941_DFE78BAE 
X-CRM114-Status: GOOD (  11.77  )
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

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index c74b1c11d759..a601ba57190e 100644
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


