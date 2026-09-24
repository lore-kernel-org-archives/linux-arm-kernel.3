Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D0FC98326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqRkkflyC7Z/r6fK8fOD8Fezk8D3s+rZH5pH+gtHS2Q=; b=Rc7mDHy07BNvqwdwyxAOfNw0mR
	4woXY0rMTOQNB/NqEJQFfd+hwrvHtnqSbGda3PUoqo2wCV+Wo4tphY5tPHGopa+4iYlo4da4n3NDB
	OZtqqMb1t2jFIwjW3+pnmR9Lin3UJIl16qFwIE2wr/KRysRspC1Sf3oDFVyG3wipU0406S81t+t8x
	I96j+gktIYq6WiLQ3MmdPYFUc3VHavWB3S+bBTYSyXWKYTvhAaZpYXtieE0YXHQo7lnVncV+SNmGb
	/LhLpLXQtVNVmnJrnhRgLbwvZKVG/NZ55TLNuOdzz4WkoFgYb7UDfH2H8JSVjhCKBo1jb2jDQLSmN
	J0zFRPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pZz-0000000C5B6-2qA5;
	Thu, 24 Sep 2026 19:58:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pZs-0000000C55x-3Jcw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790279877; x=1821815877;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yHAHGaIw7xWHbLsBatGbI8K42D/OICCxEX464FUuDgA=;
  b=hcS1RePGr8aFOjLN21tGDdWvfn//cmxfzttbWPjFclZcr8AKp1Yt3B5K
   bchjpM8TnRBoLeI1V6CtliG4/CBBm2xTha5vuk9vujxMkWHJeXTf/pFfp
   dioT5N6ydJem9uGIKKhIhniw9cU9VYjyzX9JMPvnBALNLU6jdlHDDRcsx
   UcShKuCglIZJk8pDu916+XFFHPCWgNrfYoTHIPvZy2qnA1I98IaliWIwf
   HxNF2BKiLPiWr4mkr7z9JAjSkpUYNnpj1A53y9vMQb+xHFAmXBlpbBn7Y
   DRejLFV1HsBbmsFTG/EzCTycyAbQF6+1SYVHYBlox3Iki05Aw/PHHbnqL
   A==;
X-CSE-ConnectionGUID: upnDy4IjTCS1vuGFhbKIug==
X-CSE-MsgGUID: x+QhZdkbQGem6zDsufeN5g==
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="295533230"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2026 12:57:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 24 Sep 2026 12:57:54 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 24 Sep 2026 12:57:50 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Sep 2026 21:57:00 +0200
Subject: [PATCH net-next v8 12/15] net: lan966x: add PCIe FDMA MTU change
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260924-lan966x-pci-fdma-v8-12-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
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
	<mohsin.bashr@gmail.com>, "Simon Horman" <horms@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_125756_847310_9132C4BD 
X-CRM114-Status: GOOD (  25.64  )
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

Add MTU change support for the PCIe FDMA path: on an MTU change, the
contiguous ATU-mapped RX and TX buffers are reallocated at the new
size, falling back to the existing buffers on failure.

Cap the PCIe DCB ring at 256 (FDMA_PCI_DCB_MAX): 512 DCBs would
overflow MAX_PAGE_ORDER at jumbo MTU.

The ring must fit one MAX_PAGE_ORDER block after ATU padding, and
db_size is handed to the FDMA in the 16-bit DCB DATAL field.
Advertise the resulting limit in dev->max_mtu (FDMA_PCI_MAX_MTU)
when the FDMA is in use - a switch with no "fdma" interrupt named
uses the unconstrained register-based path instead, so the cap is
gated on lan966x->fdma, not lan966x_is_pci() alone. On a 4KB-page,
MAX_PAGE_ORDER=10 build this is MTU 15498; the overhead is shared
with lan966x_fdma_get_max_frame() via FDMA_OVERHEAD.

Skip the resize until lan966x_fdma_pci_init() has built the rings;
it runs after the netdevs register and sizes them from
DEV_MAC_MAXLEN_CFG, already programmed by the caller.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  |   6 +-
 .../ethernet/microchip/lan966x/lan966x_fdma_pci.c  | 153 ++++++++++++++++++++-
 .../net/ethernet/microchip/lan966x/lan966x_main.c  |   3 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.h  |  28 ++++
 4 files changed, 181 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 2e8f786d6fee..a7940eca5df3 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -890,11 +890,7 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
 
 int lan966x_fdma_get_max_frame(struct lan966x *lan966x)
 {
-	return lan966x_fdma_get_max_mtu(lan966x) +
-	       IFH_LEN_BYTES +
-	       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) +
-	       VLAN_HLEN * 2 +
-	       XDP_PACKET_HEADROOM;
+	return lan966x_fdma_get_max_mtu(lan966x) + FDMA_OVERHEAD;
 }
 
 static int __lan966x_fdma_reload(struct lan966x *lan966x, int max_mtu)
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
index bccd1b8590d7..7185e65dda43 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
@@ -358,7 +358,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 	lan966x->rx.lan966x = lan966x;
 	lan966x->rx.max_mtu = lan966x_fdma_get_max_frame(lan966x);
 	rx_fdma->channel_id = FDMA_XTR_CHANNEL;
-	rx_fdma->n_dcbs = FDMA_DCB_MAX;
+	rx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	rx_fdma->n_dbs = FDMA_RX_DCB_MAX_DBS;
 	rx_fdma->priv = lan966x;
 	rx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -368,7 +368,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 
 	lan966x->tx.lan966x = lan966x;
 	tx_fdma->channel_id = FDMA_INJ_CHANNEL;
-	tx_fdma->n_dcbs = FDMA_DCB_MAX;
+	tx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	tx_fdma->n_dbs = FDMA_TX_DCB_MAX_DBS;
 	tx_fdma->priv = lan966x;
 	tx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -391,9 +391,156 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
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
+		       FDMA_DCB_INFO_DATAL(rx->fdma.db_size - XDP_PACKET_HEADROOM),
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
+/* Wake all TX queues on every port (undoes lan966x_fdma_tx_disable_netdev). */
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
+	napi_disable(&lan966x->napi);
+	lan966x_fdma_tx_disable_netdev(lan966x);
+	lan966x_fdma_rx_disable(&lan966x->rx);
+	lan966x_fdma_tx_disable(&lan966x->tx);
+
+	lan966x->rx.max_mtu = new_mtu;
+
+	/* Must be NULL'ed in order to realloc them. */
+	lan966x->rx.fdma.atu_region = NULL;
+	lan966x->tx.fdma.atu_region = NULL;
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
+		fdma_free_coherent_and_unmap(lan966x->dma_dev,
+					     &lan966x->rx.fdma);
+		goto restore;
+	}
+
+	/* Free and unmap old memory. */
+	fdma_free_coherent_and_unmap(lan966x->dma_dev, &rx_fdma_old);
+	fdma_free_coherent_and_unmap(lan966x->dma_dev, &tx_fdma_old);
+
+	/* Order matters: napi_enable() must precede the wakes, or a TX that
+	 * completes first clears FDMA_INTR_DB_ENA with nothing scheduled to
+	 * restore it, leaving RX dead until the next reload.
+	 */
+	napi_enable(&lan966x->napi);
+	lan966x_fdma_rx_start(&lan966x->rx);
+	lan966x_fdma_pci_wakeup_netdev(lan966x);
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
+	napi_enable(&lan966x->napi);
+	lan966x_fdma_rx_start(&lan966x->rx);
+	lan966x_fdma_pci_wakeup_netdev(lan966x);
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
+	/* Nothing to resize until fdma_pci_init() has built the rings; it
+	 * sizes them from DEV_MAC_MAXLEN_CFG, which the caller already set.
+	 */
+	if (!lan966x->rx.lan966x)
+		return 0;
+
+	max_mtu = lan966x_fdma_get_max_frame(lan966x);
+	if (max_mtu == lan966x->rx.max_mtu)
+		return 0;
+
+	return __lan966x_fdma_pci_reload(lan966x, max_mtu);
 }
 
 static void lan966x_fdma_pci_deinit(struct lan966x *lan966x)
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index de2202786826..c3afc4cc597f 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -823,7 +823,8 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
 	port->chip_port = p;
 	lan966x->ports[p] = port;
 
-	dev->max_mtu = ETH_MAX_MTU;
+	dev->max_mtu = lan966x_is_pci(lan966x) && lan966x->fdma ?
+		       FDMA_PCI_MAX_MTU : ETH_MAX_MTU;
 
 	dev->netdev_ops = &lan966x_port_netdev_ops;
 	dev->ethtool_ops = &lan966x_ethtool_ops;
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index 16bc28c8f11f..1877f1916d71 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -7,6 +7,7 @@
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
 #include <linux/jiffies.h>
+#include <linux/mmzone.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/ptp_clock_kernel.h>
@@ -87,6 +88,33 @@
 #define FDMA_INJ_CHANNEL		0
 #define FDMA_DCB_MAX			512
 
+/* Ring must fit in one MAX_PAGE_ORDER DMA block; 512 DCBs overflows
+ * at jumbo MTU.
+ */
+#define FDMA_PCI_DCB_MAX		256
+
+#define FDMA_OVERHEAD							\
+	(IFH_LEN_BYTES +						\
+	 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) +		\
+	 VLAN_HLEN * 2 +						\
+	 XDP_PACKET_HEADROOM)
+
+/* Largest db_size keeping the ATU-padded ring inside one MAX_PAGE_ORDER
+ * block and within the 16-bit DCB DATAL field. Inverts ALIGN(x, R) <= L
+ * into x <= ALIGN_DOWN(L, R) to bound x directly.
+ */
+#define FDMA_PCI_DB_SIZE_MAX						\
+	MIN_T(u32,							\
+	      (ALIGN_DOWN(PAGE_SIZE << MAX_PAGE_ORDER,			\
+			  FDMA_PCI_ATU_REGION_ALIGN) -			\
+	       FDMA_PCI_DCB_MAX * sizeof(struct fdma_dcb)) /		\
+	      (FDMA_PCI_DCB_MAX * FDMA_RX_DCB_MAX_DBS),			\
+	      ALIGN_DOWN(GENMASK(15, 0), FDMA_PCI_DB_ALIGN))
+
+#define FDMA_PCI_MAX_MTU						\
+	(FDMA_PCI_DB_SIZE_MAX - FDMA_OVERHEAD -				\
+	 (ETH_HLEN + ETH_FCS_LEN))
+
 #define SE_IDX_QUEUE			0  /* 0-79 : Queue scheduler elements */
 #define SE_IDX_PORT			80 /* 80-89 : Port schedular elements */
 

-- 
2.34.1


