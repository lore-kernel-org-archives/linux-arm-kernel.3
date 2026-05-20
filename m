Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE41CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPxavcyhtLS1igNUjcbO//2+rDi02+2reNcg5Ko8DQk=; b=V4wNpbVDz+75oUS0yhnk7T4WHf
	HfZt2imUIARoa8tPSD7VHTKr3yWOEKt2b019HsJ0+TjAFBEVzzrFfh4cSxdAqjok8pE2r5IP7O/pQ
	ji4w4rmzVTM1hC3MJEl/jwN6rPX5lOUoKbwJ0IJh6lqY06E3b99rxKH5npe6MRVtlINGNpd49KB0Q
	L5f4q1X91repvBlVgVgYbEWqTRT8Tl0bjyDX12jgzIWGFC7P+IyTjoZ4h68y8aB1FhMB8prFzZUh3
	cPulRpIuCkVE212pDC6DeUiSbT1V3On364RS9Pc7Ga6UyXS/ENBhljYaGtyrqTQwugoi2cyCGa/CM
	/tSXjSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc4n-00000003vMp-3b6q;
	Wed, 20 May 2026 08:14:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc4e-00000003v28-1nl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779264880; x=1810800880;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=qXorU2vX3V49zxIr5+CLyyBy/kT0/ry3fn7eSuWCcWA=;
  b=VpIG/XXNoy/xALMUmuXRrYvU1G+HwnvfUFsxh61GHfziCi8IP6d2lNaS
   Gyhzyj9nFtZlxO/p3ijKvd1pSrMr0k0IomqYyYqJeMNA3yVCtBI2Xb8HD
   i5E0Nwe0U4Lnk9hpHeRbP7ZH4Fa5v5jLxjlU+1M4mM3fpm7aDX89YzS4I
   AXkqiUDvtRWsqbcpcDjurWKf0JZ3MLyatTMgkyLLtZQ3iuDsh4GQWaySB
   RbaSpy5SCstqpgIR+kOgZxaIShqAGb/4WynVEf0Ffv4qbC2V/51JRj27+
   AqsCXuDsLzey3+/Na8SoxxFb87zFgaxtTYYmYMJ5mJmpuxbFDLigHVfN5
   A==;
X-CSE-ConnectionGUID: 3Kzdz6WrSH6eiQuU8E3pmw==
X-CSE-MsgGUID: eDrYRC99SPey9q7XuoKpkA==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="66575391"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:14:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 20 May 2026 01:14:38 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 20 May 2026 01:14:35 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 20 May 2026 10:12:23 +0200
Subject: [PATCH net-next v5 11/13] net: lan966x: add PCIe FDMA XDP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260520-lan966x-pci-fdma-v5-11-ca56197ae05b@microchip.com>
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
X-CRM114-CacheID: sfid-20260520_011440_509692_D973CEE9 
X-CRM114-Status: GOOD (  28.21  )
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

Add XDP support for the PCIe FDMA path. The implementation operates on
contiguous ATU-mapped buffers with memcpy-based XDP_TX, unlike the
platform path which uses page_pool.

XDP sees the frame with IFH and FCS stripped. These are removed in
lan966x_fdma_pci_rx_check_frame() before the BPF program runs, because
after the program returns the driver cannot tell whether the tail
region was modified. The skb_pull/skb_trim previously done in
lan966x_fdma_pci_rx_get_frame() are removed for the same reason; the
frame pointer and length are pre-computed by rx_check_frame() and
passed through rx_get_frame() and lan966x_xdp_pci_run() to the caller.

lan966x_fdma_pci_xmit_xdpf() handles XDP_TX: it rebuilds a fresh IFH
in the TX slot, copies the post-XDP frame after it, and lets HW insert
a new FCS.

lan966x_xdp_setup() is extended so the PCIe path skips the page_pool
reload that the platform path needs.

Only XDP_ACT_BASIC is supported.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/lan966x/lan966x_fdma_pci.c  | 162 ++++++++++++++++++---
 .../net/ethernet/microchip/lan966x/lan966x_main.c  |  11 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.h  |  10 ++
 .../net/ethernet/microchip/lan966x/lan966x_xdp.c   |  10 ++
 4 files changed, 169 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
index 3ea6d22ee573..f9db66e3e753 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/bpf_trace.h>
+
 #include "fdma_api.h"
 #include "lan966x_main.h"
 
@@ -114,7 +116,118 @@ static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)
 	       blockl <= fdma->db_size - XDP_PACKET_HEADROOM;
 }
 
-static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
+static int lan966x_fdma_pci_xmit_xdpf(struct lan966x_port *port,
+				      void *ptr, u32 len)
+{
+	struct lan966x *lan966x = port->lan966x;
+	struct lan966x_tx *tx = &lan966x->tx;
+	struct fdma *fdma = &tx->fdma;
+	int next_to_use, ret = 0;
+	void *virt_addr;
+
+	spin_lock(&lan966x->tx_lock);
+
+	next_to_use = lan966x_fdma_pci_get_next_dcb(fdma);
+
+	if (next_to_use < 0) {
+		netif_stop_queue(port->dev);
+		ret = NETDEV_TX_BUSY;
+		goto out;
+	}
+
+	if (!lan966x_fdma_pci_tx_size_fits(fdma, len)) {
+		port->dev->stats.tx_dropped++;
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* virt_addr points to the IFH. */
+	virt_addr = fdma_dataptr_virt_addr_contiguous(fdma, next_to_use, 0);
+
+	/* Construct a fresh IFH. */
+	memset(virt_addr, 0, IFH_LEN_BYTES);
+	lan966x_ifh_set_bypass(virt_addr, 1);
+	lan966x_ifh_set_port(virt_addr, BIT_ULL(port->chip_port));
+
+	/* Copy the (post-XDP) frame after the IFH. */
+	memcpy(virt_addr + IFH_LEN_BYTES, ptr, len);
+
+	/* Order frame write before DCB status write below. */
+	dma_wmb();
+
+	/* Reserve ETH_FCS_LEN for the HW-inserted FCS (len is FCS-stripped). */
+	fdma_dcb_add(fdma,
+		     next_to_use,
+		     0,
+		     FDMA_DCB_STATUS_INTR |
+		     FDMA_DCB_STATUS_SOF |
+		     FDMA_DCB_STATUS_EOF |
+		     FDMA_DCB_STATUS_BLOCKO(0) |
+		     FDMA_DCB_STATUS_BLOCKL(IFH_LEN_BYTES + len + ETH_FCS_LEN));
+
+	/* Start the transmission. */
+	lan966x_fdma_tx_start(tx);
+
+	port->dev->stats.tx_bytes += len;
+	port->dev->stats.tx_packets++;
+
+out:
+	spin_unlock(&lan966x->tx_lock);
+
+	return ret;
+}
+
+static int lan966x_xdp_pci_run(struct lan966x_port *port, void *data,
+			       u32 data_len, void **xdp_data, u32 *xdp_len)
+{
+	/* Read once so the NULL check and bpf_prog_run_xdp() see the same
+	 * pointer.
+	 */
+	struct bpf_prog *xdp_prog = READ_ONCE(port->xdp_prog);
+	struct lan966x *lan966x = port->lan966x;
+	struct fdma *fdma = &lan966x->rx.fdma;
+	struct xdp_buff xdp;
+	u32 act;
+
+	if (!xdp_prog)
+		return FDMA_PASS;
+
+	xdp_init_buff(&xdp, fdma->db_size, &port->xdp_rxq);
+
+	/* hard_start is set to slot start (virt_addr is XDP_PACKET_HEADROOM
+	 * into the slot). Headroom includes the IFH; BPF may grow into it
+	 * via adjust_head. IFH is rebuilt on XDP_TX and unread on XDP_PASS.
+	 */
+	xdp_prepare_buff(&xdp,
+			 data - XDP_PACKET_HEADROOM,
+			 XDP_PACKET_HEADROOM + IFH_LEN_BYTES,
+			 data_len,
+			 false);
+
+	act = bpf_prog_run_xdp(xdp_prog, &xdp);
+
+	*xdp_data = xdp.data;
+	*xdp_len = xdp.data_end - xdp.data;
+
+	switch (act) {
+	case XDP_PASS:
+		return FDMA_PASS;
+	case XDP_TX:
+		return lan966x_fdma_pci_xmit_xdpf(port, *xdp_data, *xdp_len) ?
+		       FDMA_DROP : FDMA_TX;
+	default:
+		bpf_warn_invalid_xdp_action(port->dev, xdp_prog, act);
+		fallthrough;
+	case XDP_ABORTED:
+		trace_xdp_exception(port->dev, xdp_prog, act);
+		fallthrough;
+	case XDP_DROP:
+		return FDMA_DROP;
+	}
+}
+
+static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port,
+					   void **data, u32 *data_len)
 {
 	struct lan966x *lan966x = rx->lan966x;
 	struct fdma *fdma = &rx->fdma;
@@ -146,38 +259,33 @@ static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
 	if (!lan966x_fdma_pci_rx_size_fits(fdma, blockl))
 		return FDMA_ERROR;
 
-	return FDMA_PASS;
+	/* Present the Ethernet frame (no IFH, no FCS). HW re-inserts the
+	 * FCS on TX; see lan966x_fdma_pci_xmit_xdpf(). May be overridden
+	 * by XDP. The FCS strip is unconditional because NETIF_F_RXFCS
+	 * is not advertised in hw_features.
+	 */
+	*data = virt_addr + IFH_LEN_BYTES;
+	*data_len = blockl - IFH_LEN_BYTES - ETH_FCS_LEN;
+
+	return lan966x_xdp_pci_run(port, virt_addr, *data_len, data, data_len);
 }
 
 static struct sk_buff *lan966x_fdma_pci_rx_get_frame(struct lan966x_rx *rx,
-						     u64 src_port)
+						     u64 src_port, void *data,
+						     u32 data_len)
 {
 	struct lan966x *lan966x = rx->lan966x;
-	struct fdma *fdma = &rx->fdma;
 	struct sk_buff *skb;
-	struct fdma_db *db;
-	u32 data_len;
-
-	/* Get the received frame and create an SKB for it. */
-	db = fdma_db_next_get(fdma);
-	data_len = FDMA_DCB_STATUS_BLOCKL(db->status);
 
 	skb = napi_alloc_skb(&lan966x->napi, data_len);
 	if (unlikely(!skb))
 		return NULL;
 
-	memcpy(skb->data,
-	       fdma_dataptr_virt_addr_contiguous(fdma,
-						 fdma->dcb_index,
-						 fdma->db_index),
-						 data_len);
+	memcpy(skb->data, data, data_len);
 
 	skb_put(skb, data_len);
 
 	skb->dev = lan966x->ports[src_port]->dev;
-	skb_pull(skb, IFH_LEN_BYTES);
-
-	skb_trim(skb, skb->len - ETH_FCS_LEN);
 
 	skb->protocol = eth_type_trans(skb, skb->dev);
 
@@ -266,6 +374,8 @@ static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
 	struct sk_buff *skb;
 	int counter = 0;
 	u64 src_port;
+	u32 data_len;
+	void *data;
 
 	/* Wake any stopped TX queues if a TX DCB is available. */
 	spin_lock(&lan966x->tx_lock);
@@ -282,7 +392,10 @@ static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
 		/* Order DONE read before DCB/frame reads below. */
 		dma_rmb();
 		counter++;
-		switch (lan966x_fdma_pci_rx_check_frame(rx, &src_port)) {
+		switch (lan966x_fdma_pci_rx_check_frame(rx,
+							&src_port,
+							&data,
+							&data_len)) {
 		case FDMA_PASS:
 			break;
 		case FDMA_ERROR:
@@ -291,8 +404,17 @@ static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
 			 */
 			fdma_dcb_advance(fdma);
 			continue;
+		case FDMA_TX:
+			fdma_dcb_advance(fdma);
+			continue;
+		case FDMA_DROP:
+			fdma_dcb_advance(fdma);
+			continue;
 		}
-		skb = lan966x_fdma_pci_rx_get_frame(rx, src_port);
+		skb = lan966x_fdma_pci_rx_get_frame(rx,
+						    src_port,
+						    data,
+						    data_len);
 		fdma_dcb_advance(fdma);
 		if (!skb) {
 			lan966x->ports[src_port]->dev->stats.rx_dropped++;
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 7036b1d937d5..b984e819312d 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -876,10 +876,13 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
 
 	port->phylink = phylink;
 
-	if (lan966x->fdma)
-		dev->xdp_features = NETDEV_XDP_ACT_BASIC |
-				    NETDEV_XDP_ACT_REDIRECT |
-				    NETDEV_XDP_ACT_NDO_XMIT;
+	if (lan966x->fdma) {
+		dev->xdp_features = NETDEV_XDP_ACT_BASIC;
+
+		if (!lan966x_is_pci(lan966x))
+			dev->xdp_features |= NETDEV_XDP_ACT_REDIRECT |
+					     NETDEV_XDP_ACT_NDO_XMIT;
+	}
 
 	err = register_netdev(dev);
 	if (err) {
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index e7fdd4447fb6..8911825eab77 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -595,6 +595,16 @@ int lan966x_qsys_sw_status(struct lan966x *lan966x);
 
 #if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
 extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
+
+static inline bool lan966x_is_pci(struct lan966x *lan966x)
+{
+	return lan966x->ops == &lan966x_fdma_pci_ops;
+}
+#else
+static inline bool lan966x_is_pci(struct lan966x *lan966x)
+{
+	return false;
+}
 #endif
 
 int lan966x_lag_port_join(struct lan966x_port *port,
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
index 9ee61db8690b..b470f731e25c 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
@@ -24,6 +24,16 @@ static int lan966x_xdp_setup(struct net_device *dev, struct netdev_bpf *xdp)
 	old_prog = xchg(&port->xdp_prog, xdp->prog);
 	new_xdp = lan966x_xdp_present(lan966x);
 
+	/* PCIe FDMA uses contiguous buffers, so no page_pool reload
+	 * is needed. Drain NAPI before freeing the old program so
+	 * no in-flight poll holds a stale pointer.
+	 */
+	if (lan966x_is_pci(lan966x)) {
+		if (old_prog)
+			napi_synchronize(&lan966x->napi);
+		goto out;
+	}
+
 	if (old_xdp == new_xdp)
 		goto out;
 

-- 
2.34.1


