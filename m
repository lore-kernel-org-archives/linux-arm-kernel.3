Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F08C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyKouin1u5dLTjGH2vHTEIBjw8XShphfnZNY49Ba01Y=; b=2T76MBh6iTqCntsOIHA43Ol33d
	lJwWSsXzLSvDBNVWwf4tTMlZgzDx5cd81GXEsvXmZWvlq5ja4MR1JOltTQ7ZF0VkMZEvnjYf6zuiq
	NqqVTlw2ULyJYnaUNh317KUT4LLH5ZJpaTMOwodm7q+N0uiuMgc/yK8kGZP0wepaXxcCyfiVlQ6zi
	p0RTJALI5KtEQ+b3A/0aWwHveUN68qdGGZyQh5lbkcf4cMHiG0xdSbEm2jMRmFbH2AvNLNguM9dOw
	YwgIt5cSH2WWoN6joJQdlc1mioT2m9DJOSSV5/XJNpzi6XBDc+hbA5EKkSizHxht2Y8xT6ndOujrD
	Y/PvRNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB2-0000000EZBo-0YaI;
	Mon, 29 Jun 2026 12:33:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB0-0000000EZ9m-044s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c126b8118afso123219366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736404; x=1783341204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyKouin1u5dLTjGH2vHTEIBjw8XShphfnZNY49Ba01Y=;
        b=E6AuUwxynJxiU6IMWMV02nqrdDYQE8IPysQ7TO/YE7785Jfj5DxUFbGSgZ2XGccqUC
         i6suoyxnbe7N8Srk8fiaJro03QE3hJl5SVAnuaTdkcPIsKlBrPpIEats+jXHMt1/cqrn
         om1zaSTAUIL99sfhZE8DDYuLFt8Ob491yZ1Kry0lVYS+nhJqR2bYtNUbUbzLUS0n3Apo
         BT1OQvc+CDdaF7vaRZZCn53M4IUAwvJTOzDQcrYV8jcCEmWPdJUMmMtnRx88EJwQ1yDJ
         tujfHQhznB0h/v9+D8PGuQviPmLtfiWM3eG3dUaCntvjWt88M5OS+Dlv9qSoq8Cy7VS0
         BIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736404; x=1783341204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IyKouin1u5dLTjGH2vHTEIBjw8XShphfnZNY49Ba01Y=;
        b=kzPISEe+TeJAnEbiP4EQZnYt8DQZrbp3O3rBcelY0A+ZU7eVny0JfQ7h0c0y5iIft7
         81oOhBWYdiooPXBZlMCf2aq6PxbmEDKhi2wGX+//OZNOewWcJU25Fm5CpMs18swjRWQw
         rS9L4280ER5Re9apz3gxsgd4qzhtnNawsE/HYk4gyeIB2AeFB4DEtn9Scj3OH6ZR4i4z
         AeApkkiHv6Zmgi5HLirG42pTrZ9KYw//7eCtfnB1Rhfm8rzK1wKw/KH8tOcQKxM3TXaS
         NxV5HyktDdCPxG0JhNo3VvRfAHNj+PAOs/yTXIbQvx5VMmlQ0VdMNIqBhIsBccMfCvvB
         +W1w==
X-Forwarded-Encrypted: i=1; AHgh+RrbdUHQ7+WVkQ/olR9dbuRTKjU7JI3p+RwQYkydtwfCDbhwQUfSdY2LhDcMxvJYdML4i0s/1tLAHBUgpDo8xmDq@lists.infradead.org
X-Gm-Message-State: AOJu0YzKJj/Vfsv9nMjnxFYyt8xrdJO2ua1VYJcP21tEjssh2kscCYX5
	pO+2qIc+l9V8SKXFnNDQbpQv3FV3tRcDP7fpuhwlTuyHR/2pUh/EPYk/
X-Gm-Gg: AfdE7cnAAOAhMjgwrG9oZkbsCm40xzhGL00V93ucLO4871H66SIRNeIf/GONTBEFcbN
	zVxuPcJ4ufitb0p5IDEl49XkAsYXoPJ9X/lpA4k/AkxjkhyvBvyANgMtWZy4dli8neHDQLxdCEk
	u9iscJgNFQl7gMF4cFY9RbT1ISA1gf2AJOCF38a3r1JHEj01cNaiPeqavWsxycJ65X4eUNcS3Bk
	pk8yVu1yBd/YlHefL+NX7rTYLB8GPNiS+veJQ4Y4R6voAGZAjXgkDuqTxXZxahT1pkSE2HzkNgE
	p43/Nw+beFfQEoi5bGROQeNy5/NqJN1sniGwiUqWTucZGpCDxqAMC5TD3PI74qRJhjx2hbpaYPH
	PtmpOS9Qu2IykU5ENPy54uZ+YFHMwBJGFgdkK9VTcUFW7QJKMHZIFvo7sVlzWeOqldTGwrlAtDI
	mgaAWQZTQ=
X-Received: by 2002:a17:907:9452:b0:c12:7e9f:5ae3 with SMTP id a640c23a62f3a-c127e9f5b7bmr43558466b.15.1782736403905;
        Mon, 29 Jun 2026 05:33:23 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:22 -0700 (PDT)
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
Date: Mon, 29 Jun 2026 14:32:50 +0200
Message-ID: <20260629123253.1912621-3-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053326_089862_15E791A8 
X-CRM114-Status: GOOD (  18.37  )
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
 include/linux/if_bridge.h | 23 ++++++++++++++++++++
 net/bridge/br_fdb.c       | 32 ++++++++++++++++++++++++++++
 net/bridge/br_vlan.c      | 45 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

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
index e4570bbed854..3161c2689f6a 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -267,6 +267,38 @@ struct net_bridge_fdb_entry *br_fdb_find_rcu(struct net_bridge *br,
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
index 5560afcaaca3..0b296362adf7 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1559,6 +1559,51 @@ int br_vlan_get_info_rcu(const struct net_device *dev, u16 vid,
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
+ * to @proto. Returns 0 when filtering is off or @dev is not a bridge port.
+ * Single br_port_get_rcu() lookup. Must be called under RCU read lock.
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
+ * Returns true if VLAN filtering is enabled on the bridge @dev belongs to.
+ * Returns false when @dev is not a bridge port or filtering is off.
+ * Must be called under RCU read lock.
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


