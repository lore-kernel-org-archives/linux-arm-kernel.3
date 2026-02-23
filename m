Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA27E98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcOiLZinkufcHuw/tuHyonj7h2JvDwTX8cEgQ3EA+7M=; b=3poTDDf/sXVS3EQHhR3PqCoJlN
	NEApPAaEGOBa8YoBYknkQ4giL1WtI17EfDj1DROAX27Q5P6i+l6GWOhbaWUxBXYUdjC5HvCz66BrX
	osyVjsk0uAdCH2CZWxcsZ4MNyVgHfRJqD4tiia6Xl1nklEPyxSoNBKJUCEliyPzPGI8ma1PC22Vng
	tp9VVrlgdo/HEkOKRPdrzju4jybG/p+xsX+ef8V3+kvKJk3o7hNm4pyCcTrCB/YxugX964id9ZG1u
	ZfQp2zl4CD2SJsBNY4c4obapTkvbYyWZ1x0hRW/md4MhPB5+bjQeKCWtExv1u8ERRk5NY6MNZZcRf
	QSSvfsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLD-0000000HXzN-2z5g;
	Mon, 23 Feb 2026 09:34:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLB-0000000HXvR-2zRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wcOiLZinkufcHuw/tuHyonj7h2JvDwTX8cEgQ3EA+7M=; b=RK/nXdfXjjAn9o13suE3Hnngw4
	GCZ7Q6AYPwMS6+AIyNp/X4IAYODh9MTw2TgU7O8aTXj6kWbOdhqqpnH5mFsaPDjf/ht1g0XCLmZnS
	logsh6fIb4kc2Xo2mUNEWS8SH5KZcHKD3TGt+7sjXuzY6fx0bahhTVVFjvo+pPsguC3PlarDlZjar
	LxkGf3NhBDAiY7JJdfSAV16SNd3wyYpfk9Gaq6TsGuBnQ0qt211UFX99jtqjPB0OFlQ58tPxt08KQ
	GzNQdXHVpYjB9/J4XuH/+yMdH3/4xFyRg1OxbivW4E3cjjahD74A9I6AqSjcclrmqcRwVT5DkQ/AT
	2rv+xxsQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52938 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKt-000000003nD-2pqT;
	Mon, 23 Feb 2026 09:34:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKq-0000000AScA-1Wh3;
	Mon, 23 Feb 2026 09:34:36 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 05/10] net: stmmac: qcom-ethqos: move loopback
 disable to .mac_finish()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKq-0000000AScA-1Wh3@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:36 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013457_753923_8D631070 
X-CRM114-Status: GOOD (  14.10  )
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

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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


