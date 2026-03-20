Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6329E1099B41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt5xrlKi+MsoO8dSNBxoJh+cxtGEXQO6ihNdPcS8wqQ=; b=m7jj8NRrAtPUXMn+arvbeS2u82
	eTRhTWyKrvmjRg6b/uFfRSE6v3t7RoIvkzyIQQgpSf2i06IH8phWPrbupRiLKuNPsOG9Y2gOu5uE1
	VffgCQ9yn5wi7nCEtnEH3RC+pAj8VI2QRZxtXmB4uMXuw3il34A7FjE290dW5v6M/oxFWiFrh/c8+
	g5T6pfCfQKbf5fpva3RTIC8xCZ7YeHb3hMSP4sKHvwD8dnRQcbKwNhFpOkf6FhozlxvznkcJgpRi1
	IojwM8DQF/dK6Xs8tUFiL5laeVg05YkAldcMUveB0EXsbKJMGk8j8tHeWrrBhXrrPLmeJaF38NmQa
	RrZy3++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hGO-0000000Dbuk-1jYU;
	Fri, 20 Mar 2026 21:20:12 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hGF-0000000Dbpq-08xK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:20:04 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 922ABC05AE44;
	Fri, 20 Mar 2026 14:20:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 922ABC05AE44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774041602;
	bh=aZJWZChcHQriYj94KKlegTaH8Blqvbr+O8JNgv3EGt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgctF/jZkVlUSumC82D5Onn44q+x64d8oSUKFsALOlQsXr74TWf7+tcls0fXZPS/5
	 mnGT3IP9a4H/+9wZUaLwBis5XHF51ZwLInidkUsAeIjmy0n6sS9PML3oX1RWypGvx6
	 30wIxu4JzTYNFT7354Zj1Atq1p2ieBsKKoOSPXso=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net [10.17.214.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 5585FAE81;
	Fri, 20 Mar 2026 17:19:59 -0400 (EDT)
From: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	jitendra.vegiraju@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next v8 5/6] Fix error handling in probe function.
Date: Fri, 20 Mar 2026 14:19:20 -0700
Message-ID: <20260320211921.1202058-6-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_142003_100611_38C9117D 
X-CRM114-Status: GOOD (  17.77  )
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Software node created in probe function is not being cleaned up if
the probe function returns an error.
The stmmac core provides mechanism to handle this error condition
with plat->init, plat->exit helper functions.
Move glue driver's initialization code to plat->init function.
If the probe function returns an error, plat->exit function is
called. Handle any glue driver level cleanup in the plat->exit
handler.
Use devm_add_action_or_reset() to register a callback to free
irq vectors automatically, simplifying error handling in probe().

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 164 ++++++++++--------
 1 file changed, 90 insertions(+), 74 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
index 3a00452c0aa6..9103e9cf38f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
@@ -218,6 +218,13 @@ static void brcm_config_misc_regs(struct pci_dev *pdev,
 		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
 }
 
+static void brcm_free_irq_vectors(void *data)
+{
+	struct pci_dev *pdev = data;
+
+	pci_free_irq_vectors(pdev);
+}
+
 static int brcm_config_multi_msi(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat,
 				 struct stmmac_resources *res)
@@ -251,9 +258,87 @@ static int brcm_config_multi_msi(struct pci_dev *pdev,
 	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_add_action_or_reset(&pdev->dev,
+					brcm_free_irq_vectors, pdev);
+}
+
+static int brcm_drv_init(struct device *dev, void *bsp_priv)
+{
+	struct brcm_priv_data *brcm_priv = (struct brcm_priv_data *)bsp_priv;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int rx_offset;
+	int tx_offset;
+	int vector;
+	int ret;
+
+	/* This device is directly attached to the switch chip internal to the
+	 * SoC using XGMII interface. Since no MDIO is present, register
+	 * fixed-link software_node to create phylink.
+	 */
+	ret = software_node_register_node_group(brcm_swnodes);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register software_node\n");
+	device_set_node(dev, software_node_fwnode(&parent_swnode));
+
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
+
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
+
+	/* SBD Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
+	/* EP_DOORBELL Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
+	/* EP_H0 Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
+	/* EP_H1 Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
+
+	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
+	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
+	vector = BRCM_XGMAC_MSI_RX_VECTOR_START;
+	for (int i = 0; i < BRCM_MAX_DMA_CHANNEL_PAIRS; i++) {
+		/* RX Interrupt */
+		misc_iowrite(brcm_priv, rx_offset, vector++);
+		/* TX Interrupt */
+		misc_iowrite(brcm_priv, tx_offset, vector++);
+		rx_offset += 4;
+		tx_offset += 4;
+	}
+
+	/* Enable Switch Link */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
+		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
+	/* Enable MSI-X */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
 	return 0;
 }
 
+static void brcm_drv_exit_cleanup(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	device_set_node(&pdev->dev, NULL);
+	software_node_unregister_node_group(brcm_swnodes);
+}
+
 static int brcm_pci_resume(struct device *dev, void *bsp_priv)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -272,9 +357,6 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	struct brcm_priv_data *brcm_priv;
 	struct stmmac_resources res;
 	struct device *dev;
-	int rx_offset;
-	int tx_offset;
-	int vector;
 	int ret;
 
 	dev = &pdev->dev;
@@ -291,13 +373,6 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	if (!plat->axi)
 		return -ENOMEM;
 
-	/* This device is directly attached to the switch chip internal to the
-	 * SoC using XGMII interface. Since no MDIO is present, register
-	 * fixed-link software_node to create phylink.
-	 */
-	software_node_register_node_group(brcm_swnodes);
-	device_set_node(dev, software_node_fwnode(&parent_swnode));
-
 	/* Disable D3COLD as our device does not support it */
 	pci_d3cold_disable(pdev);
 
@@ -324,6 +399,8 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
 	brcm_priv->xgmac_regs = res.addr;
 
+	plat->init		= brcm_drv_init;
+	plat->exit		= brcm_drv_exit_cleanup;
 	plat->suspend		= stmmac_pci_plat_suspend;
 	plat->resume		= brcm_pci_resume;
 	plat->bsp_priv = brcm_priv;
@@ -332,78 +409,17 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
-			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
-	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
-			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
-
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
-
-	/* SBD Interrupt */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
-	/* EP_DOORBELL Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
-	/* EP_H0 Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
-	/* EP_H1 Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
-
-	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
-	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
-	vector = BRCM_XGMAC_MSI_RX_VECTOR_START;
-	for (int i = 0; i < BRCM_MAX_DMA_CHANNEL_PAIRS; i++) {
-		/* RX Interrupt */
-		misc_iowrite(brcm_priv, rx_offset, vector++);
-		/* TX Interrupt */
-		misc_iowrite(brcm_priv, tx_offset, vector++);
-		rx_offset += 4;
-		tx_offset += 4;
-	}
-
-	/* Enable Switch Link */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
-		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
-		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
-		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
-	/* Enable MSI-X */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
-		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
-
 	ret = brcm_config_multi_msi(pdev, plat, &res);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"%s: ERROR: failed to enable IRQ\n", __func__);
-		goto err_disable_msi;
-	}
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret)
-		goto err_disable_msi;
-
-	return ret;
-
-err_disable_msi:
-	pci_free_irq_vectors(pdev);
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to configure IRQ\n");
 
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat, &res);
 }
 
 static void dwxgmac_brcm_pci_remove(struct pci_dev *pdev)
 {
 	stmmac_dvr_remove(&pdev->dev);
-	pci_free_irq_vectors(pdev);
-	device_set_node(&pdev->dev, NULL);
-	software_node_unregister_node_group(brcm_swnodes);
 }
 
 static const struct pci_device_id dwxgmac_brcm_id_table[] = {
-- 
2.34.1


