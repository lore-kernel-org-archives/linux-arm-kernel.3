Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A5C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm+bqK7nz0aOXCW1KuDy8Sil0HcG04YZ1KrQRrHrifs=; b=NI2wHw+GQ+R21lPFJrVqUrd5Sv
	acX2o06OjNLdzuNO1tD9jmM9QHXuK3TvooIEJHjGsmEoAklZJaC9QWv9zkFCt3USCzB5zw4TskDzi
	v1ghE/etqua3wBoM+lCuLHKSATff8CGXci014Kmj3mierYp69qFy9YWIkTcvPxFN9oI3Hs29Zu1a0
	szEh4waQ7XQxP1aer3GgnxNaop+WnqFI6Y09tJAzX5KgJTMMrPICmg91jJrU7QYEYWMx1QRIKVe4p
	XCeNLk+d5XLofvLfMds2pZu9TyG0SaUesc8rT4bsweQ5uJEq4D/eVhnUx9X/qwfJeK1hUnn+g7Ce/
	rFtBm3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvU-0000000BjMD-2lh4;
	Wed, 09 Sep 2026 13:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvS-0000000BjIm-1fkj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 13:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wm+bqK7nz0aOXCW1KuDy8Sil0HcG04YZ1KrQRrHrifs=; b=lU8nEenePFfpotB5LqBiFZ4f0+
	GQRGYOXiXAbNpi1+2KQxFzdGhb/FbuxqCx5sVVCMB8NyrEXqvex7Fx2+XaOX5rEojx7HpLBJRiyrt
	XmWVZnoRcLrqISG953rGAe6wf8+mnCQ2r9FNRGFH7aaqzsAMQ/sNkAR1ApKk7+sxoaJ/KhhKvygyd
	wvJVI6u92HJtrqAqND1NzDOdOJvYJaG4y8xIChQYYJA1HyIQrAmxUtDqbDUr20tCNBwtn82AJrbGa
	WYWlAjEkT5GQdBmj1As47ywCGF7uM8EtDhN3l9d0gpX1RzWKI1bi3zmh/xt02Rto+c0cKBJYmjEsi
	OYATyRug==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4HvP-00000001COZ-0PYM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788958875; x=1820494875;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=b2dGVJTd0yHdTgyW6Eaws6C1vM3i3wCLqxj+jxHi9Vw=;
  b=QrRYFNS/IHUlOMuhi4NKhYzuWlqznUL1m7DnGDpOLlUEaQ0U+eIPmrsk
   55NKYdnmGQSTRPFTuVXNrIDkWCMD9vM3xq2WOurvN8IhqWDDX/3wXldgi
   HBV6WXbiagK4vulWfepkPr2Yy1VR2JXjs/mddCWy5YeSIyLVJv+1XfxCz
   bEqg4WAIj3iCDOMpBB3k8vnIQgoTwIBRrzrN48PFBdnEmKAFsLOzgX5/o
   1HLe84rUKBEjsDfFU/hYaF0mZA1JIFRmai6eLB54hI6RSjPGgjYAFqzDB
   fOlY4WssWJCYp+aXXUAazAJntiNLWpbTefxZCDDM/s8YjcZiq0zP/K2BQ
   Q==;
X-CSE-ConnectionGUID: hVe6ykYaTLaF3yn7jHyvvA==
X-CSE-MsgGUID: W1Z8YWMeStGxhRQODZM2NQ==
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="230464594"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:01:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 9 Sep 2026 06:01:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 9 Sep 2026 06:01:03 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 9 Sep 2026 15:00:13 +0200
Subject: [PATCH net-next v6 11/14] net: lan966x: add PCIe FDMA MTU change
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-lan966x-pci-fdma-v6-11-6f48dab9d671@microchip.com>
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
X-CRM114-CacheID: sfid-20260909_140115_731159_3E6047F9 
X-CRM114-Status: GOOD (  23.22  )
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
 .../ethernet/microchip/lan966x/lan966x_fdma_pci.c  | 168 ++++++++++++++++++++-
 1 file changed, 165 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
index f1f3c789d3a6..6cabbb8b47f2 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
@@ -1,8 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/mmzone.h>
+
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
@@ -341,7 +348,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 	lan966x->rx.lan966x = lan966x;
 	lan966x->rx.max_mtu = lan966x_fdma_get_max_frame(lan966x);
 	rx_fdma->channel_id = FDMA_XTR_CHANNEL;
-	rx_fdma->n_dcbs = FDMA_DCB_MAX;
+	rx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	rx_fdma->n_dbs = FDMA_RX_DCB_MAX_DBS;
 	rx_fdma->priv = lan966x;
 	rx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -351,7 +358,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
 
 	lan966x->tx.lan966x = lan966x;
 	tx_fdma->channel_id = FDMA_INJ_CHANNEL;
-	tx_fdma->n_dcbs = FDMA_DCB_MAX;
+	tx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
 	tx_fdma->n_dbs = FDMA_TX_DCB_MAX_DBS;
 	tx_fdma->priv = lan966x;
 	tx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
@@ -374,9 +381,164 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
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
+	struct fdma rx_fdma;
+	int max_mtu;
+
+	max_mtu = lan966x_fdma_get_max_frame(lan966x);
+	if (max_mtu == lan966x->rx.max_mtu)
+		return 0;
+
+	/* rx and tx have n_dbs == 1, so both rings need the same contiguous
+	 * dma_alloc_coherent() block, which can't exceed MAX_PAGE_ORDER. The
+	 * allocation is padded to the ATU region granularity, so test the
+	 * padded size.
+	 */
+	rx_fdma = lan966x->rx.fdma;
+	rx_fdma.db_size = FDMA_PCI_DB_SIZE(max_mtu);
+	if (ALIGN(fdma_get_size_contiguous(&rx_fdma),
+		  FDMA_PCI_ATU_REGION_ALIGN) > (PAGE_SIZE << MAX_PAGE_ORDER))
+		return -ERANGE;
+
+	/* db_size is also handed to the FDMA in the 16-bit DCB DATAL field,
+	 * where a larger value would be silently truncated.
+	 */
+	if (rx_fdma.db_size > GENMASK(15, 0))
+		return -ERANGE;
+
+	return __lan966x_fdma_pci_reload(lan966x, max_mtu);
 }
 
 static void lan966x_fdma_pci_deinit(struct lan966x *lan966x)

-- 
2.34.1


