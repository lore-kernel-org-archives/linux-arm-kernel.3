Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F312CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgIm++i1qFPmoxJFVFPXj81kuR0lHv2aMwuMe0GA1Ng=; b=yOQ5GNi1WsYRGl/gc8AgGazIPk
	Zci+AGVWK/rWipU3+Jcg9Mt11F5PEI0dbn8+lG4eJSfVBLUJJBfJ92u1DDkMZbYE67eog2/7YPQtj
	9XAJjtrH4h2aefibRHeRDBgTcf5WVnFJ72EP/EWZEe/IsxiraqHhOLiRz77x0x2KdROnrW5CS7CrB
	6QimIYejZ6cK0eC082bJqoi9HxdOAX0x9y3H8olvVOiOg2MTbQxR4mG+32jySRXu66L7xUjN8cV8r
	3673L30Vg3RCLElb5DdqUtPdjGh8fARi8pH2/thlWONR1bRk3Kw0WQY4tDYGmMkPPM+yJD8jkThTQ
	doOxr5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRBm-00000002X4N-2oHj;
	Fri, 22 Aug 2025 12:48:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLzU-00000001n5V-2saS;
	Fri, 22 Aug 2025 07:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CE5144B43;
	Fri, 22 Aug 2025 07:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96C9C113D0;
	Fri, 22 Aug 2025 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755846912;
	bh=bUhhisMpwunCiVpJimsogShTnS7b3lFsORIaZ4diA6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pj0ITmAWMTGV/lsECY8aajWdKAysPSDiFDY7j1/yhsW6UoKyk2XP9uQ9MgeLwesw9
	 UI5CoM3nsvEuXVolUSPDjdcX7mxU47tUj8fl1NmoYH10GpLn9BnB0SvTVTept2HlDR
	 7g3Y4pt+rj6hwFuV75brQVllsN5h84H2OTeFE8huokqzHT8o8s+52lRWSq+ywTo8g5
	 K2acj0tmupD3M/d30FTbvHzoZlJo3uQztamO9XxhA+4hLaNiS0JprdRl/kvjefS3vZ
	 7jtUPCrU4jbYUVJSFrSFeFV7pSHXA9ovKimZyh1Yiad6bavVLhK1R8TbS2XsCw2XuS
	 qL942XBoRImwQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 22 Aug 2025 09:14:48 +0200
Subject: [PATCH net-next v2 1/3] net: airoha: Rely on airoha_eth struct in
 airoha_ppe_flow_offload_cmd signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-airoha-en7581-wlan-rx-offload-v2-1-8a76e1d3fec2@kernel.org>
References: <20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org>
In-Reply-To: <20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_001512_778893_32292083 
X-CRM114-Status: GOOD (  12.23  )
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

Rely on airoha_eth struct in airoha_ppe_flow_offload_cmd routine
signature and in all the called subroutines.
This is a preliminary patch to introduce flowtable offload for traffic
received by the wlan NIC and forwarded to the ethernet one.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0d5cd3a13a3ee3d877f344ee0644d76d1c9df74a..36b45e98279a1d18ef0c7e185d8fca7b32c70436 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -935,11 +935,10 @@ static int airoha_ppe_entry_idle_time(struct airoha_ppe *ppe,
 	return airoha_ppe_get_entry_idle_time(ppe, e->data.ib1);
 }
 
-static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
+static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 					   struct flow_cls_offload *f)
 {
 	struct flow_rule *rule = flow_cls_offload_flow_rule(f);
-	struct airoha_eth *eth = port->qdma->eth;
 	struct airoha_flow_table_entry *e;
 	struct airoha_flow_data data = {};
 	struct net_device *odev = NULL;
@@ -1136,10 +1135,9 @@ static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
 	return err;
 }
 
-static int airoha_ppe_flow_offload_destroy(struct airoha_gdm_port *port,
+static int airoha_ppe_flow_offload_destroy(struct airoha_eth *eth,
 					   struct flow_cls_offload *f)
 {
-	struct airoha_eth *eth = port->qdma->eth;
 	struct airoha_flow_table_entry *e;
 
 	e = rhashtable_lookup(&eth->flow_table, &f->cookie,
@@ -1182,10 +1180,9 @@ void airoha_ppe_foe_entry_get_stats(struct airoha_ppe *ppe, u32 hash,
 	rcu_read_unlock();
 }
 
-static int airoha_ppe_flow_offload_stats(struct airoha_gdm_port *port,
+static int airoha_ppe_flow_offload_stats(struct airoha_eth *eth,
 					 struct flow_cls_offload *f)
 {
-	struct airoha_eth *eth = port->qdma->eth;
 	struct airoha_flow_table_entry *e;
 	u32 idle;
 
@@ -1209,16 +1206,16 @@ static int airoha_ppe_flow_offload_stats(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_ppe_flow_offload_cmd(struct airoha_gdm_port *port,
+static int airoha_ppe_flow_offload_cmd(struct airoha_eth *eth,
 				       struct flow_cls_offload *f)
 {
 	switch (f->command) {
 	case FLOW_CLS_REPLACE:
-		return airoha_ppe_flow_offload_replace(port, f);
+		return airoha_ppe_flow_offload_replace(eth, f);
 	case FLOW_CLS_DESTROY:
-		return airoha_ppe_flow_offload_destroy(port, f);
+		return airoha_ppe_flow_offload_destroy(eth, f);
 	case FLOW_CLS_STATS:
-		return airoha_ppe_flow_offload_stats(port, f);
+		return airoha_ppe_flow_offload_stats(eth, f);
 	default:
 		break;
 	}
@@ -1288,7 +1285,6 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
-	struct flow_cls_offload *cls = type_data;
 	struct airoha_eth *eth = port->qdma->eth;
 	int err = 0;
 
@@ -1297,7 +1293,7 @@ int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data)
 	if (!eth->npu)
 		err = airoha_ppe_offload_setup(eth);
 	if (!err)
-		err = airoha_ppe_flow_offload_cmd(port, cls);
+		err = airoha_ppe_flow_offload_cmd(eth, type_data);
 
 	mutex_unlock(&flow_offload_mutex);
 

-- 
2.50.1


