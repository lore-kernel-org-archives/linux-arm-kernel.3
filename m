Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E95DFD9E1E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 23:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkOxIvc1SxSvRnjK0TVgvqiR/wze5PcXHdGWWYhDlA4=; b=HvHaXv+sq4XN0UfE0DfoUzU48r
	XXUV2ok4r1WKFuzYHyj3SD6W/wB7DjknfDU0bogQOBMALMOsee9+YDkDqyeSJvreDWpJuJcZTUUaD
	mDnkIg2rzlZb/CU4HTTbVYEyy6I4O1JTLplU8V2dqLqiUqu3cmrRTOjtazb73mmZ6vCttjqnvszSs
	148VJI7C4z3czgLM0q4FcwYYYdC9lWb6/JhJS1r7br4RI8yEG/R3oVc0UJVeZic2ptNp2a4xZrGbj
	Ti8AZtg91E2lVldJfLXV1wvftfs90hOra+iF2njMdREKVPd9jZKoPVP95EFS0tSjKVcql+uKdfI/N
	oW9gmJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkUK-00000007LOX-1XSn;
	Thu, 26 Feb 2026 23:09:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkUH-00000007LNA-1vBC;
	Thu, 26 Feb 2026 23:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KkOxIvc1SxSvRnjK0TVgvqiR/wze5PcXHdGWWYhDlA4=; b=YhP6yZMuaJjoyDnKf/0LsA7zjk
	ieQo9xoEkN7syxhT6VTHVT8Oks6BTyiten2MrVhKjNWpFhIKrrJktbvJsgUh+jTwfHKClmylICwmV
	6ok1KCSzEg+iQyhUXDcUm8x0AXrHF036MPHPVdrvsQ3uwF1CWpcG4yEyWKOowSCu2KSy3kZcJ1RiA
	ndfmLrSXVsve9/Kko8weqs5/7eomwOT4iKCdFqw70Xi0HPzArjDiKUW/NwkPnHgjpySyzf+M+VcHu
	4FZmxfvshSUI6NUX2Bjv1STJzW2oxTmfQFl8humRQ98MxDdvQo+IcbWSpMw93WrBpGVLQH8BaTiaz
	ZOsJZUjQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37254 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvkU9-000000008Vh-1ZJq;
	Thu, 26 Feb 2026 23:09:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvkU8-0000000AuP8-1DoJ;
	Thu, 26 Feb 2026 23:09:32 +0000
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RESEND2 net-next 3/8] net: stmmac: qcom-ethqos: convert to use
 phy_set_mode_ext()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvkU8-0000000AuP8-1DoJ@rmk-PC.armlinux.org.uk>
Date: Thu, 26 Feb 2026 23:09:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_150941_495712_A593D1C5 
X-CRM114-Status: GOOD (  13.06  )
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

qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
SerDes, taking a PHY interface mode rather than a speed. This allows
the elimination of the interface mode to speed conversion in
ethqos_mac_finish_serdes().

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 57cbe800f652..8913f6f02b9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,7 +105,7 @@ struct qcom_ethqos {
 
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	int serdes_speed;
+	phy_interface_t serdes_mode;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -653,7 +653,8 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 		return ret;
 	}
 
-	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->serdes_mode);
 	if (ret) {
 		phy_power_off(ethqos->serdes_phy);
 		phy_exit(ethqos->serdes_phy);
@@ -675,20 +676,16 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
-	int speed, ret = 0;
+	int ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
-	speed = SPEED_UNKNOWN;
-	if (interface == PHY_INTERFACE_MODE_SGMII)
-		speed = SPEED_1000;
-	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		speed = SPEED_2500;
-
-	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
-		ret = phy_set_speed(ethqos->serdes_phy, speed);
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       interface);
 		if (ret == 0)
-			ethqos->serdes_speed = speed;
+			ethqos->serdes_mode = interface;
 	}
 
 	return ret;
@@ -819,7 +816,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos->serdes_speed = SPEED_1000;
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 
@@ -843,6 +839,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
+		ethqos->serdes_mode = PHY_INTERFACE_MODE_SGMII;
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
-- 
2.47.3


