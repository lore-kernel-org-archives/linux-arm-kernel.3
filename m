Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BD3CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aw6E7QKDkQugyEzE9/IaHxV9MvvKTAd70aLpgh49nGg=; b=hRPdW2dxbf8xaqBA5y/Q4OXgsT
	slDVgXwZ7PlyEmeTyHpFo/RiqJ/5A4Isi2bIBkHSqFlVzw3sj9M4yuQtzsJrt1OYLmnR+426qyUIC
	MsI9dSF+O1TggHibytnJ48AknjzEXkLfgQFMUSdertn0gdTOoyZmk93qvQYI5YuwzV9SI82CHhmPe
	KdAQY2F4oBp3RbhNYqom7fljfiQTZkC0GWukD2/CNpa+qDZI0eovgd81oi4PpD/4+4PmNL45c8393
	KmtjKyUuhsd3xRCPSBMNZkHhxDe0N/Y8xnHSs0lqkjidWaXWedbEBPoBX0YZ4Ad5XKaZe1xxllt1J
	QHsnflUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEE-00000004Q6B-0DMl;
	Thu, 16 Oct 2025 10:29:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEA-00000004Pzi-1Vs4;
	Thu, 16 Oct 2025 10:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C01F363EB9;
	Thu, 16 Oct 2025 10:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE57C4CEF1;
	Thu, 16 Oct 2025 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610537;
	bh=hNrhTz9RivBvwoNye3uuIuxIHUqtKrAbVtiIQ+QL17g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A833XUSTIfX/w8ReVQF3dXFLU5+uOsK0vb8gGbPuJh3J/2CFhI20s8AeI+7+9TVKf
	 vELhmz8fP8ADwgFQ3PGjEY5uyePxTB9aerjf0jScAEJjEeidUIXwKci3UyU0A9PScp
	 zAVK/eyTZeJRjBtYkrzgu4JQD9yO9fnC3ebO+U3BD5QQqKHmlXOMwTssBCL/ggCfXJ
	 q07H6XCGAf/DgR25Y0VAhnDcrRXlmDMCBYM6IqVnIys4ysS6QSIYTX8gkyzGGqKx8x
	 fQkHtkrUCYi/EZs5IBak+x3yOMyoMLRAjVuzn8z0nPyvaf9Gy3wHRgkFpy22nDyEFj
	 QTaHqRVckYChw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:21 +0200
Subject: [PATCH net-next v2 07/13] net: airoha: ppe: Remove
 airoha_ppe_is_enabled() where not necessary
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-7-ea6e7e9acbdb@kernel.org>
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
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
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

Now each PPE has always PPE_STATS_NUM_ENTRIES entries so we do not need
to run airoha_ppe_is_enabled routine to check if the hash refers to
PPE1 or PPE2.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index d142660e7910425c14ea2f867f8238156419833b..195d97e61197e5c393f2e79f33f685c334612a83 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -514,10 +514,8 @@ static int airoha_ppe_foe_get_flow_stats_index(struct airoha_ppe *ppe,
 	if (ppe_num_stats_entries < 0)
 		return ppe_num_stats_entries;
 
-	*index = hash;
-	if (airoha_ppe_is_enabled(ppe->eth, 1) &&
-	    hash >= ppe_num_stats_entries)
-		*index = *index - PPE_STATS_NUM_ENTRIES;
+	*index = hash >= ppe_num_stats_entries ? hash - PPE_STATS_NUM_ENTRIES
+					       : hash;
 
 	return 0;
 }
@@ -607,13 +605,11 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 
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
@@ -691,8 +687,7 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 
 	if (hash < sram_num_entries) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = airoha_ppe_is_enabled(eth, 1) &&
-			    hash >= PPE_SRAM_NUM_ENTRIES;
+		bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
 
 		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
 						    hash, ppe2);

-- 
2.51.0


