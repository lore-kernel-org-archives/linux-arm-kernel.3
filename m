Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C37AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1osmxLM0JPtN1QjPJqhrKT1uQMk9kT2l9BrM2YTPnUY=; b=zfxTLS8Gws2qrY4+r64S00HtMR
	hw50VN3fYwQZIzk3mcuvrXBkzKo3XIzHTRwqIoAq5flRNIFKxTpVd/1nx3QYTJLMEf9qDGY/N1O9F
	oP3VWZAKDwkFEo2H7qu1xpV03vBWo/243xZzxk5v/PU3lCKGvdCG9USmm3cqyy4M7yNBLlXYVm4Yq
	p16DceJBTJNbCz9U9+MHeeK+OsHjY/8ypT8dSRTj/1eq0kJJuk8eRhBWC4ZsT3c+8SaxJPVrE34Kf
	0/KYtlvH0LHEvOTiTXvVzgZSgnRAPKycQ5io73IuT61RjfacqD3Tx45wTD7ZVxgAmBOqAdtaXqgoB
	HAdUTp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDAa-0000000BKEV-1RYg;
	Thu, 06 Mar 2025 15:29:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD5C-0000000BJDA-1sSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1osmxLM0JPtN1QjPJqhrKT1uQMk9kT2l9BrM2YTPnUY=; b=RTn0a8A+Hzq3+ziFUCBoaSW9Ed
	2wAN0+i9k/4vAN13PesmIcZsX697ts0SgZZWVEy4QPZnEKbutgeLeOOVIabcKi2C5WPrQ7uXGbBll
	Eh5MlD84xnyWZgJggLlRcIY1pO/Cq978SmslVCWWqnzD6nCCsRz+TJ8wOP4RzYWNwKl3oogfCI/p5
	sy1fO16BhgEuLRFPbR09VHOXYeKimQO81p6r7nw0kdTXKs5CjDI7BfLA9L65pxdus4JciLViUbmgQ
	KPKLf732a+ZBpfM48oOCssNNAY9KgOOnLZUn1OGwsTM7wZw15LCaJkgmMkX0falSDih6rtJC4Un1H
	Uypn+EeQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58532 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tqD57-00065S-0l;
	Thu, 06 Mar 2025 15:24:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tqD4n-005Xx6-3l; Thu, 06 Mar 2025 15:23:57 +0000
In-Reply-To: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
References: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>,
	 Thierry Reding <treding@nvidia.com>,
	 "Lad,
	 Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: block PHY rx clock-stop over
 reset
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tqD4n-005Xx6-3l@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Mar 2025 15:23:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_072422_477961_A56B8E3A 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6924df893e42..037039a9a33b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3096,7 +3096,10 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
+	/* Note that the PHY clock must be running for reset to complete. */
+	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_reset(priv, priv->ioaddr);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
-- 
2.30.2


