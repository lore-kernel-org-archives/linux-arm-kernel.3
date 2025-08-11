Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1581CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+ZWjlAiVXaiMSqihZGqMuzI69Y869sPCzWPUrdL1jM=; b=33Pa+jfFeLI3VmciiSgBHv943+
	DgUqjQfHmHEUupeK+G5UH0mH66mXF2rPT1LpB3YZkpdp7qKKtpK4GCmYYeLspt4z4FsSD92erdx/y
	cRgLBHnmGTQbT9p2X6Mh3hMbrXT66sk0rIHuM6mAUiq0zzsnR1pCsi5cqkcxwkGuXzQXy7g6b5vsQ
	V9+7mjiOgU2QdIYa2dP+XiKcoLfRG25ar8iVA7JAKLOfClDu3/srzcEq/kBy8P4BUpbIukH3VkM+x
	UGN4d9ozINeMG7q9h14uWNNa7LDkEOSr/nLnA6OSecpBK/Je7/al+cPkqCY8bBSlLkJdGjMxvcHnw
	mgqxFuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacq-00000009CuB-2Zco;
	Mon, 11 Aug 2025 22:04:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXce-00000008qFD-3eZN;
	Mon, 11 Aug 2025 18:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O+ZWjlAiVXaiMSqihZGqMuzI69Y869sPCzWPUrdL1jM=; b=i+dwIOA2KDyihbulA8F6anitXB
	sfqlks2vOIC857Xg/6Kani+onWeW78iXcjgnIhgXQSUlUeVI0MQQqx5z1EnJ+lc4G04vku/hs8a8M
	/eM4ZNa0yp7hn5k7zd57tBPVqaR6oNBXjzdnyv0RtzYQdOTrUbATuTbvAJVXO9Uied0JaFi90CsRP
	Tan9z4iTsyv4hXIglxTNtPoE2gcr+75ChSM0DGVWOIG7arVDshxhVrAEd1VPSE1yj8k0yb+Qs5rN8
	AJ/X42IWzEbR8BjHob4VktXGZNnucJdoz0PNHBE7Ya056I8v/pNdKNVHUiMISkuXPxgqR/OjGOSS9
	MgmSFqfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41016 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcW-0003bD-1Q;
	Mon, 11 Aug 2025 19:51:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXbm-008gqs-P9; Mon, 11 Aug 2025 19:50:58 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/9] net: stmmac: intel: convert to
 suspend()/resume() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXbm-008gqs-P9@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:58 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115152_908146_73F252DA 
X-CRM114-Status: GOOD (  13.28  )
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

Convert intel to use the new suspend() and resume() methods rather
than implementing these in custom wrappers around the main driver's
suspend/resume methods. This allows this driver to use the stmmac
simple PM ops structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 74 +++++++++----------
 1 file changed, 35 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ea33ae39be6b..3fac3945cbfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1231,6 +1231,37 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 	return 0;
 }
 
+static int intel_eth_pci_suspend(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	ret = pci_save_state(pdev);
+	if (ret)
+		return ret;
+
+	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
+	return 0;
+}
+
+static int intel_eth_pci_resume(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	pci_restore_state(pdev);
+	pci_set_power_state(pdev, PCI_D0);
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	return 0;
+}
+
 /**
  * intel_eth_pci_probe
  *
@@ -1292,6 +1323,9 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	plat->bsp_priv = intel_priv;
+	plat->suspend = intel_eth_pci_suspend;
+	plat->resume = intel_eth_pci_resume;
+
 	intel_priv->mdio_adhoc_addr = INTEL_MGBE_ADHOC_ADDR;
 	intel_priv->crossts_adj = 1;
 
@@ -1355,44 +1389,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 }
 
-static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	ret = stmmac_suspend(dev);
-	if (ret)
-		return ret;
-
-	ret = pci_save_state(pdev);
-	if (ret)
-		return ret;
-
-	pci_wake_from_d3(pdev, true);
-	pci_set_power_state(pdev, PCI_D3hot);
-	return 0;
-}
-
-static int __maybe_unused intel_eth_pci_resume(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	pci_restore_state(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-
-	ret = pcim_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	pci_set_master(pdev);
-
-	return stmmac_resume(dev);
-}
-
-static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
-			 intel_eth_pci_resume);
-
 #define PCI_DEVICE_ID_INTEL_QUARK		0x0937
 #define PCI_DEVICE_ID_INTEL_EHL_RGMII1G		0x4b30
 #define PCI_DEVICE_ID_INTEL_EHL_SGMII1G		0x4b31
@@ -1442,7 +1438,7 @@ static struct pci_driver intel_eth_pci_driver = {
 	.probe = intel_eth_pci_probe,
 	.remove = intel_eth_pci_remove,
 	.driver         = {
-		.pm     = &intel_eth_pm_ops,
+		.pm     = &stmmac_simple_pm_ops,
 	},
 };
 
-- 
2.30.2


