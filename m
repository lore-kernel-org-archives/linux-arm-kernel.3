Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFF8CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cw272UmBkHrLlshF9k6ZFsunMTGjNPJGfe9OvimHZA=; b=Q49m/B7mJ3tSJKFMIzH+ab2f1c
	txnE9QLjlSHv6RlTXgQ5m6OD+8m5LBRXdCONBd/BsWYhJ8bWVdUYjHNtuWqJDXnLHZc3XY58vxwT9
	tdB3w3bxIF5YxS0Z/mXADakJKYhS8VewbBBggil/pp99TMpbPXkqg6zYbOV4c+ux5D77Ho0ejwRpx
	ivIDpkJ5nc/nZ6wg1ZO1UKIRA9Att+lclQ+pMBZfIwb2FlvqUn3oADvmSWjSPPk1wn4vTfi8iMOHK
	wlIjPxd8UcX3kFKHFyNoqPe6V4BLla4MWp4VpISFkAJYujauSCKhUehg+2A/VoJS4/ACeUTv14Lab
	wk7rjHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc4b-00000003vBK-48g9;
	Wed, 20 May 2026 08:14:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc4a-00000003v28-1DnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779264875; x=1810800875;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=xyn6DbImBQZkH/DheGVyhdAl/vlHxlhKkZ4K67sdPA8=;
  b=PwqnhfFc9nO/1zidSZHtSHM8+5DVRX08lTGbzVd5mDcBEHuhVvX2vy6y
   kV20qanIQ0D3Hwjt+ewBhKvvVIMlvjH1yia7TWxPN2efgElJuBMBdexcr
   TkwDDqa+PaBWeqVcKqlAXPlxRacs3g8BW48EzUafiU1qaYNvjslZkYPUH
   dX2BR+B8VanK3Do7U67UJbCbdKNxa8zppgiIa7YN8BCSXA7IRypVNea4c
   GPc92sAdYZVcajN+RIgEaTfH0T3iIAuF6Mfif2+Tpmr6B7NYHP3xlle03
   lst51vQZeBftKU5I5OQ1arIb67Z9pkf5WMDq4Cy4U/EwbUkIMVIynEiQl
   g==;
X-CSE-ConnectionGUID: OZL637T5TrOk6wHqnbz1rw==
X-CSE-MsgGUID: +Fi3xsbOTIyXaKJruEQ+3w==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="66575379"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2026 01:14:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 20 May 2026 01:14:35 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 20 May 2026 01:14:31 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 20 May 2026 10:12:22 +0200
Subject: [PATCH net-next v5 10/13] net: lan966x: add PCIe FDMA MTU change
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260520-lan966x-pci-fdma-v5-10-ca56197ae05b@microchip.com>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
In-Reply-To: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
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
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_011436_346712_1F53F735 
X-CRM114-Status: GOOD (  20.98  )
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

Add MTU change support for the PCIe FDMA path. When the MTU changes,
the contiguous ATU-mapped RX and TX buffers are reallocated with the
new size. On allocation failure, the existing buffers are reused
after being reset.

Cap the PCIe DCB ring at 256 (FDMA_PCI_DCB_MAX) to keep the entire
contiguous allocation under MAX_PAGE_ORDER at jumbo MTU, which 512
DCBs would overflow.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/lan966x/lan966x_fdma_pci.c  | 157 ++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
index c27d9e76e735..3ea6d22ee573 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
@@ -3,6 +3,11 @@
 #include "fdma_api.h"
 #include "lan966x_main.h"
 
+/* Ring must fit in one MAX_PAGE_ORDER DMA block; 512 DCBs overflows
+ * at jumbo MTU.
+ */
+#define FDMA_PCI_DCB_MAX	256
+
 static int lan966x_fdma_pci_dataptr_cb(struct fdma *fdma, int dcb, int db,
 				       u64 *dataptr)
 {
@@ -332,7 +337,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 	lan966x->rx.lan966x = lan966x;
 	lan966x->rx.max_mtu = lan966x_fdma_get_max_frame(lan966x);
 	rx_fdma->channel_id = FDMA_XTR_CHANNEL;
-	rx_fdma->n_dcbs = FDMA_DCB_MAX;
+	rx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	rx_fdma->n_dbs = FDMA_RX_DCB_MAX_DBS;
 	rx_fdma->priv = lan966x;
 	rx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -342,7 +347,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 
 	lan966x->tx.lan966x = lan966x;
 	tx_fdma->channel_id = FDMA_INJ_CHANNEL;
-	tx_fdma->n_dcbs = FDMA_DCB_MAX;
+	tx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	tx_fdma->n_dbs = FDMA_TX_DCB_MAX_DBS;
 	tx_fdma->priv = lan966x;
 	tx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -365,9 +370,155 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 	return 0;
 }
 
+/* Reset existing rx and tx buffers. */
+static void lan966x_fdma_pci_reset_mem(struct lan966x *lan966x)
+{
+	struct lan966x_rx *rx = &lan966x->rx;
+	struct lan966x_tx *tx = &lan966x->tx;
+
+	memset(rx->fdma.dcbs, 0, rx->fdma.size);
+	memset(tx->fdma.dcbs, 0, tx->fdma.size);
+
+	fdma_dcbs_init(&rx->fdma,
+		       FDMA_DCB_INFO_DATAL(rx->fdma.db_size),
+		       FDMA_DCB_STATUS_INTR);
+
+	fdma_dcbs_init(&tx->fdma,
+		       FDMA_DCB_INFO_DATAL(tx->fdma.db_size),
+		       FDMA_DCB_STATUS_DONE);
+
+	lan966x_fdma_llp_configure(lan966x,
+				   tx->fdma.atu_region->base_addr,
+				   tx->fdma.channel_id);
+	lan966x_fdma_llp_configure(lan966x,
+				   rx->fdma.atu_region->base_addr,
+				   rx->fdma.channel_id);
+}
+
+/* Drain in-flight xmit callers and stop all TX queues on every port. */
+static void lan966x_fdma_pci_stop_netdev(struct lan966x *lan966x)
+{
+	for (int i = 0; i < lan966x->num_phys_ports; ++i) {
+		struct lan966x_port *port = lan966x->ports[i];
+
+		if (port)
+			netif_tx_disable(port->dev);
+	}
+}
+
+/* Wake all TX queues on every port (undoes lan966x_fdma_pci_stop_netdev). */
+static void lan966x_fdma_pci_wakeup_netdev(struct lan966x *lan966x)
+{
+	for (int i = 0; i < lan966x->num_phys_ports; ++i) {
+		struct lan966x_port *port = lan966x->ports[i];
+
+		if (port)
+			netif_tx_wake_all_queues(port->dev);
+	}
+}
+
+static int lan966x_fdma_pci_reload(struct lan966x *lan966x, int new_mtu)
+{
+	struct fdma tx_fdma_old = lan966x->tx.fdma;
+	struct fdma rx_fdma_old = lan966x->rx.fdma;
+	u32 old_mtu = lan966x->rx.max_mtu;
+	int err;
+
+	napi_synchronize(&lan966x->napi);
+	napi_disable(&lan966x->napi);
+	lan966x_fdma_pci_stop_netdev(lan966x);
+	lan966x_fdma_rx_disable(&lan966x->rx);
+	lan966x_fdma_tx_disable(&lan966x->tx);
+
+	lan966x->rx.max_mtu = new_mtu;
+
+	lan966x->tx.fdma.db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
+	lan966x->tx.fdma.size = fdma_get_size_contiguous(&lan966x->tx.fdma);
+	lan966x->rx.fdma.db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
+	lan966x->rx.fdma.size = fdma_get_size_contiguous(&lan966x->rx.fdma);
+
+	err = lan966x_fdma_pci_rx_alloc(&lan966x->rx);
+	if (err)
+		goto restore;
+
+	err = lan966x_fdma_pci_tx_alloc(&lan966x->tx);
+	if (err) {
+		fdma_free_coherent_and_unmap(lan966x->dev, &lan966x->rx.fdma);
+		goto restore;
+	}
+
+	/* Free and unmap old memory. */
+	fdma_free_coherent_and_unmap(lan966x->dev, &rx_fdma_old);
+	fdma_free_coherent_and_unmap(lan966x->dev, &tx_fdma_old);
+
+	/* Keep this order: rx_start, wakeup_netdev, napi_enable. */
+	lan966x_fdma_rx_start(&lan966x->rx);
+	lan966x_fdma_pci_wakeup_netdev(lan966x);
+	napi_enable(&lan966x->napi);
+
+	return err;
+restore:
+
+	/* No new buffers are allocated at this point. Use the old buffers,
+	 * but reset them before starting the FDMA again.
+	 */
+
+	memcpy(&lan966x->tx.fdma, &tx_fdma_old, sizeof(struct fdma));
+	memcpy(&lan966x->rx.fdma, &rx_fdma_old, sizeof(struct fdma));
+
+	lan966x->rx.max_mtu = old_mtu;
+
+	lan966x_fdma_pci_reset_mem(lan966x);
+
+	/* Keep this order: rx_start, wakeup_netdev, napi_enable. */
+	lan966x_fdma_rx_start(&lan966x->rx);
+	lan966x_fdma_pci_wakeup_netdev(lan966x);
+	napi_enable(&lan966x->napi);
+
+	return err;
+}
+
+static int __lan966x_fdma_pci_reload(struct lan966x *lan966x, int max_mtu)
+{
+	int err;
+	u32 val;
+
+	/* Disable the CPU port. */
+	lan_rmw(QSYS_SW_PORT_MODE_PORT_ENA_SET(0),
+		QSYS_SW_PORT_MODE_PORT_ENA,
+		lan966x, QSYS_SW_PORT_MODE(CPU_PORT));
+
+	/* Flush the CPU queues. */
+	readx_poll_timeout(lan966x_qsys_sw_status,
+			   lan966x,
+			   val,
+			   !(QSYS_SW_STATUS_EQ_AVAIL_GET(val)),
+			   READL_SLEEP_US, READL_TIMEOUT_US);
+
+	/* Add a sleep in case there are frames between the queues and the CPU
+	 * port
+	 */
+	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
+
+	err = lan966x_fdma_pci_reload(lan966x, max_mtu);
+
+	/* Enable back the CPU port. */
+	lan_rmw(QSYS_SW_PORT_MODE_PORT_ENA_SET(1),
+		QSYS_SW_PORT_MODE_PORT_ENA,
+		lan966x, QSYS_SW_PORT_MODE(CPU_PORT));
+
+	return err;
+}
+
 static int lan966x_fdma_pci_resize(struct lan966x *lan966x)
 {
-	return -EOPNOTSUPP;
+	int max_mtu;
+
+	max_mtu = lan966x_fdma_get_max_frame(lan966x);
+	if (max_mtu == lan966x->rx.max_mtu)
+		return 0;
+
+	return __lan966x_fdma_pci_reload(lan966x, max_mtu);
 }
 
 static void lan966x_fdma_pci_deinit(struct lan966x *lan966x)

-- 
2.34.1


