Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44EEFD214
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vzJT29Oz+BPVcG8jRcdyLA+I6k3k4AJW+BjQ7tJ504=; b=O0zJkMritRoRuYlD1weAVOEm/0
	BFCpiByjtdbsOAgS2zMq4Sy8w1O2/PEl7LguFQ8O6rDk8yWZyzkd1mrZS2ZNJkJxSHmnVA9MRnJXf
	Co7oXX3LYWx889aWbtTFmnnuR0bDTFg9RMfPRAXlmHzHu75ySjDo+STRUpDqfmXSXQ/F6axm3uXne
	dkjneILUkhBoIYp4Tiu8P3v0R6Fe9DJdPMMTcSJaoCFlGHLx9pDmwJUCc8CjuyxuPMQFIyMOfXi6t
	OetYrGODIedj/Myu3lSjlOia0GKxupzLntXowHCVMA+jqQvc7pJG6r8vCk0FMlMy/G5GtI/Z5fl5y
	BCmIyFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4k-00000003edm-2fBz;
	Wed, 25 Feb 2026 09:20:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4j-00000003ecx-1Tf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74189600AA;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1867AC19423;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011256;
	bh=Q9V6sTMaJ2pd7d5NGrdgzvEcNvyFxJE7OuvaMwzwrfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=txuxe8fu54/uCSX5O7MX+rkmCzmlxCbRVbyTO2OMtSMHJn3hzaxvw94I+YimPTcFC
	 YrZaekMenasUoDnOGjvNJgNhJndur1Z8D3AsGQdOnsX76T/2RniEwtkfCkA4V1Hex7
	 Jg0Z2H6GXzSaDTKtspCKb0dxqZALj3BO6zmBLBa8jC5QKgWqKIbmNL1+PCSyjMK0Rr
	 Kd3IdMjfqaKAJjYnebWhk9R98raP/liB7UEFvrDHcErCJJu+uXgkxzvbem2oAWL5AH
	 /Fsw/f6Z7UEIOqyKQWyGtdYAvoX5cnJfrn7nXHg6JI79X+h7ngJiLD3NkvctUTgMDs
	 tmrC+hwcXQiXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BBBEFD213;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Feb 2026 10:20:33 +0100
Subject: [PATCH v6 1/5] net: stmmac: Use helper macro for loop over
 queue-based arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dwmac_multi_irq-v6-1-245bf1d7110c@oss.nxp.com>
References: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
In-Reply-To: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011254; l=4143;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=AN9BxArjvT+LtwWtaoyDzsO4XeDTxufZg6uDwPtH3+8=;
 b=HrMyIBe6hiEiK+yI++j0zr4SZkcfnBej78BfknH+fkY5XBTCN+M/FNAdcfWgxyRrV7eMXsYyN
 xJKwDPLiatADbjLR6Qfv9C/KgR/geTNb1JSLa1Ljt9HaiAOmkBiinwc
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The stmmac driver contains similar pattern for processing queue-based
arrays, ie. interrupt lines, etc. Factor out the for loop and provide
a macro STMMAC_FOREACH_MTL_QUEUE(var, limit).

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h        |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 16 ++++++++--------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 49893b9fb88c..3890e82c69f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -233,7 +233,7 @@ static void dwxgmac2_prog_mtl_tx_algorithms(struct mac_device_info *hw,
 	writel(value, ioaddr + XGMAC_MTL_OPMODE);
 
 	/* Set ETS if desired */
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES) {
 		value = readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
 		value &= ~XGMAC_TSA;
 		if (ets)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 51c96a738151..c972ad8e79f8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -382,6 +382,9 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+#define STMMAC_FOREACH_MTL_QUEUE(var, limit) \
+	for (var = 0; var < (limit); var++)
+
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edf0799b7236..b920ca17b2be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3875,7 +3875,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Rx MSI irq */
-	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, priv->plat->rx_queues_to_use) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
 		if (priv->rx_irq[i] == 0)
@@ -3899,7 +3899,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Tx MSI irq */
-	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, priv->plat->tx_queues_to_use) {
 		if (i >= MTL_MAX_TX_QUEUES)
 			break;
 		if (priv->tx_irq[i] == 0)
@@ -4084,10 +4084,10 @@ static int __stmmac_open(struct net_device *dev,
 			 struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret, i;
 	u32 chan;
-	int ret;
 
-	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
@@ -7734,9 +7734,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->device = device;
 	priv->dev = ndev;
 
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES)
 		u64_stats_init(&priv->xstats.rxq_stats[i].napi_syncp);
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES) {
 		u64_stats_init(&priv->xstats.txq_stats[i].q_syncp);
 		u64_stats_init(&priv->xstats.txq_stats[i].napi_syncp);
 	}
@@ -7759,9 +7759,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->sfty_irq = res->sfty_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES)
 		priv->rx_irq[i] = res->rx_irq[i];
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES)
 		priv->tx_irq[i] = res->tx_irq[i];
 
 	if (!is_zero_ether_addr(res->mac))

-- 
2.47.0



