Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D3DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXCEGwWH2r8/Fg8Wyk8MNgNyu+SSduxc/2ufVGd5TKk=; b=MtCtp6LAVX7/Fiya+7NfMrhzX0
	KzbD7fJolbalyh+jxNQG24tMsAkJAA9Yzi7mzL++/YwvafVbQQOdp0wnWl6fqI8EygtR+cKjlrBzI
	xxc4DAyfz3OqqfvtK3xiF8yjsBN7K1jB0jYUchmAISesi+Z22UNjOt8lSnZyudocPxy7q+9qzH2O8
	AOwaNw6cbyhrZQwzL5+Mq3Om6w1kI7sr4jlP/HYgRabDZhqbJ48ei9KA61eAHAwSavlUZPLYaasw+
	o4e2q0jnGHt7zsQM7+Fo4mpFC7xuBRZrWFa1LSmNYH79rkIoJEkR2P/tt+0N3WwMTGahSmwr7QmTq
	srXRLg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2u0-00000007FKu-3pmy;
	Mon, 02 Jun 2025 11:00:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2pk-00000007Em8-0AqH;
	Mon, 02 Jun 2025 10:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0649A4A885;
	Mon,  2 Jun 2025 10:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87755C4CEED;
	Mon,  2 Jun 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861758;
	bh=PrBbFcr2EBu1yUqwrgyaEHmUBSZuBJoF7PE+74RIxeg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TUmVoqvua15gca87BMsqcfsLiRv1wpGwYTU9gCImh9v1/CG8Pv6dpuCxiH0Nkahx7
	 RwwAncmpCha/IY6rDIjMux9gBk7FNnmj3/jiQKbwfO+8lllpL+oYMEW76RsuTfo0qZ
	 sJ88IOsOOlrTOcu0OluCRSGYcO1L7jvEwhm/RKLwK3pBaCzz1rYBiwLgJEJ2l4MaUw
	 rFpQsvsxA7gC+Bg2TwEoncCOhiD9EG3UKKDiW8NX3B8jUjodzT5v9kmzoQPb3W71ae
	 9MpJ5TIC94CwghjBAavABIWYFRFCXFUyx/ntbhhU37fWjNOPbKKeE+Be80qJbjffOF
	 2899ewUQ/c5Gg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 02 Jun 2025 12:55:37 +0200
Subject: [PATCH net v2 1/3] net: airoha: Initialize PPE UPDMEM source-mac
 table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-airoha-flowtable-ipv6-fix-v2-1-3287f8b55214@kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_035600_138543_08EB851F 
X-CRM114-Status: GOOD (  15.04  )
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

UPDMEM source-mac table is a key-value map used to store devices mac
addresses according to the port identifier. UPDMEM source mac table is
used during IPv6 traffic hw acceleration since PPE entries, for space
constraints, do not contain the full source mac address but just the
identifier in the UPDMEM source-mac table.
Configure UPDMEM source-mac table with device mac addresses and set
the source-mac ID field for PPE IPv6 entries in order to select the
proper device mac address as source mac for L3 IPv6 hw accelerated traffic.

Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  |  2 ++
 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c  | 26 +++++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_regs.h | 10 ++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d1d3b854361e443d414876f79f59b3c64cbcbe16..a7ec609d64dee9c8e901c7eb650bb3fe144ee00a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -84,6 +84,8 @@ static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 	val = (addr[3] << 16) | (addr[4] << 8) | addr[5];
 	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
 	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
+
+	airoha_ppe_init_upd_mem(port);
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index b815697302bfdf2a6d115a9bbbbadc05462dbadb..a970b789cf232c316e5ea27b0146493bf91c3767 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -614,6 +614,7 @@ void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
 int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
+void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 						  u32 hash);
 void airoha_ppe_foe_entry_get_stats(struct airoha_ppe *ppe, u32 hash,
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 12d32c92717a6b4ba74728ec02bb2e166d4d9407..a783f16980e6b7fdb69cec7ff09883a9c83d42d5 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -223,6 +223,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 	int dsa_port = airoha_get_dsa_port(&dev);
 	struct airoha_foe_mac_info_common *l2;
 	u32 qdata, ports_pad, val;
+	u8 smac_id = 0xf;
 
 	memset(hwe, 0, sizeof(*hwe));
 
@@ -257,6 +258,8 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 		 */
 		if (airhoa_is_lan_gdm_port(port))
 			val |= AIROHA_FOE_IB2_FAST_PATH;
+
+		smac_id = port->id;
 	}
 
 	if (is_multicast_ether_addr(data->eth.h_dest))
@@ -291,7 +294,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 		hwe->ipv4.l2.src_mac_lo =
 			get_unaligned_be16(data->eth.h_source + 4);
 	} else {
-		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, 0xf);
+		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, smac_id);
 	}
 
 	if (data->vlan.num) {
@@ -1238,6 +1241,27 @@ void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
 	airoha_ppe_foe_insert_entry(ppe, skb, hash);
 }
 
+void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port)
+{
+	struct airoha_eth *eth = port->qdma->eth;
+	struct net_device *dev = port->dev;
+	const u8 *addr = dev->dev_addr;
+	u32 val;
+
+	val = (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];
+	airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
+	airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
+		     FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
+		     PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
+
+	val = (addr[0] << 8) | addr[1];
+	airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
+	airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
+		     FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
+		     FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
+		     PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
+}
+
 int airoha_ppe_init(struct airoha_eth *eth)
 {
 	struct airoha_ppe *ppe;
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index d931530fc96fb00ada36a6ad37fa295865a6f0a8..04187eb40ec674ec5a4ccfc968bb4bd579a53095 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -313,6 +313,16 @@
 #define REG_PPE_RAM_BASE(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x320)
 #define REG_PPE_RAM_ENTRY(_m, _n)		(REG_PPE_RAM_BASE(_m) + ((_n) << 2))
 
+#define REG_UPDMEM_CTRL(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x370)
+#define PPE_UPDMEM_ACK_MASK			BIT(31)
+#define PPE_UPDMEM_ADDR_MASK			GENMASK(11, 8)
+#define PPE_UPDMEM_OFFSET_MASK			GENMASK(7, 4)
+#define PPE_UPDMEM_SEL_MASK			GENMASK(3, 2)
+#define PPE_UPDMEM_WR_MASK			BIT(1)
+#define PPE_UPDMEM_REQ_MASK			BIT(0)
+
+#define REG_UPDMEM_DATA(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x374)
+
 #define REG_FE_GDM_TX_OK_PKT_CNT_H(_n)		(GDM_BASE(_n) + 0x280)
 #define REG_FE_GDM_TX_OK_BYTE_CNT_H(_n)		(GDM_BASE(_n) + 0x284)
 #define REG_FE_GDM_TX_ETH_PKT_CNT_H(_n)		(GDM_BASE(_n) + 0x288)

-- 
2.49.0


