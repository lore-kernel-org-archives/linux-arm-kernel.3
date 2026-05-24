Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB921CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQjZaq2V359LxFj/1Py1W2spC//5ryaGbLK3jja2HKs=; b=lUL3QqVwwjD8RGBSCCY83aiV67
	0xaF+O784tv3alWUTGaSfqHGsxtz8jcqkq4YGTvwf4yPhQTKvcfPgBKnAyt5oUj2ydQlnrwyWUcO/
	y8W/vM3Dm2WWXFFfwd9senDVxVf4IGvopkFqXAOUg6YUQQ38agECYEGGfKwHJGWyfH9ae3QHobhxa
	jV88542JpBHeZnO4x6ycyfWln/tO2jJ1lvnUhBdwGE6Z0IPI0HNXFwIgFOZphvSjATeHlJ0K/bpTr
	fOpsP4H9HM9YROemZOb80Qa5+f4NGvh8j79MllwE8IHRZ1z0NIBzQTT2mcwas466lmNu2O2pe4rcQ
	mULXYilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHY3-0000000Fn3Z-3x6b;
	Sun, 24 May 2026 22:43:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHY0-0000000Fn2o-46Wl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 22:43:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bab82d75fdso44767005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779662631; x=1780267431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQjZaq2V359LxFj/1Py1W2spC//5ryaGbLK3jja2HKs=;
        b=XqMMw73+8AhZqmL3EgDg63qnKSSNCVB1SCTXAGGCTED5elRdwLbOc8k8UHW+7kCbEH
         cM1kLpK5QOcSYthJSqqFuGy9C+wkmmvR6jGUxcn3rAAAuqsr3aDdts86UKjKsEvTWjDF
         6nFIfMzmqscWgWNEMqxRpWeeFO5mdQJUbUNyhPdRexjQA2CIBo0q7qKfcrGGIadTRCXM
         Tl2bw8n0NmcnNAfJZXc4BZvacmF/lBs4em8iOn+HkaLI4pIDdegVnK0nGwmddLJ9WDh4
         YGXHRS7RmsIJ0h5TYzBUqDN7MgaT+j4OruROhXYH+UVASqshIUHrOTu8NOIniK2wfdhX
         nrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779662631; x=1780267431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQjZaq2V359LxFj/1Py1W2spC//5ryaGbLK3jja2HKs=;
        b=I1/aLgJNQf7/TfwbsZSiPLSPQJrJjirTVoT9NWiecczj2D4WCnncBx6W9zHn7ZlhxN
         WmotmDjPef0ZwFiGUPkyM3mhX9a82uDahvejpKG8cI39blzz/B3dwvNIgdgxtKREUCF5
         Eo/PvfdPBiBWDA2F+tZ26cM2VaY385ZujpLmV8+MkaIMBLVzrIJ+CtCwUE4ZnyMAYxpZ
         SdsEN5R3MmNNsW5ntndimhbUsCjhwUqrADLaeI/Q9YogoWc8oJX0ctRxxFmSxPyvOvDW
         VUsio7Qiy7cLKGuyLR/oMrZtWpsdmgPoEz3jRK4jSJJ0XJqWF412jEnR9V59I7/Tp0eQ
         E+8w==
X-Forwarded-Encrypted: i=1; AFNElJ+Ya85aIVAJTsvjahVVBdlE3d2zCaPfJk64Pg9piN4oKHuZI49uROaPDEeo94b+M/j5T2y/9asVkLgAelLRiYmN@lists.infradead.org
X-Gm-Message-State: AOJu0YzlLZ39kLRiGOM5PvfabIl7qJoEgG22/4Cajxjeh/54BeoUEE8K
	P/+neCjX92CUAit6T2gz6FgtYoF+COb8DIqSrFlG3SYggT1l7QR/Yc2f
X-Gm-Gg: Acq92OGjGzTp5qi38e5I3EfP4hm8cuysPXmY3cT38/oOVs9P3M7PK8TLN0rhE9u2n5F
	SYHpAbpV4oB2RohSymiyOEVMdPS/sTl0foAeHKp48ftoQ5qSQdOCv9bfIwWkl1dTq+QSzsikeio
	twwnXePFejlT+3ue6tiUmXEwkzgxYZse0zlsqCXXcBuRYtQr/twZsmOipzCUqf8jTHH+Fhb6+xo
	1yxEIrlvzab0tgqUDSg7G+IiHPvCJKn+67HvUBU/MNgkvXhGd2DUQXff3PhA8sllNRdM/Bt80NO
	ablaEcknfJpqrLVv7lrOWVEFLyH5boeiBkrk6UYs9DAe6N+Eca5zIB1MqX9fEDMHBbY8DxZQDYO
	r4+zrWFgJ8xGoFmMxaVlZ1WFdaJRZX6kIEzUIU0lzlsCUy8ZZ87NFUugxfGs/zChiWT4AB6nQSk
	m3NA5v/VAKqUBTnABB6scISAvC
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr126883415ad.35.1779662631489;
        Sun, 24 May 2026 15:43:51 -0700 (PDT)
Received: from mincom1 ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm75643475ad.16.2026.05.24.15.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 15:43:51 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH net-next] net: airoha: bind WLAN-bound flows on PPE driver L2 cache miss
Date: Mon, 25 May 2026 07:43:30 +0900
Message-ID: <20260524224330.3995807-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_154353_060171_DFBCB759 
X-CRM114-Status: GOOD (  19.06  )
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

The Linux bridge FDB can resolve a destination station to WDMA even when
the Airoha PPE driver's L2 offload cache has no entry for that MAC pair.
The normal bind path only checks the PPE driver's L2 offload cache, so an
unbound PPE hit for WLAN egress can stay unbound even though the bridge
already knows the right output path, unless a later offload event fills
that PPE driver cache.

This matters for bridge-visible WLAN egress, such as wired-to-WLAN
forwarding or WLAN peer forwarding across another BSS, radio or MLO link.
Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
datapath and is not covered.

Before touching the PPE table, resolve the destination MAC through the
bridge device above the ingress netdev. If the PPE driver's L2 offload
cache lookup misses, bind the hardware flow to the resolved CDM4/WDMA
path.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 138 +++++++++++++++++++----
 1 file changed, 119 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 26da519236bf..ea932e6d87f6 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -803,65 +803,163 @@ static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
 }
 
 static int
-airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
-				    struct airoha_flow_table_entry *e,
-				    u32 hash, bool rx_wlan)
+airoha_ppe_foe_commit_subflow(struct airoha_ppe *ppe,
+			      const struct airoha_foe_entry *bridge,
+			      u32 hash, bool rx_wlan)
 {
 	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
 	struct airoha_foe_entry *hwe_p, hwe;
-	struct airoha_flow_table_entry *f;
 	int type;
 
 	hwe_p = airoha_ppe_foe_get_entry_locked(ppe, hash);
 	if (!hwe_p)
 		return -EINVAL;
 
-	f = kzalloc_obj(*f, GFP_ATOMIC);
-	if (!f)
-		return -ENOMEM;
-
-	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
-	f->type = FLOW_TYPE_L2_SUBFLOW;
-	f->hash = hash;
-
 	memcpy(&hwe, hwe_p, sizeof(*hwe_p));
-	hwe.ib1 = (hwe.ib1 & mask) | (e->data.ib1 & ~mask);
+	hwe.ib1 = (hwe.ib1 & mask) | (bridge->ib1 & ~mask);
 
 	type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe.ib1);
 	if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
-		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
-		hwe.ipv6.ib2 = e->data.bridge.ib2;
+		memcpy(&hwe.ipv6.l2, &bridge->bridge.l2,
+		       sizeof(hwe.ipv6.l2));
+		hwe.ipv6.ib2 = bridge->bridge.ib2;
 		/* setting smac_id to 0xf instruct the hw to keep original
 		 * source mac address
 		 */
 		hwe.ipv6.l2.src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
 						    0xf);
 	} else {
-		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
+		memcpy(&hwe.bridge.l2, &bridge->bridge.l2,
 		       sizeof(hwe.bridge.l2));
-		hwe.bridge.ib2 = e->data.bridge.ib2;
+		hwe.bridge.ib2 = bridge->bridge.ib2;
 		if (type == PPE_PKT_TYPE_IPV4_HNAPT)
 			memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
 			       sizeof(hwe.ipv4.new_tuple));
 	}
 
-	hwe.bridge.data = e->data.bridge.data;
-	airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
+	hwe.bridge.data = bridge->bridge.data;
+
+	return airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
+}
+
+static int
+airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
+				    struct airoha_flow_table_entry *e,
+				    u32 hash, bool rx_wlan)
+{
+	struct airoha_flow_table_entry *f;
+	int err;
+
+	f = kzalloc_obj(*f, GFP_ATOMIC);
+	if (!f)
+		return -ENOMEM;
+
+	err = airoha_ppe_foe_commit_subflow(ppe, &e->data, hash, rx_wlan);
+	if (err) {
+		kfree(f);
+		return err;
+	}
+
+	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
+	f->type = FLOW_TYPE_L2_SUBFLOW;
+	f->hash = hash;
 
 	return 0;
 }
 
+static bool
+airoha_ppe_foe_prepare_wdma_subflow_dev(struct airoha_ppe *ppe,
+					struct net_device *dev,
+					struct airoha_flow_data *data,
+					struct airoha_foe_entry *hwe)
+{
+	u32 pse_port;
+	int err;
+
+	err = airoha_ppe_foe_entry_prepare(ppe->eth, hwe, dev,
+					   PPE_PKT_TYPE_BRIDGE, data, 0);
+	if (err)
+		return false;
+
+	pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, hwe->bridge.ib2);
+	if (pse_port != FE_PSE_PORT_CDM4)
+		return false;
+
+	return true;
+}
+
+static struct net_device *
+airoha_ppe_foe_get_bridge_master(struct net_device *dev)
+{
+	struct net_device *master = NULL;
+
+	rcu_read_lock();
+	master = netdev_master_upper_dev_get_rcu(dev);
+	if (master && netif_is_bridge_master(master))
+		dev_hold(master);
+	else
+		master = NULL;
+	rcu_read_unlock();
+
+	return master;
+}
+
+static bool
+airoha_ppe_foe_prepare_wdma_subflow(struct airoha_ppe *ppe,
+				    struct sk_buff *skb,
+				    struct airoha_foe_entry *hwe)
+{
+	struct ethhdr *eh = eth_hdr(skb);
+	struct airoha_flow_data data = {};
+	struct net_device *master;
+
+	if (!is_valid_ether_addr(eh->h_source) ||
+	    !is_valid_ether_addr(eh->h_dest))
+		return false;
+
+	ether_addr_copy(data.eth.h_dest, eh->h_dest);
+	ether_addr_copy(data.eth.h_source, eh->h_source);
+
+	if (!skb->dev)
+		return false;
+
+	/* WLAN egress unbound hits can arrive before flowtable creates the
+	 * L2 master flow normally used for subflow binding. Resolve only
+	 * through the bridge master so dev_fill_forward_path() must use the
+	 * bridge FDB for the destination MAC. Calling the ingress AP netdev
+	 * directly can describe the source station's WDMA path and would
+	 * corrupt Wi-Fi-to-wired flows whose real egress is not WDMA.
+	 */
+	master = airoha_ppe_foe_get_bridge_master(skb->dev);
+	if (!master)
+		return false;
+
+	if (airoha_ppe_foe_prepare_wdma_subflow_dev(ppe, master, &data,
+						    hwe)) {
+		dev_put(master);
+		return true;
+	}
+
+	dev_put(master);
+	return false;
+}
+
 static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 					struct sk_buff *skb,
 					u32 hash, bool rx_wlan)
 {
+	struct airoha_foe_entry wdma_hwe = {};
 	struct airoha_flow_table_entry *e;
 	struct airoha_foe_bridge br = {};
 	struct airoha_foe_entry *hwe;
 	bool commit_done = false;
+	bool wdma_ready = false;
 	struct hlist_node *n;
 	u32 index, state;
 
+	wdma_ready = airoha_ppe_foe_prepare_wdma_subflow(ppe, skb,
+							 &wdma_hwe);
+
 	spin_lock_bh(&ppe_lock);
 
 	hwe = airoha_ppe_foe_get_entry_locked(ppe, hash);
@@ -899,6 +997,8 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 				   airoha_l2_flow_table_params);
 	if (e)
 		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
+	else if (wdma_ready)
+		airoha_ppe_foe_commit_subflow(ppe, &wdma_hwe, hash, rx_wlan);
 unlock:
 	spin_unlock_bh(&ppe_lock);
 }
-- 
2.53.0


