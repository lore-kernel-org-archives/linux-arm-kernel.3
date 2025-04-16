Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9128C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8hTSVnlcCC2WOnj66TO/Zt9nedPd+37sOl0zL+RseU=; b=qsaakcHmDOV5AlEsHkG3f60Ci/
	2SQbS2ZWYK700kDbi5AnB6zqErI5/jVl3gY024O5H1+KTuhAZJk3JjT3WHa5B3k/nkm3u4H2980dl
	LezA4cV6zaFsxCMaJIADxZwx467oM6VyXytOwoGuBDCR6CJ/qeTPP2ACkcm/Ov5F/ig6S9cmFYDkL
	bIZ6hckfSXH+bON6Hpmu8gpCjfB3WJPrjzv3qtwJ2YNlcHzJyokInjHNzvQ4rwfdEajEqv5r0Ennf
	KAwZlH+DOeTwz6bByMDBMhV+v1JFwA6feiLYz+QmONZ5fvDqI8HS0uVRhjJVbzwHUcatw5pzRqifw
	LG9B1mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503s-00000009Afu-1lAv;
	Wed, 16 Apr 2025 10:32:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4z7k-00000008z4b-1kn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z8hTSVnlcCC2WOnj66TO/Zt9nedPd+37sOl0zL+RseU=; b=igEpVuorQvaIJ8+pFRIrHtcx44
	jL0x/18UHS0Qq3GD77v4CTo36XPUl+HVlaCn7+8o2OBRyp6Ah1IrEIl9ZsMMkyL+7UmkyzgLsFjXK
	agP5bsLJob3UoJ7UVlk/gW2Artuh/H2ip2MlPPGPoF8t6IXddNHF5TkWd+U2zNo78vs1Iiz/cyUYL
	ZpB1Hj0UcJG43GweTZcwr6wdLtjf5Bj72/gpZzjpQT8B1xdHaNv9OW2BnVbchGg7xsyvulxlsW2nv
	hV/uJq3sJerrU3kAKmltwEMNoZ9OKH1djovgusfkhkPeZrHf0uw7ANZ/FllQmJn5BO7vMbKhXR7pF
	cTsOzhIQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33546 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4z7g-0000yb-0e;
	Wed, 16 Apr 2025 10:32:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4z74-000xBc-R0; Wed, 16 Apr 2025 10:31:22 +0100
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
Subject: [PATCH net-next v2 1/5] net: stmmac: socfpga: init dwmac->stmmac_rst
 before registration
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4z74-000xBc-R0@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:22 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_023204_452061_CDF37CCA 
X-CRM114-Status: GOOD (  16.78  )
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

Initialisation/setup after registration is a bug. This is the first of
two patches fixing this in socfpga.

dwmac->stmmac_rst is initialised from the stmmac plat_dat's stmmac_rst
member, which is itself initialised by devm_stmmac_probe_config_dt().
Therefore, this can be initialised before we call stmmac_dvr_probe().
Move it there.

dwmac->stmmac_rst is used by the set_phy_mode() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 116855658559..bcdb25ee2a33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -442,8 +442,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			ret;
 	struct socfpga_dwmac	*dwmac;
-	struct net_device	*ndev;
-	struct stmmac_priv	*stpriv;
 	const struct socfpga_dwmac_ops *ops;
 
 	ops = device_get_match_data(&pdev->dev);
@@ -479,7 +477,13 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* The socfpga driver needs to control the stmmac reset to set the phy
+	 * mode. Create a copy of the core reset handle so it can be used by
+	 * the driver later.
+	 */
+	dwmac->stmmac_rst = plat_dat->stmmac_rst;
 	dwmac->ops = ops;
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
@@ -493,15 +497,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ndev = platform_get_drvdata(pdev);
-	stpriv = netdev_priv(ndev);
-
-	/* The socfpga driver needs to control the stmmac reset to set the phy
-	 * mode. Create a copy of the core reset handle so it can be used by
-	 * the driver later.
-	 */
-	dwmac->stmmac_rst = stpriv->plat->stmmac_rst;
-
 	ret = ops->set_phy_mode(dwmac);
 	if (ret)
 		goto err_dvr_remove;
-- 
2.30.2


