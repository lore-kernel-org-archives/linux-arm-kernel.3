Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzVUILVxkGbMBTDdY5hKJRJZ9Dez+D5rJlXcKJ7XjyQ=; b=jgcmRVmxzDGV5K8jO7MmACIF0l
	wQS3Rpx4Ct9/HMMAYaTsv0hg4c4H/RgkdOptGQFQygFA2X4SY8DSfkWk9BmmbGvKnFG1Qqp9ZzDqB
	dfAcM2avSWbn/4GIMIfp/4KLxcCDw9hLtnZh/c1JQwLfvRPejrpTReqYEh0rHWAKEqOohRirSsAst
	Ltn8JnUroUjn3oWbZDl+TzSxLf7BZNM+0L5PZxT+VSpB5KJmlPf0GL0VXWYzYFJHJkg7xdxKFIZnX
	ZKmmwnamEPBseY59SF5ZFBvqeCa5OoSuvdciWQoCJ+WdJTipjiBY+fPooMoAi2QGhTiQLoX+05gmx
	eRZPlDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQJf-00000006Qag-2V25;
	Mon, 13 Jan 2025 19:41:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEo-00000006PY6-0FJd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736796997; x=1768332997;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=nvLvJF2uu3LKc39E/+pWVRqhdVPJCwRtaWi++XFpFOo=;
  b=2bLz1diuYSNIK/XcB+d8wiCWRFb8/M+wVs6Syh5k+n72WyhtSRwxEz9L
   Er/YtInwtf6+G4OxfNPNff4gryeliJMoaWX/Rji6QPU8jIGoRNFVyqDpq
   FU1QKqTWh1ndu1cNxvTtd0m7Hp+UfccfmwwUpHn2pE3glPDdzjKwdY8cU
   6Itiby4aQe3al1mLufEe1OkA9QJHzD7NMzZEd2WdLlwpxb/xMJ4pqDIDi
   ASxvoNhmy6DLv5kl74ECdGJl5qar3a4JVAv3X+96gwC/k0W/W5ZFFK/sO
   cduz12kMqAB8CiOzaSYkelBJiUjdCNzKlqL5/TnxiFzHJ56SG+Whv8Yzp
   A==;
X-CSE-ConnectionGUID: Fja7+Z77S3CaoQEzhBU3bA==
X-CSE-MsgGUID: FYnLd1/5RQ6hBYFS2uAXBg==
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="203970676"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2025 12:36:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 Jan 2025 12:36:30 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 13 Jan 2025 12:36:28 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 13 Jan 2025 20:36:08 +0100
Subject: [PATCH net-next v2 4/5] net: sparx5: ops out certain FDMA
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sparx5-lan969x-switch-driver-5-v2-4-c468f02fd623@microchip.com>
References: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
In-Reply-To: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
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
X-CRM114-CacheID: sfid-20250113_113638_290659_FBC5400E 
X-CRM114-Status: GOOD (  15.83  )
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
update the code throughout. Also add a 'struct net_device' argument to
the xmit() function, as we will be needing that for lan969x.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c   | 8 +++++---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c   | 9 +++++++--
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h   | 9 ++++++++-
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 5 ++++-
 4 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index fdae62f557ce..f435ac38ea8e 100644
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
@@ -213,7 +213,8 @@ static int sparx5_fdma_napi_callback(struct napi_struct *napi, int weight)
 	return counter;
 }
 
-int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb)
+int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
+		     struct net_device *dev)
 {
 	struct sparx5_tx *tx = &sparx5->tx;
 	struct fdma *fdma = &tx->fdma;
@@ -450,12 +451,13 @@ static u32 sparx5_fdma_port_ctrl(struct sparx5 *sparx5)
 
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
index 7433a77204cd..62f5e5420f83 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -326,6 +326,11 @@ struct sparx5_ops {
 				 struct sparx5_calendar_data *data);
 	int (*port_config_rgmii)(struct sparx5_port *port,
 				 struct sparx5_port_config *conf);
+	int (*fdma_init)(struct sparx5 *sparx5);
+	int (*fdma_deinit)(struct sparx5 *sparx5);
+	int (*fdma_poll)(struct napi_struct *napi, int weight);
+	int (*fdma_xmit)(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
+			 struct net_device *dev);
 };
 
 struct sparx5_main_io_resource {
@@ -440,7 +445,9 @@ int sparx5_fdma_init(struct sparx5 *sparx5);
 int sparx5_fdma_deinit(struct sparx5 *sparx5);
 int sparx5_fdma_start(struct sparx5 *sparx5);
 int sparx5_fdma_stop(struct sparx5 *sparx5);
-int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb);
+int sparx5_fdma_napi_callback(struct napi_struct *napi, int weight);
+int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
+		     struct net_device *dev);
 irqreturn_t sparx5_fdma_handler(int irq, void *args);
 
 /* sparx5_mactable.c */
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index b6f635d85820..f39cf01dee0f 100644
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
+		ret = ops->fdma_xmit(sparx5, ifh, skb, dev);
 	else
 		ret = sparx5_inject(sparx5, ifh, skb, dev);
 	spin_unlock(&sparx5->tx_lock);

-- 
2.34.1


