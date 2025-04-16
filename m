Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E946C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n7bu2qX7LooirHoLY1Va5iaADryPdv8WBdIxT2RDo8=; b=eEko8OsHCubbTXNobbXfc8osyX
	ReQbMi41wRGfDmdgcMU2e/8vNnOWoBdi2i8pFqDajZRu3jImdP+i8Kie2MCRJv6M/0H7n/+Y83DOl
	lE6sxV8eA+D/Ni2CIOX9RZKOF3lKPZ/ihetv57Qnx0et2dkJzzmZKpBIR2x5vU3BxU2AwxhBO+sRV
	+d+YIGhOlFVoub0n/3UH+8ITw8MXQlQX08CUcKBhH0275AMYrEdSE4iVhhSkEvLbYzatCvOuuqPJI
	wG0YxcFuj99jMAM/1COiFslk/lPUbaRDdiw/oWENTakRFM7giO5zQmOf4DqljvG3EqoK3pcNo8vMp
	S/hpVy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503w-00000009Akk-0bVF;
	Wed, 16 Apr 2025 10:32:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4z7q-00000008z60-45sb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9n7bu2qX7LooirHoLY1Va5iaADryPdv8WBdIxT2RDo8=; b=yRFzxRSPLt93xrnWnldHKJIZX7
	s8jqKsAaOejM5thREyAcctecXQwV7yxi2AKLpE8/TkZGORU1IXj40FSPyFnjrG9qusgtXCRuwMPdb
	2jdaq0Aq9TDDYWALSoz7uRt2s1q7/hwKNQVAvoyqWRAg4V5Zwu52Dp8VCGWJiG4f7dkvSC4Wf+dXE
	K4h48T+KAUs1EaQnMxYSsyc7TwumJid2VeKLMKHStP85OM5fQi6Jbgb8kf0rb/Wbk5botulN0epm5
	Z0Y3HZ5lVLRR0wpsf/16rtCI01KEDNVK4C1cR2bVSepjQL580Eifj/KlKijSEmFYA6RrEzV29Ij0A
	hBinfeYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33556 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4z7l-0000yo-1S;
	Wed, 16 Apr 2025 10:32:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4z79-000xBi-Ue; Wed, 16 Apr 2025 10:31:27 +0100
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 2/5] net: stmmac: socfpga: provide init function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4z79-000xBi-Ue@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:27 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_023211_009824_F6E2354A 
X-CRM114-Status: GOOD (  11.67  )
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

Both the resume and probe path needs to configure the phy mode, so
provide a common function to do this which can later be hooked into
plat_dat->init.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index bcdb25ee2a33..000d349a6d4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -435,6 +435,13 @@ static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
 	return priv->hw->phylink_pcs;
 }
 
+static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct socfpga_dwmac *dwmac = bsp_priv;
+
+	return dwmac->ops->set_phy_mode(dwmac);
+}
+
 static int socfpga_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -497,7 +504,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = ops->set_phy_mode(dwmac);
+	ret = socfpga_dwmac_init(pdev, dwmac);
 	if (ret)
 		goto err_dvr_remove;
 
@@ -516,7 +523,7 @@ static int socfpga_dwmac_resume(struct device *dev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct socfpga_dwmac *dwmac_priv = get_stmmac_bsp_priv(dev);
 
-	dwmac_priv->ops->set_phy_mode(priv->plat->bsp_priv);
+	socfpga_dwmac_init(to_platform_device(dev), dwmac_priv);
 
 	return stmmac_resume(dev);
 }
-- 
2.30.2


