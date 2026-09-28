Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF292CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUitqd3DiYrfjZMRN7WJLtWL84XUEsoN86HVysYLtSY=; b=cReBqSr33Cclfl1r+6wccTlGLV
	QwzNhs5v88yKa9rdVGwDcjO3/em0b81wf18OdNTit2DAzraJpMZVPrnIuA2E+ZUhZCjmoYvYNLl1r
	+V/vkjZ+4f5SKInGyYCAVI7yauXU6+qm5H12o7h2KI08m/ZH9S58S8pS6WXqiJ4LvR9MSl0hnJXWv
	KoN7kG9j2GgI+2CE1UYTpWKLSuHV4D+uk+C0Z54VffZorONSft367+s/sKwIfb2nnJR+7bTQVM8IB
	8cQCc407nJXVdBhS8BXcuJ/p/WrY728yT5ocSunk+aVf0vN2zd/hIxkApjCRsP6L8Yxbjif11e0ad
	+LXJYS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6v-00000001S4u-1veH;
	Mon, 28 Sep 2026 19:34:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6R-00000001Rku-3wuu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790624017; x=1822160017;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=p2Q25QixnWjEL0MXvUBXiM484P+nmYzwCzZV7OoKTJE=;
  b=rlE08M4QdovnHEMzUhXAlmWaWuonaHV1UsCaXYDi+KSOElDCBoycAmc6
   Korr616q6iB+iwsF8zD6790QAwXxnEIL1IjwsNb9g7AROKipvLY1fxuRm
   kk7dtRKuqZBgSV0MZNtzqdlOMrvLwK0WqxXMzX6YINK2sznZqnAzCLyPl
   m2WwHJ2waL0w0GnYB6xs7bOaYSOLuknM9MFRCNe6EbJISBMC6NmBPdJiE
   lMx2ClT6yA68zsJUUQqy8JRBbCVqIuT+ekXIbj3TXlpZT/SB8gbTCvHmD
   HK0v7C0PM78Mwje6SGqTqrAqRqcl4KE2bjFbO0+J5MM6Evsdv+F+a2St6
   Q==;
X-CSE-ConnectionGUID: +ETp+VfjTJebbBYOfJdFLQ==
X-CSE-MsgGUID: qfpJqiUlR4e3dROpGVmTDg==
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="64576553"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:33:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Mon, 28 Sep 2026 12:33:30 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 28 Sep 2026 12:33:26 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 28 Sep 2026 21:32:56 +0200
Subject: [PATCH net-next v9 08/15] net: lan966x: add FDMA ops dispatch for
 PCIe support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-lan966x-pci-fdma-v9-8-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
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
X-CRM114-CacheID: sfid-20260928_123332_084816_56258895 
X-CRM114-Status: GOOD (  18.13  )
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

Introduce lan966x_fdma_ops to support different FDMA implementations
for platform and PCIe. Plumb fdma_init, fdma_deinit, fdma_xmit,
fdma_poll and fdma_resize through the ops table, and select the
implementation at probe time. Only the platform implementation exists
at this point; the PCIe implementation is added in a later patch.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c    |  2 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.c    | 20 +++++++++++++++-----
 .../net/ethernet/microchip/lan966x/lan966x_main.h    | 13 +++++++++++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index ae6e5aec5e13..5f46166cbfe4 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -948,7 +948,7 @@ void lan966x_fdma_netdev_init(struct lan966x *lan966x, struct net_device *dev)
 		return;
 
 	lan966x->fdma_ndev = dev;
-	netif_napi_add(dev, &lan966x->napi, lan966x_fdma_napi_poll);
+	netif_napi_add(dev, &lan966x->napi, lan966x->ops->fdma_poll);
 	napi_enable(&lan966x->napi);
 }
 
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 2741f7c9fa4c..6e6c08bb8eea 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -27,6 +27,14 @@
 
 #define IO_RANGES 2
 
+static const struct lan966x_fdma_ops lan966x_fdma_ops = {
+	.fdma_init = &lan966x_fdma_init,
+	.fdma_deinit = &lan966x_fdma_deinit,
+	.fdma_xmit = &lan966x_fdma_xmit,
+	.fdma_poll = &lan966x_fdma_napi_poll,
+	.fdma_resize = &lan966x_fdma_change_mtu,
+};
+
 static const struct of_device_id lan966x_match[] = {
 	{ .compatible = "microchip,lan966x-switch" },
 	{ }
@@ -392,7 +400,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 
 	spin_lock(&lan966x->tx_lock);
 	if (port->lan966x->fdma)
-		err = lan966x_fdma_xmit(skb, ifh, dev);
+		err = lan966x->ops->fdma_xmit(skb, ifh, dev);
 	else
 		err = lan966x_port_ifh_xmit(skb, ifh, dev);
 	spin_unlock(&lan966x->tx_lock);
@@ -414,7 +422,7 @@ static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu)
 	if (!lan966x->fdma)
 		return 0;
 
-	err = lan966x_fdma_change_mtu(lan966x);
+	err = lan966x->ops->fdma_resize(lan966x);
 	if (err) {
 		lan_wr(DEV_MAC_MAXLEN_CFG_MAX_LEN_SET(LAN966X_HW_MTU(old_mtu)),
 		       lan966x, DEV_MAC_MAXLEN_CFG(port->chip_port));
@@ -1111,6 +1119,8 @@ static int lan966x_probe(struct platform_device *pdev)
 	lan966x->dev = &pdev->dev;
 	lan966x->dma_dev = lan966x_get_dma_dev(lan966x->dev);
 
+	lan966x->ops = &lan966x_fdma_ops;
+
 	if (!device_get_mac_address(&pdev->dev, mac_addr)) {
 		ether_addr_copy(lan966x->base_mac, mac_addr);
 	} else {
@@ -1250,7 +1260,7 @@ static int lan966x_probe(struct platform_device *pdev)
 	if (err)
 		goto cleanup_fdb;
 
-	err = lan966x_fdma_init(lan966x);
+	err = lan966x->ops->fdma_init(lan966x);
 	if (err)
 		goto cleanup_ptp;
 
@@ -1263,7 +1273,7 @@ static int lan966x_probe(struct platform_device *pdev)
 	return 0;
 
 cleanup_fdma:
-	lan966x_fdma_deinit(lan966x);
+	lan966x->ops->fdma_deinit(lan966x);
 
 cleanup_ptp:
 	lan966x_ptp_deinit(lan966x);
@@ -1291,7 +1301,7 @@ static void lan966x_remove(struct platform_device *pdev)
 
 	lan966x_taprio_deinit(lan966x);
 	lan966x_vcap_deinit(lan966x);
-	lan966x_fdma_deinit(lan966x);
+	lan966x->ops->fdma_deinit(lan966x);
 	lan966x_cleanup_ports(lan966x);
 
 	cancel_delayed_work_sync(&lan966x->stats_work);
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index 3f09f8ddf620..aab5e53ed059 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -193,6 +193,17 @@ enum vcap_is1_port_sel_rt {
 	VCAP_IS1_PS_RT_FOLLOW_OTHER = 7,
 };
 
+struct lan966x;
+
+struct lan966x_fdma_ops {
+	int (*fdma_init)(struct lan966x *lan966x);
+	void (*fdma_deinit)(struct lan966x *lan966x);
+	int (*fdma_xmit)(struct sk_buff *skb, __be32 *ifh,
+			 struct net_device *dev);
+	int (*fdma_poll)(struct napi_struct *napi, int weight);
+	int (*fdma_resize)(struct lan966x *lan966x);
+};
+
 struct lan966x_port;
 
 struct lan966x_rx {
@@ -273,6 +284,8 @@ struct lan966x {
 	/* Device used for DMA; the PCIe endpoint when enumerated over PCIe. */
 	struct device *dma_dev;
 
+	const struct lan966x_fdma_ops *ops;
+
 	u8 num_phys_ports;
 	struct lan966x_port **ports;
 

-- 
2.34.1


