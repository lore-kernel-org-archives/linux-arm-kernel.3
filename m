Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16836C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9nai/0QNXN+nHxjf0MLQSgJR5/7hnnLrQ1ndkljc3U=; b=E256k7wVQO4hFwwDfCUT+6awWo
	MoJiZDSrto/lrUayMvL33x22Pu3bdAN2kszAJxo7z/ZUmf26E96mUVZAZdIT/Y3cSPXM5vGpt7k+b
	Ljz1UCYrCXjZHiSLTGZ1xFG6WGufHt2nsBMPtJkcOxkbKyQ1c+hzcy4sPcl82qf7DLrUupnAN6jFg
	AqMxbhWu3PS7PZUdEl5x6OnjC6PvueeLaTVwvNsS1YUunQb8CxSSdXMoVXuityDne0ObQttmuTFFm
	GyjDwgSOk7X4cmsVmCli0oQhuHcyb53aoYpExab9GZefCapvmXPo9xy4PjhD12ZjwisCwMhU/Iobs
	C1+bY8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hv1-0000000Biui-2KT0;
	Wed, 09 Sep 2026 13:00:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Huy-0000000Birt-0sj3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788958848; x=1820494848;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=zBov56ra9TQQ0Btxz615KJ63MNaEZMJU8uYgTEPF1Xs=;
  b=wRK5zFa0oAZoDqz68iTn5IQaR/BTKEd1jCtQyOUOiuQPksyT4WdQ6DAK
   hoN3JhcMckm7akNM/d/OF4cWIFott2u6trXcoNoQNlJmP1RbjIRgz8qW7
   ERpCAvWbaX6ArRqeFT3WvSSJiPFe3ZYG0O/CM6XNH9ja+LMf0DhvV+8Ly
   xUgdIZKJ285AZJC2oSmdl0s7+ZFd/MhIVLonguebFbVowmeskTXWR5itz
   R7soORuGgDBNdjeopQNr/ONrAhLvgNaetKXXC4rO1q/Ok5jsnqF/Njcps
   N2K5Q35MTCKhlV7kSWdeF1eZgJlZOVsGu47AC2ltLCd8WmCY186Y32SxZ
   A==;
X-CSE-ConnectionGUID: I/1DwU+2QTOlLSGotqcmmA==
X-CSE-MsgGUID: pqqg6biRSSeOKYoaJ41BmQ==
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="73307779"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:00:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 9 Sep 2026 06:00:46 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 9 Sep 2026 06:00:42 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 9 Sep 2026 15:00:08 +0200
Subject: [PATCH net-next v6 06/14] net: lan966x: use a dedicated device for
 DMA operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-lan966x-pci-fdma-v6-6-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-0-6f48dab9d671@microchip.com>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-0-6f48dab9d671@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_060048_281260_A65FA924 
X-CRM114-Status: GOOD (  21.79  )
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

In preparation for the PCIe FDMA implementation, add lan966x->dma_dev,
resolved once at probe time, and use it for every DMA operation the
FDMA path performs: coherent allocations, streaming mappings and the RX
page pool. Natively, dma_dev is lan966x->dev, so there is no functional
change.

Since dma_dev differs from dev only on the PCIe path, add
lan966x_is_pci() on top of it, for the later PCIe patches to key off.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  | 30 +++++++++++-----------
 .../net/ethernet/microchip/lan966x/lan966x_main.c  | 16 ++++++++++++
 .../net/ethernet/microchip/lan966x/lan966x_main.h  | 10 ++++++++
 3 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 1311b79bd11f..15fc59cb4ad7 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -80,7 +80,7 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
 		.pool_size = rx->fdma.n_dcbs,
 		.nid = NUMA_NO_NODE,
-		.dev = lan966x->dev,
+		.dev = lan966x->dma_dev,
 		.dma_dir = DMA_FROM_DEVICE,
 		.offset = XDP_PACKET_HEADROOM,
 		.max_len = rx->max_mtu -
@@ -126,7 +126,7 @@ static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
 	if (err)
 		return err;
 
-	err = fdma_alloc_coherent(lan966x->dev, fdma);
+	err = fdma_alloc_coherent(lan966x->dma_dev, fdma);
 	if (err) {
 		page_pool_destroy(rx->page_pool);
 		return err;
@@ -210,7 +210,7 @@ static int lan966x_fdma_tx_alloc(struct lan966x_tx *tx)
 	if (!tx->dcbs_buf)
 		return -ENOMEM;
 
-	err = fdma_alloc_coherent(lan966x->dev, fdma);
+	err = fdma_alloc_coherent(lan966x->dma_dev, fdma);
 	if (err)
 		goto out;
 
@@ -230,7 +230,7 @@ static void lan966x_fdma_tx_free(struct lan966x_tx *tx)
 	struct lan966x *lan966x = tx->lan966x;
 
 	kfree(tx->dcbs_buf);
-	fdma_free_coherent(lan966x->dev, &tx->fdma);
+	fdma_free_coherent(lan966x->dma_dev, &tx->fdma);
 }
 
 static void lan966x_fdma_tx_activate(struct lan966x_tx *tx)
@@ -355,7 +355,7 @@ static void lan966x_fdma_tx_clear_buf(struct lan966x *lan966x, int weight)
 
 		dcb_buf->used = false;
 		if (dcb_buf->use_skb) {
-			dma_unmap_single(lan966x->dev,
+			dma_unmap_single(lan966x->dma_dev,
 					 dcb_buf->dma_addr,
 					 dcb_buf->len,
 					 DMA_TO_DEVICE);
@@ -364,7 +364,7 @@ static void lan966x_fdma_tx_clear_buf(struct lan966x *lan966x, int weight)
 				napi_consume_skb(dcb_buf->data.skb, weight);
 		} else {
 			if (dcb_buf->xdp_ndo)
-				dma_unmap_single(lan966x->dev,
+				dma_unmap_single(lan966x->dma_dev,
 						 dcb_buf->dma_addr,
 						 dcb_buf->len,
 						 DMA_TO_DEVICE);
@@ -400,7 +400,7 @@ static int lan966x_fdma_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
 	if (unlikely(!page))
 		return FDMA_ERROR;
 
-	dma_sync_single_for_cpu(lan966x->dev,
+	dma_sync_single_for_cpu(lan966x->dma_dev,
 				(dma_addr_t)db->dataptr + XDP_PACKET_HEADROOM,
 				FDMA_DCB_STATUS_BLOCKL(db->status),
 				DMA_FROM_DEVICE);
@@ -635,11 +635,11 @@ int lan966x_fdma_xmit_xdpf(struct lan966x_port *port, void *ptr, u32 len)
 		lan966x_ifh_set_bypass(ifh, 1);
 		lan966x_ifh_set_port(ifh, BIT_ULL(port->chip_port));
 
-		dma_addr = dma_map_single(lan966x->dev,
+		dma_addr = dma_map_single(lan966x->dma_dev,
 					  xdpf->data - IFH_LEN_BYTES,
 					  xdpf->len + IFH_LEN_BYTES,
 					  DMA_TO_DEVICE);
-		if (dma_mapping_error(lan966x->dev, dma_addr)) {
+		if (dma_mapping_error(lan966x->dma_dev, dma_addr)) {
 			ret = NETDEV_TX_OK;
 			goto out;
 		}
@@ -655,7 +655,7 @@ int lan966x_fdma_xmit_xdpf(struct lan966x_port *port, void *ptr, u32 len)
 		lan966x_ifh_set_port(ifh, BIT_ULL(port->chip_port));
 
 		dma_addr = page_pool_get_dma_addr(page);
-		dma_sync_single_for_device(lan966x->dev,
+		dma_sync_single_for_device(lan966x->dma_dev,
 					   dma_addr + XDP_PACKET_HEADROOM,
 					   len + IFH_LEN_BYTES,
 					   DMA_TO_DEVICE);
@@ -734,9 +734,9 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
 	memcpy(skb->data, ifh, IFH_LEN_BYTES);
 	skb_put(skb, 4);
 
-	dma_addr = dma_map_single(lan966x->dev, skb->data, skb->len,
+	dma_addr = dma_map_single(lan966x->dma_dev, skb->data, skb->len,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(lan966x->dev, dma_addr)) {
+	if (dma_mapping_error(lan966x->dma_dev, dma_addr)) {
 		dev->stats.tx_dropped++;
 		err = NETDEV_TX_OK;
 		goto release;
@@ -842,7 +842,7 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
 			page_pool_put_full_page(page_pool,
 						old_pages[i][j], false);
 
-	fdma_free_coherent(lan966x->dev, &fdma_rx_old);
+	fdma_free_coherent(lan966x->dma_dev, &fdma_rx_old);
 
 	page_pool_destroy(page_pool);
 
@@ -992,7 +992,7 @@ int lan966x_fdma_init(struct lan966x *lan966x)
 
 	err = lan966x_fdma_tx_alloc(&lan966x->tx);
 	if (err) {
-		fdma_free_coherent(lan966x->dev, &lan966x->rx.fdma);
+		fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
 		page_pool_destroy(lan966x->rx.page_pool);
 		return err;
 	}
@@ -1014,7 +1014,7 @@ void lan966x_fdma_deinit(struct lan966x *lan966x)
 	napi_disable(&lan966x->napi);
 
 	lan966x_fdma_rx_free_pages(&lan966x->rx);
-	fdma_free_coherent(lan966x->dev, &lan966x->rx.fdma);
+	fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
 	page_pool_destroy(lan966x->rx.page_pool);
 	lan966x_fdma_tx_free(&lan966x->tx);
 }
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 1179a6e127c5..2741f7c9fa4c 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -7,6 +7,7 @@
 #include <linux/ip.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
+#include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -1081,6 +1082,20 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
 	return 0;
 }
 
+/* When enumerated over PCIe, dev is a platform device with no
+ * iommus/dma-ranges of its own, so DMA must target the PCIe endpoint instead.
+ * The result differs from dev only in that case; lan966x_is_pci() relies on it.
+ */
+static struct device *lan966x_get_dma_dev(struct device *dev)
+{
+	for (struct device *p = dev->parent; p; p = p->parent) {
+		if (dev_is_pci(p))
+			return p;
+	}
+
+	return dev;
+}
+
 static int lan966x_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *ports, *portnp;
@@ -1094,6 +1109,7 @@ static int lan966x_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, lan966x);
 	lan966x->dev = &pdev->dev;
+	lan966x->dma_dev = lan966x_get_dma_dev(lan966x->dev);
 
 	if (!device_get_mac_address(&pdev->dev, mac_addr)) {
 		ether_addr_copy(lan966x->base_mac, mac_addr);
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index 83c361abb789..3f09f8ddf620 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -270,6 +270,9 @@ struct lan966x_skb_cb {
 struct lan966x {
 	struct device *dev;
 
+	/* Device used for DMA; the PCIe endpoint when enumerated over PCIe. */
+	struct device *dma_dev;
+
 	u8 num_phys_ports;
 	struct lan966x_port **ports;
 
@@ -573,6 +576,13 @@ void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x);
 int lan966x_fdma_get_max_frame(struct lan966x *lan966x);
 int lan966x_qsys_sw_status(struct lan966x *lan966x);
 
+/* dma_dev differs from dev only on the PCIe path. */
+static inline bool lan966x_is_pci(struct lan966x *lan966x)
+{
+	return IS_ENABLED(CONFIG_MCHP_LAN966X_PCI) &&
+	       lan966x->dma_dev != lan966x->dev;
+}
+
 int lan966x_lag_port_join(struct lan966x_port *port,
 			  struct net_device *brport_dev,
 			  struct net_device *bond,

-- 
2.34.1


