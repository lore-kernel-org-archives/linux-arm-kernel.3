Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5332AC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jF+mu+wWw/O9fHqXXgiokoR8QYz8JufcfZjOKbIj9YQ=; b=Rd8bpT8jOkiGqZ8RLAUievEtf8
	dPDPgDIsv2HCcFDNo4jU30GxVxx7ix/7biijgZiTRC8k9p9dM0hHQyZI9yMEMs/R6LKKdmDL4GQOl
	S2NZ1yChxoZD9dJslrTqYnuJOj0F95zXIwwX3Bb13sedhLZCagrEKTIRqfw4AI11xT3lCk0uAasqf
	EDiuYADlZJgS7cD9oAvyxh+9AiQj4bQQoiZ7UKNCMZub5wuazZOdLzyb9BYJo4/nhAyuE1BtAc1VO
	6qnbGQ7qdCF+hcUdFr64FZLaSbJQJ85hB8DwoUrDmChWtDZEF8spLzu85WHqbK1ZOFrPOPPoUOxFu
	uRTqjb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgBs-0000000B0MT-1WTn;
	Mon, 05 Jan 2026 08:43:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgBp-0000000B0M5-3b8G;
	Mon, 05 Jan 2026 08:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B3124406B;
	Mon,  5 Jan 2026 08:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E8CC116D0;
	Mon,  5 Jan 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767602629;
	bh=waNyVge8NYPcsyHa3vlJh2SgD9ALMl/hI611CV/VDkE=;
	h=From:Date:Subject:To:Cc:From;
	b=IQIVFs1rpYvr1nF3+vIATUcJMMDPKv1fgAcx5+vn6ZOt1tEkEInaT+C43KDts5ptF
	 Wh9XHOhlH9BCij0ZMd0PXurCD7ZYw8qu0Mtw/VY56pqg/boW7ZjzDCU9wpzuTxiACm
	 J3R7HicmNMfftwoVA1Lpd0e5bQBPsp6gbaeuqHWsan9lkCU1KH1sIF8qTgZRoe1/Ny
	 ZMxBv/vuwuTMJ3kWwKCaZBCs010vTyL2guA8lzkKNJ0kBqR7NKs/5EDbL/v9quVdF9
	 W3r/jhwD5UUbGOOF3kIJr9PBxuqsiQAitYSfvCXXho1SOv7LUksZYu4JbjVTnKJ8UD
	 bDGowLfvo0e3A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 05 Jan 2026 09:43:31 +0100
Subject: [PATCH net v2] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbQ0drUFX3sOwKO1AJxJKpgQ1p
 He3cgDzV+8n//0NEglTglu1gdDKieNUAA8VuGCngRT7woA1Go14UpYlBqv6l6IlLDGOCnVvzl2
 N7tp0UHazUM/v3floCwdOS5TPfrHqX/vPtmpV4juvzaVxpjH3J8lE4zHKAG3O+QutZT55swAAA
 A==
X-Change-ID: 20251223-airoha-fw-ethtool-21f54b02c98b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_004349_927734_D59ADC3F 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

airoha_ppe_deinit() runs airoha_npu_ppe_deinit() in atomic context.
airoha_npu_ppe_deinit routine allocates ppe_data buffer with GFP_KERNEL
flag. Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order
to fix schedule while atomic issue in airoha_npu_ppe_deinit() since we
do not need atomic context there.

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Update commit log.
- Link to v1: https://lore.kernel.org/r/20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0caabb0c3aa06948e46ad087c50eba5babc81994..2221bafaf7c9fed73dcf8d30ff3b1c5eecc463d4 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1547,13 +1547,16 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 {
 	struct airoha_npu *npu;
 
-	rcu_read_lock();
-	npu = rcu_dereference(eth->npu);
+	mutex_lock(&flow_offload_mutex);
+
+	npu = rcu_replace_pointer(eth->npu, NULL,
+				  lockdep_is_held(&flow_offload_mutex));
 	if (npu) {
 		npu->ops.ppe_deinit(npu);
 		airoha_npu_put(npu);
 	}
-	rcu_read_unlock();
+
+	mutex_unlock(&flow_offload_mutex);
 
 	rhashtable_destroy(&eth->ppe->l2_flows);
 	rhashtable_destroy(&eth->flow_table);

---
base-commit: c303e8b86d9dbd6868f5216272973292f7f3b7f1
change-id: 20251223-airoha-fw-ethtool-21f54b02c98b

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


