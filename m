Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663F3E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUJ2QidIbL6iyYBOW8brqLyZl8DY+ZfMTY7hzzVRz08=; b=ApzgJ2TMQgXpIN9E8DWNk5P17F
	OfTpVegIbfVZQYeNZlqOvloluV51VJwNXGV3x18cpNHrvJptvh6vDIZqZuloK1mf/QoVjAiYDXCCL
	1ZbqubjF5Yot6CmktBZ8gNLZBb0K7YxInpXAuFonjgTBKCdBFEAD5v/O9fnMcr/xZhjJ7Aosv4eFy
	AAp2VMiStiNOvVDzMtcTS5zwkrnnnYI9ZdeYj6w7htY3fVjYB5SqQVESiRSWpDtVfOYECX1yH0DvX
	ciEntuOx8Tffwkk2K4d7Y1JnaxL2dwv9OVs+19po5Zts7eLVEVg9KQXZk+DZrjyID618WBK04XCE1
	E7KoAYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxXN-0000000D1Cs-2QPx;
	Thu, 09 Jan 2025 18:45:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQZ-0000000CzhD-2TZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447923; x=1767983923;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=92h0SKh/xwIPzYkXOI/HkhctPfTKzkI+it/PGtWRfzo=;
  b=qWkSgqGEQFXVuZRSh/TFe4SjGUeLAvZ2kTOTgeMEdKTsx6mh8FNRvZSX
   wwR2L2LhIjGxjes3bBKv5l2LqktGKPAXbBQDzMAfVgaQgMF18O1/z7d5v
   oL3LveQXvs8si8alXr4uij+2g1SBxRrkq2hvWqrgoaq0Y7+px14W3AApQ
   ybsudXGONLNdlSw4lPVNJCR9RhhHfOigsK3bHjojfZjDHFQXMG+dJxcMD
   fUpjfM9tZ6o9d2P6ZkVIA75zkKLTGu272ARN6nHAWKsJlJwyYPBgxVvLc
   66+hzTWtv49Lj7hfP5/W2a66Y2CZnQvq27dsY29AWW7GxqQUNWUSWKABg
   w==;
X-CSE-ConnectionGUID: EEpZxm35SCOeNwgRklSfsQ==
X-CSE-MsgGUID: 08XnVAoISUumCEpn+ceKlQ==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007575"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:21 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:18 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 9 Jan 2025 19:37:57 +0100
Subject: [PATCH net-next 5/6] net: sparx5: ops out certain FDMA functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-5-13d6d8451e63@microchip.com>
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
In-Reply-To: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103843_694656_DAAE8A96 
X-CRM114-Status: GOOD (  15.52  )
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

We are going to implement the RX  and TX paths a bit differently on
lan969x and therefore need to introduce new ops for FDMA functions:
init, deinit, xmit and poll. Assign the Sparx5 equivalents for these and
update the code throughout.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c   | 5 +++--
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c   | 9 +++++++--
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h   | 5 +++++
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 5 ++++-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index cb78acd356d2..49f5af1eab94 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -183,7 +183,7 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 	return true;
 }
 
-static int sparx5_fdma_napi_callback(struct napi_struct *napi, int weight)
+int sparx5_fdma_napi_callback(struct napi_struct *napi, int weight)
 {
 	struct sparx5_rx *rx = container_of(napi, struct sparx5_rx, napi);
 	struct sparx5 *sparx5 = container_of(rx, struct sparx5, rx);
@@ -452,12 +452,13 @@ static u32 sparx5_fdma_port_ctrl(struct sparx5 *sparx5)
 
 int sparx5_fdma_start(struct sparx5 *sparx5)
 {
+	const struct sparx5_ops *ops = sparx5->data->ops;
 	struct sparx5_rx *rx = &sparx5->rx;
 	struct sparx5_tx *tx = &sparx5->tx;
 
 	netif_napi_add_weight(rx->ndev,
 			      &rx->napi,
-			      sparx5_fdma_napi_callback,
+			      ops->fdma_poll,
 			      FDMA_WEIGHT);
 
 	napi_enable(&rx->napi);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index a60f6a166522..6a0e5b83ecd0 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -793,7 +793,7 @@ static int sparx5_start(struct sparx5 *sparx5)
 					       0,
 					       "sparx5-fdma", sparx5);
 		if (!err) {
-			err = sparx5_fdma_init(sparx5);
+			err = ops->fdma_init(sparx5);
 			if (!err)
 				sparx5_fdma_start(sparx5);
 		}
@@ -1030,6 +1030,7 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 static void mchp_sparx5_remove(struct platform_device *pdev)
 {
 	struct sparx5 *sparx5 = platform_get_drvdata(pdev);
+	const struct sparx5_ops *ops = sparx5->data->ops;
 
 	debugfs_remove_recursive(sparx5->debugfs_root);
 	if (sparx5->xtr_irq) {
@@ -1041,7 +1042,7 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 		sparx5->fdma_irq = -ENXIO;
 	}
 	sparx5_ptp_deinit(sparx5);
-	sparx5_fdma_stop(sparx5);
+	ops->fdma_deinit(sparx5);
 	sparx5_cleanup_ports(sparx5);
 	sparx5_vcap_destroy(sparx5);
 	/* Unregister netdevs */
@@ -1096,6 +1097,10 @@ static const struct sparx5_ops sparx5_ops = {
 	.set_port_mux            = &sparx5_port_mux_set,
 	.ptp_irq_handler         = &sparx5_ptp_irq_handler,
 	.dsm_calendar_calc       = &sparx5_dsm_calendar_calc,
+	.fdma_init               = &sparx5_fdma_init,
+	.fdma_deinit             = &sparx5_fdma_deinit,
+	.fdma_poll               = &sparx5_fdma_napi_callback,
+	.fdma_xmit               = &sparx5_fdma_xmit,
 };
 
 static const struct sparx5_match_data sparx5_desc = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 7433a77204cd..35706e9a27c8 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -326,6 +326,10 @@ struct sparx5_ops {
 				 struct sparx5_calendar_data *data);
 	int (*port_config_rgmii)(struct sparx5_port *port,
 				 struct sparx5_port_config *conf);
+	int (*fdma_init)(struct sparx5 *sparx5);
+	int (*fdma_deinit)(struct sparx5 *sparx5);
+	int (*fdma_poll)(struct napi_struct *napi, int weight);
+	int (*fdma_xmit)(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb);
 };
 
 struct sparx5_main_io_resource {
@@ -440,6 +444,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5);
 int sparx5_fdma_deinit(struct sparx5 *sparx5);
 int sparx5_fdma_start(struct sparx5 *sparx5);
 int sparx5_fdma_stop(struct sparx5 *sparx5);
+int sparx5_fdma_napi_callback(struct napi_struct *napi, int weight);
 int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb);
 irqreturn_t sparx5_fdma_handler(int irq, void *args);
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index e776fa0845c6..bb71ee09977a 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -232,9 +232,12 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
 	struct net_device_stats *stats = &dev->stats;
 	struct sparx5_port *port = netdev_priv(dev);
 	struct sparx5 *sparx5 = port->sparx5;
+	const struct sparx5_ops *ops;
 	u32 ifh[IFH_LEN];
 	netdev_tx_t ret;
 
+	ops = sparx5->data->ops;
+
 	memset(ifh, 0, IFH_LEN * 4);
 	sparx5_set_port_ifh(sparx5, ifh, port->portno);
 
@@ -254,7 +257,7 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
 	skb_tx_timestamp(skb);
 	spin_lock(&sparx5->tx_lock);
 	if (sparx5->fdma_irq > 0)
-		ret = sparx5_fdma_xmit(sparx5, ifh, skb);
+		ret = ops->fdma_xmit(sparx5, ifh, skb);
 	else
 		ret = sparx5_inject(sparx5, ifh, skb, dev);
 	spin_unlock(&sparx5->tx_lock);

-- 
2.34.1


