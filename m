Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316C7EFCD71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwtMUAZTUX+DedK7frl0afLmUEjjoTcHhOmPYx1WSBI=; b=N83UfILA+X03A5m6S8SHpxZCU6
	6BUI+nfL+SPQ9XDQNMI1cH0ozaNDiVUt8M3r94IlLpTJ02np/bRLF12EUX7lNznkRnGL6CYOIdRHJ
	rAC7uQDGIC/ymNfxAPyGkcCpPPwwrq/JZgk0CZV2eupWYTTu1CSip4GoQsAb5me9wZSdK8uGfgfE7
	YbZHPQRLelZ2QwoCFRRTYDXLGjioAQdwxa4QpIn7Ac0WnO7SpM0tikCnfKmMaykyNYiD5WOBkfJ75
	oQgiEdWAmMWeK1BIp0JEqSUOAw5YGpHlSBTkqJ233uEoZ/NDCjodhgBEfW4CnlWGjN7FTPRSxhQhR
	Z+CbNPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX5P-00000006zJo-0cwk;
	Mon, 09 Mar 2026 09:39:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX5L-00000006zHo-02nA;
	Mon, 09 Mar 2026 09:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YwtMUAZTUX+DedK7frl0afLmUEjjoTcHhOmPYx1WSBI=; b=B3llQGDVnKBI167hb5R/sRWnqa
	XNblndQ4QAjWq40iQY+qavBoLNgznejSKQ6pbEycaLtS9rKuOVcBo2GC1XwWwhMamhvm6d/70kyQx
	h/RzR41NkGqCtEQlSeThx+US5hqAJ4F3UcwGGJpu5mBLlz7IeMocfdITFlzkX91KkQdLmMZEz6aqG
	i5ceQGtTndqz99qHLQCrwJbHaWoul//DTHYl51fpO+3j0hUK4oZA3fMigKit5UUPJ2lr4rdhQISN2
	64FfreYxvLBQiLvYvFvBirwXB5gTIpYBkXcQOzhBmBf9jDLxC/aZPpAAIPJP14sxx9kQI4DRIr+o2
	Ud+7kbvQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57936 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX55-000000003U4-2RSB;
	Mon, 09 Mar 2026 09:39:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX54-0000000CVrw-2jfu;
	Mon, 09 Mar 2026 09:39:18 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg in
 stmmac_plat_dat_alloc()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_023935_423567_2E8B6FED 
X-CRM114-Status: GOOD (  16.51  )
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

plat_dat->dma_cfg is unconditionally required for the operation of the
driver, so it would make sense to allocate it along with the plat_dat.

On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.

Given that dma_cfg is required, and it is now less than a cache line,
It doesn't make sense to allocate this separateny, so place it at the
end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
at that to avoid mass changes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 5 -----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 4 ----
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 5 -----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 8 +-------
 include/linux/stmmac.h                                | 1 +
 7 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index fc13bfb47783..0b32560cd059 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1251,11 +1251,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ada6c6ef1f5c..51b1562f84d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -513,10 +513,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	ld = devm_kzalloc(&pdev->dev, sizeof(*ld), GFP_KERNEL);
 	if (!ld)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 8b45b9cf7202..d245546b90db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -218,10 +218,6 @@ motorcomm_default_plat_data(struct pci_dev *pdev)
 	if (!plat->mdio_bus_data)
 		return NULL;
 
-	plat->dma_cfg = devm_kzalloc(dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return NULL;
-
 	plat->axi = devm_kzalloc(dev, sizeof(*plat->axi), GFP_KERNEL);
 	if (!plat->axi)
 		return NULL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0160ff54a59..87f43811faa0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7730,6 +7730,8 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	if (!plat_dat)
 		return NULL;
 
+	plat_dat->dma_cfg = &plat_dat->__dma_cfg;
+
 	/* Set the defaults:
 	 * - phy autodetection
 	 * - determine GMII_Address CR field from CSR clock
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 270ad066ced3..836fed7d60ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -134,11 +134,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c34998486293..1aed48fe0db6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -548,13 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 				     &plat->multicast_filter_bins);
 	}
 
-	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-			       GFP_KERNEL);
-	if (!dma_cfg) {
-		ret = ERR_PTR(-ENOMEM);
-		goto error_put_mdio;
-	}
-	plat->dma_cfg = dma_cfg;
+	dma_cfg = plat->dma_cfg;
 
 	of_property_read_u32(np, "snps,pbl", &dma_cfg->pbl);
 	if (!dma_cfg->pbl)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 965ada809fdf..919196713c05 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -306,5 +306,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	struct stmmac_dma_cfg __dma_cfg;
 };
 #endif
-- 
2.47.3


