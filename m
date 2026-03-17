Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE3DFED9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r//vOrSR+2gAsQzSBSo14JWiZid4nVNQYihurrLEFVE=; b=CPa9KrxZgR1YuydO7o9p9uOtAm
	wjgjeSstctB3YyYnOR0JQIKuOnGcOtJk3MwB8Sakwtnm7K+VvmNdBO7aTUAYpcZTHiLRz502ywhAT
	JeDg+gtX+PAe+GQsQkGIyMdA/On3GmYphiW+LfYRSSj7G558/3VIlY33HCp5thm+Kf4RZZfvL7Awi
	jY/4gFLo3/lyU2Wq33pqJp8g/BSon0j6aL5PB33kspxeqmxEqc3JBG3qOrOSekUv8TAti6gOugAfG
	l1UAfrGT57Z2gjpP9vbF/r7AjtKd5xgrld5/LO+lPh4niExUSy0F63cVGtsGwkUgZcu4m2yhArNnR
	ver1Spcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XTj-00000006qkI-2gm1;
	Tue, 17 Mar 2026 16:41:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XTi-00000006qjt-0vH2;
	Tue, 17 Mar 2026 16:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F36C600AD;
	Tue, 17 Mar 2026 16:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCF5C4CEF7;
	Tue, 17 Mar 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773765669;
	bh=aKk8CwjQFlvDFGw19/B1mbkHRei2+NpV9NvGcu75TQI=;
	h=From:Date:Subject:To:Cc:From;
	b=mAuhEv65MyTHCKNdGkZ+qb4On/+XKTu4aKKsqOqDXq2CiqVhg9MU8l3l3431xdrtK
	 stDTJ2hgDsKuWjgpT9V4CHVuNOYjBInGhP5R76bQAB+mSftaupDgtOC9+uRqnANElX
	 G1kX6rNSoA41Xkg4rUK1pzW1L/6EoF17o4USUOnEqOjLtXO7sKpZiwlJuimVenhrB+
	 847vvC82phUw222+bD+GwqMpHuSJJErZhwZsk5HMJTOSY65GLBdM86uiAn72gz0yAL
	 sXWxzTz9alQLmoQqkrh8IJ7F202Qaz8NiFt/RgfGoCjcizUGnZvFE01kKLGlNHOEMt
	 1MMv2AaHGreaQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 17 Mar 2026 17:40:47 +0100
Subject: [PATCH net-next] net: airoha: Reset PPE cpu port configuration in
 airoha_ppe_hw_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBQFrxJ/3QczqOgq0cL0WX9johVBdPek5
 cDMPJSRBJnG6qGES7LsoUBTV2Q3E1awuMKkle5U2/RsJO2bYS83xwh28GzjyUoPyvedc3ZZqMQ
 xoSj/eKKAgwPug+b3/QA9fqV9cgAAAA==
X-Change-ID: 20260317-airoha-fix-ppe-def-cpu-0280f76ddcbb
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Before this patch, the PPE cpu port configuration used for a specific GDM
device was set just running ndo_init() callback during the device
initialization. The selected PPE cpu port configuration depends on the QDMA
block assigned to the GDM port. The QDMA block is selected according to
the GDM port LAN/WAN configuration as specified in the commit
'8737d7194d6d ("net: airoha: select QDMA block according LAN/WAN
configuration"). However, the user selected PPE cpu port configuration can
be different with respect to the one hardcoded in the NPU firmware binary.
The hardcoded NPU PPE cpu port configuration is loaded initializing the PPE
engine running the NPU ops ppe_init() callback in airoha_ppe_offload_setup
routine (this is executed at runtime by the netfilter flowtable
infrastructure during flow offloading).
Reset the PPE cpu port configuration in airoha_ppe_hw_init routine in
order to apply the user requested setup according to the device DTS.
Please note this patch is fixing an issue not visible to the user (so we
do not need to backport it) since airoha_eth driver currently supports just
the internal phy available via the MT7530 DSA switch and there are no WAN
interfaces officially supported since PCS/external phy is not merged
mainline yet (it will be posted with following patches).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 28 ++++++----------------------
 drivers/net/ethernet/airoha/airoha_eth.h  |  2 ++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 23 ++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_regs.h |  7 +++----
 4 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b4563b5d53bbf174d45548a5efc6fdfb79d33c19..21a866e3cc05522104c0a7dc49a6b7a3c9f42165 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1755,8 +1755,7 @@ static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_eth *eth = port->eth;
-	u32 fe_cpu_port;
-	u8 ppe_id;
+	int i;
 
 	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
 	port->qdma = &eth->qdma[!airoha_is_lan_gdm_port(port)];
@@ -1774,28 +1773,13 @@ static int airoha_dev_init(struct net_device *dev)
 			if (err)
 				return err;
 		}
-		fallthrough;
-	case AIROHA_GDM2_IDX:
-		if (airoha_ppe_is_enabled(eth, 1)) {
-			/* For PPE2 always use secondary cpu port. */
-			fe_cpu_port = FE_PSE_PORT_CDM2;
-			ppe_id = 1;
-			break;
-		}
-		fallthrough;
-	default: {
-		u8 qdma_id = port->qdma - &eth->qdma[0];
-
-		/* For PPE1 select cpu port according to the running QDMA. */
-		fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
-		ppe_id = 0;
 		break;
-	}
+	default:
+		break;
 	}
 
-	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT0(ppe_id),
-		      DFT_CPORT_MASK(port->id),
-		      __field_prep(DFT_CPORT_MASK(port->id), fe_cpu_port));
+	for (i = 0; i < eth->soc->num_ppe; i++)
+		airoha_ppe_set_cpu_port(port, i);
 
 	return 0;
 }
@@ -1898,7 +1882,7 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
-static int airoha_get_fe_port(struct airoha_gdm_port *port)
+int airoha_get_fe_port(struct airoha_gdm_port *port)
 {
 	struct airoha_qdma *qdma = port->qdma;
 	struct airoha_eth *eth = qdma->eth;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8cfa94ec084a16d6b2d3c94c404f25904c1150e3..7df4dbcd8861856c54c2a38bc89c69180ac2f6dc 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -646,9 +646,11 @@ static inline bool airoha_is_7583(struct airoha_eth *eth)
 	return eth->soc->version == 0x7583;
 }
 
+int airoha_get_fe_port(struct airoha_gdm_port *port);
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id);
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index ec5ce41dad80827c8b467b8be112eebd14914744..7666b1d2f4f6ea758683181ab90d6fffb7bcd19d 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -85,6 +85,20 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
 }
 
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
+{
+	struct airoha_qdma *qdma = port->qdma;
+	u8 fport = airoha_get_fe_port(port);
+	struct airoha_eth *eth = qdma->eth;
+	u8 qdma_id = qdma - &eth->qdma[0];
+	u32 fe_cpu_port;
+
+	fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
+	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT(ppe_id, fport),
+		      DFT_CPORT_MASK(fport),
+		      __field_prep(DFT_CPORT_MASK(fport), fe_cpu_port));
+}
+
 static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 {
 	u32 sram_ppe_num_data_entries = PPE_SRAM_NUM_ENTRIES, sram_num_entries;
@@ -147,7 +161,9 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 
 		airoha_fe_wr(eth, REG_PPE_HASH_SEED(i), PPE_HASH_SEED);
 
-		for (p = 0; p < ARRAY_SIZE(eth->ports); p++)
+		for (p = 0; p < ARRAY_SIZE(eth->ports); p++) {
+			struct airoha_gdm_port *port = eth->ports[p];
+
 			airoha_fe_rmw(eth, REG_PPE_MTU(i, p),
 				      FP0_EGRESS_MTU_MASK |
 				      FP1_EGRESS_MTU_MASK,
@@ -155,6 +171,11 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 						 AIROHA_MAX_MTU) |
 				      FIELD_PREP(FP1_EGRESS_MTU_MASK,
 						 AIROHA_MAX_MTU));
+			if (!port)
+				continue;
+
+			airoha_ppe_set_cpu_port(port, i);
+		}
 	}
 }
 
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 29878b954c77c79ae45e63357840a10c23c517f2..436f3c8779c102e900139e9f015816ebeb64eb98 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -312,10 +312,9 @@
 #define REG_PPE_HASH_SEED(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x244)
 #define PPE_HASH_SEED				0x12345678
 
-#define REG_PPE_DFT_CPORT0(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x248)
-#define DFT_CPORT_MASK(_n)			GENMASK(3 + ((_n) << 2), ((_n) << 2))
-
-#define REG_PPE_DFT_CPORT1(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x24c)
+#define REG_PPE_DFT_CPORT_BASE(_n)		(((_n) ? PPE2_BASE : PPE1_BASE) + 0x248)
+#define REG_PPE_DFT_CPORT(_m, _n)		(REG_PPE_DFT_CPORT_BASE(_m) + (((_n) / 8) << 2))
+#define DFT_CPORT_MASK(_n)			GENMASK(3 + (((_n) % 8) << 2), (((_n) % 8) << 2))
 
 #define REG_PPE_TB_HASH_CFG(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x250)
 #define PPE_DRAM_HASH1_MODE_MASK		GENMASK(31, 28)

---
base-commit: 8737d7194d6d5947c3d7d8813895b44a25b84477
change-id: 20260317-airoha-fix-ppe-def-cpu-0280f76ddcbb

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


