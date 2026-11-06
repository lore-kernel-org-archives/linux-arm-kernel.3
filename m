Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E6B606D813
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMqwliy1;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XIW4+VP5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b32C5Yk9u4T7M0pDjYb1nHa0EfPn+C/TBJuye6XXKRU=; b=hMqwliy1mwSKf3
	4+VUhOG7EynAwrDkD1Tn0KR3stWlO/AcVCLXwm5FmoCZ0p+OzYzmiORtipsvWbG/7DM5TBtlo1ueu
	QjNC01zbBFmdIaMyTAzOl/RB78e8FeRmumKLgfvR4RUZCG/BRGj5UWox+VTFfxSNUOw0F+UH56klD
	SJbFfT/7gIQQua5OoE5uVgbdVAuEkLcuKjDvf7f0tLZUaZ4yLTd8P9QBDGhmfddpmJnedbOclvv+U
	v+oyyBvnyMfA0V99oLjuFjr0bo0mekgM3FEraukscwpofL+bs41hSv562sl/LpUXYIdZ5/RPWf5DY
	R+jP0SjY98Q4mzkHcqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeR-0000000CFMe-3s5G;
	Fri, 06 Nov 2026 12:02:35 +0000
Received: from out-7.mta0.migadu.com ([2001:41d0:1004:224b::7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeQ-0000000CFLN-1GXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:02:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=q3JqZ19Rhc6bQOGntufhM8h8GdVro+mBU1Hah1TvlB4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966552; v=1; x=1794571352;
 b=XIW4+VP5VgX2Y4/JM5ow8B05ruRJMttgx7KgFpzCoF+yEJUG3wxEpRAolZbw9cbTcV8l0Bl9
 HKRH/tDQeSiOA2Y1WDTB4jCHrl0E6Dr8OWisb/GWEcgYhfuCJunYczH/ScytjjxCPg9OeHzLgf9
 8ARBFuoz/+nHasXcZA/WQs3k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a5ec145303592f44;
	Fri, 06 Nov 2026 12:02:32 +0000
X-Mizu-Trace-ID: a5ec145303592f44
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	lpieralisi@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	tabba@google.com,
	stable@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v3-its: Zero ITS pages before sharing them with the host
Date: Fri,  6 Nov 2026 12:02:19 +0000
Message-ID: <20261106120221.347309-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040234_489410_E1B18606 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In a pKVM protected guest, the ITS driver shares every page it
allocates for the GIC with the host, through set_memory_decrypted() in
its_alloc_pages_node(). its_allocate_prop_table() is the only caller
that doesn't pass __GFP_ZERO. It fills the table after the call
returns, so until then the host can read the page's previous contents,
at least 64KiB of guest memory.

Zero every page in its_alloc_pages_node() before it is shared. Every
caller except the property table already passes __GFP_ZERO.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084f..de1f1b1f26623 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -218,7 +218,8 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	struct page *page;
 	int ret = 0;
 
-	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
+	/* Zeroed, as set_memory_decrypted() may share the page with the host */
+	page = alloc_pages_node(node, gfp | gfp_flags_quirk | __GFP_ZERO, order);
 
 	if (!page)
 		return NULL;
-- 
2.47.3


