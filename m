Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2063BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6W0DkUMzifwuDMlc9DiSUqRLpgMXFIVqdSysIfR+dbQ=; b=OJH/SbEHj+XcHy/FvK3prF4t1N
	Er8PmYUhue+N7XloaDAQ6XfQxIPUClqce7YHq88Krxx7C82LM/yVs1t67eH8+Pw1c/4sM16d5dYoA
	Zbdi/8TLWEJ2TbxsnxwHhup5NvsrdS1eFyXakhunmfOm944Y7CoUpOkKzWJoWldQ0Udw0HPiOwgbX
	LU5FlXGg0RbdjEjsMxAlDvEnOvLDMjYKmHU+CaFPUn4QjxpnxhuGgtM1OtcOPgYaNLfj0Odf/mcOx
	2cSzcZxIvoREwYB/uH9Z7XgEw0SuhcgHuRfQaj3SHNJRS7x9Cl1VoVRz7TdKkT6BEz/alwavoU+Di
	cU6YVc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4g-00000009lzp-0uMj;
	Mon, 03 Nov 2025 11:50:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4d-00000009lyA-2OYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6W0DkUMzifwuDMlc9DiSUqRLpgMXFIVqdSysIfR+dbQ=; b=gYh3Se3MQRjmnvmEL8hRKs1HC6
	EHX/zY77CnBzHwWKNZbz6WznbHtCMypMvDNyQFMsffbLDiOomjpAe+TyiqHSPswFC/zccbnX8Ek0K
	t0VwQ3Z7/d5V0QYBYDPDdy1l+xmSuwke8rdmLABJnZdjUcjmiOxtF0A4oD09lHC7T38iildrHsTTq
	f3sQqOm8ERg+JfB/xVWi0Aq1pUyYIOkIOyo6lwc21daWSOz4OgGFvXD9EHTpyHZ8gQzAUJcdO/lDu
	0eVL8bsL5BQmIYLUAKy3HySTgtBhIJzWoaEvyUwFmr9nxtJJBG9ytrdju8NXvoifDzCxCvLzo2P5/
	JMZu3J5A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39006 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt4T-000000000fS-26LA;
	Mon, 03 Nov 2025 11:50:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4S-0000000ChoS-2Ahi;
	Mon, 03 Nov 2025 11:50:00 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 02/11] net: stmmac: s32: move PHY_INTF_SEL_x
 definitions out of the way
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035011_613719_9B325627 
X-CRM114-Status: GOOD (  11.11  )
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

S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
cores as they use a different bitmapping. Add a S32 prefix so that
they are unique.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index ee095ac13203..2b7ad64bfdf7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -24,10 +24,10 @@
 #define GMAC_INTF_RATE_125M	125000000	/* 125MHz */
 
 /* SoC PHY interface control register */
-#define PHY_INTF_SEL_MII	0x00
-#define PHY_INTF_SEL_SGMII	0x01
-#define PHY_INTF_SEL_RGMII	0x02
-#define PHY_INTF_SEL_RMII	0x08
+#define S32_PHY_INTF_SEL_MII	0x00
+#define S32_PHY_INTF_SEL_SGMII	0x01
+#define S32_PHY_INTF_SEL_RGMII	0x02
+#define S32_PHY_INTF_SEL_RMII	0x08
 
 struct s32_priv_data {
 	void __iomem *ioaddr;
@@ -40,7 +40,7 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
-- 
2.47.3


