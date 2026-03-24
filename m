Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5442F54AAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=bPCumZEB1gvTrXjmW2WH+na9F+
	HB+NbNzaOnAgBLphwgCuqgANP8TsYuMxZXaSDEsfrXcrphdZOedQ3ZgEztuKzqwuZI5MEBYaQGhfz
	j+/MFlQpWPfywTvX5iyhvPo7X6VFKnSjqLRXOWcZgRKgCflp04i/LqoYRpVqglj1xNkDBjsWC+y/s
	zfUwXehIfpye/pCd6aKL80Vjl1mwmoFwOQnQnFIcC5shBkIGNxGrrPNiwbJvgKlyd5LaZlOLZXM3r
	qk3QLPBp03PSDEOCukn3jgIKcArAe8lgyk/mo3mzH2XgxMiZB6C8L5FTgPGEpTVwiaU9zxj6wXGsR
	ovg248dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Xq-00000001UyP-0Cij;
	Tue, 24 Mar 2026 13:11:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Xn-00000001Uxp-2b61
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=sUz2hAzT0HUN4oDR+UCrODNJhS
	83EWW5VRnTE/V3hPLh/EMebbvQJX9RCdbWM0TPhmrgE0qFctodc0cp0omoJ/xwKfs4AhS+UQD6j6E
	yGP7uz5vDNtj+8VIYrpHzW6HlhH005+EeLblKUogr12QuEfqB9j3ZOI4kWdhiyeyteckA3H2npNmm
	tc5bqXznUBeHrioYPDBx2uGW184lP9caDurEWaNpU+MjDPeu/Vk+K0XEJbIksUxSQH6qEcS3QbkDA
	vMT/M/9bCJ48hHkBl+QX78rcMDzeBavkH7R8q7547FBYxr5VZTlyR+DzNSdKt6Oqu6kywQJk2c8RH
	Jr8BGh1A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34644 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Xj-0000000022Z-0WVR;
	Tue, 24 Mar 2026 13:11:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Xi-0000000DwVJ-1gnA;
	Tue, 24 Mar 2026 13:11:34 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 01/15] net: stmmac: qcom-ethqos: remove
 ethqos_configure()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Xi-0000000DwVJ-1gnA@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061139_660969_CB599132 
X-CRM114-Status: UNSURE (   8.87  )
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

ethqos_configure() does nothing more than indirect via
ethqos->configure_func, and is only called from ethqos_fix_mac_speed()
just below. Move the indirect call into ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a..502f2b184a87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -623,18 +623,12 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos,
-			     phy_interface_t interface, int speed)
-{
-	return ethqos->configure_func(ethqos, interface, speed);
-}
-
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 				 int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	ethqos_configure(ethqos, interface, speed);
+	ethqos->configure_func(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3


