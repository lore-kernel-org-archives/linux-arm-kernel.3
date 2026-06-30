Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E480C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wpDkwfgHI7sKJsUdxhPlr3RzF4vUZ59JqIq4w/25rI=; b=nBSAqS9FEoi7xeJeF2dl41jvfp
	8u6t99I+tuK8DaV/vsr25C49FIeNgKW9Xl4s0irYWo4h0PH2tvoBHJ595/D0QgANdFjgK/4L8/AlB
	PSi/SFnWkxfogHe6xj4mOtmSJE/xZhQ26cqUB4x/8cEsfTmkAmqGmD/epDQ3uPaSojCn6OOa0RotB
	WXmIuo7nPLzvkw2O9cbxi6WZZcseTua8CRD1NF8isC2R+fFfeMjXk0i9KIua4hl+9JNqkOCGj93GT
	VuMOi71H8KcAO/62dzQe0/yoWKjp/33cA78T1XJQ2+G0DZGxAbN73Xf0RZ9PI4ELLCyxHxGlYQtad
	HHbox+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ2-0000000G2vd-0n4i;
	Tue, 30 Jun 2026 06:58:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSPx-0000000G2sG-2NC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47248615e4dso2375902f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802680; x=1783407480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wpDkwfgHI7sKJsUdxhPlr3RzF4vUZ59JqIq4w/25rI=;
        b=n2APNu0eE3o53/4fOAWOibvJVgT2JtZ/3eUqWV76AgBwaVZdEyGDd8DtV3dg+ObWMS
         puV1w7+V22HahG1Iu2l4+Qn0PdtqJsAOQJT1L8WtlJCi2nQgoAnP2+IJ+tDh/6GxkJ/H
         oywOTR6sm8P23EZDfaW0uBhBc5S9SvuKpvG8XYQoqUUASKfM/ISFL1DbqQGl3oFjVCib
         MNZCMaTADAKtrw/7wZ/GqWfBS5JPYl5yFPXjjHtKfU4ePdQEtwR6eFcAIID2lcLFcysA
         0sVk0WWVRqYErsmKw2Le5NdJVrGNN8UILy8k3BKPVHFGwI//FTNbuL6ZKL+a7uCUU9c1
         ud+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802680; x=1783407480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wpDkwfgHI7sKJsUdxhPlr3RzF4vUZ59JqIq4w/25rI=;
        b=tOvY41d56OKiAOQTxFnaJcDXbU+FzkHX/ADER3a6Ig7DyaP4E9+dxh4eHOqJqYGU3X
         qtUVnfwwHDUqRu1KJKv8+X6aLNkQUhXgf7k05qjk3+t7Ug85cb/lpmcHNCKYGMOoCi3C
         u2uVK5rwUKdANDIJ3/BLSDBlrPMqMOpN6z9iMuOk4EkqUaeo58tPchToPexKDVnsMgzc
         iZklT3qO3SLG1OLT5iC37BFGAPR7iXcnCPrz0/s6ixIBYTsUlRP7yoYZwg+Y9QL+MiRM
         U4jDI6qW56wgFBlJUGBcV36ZZ0YaTysBKVkcQeQMJ0UzMvqpqvjB/dEBH4j4Ur+8L1mj
         C9Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpCkRh+PlbrzZRF8EDTHhm0J4baSDcebOs21OQ1ReVZq5oMHeM8vGb59xtyzWS5tjlxqQeLM622kVShF9LYpcO5@lists.infradead.org
X-Gm-Message-State: AOJu0YxN+7zeRky+cY41n6Rmvg7jtT25ULWcBdvfI7kWPwzP2zCcFRsA
	Bad2ZFRyqEzvrFksvPeOMLYTHSPtbenJnEuLrO9t7Wo+P2dmjeR0CCD0
X-Gm-Gg: AfdE7clqfz2qMyQzEDscUf5H80t23Af1OOPmskvdu6g46LJYcRIfvT9+A4MyPaS0YeV
	zMggzB5Zj13Zu4+T0wd6svtr+ElIH+PxRE/bUvscM0whBrp+HzUc/G1KsHQbH+6Dyu526QYLId3
	qz9J1yMnoITFWHqp/3ISmFbuPYACL0fSIXD1qClPTQ+0Gm5twQKlTOoLUK7WyY3dulte0Qpfh5w
	744NgsEIZi3mAA2fF0EYQ/r4Z4RAVtlvkQKfWf1x3BeN6+dLdH0L1h5CXd0pIn7Y1e4GsdMhs3L
	YMamnXq7pdpZr/0O/8lQUyXis6gO7D/arPe/GVDLvO6qIGyjNkek3epeggiIFvd4FuWRfN2m9+E
	gLO9yJljbWCJ8gJBomNPE8rThQbNOkVswAoeZvxgYZN8Qei6f/jvmq8GSUWRje4IbSu1IbvxcjI
	HvWCmPYxse2b7vwqUS4w==
X-Received: by 2002:a5d:5d05:0:b0:474:6a5b:8604 with SMTP id ffacd0b85a97d-475507ddf66mr3025354f8f.11.1782802679649;
        Mon, 29 Jun 2026 23:57:59 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:57:59 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 2/5] net: bridge: add flow offload helpers
Date: Tue, 30 Jun 2026 08:57:32 +0200
Message-ID: <20260630065735.3341614-3-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235801_643599_F5C93932 
X-CRM114-Status: GOOD (  18.12  )
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

Add three helpers that expose the bridge state needed by nft_flow_offload
without requiring callers to include net/bridge/br_private.h. Each
performs a single br_port_get_rcu() lookup:

 - br_fdb_has_forwarding_entry_rcu(): resolves the VLAN id for the packet
   (skb tag or PVID when filtering is on, 0 otherwise) then checks whether
   the bridge FDB contains a forwarding entry (dst != NULL, non-local) for
   the resulting MAC/VLAN pair.

 - br_vlan_get_offload_info_rcu(): when VLAN filtering is active, returns
   the VLAN id (skb tag or PVID) and writes the bridge VLAN protocol to
   *proto in a single port lookup. Returns 0 when filtering is off.

 - br_vlan_is_enabled_rcu(): returns true when VLAN filtering is enabled
   on the bridge a port device belongs to.

Based on MediaTek SDK patches by Bo-Cun Chen <bc-bocun.chen@mediatek.com>
and the OpenWrt bridge offload series by Ryan Chen <rchen14b@gmail.com>.
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 include/linux/if_bridge.h | 23 +++++++++++++++++++
 net/bridge/br_fdb.c       | 34 ++++++++++++++++++++++++++++
 net/bridge/br_vlan.c      | 47 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
index 75673b8bffcb..c1cae54749c5 100644
--- a/include/linux/if_bridge.h
+++ b/include/linux/if_bridge.h
@@ -148,6 +148,9 @@ int br_vlan_get_info(const struct net_device *dev, u16 vid,
 		     struct bridge_vlan_info *p_vinfo);
 int br_vlan_get_info_rcu(const struct net_device *dev, u16 vid,
 			 struct bridge_vlan_info *p_vinfo);
+u16 br_vlan_get_offload_info_rcu(const struct net_device *dev,
+				 const struct sk_buff *skb, __be16 *proto);
+bool br_vlan_is_enabled_rcu(const struct net_device *dev);
 bool br_mst_enabled(const struct net_device *dev);
 int br_mst_get_info(const struct net_device *dev, u16 msti, unsigned long *vids);
 int br_mst_get_state(const struct net_device *dev, u16 msti, u8 *state);
@@ -184,6 +187,17 @@ static inline int br_vlan_get_info_rcu(const struct net_device *dev, u16 vid,
 	return -EINVAL;
 }
 
+static inline u16 br_vlan_get_offload_info_rcu(const struct net_device *dev,
+						const struct sk_buff *skb,
+						__be16 *proto)
+{
+	return 0;
+}
+
+static inline bool br_vlan_is_enabled_rcu(const struct net_device *dev)
+{
+	return false;
+}
 static inline bool br_mst_enabled(const struct net_device *dev)
 {
 	return false;
@@ -209,6 +223,8 @@ void br_fdb_clear_offload(const struct net_device *dev, u16 vid);
 bool br_port_flag_is_set(const struct net_device *dev, unsigned long flag);
 u8 br_port_get_stp_state(const struct net_device *dev);
 clock_t br_get_ageing_time(const struct net_device *br_dev);
+bool br_fdb_has_forwarding_entry_rcu(const struct net_device *dev,
+				     const struct sk_buff *skb, const u8 *addr);
 #else
 static inline struct net_device *
 br_fdb_find_port(const struct net_device *br_dev,
@@ -237,6 +253,13 @@ static inline clock_t br_get_ageing_time(const struct net_device *br_dev)
 {
 	return 0;
 }
+
+static inline bool br_fdb_has_forwarding_entry_rcu(const struct net_device *dev,
+						   const struct sk_buff *skb,
+						   const u8 *addr)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index e4570bbed854..2a65b203274e 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -267,6 +267,40 @@ struct net_bridge_fdb_entry *br_fdb_find_rcu(struct net_bridge *br,
 	return fdb_find_rcu(&br->fdb_hash_tbl, addr, vid);
 }
 
+/**
+ * br_fdb_has_forwarding_entry_rcu - check if a MAC can be forwarded by the bridge
+ * @dev: bridge port network device
+ * @skb: packet buffer (used to determine VLAN id)
+ * @addr: destination MAC address
+ *
+ * Resolves the VLAN id for @skb on @dev (skb VLAN tag when present, PVID
+ * when VLAN filtering is enabled, 0 otherwise) then checks whether the bridge
+ * FDB contains a forwarding entry (dst != NULL, not a local/self entry) for
+ * @addr and that VLAN id. Single br_port_get_rcu() lookup.
+ * Must be called under RCU read lock.
+ *
+ * Returns: true if a forwarding entry exists for @addr, false otherwise.
+ */
+bool br_fdb_has_forwarding_entry_rcu(const struct net_device *dev,
+				     const struct sk_buff *skb, const u8 *addr)
+{
+	struct net_bridge_port *port = br_port_get_rcu(dev);
+	struct net_bridge_fdb_entry *fdb;
+	u16 vid = 0;
+
+	if (!port)
+		return false;
+	if (br_opt_get(port->br, BROPT_VLAN_ENABLED)) {
+		if (skb_vlan_tag_present(skb))
+			vid = skb_vlan_tag_get_id(skb);
+		else
+			br_vlan_get_pvid_rcu(dev, &vid);
+	}
+	fdb = br_fdb_find_rcu(port->br, addr, vid);
+	return fdb && fdb->dst;
+}
+EXPORT_SYMBOL_GPL(br_fdb_has_forwarding_entry_rcu);
+
 /* When a static FDB entry is added, the mac address from the entry is
  * added to the bridge private HW address list and all required ports
  * are then updated with the new information.
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 5560afcaaca3..974e57ea533a 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1559,6 +1559,53 @@ int br_vlan_get_info_rcu(const struct net_device *dev, u16 vid,
 }
 EXPORT_SYMBOL_GPL(br_vlan_get_info_rcu);
 
+/**
+ * br_vlan_get_offload_info_rcu - get VLAN id and protocol for bridge flow offload
+ * @dev: bridge port network device
+ * @skb: packet buffer
+ * @proto: output for the bridge VLAN protocol (set only when return value != 0)
+ *
+ * When VLAN filtering is enabled, resolves the VLAN id for flow offload (skb
+ * VLAN tag id if present, PVID otherwise) and writes the bridge VLAN protocol
+ * to @proto. Single br_port_get_rcu() lookup. Must be called under RCU read
+ * lock.
+ *
+ * Returns: the VLAN id, or 0 when filtering is off or @dev is not a bridge port.
+ */
+u16 br_vlan_get_offload_info_rcu(const struct net_device *dev,
+				 const struct sk_buff *skb, __be16 *proto)
+{
+	struct net_bridge_port *port = br_port_get_rcu(dev);
+	u16 vid = 0;
+
+	if (!port || !br_opt_get(port->br, BROPT_VLAN_ENABLED))
+		return 0;
+	if (skb_vlan_tag_present(skb))
+		vid = skb_vlan_tag_get_id(skb);
+	else
+		br_vlan_get_pvid_rcu(dev, &vid);
+	if (vid)
+		*proto = port->br->vlan_proto;
+	return vid;
+}
+EXPORT_SYMBOL_GPL(br_vlan_get_offload_info_rcu);
+
+/**
+ * br_vlan_is_enabled_rcu - check if VLAN filtering is active on a port's bridge
+ * @dev: bridge port network device
+ *
+ * Must be called under RCU read lock.
+ *
+ * Returns: true if VLAN filtering is enabled, false otherwise.
+ */
+bool br_vlan_is_enabled_rcu(const struct net_device *dev)
+{
+	struct net_bridge_port *port = br_port_get_rcu(dev);
+
+	return port && br_opt_get(port->br, BROPT_VLAN_ENABLED);
+}
+EXPORT_SYMBOL_GPL(br_vlan_is_enabled_rcu);
+
 static int br_vlan_is_bind_vlan_dev(const struct net_device *dev)
 {
 	return is_vlan_dev(dev) &&
-- 
2.54.0


