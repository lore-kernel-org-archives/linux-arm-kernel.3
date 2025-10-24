Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A582CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWXoixfODlUqDxsjKDlztTxWIJvxLL5GEq5nJfjkj0A=; b=cjaxn4fsFTZrJ+QaFQZlgcH8A3
	ESytrBHKHEhcz8u/4LHVg8RpuytYxAyxtiHGD0qKiyak4mkqutXRq/smB3p5iUs4oEWCM9BuGHz7B
	EjnnPeJH0x2oL6fbxPq5GaDuu56cjNvtCektq4bB8rFzg0TnW/yWqf6jlh8LHXX6hrzsxnXed1mQr
	zVLqPX8bZ6WleyrMg91p7wrxj1K4FEKjuSiEdhb0Ituhv0O1apSWvxd8Xn8GXpNB4qYXoFjzyxxie
	w4vEAP6P9inRKj5R89vi25wsGSmhAOGFDRsHnZfAYNE6s82f4XSXr3P+kO7ooXxDGpUYwHJOztM1r
	JJ3nstnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJZ-00000009GNC-1wb9;
	Fri, 24 Oct 2025 11:50:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJT-00000009GI2-1jyw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WWXoixfODlUqDxsjKDlztTxWIJvxLL5GEq5nJfjkj0A=; b=NH1ve9xNbEbtCkACDWZdXRnaDF
	xdmBNdtT92YV+yuVvDST+v5EuCGI24j07WLwBO0r7e/O1BCrQfhkmdc3agBnbBUhwi7gIc1QrQ+rP
	Asdvt5tlhACXg+5w4LvT2rfL4aaz+exoS3xgtdbpHz2d2EGsT3Prz94rnTQlMPP3is1G+QUqI/8sP
	H36lPUsrtCady5d08bwVVonMg1EaDLI4zc3JDP+Znyv0ypLUonOWYZ0oeRp/sGP6VlWZe2f7sDbc9
	aed+3ykXRbRV3tOisTSyxHVnjbm6ZFoFu80u4B8/XPANA6T2sjTqN97JZfnQcIinWvm8JdVwV8Syc
	vWgLfLmw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRk-00000002FSQ-45tm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:55:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJ4-0002FG-RS; Fri, 24 Oct 2025 13:50:06 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:49:54 +0200
Subject: [PATCH v5 02/10] net: stmmac: Use interrupt mode INTM=1 for per
 channel irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_115501_094115_130EC6AF 
X-CRM114-Status: GOOD (  17.10  )
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

From: Teoh Ji Sheng <ji.sheng.teoh@intel.com>

commit 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=1
for multi-MSI") is introduced for platform that uses MSI.

Similar approach is taken to enable per channel interrupt
that uses shared peripheral interrupt (SPI), so only per channel
TX and RX intr (TI/RI) are handled by TX/RX ISR without calling
common interrupt ISR.

TX/RX NORMAL interrupts check is now decoupled, since NIS bit
is not asserted for any TI/RI events when INTM=1.

Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 +++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 20 ++++++++++++++++++++
 include/linux/stmmac.h                               |  2 ++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0d408ee17f337..64b533207e4a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -326,6 +326,9 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define DMA_MODE_INTM_MASK		GENMASK(13, 12)
+#define DMA_MODE_INTM_SHIFT		12
+#define DMA_MODE_INTM_MODE1		0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_WR_OSR_LMT_SHIFT		24
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 4d6bb995d8d84..1e9ee1f10f0ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	if (dma_cfg->multi_irq_en) {
+		value = readl(ioaddr + XGMAC_DMA_MODE);
+		value &= ~DMA_MODE_INTM_MASK;
+		value |= (DMA_MODE_INTM_MODE1 << DMA_MODE_INTM_SHIFT);
+		writel(value, ioaddr + XGMAC_DMA_MODE);
+	}
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
@@ -359,13 +366,14 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		}
 	}
 
-	/* TX/RX NORMAL interrupts */
+	/* RX NORMAL interrupts */
 	if (likely(intr_status & XGMAC_RI)) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->rx_normal_irq_n[chan]);
 		u64_stats_update_end(&stats->syncp);
 		ret |= handle_rx;
 	}
+	/* TX NORMAL interrupts */
 	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 27bcaae07a7f2..cfa82b8e04b94 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -607,6 +607,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	dma_cfg->fixed_burst = of_property_read_bool(np, "snps,fixed-burst");
 	dma_cfg->mixed_burst = of_property_read_bool(np, "snps,mixed-burst");
 
+	dma_cfg->multi_irq_en = of_property_read_bool(np, "snps,multi-irq-en");
+
 	plat->force_thresh_dma_mode = of_property_read_bool(np, "snps,force_thresh_dma_mode");
 	if (plat->force_thresh_dma_mode && plat->force_sf_dma_mode) {
 		plat->force_sf_dma_mode = 0;
@@ -737,6 +739,8 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char irq_name[11];
+	int i;
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -746,6 +750,22 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	if (stmmac_res->irq < 0)
 		return stmmac_res->irq;
 
+	/* For RX Channel */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		sprintf(irq_name, "%s%d", "macirq_rx", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname(pdev, irq_name);
+		if (stmmac_res->rx_irq[i] < 0)
+			break;
+	}
+
+	/* For TX Channel */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		sprintf(irq_name, "%s%d", "macirq_tx", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname(pdev, irq_name);
+			if (stmmac_res->tx_irq[i] < 0)
+				break;
+	}
+
 	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
 	 * The external wake up irq can be passed through the platform code
 	 * named as "eth_wake_irq"
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index fa1318bac06c4..a8b15b4e3c370 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -102,6 +102,7 @@ struct stmmac_dma_cfg {
 	bool aal;
 	bool eame;
 	bool multi_msi_en;
+	bool multi_irq_en;
 	bool dche;
 	bool atds;
 };
@@ -290,6 +291,7 @@ struct plat_stmmacenet_data {
 	u8 vlan_fail_q;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
+	bool multi_irq_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;

-- 
2.51.0


