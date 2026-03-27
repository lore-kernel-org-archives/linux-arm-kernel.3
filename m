Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0410BA445
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+oR9CjUjeU2ZjMW8v/A1iUxamDrC7VbATO8vn8+PJM=; b=zBWlXWQmF4tc2OjRSdRTpnj+BA
	ozQbKjLSWMUZdaYnoF1tr67hlg2blPHAU3Xh4iH0Y4ZzKdNmFtmhaG/rOKnk31wlmcXT06Ac/u51s
	Okgb7lPg2NvPyV3yRXxRdHi8k8cOOoFGwdelv3Zk7D9fq05gpPa6Fu7hPIUzPYccTJ9ik7nb/AAWY
	+fBVvQT0a3MGUr+QaVL+HkLMr9Nis9g98qhFkgsHoD2g/wJ+yIQF/Sh2WcUDV7ty7BHSccd8EyIje
	QHnOWTKLgxjesj6rWeQCx5kxr9UB4fZOxEFGPDouNunVWIIZGGPLgpBdlH02MnLVRg4Los/R/PfRd
	+GMK7L7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nC-00000006zXo-2bfZ;
	Fri, 27 Mar 2026 08:43:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62n7-00000006zV4-1qUG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7+oR9CjUjeU2ZjMW8v/A1iUxamDrC7VbATO8vn8+PJM=; b=F3xpG18+8legrxdWS06GpJzL7W
	kq/pzLPn6NJLDEm/xuYNDHLD0Ea3HEYynzv0eTlm5MJbTK//qMPmNl4rJ88kKDaewKW2iGmYz0jd3
	voSh0xvxhdlj6LUci/NMtMBcOpF+i5aElxXMkhQ4gfvqQ0HwK1i32ch49b+BlJHYMrjYe2e1/xsnH
	ARjpdHE/NoYXeiAgAnuaFtJ+Q5+OtfvqICBmBUKfXjZgmjjPmbDWtpP3+VTzJpziJaPsxkyhbaZCQ
	5KyrFfnpbwnllxVCKMEruTyona+f+miZKAILSpvIvPs/M+Vezxyikm4L1yKuVXE64UhN9XbSyIGB1
	6EJSodXQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55802 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62n0-000000005oc-12H5;
	Fri, 27 Mar 2026 08:43:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62mz-0000000E3Bx-1Xd8;
	Fri, 27 Mar 2026 08:43:33 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 02/15] net: stmmac: qcom-ethqos: pass ethqos to
 ethqos_pcs_set_inband()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62mz-0000000E3Bx-1Xd8@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_014341_480778_8BBA2DCF 
X-CRM114-Status: GOOD (  10.49  )
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

Rather than getting the stmmac_priv pointer in
ethqos_configure_sgmii(), move it into ethqos_pcs_set_inband() and pass
the struct qcom_ethqos pointer instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 502f2b184a87..b9cfcf32cebc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -590,8 +590,11 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
 	ethqos_rgmii_macro_init(ethqos, speed);
 }
 
-static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
+static void ethqos_pcs_set_inband(struct qcom_ethqos *ethqos, bool enable)
 {
+	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
+	struct stmmac_priv *priv = netdev_priv(dev);
+
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
 }
 
@@ -601,9 +604,6 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 				   phy_interface_t interface, int speed)
 {
-	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
-	struct stmmac_priv *priv = netdev_priv(dev);
-
 	switch (speed) {
 	case SPEED_2500:
 	case SPEED_1000:
@@ -620,7 +620,7 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 		break;
 	}
 
-	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
+	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
-- 
2.47.3


