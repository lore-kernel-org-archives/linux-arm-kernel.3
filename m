Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D524BECD6FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 00:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/dPLm7I5UAJCKjfkGzkcsxjUOFy/EJP1DLfT6d1RYo=; b=uY3WtfMlcxYGgdkG1kriialOw9
	c9TfzoP5OprQYeIoM1Dkbl5/064unh3mngGqlxFmGoQ1OvKsftn5uB1X7j/UdoXD52wnvfDTUBA/2
	SFLtFWhgsD/R+5tsAcs6Tc1bmh/qs/Ncv35Uujiz6mTEsAgK42rhwXbRHRx/kskQzYDBsw9UyWu25
	/TRquv83CcybWQpqgp9jG8hPYdtMgSZOgltAT2khAZqBHpcxUPPXUEXwdtanmlbQsaIQE1YcF7ZT4
	MFbr61jmuPyr0+HIyUy+Nmw3IL50oJxqGjtFhJOEriSyxzVxr6CQQkB1wzpvrSLnphp5rIuUjQ/tw
	YNUgOGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKQ0-00000001De3-49XV;
	Thu, 12 Feb 2026 00:18:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKPy-00000001DaG-316e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 00:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g/dPLm7I5UAJCKjfkGzkcsxjUOFy/EJP1DLfT6d1RYo=; b=GGmoLjNjNPkCYfDu+72tKCarmF
	mdz9BFjz1zpTPw7dSqyBdSL4bpg2r4QzDo+TDODbsQNSW+/levMLEZHYvKhqh/sCB9kK4EPjlwPeS
	I+FvewPZLZ9lAPJsTLzs2QvUeqHxLyUighJgeTkRsTErS7j37IAHjxJyTyN/9ozcDkOEWXO02OBHB
	ngeTK+Grjpn7tA7+/zbCWKxLUcDwdVhQ2OfvTBqTB757PHfnv7MKbiCYHvL5gUJoDyf5uUhS7FBKz
	ypORCaBXnLkGtg+nqN/qpln6Rlnqe4Bnj5LQ91cDPoa3wULz/Knm52fqtxAJql8JteDxo31abNS/F
	s5rhLkqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51176 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPf-000000003qp-3XI5;
	Thu, 12 Feb 2026 00:18:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPb-000000093mx-00Jj;
	Thu, 12 Feb 2026 00:18:27 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: move SerDes speed
 configuration
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_161850_756622_39DE6F6E 
X-CRM114-Status: GOOD (  11.27  )
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

Move the SerDes speed configuration to phylink's .mac_finish() stage
so that the SerDes is appropriately configured for the interface mode
prior to the link coming up.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cd6d1660bdb2..153f6abc77cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -629,11 +629,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 		break;
 	}
 
-	if (interface == PHY_INTERFACE_MODE_SGMII)
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-	else
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
@@ -692,6 +687,11 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+
 	return 0;
 }
 
-- 
2.47.3


