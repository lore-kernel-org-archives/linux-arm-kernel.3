Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EE6ECD6FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 00:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwWbitH+GuPwOyvwgJ9+eScrVUE1z9CKi71LbQpX4Fg=; b=jXvZI1UxrF5iR9T20LysIudxD4
	rmA2Ysr4VC3v9NFOju5AwYaaqR6UlNsRspdC1KTvVwgZ3XvnpV/uqfpaQQRcMiv57pIuTHalJpj2p
	nCk/A1EL6gziEW5nhSsYTtZ5h61w5QMkCjiFv4HHw6aBPIkl89J3CWr2a83/v4nzOjtar78DFb/UQ
	YxuBkKSl4nTf9MtVZKxRk4BeSDx4qEhSqEfK9otqqGIeu2EAareVXiWOf59d91m2uJrU5GpQkwmSu
	SeLAIoNBI8g+xz9RvopTpzDiXPc+kHwhZzsSa/4CfSjT5SnIZYTUFHhn49YgbBopqldG5Bt5dzYQn
	ZkYcjjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKPb-00000001DOJ-1wBf;
	Thu, 12 Feb 2026 00:18:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKPX-00000001DLh-2GmZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 00:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JwWbitH+GuPwOyvwgJ9+eScrVUE1z9CKi71LbQpX4Fg=; b=Axjaxrp6i2/OcAON1LZ4WLe03g
	6PWUfBYUg6MdDT81/o08qikMmNVNuZDk9aLVx1L4ste7hO4HaQ8b8NF5JONmmUGsLSooNlRKGfxLq
	m+gnnUGk4tuJPpJvpNynkmoyf8X7RhMJZ/qciHx2iq7FD4JijQ4ygC8jAB1xZRsEeVZ4FyM/IKM2v
	WRIdypSOse5DR/tH/emjx9RTWDyjo3zv5U6H3wNv2u0AuzQ8gvOLDiWB5eM+IM5FZEB8oDEfxiJLv
	wIoCGGm+I4J7sN0PmCpAiDu1AYQa3hSyucxWYtcFO2U1FdQ/KsqcAs4VJPf1EEV0wWXTFmQnejQYo
	rM3KPa4w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48778 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPJ-000000003pa-1L1B;
	Thu, 12 Feb 2026 00:18:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPG-000000093mZ-2CL3;
	Thu, 12 Feb 2026 00:18:06 +0000
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
Subject: [PATCH RFC net-next 5/9] net: stmmac: qcom-ethqos: move loopback
 disable to .mac_finish()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:06 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_161823_868017_974C7D84 
X-CRM114-Status: GOOD (  14.07  )
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

Loopback is enabled to allow the dwmac soft reset to succeed. This
is enabled when clocks are enabled in ethqos_clks_config(), which
happens at driver probe and runtime PM resume - e.g. when the
network device is administratively brought up.

Currently, the loopback is disabled when the link comes up (via
.mac_link_up() calling this driver's .fix_mac_speed().)

Move the qcom_ethqos_set_sgmii_loopback() call which disables
loopback from ethqos_fix_mac_speed() into ethqos' SerDes specific
.mac_finish() method so that loopback is disabled a little earlier
after reset has completed, and dwmac setup has completed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 964eca46a653..bd5d3bf90400 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -647,7 +647,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos, speed);
 }
@@ -684,6 +683,17 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 	phy_exit(ethqos->serdes_phy);
 }
 
+static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
+				    unsigned int mode,
+				    phy_interface_t interface)
+{
+	struct qcom_ethqos *ethqos = priv;
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
+
+	return 0;
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -770,6 +780,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
+		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
 		dev_err(dev, "Unsupported phy mode %s\n",
-- 
2.47.3


