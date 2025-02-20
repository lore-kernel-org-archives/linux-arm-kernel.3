Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5+2puAdJcLcm7GiCQlmphHj1Zhoat9wHQNBgpT3Vbo=; b=1wm8jtHzfPGaTDm3vGIFHUo/zc
	cvXKdzXVYHbuUKsJXrKx0oyiE1HmN4ucR+uNZVdU2U5d9oNSovAB9px9iP+oBTUmdNTieoliDdWKy
	1R5HEkARdTb5+rE9CWP6WTe9z8Ds0ubH4ILwWvO8tpGpUmggNM0JxxPiNQV4ncPUG71QNt7LnY5Dh
	ta1+rrbi+C+Kcwm8nLvha66k1hAriVBOWVsCrVlieTGnFAF8ecDpmjsd4JubExBFFiMBJtTJuiE9k
	LlEst69vgBgv4DO4qm2ky/yDdKsnJUwCFb6Kh04ROdKN9fNiJwsqYmYoXecN9p1pKGzsSlDp6DGUa
	MfsvFWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6FT-00000000xLU-00gH;
	Thu, 20 Feb 2025 13:05:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl60P-00000000sYC-1aRP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E5+2puAdJcLcm7GiCQlmphHj1Zhoat9wHQNBgpT3Vbo=; b=yYaw0wopL4OQ7X2EZN1jO6ypLE
	p5HCBBxPl7aE7LDFuHH0XICq1NJRStUIbQvlvqVe7IrRMGv0BjX5rUpVBOWVTmVmBFPzLzwm01F9q
	PcRBWmvgBJ6g04OakL0xBgXxW4O7qTY6r4NaQPuzXNbu9cRjzU2wF7unTUT3CaPlv8GPRjmeuL5MQ
	vh+q7LWxMGUwFkuOhVu5uhH09ZhXekiRslfykjY0b2Gtw1WTJFOdGlpZnLZnpAUrzFkgOnXG3jkvL
	H71apd62aQzGVmuVJ1RSM0l6vXZ5OuM38iUuywjHyx+CkVp5UXl0eTu1yR8drfckJYeWLVkM4e0cC
	18nukHeQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33726 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tl5yK-00010I-3D;
	Thu, 20 Feb 2025 12:48:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tl5y1-004UgG-8X; Thu, 20 Feb 2025 12:47:49 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: print stmmac_init_dma_engine() errors
 using netdev_err()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Feb 2025 12:47:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_045017_408262_E3B46D09 
X-CRM114-Status: GOOD (  11.18  )
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

stmmac_init_dma_engine() uses dev_err() which leads to errors being
reported as e.g:

dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed

stmmac_init_dma_engine() is only called from stmmac_hw_setup() which
itself uses netdev_err(), and we will have a net_device setup. So,
change the dev_err() to netdev_err() to give consistent error
messages.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4d542f482ecb..218ecc945e9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3034,7 +3034,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	int ret = 0;
 
 	if (!priv->plat->dma_cfg || !priv->plat->dma_cfg->pbl) {
-		dev_err(priv->device, "Invalid DMA configuration\n");
+		netdev_err(priv->dev, "Invalid DMA configuration\n");
 		return -EINVAL;
 	}
 
@@ -3043,7 +3043,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 
 	ret = stmmac_reset(priv, priv->ioaddr);
 	if (ret) {
-		dev_err(priv->device, "Failed to reset the dma\n");
+		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
 	}
 
-- 
2.30.2


