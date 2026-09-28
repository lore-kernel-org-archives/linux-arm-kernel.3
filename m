Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9DBCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw7xR2DsolCAB8uJe8rk12zSWThvS5uupHirBF+V9Cg=; b=4Wb5SmHPq+0J0BahX6EIwP6Lsx
	IlgFW4gtkBfQJaYqQa3GdOPX1K0iQT2ze3ztifqO6JrL433R4ZeOwUcXb+rpfGYBzbgBzoc/7hEFq
	dlGvebCe+GKsXaYtL5zwdRRQRkvSlUvwDwueSh1+J/CGgcywVhAnELsEyEtYwJuw7AlFDfOoGqz6w
	lfWW1vQJ8nuraukPPMNUEGaGVuK8xq+qt6NBvEqD8I06RFqiCtXuqnfDUpP6tndywZsZiZfgFEo7b
	urMI6qlMyGBeriTF9y2PfeV2iQ75rNOyBdLWg5gcziEn+vBMIbn+iw35dzERkN16JkCKD5eYBp2+I
	Av/aINhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6P-00000001RiM-2QiB;
	Mon, 28 Sep 2026 19:33:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6F-00000001Rcb-2Cjl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790624004; x=1822160004;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bTmIpqNrNvU3IHtPezg+HL5Y1+Y1opzwgINLmoX0OYI=;
  b=yX6Ytk6fMgSLs7TsNL9GYn2n3yPwcsHKkngdLuVFE38pspb5La7JxqDZ
   /7KvX6Uu6HGqWJ0mwpqYxTiKRwHC8WRe1gQK5Ag51thUXlmSadTKRJ8op
   ZzqMMWaTyQiErWiK1bl3soYT1Vcns0w129grv9XUNGdtCjRJmOYM0O0Gb
   uO+uugAw+7hOphNy/R6oE0HEwf3ZtzTDWCfMUmoS39EWowYHa+Sq0qogx
   WSdtYNhaZWIAbhDpGpkCta7kyufqdHwq/Q0ktdXzQwpHh1imsBYL01ASZ
   wFa5xgTKYixw+nd/Mhuw7CEUdVXIoiI232sQVF7AAnlYzISn3v0jNt3we
   Q==;
X-CSE-ConnectionGUID: zmhlKOivQ1yDqUVw/y1OBQ==
X-CSE-MsgGUID: z2YCpmweTciR2b814+J5gA==
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="64576547"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 12:33:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 12:33:18 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 28 Sep 2026 12:33:14 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 28 Sep 2026 21:32:53 +0200
Subject: [PATCH net-next v9 05/15] net: lan966x: add FDMA LLP register
 write helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-lan966x-pci-fdma-v9-5-a17caf60f89a@microchip.com>
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
X-CRM114-CacheID: sfid-20260928_123319_634269_DB2CEA7C 
X-CRM114-Status: GOOD (  13.60  )
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

The FDMA Link List Pointer (LLP) register points to the first DCB in the
chain and must be written before the channel is activated. This tells
the FDMA engine where to begin DMA transfers.

Move the LLP register writes from the channel start/activate functions
into the allocation functions and introduce a shared
lan966x_fdma_llp_configure() helper. This is needed because the upcoming
PCIe FDMA path writes ATU-translated addresses to the LLP registers
instead of DMA addresses. Keeping the writes in the shared
start/activate path would overwrite these translated addresses.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  | 30 ++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 68fd454ebc98..1c5484a506ff 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -109,6 +109,13 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 	return 0;
 }
 
+static void lan966x_fdma_llp_configure(struct lan966x *lan966x, u64 addr,
+				       u8 channel_id)
+{
+	lan_wr(lower_32_bits(addr), lan966x, FDMA_DCB_LLP(channel_id));
+	lan_wr(upper_32_bits(addr), lan966x, FDMA_DCB_LLP1(channel_id));
+}
+
 static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
 {
 	struct lan966x *lan966x = rx->lan966x;
@@ -128,6 +135,8 @@ static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
 	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
 		       FDMA_DCB_STATUS_INTR);
 
+	lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);
+
 	return 0;
 }
 
@@ -137,14 +146,6 @@ static void lan966x_fdma_rx_start(struct lan966x_rx *rx)
 	struct fdma *fdma = &rx->fdma;
 	u32 mask;
 
-	/* When activating a channel, first is required to write the first DCB
-	 * address and then to activate it
-	 */
-	lan_wr(lower_32_bits((u64)fdma->dma), lan966x,
-	       FDMA_DCB_LLP(fdma->channel_id));
-	lan_wr(upper_32_bits((u64)fdma->dma), lan966x,
-	       FDMA_DCB_LLP1(fdma->channel_id));
-
 	lan_wr(FDMA_CH_CFG_CH_DCB_DB_CNT_SET(fdma->n_dbs) |
 	       FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY_SET(1) |
 	       FDMA_CH_CFG_CH_INJ_PORT_SET(0) |
@@ -215,6 +216,8 @@ static int lan966x_fdma_tx_alloc(struct lan966x_tx *tx)
 
 	fdma_dcbs_init(fdma, 0, 0);
 
+	lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);
+
 	return 0;
 
 out:
@@ -236,14 +239,6 @@ static void lan966x_fdma_tx_activate(struct lan966x_tx *tx)
 	struct fdma *fdma = &tx->fdma;
 	u32 mask;
 
-	/* When activating a channel, first is required to write the first DCB
-	 * address and then to activate it
-	 */
-	lan_wr(lower_32_bits((u64)fdma->dma), lan966x,
-	       FDMA_DCB_LLP(fdma->channel_id));
-	lan_wr(upper_32_bits((u64)fdma->dma), lan966x,
-	       FDMA_DCB_LLP1(fdma->channel_id));
-
 	lan_wr(FDMA_CH_CFG_CH_DCB_DB_CNT_SET(fdma->n_dbs) |
 	       FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY_SET(1) |
 	       FDMA_CH_CFG_CH_INJ_PORT_SET(0) |
@@ -877,6 +872,9 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
 					   MEM_TYPE_PAGE_POOL, page_pool);
 	}
 
+	lan966x_fdma_llp_configure(lan966x, lan966x->rx.fdma.dma,
+				   lan966x->rx.fdma.channel_id);
+
 	lan966x_fdma_rx_start(&lan966x->rx);
 
 	lan966x_fdma_wakeup_netdev(lan966x);

-- 
2.34.1


