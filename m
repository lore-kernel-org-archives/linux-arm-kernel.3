Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB225CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eplxvysfx85LPhdZ5hWcUUD0i0J3w274wHdDz18TaWo=; b=KLQZdfpSfBJ/Ewqcc7BVBo8YoJ
	x2gGxyO2AjnjD9UmLiYbARSjAfg6XRiXohIzP0agkcKBIK4LeMWNiZlJtEPhel+z0OKilKg83nwd8
	2n/Xv7Rv8y8cr223jkPwIG2HAofLSG1/PjE2lT81dJOHwKwDwHJjniGFTMJ/H2s25LNOaYO3425qJ
	MCh1TzhKJGCBoNZveqk00bCdhTMj7/Q5r9UulAjyfXDUa8+6sBBzALTWoa59f4H8XMTjs4nwFJNpH
	51o/GtrIVbuBQIqG7oJnphb54yo8eK7y3Z4xMVxIj8sn4vnbkSNJN9WPrnBG3LTS3jSZZ5pYGhmot
	ACEIxoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945r-00000002FQK-1bTe;
	Wed, 15 Oct 2025 16:11:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945o-00000002FM0-0SCy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eplxvysfx85LPhdZ5hWcUUD0i0J3w274wHdDz18TaWo=; b=HMbUq3eIlPgCK522VNy2nopUYq
	bQGaUVC9JCVn8ftCRCvjxzbPLuQVr0BInbCKKAINI9eipgUEdzA1LAJ4Ak9GXzR4Gvc5YGjufyWIT
	WuSyNHpllPjvr9KXB4GDd/rQOpVNDYr75tlRHAc1YPiajIzKp7IcrzsDRAVtUAzBIDUZkcwd6KLo0
	UR/ghtOA18pTwvk0u/0zSO6cxDIJBbPwqaNp1VN00Usvt0kbsloAe4HPQG4BM27zjSzDyopkcYcNj
	JWcpXCi3QT0vw19qmqOp+R2ivohoAbvoNgn1tSVfu2v3AiX5ynLyg4EtXfQUX8NyCh/wu/PKgYbod
	BCXzzslg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42348 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v945g-000000005Ar-3gCO;
	Wed, 15 Oct 2025 17:11:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v945d-0000000Ameh-3Bs7;
	Wed, 15 Oct 2025 17:11:01 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/5] net: stmmac: rename stmmac_phy_setup() to
 include phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:11:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091112_150583_805D3BC5 
X-CRM114-Status: GOOD (  12.11  )
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

stmmac_phy_setup() does not set up any PHY, but does setup phylink.
Rename this function to stmmac_phylink_setup() to reflect more what
it is doing.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 500cfd19e6b5..c9fa965c8566 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1185,7 +1185,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	return 0;
 }
 
-static int stmmac_phy_setup(struct stmmac_priv *priv)
+static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct phylink_config *config;
@@ -7642,7 +7642,7 @@ int stmmac_dvr_probe(struct device *device,
 	if (ret)
 		goto error_pcs_setup;
 
-	ret = stmmac_phy_setup(priv);
+	ret = stmmac_phylink_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
 		goto error_phy_setup;
-- 
2.47.3


