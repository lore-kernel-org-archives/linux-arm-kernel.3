Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B4D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxFj6OIEBbC7e5xExdFY8pWr1S0/9CKhHj4D/T8TD54=; b=11D7FixlEQopvMxZGIpn9O+203
	eBsmmFBlAPWyH3wjJtA/wggwXiGUTA5UCJw1kuMnuPyPMFQHl0o5jqe2f33lzopRX3Fx8Clfo4819
	cKpG1HE8QFdRAg+FcpSMGt5jY7QezN1NFKsdk26aiRCo6gK+cwLVkhjOEQx/07U7VMfbbncMnjr5f
	XLXv/8PaUm2Z/kAC5nQ38yC/dW09FTpzEXM8vDqTrgWeT94tfBq7X9L0IiVeHscMgWk67TH0DMYOL
	qGob3dhmxotq5q/FEvotxCah+0EeAM3/5GQuezDSfxxTd7RKrqsETjw8gBZDElUX74VoBjafVS6ZW
	p7V+OB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puA-0000000EClS-091A;
	Wed, 01 Apr 2026 07:22:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pu7-0000000ECgu-13yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bxFj6OIEBbC7e5xExdFY8pWr1S0/9CKhHj4D/T8TD54=; b=o1/sce0ds1X3AkV64edResoJdS
	IoMLugQyw1xzvqvdftL5rcVpzya9lP7CCpzA9V9Ea3PUk/ehSOkJmcqK/IqTUKo6m83NV1MnDhjIb
	dHhk5PTt+XDn+NroY0z9dTH6jbfgzJ0Sf9yCUPfqlsgAs45VdLXbpYNS7inqEUIRwSzUGYBIChvvr
	gSUIE6RK5V3Xq11n+HXT/L2vr9MmyOwarhOKQ7CXyA1n978dmn9DCyxyf66F9jKg/quPK14ox41J8
	l4jrR+XU5inWj7XpmY3WHh8rPAJ70NpSRoWeu8mb5xTUDag5ko8RJxeNa93gQcm+KtHtdMVBGLqVB
	Rn+KKBIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59040 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptw-000000002iW-2gSe;
	Wed, 01 Apr 2026 08:22:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptt-0000000Eatn-1ziK;
	Wed, 01 Apr 2026 08:22:05 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 11/14] net: stmmac: make stmmac_set_gso_features()
 more readable
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptt-0000000Eatn-1ziK@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:22:05 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002219_306087_E023D603 
X-CRM114-Status: GOOD (  10.35  )
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

Make stmmac_set_gso_features() more readable by adding some whitespace
and getting rid of the indentation.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e868fb0c9894..7134f6c6075b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4389,13 +4389,19 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
-		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
-		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
-		stmmac_set_gso_types(priv, true);
-		dev_info(priv->device, "TSO feature enabled\n");
-	}
+	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
+		return;
+
+	if (!priv->dma_cap.tsoen)
+		return;
+
+	ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
+	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
+		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
+
+	stmmac_set_gso_types(priv, true);
+
+	dev_info(priv->device, "TSO feature enabled\n");
 }
 
 static size_t stmmac_tso_header_size(struct sk_buff *skb)
-- 
2.47.3


