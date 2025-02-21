Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382A5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOdIoQSeChpNEczInPEwC/mMU6VY1HMTN3HZJLDc1VA=; b=tKjSS1NZbi4gfGMtGfHke4orLM
	wkfKNCnf6o2+ACv5zVQy/NS9wf67xnWDLgEke141XnuFJvmuUCAA8NEjYDkXJ1RsZszhlRkoA4VQ4
	rFQG0KkLaPaEb+NVjUrFukEZIXsll/YhIdFINfxCsnWzlXnVIaTR44TL/QKSnycUAQ1ynDO1JTxaT
	XV/y+0PM3bJY7Eo/Jv+a9qjsMm5K1++Y3bpviVYfyQV/0mErhR/D2ov+zJL8GwOzvihXiUR2IKNut
	lRBsYZ3LS/GndeMv6QgiGBqDb2PyCs00rBlfHSFhFFAQzWOWejqg7ZXm584DV8g2+ZfexqkJdJgWy
	AznhrhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQor-00000005GoX-315S;
	Fri, 21 Feb 2025 11:03:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQHK-00000005BLZ-3n1V;
	Fri, 21 Feb 2025 10:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DA90611AD;
	Fri, 21 Feb 2025 10:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8194FC4CED6;
	Fri, 21 Feb 2025 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133745;
	bh=e8wci36g2POAAVn69BnDKaO0K8Qn0U6FIZaaoMy9+nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j9GbW3W5Q+ynhKsnS0/Gqu1jPdJnDfIorKRo0Q8bCmaCs/Sgx6TpEjxLrw/6HcFUP
	 7284Su8h/8djq1O6hoJeLVgm41mH2V6853uu+WnXM+ZRY/cxE6TV359l1f9eN9XH1D
	 dalLVLN1IRSjNgsMWAErvXQrL+3Wb2unOaN0o5t7FFj7VTuFCUZmWxEclZdEeXW0DH
	 u3JeCiTA39wAk4PfOG3jiCAfVcS5I4L6ktM6OFyejNRJtQvSQfvuSEeCcmxKyylErd
	 FE1XbKl2TeZPkenRd3V0ahMHxNZ1hznusrwRsTb8IPzWOmU3F1RJLq2d0SMH6IoYwa
	 dfDmBHAtTE/pw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 21 Feb 2025 11:28:16 +0100
Subject: [PATCH net-next v6 15/15] net: airoha: Introduce PPE debugfs
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-airoha-en7581-flowtable-offload-v6-15-d593af0e9487@kernel.org>
References: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
In-Reply-To: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
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

Similar to PPE support for Mediatek devices, introduce PPE debugfs
in order to dump binded and unbinded flows.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/Makefile             |   1 +
 drivers/net/ethernet/airoha/airoha_eth.h         |  14 ++
 drivers/net/ethernet/airoha/airoha_ppe.c         |  17 ++-
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 181 +++++++++++++++++++++++
 4 files changed, 209 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Makefile b/drivers/net/ethernet/airoha/Makefile
index 6deff2f16229a7638be0737caa06282ba63183a4..94468053e34bef8fd155760e13745a8663592f4a 100644
--- a/drivers/net/ethernet/airoha/Makefile
+++ b/drivers/net/ethernet/airoha/Makefile
@@ -5,4 +5,5 @@
 
 obj-$(CONFIG_NET_AIROHA) += airoha-eth.o
 airoha-eth-y := airoha_eth.o airoha_ppe.o
+airoha-eth-$(CONFIG_DEBUG_FS) += airoha_ppe_debugfs.o
 obj-$(CONFIG_NET_AIROHA_NPU) += airoha_npu.o
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 064941348bd91f1115082bf5e7734f34007953f8..18b5fed7ff286b813b260fae121892f44eb1cf8c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -7,6 +7,7 @@
 #ifndef AIROHA_ETH_H
 #define AIROHA_ETH_H
 
+#include <linux/debugfs.h>
 #include <linux/etherdevice.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -482,6 +483,8 @@ struct airoha_ppe {
 
 	struct hlist_head *foe_flow;
 	u16 foe_check_time[PPE_NUM_ENTRIES];
+
+	struct dentry *debugfs_dir;
 };
 
 struct airoha_eth {
@@ -535,5 +538,16 @@ int airoha_ppe_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 				 void *cb_priv);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
+struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
+						  u32 hash);
+
+#if CONFIG_DEBUG_FS
+int airoha_ppe_debugfs_init(struct airoha_ppe *ppe);
+#else
+static inline int airoha_ppe_debugfs_init(struct airoha_ppe *ppe)
+{
+	return 0;
+}
+#endif
 
 #endif /* AIROHA_ETH_H */
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 086210d6894a2ed47cdd71039a2aea452f276be0..3a705f56aacac4f2fd91e3f4fe8da49a9722d98c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -377,8 +377,8 @@ static u32 airoha_ppe_foe_get_entry_hash(struct airoha_foe_entry *hwe)
 	return hash;
 }
 
-static struct airoha_foe_entry *
-airoha_ppe_foe_get_entry(struct airoha_ppe *ppe, u32 hash)
+struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
+						  u32 hash)
 {
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
@@ -849,7 +849,7 @@ void airoha_ppe_check_skb(struct airoha_ppe *ppe, u16 hash)
 int airoha_ppe_init(struct airoha_eth *eth)
 {
 	struct airoha_ppe *ppe;
-	int foe_size;
+	int foe_size, err;
 
 	ppe = devm_kzalloc(eth->dev, sizeof(*ppe), GFP_KERNEL);
 	if (!ppe)
@@ -870,7 +870,15 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (!ppe->foe_flow)
 		return -ENOMEM;
 
-	return rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
+	err = rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
+	if (err)
+		return err;
+
+	err = airoha_ppe_debugfs_init(ppe);
+	if (err)
+		rhashtable_destroy(&eth->flow_table);
+
+	return err;
 }
 
 void airoha_ppe_deinit(struct airoha_eth *eth)
@@ -886,4 +894,5 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 	rcu_read_unlock();
 
 	rhashtable_destroy(&eth->flow_table);
+	debugfs_remove(eth->ppe->debugfs_dir);
 }
diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..0216d0d5e52b995f9ac956892a3cc105aa896c19
--- /dev/null
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+
+#include "airoha_eth.h"
+
+static void airoha_debugfs_ppe_print_tuple(struct seq_file *m,
+					   void *src_addr, void *dest_addr,
+					   u16 *src_port, u16 *dest_port,
+					   bool ipv6)
+{
+	__be32 n_addr[IPV6_ADDR_WORDS];
+
+	if (ipv6) {
+		ipv6_addr_cpu_to_be32(n_addr, src_addr);
+		seq_printf(m, "%pI6", n_addr);
+	} else {
+		seq_printf(m, "%pI4h", src_addr);
+	}
+	if (src_port)
+		seq_printf(m, ":%d", *src_port);
+
+	seq_puts(m, "->");
+
+	if (ipv6) {
+		ipv6_addr_cpu_to_be32(n_addr, dest_addr);
+		seq_printf(m, "%pI6", n_addr);
+	} else {
+		seq_printf(m, "%pI4h", dest_addr);
+	}
+	if (dest_port)
+		seq_printf(m, ":%d", *dest_port);
+}
+
+static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
+				       bool bind)
+{
+	static const char *const ppe_type_str[] = {
+		[PPE_PKT_TYPE_IPV4_HNAPT] = "IPv4 5T",
+		[PPE_PKT_TYPE_IPV4_ROUTE] = "IPv4 3T",
+		[PPE_PKT_TYPE_BRIDGE] = "L2B",
+		[PPE_PKT_TYPE_IPV4_DSLITE] = "DS-LITE",
+		[PPE_PKT_TYPE_IPV6_ROUTE_3T] = "IPv6 3T",
+		[PPE_PKT_TYPE_IPV6_ROUTE_5T] = "IPv6 5T",
+		[PPE_PKT_TYPE_IPV6_6RD] = "6RD",
+	};
+	static const char *const ppe_state_str[] = {
+		[AIROHA_FOE_STATE_INVALID] = "INV",
+		[AIROHA_FOE_STATE_UNBIND] = "UNB",
+		[AIROHA_FOE_STATE_BIND] = "BND",
+		[AIROHA_FOE_STATE_FIN] = "FIN",
+	};
+	struct airoha_ppe *ppe = m->private;
+	int i;
+
+	for (i = 0; i < PPE_NUM_ENTRIES; i++) {
+		const char *state_str, *type_str = "UNKNOWN";
+		void *src_addr = NULL, *dest_addr = NULL;
+		u16 *src_port = NULL, *dest_port = NULL;
+		struct airoha_foe_mac_info_common *l2;
+		unsigned char h_source[ETH_ALEN] = {};
+		unsigned char h_dest[ETH_ALEN];
+		struct airoha_foe_entry *hwe;
+		u32 type, state, ib2, data;
+		bool ipv6 = false;
+
+		hwe = airoha_ppe_foe_get_entry(ppe, i);
+		if (!hwe)
+			continue;
+
+		state = FIELD_GET(AIROHA_FOE_IB1_STATE, hwe->ib1);
+		if (!state)
+			continue;
+
+		if (bind && state != AIROHA_FOE_STATE_BIND)
+			continue;
+
+		state_str = ppe_state_str[state % ARRAY_SIZE(ppe_state_str)];
+		type = FIELD_GET(AIROHA_FOE_IB1_PACKET_TYPE, hwe->ib1);
+		if (type < ARRAY_SIZE(ppe_type_str) && ppe_type_str[type])
+			type_str = ppe_type_str[type];
+
+		seq_printf(m, "%05x %s %7s", i, state_str, type_str);
+
+		switch (type) {
+		case PPE_PKT_TYPE_IPV4_HNAPT:
+		case PPE_PKT_TYPE_IPV4_DSLITE:
+			src_port = &hwe->ipv4.orig_tuple.src_port;
+			dest_port = &hwe->ipv4.orig_tuple.dest_port;
+			fallthrough;
+		case PPE_PKT_TYPE_IPV4_ROUTE:
+			src_addr = &hwe->ipv4.orig_tuple.src_ip;
+			dest_addr = &hwe->ipv4.orig_tuple.dest_ip;
+			break;
+		case PPE_PKT_TYPE_IPV6_ROUTE_5T:
+			src_port = &hwe->ipv6.src_port;
+			dest_port = &hwe->ipv6.dest_port;
+			fallthrough;
+		case PPE_PKT_TYPE_IPV6_ROUTE_3T:
+		case PPE_PKT_TYPE_IPV6_6RD:
+			src_addr = &hwe->ipv6.src_ip;
+			dest_addr = &hwe->ipv6.dest_ip;
+			ipv6 = true;
+			break;
+		default:
+			break;
+		}
+
+		if (src_addr && dest_addr) {
+			seq_puts(m, " orig=");
+			airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
+						       src_port, dest_port, ipv6);
+		}
+
+		switch (type) {
+		case PPE_PKT_TYPE_IPV4_HNAPT:
+		case PPE_PKT_TYPE_IPV4_DSLITE:
+			src_port = &hwe->ipv4.new_tuple.src_port;
+			dest_port = &hwe->ipv4.new_tuple.dest_port;
+			fallthrough;
+		case PPE_PKT_TYPE_IPV4_ROUTE:
+			src_addr = &hwe->ipv4.new_tuple.src_ip;
+			dest_addr = &hwe->ipv4.new_tuple.dest_ip;
+			seq_puts(m, " new=");
+			airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
+						       src_port, dest_port,
+						       ipv6);
+			break;
+		default:
+			break;
+		}
+
+		if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
+			data = hwe->ipv6.data;
+			ib2 = hwe->ipv6.ib2;
+			l2 = &hwe->ipv6.l2;
+		} else {
+			data = hwe->ipv4.data;
+			ib2 = hwe->ipv4.ib2;
+			l2 = &hwe->ipv4.l2.common;
+			*((__be16 *)&h_source[4]) =
+				cpu_to_be16(hwe->ipv4.l2.src_mac_lo);
+		}
+
+		*((__be32 *)h_dest) = cpu_to_be32(l2->dest_mac_hi);
+		*((__be16 *)&h_dest[4]) = cpu_to_be16(l2->dest_mac_lo);
+		*((__be32 *)h_source) = cpu_to_be32(l2->src_mac_hi);
+
+		seq_printf(m, " eth=%pM->%pM etype=%04x data=%08x"
+			      " vlan=%d,%d ib1=%08x ib2=%08x\n",
+			   h_source, h_dest, l2->etype, data,
+			   l2->vlan1, l2->vlan2, hwe->ib1, ib2);
+	}
+
+	return 0;
+}
+
+static int airoha_ppe_debugfs_foe_all_show(struct seq_file *m, void *private)
+{
+	return airoha_ppe_debugfs_foe_show(m, private, false);
+}
+DEFINE_SHOW_ATTRIBUTE(airoha_ppe_debugfs_foe_all);
+
+static int airoha_ppe_debugfs_foe_bind_show(struct seq_file *m, void *private)
+{
+	return airoha_ppe_debugfs_foe_show(m, private, true);
+}
+DEFINE_SHOW_ATTRIBUTE(airoha_ppe_debugfs_foe_bind);
+
+int airoha_ppe_debugfs_init(struct airoha_ppe *ppe)
+{
+	ppe->debugfs_dir = debugfs_create_dir("ppe", NULL);
+	debugfs_create_file("entries", 0444, ppe->debugfs_dir, ppe,
+			    &airoha_ppe_debugfs_foe_all_fops);
+	debugfs_create_file("bind", 0444, ppe->debugfs_dir, ppe,
+			    &airoha_ppe_debugfs_foe_bind_fops);
+
+	return 0;
+}

-- 
2.48.1


