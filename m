Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E8D0BB41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vcfuqop+kMiYe4rQUpSwjZXIkXs4hmqVcn5j2tnvvow=; b=5BnDW4I2LpuFATKRdmHxWztWKo
	K15qWI4NPF8BIC0N9bE/vTr/1jxuXL8KbkezmPfcX0SlkIgRTAMITMIZQ8W0XOLGzkouBdXPfilvm
	jKrY7/mI3238B0O/FNTxqzcmR3gIy6lSJZ0Nbes63qhon6+r/MPcKwRPeFU9VYFOWPZM5+/MuaBMq
	oKF7JdBA9Ypm1soL7JaUfpYREK7kRU6QFlcG+19m8jUZpZQ087rxiJvDPAw5h7vtym9Hv6HfOLbql
	K/noP9CU6taL0EoPMWlru6x9rGym/CZTy4stRxCY4EZJoR5t/DaE3mD2uwiDxNBZC6HS36eKsH84V
	boAVtKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jav-0000000G43X-3lqj;
	Wed, 23 Oct 2024 22:12:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jR8-0000000G2Eo-3aRp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720958; x=1761256958;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NkPxRxWfAVQiAUbjYg1fwrrGHvCaftzBoyopFC36UcE=;
  b=ZGrO8dU2iz2FreWOfs6oI7Z9rns22cZqOHjU/DdnDsF3r9+eb2NeUGRK
   5idqZhH/lPkOxDVxOgCDE1E1KiKVOuBTIR/SmQMsHX5xNEfX0rQorY0KX
   QlRxLH0ddKjHZZXgXXQmx8eGE4T2AHhLA30T69BdSzJdnqCnwybg9kCgQ
   Z2M7O/YF87oAYJVukhcFx6TqSCU+Pcm7U7rlpw8VLKjTawpXG/Vigs1YP
   RaFw9/Y/scV/SrdvVszsJpSZIWPwC6pO1oMe/d3DGHRJqDV2VbZBOiPKO
   o8//A2PkDlzu9xZ6AMEWMj8HRfwC+a2fHsTx7k2blYSqbc9Ce7f1rCSvF
   w==;
X-CSE-ConnectionGUID: wd8IJW4NTJ64cR86gqDN2Q==
X-CSE-MsgGUID: FNJzJzedQMCwlhLxRiZ+kg==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="200831267"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:55 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:51 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:23 +0200
Subject: [PATCH net-next v2 04/15] net: sparx5: add sparx5 context pointer
 to a few functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-4-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150239_313710_5DE80140 
X-CRM114-Status: GOOD (  14.20  )
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

In preparation for lan969x, add the sparx5 context pointer to certain
IFH (Internal Frame Header) functions. This is required, as the
is_sparx5() function will be used here in a subsequent patch.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c   |  2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h   | 11 +++++++----
 drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c |  9 ++++++---
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 13 ++++++++-----
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 88f7509f0980..0027144a2af2 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -154,7 +154,7 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 	skb = rx->skb[fdma->dcb_index][fdma->db_index];
 	skb_put(skb, fdma_db_len_get(db_hw));
 	/* Now do the normal processing of the skb */
-	sparx5_ifh_parse((u32 *)skb->data, &fi);
+	sparx5_ifh_parse(sparx5, (u32 *)skb->data, &fi);
 	/* Map to port netdev */
 	port = fi.src_port < sparx5->data->consts->n_ports ?
 		       sparx5->ports[fi.src_port] :
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 2a3b4e855590..15f5d38776c4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -401,7 +401,7 @@ struct frame_info {
 };
 
 void sparx5_xtr_flush(struct sparx5 *sparx5, u8 grp);
-void sparx5_ifh_parse(u32 *ifh, struct frame_info *info);
+void sparx5_ifh_parse(struct sparx5 *sparx5, u32 *ifh, struct frame_info *info);
 irqreturn_t sparx5_xtr_handler(int irq, void *_priv);
 netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev);
 int sparx5_manual_injection_mode(struct sparx5 *sparx5);
@@ -469,10 +469,13 @@ static inline int sparx5_dcb_init(struct sparx5 *sparx5)
 #endif
 
 /* sparx5_netdev.c */
-void sparx5_set_port_ifh_timestamp(void *ifh_hdr, u64 timestamp);
+void sparx5_set_port_ifh_timestamp(struct sparx5 *sparx5, void *ifh_hdr,
+				   u64 timestamp);
 void sparx5_set_port_ifh_rew_op(void *ifh_hdr, u32 rew_op);
-void sparx5_set_port_ifh_pdu_type(void *ifh_hdr, u32 pdu_type);
-void sparx5_set_port_ifh_pdu_w16_offset(void *ifh_hdr, u32 pdu_w16_offset);
+void sparx5_set_port_ifh_pdu_type(struct sparx5 *sparx5, void *ifh_hdr,
+				  u32 pdu_type);
+void sparx5_set_port_ifh_pdu_w16_offset(struct sparx5 *sparx5, void *ifh_hdr,
+					u32 pdu_w16_offset);
 void sparx5_set_port_ifh(struct sparx5 *sparx5, void *ifh_hdr, u16 portno);
 bool sparx5_netdevice_check(const struct net_device *dev);
 struct net_device *sparx5_create_netdev(struct sparx5 *sparx5, u32 portno);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index d4e9986ef16a..a94d9a540bd3 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -81,17 +81,20 @@ void sparx5_set_port_ifh_rew_op(void *ifh_hdr, u32 rew_op)
 	ifh_encode_bitfield(ifh_hdr, rew_op, VSTAX + 32,  10);
 }
 
-void sparx5_set_port_ifh_pdu_type(void *ifh_hdr, u32 pdu_type)
+void sparx5_set_port_ifh_pdu_type(struct sparx5 *sparx5, void *ifh_hdr,
+				  u32 pdu_type)
 {
 	ifh_encode_bitfield(ifh_hdr, pdu_type, 191, 4);
 }
 
-void sparx5_set_port_ifh_pdu_w16_offset(void *ifh_hdr, u32 pdu_w16_offset)
+void sparx5_set_port_ifh_pdu_w16_offset(struct sparx5 *sparx5, void *ifh_hdr,
+					u32 pdu_w16_offset)
 {
 	ifh_encode_bitfield(ifh_hdr, pdu_w16_offset, 195, 6);
 }
 
-void sparx5_set_port_ifh_timestamp(void *ifh_hdr, u64 timestamp)
+void sparx5_set_port_ifh_timestamp(struct sparx5 *sparx5, void *ifh_hdr,
+				   u64 timestamp)
 {
 	ifh_encode_bitfield(ifh_hdr, timestamp, 232,  40);
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index 5bfa86a71ac8..57fa9ff9dfce 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -32,7 +32,7 @@ void sparx5_xtr_flush(struct sparx5 *sparx5, u8 grp)
 	spx5_wr(0, sparx5, QS_XTR_FLUSH);
 }
 
-void sparx5_ifh_parse(u32 *ifh, struct frame_info *info)
+void sparx5_ifh_parse(struct sparx5 *sparx5, u32 *ifh, struct frame_info *info)
 {
 	u8 *xtr_hdr = (u8 *)ifh;
 
@@ -72,7 +72,7 @@ static void sparx5_xtr_grp(struct sparx5 *sparx5, u8 grp, bool byte_swap)
 		ifh[i] = spx5_rd(sparx5, QS_XTR_RD(grp));
 
 	/* Decode IFH (what's needed) */
-	sparx5_ifh_parse(ifh, &fi);
+	sparx5_ifh_parse(sparx5, ifh, &fi);
 
 	/* Map to port netdev */
 	port = fi.src_port < sparx5->data->consts->n_ports ?
@@ -242,9 +242,12 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
 			return NETDEV_TX_BUSY;
 
 		sparx5_set_port_ifh_rew_op(ifh, SPARX5_SKB_CB(skb)->rew_op);
-		sparx5_set_port_ifh_pdu_type(ifh, SPARX5_SKB_CB(skb)->pdu_type);
-		sparx5_set_port_ifh_pdu_w16_offset(ifh, SPARX5_SKB_CB(skb)->pdu_w16_offset);
-		sparx5_set_port_ifh_timestamp(ifh, SPARX5_SKB_CB(skb)->ts_id);
+		sparx5_set_port_ifh_pdu_type(sparx5, ifh,
+					     SPARX5_SKB_CB(skb)->pdu_type);
+		sparx5_set_port_ifh_pdu_w16_offset(sparx5, ifh,
+						   SPARX5_SKB_CB(skb)->pdu_w16_offset);
+		sparx5_set_port_ifh_timestamp(sparx5, ifh,
+					      SPARX5_SKB_CB(skb)->ts_id);
 	}
 
 	skb_tx_timestamp(skb);

-- 
2.34.1


