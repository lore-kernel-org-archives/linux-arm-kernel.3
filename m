Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF2C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGn1u13n7gGWDYh2/LnTrYKqEJQByPE5Vl6leD7+wx0=; b=K7OQ44WJhyp/WHZwbzQP05fvUT
	exHIqd+hvnXRYzsLu6mPANI3+FMJ0ZJh4RWQbkTmQwyKm0FTE6qHHdrhOXOx/5Lw42dZGQkbektPE
	b8pNmlypc2WuzaEf5saOdMqBkv5QSruBRDiHHti1K1K7gvBMcbTYlrhC4icUXsdlS3GAh9W8VFkv5
	zc9cPSNYoPmZsZBG7it+fT95GhgVw5OjeW0brhMsHwOvrVGXxFWMkzKxc+I9gPex9qwBS2OoFNjMe
	wxqovk6zKdDqbLL+z/AHOvJGqv6n4GoosONqB5VJcBzqqvoGe8qZgWtVorQ/AK4wPsP3fEHsKzREk
	XsVOltAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq85-00000002kel-18vZ;
	Fri, 16 May 2025 08:09:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpzl-00000002jWv-2KwQ;
	Fri, 16 May 2025 08:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C22EBA4E5B6;
	Fri, 16 May 2025 08:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A111C4CEE4;
	Fri, 16 May 2025 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747382440;
	bh=9MI7SAT2s//V30kRWI98bF2/4dui8LFg708YvOASUg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aaN/JQIl3NYET13p1kb9UjadklcbTuU88wEh36k0a1NcJqEiXcr1EZrVYOjBBmPtA
	 Ytbp6UhjqTGbYRW2xPrW3q6pwwqSsjQVJ/66x++lwz9xE1l8IU+mTAWkE456CCHqd2
	 Ys5K6YGrA8sVXbJmOK7k2ruMhKcUX+4R5RwMi+jXKYnVn02DWg66qHJvsEsy3NQdOS
	 cRddLmyGt5Orbrxe8kfn+Iiv+gpzr1bjtn/rlXwRiJw79DINxvpblg07zraM3SJVK3
	 pssC0DrxyFwYrIFkwfrhSYH4aD3Du/zQDqhFkT4dtp9clWqNWfIge2psNkZ3MRIceZ
	 c84l1ioOKCCeA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 16 May 2025 10:00:01 +0200
Subject: [PATCH net-next v2 3/3] net: airoha: ppe: Disable packet keepalive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-airoha-en7581-flowstats-v2-3-06d5fbf28984@kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_010041_667537_36088236 
X-CRM114-Status: UNSURE (   8.52  )
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

Since netfilter flowtable entries are now refreshed by flow-stats
polling, we can disable hw packet keepalive used to periodically send
packets belonging to offloaded flows to the kernel in order to refresh
flowtable entries.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 70598ba9f5ad1d30c1e408d3d97c6fa4cb0f4f4d..2d273937f19cf304ab4b821241fdc3ea93604f0e 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -84,6 +84,7 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 
 		airoha_fe_rmw(eth, REG_PPE_TB_CFG(i),
 			      PPE_TB_CFG_SEARCH_MISS_MASK |
+			      PPE_TB_CFG_KEEPALIVE_MASK |
 			      PPE_TB_ENTRY_SIZE_MASK,
 			      FIELD_PREP(PPE_TB_CFG_SEARCH_MISS_MASK, 3) |
 			      FIELD_PREP(PPE_TB_ENTRY_SIZE_MASK, 0));

-- 
2.49.0


