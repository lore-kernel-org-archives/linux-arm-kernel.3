Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B07CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etITqC8jMduEZk9ztensAl81JNZKmJfNvh2+zyGxRok=; b=Mb9TLhM1Mn9HJC5vWZA+iQvqxF
	9mStLL//tn3Pj77v9l9EiE4lCG/lMStUePfiATb5TOo/ZKOAEiFJLcNy59oDM5sW+l6DIzH9Poayt
	idHaFW8NkxuoNG2AyxD+VBdcDYXoVNyE5EFugQiwZPGjXdIsliJ/0zwQP34tILpDT+uckViTqptHC
	nlHJEzm3drssboY5ovAoUb+SkCYR3Ah7lyGk5fYEQW0c58POuPia1kbTi/2ODt055e0vTFQTVDcOr
	hgGX8XpFw6GifRcOogbBlC2TSqhapHEWvtsLC0UIePBBWV+jS0qJEqfBELpT9cFNZXxQkKoKT9gfF
	zq58eP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpX-00000003yKD-1i3M;
	Thu, 30 Oct 2025 10:24:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpU-00000003yIQ-0RfE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:24:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0EB71A1778;
	Thu, 30 Oct 2025 10:24:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86C9F6068C;
	Thu, 30 Oct 2025 10:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F29C102F2500;
	Thu, 30 Oct 2025 11:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761819865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=etITqC8jMduEZk9ztensAl81JNZKmJfNvh2+zyGxRok=;
	b=Owwl7WWybvrT1Z8Yo3fx2q4sNl0TlauRyJQiLrYVmeIGttEKzq33li3cuSW0SuI1hwWscT
	MIKA1eId/jlI1o4zrLrgRKBj3pO5ms9JRHFOmMvogAOlXZFw5r8LFhTL24ij6WIjZlv1Cw
	7YPSUCIvfaYBJK/yWcR7zcLpKe0R6SJ+v597rH0IAr65DFD8DnTh2N5S8ZGR9kSDrrq1BV
	YHCJxP2q4NfzrQSJn5Q0cRBp/C853ssipiERIpAgz5S7RTDI6KEcPgmmBSeK2gt/sG7B2/
	Fr0XeScLi2VeJzON8sd2OygTUrN2rNpbBKmo6XlzPPLDNAj65o0oDPcdyem5dQ==
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
Subject: [PATCH net-next 1/4] net: altera-tse: Set platform drvdata before registering netdev
Date: Thu, 30 Oct 2025 11:24:14 +0100
Message-ID: <20251030102418.114518-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032428_275279_1708B8A6 
X-CRM114-Status: GOOD (  10.74  )
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


