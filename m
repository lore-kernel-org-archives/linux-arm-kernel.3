Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80CFC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5AMpzmpWIWNfZ2Bf9O4LXaAh9xeA0cRLiRBUuOdgbE=; b=gTqZLZsJ6GNP9IS+7xBfBUJpkg
	uRbRrK8919hH3kr6k5JaHXbWmCP3sUr7zN/tNlLmKg+bdw1YgmT29jGsTHARmaMUVlRp71lY/c1vt
	+xXM8UAXXzcqIGBTUDHkwDb0AoCcgV4X0kh1OCwmNtP8iqtLTn8t61I+4lBx8UdaaBomtQkSHRFTN
	lyGGLVDb4aXus/yBzDS5a5lZ5HAfJViNErH6UPd9/iUELlCMt6grlmbVaySwOgP/qU/D5xsuiujpJ
	DjVnfjvgOKRvD8Zm99d4OmC3I2FUwb/ViqCUB7xKWTuSy9pW+I0sYqxA6Funvo5QTBRJ1M1OEaVF2
	zhCONaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvI-0000000BjBb-0CJV;
	Wed, 09 Sep 2026 13:01:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvE-0000000Bj8c-2xSU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788958864; x=1820494864;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=b7nkWWg9H4K4PT6b6lRMFPDXbmtAk4BBT2qgpFb9Eqc=;
  b=MBSXKy/9hriaFO3Ws8XUoswauk/RU1PufKXv+vMsU5T6j8uzhGFITPHE
   K6VygI16EQrtOq6XbtEjbe3u5RI2rXwG8s7a9Q3z0uZBhEXYJ9evpsTlp
   5W71V8r43k2bYw8BBDNNDMoVMONjTnQNNe/ivxIXmaWswi6AMGGhht8Dl
   ueaESRN13jaF/9u5/MaEVqLvJ4PNB3yYk1rl0rFQP1p6+/lhA1IFqqsLt
   YPlOOjJlTa9QENWJMAGoqUY1xkuC5eD6ibioVwr6zzq14056itIYMNpPq
   +JyEgjhMLM41jDSO4NCQA+8yz1wgayxEbzm/v/+Zcg/AWD6tnHuMHZw2R
   A==;
X-CSE-ConnectionGUID: BiZMwvF+QV6EJjQHYW0fxg==
X-CSE-MsgGUID: GbEP4hSZSAWx62Hun73A/A==
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="73307806"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2026 06:01:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 9 Sep 2026 06:01:03 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 9 Sep 2026 06:00:59 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 9 Sep 2026 15:00:12 +0200
Subject: [PATCH net-next v6 10/14] net: lan966x: add PCIe FDMA support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-lan966x-pci-fdma-v6-10-6f48dab9d671@microchip.com>
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
X-CRM114-CacheID: sfid-20260909_060104_847925_41AB39B9 
X-CRM114-Status: GOOD (  26.89  )
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

Add PCIe FDMA support for lan966x. The PCIe FDMA path uses contiguous
DMA buffers mapped through the endpoint's ATU, with memcpy-based frame
transfer instead of per-page DMA mappings.

With PCIe FDMA, throughput increases from ~33 Mbps (register-based I/O)
to ~620 Mbps on an Intel x86 host with a lan966x PCIe card.

XDP is not supported on this path yet, so do not advertise xdp_features
and reject program attach for PCIe instances.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/Makefile    |   4 +
 .../ethernet/microchip/lan966x/lan966x_fdma_pci.c  | 404 +++++++++++++++++++++
 .../net/ethernet/microchip/lan966x/lan966x_main.c  |  11 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.h  |   7 +
 .../net/ethernet/microchip/lan966x/lan966x_regs.h  |  10 +
 .../net/ethernet/microchip/lan966x/lan966x_xdp.c   |   6 +
 6 files changed, 439 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/Makefile b/drivers/net/ethernet/microchip/lan966x/Makefile
index 4cdbe263502c..02db4d4d9826 100644
--- a/drivers/net/ethernet/microchip/lan966x/Makefile
+++ b/drivers/net/ethernet/microchip/lan966x/Makefile
@@ -18,6 +18,10 @@ lan966x-switch-objs  := lan966x_main.o lan966x_phylink.o lan966x_port.o \
 lan966x-switch-$(CONFIG_LAN966X_DCB) += lan966x_dcb.o
 lan966x-switch-$(CONFIG_DEBUG_FS) += lan966x_vcap_debugfs.o
 
+ifneq ($(CONFIG_MCHP_LAN966X_PCI),)
+lan966x-switch-y += lan966x_fdma_pci.o
+endif
+
 # Provide include files
 ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/vcap
 ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/fdma
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
new file mode 100644
index 000000000000..f1f3c789d3a6
--- /dev/null
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "fdma_api.h"
+#include "lan966x_main.h"
+
+static int lan966x_fdma_pci_dataptr_cb(struct fdma *fdma, int dcb, int db,
+				       u64 *dataptr)
+{
+	u64 addr;
+
+	addr = fdma_dataptr_dma_addr_contiguous(fdma, dcb, db);
+
+	*dataptr = fdma_pci_atu_translate_addr(fdma->atu_region, addr);
+
+	return 0;
+}
+
+static int lan966x_fdma_pci_nextptr_cb(struct fdma *fdma, int dcb, u64 *nextptr)
+{
+	u64 addr;
+
+	fdma_nextptr_cb(fdma, dcb, &addr);
+
+	*nextptr = fdma_pci_atu_translate_addr(fdma->atu_region, addr);
+
+	return 0;
+}
+
+static int lan966x_fdma_pci_rx_alloc(struct lan966x_rx *rx)
+{
+	struct lan966x *lan966x = rx->lan966x;
+	struct fdma *fdma = &rx->fdma;
+	int err;
+
+	err = fdma_alloc_coherent_and_map(lan966x->dma_dev, fdma,
+					  &lan966x->atu);
+	if (err)
+		return err;
+
+	err = fdma_dcbs_init(fdma,
+			     FDMA_DCB_INFO_DATAL(fdma->db_size - XDP_PACKET_HEADROOM),
+			     FDMA_DCB_STATUS_INTR);
+	if (err) {
+		fdma_free_coherent_and_unmap(lan966x->dma_dev, fdma);
+		return err;
+	}
+
+	lan966x_fdma_llp_configure(lan966x,
+				   fdma->atu_region->base_addr,
+				   fdma->channel_id);
+
+	return 0;
+}
+
+static int lan966x_fdma_pci_tx_alloc(struct lan966x_tx *tx)
+{
+	struct lan966x *lan966x = tx->lan966x;
+	struct fdma *fdma = &tx->fdma;
+	int err;
+
+	err = fdma_alloc_coherent_and_map(lan966x->dma_dev, fdma,
+					  &lan966x->atu);
+	if (err)
+		return err;
+
+	err = fdma_dcbs_init(fdma,
+			     FDMA_DCB_INFO_DATAL(fdma->db_size),
+			     FDMA_DCB_STATUS_DONE);
+	if (err) {
+		fdma_free_coherent_and_unmap(lan966x->dma_dev, fdma);
+		return err;
+	}
+
+	lan966x_fdma_llp_configure(lan966x,
+				   fdma->atu_region->base_addr,
+				   fdma->channel_id);
+
+	return 0;
+}
+
+static int lan966x_fdma_pci_get_next_dcb(struct fdma *fdma)
+{
+	struct fdma_db *db;
+
+	for (int i = 0; i < fdma->n_dcbs; i++) {
+		db = fdma_db_get(fdma, i, 0);
+
+		if (!fdma_db_is_done(db))
+			continue;
+		if (fdma_is_last(fdma, &fdma->dcbs[i]))
+			continue;
+
+		return i;
+	}
+
+	return -ENOSPC;
+}
+
+/* TX slot layout (sizes in bytes):
+ *
+ *  +---------------------+-----+---------+-----+
+ *  | XDP_PACKET_HEADROOM | IFH | payload | FCS |
+ *  |         256         |  28 |   len   |   4 |
+ *  +---------------------+-----+---------+-----+
+ *  |<---------------- db_size ----------------->|
+ *
+ * Return true if the frame plus required overhead fits.
+ */
+static bool lan966x_fdma_pci_tx_size_fits(struct fdma *fdma, u32 len)
+{
+	return XDP_PACKET_HEADROOM + IFH_LEN_BYTES + len + ETH_FCS_LEN <=
+	       fdma->db_size;
+}
+
+/* Return true if blockl is a valid RX frame size. */
+static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)
+{
+	return blockl >= IFH_LEN_BYTES + ETH_HLEN + ETH_FCS_LEN &&
+	       blockl <= fdma->db_size - XDP_PACKET_HEADROOM;
+}
+
+static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
+{
+	struct lan966x *lan966x = rx->lan966x;
+	struct fdma *fdma = &rx->fdma;
+	struct lan966x_port *port;
+	struct fdma_db *db;
+	void *virt_addr;
+	u32 blockl;
+
+	/* virt_addr points to the IFH. */
+	virt_addr = fdma_dataptr_virt_addr_contiguous(fdma,
+						      fdma->dcb_index,
+						      fdma->db_index);
+
+	lan966x_ifh_get_src_port(virt_addr, src_port);
+
+	if (*src_port >= lan966x->num_phys_ports)
+		return FDMA_ERROR;
+
+	port = lan966x->ports[*src_port];
+	if (!port)
+		return FDMA_ERROR;
+
+	db = fdma_db_next_get(fdma);
+
+	/* BLOCKL is a 16-bit HW-populated field; reject obviously-bad
+	 * values before they feed memcpy/XDP sizes.
+	 */
+	blockl = FDMA_DCB_STATUS_BLOCKL(db->status);
+	if (!lan966x_fdma_pci_rx_size_fits(fdma, blockl))
+		return FDMA_ERROR;
+
+	return FDMA_PASS;
+}
+
+static struct sk_buff *lan966x_fdma_pci_rx_get_frame(struct lan966x_rx *rx,
+						     u64 src_port)
+{
+	struct lan966x *lan966x = rx->lan966x;
+	struct fdma *fdma = &rx->fdma;
+	struct sk_buff *skb;
+	struct fdma_db *db;
+	u32 data_len;
+
+	/* Get the received frame and create an SKB for it. */
+	db = fdma_db_next_get(fdma);
+	data_len = FDMA_DCB_STATUS_BLOCKL(db->status);
+
+	skb = napi_alloc_skb(&lan966x->napi, data_len);
+	if (unlikely(!skb))
+		return NULL;
+
+	memcpy(skb->data,
+	       fdma_dataptr_virt_addr_contiguous(fdma,
+						 fdma->dcb_index,
+						 fdma->db_index),
+						 data_len);
+
+	skb_put(skb, data_len);
+
+	skb->dev = lan966x->ports[src_port]->dev;
+	skb_pull(skb, IFH_LEN_BYTES);
+
+	skb_trim(skb, skb->len - ETH_FCS_LEN);
+
+	skb->protocol = eth_type_trans(skb, skb->dev);
+
+	if (lan966x->bridge_mask & BIT(src_port)) {
+		skb->offload_fwd_mark = 1;
+
+		skb_reset_network_header(skb);
+		if (!lan966x_hw_offload(lan966x, src_port, skb))
+			skb->offload_fwd_mark = 0;
+	}
+
+	skb->dev->stats.rx_bytes += skb->len;
+	skb->dev->stats.rx_packets++;
+
+	return skb;
+}
+
+static int lan966x_fdma_pci_xmit(struct sk_buff *skb, __be32 *ifh,
+				 struct net_device *dev)
+{
+	struct lan966x_port *port = netdev_priv(dev);
+	struct lan966x *lan966x = port->lan966x;
+	struct lan966x_tx *tx = &lan966x->tx;
+	struct fdma *fdma = &tx->fdma;
+	int next_to_use;
+	void *virt_addr;
+
+	next_to_use = lan966x_fdma_pci_get_next_dcb(fdma);
+
+	if (next_to_use < 0) {
+		netif_stop_queue(dev);
+		return NETDEV_TX_BUSY;
+	}
+
+	if (skb_put_padto(skb, ETH_ZLEN)) {
+		dev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
+	if (!lan966x_fdma_pci_tx_size_fits(fdma, skb->len)) {
+		dev_kfree_skb_any(skb);
+		dev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
+	skb_tx_timestamp(skb);
+
+	/* virt_addr points to the IFH. */
+	virt_addr = fdma_dataptr_virt_addr_contiguous(fdma, next_to_use, 0);
+	memcpy(virt_addr, ifh, IFH_LEN_BYTES);
+	memcpy(virt_addr + IFH_LEN_BYTES, skb->data, skb->len);
+
+	/* Order frame write before DCB status write below. */
+	dma_wmb();
+
+	fdma_dcb_add(fdma,
+		     next_to_use,
+		     0,
+		     FDMA_DCB_STATUS_INTR |
+		     FDMA_DCB_STATUS_SOF |
+		     FDMA_DCB_STATUS_EOF |
+		     FDMA_DCB_STATUS_BLOCKO(0) |
+		     FDMA_DCB_STATUS_BLOCKL(IFH_LEN_BYTES + skb->len + ETH_FCS_LEN));
+
+	/* Start the transmission. */
+	lan966x_fdma_tx_start(tx);
+
+	dev->stats.tx_bytes += skb->len;
+	dev->stats.tx_packets++;
+
+	/* Safe to free: PTP is not supported on the PCIe path yet,
+	 * so lan966x->ptp is always 0 here.
+	 */
+	dev_consume_skb_any(skb);
+
+	return NETDEV_TX_OK;
+}
+
+static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
+{
+	struct lan966x *lan966x = container_of(napi, struct lan966x, napi);
+	struct lan966x_rx *rx = &lan966x->rx;
+	struct fdma *fdma = &rx->fdma;
+	int dcb_reload, old_dcb;
+	struct sk_buff *skb;
+	int counter = 0;
+	u64 src_port;
+
+	/* Wake any stopped TX queues if a TX DCB is available. */
+	spin_lock(&lan966x->tx_lock);
+	if (lan966x_fdma_pci_get_next_dcb(&lan966x->tx.fdma) >= 0)
+		lan966x_fdma_wakeup_netdev(lan966x);
+	spin_unlock(&lan966x->tx_lock);
+
+	dcb_reload = fdma->dcb_index;
+
+	/* Get all received skbs. */
+	while (counter < weight) {
+		if (!fdma_has_frames(fdma))
+			break;
+		/* Order DONE read before DCB/frame reads below. */
+		dma_rmb();
+		counter++;
+		switch (lan966x_fdma_pci_rx_check_frame(rx, &src_port)) {
+		case FDMA_PASS:
+			break;
+		case FDMA_ERROR:
+			/* No rx_dropped increment here because src_port is
+			 * invalid.
+			 */
+			fdma_dcb_advance(fdma);
+			continue;
+		}
+		skb = lan966x_fdma_pci_rx_get_frame(rx, src_port);
+		fdma_dcb_advance(fdma);
+		if (!skb) {
+			lan966x->ports[src_port]->dev->stats.rx_dropped++;
+			continue;
+		}
+
+		napi_gro_receive(&lan966x->napi, skb);
+	}
+	while (dcb_reload != fdma->dcb_index) {
+		old_dcb = dcb_reload;
+		dcb_reload++;
+		dcb_reload &= fdma->n_dcbs - 1;
+
+		fdma_dcb_add(fdma,
+			     old_dcb,
+			     FDMA_DCB_INFO_DATAL(fdma->db_size - XDP_PACKET_HEADROOM),
+			     FDMA_DCB_STATUS_INTR);
+
+		lan966x_fdma_rx_reload(rx);
+	}
+
+	if (counter < weight && napi_complete_done(napi, counter))
+		lan_wr(0xff, lan966x, FDMA_INTR_DB_ENA);
+
+	return counter;
+}
+
+static int lan966x_fdma_pci_init(struct lan966x *lan966x)
+{
+	struct fdma *rx_fdma = &lan966x->rx.fdma;
+	struct fdma *tx_fdma = &lan966x->tx.fdma;
+	int err;
+
+	if (!lan966x->fdma)
+		return 0;
+
+	lan_wr(FDMA_CTRL_NRESET_SET(0), lan966x, FDMA_CTRL);
+	lan_wr(FDMA_CTRL_NRESET_SET(1), lan966x, FDMA_CTRL);
+
+	fdma_pci_atu_init(&lan966x->atu, lan966x->regs[TARGET_PCIE_DBI]);
+
+	lan966x->rx.lan966x = lan966x;
+	lan966x->rx.max_mtu = lan966x_fdma_get_max_frame(lan966x);
+	rx_fdma->channel_id = FDMA_XTR_CHANNEL;
+	rx_fdma->n_dcbs = FDMA_DCB_MAX;
+	rx_fdma->n_dbs = FDMA_RX_DCB_MAX_DBS;
+	rx_fdma->priv = lan966x;
+	rx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
+	rx_fdma->size = fdma_get_size_contiguous(rx_fdma);
+	rx_fdma->ops.nextptr_cb = &lan966x_fdma_pci_nextptr_cb;
+	rx_fdma->ops.dataptr_cb = &lan966x_fdma_pci_dataptr_cb;
+
+	lan966x->tx.lan966x = lan966x;
+	tx_fdma->channel_id = FDMA_INJ_CHANNEL;
+	tx_fdma->n_dcbs = FDMA_DCB_MAX;
+	tx_fdma->n_dbs = FDMA_TX_DCB_MAX_DBS;
+	tx_fdma->priv = lan966x;
+	tx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
+	tx_fdma->size = fdma_get_size_contiguous(tx_fdma);
+	tx_fdma->ops.nextptr_cb = &lan966x_fdma_pci_nextptr_cb;
+	tx_fdma->ops.dataptr_cb = &lan966x_fdma_pci_dataptr_cb;
+
+	err = lan966x_fdma_pci_rx_alloc(&lan966x->rx);
+	if (err)
+		return err;
+
+	err = lan966x_fdma_pci_tx_alloc(&lan966x->tx);
+	if (err) {
+		fdma_free_coherent_and_unmap(lan966x->dma_dev, rx_fdma);
+		return err;
+	}
+
+	lan966x_fdma_rx_start(&lan966x->rx);
+
+	return 0;
+}
+
+static int lan966x_fdma_pci_resize(struct lan966x *lan966x)
+{
+	return -EOPNOTSUPP;
+}
+
+static void lan966x_fdma_pci_deinit(struct lan966x *lan966x)
+{
+	if (!lan966x->fdma)
+		return;
+
+	if (lan966x->fdma_ndev)
+		napi_disable(&lan966x->napi);
+
+	lan966x_fdma_tx_disable_netdev(lan966x);
+	lan966x_fdma_rx_disable(&lan966x->rx);
+	lan966x_fdma_tx_disable(&lan966x->tx);
+
+	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->rx.fdma);
+	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->tx.fdma);
+}
+
+const struct lan966x_fdma_ops lan966x_fdma_pci_ops = {
+	.fdma_init = &lan966x_fdma_pci_init,
+	.fdma_deinit = &lan966x_fdma_pci_deinit,
+	.fdma_xmit = &lan966x_fdma_pci_xmit,
+	.fdma_poll = &lan966x_fdma_pci_napi_poll,
+	.fdma_resize = &lan966x_fdma_pci_resize,
+};
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index d6ce1e3e373f..e089c08b9c37 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -50,6 +50,7 @@ struct lan966x_main_io_resource {
 static const struct lan966x_main_io_resource lan966x_main_iomap[] =  {
 	{ TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
 	{ TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
+	{ TARGET_PCIE_DBI,             0x400000, 0 }, /* 0xe0400000 */
 	{ TARGET_ORG,                         0, 1 }, /* 0xe2000000 */
 	{ TARGET_GCB,                    0x4000, 1 }, /* 0xe2004000 */
 	{ TARGET_QS,                     0x8000, 1 }, /* 0xe2008000 */
@@ -873,7 +874,8 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
 
 	port->phylink = phylink;
 
-	if (lan966x->fdma)
+	/* XDP is not supported on the PCIe FDMA path. */
+	if (lan966x->fdma && !lan966x_is_pci(lan966x))
 		dev->xdp_features = NETDEV_XDP_ACT_BASIC |
 				    NETDEV_XDP_ACT_REDIRECT |
 				    NETDEV_XDP_ACT_NDO_XMIT;
@@ -1128,7 +1130,8 @@ static int lan966x_probe(struct platform_device *pdev)
 	lan966x->dev = &pdev->dev;
 	lan966x->dma_dev = lan966x_get_dma_dev(lan966x->dev);
 
-	lan966x->ops = &lan966x_fdma_ops;
+	lan966x->ops = lan966x_is_pci(lan966x) ? &lan966x_fdma_pci_ops :
+						 &lan966x_fdma_ops;
 
 	if (!device_get_mac_address(&pdev->dev, mac_addr)) {
 		ether_addr_copy(lan966x->base_mac, mac_addr);
@@ -1187,7 +1190,9 @@ static int lan966x_probe(struct platform_device *pdev)
 		if (err)
 			return dev_err_probe(&pdev->dev, err, "Unable to use ptp irq");
 
-		lan966x->ptp = 1;
+		/* PTP is not supported on the PCIe path yet. */
+		if (!lan966x_is_pci(lan966x))
+			lan966x->ptp = 1;
 	}
 
 	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index b7e3ce4f0355..48c7527845fb 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -17,6 +17,7 @@
 #include <net/xdp.h>
 
 #include <fdma_api.h>
+#include <fdma_pci.h>
 #include <vcap_api.h>
 #include <vcap_api_client.h>
 
@@ -291,6 +292,10 @@ struct lan966x {
 
 	void __iomem *regs[NUM_TARGETS];
 
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+	struct fdma_pci_atu atu;
+#endif
+
 	int shared_queue_sz;
 
 	u8 base_mac[ETH_ALEN];
@@ -590,6 +595,8 @@ void lan966x_fdma_tx_disable_netdev(struct lan966x *lan966x);
 int lan966x_fdma_get_max_frame(struct lan966x *lan966x);
 int lan966x_qsys_sw_status(struct lan966x *lan966x);
 
+extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
+
 /* dma_dev differs from dev only on the PCIe path. */
 static inline bool lan966x_is_pci(struct lan966x *lan966x)
 {
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h b/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
index aba0d36ae6b5..4778ea217673 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
@@ -20,6 +20,7 @@ enum lan966x_target {
 	TARGET_FDMA = 21,
 	TARGET_GCB = 27,
 	TARGET_ORG = 36,
+	TARGET_PCIE_DBI = 40,
 	TARGET_PTP = 41,
 	TARGET_QS = 42,
 	TARGET_QSYS = 46,
@@ -1009,6 +1010,15 @@ enum lan966x_target {
 #define FDMA_CH_CFG_CH_MEM_GET(x)\
 	FIELD_GET(FDMA_CH_CFG_CH_MEM, x)
 
+/*      FDMA:FDMA:FDMA_CTRL */
+#define FDMA_CTRL                 __REG(TARGET_FDMA, 0, 1, 8, 0, 1, 428, 424, 0, 1, 4)
+
+#define FDMA_CTRL_NRESET                         BIT(0)
+#define FDMA_CTRL_NRESET_SET(x)\
+	FIELD_PREP(FDMA_CTRL_NRESET, x)
+#define FDMA_CTRL_NRESET_GET(x)\
+	FIELD_GET(FDMA_CTRL_NRESET, x)
+
 /*      FDMA:FDMA:FDMA_PORT_CTRL */
 #define FDMA_PORT_CTRL(r)         __REG(TARGET_FDMA, 0, 1, 8, 0, 1, 428, 376, r, 2, 4)
 
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
index 9ee61db8690b..e63634887f64 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
@@ -20,6 +20,12 @@ static int lan966x_xdp_setup(struct net_device *dev, struct netdev_bpf *xdp)
 		return -EOPNOTSUPP;
 	}
 
+	if (lan966x_is_pci(lan966x)) {
+		NL_SET_ERR_MSG_MOD(xdp->extack,
+				   "XDP is not supported on the PCIe FDMA path");
+		return -EOPNOTSUPP;
+	}
+
 	old_xdp = lan966x_xdp_present(lan966x);
 	old_prog = xchg(&port->xdp_prog, xdp->prog);
 	new_xdp = lan966x_xdp_present(lan966x);

-- 
2.34.1


