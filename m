Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9EFCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcGhIEA554A0WVCWzZadNezlgG0RSTYoC4/nJ2qNceM=; b=0KpoIjlHs8G/F8gQavZlKRVjTR
	OfNy2cAKgKroa8/XNkeX8InKI/6ia03326N617JqjoRWZV3W0YCNk1BDbR0PBPX/rIhMD1vN7gpN/
	HTVi+RdA2NM0390qUqSDXS5ZWTSnjAkBrUZRZCVSP/iinUP/l+4j5GD8VXbkteP4KH/K7gMSYtQDa
	8XPwKWYkXV32F0+cBhDKbwEbV08McEEPtxr7QcXcyOYmr+/EchljUVkiSi7AzjxsaFeCrMF0gR3dl
	o83rs2zeZHNkff+1YsSSer5ausNyUNJ0OrlcGlMmv6zHfvCTfSw7Hv3S5b13Mow7aGn2aJsRBLfMy
	ZeXUg7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Aw-00000006Ezf-1g3a;
	Fri, 09 Oct 2026 11:54:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9At-00000006ExV-0QM4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791546847; x=1823082847;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3G6/3+7U1vOnQC9zPE7ZSPxtWgsWrbbZkl5rpRYDYl8=;
  b=Qz9Czhe15+5I2ch0DpNb2YWrJE8/6u0mG0ICQT0HxRqRXl0QVc23dRKB
   IXz4Oik8+11kdJZQBfuvU1xPF4SE69zj7Gui9B8PdU5rvt539SEVGXov4
   glyTWPe3WX5zX9Rgn3yUmhrdZmO3h7zkiZ3OZOS/lFW+4965is1TZmXG+
   u+IHghwkK8FDGiHajZsa5ZQqtnvA9/fiFEOnaurE1P1j3SE374VozctAu
   vtWFnmo8/ZZqsPqFnRfCDQsY+MMABPZYSWQLhj5Pk2GmDc+4K/jsZyvHt
   tHsP54p3SQRZ33GZHbmve+Hga9EtxHs8Pup5sh67b7bmebogVW9np65Ee
   A==;
X-CSE-ConnectionGUID: AW1woLrPQbulzhFNMijsmg==
X-CSE-MsgGUID: 3hTGxRhOQaiRuZt4QemWWw==
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="296224245"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2026 04:54:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 9 Oct 2026 04:54:06 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 04:54:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 9 Oct 2026 13:52:03 +0200
Subject: [PATCH net-next 3/5] net: sparx5: Track shared tc blocks and
 per-port policer state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-3-4916708a7ea2@microchip.com>
References: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
In-Reply-To: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Daniel Machon <daniel.machon@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_045407_175698_198DFE38 
X-CRM114-Status: GOOD (  16.96  )
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

A police action on a shared tc block applies one aggregate rate to all
ports bound to the block, which a per-port policer cannot implement.
The port policer offload therefore needs to know whether the ingress
block of a port is shared.

Add struct sparx5_port_tc to each port, holding a flag that records
whether the ingress block is shared, and the state of the four policers
of the port.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h | 16 ++++++++++++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_tc.c   | 14 ++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 0f7d8440f614..021ac7a52034 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -206,6 +206,21 @@ struct sparx5_port_config {
 	u32 sd_sgpio;
 };
 
+#define SPX5_POLICERS_PER_PORT 4 /* Number of ingress port policers */
+
+struct sparx5_port_policer {
+	struct flow_stats prev;
+	struct flow_stats stats;
+	/* Port policers hold the client reference (cookie) */
+	unsigned long policer;
+};
+
+struct sparx5_port_tc {
+	/* Ingress uses a shared filter block */
+	bool ingress_block_shared;
+	struct sparx5_port_policer port_policer[SPX5_POLICERS_PER_PORT];
+};
+
 struct sparx5_port {
 	struct net_device *ndev;
 	struct sparx5 *sparx5;
@@ -229,6 +244,7 @@ struct sparx5_port {
 	enum sparx5_vlan_port_type vlan_type;
 	u32 custom_etype;
 	bool vlan_aware;
+	struct sparx5_port_tc tc;
 	struct hrtimer inj_timer;
 	/* ptp */
 	u8 ptp_cmd;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
index 28b2514c8330..9ac99627eafc 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
@@ -47,7 +47,9 @@ static int sparx5_tc_block_cb_egress(enum tc_setup_type type,
 static int sparx5_tc_setup_block(struct net_device *ndev,
 				 struct flow_block_offload *fbo)
 {
+	struct sparx5_port *port = netdev_priv(ndev);
 	flow_setup_cb_t *cb;
+	int err;
 
 	if (fbo->binder_type == FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
 		cb = sparx5_tc_block_cb_ingress;
@@ -56,8 +58,16 @@ static int sparx5_tc_setup_block(struct net_device *ndev,
 	else
 		return -EOPNOTSUPP;
 
-	return flow_block_cb_setup_simple(fbo, &sparx5_block_cb_list,
-					  cb, ndev, ndev, false);
+	err = flow_block_cb_setup_simple(fbo, &sparx5_block_cb_list,
+					 cb, ndev, ndev, false);
+	if (err)
+		return err;
+
+	if (fbo->binder_type == FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
+		port->tc.ingress_block_shared =
+			fbo->command == FLOW_BLOCK_BIND && fbo->block_shared;
+
+	return 0;
 }
 
 static void sparx5_tc_get_layer_and_idx(struct sparx5 *sparx5, u32 parent,

-- 
2.34.1


