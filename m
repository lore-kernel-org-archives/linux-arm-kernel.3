Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4316C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTLXFDLqNr8w0l4M+kAbKMCxfWgBwXHT6fzNY44FTHo=; b=K0im/TrLnY53ONBcFtJym8Atvr
	fh8b91tdegmoyvViMFMUYorT2oi0QkJyabAgiRTBoVREDoX1f1bMhGtfQaby0RMmOhTESgZLWQwkb
	C/F8IGda8duac/1wwphkPyJZiD1syeGIUbKo7sGlaGk/m2x4ZNPxiX39AgctugzXx9f+xokd9C9wP
	X0Ano3RUk+BAZEhndBwqZw3/UzRQraz1XnWjf+FxAWXmOwY9RZ+Kx7Tt3q3XwDhX4R24S+TgUsmu0
	c+DDcBAvUb+0d8pk0FwDkH71bDnCyq85M//Sm/Q9anTQQc6Y5RFt/JsddB/nVLDeZiAFxNy1MTloQ
	AUh6Pi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9MT-00000001qsi-1cF2;
	Thu, 20 Feb 2025 16:25:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9FV-00000001odZ-3XEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gTLXFDLqNr8w0l4M+kAbKMCxfWgBwXHT6fzNY44FTHo=; b=oPBtLeiCZioel5S0vze3Dv/djL
	x4WqxS8113VtwsR9GSWnsPmv6YdnkSU6me66Q9PM2T5uo1dA94EBEgWd/4BzdnyyqyxCWumwZQRuQ
	AlccaHqivk3iS+0eMeuUQriPK3E+5DGUkSr2mW+X9bQabGi9B+dRZJfOzbIP0rY+G1OIeAmoAnG2e
	w7Gugev8ml4SScaB56TI0/lGLWVsVOX5Uo1j3ktrUIrUfdJuICjUQ9AmONZ6VX0RocHYDyDDZU9wv
	YJ5VS1+LXqcljGvRA7uvyyLomPSaOdWvUF04r07/Z4iDNBmKUMt2OvF7KrhvUNxJI76kMqLGoKPNQ
	veUrkKjw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44456)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tl9FG-0001b0-0t;
	Thu, 20 Feb 2025 16:17:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tl9F9-00017G-1J;
	Thu, 20 Feb 2025 16:17:43 +0000
Date: Thu, 20 Feb 2025 16:17:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: net: stmmac: weirdness in stmmac_hw_setup()
Message-ID: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081805_883765_D369491A 
X-CRM114-Status: GOOD (  10.54  )
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

While looking through the stmmac driver, I've come across some
weirdness in stmmac_hw_setup() which looks completely barmy to me.

It seems that it follows the initialisation suggested by Synopsys
(as best I can determine from the iMX8MP documentation), even going
as far as to *enable* transmit and receive *before* the network
device has been administratively brought up. stmmac_hw_setup() does
this:

        /* Enable the MAC Rx/Tx */
        stmmac_mac_set(priv, priv->ioaddr, true);

which sets the TE and RE bits in the MAC configuration register.

This means that if the network link is active, packets will start
to be received and will be placed into the receive descriptors.

We won't transmit anything because we won't be placing packets in
the transmit descriptors to be transmitted.

However, this in stmmac_hw_setup() is just wrong. Can it be deleted
as per the below?

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2913f003fe6..d6e492f523f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3493,9 +3493,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

