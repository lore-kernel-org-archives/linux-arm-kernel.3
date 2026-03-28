Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31BC10D1485
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFWV/OP3CV7mhIExOnG5mhiTc2BNckmEP5LXFWoKl48=; b=H2Z13WbgcRchWjPvVIDTcNidJZ
	51V2D/GRmXRa1kZBoiiGf7bRLJjds1ORQ2iDJfjLU+Bbe/TltHQQbFwEV5ubCsqz54UMLgqluKWft
	/2Cq+YUnYhx9837J7t2dTf+4bYyk5ICajZv8F0Ceea98aoRxWS/O9+e+wImNI4bcwwYe1sluiP55M
	D5bvF2VHwn8nn2mF7E16sKptQtKJ9Awif8jQ0/XZeDhXUtpq+ia3N1EvWQ6JgEpvWACpmTElUzBdk
	xZ+A0zqWhI2YtDE4+1NIX3J818DZaWzYGmv9ZZBMvfFsSQU5Xst/PlRB5/bmGH3IuIJpUtqvzUjr2
	v49A41DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bLs-00000009KCW-3UZv;
	Sat, 28 Mar 2026 21:37:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bLe-00000009K0Y-001a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bFWV/OP3CV7mhIExOnG5mhiTc2BNckmEP5LXFWoKl48=; b=PDVIduwgls+N+1oCrWYwkkvUkU
	47/q9pobho0+pe8hxAQfDF4azieMPn6AYBig88q0wUym3Lcy2DSltnRXD65fx9iZ3s19EWB+Jcxd5
	AzKkdhbJxz65EOAXFIg4O179BSNq9Z8k99kLT1cgbMdJcLQ51ACa46ywJ931JnC/GInTYnLYpGsLL
	jgpVZzw9rPyK8tBHXv7mgNxI3wOKoej+rXJIpacvjvqoErrTdUbYzlo/Wk39medSKqc1O3oGii7ZW
	GGm0uA+jrx82jxOz40ECj29xO4YVe2V1cJgX/dTbkwnHZlhcL9YJWr2ri7wiLLHwR+0WtsLohEV+9
	jtgCl2wQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56404 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6bLW-000000007UO-38ot;
	Sat, 28 Mar 2026 21:37:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6bLT-0000000ELuX-3iNP;
	Sat, 28 Mar 2026 21:37:27 +0000
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 10/10] net: stmmac: move "TSO supported" message to
 stmmac_set_gso_features()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6bLT-0000000ELuX-3iNP@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:37:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143738_061744_2F9B9640 
X-CRM114-Status: GOOD (  10.09  )
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

Move the "TSO supported" message to stmmac_set_gso_features() so that
we group all probe-time TSO stuff in one place.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c61ce1282368..d281793cd0f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4385,6 +4385,9 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	if (priv->dma_cap.tsoen)
+		dev_info(priv->device, "TSO supported\n");
+
 	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
 		return;
 
@@ -7432,9 +7435,6 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		devm_pm_set_wake_irq(priv->device, priv->wol_irq);
 	}
 
-	if (priv->dma_cap.tsoen)
-		dev_info(priv->device, "TSO supported\n");
-
 	if (priv->dma_cap.number_rx_queues &&
 	    priv->plat->rx_queues_to_use > priv->dma_cap.number_rx_queues) {
 		dev_warn(priv->device,
-- 
2.47.3


