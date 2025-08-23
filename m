Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D07CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgIm++i1qFPmoxJFVFPXj81kuR0lHv2aMwuMe0GA1Ng=; b=g0IcQaHZClZziKUGTlrstjrCLl
	oqZlIMizNxM7bs1JwtAGrYOl1LhwaAzzaKP2CGjqraKQCo89joSoKgRtclZFgviTj9FDaFAesPosx
	qwAzs2p9FEshXV6JV7Kgyu6HV8/LmIVQm+pV/UEMRP9xQTbVV879fE8nxVTPm+Bug2X2GqU1lYjcl
	BuB1AR9MmMnp7CoiDh9RyewmKwbKxq5zH599z4zk0cpAZhc+6PNQ9IRHCvJmSpDNTloi6hEIqhOtR
	lQCgOE9fByjWEE+KxnS0Yk3cgG2IvapzfdNv1NyDhdUh614EYBOgntdoCVVVZ6yJanM0x0t/ETjkr
	ryWqxdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLO-00000004cnT-2XdF;
	Sat, 23 Aug 2025 10:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upj72-00000004JQt-3v8M;
	Sat, 23 Aug 2025 07:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VgIm++i1qFPmoxJFVFPXj81kuR0lHv2aMwuMe0GA1Ng=; b=MmYIN8vIT4lihEMVSUf+rXv1FZ
	ztlzhM8Vx6WyetQsvhQ8pPYzrWPw/NrqUSX6IyvpLoJwFh1MchtHGWdmCkmmls739q7KR9ZpgAn1C
	j0cYm3S5IQCRxpnQZPQ2dd65R892lMqDN+jmtG+Wvx+fQUDAJOZo4SZMtvKEaKa9IEuefMQDcC5fW
	XHGERhcc2G4Q6nv+IZdVrAsj6TeLMKaDX5GrugcGk2EWQxCI7Ij/9F4tFtm68vJhKkEAevb5EaZzI
	1pyblP35z0Wb7sJruVh0u+vwjaP7t4zERtvchvYaJjgNZOmGi40vbDTu+KkWKXymZuubkuuwZYjXc
	w38jXO9Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upj6z-00000001L5C-44O0;
	Sat, 23 Aug 2025 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E801B44E79;
	Sat, 23 Aug 2025 07:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE63C4CEE7;
	Sat, 23 Aug 2025 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755935787;
	bh=bUhhisMpwunCiVpJimsogShTnS7b3lFsORIaZ4diA6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cmBcOvufqRiTIVI2CcRlHEkYOr9lQEMA+fzMI9PSFqFWxHhwLZMRrGVemG833UKyS
	 2/zkTP3+JIkkKhoHjWn/j16HKtzH8gmYmRdb5CemGDQOwXD4pzF0JsOa9hKqwyxHNk
	 kQ+yu4ZmzLMwJjG2PpvDsH7kN7WRCAiLxdr4mOzFokoqqeMJyeL5lUsUZsGJXFjRRv
	 pYy7SxlK3i85hWDlwz9pQHohRtwAtdKZkPsYGUZVhF0L+HXya76UvAqxz56XBis9hi
	 KSmLgtW8kK4YApjb6SXrjn/YhuJskKxmVrE+SA7KF3InKB9oSvFZdywPn9ZxMrCTi/
	 NslgmI3XzSYqg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 23 Aug 2025 09:56:02 +0200
Subject: [PATCH net-next v3 1/3] net: airoha: Rely on airoha_eth struct in
 airoha_ppe_flow_offload_cmd signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-airoha-en7581-wlan-rx-offload-v3-1-f78600ec3ed8@kernel.org>
References: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
In-Reply-To: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085630_401842_868E61DD 
X-CRM114-Status: GOOD (  11.41  )
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


