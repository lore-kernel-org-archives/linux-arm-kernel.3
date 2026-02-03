Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE9E87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQM2jqTAVvNlClHrI8JivENEZRN72ANf7WHUJLihtrk=; b=GuhYqitg/bc76PGA4Ns4co6BVg
	YKu7DsvAwDsH4pAGUEA0nlM7BOEZq168D7WvdlVUt3rfK02iEL01DCk4ljKNTu/Zcv67JDHtiMwP7
	l8G871tjopVtsJRKx60DDSMbNLKK90cKrhCDIWCGoipc1EPEYq2t1KgRk4lNE3hevdT56lQi7vf2Q
	vhaKkP2/PaFFR11tsXHzdtO/APMtC8Qs0HnDJ60xsjjhGBLbQkULSOFB8NlWiD6ZpK7JU4ntTTfk5
	h/nqxAnmkDnrnBdcElcAjheP2gkIz/xlFbbmboTD98mo+4QOeYblzZtJCKarcZiHPl+DlhPptcAlh
	wONtrrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJc6-00000006zC4-3tf9;
	Tue, 03 Feb 2026 16:50:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJc3-00000006zBj-2Sgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQM2jqTAVvNlClHrI8JivENEZRN72ANf7WHUJLihtrk=; b=nhJ0dN6a2H7g7z9KrggSQbbziY
	AMsovjPrVlZbJuAzWzqe6RZKPckXFGkRVz77oU4S120Kd3MHkM8LdBPI6NIGOFZ9FWkl4rIKtFCEc
	SjYowvX50LPExu/5B6rDlpMFU1q7zRXAbcv+o+Ks9bEj92293I1ujVEIRZgOeLPuRmgnF/tq4bq4y
	3gh5RTfKKNd84+SdjGjr8KvObyBAEhGiMa0cktvUnPYk9QuZSMRJRuTPez/mCqaSQWHeovAnoxk48
	vEoKYE/a0NCrd6MA42enfRZ5vorGm2cLVqdZcHrL04jF9bJOFyheYxrsceTS49u0gzTX65bFCo3SH
	ZSIX1oFA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34962 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnJbu-000000005K7-179k;
	Tue, 03 Feb 2026 16:50:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnJbt-00000007YYN-28nm;
	Tue, 03 Feb 2026 16:50:41 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnJbt-00000007YYN-28nm@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Feb 2026 16:50:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085051_814306_18760E82 
X-CRM114-Status: GOOD (  19.25  )
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

The dwmac databook for v3.74a states that lpi_intr_o is a sideband
signal which should be used to ungate the application clock, and this
signal is synchronous to the receive clock. The receive clock can run
at 2.5, 25 or 125MHz depending on the media speed, and can stop under
the control of the link partner. This means that the time it takes to
clear is dependent on the negotiated media speed, and thus can be 8,
40, or 400ns after reading the LPI control and status register.

It has been observed with some aggressive link partners, this clock
can stop while lpi_intr_o is still asserted, meaning that the signal
remains asserted for an indefinite period that the local system has
no direct control over.

The LPI interrupts will still be signalled through the main interrupt
path in any case, and this path is not dependent on the receive clock.

This, since we do not gate the application clock, and the chances of
adding clock gating in the future are slim due to the clocks being
ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
requests the interrupt, and all associated code.

Reported-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com> # Renesas RZ/V2H board
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 -
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 ---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  7 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 --
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 -------------------
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 -----
 include/linux/stmmac.h                        |  1 -
 7 files changed, 59 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1c5a4af85b58..d26e8a063022 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -394,7 +394,6 @@ enum request_irq_err {
 	REQ_IRQ_ERR_SFTY,
 	REQ_IRQ_ERR_SFTY_UE,
 	REQ_IRQ_ERR_SFTY_CE,
-	REQ_IRQ_ERR_LPI,
 	REQ_IRQ_ERR_WOL,
 	REQ_IRQ_ERR_MAC,
 	REQ_IRQ_ERR_NO,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index aad1be1ec4c1..92d77b0c2f54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -719,7 +719,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	/* Setup MSI vector offset specific to Intel mGbE controller */
 	plat->msi_mac_vec = 29;
-	plat->msi_lpi_vec = 28;
 	plat->msi_sfty_ce_vec = 27;
 	plat->msi_sfty_ue_vec = 26;
 	plat->msi_rx_base_vec = 0;
@@ -1177,8 +1176,6 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);
 	if (plat->msi_wol_vec < STMMAC_MSI_VEC_MAX)
 		res->wol_irq = pci_irq_vector(pdev, plat->msi_wol_vec);
-	if (plat->msi_lpi_vec < STMMAC_MSI_VEC_MAX)
-		res->lpi_irq = pci_irq_vector(pdev, plat->msi_lpi_vec);
 	if (plat->msi_sfty_ce_vec < STMMAC_MSI_VEC_MAX)
 		res->sfty_ce_irq = pci_irq_vector(pdev, plat->msi_sfty_ce_vec);
 	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
@@ -1294,7 +1291,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	 */
 	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
 	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
-	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
 	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
 	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
 	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ed0b534d8d7b..d66ae6ea4df5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -442,13 +442,6 @@ static int loongson_dwmac_dt_config(struct pci_dev *pdev,
 		res->wol_irq = res->irq;
 	}
 
-	res->lpi_irq = of_irq_get_byname(np, "eth_lpi");
-	if (res->lpi_irq < 0) {
-		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
-		ret = -ENODEV;
-		goto err_put_node;
-	}
-
 	ret = device_get_phy_mode(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "phy_mode not found\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 012b0a477255..aafd8c39be63 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -31,7 +31,6 @@ struct stmmac_resources {
 	void __iomem *addr;
 	u8 mac[ETH_ALEN];
 	int wol_irq;
-	int lpi_irq;
 	int irq;
 	int sfty_irq;
 	int sfty_ce_irq;
@@ -297,7 +296,6 @@ struct stmmac_priv {
 	int wol_irq;
 	u32 gmii_address_bus_config;
 	struct timer_list eee_ctrl_timer;
-	int lpi_irq;
 	u32 tx_lpi_timer;
 	bool tx_lpi_clk_stop;
 	bool eee_enabled;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9500b332a152..5c0d92b0293c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3746,10 +3746,6 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(priv->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq)
-			free_irq(priv->lpi_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_LPI:
 		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
 			free_irq(priv->wol_irq, dev);
 		fallthrough;
@@ -3807,24 +3803,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		}
 	}
 
-	/* Request the LPI IRQ in case of another line
-	 * is used for LPI
-	 */
-	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
-		int_name = priv->int_name_lpi;
-		sprintf(int_name, "%s:%s", dev->name, "lpi");
-		ret = request_irq(priv->lpi_irq,
-				  stmmac_mac_interrupt,
-				  0, int_name, dev);
-		if (unlikely(ret < 0)) {
-			netdev_err(priv->dev,
-				   "%s: alloc lpi MSI %d (error: %d)\n",
-				   __func__, priv->lpi_irq, ret);
-			irq_err = REQ_IRQ_ERR_LPI;
-			goto irq_error;
-		}
-	}
-
 	/* Request the common Safety Feature Correctible/Uncorrectible
 	 * Error line in case of another line is used
 	 */
@@ -3964,19 +3942,6 @@ static int stmmac_request_irq_single(struct net_device *dev)
 		}
 	}
 
-	/* Request the IRQ lines */
-	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
-		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
-				  IRQF_SHARED, dev->name, dev);
-		if (unlikely(ret < 0)) {
-			netdev_err(priv->dev,
-				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
-				   __func__, priv->lpi_irq, ret);
-			irq_err = REQ_IRQ_ERR_LPI;
-			goto irq_error;
-		}
-	}
-
 	/* Request the common Safety Feature Correctible/Uncorrectible
 	 * Error line in case of another line is used
 	 */
@@ -7764,7 +7729,6 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
-	priv->lpi_irq = res->lpi_irq;
 	priv->sfty_irq = res->sfty_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..5c9fd91a1db9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -725,14 +725,6 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 		stmmac_res->wol_irq = stmmac_res->irq;
 	}
 
-	stmmac_res->lpi_irq =
-		platform_get_irq_byname_optional(pdev, "eth_lpi");
-	if (stmmac_res->lpi_irq < 0) {
-		if (stmmac_res->lpi_irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
-	}
-
 	stmmac_res->sfty_irq =
 		platform_get_irq_byname_optional(pdev, "sfty");
 	if (stmmac_res->sfty_irq < 0) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 5199451dd0bc..2620f0217f88 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -300,7 +300,6 @@ struct plat_stmmacenet_data {
 	int int_snapshot_num;
 	int msi_mac_vec;
 	int msi_wol_vec;
-	int msi_lpi_vec;
 	int msi_sfty_ce_vec;
 	int msi_sfty_ue_vec;
 	int msi_rx_base_vec;
-- 
2.47.3


