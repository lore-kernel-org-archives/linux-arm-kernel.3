Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133F8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChcytkVLrz+IKUJS3Cck/qqHKiLa2YGrU2v03wuGGrM=; b=QNFFf3lwTwQ7hK4Ye5mbycxrV8
	eZb85lzQ34nG09j4TqGRTAutqPSi/CCpgroJtt2jZ57NM+dHeqMzH8Xk+7QZLnJ4hjMs3j1PWlOHe
	eNW5ec3qEeCKDsyGaH97tE/qtMpY0a3KF+HiDcEQn4sf0fazZpcprB+5tzsepz0HOkOO6RPKltkmw
	TTKrHrIHq89P8HxHXdzDj26ak27iUrvG50WjNx9L9C9RRntg8Zat/MeSyiN7Zrhh0sXfhO7RdZ0Uk
	d7NDQPjH6Pd5/b2GEeCdir02hZy42WlOIz9oET+TNWX4NXw1eujVs7kl7CFcXRKRK0JUtNXIKVtQF
	wRrM5iKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytqK-0000000Cb4b-3Tu5;
	Wed, 17 Sep 2025 15:13:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytqE-0000000Casy-0IF1;
	Wed, 17 Sep 2025 15:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ChcytkVLrz+IKUJS3Cck/qqHKiLa2YGrU2v03wuGGrM=; b=mvFAhoOslfMXI6PpLYMlk+frsP
	A5cengYY0t6QZcdChxdPgmGo+ipcwiIcPyi2US5P9uC3kBocp2y9pf2sPs6KqkmRVXIzzhNG87Mkb
	iugRGz6jqqB9LyxbZEtthJlUPBsl/NIVom9Ks0mvfrrbh53EJqOpQzmb5/u4lMvIow8qD57kP4XIZ
	x6xOYDqMRZGdfqtRANEiOpqoNx9UtoRESXyAffLyBt6F5kjpc9mfmbLwnfkvrwOk9s/QeklW+0Kj3
	BQyLhO7rQezSrusw4pBk7Yg8+mKrLMNPa7mHN+9WbaUcHqkhsk3kx8TchCH4mPCGtiypxU0a6suV6
	brzJOU8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32780 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpq-000000004mN-0A9j;
	Wed, 17 Sep 2025 16:12:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpl-00000006H2k-08pH;
	Wed, 17 Sep 2025 16:12:37 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 08/10] net: stmmac: sun8i: convert to use
 phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:37 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081306_189313_30A1291A 
X-CRM114-Status: GOOD (  11.24  )
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

dwmac-sun8i supports MII, RMII and RGMII interface modes only. It
is unclear whether the dwmac core interface is different from the
one presented to the outside world.

However, as none of the DTS files set "mac-mode", mac_interface will
be identical to phy_interface.

Convert dwmac-sun8i to use phy_interface when determining the
interface mode rather than mac_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 690f3650f84e..5d871b2cd111 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -974,7 +974,7 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
 		}
 	}
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		/* default */
 		break;
@@ -989,7 +989,7 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
 		break;
 	default:
 		dev_err(dev, "Unsupported interface mode: %s",
-			phy_modes(plat->mac_interface));
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3


