Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FB3CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcNtKZ7NzGyGnvHfvO5odIyoW6PN2H5H+yyM6hHv3r4=; b=NVC+dS+SSplDvv/wx7Cv+klbIg
	1NpXTq4Zcl807tpymk5LXscWufLcUdyBeqzd3a8xp3x28Mr68k2iU8NtcrFMNkw/RlUAwuWaUffIC
	YpsjzjQuyebQvvewMfsRUtfKS8hTn1XUP+Fo+6d/ecPlHAUe5etv7knn+HT5yG1NLhcvLcVAkT2Xz
	KBUGOJbqDG70C+vkmnK25tnPWtmofPGfBTj18b9+36m8lklsE3dO7nm5eNDbcNeYZTZtc6y4WNSgT
	NL0rDEHVg7HMf0pIJXr85qQsKJAQagp1ffEYgAYDLfQBLSRduf23WzAOlOZxpJbNumgZXGnifxnTr
	Vn/XhgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEL-00000004QFN-1GbN;
	Thu, 16 Oct 2025 10:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEC-00000004Q2F-1WPW;
	Thu, 16 Oct 2025 10:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09E404053E;
	Thu, 16 Oct 2025 10:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D33BC113D0;
	Thu, 16 Oct 2025 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610539;
	bh=nEifpoyi2uHHtXE2HCxJFum2zuqlAdUcNjUSB5XTpZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gGjDf2GvRztXochV/PNVJP0BVS8A9Irq8cdj6W5aaSXAFJjBqF37wJPhZlKg5lxwI
	 zGKjMJJHxRhMBuilDWy7bj/BGXGx2hbPrOaeZaubAh1v7zUC69UMdgWPfMSKuOXq7M
	 1acL5lWx2nVTUn1AwPtJszGcERj9OFszImPuhL7a5z+VY0zRIy8pYlEQsOmp91NobH
	 dSYSwx78QZ6kBifx1ntYFskfadpLkZAxT99QBExCXFhs6Rpl6AXOi///Q+KH5AetPU
	 ZtorNjJ5FJ7ak84kGfRkSJi+h1WUT7qSdhBDaV0YiyXi5MgBwTHDqjLkWte+ySXnML
	 jr7g3OXmzD2ZQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:22 +0200
Subject: [PATCH net-next v2 08/13] net: airoha: ppe: Configure SRAM PPE
 entries via the cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-8-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
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
X-CRM114-CacheID: sfid-20251016_032900_491093_1D351FC3 
X-CRM114-Status: GOOD (  11.94  )
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

Introduce airoha_ppe_foe_commit_sram_entry routine in order to configure
the SRAM PPE entries directly via the CPU instead of using the NPU APIs.
This is a preliminary patch to enable netfilter flowtable hw offload for
AN7583 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 195d97e61197e5c393f2e79f33f685c334612a83..46755bc60a8e822b296e188c061c45eae0b88cb5 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -656,6 +656,27 @@ static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
 	return !memcmp(&e->data.d, &hwe->d, len - sizeof(hwe->ib1));
 }
 
+static int airoha_ppe_foe_commit_sram_entry(struct airoha_ppe *ppe, u32 hash)
+{
+	struct airoha_foe_entry *hwe = ppe->foe + hash * sizeof(*hwe);
+	bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
+	u32 *ptr = (u32 *)hwe, val;
+	int i;
+
+	for (i = 0; i < sizeof(*hwe) / sizeof(*ptr); i++)
+		airoha_fe_wr(ppe->eth, REG_PPE_RAM_ENTRY(ppe2, i), ptr[i]);
+
+	wmb();
+	airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
+		     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
+		     PPE_SRAM_CTRL_WR_MASK | PPE_SRAM_CTRL_REQ_MASK);
+
+	return read_poll_timeout_atomic(airoha_fe_rr, val,
+					val & PPE_SRAM_CTRL_ACK_MASK,
+					10, 100, false, ppe->eth,
+					REG_PPE_RAM_CTRL(ppe2));
+}
+
 static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 				       struct airoha_foe_entry *e,
 				       u32 hash, bool rx_wlan)
@@ -685,13 +706,8 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 	if (!rx_wlan)
 		airoha_ppe_foe_flow_stats_update(ppe, npu, hwe, hash);
 
-	if (hash < sram_num_entries) {
-		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
-
-		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
-						    hash, ppe2);
-	}
+	if (hash < sram_num_entries)
+		err = airoha_ppe_foe_commit_sram_entry(ppe, hash);
 unlock:
 	rcu_read_unlock();
 

-- 
2.51.0


