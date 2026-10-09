Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E692ACA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiUIXVMLoPrRHQoV3AXcgAjdYXnLrBoDE/BFtNJhAQQ=; b=0O2BpK0ihwjd66s+o+hgLxFV48
	PILyOzz2UhJ68R3kmtVXLEeiLSgHr8LKAiEI5fXs7JeBueJTsJzXUMBVZGkTSJTH6t4aPWENf0Wc+
	vw00wFt7dZdOkZxJUejZsXK4z5Z8V1+9zOQfME0oCKLoXZlb6hiXayM/V7PEEAUjotyflQzUXElW/
	tCRQhmEfNliamFwGZ3/NCooeR00iri/pYVd0uxidTBpgiJFISb08M80wizrYWMJ+MgqJLXxWAIoy0
	I5pdepbt/3+JA6EJLx3sDaLYpRuuCk5YEUYEbBdKT3nvUXJB7/Um8+8cDg9E1Mcm2887OTToyzX1F
	Nyx5E49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9B0-00000006F3u-3PFA;
	Fri, 09 Oct 2026 11:54:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Av-00000006Eyw-0wIq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791546848; x=1823082848;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=WauVG7im8f2HZzCH9kjVPBD4IOJbVz6VOpAVda6I5bA=;
  b=cVGBte/dgUHQlYUuwS0jgRdyRx3if3gF8K4QEJgvEHCq5yAHwhFSpakw
   /tI2B9ApZd9RPKskOplaHqmgmThUATWsWteDWgm8OTdAtMjr0uZhryhg3
   bVXCkQKErSLdxAz4N11lcdWiqoAcv50x9GR4A0x/UIC9wFIVN5N+k6a7b
   zAhOWms6fej+AWkedkgVEyk4E/TKGRZFrxwdoEx5D8CSdZxcj66lZ79+P
   LG9oE56flOnQeku2F1+KwqfDLG5d/x1SUIuuulHAxS6E55u2LXTD/K7dU
   8HRLNNLshjUEcVou3lU/6r8L07B/WXuLRsUw8lBbNiGuU43RfCXCUFKkG
   A==;
X-CSE-ConnectionGUID: cOrGLAHtT/WumNjcyZNKFw==
X-CSE-MsgGUID: nfTR5NRCRWCVI+FMFD9kqA==
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="63861551"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2026 04:54:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 9 Oct 2026 04:54:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 04:54:06 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 9 Oct 2026 13:52:04 +0200
Subject: [PATCH net-next 4/5] net: sparx5: Add hardware programming for the
 port policer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-4-4916708a7ea2@microchip.com>
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
X-CRM114-CacheID: sfid-20261009_045409_369478_8162229D 
X-CRM114-Status: GOOD (  30.48  )
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

Each ingress port has four single-rate leaky bucket policers in
ANA_AC_POL. A policer is configured with a rate, in units of
25040 bit/s, and a burst, in units of 8192 bytes, and drops the frames
that exceed it. The four policers of a port share the pass and drop
statistics counters of the port, which are 40 bits wide. Before use,
all policers must be initialized through the force-init bits in
POL_ALL_CFG.

Add support for programming a port policer, and for reading back its
pass and drop counts. Include 20 bytes of preamble and inter-frame gap
in the metered frame size, so that the configured rate is a line rate,
as on lan966x and ocelot. Since the statistics counters are shared,
use only one policer per port. Initialize the policers and select the
events counted by the shared counters at probe.

Read the counters from the periodic stats worker as well, and
accumulate them into 64-bit totals, so that a wrap of the 40-bit
counters is not lost between two reads of the tc stats.

The port policer is not reachable from tc yet; the next patch adds
that.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   1 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  22 +-
 .../net/ethernet/microchip/sparx5/sparx5_police.c  | 404 ++++++++++++++++++++-
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |   4 +
 4 files changed, 427 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
index d42c57bead89..32327a726a4d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
@@ -1116,6 +1116,7 @@ static void sparx5_update_port_stats(struct sparx5 *sparx5, int portno)
 		sparx5_get_asm_stats(sparx5, portno);
 	sparx5_get_ana_ac_stats_stats(sparx5, portno);
 	sparx5_get_queue_sys_stats(sparx5, portno);
+	sparx5_port_policer_stats_poll(sparx5->ports[portno]);
 }
 
 static void sparx5_update_stats(struct sparx5 *sparx5)
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 021ac7a52034..ab8d1232bc6c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -19,6 +19,7 @@
 #include <linux/hrtimer.h>
 #include <linux/debugfs.h>
 #include <net/flow_offload.h>
+#include <net/pkt_cls.h>
 
 #include <fdma_api.h>
 
@@ -209,8 +210,11 @@ struct sparx5_port_config {
 #define SPX5_POLICERS_PER_PORT 4 /* Number of ingress port policers */
 
 struct sparx5_port_policer {
-	struct flow_stats prev;
+	/* Last raw values of the 40-bit hardware counters */
+	struct flow_stats raw;
+	/* 64-bit totals, and the totals last reported to tc */
 	struct flow_stats stats;
+	struct flow_stats prev;
 	/* Port policers hold the client reference (cookie) */
 	unsigned long policer;
 };
@@ -292,6 +296,10 @@ struct sparx5_mall_mirror_entry {
 	struct sparx5_port *port;
 };
 
+struct sparx5_mall_port_policer_entry {
+	struct flow_action_police police;
+};
+
 struct sparx5_mall_entry {
 	struct list_head list;
 	struct sparx5_port *port;
@@ -300,6 +308,7 @@ struct sparx5_mall_entry {
 	bool ingress;
 	union {
 		struct sparx5_mall_mirror_entry mirror;
+		struct sparx5_mall_port_policer_entry port_policer;
 	};
 };
 
@@ -645,8 +654,8 @@ void sparx5_sdlb_group_init(struct sparx5 *sparx5, u64 max_rate, u32 min_burst,
 
 /* sparx5_police.c */
 enum {
-	/* More policer types will be added later */
-	SPX5_POL_SERVICE
+	SPX5_POL_SERVICE,
+	SPX5_POL_PORT,
 };
 
 struct sparx5_policer {
@@ -659,6 +668,13 @@ struct sparx5_policer {
 };
 
 int sparx5_policer_conf_set(struct sparx5 *sparx5, struct sparx5_policer *pol);
+int sparx5_port_policer_init(struct sparx5 *sparx5);
+int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
+			    struct netlink_ext_ack *extack);
+int sparx5_delete_port_policer(struct sparx5_mall_entry *entry);
+int sparx5_update_port_policer_stats(struct net_device *ndev,
+				     struct tc_cls_matchall_offload *tmo);
+void sparx5_port_policer_stats_poll(struct sparx5_port *port);
 
 /* sparx5_psfp.c */
 #define SPX5_PSFP_GCE_CNT 4
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_police.c b/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
index c88820e83812..48d51246699f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
@@ -4,9 +4,47 @@
  * Copyright (c) 2023 Microchip Technology Inc. and its subsidiaries.
  */
 
+#include <linux/iopoll.h>
+
 #include "sparx5_main_regs.h"
 #include "sparx5_main.h"
 
+#define SPX5_PORT_POLICER_FILTER_COUNTER 1
+#define SPX5_PORT_POLICER_PASS_COUNTER 2
+
+/* The port policer statistics counters are 40 bits wide (32-bit LSB + 8-bit
+ * MSB register pair).
+ */
+#define SPX5_PORT_STAT_CNT_MASK GENMASK_ULL(39, 0)
+
+#define SPX5_PORT_POLICER_0_FILTER_EVENT BIT(4)
+#define SPX5_PORT_POLICER_1_FILTER_EVENT BIT(5)
+#define SPX5_PORT_POLICER_2_FILTER_EVENT BIT(6)
+#define SPX5_PORT_POLICER_3_FILTER_EVENT BIT(7)
+#define SPX5_PORT_POLICER_0_PASS_EVENT BIT(8)
+#define SPX5_PORT_POLICER_1_PASS_EVENT BIT(9)
+#define SPX5_PORT_POLICER_2_PASS_EVENT BIT(10)
+#define SPX5_PORT_POLICER_3_PASS_EVENT BIT(11)
+
+/* Set GAP to 20 bytes (12 bytes of IFG and 8 bytes of preamble) to measure
+ * line rate.
+ */
+#define SPX5_POLICER_LINE_RATE_GAP 20
+
+/* Bit rate unit for the port policer (bits/sec) */
+#define SPX5_POLICER_RATE_UNIT 25040
+/* Burst size unit for the port policer (bytes) */
+#define SPX5_POLICER_BYTE_BURST_UNIT 8192
+
+enum sparx5_port_policer_stat_event_mask {
+	SPX5_PPEM_NONE,
+	SPX5_PPEM_EVENT_NO_ERROR,
+	SPX5_PPEM_EVENT_AND_ERROR,
+	SPX5_PPEM_EVENT,
+	SPX5_PPEM_ERROR_NO_EVENT,
+	SPX5_PPEM_ERROR,
+};
+
 static int sparx5_policer_service_conf_set(struct sparx5 *sparx5,
 					   struct sparx5_policer *pol)
 {
@@ -40,10 +78,65 @@ static int sparx5_policer_service_conf_set(struct sparx5 *sparx5,
 	return 0;
 }
 
+static int sparx5_port_policer_conf_set(struct sparx5 *sparx5,
+					struct sparx5_policer *pol)
+{
+	u32 portno = pol->idx / SPX5_POLICERS_PER_PORT;
+	u32 polidx = pol->idx % SPX5_POLICERS_PER_PORT;
+	u32 rate, burst, mask, cfg;
+	int cnt;
+
+	rate = DIV_ROUND_UP_ULL(pol->rate, SPX5_POLICER_RATE_UNIT);
+	burst = DIV_ROUND_UP(pol->burst, SPX5_POLICER_BYTE_BURST_UNIT);
+
+	/* Disable the policer when rate and burst are both zero, otherwise
+	 * apply it to known/unknown BUM traffic, CPU queues and learn frames.
+	 */
+	mask = (rate == 0 && burst == 0) ? 0 : 0x7f;
+	if (mask) {
+		/* Program the bucket before enabling the policer */
+		spx5_wr(rate, sparx5, ANA_AC_POL_PORT_RATE_CFG(pol->idx));
+		spx5_wr(burst, sparx5, ANA_AC_POL_PORT_THRES_CFG_0(pol->idx));
+		spx5_rmw(ANA_AC_POL_PORT_CFG_TRAFFIC_TYPE_MASK_SET(mask),
+			 ANA_AC_POL_PORT_CFG_TRAFFIC_TYPE_MASK,
+			 sparx5, ANA_AC_POL_PORT_CFG(portno, polidx));
+	} else {
+		/* Disable the policer before zeroing the bucket */
+		spx5_rmw(ANA_AC_POL_PORT_CFG_TRAFFIC_TYPE_MASK_SET(0),
+			 ANA_AC_POL_PORT_CFG_TRAFFIC_TYPE_MASK,
+			 sparx5, ANA_AC_POL_PORT_CFG(portno, polidx));
+		spx5_wr(rate, sparx5, ANA_AC_POL_PORT_RATE_CFG(pol->idx));
+		spx5_wr(burst, sparx5, ANA_AC_POL_PORT_THRES_CFG_0(pol->idx));
+	}
+
+	/* Count policer events, not bytes, for all eight priorities on the
+	 * port's filter and pass counters, which are shared by all of the
+	 * port's policer instances.
+	 */
+	cfg = ANA_AC_PORT_STAT_CFG_CFG_PRIO_MASK_SET(0xff) |
+	      ANA_AC_PORT_STAT_CFG_CFG_CNT_FRM_TYPE_SET(SPX5_PPEM_EVENT) |
+	      ANA_AC_PORT_STAT_CFG_CFG_CNT_BYTE_SET(0);
+
+	for (cnt = SPX5_PORT_POLICER_FILTER_COUNTER;
+	     cnt <= SPX5_PORT_POLICER_PASS_COUNTER; cnt++)
+		spx5_rmw(cfg,
+			 ANA_AC_PORT_STAT_CFG_CFG_PRIO_MASK |
+			 ANA_AC_PORT_STAT_CFG_CFG_CNT_FRM_TYPE |
+			 ANA_AC_PORT_STAT_CFG_CFG_CNT_BYTE,
+			 sparx5, ANA_AC_PORT_STAT_CFG(portno, cnt));
+
+	spx5_rmw(ANA_AC_POL_PORT_GAP_GAP_VALUE_SET(SPX5_POLICER_LINE_RATE_GAP),
+		 ANA_AC_POL_PORT_GAP_GAP_VALUE,
+		 sparx5, ANA_AC_POL_PORT_GAP(portno));
+
+	return 0;
+}
+
 int sparx5_policer_conf_set(struct sparx5 *sparx5, struct sparx5_policer *pol)
 {
-	/* More policer types will be added later */
 	switch (pol->type) {
+	case SPX5_POL_PORT:
+		return sparx5_port_policer_conf_set(sparx5, pol);
 	case SPX5_POL_SERVICE:
 		return sparx5_policer_service_conf_set(sparx5, pol);
 	default:
@@ -52,3 +145,312 @@ int sparx5_policer_conf_set(struct sparx5 *sparx5, struct sparx5_policer *pol)
 
 	return 0;
 }
+
+static u64 sparx5_port_policer_cnt_get(struct sparx5_port *port, u32 cnt)
+{
+	struct sparx5 *sparx5 = port->sparx5;
+	u32 lsb, msb;
+
+	/* The MSB is latched when the LSB is read, so read the LSB first */
+	lsb = spx5_rd(sparx5, ANA_AC_PORT_STAT_LSB_CNT(port->portno, cnt));
+	msb = spx5_rd(sparx5, ANA_AC_PORT_STAT_MSB_CNT(port->portno, cnt));
+
+	return (u64)msb << 32 | lsb;
+}
+
+static void sparx5_port_policer_cnt_accum(struct sparx5_port *port, u32 cnt,
+					  u64 *raw, u64 *total)
+{
+	u64 cur = sparx5_port_policer_cnt_get(port, cnt);
+
+	*total += (cur - *raw) & SPX5_PORT_STAT_CNT_MASK;
+	*raw = cur;
+}
+
+static void sparx5_port_policer_stats_update(struct sparx5_port *port,
+					     int polidx)
+{
+	struct sparx5_port_policer *pp = &port->tc.port_policer[polidx];
+
+	lockdep_assert_held(&port->sparx5->queue_stats_lock);
+
+	sparx5_port_policer_cnt_accum(port, SPX5_PORT_POLICER_FILTER_COUNTER,
+				      &pp->raw.drops, &pp->stats.drops);
+	sparx5_port_policer_cnt_accum(port, SPX5_PORT_POLICER_PASS_COUNTER,
+				      &pp->raw.pkts, &pp->stats.pkts);
+}
+
+static void sparx5_policer_stats_update(struct sparx5 *sparx5,
+					struct sparx5_policer *pol)
+{
+	u32 portno, polidx;
+
+	switch (pol->type) {
+	case SPX5_POL_PORT:
+		portno = pol->idx / SPX5_POLICERS_PER_PORT;
+		polidx = pol->idx % SPX5_POLICERS_PER_PORT;
+
+		sparx5_port_policer_stats_update(sparx5->ports[portno], polidx);
+		break;
+	default:
+		break;
+	}
+}
+
+static int sparx5_get_port_policer_idx(struct sparx5_port *port,
+				       unsigned long cookie)
+{
+	if (port->tc.port_policer[0].policer == cookie)
+		return 0;
+
+	return -ENOENT;
+}
+
+static int sparx5_alloc_port_policer_idx(struct sparx5_port *port,
+					 unsigned long cookie)
+{
+	/* Only one port policer per port is supported: the port's filter
+	 * and pass statistics counters are shared by all four hardware
+	 * policer instances, so stats can only be attributed correctly to
+	 * a single active policer.
+	 */
+	if (!port->tc.port_policer[0].policer ||
+	    port->tc.port_policer[0].policer == cookie)
+		return 0;
+
+	return -EEXIST;
+}
+
+static void sparx5_get_port_policer_stats(struct sparx5_port *port,
+					  int polidx)
+{
+	struct sparx5_policer pol = { 0 };
+
+	pol.type = SPX5_POL_PORT;
+	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + polidx;
+
+	sparx5_policer_stats_update(port->sparx5, &pol);
+}
+
+static void sparx5_init_port_policer_stats(struct sparx5_port *port,
+					   int polidx)
+{
+	struct sparx5_port_policer *pp = &port->tc.port_policer[polidx];
+
+	mutex_lock(&port->sparx5->queue_stats_lock);
+
+	pp->raw.drops = sparx5_port_policer_cnt_get(port,
+						    SPX5_PORT_POLICER_FILTER_COUNTER);
+	pp->raw.pkts = sparx5_port_policer_cnt_get(port,
+						   SPX5_PORT_POLICER_PASS_COUNTER);
+
+	memset(&pp->stats, 0, sizeof(pp->stats));
+	memset(&pp->prev, 0, sizeof(pp->prev));
+
+	mutex_unlock(&port->sparx5->queue_stats_lock);
+}
+
+/* Called once a second from the stats worker, so that a wrap of the 40-bit
+ * counters is never missed. Only one port policer per port is used.
+ */
+void sparx5_port_policer_stats_poll(struct sparx5_port *port)
+{
+	mutex_lock(&port->sparx5->queue_stats_lock);
+	sparx5_get_port_policer_stats(port, 0);
+	mutex_unlock(&port->sparx5->queue_stats_lock);
+}
+
+int sparx5_update_port_policer_stats(struct net_device *ndev,
+				     struct tc_cls_matchall_offload *tmo)
+{
+	struct sparx5_port *port = netdev_priv(ndev);
+	struct flow_stats *prev_stats;
+	struct flow_stats *stats;
+	u64 pkts, drops;
+	int polidx;
+
+	polidx = sparx5_get_port_policer_idx(port, tmo->cookie);
+	if (polidx < 0)
+		return polidx;
+
+	stats = &port->tc.port_policer[polidx].stats;
+	prev_stats = &port->tc.port_policer[polidx].prev;
+
+	mutex_lock(&port->sparx5->queue_stats_lock);
+
+	sparx5_get_port_policer_stats(port, polidx);
+
+	pkts = stats->pkts - prev_stats->pkts;
+	drops = stats->drops - prev_stats->drops;
+
+	prev_stats->pkts = stats->pkts;
+	prev_stats->drops = stats->drops;
+
+	mutex_unlock(&port->sparx5->queue_stats_lock);
+
+	if (!pkts && !drops)
+		return 0;
+
+	flow_stats_update(&tmo->stats,
+			  0,
+			  pkts + drops,
+			  drops,
+			  jiffies,
+			  FLOW_ACTION_HW_STATS_IMMEDIATE);
+
+	return 0;
+}
+
+int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
+			    struct netlink_ext_ack *extack)
+{
+	struct flow_action_police *police = &entry->port_policer.police;
+	struct sparx5_port *port = entry->port;
+	struct sparx5 *sparx5 = port->sparx5;
+	struct sparx5_policer pol = { 0 };
+	int idx, err;
+
+	if (!entry->ingress) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer is not supported on egress");
+		return -EOPNOTSUPP;
+	}
+
+	if (entry->port->tc.ingress_block_shared) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer is not supported on shared ingress blocks");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->exceed.act_id != FLOW_ACTION_DROP) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->notexceed.act_id != FLOW_ACTION_PIPE &&
+	    police->notexceed.act_id != FLOW_ACTION_ACCEPT) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->peakrate_bytes_ps || police->avrate ||
+	    police->overhead) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (!police->rate_bytes_ps) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer requires a rate");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->rate_pkt_ps) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->burst > ANA_AC_POL_PORT_THRES_CFG_0_PORT_THRES0 *
+			    SPX5_POLICER_BYTE_BURST_UNIT) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (police->rate_bytes_ps >
+	    div_u64((u64)ANA_AC_POL_PORT_RATE_CFG_PORT_RATE *
+		    SPX5_POLICER_RATE_UNIT, BITS_PER_BYTE)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Policer parameters are not supported");
+		return -EOPNOTSUPP;
+	}
+
+	idx = sparx5_alloc_port_policer_idx(port, entry->cookie);
+	if (idx < 0) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one port policer per port is supported");
+		return idx;
+	}
+
+	pol.type = SPX5_POL_PORT;
+	pol.rate = police->rate_bytes_ps * BITS_PER_BYTE;
+	pol.burst = police->burst;
+	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + idx;
+
+	sparx5_init_port_policer_stats(port, idx);
+
+	err = sparx5_policer_conf_set(sparx5, &pol);
+	if (err)
+		return err;
+
+	port->tc.port_policer[idx].policer = entry->cookie;
+
+	return 0;
+}
+
+int sparx5_delete_port_policer(struct sparx5_mall_entry *entry)
+{
+	struct sparx5_port *port = entry->port;
+	struct sparx5 *sparx5 = port->sparx5;
+	struct sparx5_policer pol = { 0 };
+	int idx, err;
+
+	if (!entry->ingress)
+		return -EINVAL;
+
+	idx = sparx5_get_port_policer_idx(port, entry->cookie);
+	if (idx < 0)
+		return idx;
+
+	pol.type = SPX5_POL_PORT;
+	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + idx;
+
+	err = sparx5_policer_conf_set(sparx5, &pol);
+	if (err)
+		return err;
+
+	port->tc.port_policer[idx].policer = 0;
+
+	return 0;
+}
+
+int sparx5_port_policer_init(struct sparx5 *sparx5)
+{
+	u32 value;
+	int err;
+
+	/* Initialize all port policers before usage */
+	spx5_rmw(ANA_AC_POL_ALL_CFG_ACL_FORCE_INIT_SET(1) |
+		 ANA_AC_POL_ALL_CFG_FORCE_INIT_SET(1),
+		 ANA_AC_POL_ALL_CFG_ACL_FORCE_INIT |
+		 ANA_AC_POL_ALL_CFG_FORCE_INIT,
+		 sparx5, ANA_AC_POL_ALL_CFG);
+
+	err = read_poll_timeout(spx5_rd, value,
+				 !(ANA_AC_POL_ALL_CFG_ACL_FORCE_INIT_GET(value) |
+				   ANA_AC_POL_ALL_CFG_FORCE_INIT_GET(value)),
+				 500, 10000, false, sparx5, ANA_AC_POL_ALL_CFG);
+	if (err)
+		return err;
+
+	/* Configure the port policer filter and pass statistics counters.
+	 * Counter 0 is owned by sparx5_ethtool.c (SPX5_PORT_POLICER_DROPS).
+	 */
+	spx5_wr(SPX5_PORT_POLICER_0_FILTER_EVENT |
+		SPX5_PORT_POLICER_1_FILTER_EVENT |
+		SPX5_PORT_POLICER_2_FILTER_EVENT |
+		SPX5_PORT_POLICER_3_FILTER_EVENT,
+		sparx5, ANA_AC_PORT_SGE_CFG(SPX5_PORT_POLICER_FILTER_COUNTER));
+
+	spx5_wr(SPX5_PORT_POLICER_0_PASS_EVENT |
+		SPX5_PORT_POLICER_1_PASS_EVENT |
+		SPX5_PORT_POLICER_2_PASS_EVENT |
+		SPX5_PORT_POLICER_3_PASS_EVENT,
+		sparx5, ANA_AC_PORT_SGE_CFG(SPX5_PORT_POLICER_PASS_COUNTER));
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
index 972da8a71f5a..c7b6af8a6a64 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
@@ -460,6 +460,10 @@ int sparx5_qos_init(struct sparx5 *sparx5)
 {
 	int ret;
 
+	ret = sparx5_port_policer_init(sparx5);
+	if (ret)
+		return ret;
+
 	ret = sparx5_leak_groups_init(sparx5);
 	if (ret < 0)
 		return ret;

-- 
2.34.1


