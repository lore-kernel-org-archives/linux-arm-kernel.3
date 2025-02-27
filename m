Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbFSLdJ2BXUSUV0YgnQ7knSt3ShZinjE3OWChyPJm3A=; b=Jo9JIVQ2fmWZ6J+tS906mIucnu
	tt8FmUg7XqDTlsnOB29/Apq4LFdnx7HM/9V0abLOKSb6GlyKEaGmQ3aRgJMYnNrXrBCywalVzN6wM
	+O6JEnPMfM6NW2108XQkwh/aqyNgNvMaC1n6wlCHp/8K+thJPRkG9cVW+A++iPa2UqhnAwC9fq36D
	tqLaKeziEt1tzVOGVmncFSOEDpK75uoeGAuL9Dw87zsUcbtl0cuXXDBKewfUz8tSXNfsfHix2tq9G
	yoEwi4iWCBmKSmcx7X/jEd7KyLqZ5GvaIgjAnl44ZBIk5qEco6yPyb72unbVtq9MTa5GGtx+c3t3+
	Hka3nMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tna9e-00000006r6C-2Zgh;
	Thu, 27 Feb 2025 09:26:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna14-00000006pjg-3QLq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rbFSLdJ2BXUSUV0YgnQ7knSt3ShZinjE3OWChyPJm3A=; b=wneBXL4myqrbXgSp27MjRW6cUo
	YBO153FUjsqljzategPT1Xj8e0bx4ZGDJMA4791tOV+MlDRDOCTGaHnlKqycZ3PEdMHrGZvtfInhD
	+JbJSANOznoyzkSn0OVsonXNYxy7PtmqJObEmw88aUXW6IP+asiN5oIrhtUFWJOXzCzr0PlPMn5fv
	FyP7ki+0Idexo0FqhyYTu/2vl9enz7hA4ZDYsdPfDEieBA/mLz+ITFoWFtWGu2uL+RQIl+Tv5ahsU
	SsvMf0gpEbM+ysS2Wwzr9+QF+nalVbt9FlsVvaqLMenKC0vUiPbcmt/hmHojyeeUOVBmCsp6DAcQf
	f4SWjabw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45376 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna0z-0006cq-1H;
	Thu, 27 Feb 2025 09:17:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0f-0052sw-8r; Thu, 27 Feb 2025 09:16:49 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 06/11] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0f-0052sw-8r@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011714_852163_CD8ACEE7 
X-CRM114-Status: GOOD (  13.13  )
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

Note that given the current unpatched driver structure,
plat_dat->fix_mac_speed will always be populated with
kmb_eth_fix_mac_speed(), even when no clock is present. We preserve
this behaviour in this patch by always initialising plat_dat->clk_tx_i
and plat_dat->set_clk_tx_rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 0591756a2100..599def7b3a64 100644
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
@@ -132,6 +111,9 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 		}
 	}
 
+	plat_dat->clk_tx_i = dwmac->tx_clk;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
 
-- 
2.30.2


