Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBGQjBu2/9IMpujWC0b5meThMA4L++4AI93APZstB4U=; b=epwNzQC1yE6V0tLw5EaodEand5
	vWNYB90ZrK6X6gUomxbUld4QkKVakxcSHke0llakSUeEM9fdrIg4aY5Cctkn2RNOK7I734gBX/dQp
	WRhNrq3md2igYD8JMarOjIplhHp4v2gl6lj1icSXE48m7GIuf5xSZ5sTyY0Xoq08GD5Ed8yfQkgfC
	bdItGl9GV3mGqjt2+GzT42gibIjLxHwttk30KnhV/tr9DpwviXVKCIBskWki2g9S+G0lL3fre0ucM
	jWO71TQojPCT7pz/oqLWm0iiSbPScEKCTYxzIzzNc0eH8IPfdO7O4Ar4FQ4kye4Ix52b499eedQS2
	eZXQOCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6P-00000001Rik-2s5A;
	Mon, 28 Sep 2026 19:33:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6J-00000001Rf7-2ICB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790624003; x=1822160003;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uAjuVs+ar/be9P7MezDvO8gsGdNh69Bo2d+uWmDN2zk=;
  b=xdYLf8pKORwcpPMxRTlEXujeDXKi1f0HCLBe/XH5Wewxgwa2YkxRMFqS
   GxhLR/N11hVsE6DpqI4ek3iMS7GGmoEsN860XgOnmZ2paQp6mkwvbO1Ux
   sMvWCnjV+DQLAH/uPC6p2Va/Rl+xP1Fwyx08w9RPTSYzdN9DsK2+xrbCG
   IswyvIGlfW59zPmJzl6ajeF799shr8gW7LGR55OUtUH1tM/F1/7633GA5
   7JS/zmAb/qS/m3qrtQhLaNVDi1D5fgxPS7gCq3XAL+Ft9o3atR21mIVoe
   1uKu9OXQujh+cF7bYMh7Ghre0ogQPflizKvIwigvVcmrHM4eGsottIgxk
   g==;
X-CSE-ConnectionGUID: a0BV0rIpRQe+Uz/aEj63jw==
X-CSE-MsgGUID: YE1garJTQomYJQxilH/piw==
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="231389918"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:33:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Mon, 28 Sep 2026 12:33:22 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 28 Sep 2026 12:33:18 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 28 Sep 2026 21:32:54 +0200
Subject: [PATCH net-next v9 06/15] net: lan966x: export FDMA helpers for
 reuse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-lan966x-pci-fdma-v9-6-a17caf60f89a@microchip.com>
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
X-CRM114-CacheID: sfid-20260928_123323_633276_9F904E08 
X-CRM114-Status: GOOD (  11.37  )
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

Make shared FDMA helpers non-static, so they can be reused by the PCIe
FDMA implementation.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  | 22 +++++++++++-----------
 .../net/ethernet/microchip/lan966x/lan966x_main.h  | 11 +++++++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 1c5484a506ff..651ea03eede7 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -109,8 +109,8 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 	return 0;
 }
 
-static void lan966x_fdma_llp_configure(struct lan966x *lan966x, u64 addr,
-				       u8 channel_id)
+void lan966x_fdma_llp_configure(struct lan966x *lan966x, u64 addr,
+				u8 channel_id)
 {
 	lan_wr(lower_32_bits(addr), lan966x, FDMA_DCB_LLP(channel_id));
 	lan_wr(upper_32_bits(addr), lan966x, FDMA_DCB_LLP1(channel_id));
@@ -140,7 +140,7 @@ static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
 	return 0;
 }
 
-static void lan966x_fdma_rx_start(struct lan966x_rx *rx)
+void lan966x_fdma_rx_start(struct lan966x_rx *rx)
 {
 	struct lan966x *lan966x = rx->lan966x;
 	struct fdma *fdma = &rx->fdma;
@@ -171,7 +171,7 @@ static void lan966x_fdma_rx_start(struct lan966x_rx *rx)
 		lan966x, FDMA_CH_ACTIVATE);
 }
 
-static void lan966x_fdma_rx_disable(struct lan966x_rx *rx)
+void lan966x_fdma_rx_disable(struct lan966x_rx *rx)
 {
 	struct lan966x *lan966x = rx->lan966x;
 	struct fdma *fdma = &rx->fdma;
@@ -191,7 +191,7 @@ static void lan966x_fdma_rx_disable(struct lan966x_rx *rx)
 		lan966x, FDMA_CH_DB_DISCARD);
 }
 
-static void lan966x_fdma_rx_reload(struct lan966x_rx *rx)
+void lan966x_fdma_rx_reload(struct lan966x_rx *rx)
 {
 	struct lan966x *lan966x = rx->lan966x;
 
@@ -264,7 +264,7 @@ static void lan966x_fdma_tx_activate(struct lan966x_tx *tx)
 		lan966x, FDMA_CH_ACTIVATE);
 }
 
-static void lan966x_fdma_tx_disable(struct lan966x_tx *tx)
+void lan966x_fdma_tx_disable(struct lan966x_tx *tx)
 {
 	struct lan966x *lan966x = tx->lan966x;
 	struct fdma *fdma = &tx->fdma;
@@ -296,7 +296,7 @@ static void lan966x_fdma_tx_reload(struct lan966x_tx *tx)
 		lan966x, FDMA_CH_RELOAD);
 }
 
-static void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x)
+void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x)
 {
 	struct lan966x_port *port;
 	int i;
@@ -471,7 +471,7 @@ static struct sk_buff *lan966x_fdma_rx_get_frame(struct lan966x_rx *rx,
 	return NULL;
 }
 
-static int lan966x_fdma_napi_poll(struct napi_struct *napi, int weight)
+int lan966x_fdma_napi_poll(struct napi_struct *napi, int weight)
 {
 	struct lan966x *lan966x = container_of(napi, struct lan966x, napi);
 	struct lan966x_rx *rx = &lan966x->rx;
@@ -584,7 +584,7 @@ static int lan966x_fdma_get_next_dcb(struct lan966x_tx *tx)
 	return -1;
 }
 
-static void lan966x_fdma_tx_start(struct lan966x_tx *tx)
+void lan966x_fdma_tx_start(struct lan966x_tx *tx)
 {
 	struct lan966x *lan966x = tx->lan966x;
 
@@ -802,7 +802,7 @@ static int lan966x_fdma_get_max_mtu(struct lan966x *lan966x)
 	return max_mtu;
 }
 
-static int lan966x_qsys_sw_status(struct lan966x *lan966x)
+int lan966x_qsys_sw_status(struct lan966x *lan966x)
 {
 	return lan_rd(lan966x, QSYS_SW_STATUS(CPU_PORT));
 }
@@ -884,7 +884,7 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
 	return err;
 }
 
-static int lan966x_fdma_get_max_frame(struct lan966x *lan966x)
+int lan966x_fdma_get_max_frame(struct lan966x *lan966x)
 {
 	return lan966x_fdma_get_max_mtu(lan966x) +
 	       IFH_LEN_BYTES +
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index eea286c29474..83c361abb789 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -561,6 +561,17 @@ int lan966x_fdma_init(struct lan966x *lan966x);
 void lan966x_fdma_deinit(struct lan966x *lan966x);
 irqreturn_t lan966x_fdma_irq_handler(int irq, void *args);
 int lan966x_fdma_reload_page_pool(struct lan966x *lan966x);
+int lan966x_fdma_napi_poll(struct napi_struct *napi, int weight);
+void lan966x_fdma_llp_configure(struct lan966x *lan966x, u64 addr,
+				u8 channel_id);
+void lan966x_fdma_rx_start(struct lan966x_rx *rx);
+void lan966x_fdma_rx_disable(struct lan966x_rx *rx);
+void lan966x_fdma_rx_reload(struct lan966x_rx *rx);
+void lan966x_fdma_tx_start(struct lan966x_tx *tx);
+void lan966x_fdma_tx_disable(struct lan966x_tx *tx);
+void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x);
+int lan966x_fdma_get_max_frame(struct lan966x *lan966x);
+int lan966x_qsys_sw_status(struct lan966x *lan966x);
 
 int lan966x_lag_port_join(struct lan966x_port *port,
 			  struct net_device *brport_dev,

-- 
2.34.1


