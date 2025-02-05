Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A7FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f06xkghlEo8FyZQVUWkE6MBlI9hG9TI/mLWSm1FtUN0=; b=YRKP3VvvlQrMptlsc53X6X401D
	SLQYUOpsBrwmL5egrNiYajQpeiyfDy/Zm7KJR1EBqM1UnWwVs1J5u1XuYCT0z+O32pmAQLcgWUKhU
	J+H8n8eJOMRGFmwpjtWNA1jcimFoYWvlxIOEIfas8kKAoKWO1UReHpDb7g7eyghWJUOmYdUMC0C7Y
	m5wowWGYmMvKVwLPbdGdsJPrsiXuFuaaQ10E1yPtKMIZIoriNijTNNI4+4S8PR3lh3dA3cpxjS60U
	STXYnaYbGtZ1vnRLUgy97d8DckyXWvHgUDXeQQ4oZTXKlIl9xJsTf/Qnt+58khUvAWPBPbVxBHdAK
	ZIoCsgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflLh-00000004Rqg-24YE;
	Wed, 05 Feb 2025 19:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2t-00000004Efg-0GLl;
	Wed, 05 Feb 2025 18:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f06xkghlEo8FyZQVUWkE6MBlI9hG9TI/mLWSm1FtUN0=; b=c2mTljlJyZDHd29RFbQFJohqeG
	qZp2S4sMBYw+YlgxjdNvzXVA6AFIEOcHvwIBTry06RemsfRiXUAeHMsL8ZgK9bKAKxt0ZbHCMER9d
	+/zggwV5c77WkL4uchvOo4FzPUG2hkl4uDJrUtP1QhiK1/ukT64byNOl9gH7F4FL6Skx8q/yzYuPl
	+kNgkGyr67QfD45zobjggMrF6+DfAgalG+Q+mYDLRgXdqIlZS/uJOuewbZ4/Vyz55IAXGnlun/9IY
	IVI0QL7uUbYk9begJcimv3u7q+qkDl0sif+NkprTtkyqUY4ZGSrOlH50LuHPCJdSqYNIgQYsD8LS1
	+nMEReMA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2q-0000000GlC9-0ADl;
	Wed, 05 Feb 2025 18:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D36125C6DD0;
	Wed,  5 Feb 2025 18:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A6C4CEDD;
	Wed,  5 Feb 2025 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738779758;
	bh=vq1yg8bBwcHYIQZdoIwbIlxcXj/zSlKnkeYluYCBJ54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gBUEWd3Usl5t/QpQMl8FC+mB7+aSdL4UxeO9H8U6lZc75+2MiS11eg8oQ9mJ6bmO6
	 N937eqez/eFyB5iFdFLaU0hDF3GzdVR2Z9Mruj9CE8SM6L8KJvzqZxwiWuFSIETtQC
	 ka/xvuGFPs8TrcoakVQ/iI1e44DuxmT25r3qOqHsC/IR89sESeQmJPyJfpRRMp8W+L
	 Eksf8WBqL+eYpjF8q276VnDhvHrVewEyi+EY3OCSx5NUwhiFq926fNA9ahvt6zX+cL
	 eAY03IKY5M7ZnPBRmiMEfZjTuycI6V+umYbf7OUpsuS8N9AE1NrsonJq1Puw3BiaQ2
	 2Nw6L19jghzqw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 05 Feb 2025 19:21:32 +0100
Subject: [PATCH net-next 13/13] net: airoha: Introduce PPE debugfs support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-airoha-en7581-flowtable-offload-v1-13-d362cfa97b01@kernel.org>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_182240_395608_6F0F89FD 
X-CRM114-Status: GOOD (  20.19  )
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
 drivers/net/ethernet/airoha/airoha_eth.h         |  12 ++
 drivers/net/ethernet/airoha/airoha_ppe.c         |   5 +
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 175 +++++++++++++++++++++++
 4 files changed, 193 insertions(+)

diff --git a/drivers/net/ethernet/airoha/Makefile b/drivers/net/ethernet/airoha/Makefile
index 50028cfc3e3e04efbdd353b1bd65f46b488637d8..e5321effdbeaeaf7c4ad3c6df9d0261fe12fdd12 100644
--- a/drivers/net/ethernet/airoha/Makefile
+++ b/drivers/net/ethernet/airoha/Makefile
@@ -5,4 +5,5 @@
 
 obj-$(CONFIG_NET_AIROHA) += airoha-eth.o
 airoha-eth-y := airoha_eth.o airoha_ppe.o
+airoha-eth-$(CONFIG_DEBUG_FS) += airoha_ppe_debugfs.o
 airoha-eth-$(CONFIG_NET_AIROHA_NPU) += airoha_npu.o
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 20e870a5c20091f0bb572f87f111c660b2075c32..b5002b333f9c907e298c5e95c530ba8318a292db 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -7,6 +7,7 @@
 #ifndef AIROHA_ETH_H
 #define AIROHA_ETH_H
 
+#include <linux/debugfs.h>
 #include <linux/etherdevice.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -501,6 +502,8 @@ struct airoha_ppe {
 
 	struct hlist_head *foe_flow;
 	u16 foe_check_time[PPE_NUM_ENTRIES];
+
+	struct dentry *debugfs_dir;
 };
 
 struct airoha_eth {
@@ -610,4 +613,13 @@ static inline int airoha_npu_foe_commit_entry(struct airoha_ppe *ppe,
 }
 #endif /* CONFIG_NET_AIROHA_NPU */
 
+#if CONFIG_DEBUG_FS
+int airoha_ppe_debugfs_init(struct airoha_ppe *ppe);
+#else
+static inline int airoha_ppe_debugfs_init(struct airoha_ppe *ppe)
+{
+	return 0;
+}
+#endif
+
 #endif /* AIROHA_ETH_H */
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 00bf30d102ee868ab51d72e09a013adf8d6e1fad..4a0e7e7a7d8cd9a1e7e43bc60588eace31659b14 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -787,6 +787,10 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (err)
 		goto error_npu_deinit;
 
+	err = airoha_ppe_debugfs_init(ppe);
+	if (err)
+		goto error_npu_deinit;
+
 	return 0;
 
 error_npu_deinit:
@@ -804,4 +808,5 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 		airoha_npu_deinit(eth->npu);
 	}
 	rhashtable_destroy(&eth->flow_table);
+	debugfs_remove(eth->ppe->debugfs_dir);
 }
diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..f79788458903c93ca73d774edaca97f1e08f92a7
--- /dev/null
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -0,0 +1,175 @@
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
+		u16 *src_port = NULL, *dest_port = NULL;
+		struct airoha_foe_mac_info_common *l2;
+		unsigned char h_source[ETH_ALEN] = {};
+		unsigned char h_dest[ETH_ALEN];
+		struct airoha_foe_entry *hwe;
+		u32 type, state, ib2, data;
+		void *src_addr, *dest_addr;
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
+		}
+
+		seq_puts(m, " orig=");
+		airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
+					       src_port, dest_port, ipv6);
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


