Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D80C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ+VuClAIugyh12DlKfpLSkGYbdt3PX3ZLE4Cic03KE=; b=tdh3ozxU/PJ+lDa5yaZDpzlIHj
	WlS+/tiZcarFrmMGX7F/ngfmdmAI/WqEYD552yeQl3Vz5Xx7symdJ0u8AF7pEVsN57NCXUsG48gB1
	VaWnF3eQnqg/SJp7qTyMQRbdMGMuaymKpqgfiMU0ABHhwCCYYXk/RGqiGgx/mQB7JpXSZR9sJ/KTn
	i9O9BvtPs/PkwIQ4bS/vjeDjvZ031Z/Nlinpf1FxaeS9HZ4heqPAUJsgxZWdpepissEv7Z8yf50Zx
	s/dR+pEO65njFVwRGFwgQ8BjWKi27eezcaKrS7Ob4j9hTM9H1QYI5R9qvic+h963KzZABShRuFHT4
	QkbpH6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLj9-00000007wkP-1iZh;
	Tue, 18 Feb 2025 11:25:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZj-00000007uHV-0lwa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pJ+VuClAIugyh12DlKfpLSkGYbdt3PX3ZLE4Cic03KE=; b=NboZtx9JIpAxdBcylbAGrjfYJX
	H4Nzg2i3NgdNP+cOoncpKpKqRD1ePajqZoHhwweFY1a0fx9Uys91r0LGJcwcWUJ3djwUQuIsphVIZ
	2xGp/E1GUBzsm7zdEGcsgIvVezwIh3+ZKCD16u0ThFh4gB8Vueas3qBvzLPcn0hIXhFXgFNA0VzVc
	Xh9BzxaGIdMu3vLBOEXaJBiJzlV1At9g/qvppj1w8vAb2Z3wbfINekNum3iTrO9Ptp9PhzYHHW5H/
	7dB9EdENZlQSIXLiG0aIQ/O8PMYDGu2Vj0iCNYR+JdV46BEyOBGtcUf3hDZIYUxQUsvc3tv5OBBxf
	z4yRRymw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50882 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZW-0001jr-07;
	Tue, 18 Feb 2025 11:15:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLZB-004RZU-4A; Tue, 18 Feb 2025 11:15:05 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:15:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031539_221200_7925D739 
X-CRM114-Status: GOOD (  12.93  )
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

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 0591756a2100..e81d81e44127 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -22,31 +22,12 @@ struct intel_dwmac {
 };
 
 struct intel_dwmac_data {
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	unsigned long ptp_ref_clk_rate;
 	unsigned long tx_clk_rate;
 	bool tx_clk_en;
 };
 
-static void kmb_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct intel_dwmac *dwmac = priv;
-	long rate;
-	int ret;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dwmac->dev, "Invalid speed\n");
-		return;
-	}
-
-	ret = clk_set_rate(dwmac->tx_clk, rate);
-	if (ret)
-		dev_err(dwmac->dev, "Failed to configure tx clock rate\n");
-}
-
 static const struct intel_dwmac_data kmb_data = {
-	.fix_mac_speed = kmb_eth_fix_mac_speed,
 	.ptp_ref_clk_rate = 200000000,
 	.tx_clk_rate = 125000000,
 	.tx_clk_en = true,
@@ -89,8 +70,6 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	 * platform_match().
 	 */
 	dwmac->data = device_get_match_data(&pdev->dev);
-	if (dwmac->data->fix_mac_speed)
-		plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
 
 	/* Enable TX clock */
 	if (dwmac->data->tx_clk_en) {
@@ -130,6 +109,9 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 				goto err_tx_clk_disable;
 			}
 		}
+
+		plat_dat->clk_tx_i = dwmac->tx_clk;
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	}
 
 	plat_dat->bsp_priv = dwmac;
-- 
2.30.2


