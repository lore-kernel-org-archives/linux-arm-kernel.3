Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B37CF31AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWzMethokdpZI+SsJLAJYK1d0eO55qfB9UauitgyfGY=; b=ApKgfrXwLdeNu/SWzBd3XkeonI
	xO0Bon4uTnLy1S9uuWSSlFTj4C8NR614zorJ86Bm698bA6xjfHT1eZCKiqlRlgwqzMZYU5dhhDeXk
	HmmnymmfwMvySpFG3+FzFk6ZRHzvV5Ai8Fp1iZyf2/HzoI1Eb64gQX/rLFXh8NMVLj+2LdQ/vHD4f
	xg8kGNgCVu0nYzdkVA6cehG9HTXc0WTtG+rBxnJcf119fDcNsS+SIhr+qjvm2wYg8TWDM0jDgplrN
	dMcUDw1b6nVGtASOdSZ0IMWQQDQo9Kckhdy1WVT2M6ORyTB3VrP7WeQrCnq0ZcTuy73MpvzZzJwuT
	LZ4jycJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgSj-000000032Ih-0MGD;
	Wed, 19 Nov 2025 11:35:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgSg-000000032Gx-0iaC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GWzMethokdpZI+SsJLAJYK1d0eO55qfB9UauitgyfGY=; b=W26B/AMNDejL6IhR5H6kaoi6Hs
	1XLDgz7biPhv2IKoJcxtWxVJBLAjjOHnNFpm78EL1VKOcHy3bi6rzeLBJazrPV6/m92YMFpRO1ilz
	Y34YtAkoUjrqoFMxZ/RIggELkYc7jf564LyxlU1AiuywIcKCRW/zXHiAmNg9kToorgxLc3H6/Y3NK
	EUC2pVPWXWs3wqpUAAXn2Fx18VT3Z6zSct8qZnC568+8+rgtgKcpFb1uG83v3dmPvwPEJVyPMJlju
	YgooAXD50rDccOCZrIZL7KN4yPYL6Fdh/dnNQk+qJsfi82jNINvnyeCiNorI3j+H4VKc9J7ptYxJv
	PpHY17dg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49008 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLgSa-000000004ba-0pCL;
	Wed, 19 Nov 2025 11:34:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLgSZ-0000000FMrW-0cEu;
	Wed, 19 Nov 2025 11:34:51 +0000
In-Reply-To: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/3] net: stmmac: qcom-ethqos: use
 read_poll_timeout_atomic()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 11:34:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033458_251062_C62D3421 
X-CRM114-Status: GOOD (  13.26  )
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

Use read_poll_timeout_atomic() to poll the rgmii registers rather than
open-coding the polling.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 44 ++++++-------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cdaf02471d3a..13cddd56d71f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -311,7 +311,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int retry = 1000;
 	u32 val;
 
 	/* Set CDR_EN */
@@ -337,15 +336,10 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	}
 
 	/* Wait for CK_OUT_EN clear */
-	do {
-		val = rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG);
-		val &= SDCC_DLL_CONFIG_CK_OUT_EN;
-		if (!val)
-			break;
-		mdelay(1);
-		retry--;
-	} while (retry > 0);
-	if (!retry)
+	if (read_poll_timeout_atomic(rgmii_readl, val,
+				     !(val & SDCC_DLL_CONFIG_CK_OUT_EN),
+				     1000, 1000000, false,
+				     ethqos, SDCC_HC_REG_DLL_CONFIG))
 		dev_err(dev, "Clear CK_OUT_EN timedout\n");
 
 	/* Set CK_OUT_EN */
@@ -353,16 +347,10 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Wait for CK_OUT_EN set */
-	retry = 1000;
-	do {
-		val = rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG);
-		val &= SDCC_DLL_CONFIG_CK_OUT_EN;
-		if (val)
-			break;
-		mdelay(1);
-		retry--;
-	} while (retry > 0);
-	if (!retry)
+	if (read_poll_timeout_atomic(rgmii_readl, val,
+				     val & SDCC_DLL_CONFIG_CK_OUT_EN,
+				     1000, 1000000, false,
+				     ethqos, SDCC_HC_REG_DLL_CONFIG))
 		dev_err(dev, "Set CK_OUT_EN timedout\n");
 
 	/* Set DDR_CAL_EN */
@@ -531,8 +519,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	volatile u32 dll_lock;
-	unsigned int i, retry = 1000;
+	unsigned int i;
+	u32 val;
 
 	/* Reset to POR values and enable clk */
 	for (i = 0; i < ethqos->num_por; i++)
@@ -582,14 +570,10 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 				      SDCC_USR_CTL);
 
 		/* wait for DLL LOCK */
-		do {
-			mdelay(1);
-			dll_lock = rgmii_readl(ethqos, SDC4_STATUS);
-			if (dll_lock & SDC4_STATUS_DLL_LOCK)
-				break;
-			retry--;
-		} while (retry > 0);
-		if (!retry)
+		if (read_poll_timeout_atomic(rgmii_readl, val,
+					     val & SDC4_STATUS_DLL_LOCK,
+					     1000, 1000000, true,
+					     ethqos, SDC4_STATUS))
 			dev_err(dev, "Timeout while waiting for DLL lock\n");
 	}
 
-- 
2.47.3


