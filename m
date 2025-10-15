Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E67CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyYTqepWLB6XN0xbSbD9Z7qprjsTpRu3nqNz5ZnCjqw=; b=DStHRu5wMF/31xD2tVFDs9uWTB
	3gs/rLiJUNBe0syeYpx7azPMzk+Z7bXCp1rgkDG0uVSJ5s/Nbvol6Pmb/QysvcFv3R3ZF8r2qjKYX
	hM/NTwE6oYu2n7wFqdKEpHhiVWt+1hBK5U7iLkYUdl+sKtL7uV0VodWPUISx13yPLSFZ/XgAvOadf
	jWLnoyAjrwdyRF49UiBmgPeICDu481JaisXAD6vlmWAAmJ+XD+Fq0j3ty69iXG7evyT2/ZWTFfn+R
	VojJjKJa3rrDt4F5yDH8PLhZGRhAMdIFpaFg5dSMi8bZRy1y5oTO9z6ugyHKPFv6vSgeX+3GEUBhE
	GXwHfyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjm-00000000gd6-0T7t;
	Wed, 15 Oct 2025 07:15:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjh-00000000gY8-2KCn;
	Wed, 15 Oct 2025 07:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39C1543FC8;
	Wed, 15 Oct 2025 07:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEF6C4CEF9;
	Wed, 15 Oct 2025 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512549;
	bh=WJfb0EP9qEookRxx7hXA0My7CBCZS2s/0Tfq8DFvpGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IQIsMsseT2GRuVXitukAre5ZCdA4K8EJ33No68YQaV21Qo/Jl26ofArvfCnL/aQ4D
	 Ekdx7vIhnQLJDJb57ONj63xm9FJtnVAIDiFhrX5/vNdRxAfAC9Ejuw8BDNJVtlrQ41
	 u4i2MZM1T7pEW/JhSGL4ZvrgPw30E5DgsedRUUij/yUoIFU8TG+DoMvGuwOUce3ADz
	 llqfkI4XME9LckRAxQHH8htyelbSGUdJvNBx4sxtgfpc25v7IdW0vEidptGsFOYIqQ
	 vIdboyJuA9Oigz+hGpg9gdWNDjKvZno6ldBoCWl8gr77dggBdVfrMbMSGMUSg3KrvU
	 h4U5BSroY51XA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:07 +0200
Subject: [PATCH net-next 07/12] net: airoha: ppe: Remove
 airoha_ppe_is_enabled() where not necessary
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-7-064855f05923@kernel.org>
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
X-CRM114-CacheID: sfid-20251015_001549_635974_F4BF5615 
X-CRM114-Status: GOOD (  10.70  )
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

Now each PPE has always PPE_STATS_NUM_ENTRIES entries so we do not need
to run airoha_ppe_is_enabled routine to check if the hash refers to
PPE1 or PPE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 58306cf91daf9faeb4f1cc0092579654dde3cfb0..fcfd2d8826a9c2f8f94f1962c2b2a69f67f7f598 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -520,10 +520,8 @@ static int airoha_ppe_foe_get_flow_stats_index(struct airoha_ppe *ppe,
 	if (err)
 		return err;
 
-	*index = hash;
-	if (airoha_ppe_is_enabled(ppe->eth, 1) &&
-	    hash >= ppe_num_stats_entries)
-		*index = *index - PPE_STATS_NUM_ENTRIES;
+	*index = hash >= ppe_num_stats_entries ? hash - PPE_STATS_NUM_ENTRIES
+					       : hash;
 
 	return 0;
 }
@@ -613,13 +611,11 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 
 	if (hash < sram_num_entries) {
 		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
+		bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
 		struct airoha_eth *eth = ppe->eth;
-		bool ppe2;
 		u32 val;
 		int i;
 
-		ppe2 = airoha_ppe_is_enabled(ppe->eth, 1) &&
-		       hash >= PPE_SRAM_NUM_ENTRIES;
 		airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
 			     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
 			     PPE_SRAM_CTRL_REQ_MASK);
@@ -697,8 +693,7 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 
 	if (hash < sram_num_entries) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = airoha_ppe_is_enabled(eth, 1) &&
-			    hash >= PPE_SRAM_NUM_ENTRIES;
+		bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
 
 		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
 						    hash, ppe2);

-- 
2.51.0


