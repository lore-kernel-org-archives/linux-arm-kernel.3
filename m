Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEE6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzWyjkD6gL48naU61xnL7J3DFg7+Ov/Q7LF/q17OFMQ=; b=IuFZAtGyLqw9R15hBmvx6OqHkm
	isPn9QjUGhR4IMGgW6LthcTyVdRvCnXe18ZE0VYk6J8MAHPQB1INqPZhhZJ4ti+oses87rzJNasQI
	4YvfjtipfB/VK0zacZLQOVv2DGoQoo2won0S+k+wj/Ej/ZThuG0LBrtwAyIoJowqP91R0Tc7Qqm1D
	e2zHCJ6/nIG6ri/AqV/cO5ass1dviveqSl0y3HYDcMGuI0qivhuOhMvJ76+c1RGsIih+jcDTX1jyB
	KAtbRKFi3RLHyiqvcJoiI0ouRwrMcuqscifjQkGFAe6jPGIcmhX9iSY+puDwIQaPZU6WVj8qnvNCq
	7ePTaoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQIR-00000006QRq-43g0;
	Mon, 13 Jan 2025 19:40:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEn-00000006PZk-07mg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736796996; x=1768332996;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NarY2lDYWT/7Ik5g+joQruXzb90bHeiZvEDHahiv2iw=;
  b=YFBqfk1utRdqItPjzbYe/VQKA/F1Qf4T1qTE/DzZZ4Q6zApOJdm+sZMS
   mfFrEd8RBmN8y2vgL2/OXZ78vjvXUFbcQzV6jf47KkpwTg/Jjz3Af6yxY
   CcYKRsW4uTKSpyTJEVV01BeiEL9lMfsgvLUAz3yKOLwtX5mw8r9CPIjBz
   lPqlCDq0wQpLTZ0hLHkp7HoKv14BvTpYlUD4/zwUNWRTy2Pz9d/l2tV3k
   gtJnR7d6MJWBn4jOD4+jf/oF9SQfwAlYwGIzbGMwEjtKPrVv+HyBE295/
   ZuM0bpOWth0BiFnfsk4lajPKMX4D7ZflIf2X7nd24ba3iULPjx5e5prsl
   g==;
X-CSE-ConnectionGUID: Fja7+Z77S3CaoQEzhBU3bA==
X-CSE-MsgGUID: Wb0hUpFeQ0ara6hC8wfm6A==
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="203970675"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2025 12:36:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 Jan 2025 12:36:28 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 13 Jan 2025 12:36:25 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 13 Jan 2025 20:36:07 +0100
Subject: [PATCH net-next v2 3/5] net: sparx5: activate FDMA tx in start()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sparx5-lan969x-switch-driver-5-v2-3-c468f02fd623@microchip.com>
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
X-CRM114-CacheID: sfid-20250113_113637_136403_9ED27328 
X-CRM114-Status: GOOD (  13.17  )
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

The function sparx5_fdma_tx_activate() is responsible for configuring
the TX FDMA instance and activating the channel. TX activation has
previously been done in the xmit() function, when the first frame is
transmitted. Now that we have separate functions for starting and
stopping the FDMA, it seems reasonable to move the TX activation to the
start function. This change has no implications on the functionality.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 56cd206bd1af..fdae62f557ce 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -217,7 +217,6 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb)
 {
 	struct sparx5_tx *tx = &sparx5->tx;
 	struct fdma *fdma = &tx->fdma;
-	static bool first_time = true;
 	void *virt_addr;
 
 	fdma_dcb_advance(fdma);
@@ -238,12 +237,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb)
 		     FDMA_DCB_STATUS_BLOCKO(0) |
 		     FDMA_DCB_STATUS_BLOCKL(skb->len + IFH_LEN * 4 + 4));
 
-	if (first_time) {
-		sparx5_fdma_tx_activate(sparx5, tx);
-		first_time = false;
-	} else {
-		sparx5_fdma_reload(sparx5, fdma);
-	}
+	sparx5_fdma_reload(sparx5, fdma);
+
 	return NETDEV_TX_OK;
 }
 
@@ -456,6 +451,7 @@ static u32 sparx5_fdma_port_ctrl(struct sparx5 *sparx5)
 int sparx5_fdma_start(struct sparx5 *sparx5)
 {
 	struct sparx5_rx *rx = &sparx5->rx;
+	struct sparx5_tx *tx = &sparx5->tx;
 
 	netif_napi_add_weight(rx->ndev,
 			      &rx->napi,
@@ -465,6 +461,7 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
 	napi_enable(&rx->napi);
 
 	sparx5_fdma_rx_activate(sparx5, rx);
+	sparx5_fdma_tx_activate(sparx5, tx);
 
 	return 0;
 }

-- 
2.34.1


