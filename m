Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87965E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzWyjkD6gL48naU61xnL7J3DFg7+Ov/Q7LF/q17OFMQ=; b=NT5RL3vqYrM9IBrBfE1sZt/zqk
	vJPecIldXPu93lb0VG3637uwFuxHSwSiGfsbLAjmiAd2d74XyI8CMriFguMAY9Kvgg9xhJcqFoMI6
	oEvMLve1CKRmd7GW+3+/xtytK7lUyzcAScyywtQssePZdSXCAa1byZ+xyUqIPHN3s5DAaZK7GnvFM
	PJGQVRj2ENiRpiWwdzpU2jy17M5H0uEg6KV6wV3MPWhzykNkQl5BSkKBbZJzN17S2qe6Y5yNCwnOs
	GM5eP6kOseOUrbd6Blv3gPAHhW//gkZSyrFzkRbyC1rbhx8InnBLeeHYa4raQ3VuR3BndcgDO5JXr
	O23BKTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxV2-0000000D0ps-1Tsw;
	Thu, 09 Jan 2025 18:43:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQY-0000000CzhD-1Eaa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447922; x=1767983922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NarY2lDYWT/7Ik5g+joQruXzb90bHeiZvEDHahiv2iw=;
  b=FAh4pbxK45aBe0r2iNhpUkhr6+0KamW3F2WEZsfMEHTX/GXDywE2JuJQ
   2aTf94Mv1uSqvESk99uJg4dXkSTHxnKbzcjrcVTM02iGuY0UpweAuRtWN
   GGI+JoeVpCA4p5YobdLgQZOaJMOFgjx9EhbYvUTmwoWCZeRVhgj87KZKI
   jQVjRXCZYKCfNQXKzfO3LvGSnPTm/EKaF5haouXbH+opyGqmBz9rC6g0Y
   MWLq5LZyzdD8mLt9SqqvS1qTExlOOv3mNMw2cyRbml/XBlmy8tdz6gHeD
   NM5jBFJTSglsOrAAfuj5DhStm+P2IwsnlKEAkBSHkk6tgDEIJFyD9SVxO
   Q==;
X-CSE-ConnectionGUID: EEpZxm35SCOeNwgRklSfsQ==
X-CSE-MsgGUID: BqTo9F8fS1u5PV2T/3Zyjw==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007572"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:15 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 9 Jan 2025 19:37:55 +0100
Subject: [PATCH net-next 3/6] net: sparx5: activate FDMA tx in start()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-3-13d6d8451e63@microchip.com>
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
X-CRM114-CacheID: sfid-20250109_103842_398184_A0D56E4A 
X-CRM114-Status: GOOD (  13.06  )
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


