Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFE3CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s4YXZ006r6JZP+ciPRm1kPsUk3RftNVPiuxZBb+ZTw=; b=ujGvwKxs0TayQJ/6Zhe3Ss6FC6
	6HpftwWTx50F04Hl7QknsLWEakJMi/33LzrRwR9vojBsi/icQToSdyOeUMzy9+tvEn782KlBqJ3HL
	7Y1BgplFiv2Ckq305f/OWvKn8lII8dZZiiDuXvyWrUWaHa+Yl29wvhLaRa2kiwhZHUQIYCABvD2ld
	NJmbb5JC7U9lL6LL25r8OaEF8eW+XrmxDQQGs4Pf+7vy28lo+jMwHXpqjqgc7R6ex0ywRZzXnbkIp
	XhoyMnk5P/bthEIKlDG9qrFoYKgXFiY4tEPrLloOpcfTlf1ycYnuoeENWTAkgp+QGnq7dYTE2HSMG
	fEIzAouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPph-00000003yNZ-37Hr;
	Thu, 30 Oct 2025 10:24:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpV-00000003yIp-0tQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:24:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF6F01A177A;
	Thu, 30 Oct 2025 10:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A43776068C;
	Thu, 30 Oct 2025 10:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6E6411808822;
	Thu, 30 Oct 2025 11:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761819866; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2s4YXZ006r6JZP+ciPRm1kPsUk3RftNVPiuxZBb+ZTw=;
	b=vAn9a9rmxnbtvZT/vKNskkN65m9GgP+3q8h+3M5x//R56m/gemmelQiAgN6FMK+iR3EDB3
	btIbRjEhe40kR/XIjhowoBflZXk+RfqSvUrtcw+FQqthYO8xL2TqurCVq71N4Wf4AOyvCt
	eYbKAeN73cEKSTC4Da/4s0L72RibvqH1zz6jEWnVCEWhuKxyTvhBfrvrdcauaQeHUobGRe
	EbUwK9rs+70XURh9KN1stUkOr7wkfRiMbIp1bheey9U/ZLTXVhh2l0Lozy40njWDR11Skr
	VPw5JTiHMNTNpntmQk/035OzYvK4AP8+mUywR9mUAn3610M++Eju2SaUae5mrQ==
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
Subject: [PATCH net-next 2/4] net: altera-tse: Read core revision before registering netdev
Date: Thu, 30 Oct 2025 11:24:15 +0100
Message-ID: <20251030102418.114518-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032429_381173_FACE7959 
X-CRM114-Status: GOOD (  11.66  )
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

The core revision is used in .ndo_open(), so we have to populate it
before regstering the netdev.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 6ba1249f027d..c74b1c11d759 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1388,6 +1388,8 @@ static int altera_tse_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->tx_lock);
 	spin_lock_init(&priv->rxdma_irq_lock);
 
+	priv->revision = ioread32(&priv->mac_dev->megacore_revision);
+
 	netif_carrier_off(ndev);
 	ret = register_netdev(ndev);
 	if (ret) {
@@ -1395,8 +1397,6 @@ static int altera_tse_probe(struct platform_device *pdev)
 		goto err_register_netdev;
 	}
 
-	priv->revision = ioread32(&priv->mac_dev->megacore_revision);
-
 	if (netif_msg_probe(priv))
 		dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
 			 (priv->revision >> 8) & 0xff,
-- 
2.49.0


