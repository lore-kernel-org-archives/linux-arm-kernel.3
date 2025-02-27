Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D9C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0ZbMy4p+KTtbwsU/BR1wCC/2lakW8Pk7WJBqfnp+Fc=; b=SR6oYKyjmZtFFJnEHEm1XQZpVx
	R7TOXmsHveV616dnMhvnWgK8ubCBuH34JZNe9aSu1iDSFgV9vaPwoNEzathIkBAmHccT2cQKC8Tvt
	pwnrAaM3LNd4A17bTBbsN/Q9U6vHiYXiO9dwQgeoCeH4uD2hB3Se0r0AKZMFRVRLaMcapRtFnD42c
	ztYKLdK1Gd5W3dJKRCL98sJ/87ZDF09KZN7hLIntiCXqnwOQ5KDDe34O0C/WOTNEAFMhTfh3wxtQL
	8P8To90wYQkEBs8Qr3YPCvYxv58vqDx+cJv0yT64e8m5yGvERzCfh9Zc9ybgYr2uBxab6N/5tgJ1Z
	+6l+IgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaEB-00000006rpm-2krG;
	Thu, 27 Feb 2025 09:30:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna1I-00000006pp9-30bR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d0ZbMy4p+KTtbwsU/BR1wCC/2lakW8Pk7WJBqfnp+Fc=; b=gL7xQh5uQB8sVK9zwRoUrMfQrE
	TS6a7qQ7LjwLDqPHwUgbLpD8ahhwwHfl6sn1WxRPBEZxMlqvNg5rGEq8Y9I4afJSfJcFRyL6rIE/U
	N7qey8YHNIdyatVyJPdtVzC35TZXWZbPzta6l/W8TbLYdpnSxAsj2nfMhNPPdlCBaDfbajgrgaZQw
	sF3qB2XMdNU2qkNdLlYNKceIdf4xrjzupOqQZdozGL2a5YpKmAHm+rHRS+pOiNLMAZQtM/dX3dee6
	SmYZD9+vGi/WikR0Vsi+9bbicQ/mM169h2ryEoz5f42+X4kD7UdKj/0O6+g7iBJghsqTcJU48Q/sY
	JqDzVN1w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38316 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna1E-0006dl-21;
	Thu, 27 Feb 2025 09:17:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0u-0052tH-KQ; Thu, 27 Feb 2025 09:17:04 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 09/11] net: stmmac: ipq806x: switch to use
 set_clk_tx_rate() hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0u-0052tH-KQ@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011728_751862_C54D64A9 
X-CRM114-Status: GOOD (  10.10  )
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 7f4b9c1cc32b..0a9c137cc4e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -260,11 +260,12 @@ static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
 	return PTR_ERR_OR_ZERO(gmac->qsgmii_csr);
 }
 
-static void ipq806x_gmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int ipq806x_gmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct ipq806x_gmac *gmac = priv;
+	struct ipq806x_gmac *gmac = bsp_priv;
 
-	ipq806x_gmac_set_speed(gmac, speed);
+	return ipq806x_gmac_set_speed(gmac, speed);
 }
 
 static int
@@ -478,7 +479,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	plat_dat->has_gmac = true;
 	plat_dat->bsp_priv = gmac;
-	plat_dat->fix_mac_speed = ipq806x_gmac_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = ipq806x_gmac_set_clk_tx_rate;
 	plat_dat->multicast_filter_bins = 0;
 	plat_dat->tx_fifo_size = 8192;
 	plat_dat->rx_fifo_size = 8192;
-- 
2.30.2


