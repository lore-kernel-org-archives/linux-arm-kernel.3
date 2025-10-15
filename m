Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A4CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FByRU5MODSz83JOSx8RaGO2axNxAuM5FbsL64WV9THE=; b=qPvT6IyUUrNz+RLp1rgEglplKE
	Ry3WpmOrAA0HhYjLWhOBt9/dE//HgIrPS20YeZkwOEtIaTAefTZZakP0D2Gu4juCIjk1kY6gfkoPP
	Zqzv56dplLKyzJILnv8HoMprVeOuwIqkQ1tiQeOy7gEGb+yaFRnbEzPlD5Fe4nm9qHnyEdkL43t1q
	RHmQgiN7Kd5N7FtsQdKgVJ56w1tpwf4tNG8ElMLqjXkXqjebjpMiCXWRlryHnSQIMwtHwLr5CiEYx
	CcrU5rSPR5q0xgEHEkdASNryLLsEkoy+suZ6wWD/8OSnKtMTbalAMfK1x19HzkequEZKaqnG9/JSb
	D9V5X9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vk0-00000000guQ-0il5;
	Wed, 15 Oct 2025 07:16:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjv-00000000gnj-13sA;
	Wed, 15 Oct 2025 07:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FByRU5MODSz83JOSx8RaGO2axNxAuM5FbsL64WV9THE=; b=J7/acnhF8leRBZGY1TKN8k2iwu
	5RK4fmHc826MAru0B1dTPIbgb7917cyXFE6SW549coxvCdUYItU3l9ImcXmm/pKxX1yt7V2GixD+A
	+f2sAxs7JqK/9Mp8raiuBbz2t6e7nfKOpvs8uAL6LmiQEcp6LC60LfEiPsHc4xYLLFKSmyq3P7hdn
	q+IKJY4UXjEoxpp/en6PC1R/c4Olguojwvw1hD/sYiUJ7Lx0qSBRV+z6Ud1O3E0hDix8O2yMEPtfu
	U7IwZ3QdYBXz+s9O9ZVATy2GHcEAHnSnVlmRYlgw62UYhPvbA8H2hsxA82LSc2PcgDrENxg8ag96o
	HlPY1euA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vje-00000005lWt-0a6a;
	Wed, 15 Oct 2025 07:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08ED74528A;
	Wed, 15 Oct 2025 07:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF16C4CEF9;
	Wed, 15 Oct 2025 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512543;
	bh=SnFDIbmnt8sluvd1jGzJK+WzdlpMgL5Rv5kEFz5BeJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kr61Q9KoiVaGOxduL2VCbrovxobkMcWlMxnoMvCmQjJMdhNfiY8v2CtJNRVkkdzOO
	 bQGD/BMtZbbQ/jIQL7TvjpZRDw32B+3NsW1JTSffh8322vGBtzpZw/jCDfRp5RgGMX
	 agXh6yChwYHN/MT2addaMAA3e7AuX/vOtQOupCId1PslJQCtyYJAnIkQs7kZsh3z3B
	 YYgCgUI7tQuikFYIuqeTzCMLxjMDtqT3kS6VUVEnPFnq7WfvL+HcPAqQstE5P3pjkW
	 vu5lZLNUn0w+RRvIo0MC2edjHiAp9BdQNniZlG8CHhE+gt738+ySxoNA2Av0gEeEzo
	 i67tqbaJ+BtQA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:05 +0200
Subject: [PATCH net-next 05/12] net: airoha: Generalize
 airoha_ppe2_is_enabled routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-5-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_081559_150464_85A750B3 
X-CRM114-Status: GOOD (  14.82  )
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

Rename airoha_ppe2_is_enabled() in airoha_ppe_is_enabled() and
generalize it in order to check if each PPE module is enabled.
Rely on airoha_ppe_is_enabled routine to properly initialize PPE for
AN7583 SoC since AN7583 does not support PPE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++++-----------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c | 17 ++++++++++-------
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 32015c41b58df68a0fe87bb026ee0a6d44ea6ec9..99e7fea52c6db9c4686fcef368f21e25f21ced58 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -297,8 +297,11 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 	int q;
 
 	all_rsv = airoha_fe_get_pse_all_rsv(eth);
-	/* hw misses PPE2 oq rsv */
-	all_rsv += PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2];
+	if (airoha_ppe_is_enabled(eth, 1)) {
+		/* hw misses PPE2 oq rsv */
+		all_rsv += PSE_RSV_PAGES *
+			   pse_port_num_queues[FE_PSE_PORT_PPE2];
+	}
 	airoha_fe_set(eth, REG_FE_PSE_BUF_SET, all_rsv);
 
 	/* CMD1 */
@@ -335,13 +338,17 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 	for (q = 4; q < pse_port_num_queues[FE_PSE_PORT_CDM4]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM4, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* PPE2 */
-	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2]; q++) {
-		if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / 2)
-			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q,
-						 PSE_QUEUE_RSV_PAGES);
-		else
-			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q, 0);
+	if (airoha_ppe_is_enabled(eth, 1)) {
+		/* PPE2 */
+		for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2]; q++) {
+			if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / 2)
+				airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2,
+							 q,
+							 PSE_QUEUE_RSV_PAGES);
+			else
+				airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2,
+							 q, 0);
+		}
 	}
 	/* GMD4 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
@@ -1762,8 +1769,11 @@ static int airoha_dev_init(struct net_device *dev)
 			airhoha_set_gdm2_loopback(port);
 		fallthrough;
 	case 2:
-		pse_port = FE_PSE_PORT_PPE2;
-		break;
+		if (airoha_ppe_is_enabled(eth, 1)) {
+			pse_port = FE_PSE_PORT_PPE2;
+			break;
+		}
+		fallthrough;
 	default:
 		pse_port = FE_PSE_PORT_PPE1;
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index cb7e198e40eeb2f44bd6e035cc7b583f47441d59..81b1e5f273df20fb8aef7a03e94ac14a3cfaf4d5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -627,6 +627,7 @@ static inline bool airoha_is_7581(struct airoha_eth *eth)
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
+bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
 int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 303d31e1da4b723023ee0cc1ca5f6038c16966cd..68b0b7ebf0e809bb1905f80ac544fb87027ec62f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -56,9 +56,12 @@ static int airoha_ppe_get_total_num_stats_entries(struct airoha_ppe *ppe,
 	return 0;
 }
 
-static bool airoha_ppe2_is_enabled(struct airoha_eth *eth)
+bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index)
 {
-	return airoha_fe_rr(eth, REG_PPE_GLO_CFG(1)) & PPE_GLO_CFG_EN_MASK;
+	if (index >= eth->soc->num_ppe)
+		return false;
+
+	return airoha_fe_rr(eth, REG_PPE_GLO_CFG(index)) & PPE_GLO_CFG_EN_MASK;
 }
 
 static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
@@ -127,7 +130,7 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 						 AIROHA_MAX_MTU));
 	}
 
-	if (airoha_ppe2_is_enabled(eth)) {
+	if (airoha_ppe_is_enabled(eth, 1)) {
 		sram_num_entries = PPE1_SRAM_NUM_ENTRIES;
 		if (!airoha_ppe_get_num_stats_entries(ppe,
 						      &sram_num_stats_entries))
@@ -525,7 +528,7 @@ static int airoha_ppe_foe_get_flow_stats_index(struct airoha_ppe *ppe,
 		return err;
 
 	*index = hash;
-	if (airoha_ppe2_is_enabled(ppe->eth) &&
+	if (airoha_ppe_is_enabled(ppe->eth, 1) &&
 	    hash >= ppe_num_stats_entries)
 		*index = *index - PPE_STATS_NUM_ENTRIES;
 
@@ -620,7 +623,7 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 		u32 val;
 		int i;
 
-		ppe2 = airoha_ppe2_is_enabled(ppe->eth) &&
+		ppe2 = airoha_ppe_is_enabled(ppe->eth, 1) &&
 		       hash >= PPE1_SRAM_NUM_ENTRIES;
 		airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
 			     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
@@ -698,7 +701,7 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = airoha_ppe2_is_enabled(eth) &&
+		bool ppe2 = airoha_ppe_is_enabled(eth, 1) &&
 			    hash >= PPE1_SRAM_NUM_ENTRIES;
 
 		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
@@ -1292,7 +1295,7 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe,
 	int i, sram_num_entries = PPE_SRAM_NUM_ENTRIES;
 	struct airoha_foe_entry *hwe = ppe->foe;
 
-	if (airoha_ppe2_is_enabled(ppe->eth))
+	if (airoha_ppe_is_enabled(ppe->eth, 1))
 		sram_num_entries = sram_num_entries / 2;
 
 	for (i = 0; i < sram_num_entries; i++)

-- 
2.51.0


