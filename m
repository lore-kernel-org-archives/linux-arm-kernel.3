Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B828FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2VBbfKmsiy0agB82G/b1Lb+8YLkLbtOvKSK4+GtHaQ=; b=hLeJOar5M4BbAl5ceDDp9Xnp9D
	86FTntOr7q16A5hT0HowW6isxR08z7sbGcB3tcDQ7jF4rhC+Srkn47kasOgFKyx8vvhngMSGe7EPz
	jLqiWPq9wR86/pUBmDcPDzmuHgLzht/m0EPxG9rTOmJAy9PVVocIVZlApFyaxVvzMXbc1+mkWLO3m
	AIjPTsLbPbkHDeEMWKsk118E8IyDzHRQ3HVFXlFJPnPcFF82K0F84sVGOWSJJmQ+BD9RA7+4kCygW
	NkOhzQyq8DDzIjOt2sipgfGxspDDc7Lsuldk2BlyOG7T/UD1nFEwwFYcNTDXPbj8oW3s656dO7eCE
	sPeWn2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDF-0000000DQlm-0DYK;
	Mon, 04 May 2026 14:23:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDD-0000000DQgu-0KZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777904634; x=1809440634;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=mFVgv/Ikz72ImijkTslb1DwYj4eUEMzK0b4l6skrgLI=;
  b=JLD+tp0u2fSiviM6KCap8j0WUL2oiTlNEiKSt8P04UpsZ1Zl2hwqnE9c
   zemlGVm6TjhRqefxuv3uH6dM1ZuDkAUCxViQIyMLnX68qkLREZ+knO0IZ
   5AamcQ/xnVr4yIQovyMMPhTO7UGVMcUI3KFMhoCcSqNH2KeneWUPHFlnu
   pHD6BlfJHRPsxzbhR06nEYc5pGvzId1MaDVj/ksIAZP/Qrn4b3ot4g+dA
   LqZyiBq4vyXA3yYixMd7fnLxJfcWy8vwQ495xujWLxe9q9BD/WHkB4hn4
   Ms9T00v7jlk6dYTdEuar/t+7Mh4EN6TQLexlIjqcCb06Ij0Qjcj693SBb
   Q==;
X-CSE-ConnectionGUID: 1U8BlA81RJSX8g66HhiCmQ==
X-CSE-MsgGUID: 4vivCYinSCqyhT5GHQcyTg==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="224241161"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 May 2026 07:23:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 4 May 2026 07:23:54 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:23:50 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:23:18 +0200
Subject: [PATCH net-next v3 05/13] net: lan966x: export FDMA helpers for
 reuse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-lan966x-pci-fdma-v3-5-a56f5740d870@microchip.com>
References: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
In-Reply-To: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_072355_192638_77030611 
X-CRM114-Status: GOOD (  11.59  )
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
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  | 22 +++++++++++-----------
 .../net/ethernet/microchip/lan966x/lan966x_main.h  | 11 +++++++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 6c5761e886d4..25e673bdf084 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -109,8 +109,8 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 	return PTR_ERR_OR_ZERO(rx->page_pool);
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
 
@@ -265,7 +265,7 @@ static void lan966x_fdma_tx_activate(struct lan966x_tx *tx)
 		lan966x, FDMA_CH_ACTIVATE);
 }
 
-static void lan966x_fdma_tx_disable(struct lan966x_tx *tx)
+void lan966x_fdma_tx_disable(struct lan966x_tx *tx)
 {
 	struct lan966x *lan966x = tx->lan966x;
 	struct fdma *fdma = &tx->fdma;
@@ -297,7 +297,7 @@ static void lan966x_fdma_tx_reload(struct lan966x_tx *tx)
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
@@ -861,7 +861,7 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
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


