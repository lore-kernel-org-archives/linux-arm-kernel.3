Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qNx0Ni/kc8SkhRMYGZFqBomWjfjeFGuoDaPz2DpBLg=; b=PhSI+KzwdWIr9J9ubyfbO5NLVS
	hyg2dSe/FIeSzvRF0QHehCaB8qk6qOk2T+Po+UhtKP6tfj/6foeRphz59wUxIeexyGCSCkKJ63cUX
	+SLuh6O7cbirUe+p9NXdjDTvI0p+EeOL7fqUIzZmort0i+PrcU2ylE4pS7s25yd23isi/D9x+DBNx
	sXVfNuEGtyjTQcb1Anj9aFdMxUpNNwje5OdqymRivAhrRnmYHe/klkytwYZSmV3OPEpAAiH9v9stJ
	wqwofrG5k4Ts443xCYcZLMy6gGvsq8zPFdZ4OUXnHGRZIZLGo6Lrtk/lcEHFSomwows5vgXLSs/2e
	naD07cSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5M-0000000FNQY-1jfV;
	Thu, 06 Nov 2025 11:23:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5J-0000000FNPV-2k4F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+qNx0Ni/kc8SkhRMYGZFqBomWjfjeFGuoDaPz2DpBLg=; b=HCDmMuFWVCBxIY/eIwflhjO8q7
	W4SwitUKmyqnX+gbgti54PyNSxS0k/H/Z0//RLLlRZGsf84qDi4XL5ghrUWxMCdIzXAHQUGjkTn+R
	2qU+JU/bZ6xabiRp/TE8H+s5nIhTcPVMoHG48rdjj2GvGmKWx86bMpJCl/71hlxOJxZ/vXNvWCSfB
	2DsH73sjpJP2wxzDraT34Zck/sfmqavnIH/tf4DM3Y4nAZBAk26gNMtyc58uY+1f3tE7/kY8ab0uZ
	29tgwARwYR7uNOQxVK7F67X1NIR3lIo48CcppS6Bqp3jUlHkMgVvOFedN5Zt5jMpAhLffh2VwNnYh
	EZgh5U/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44978 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5F-000000004uQ-2bXZ;
	Thu, 06 Nov 2025 11:23:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy5E-0000000DhQ7-3cuy;
	Thu, 06 Nov 2025 11:23:16 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 2/9] net: stmmac: lpc18xx: use PHY_INTF_SEL_x
 directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy5E-0000000DhQ7-3cuy@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032321_805361_96200444 
X-CRM114-Status: GOOD (  11.44  )
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

Use the PHY_INTF_SEL_x values directly rather than the driver private
LPC18XX_CREG_CREG6_ETHMODE_x definitions, and convert
LPC18XX_CREG_CREG6_ETHMODE_MASK to use GENMASK().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 66c309a7afb3..895d16dc0a4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -21,9 +21,7 @@
 
 /* Register defines for CREG syscon */
 #define LPC18XX_CREG_CREG6			0x12c
-# define LPC18XX_CREG_CREG6_ETHMODE_MASK	0x7
-# define LPC18XX_CREG_CREG6_ETHMODE_MII		PHY_INTF_SEL_GMII_MII
-# define LPC18XX_CREG_CREG6_ETHMODE_RMII	PHY_INTF_SEL_RMII
+# define LPC18XX_CREG_CREG6_ETHMODE_MASK	GENMASK(2, 0)
 
 static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 {
@@ -50,9 +48,9 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	}
 
 	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
-		ethmode = LPC18XX_CREG_CREG6_ETHMODE_MII;
+		ethmode = PHY_INTF_SEL_GMII_MII;
 	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
-		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
+		ethmode = PHY_INTF_SEL_RMII;
 	} else {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
 		return -EINVAL;
-- 
2.47.3


