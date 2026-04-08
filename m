Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC571105D9AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HKasakdQPn3aMFJOmu7e2iJDfqBG60iaErJHrMCkJA=; b=MuUj6O/BNPk/6ULzntWAECnqfi
	nesK3qevQF0M9pXKwDNdy4ab5YAX2ybbE4WSuuiMj3zzb2+geoJPSsSBHzc6vSE7mjuLKjng4aiCH
	m14IGeSA81BrxLABJtO4B0I97ZWJ+iOWCvwihSYNtBHB8nULyu0mysgQErwVd/N2avvPdM9SF1ooz
	8yL04/vuMDjKVOo0kSrojMVKIgrZ8m5j+YU749cwD2wgm5lJ6Axi/n8PWLn5JB8y/0eML00XrvBJ1
	i52Tks26oI/W3/d3gIV3bZ7/Mq9zZd05S+0saDZIJzctrzVZR1dWxBR4sXN0e2UrBUpBP0KnBqNQe
	ZNPftmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPNS-00000008clY-3M1j;
	Wed, 08 Apr 2026 09:39:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPNQ-00000008cl4-0ovA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1HKasakdQPn3aMFJOmu7e2iJDfqBG60iaErJHrMCkJA=; b=ixWTzvp4f+t4GhuXFYTrdH/aRd
	3FOKn/IkoHkbFk+C3776O3PX94GwUOmeacik8WLrjYYwBNbDmfMV00pd4hTmlTfGPNDDml1HlupgV
	uG88xMNXQGMrQFcrtf3jrvoXXH8j7LM3BRalWNTvuEofLcGzekrUAniQ9n/7ZlA2zaALx2cHogePZ
	fiZvPfiKO85jm1il2ByWPSNfmc0p6VGplrZOB7KtH8Q4XN2zg515QJfiiOiiJv6aAUhUR+CXpugjx
	FJigfk2Qg64/M4BfcWBsiMSwYXe5UPArYKR7M0Iyf1spmVIFgfYLxwNKLIUVUa/+bTyXDCCLetmxA
	pPTTWNUQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43584 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPC1-0000000023p-3pgt;
	Wed, 08 Apr 2026 10:27:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBr-0000000F7ka-032o;
	Wed, 08 Apr 2026 10:27:15 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 07/10] net: stmmac: limit MAC .debug() to
 dwmac1000 and dwmac4
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBr-0000000F7ka-032o@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:15 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_023912_259117_7C4804A1 
X-CRM114-Status: GOOD (  14.07  )
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

Avoid a bare test against snpsver which has multiple different number
spaces depending on the core type by testing for core types that
implement the .debug() method. This documents that these statistics
are only available on dwmac1000 and dwmac4 cores.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 343cf903c0bf..0caa5b992519 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -531,7 +531,10 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 		}
 	}
 
-	/* Update the DMA HW counters for dwmac10/100 */
+	/* Update the DMA HW counters for dwmac10/100 (DWMAC_CORE_MAC100),
+	 * where this will return zero. Other core types will have a non-zero
+	 * return value.
+	 */
 	ret = stmmac_dma_diagnostic_fr(priv, &priv->xstats, priv->ioaddr);
 	if (ret) {
 		/* If supported, for new GMAC chips expose the MMC counters */
@@ -553,7 +556,13 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 				priv->xstats.phy_eee_wakeup_error_n = val;
 		}
 
-		if (priv->snpsver >= DWMAC_CORE_3_50)
+		/* Only dwmac1000 and dwmac4 implements the MAC .debug() method.
+		 * As there are different version spaces depending on core_type,
+		 * make this conditional on the appropriate core type.
+		 */
+		if ((priv->plat->core_type == DWMAC_CORE_GMAC ||
+		     priv->plat->core_type == DWMAC_CORE_GMAC4) &&
+		    priv->snpsver >= DWMAC_CORE_3_50)
 			stmmac_mac_debug(priv, priv->ioaddr,
 					(void *)&priv->xstats,
 					rx_queues_count, tx_queues_count);
-- 
2.47.3


