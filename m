Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09586D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alPn9o8ewPxsbOPsRLwsXL+u+H9tvwotLTBjFhbxb9s=; b=uFy6Nu0OzZRh/+LlEdCedN6Wxi
	0IobMofcryQjxVvDP+pkXx1w7e84hnnlAkOcA4smushFVINci0+794RowoKPgJdoZ5hMTuhmMyJIG
	Nc0Cq+1IV4TnaWKAiP26Mej4wZp5Csq4NU0LC+tWVOay9CPjCK2bcynwG7PyyUUAYf73OTOxHHAh0
	EPOieRRdUhpiSL29BUxDJR5p46LfuRSzc0dajNlKCbBjOb7TrVy3q5zB3fLcJkZ2QD23cnbGV4VKM
	EY1Mfp5Qoy4MpBzjIW9VPSvaedD2MowvQZoIsYRQCy4GA5Bk9E9Y+6xkgcIGEDbrZxoPr7oqauslG
	S7mOt5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puF-0000000ECrQ-35a3;
	Wed, 01 Apr 2026 07:22:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puD-0000000ECnZ-3X66
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=alPn9o8ewPxsbOPsRLwsXL+u+H9tvwotLTBjFhbxb9s=; b=1MX05kwMDnGsZEqsRJbKB+ZR2o
	cFODAf/0XkUTtVkekuwBDJGtopg5rtuD2yEMu4fuMGYmuvaw0rlPkOBlP0rKRTwzGqY2kDGAK1zAI
	uZTjOYlZuPmRXKYLM72sD23mhic1XNO23CjumH1fhTR51og17igo3PxONsIid74US9Dx+oWQb5FAG
	9C50G/+u2ddRZpWIf/2ZIzGce5VDQxgniIRJXxkqWiBGPEPfRbycFP3H8u89GcvtoLdXdsvGRDPxC
	Uk2+ZweaKcDXIkNNG5gwB83CDSeayWJLpufgYVfDL+gRPfbFth3o4zdGw4PvdGpIj/HHVnAafICCQ
	CcA5EB/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59464 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7pu4-000000002jA-37sy;
	Wed, 01 Apr 2026 08:22:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pu3-0000000Eatz-39ts;
	Wed, 01 Apr 2026 08:22:15 +0100
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
Subject: [PATCH net-next v2 13/14] net: stmmac: check txpbl for TSO
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pu3-0000000Eatz-39ts@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:22:15 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002225_900319_306C1401 
X-CRM114-Status: GOOD (  11.67  )
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

Documentation states that TxPBL must be >= 4 to allow TSO support, but
the driver doesn't check this. TxPBL comes from the platform glue code
or DT. Add a check with a warning if platform glue code attempts to
enable TSO support with TxPBL too low.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5286ad6412a3..406c32142d90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4388,6 +4388,8 @@ static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
 static void stmmac_set_gso_features(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	const struct stmmac_dma_cfg *dma_cfg;
+	int txpbl;
 
 	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
 		return;
@@ -4397,6 +4399,18 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 		return;
 	}
 
+	/* FIXME:
+	 *  STM32MP151 (v4.2 userver v4.0) states that TxPBL must be >= 4. It
+	 *  is not clear whether PBLx8 (which multiplies the PBL value by 8)
+	 *  influences this.
+	 */
+	dma_cfg = priv->plat->dma_cfg;
+	txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
+	if (txpbl < 4) {
+		dev_warn(priv->device, "txpbl(%d) is too low for TSO\n", txpbl);
+		return;
+	}
+
 	ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
-- 
2.47.3


