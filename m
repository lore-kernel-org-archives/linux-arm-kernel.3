Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE39C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUhVS/70oe+xVDq7uGuyK6On8HV25TTU2SaXV4Mxt0M=; b=HVAO9Yx13LHuh6mKxPKGXvZ/Dc
	ORQxYuwwkvIX0OX0f3j0XjH8EmKDcJ3aODRnhkuErK+OAcQa+QwzCTxvUuFfCKLntaC+GBdUejF6n
	5i89iyRINSSpUZmw//NbRYBqOT1EcV9qiRBX3/9vXFxz3t0iYZb5RpHcMGPlrlUwubPO7cvqh7Hfa
	Aoy4UYnCofjaIASU9jtHIwyFQkD24CeP60wyuwkuWLHspx7xmy4T6W4K5R5cyTIV5j5JRjqZPqRuu
	evNqMAPrA0tVFe8c1orBJX5ePS2lJdeZpgeLONeIdDv8Z5m5OL2a85vks2QHYlwZLcKMSMpDpx8qH
	9jKjyJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fKs-00000002SBi-2n0X;
	Mon, 21 Sep 2026 14:49:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fKr-00000002SAi-1TtI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:49:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5997600C8;
	Mon, 21 Sep 2026 14:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DCA1F000FF;
	Mon, 21 Sep 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002176;
	bh=NUhVS/70oe+xVDq7uGuyK6On8HV25TTU2SaXV4Mxt0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A1qRWRjl1RV2uS6/gMaLuJ2pewyPR4lUHdxCKfj6tWJ7rGg/GojHBKVpQxQjMXmS7
	 lY/S//7gau/68XfSGzMXBxaEMlB4ozHdEDhscfQu8EZpTtDlYz4eNXG2JKnXNuWtAu
	 BesJL1+xMU8cIT7oCt0WaP8iyHhp83v3hmLLmamhE4RaEwCPOItgvTeld9nqcMfBzd
	 fg42y/fS6NwDQZ9GpZazOkEimF6PsA6coMmQZM1qB6Wvq/kXB7yjuyaV4YKO3pKgR5
	 P/F300kBVcQYxP0VTJLVWehPnUpnJzr/xmVPpj5xMqxWRog4njX/mK/wons75YlO+s
	 PhP5XTRddPZlw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	christian.koenig@amd.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v7 04/13] irqchip/gic-v3-its: Resolve the default NUMA node explicitly
Date: Mon, 21 Sep 2026 20:18:38 +0530
Message-ID: <20260921144847.501151-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921144847.501151-1-aneesh.kumar@kernel.org>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

alloc_pages_node() resolves NUMA_NO_NODE to numa_mem_id() internally. In
preparation for switching ITS allocations to the CoCo shared memory
allocator, resolve the default node explicitly in its_alloc_pages().

The CoCo shared memory allocator interprets NUMA_NO_NODE as a request to
apply the current task's memory policy. Passing numa_mem_id() instead
preserves the existing nearest-memory-node placement across the
allocator switch. This patch does not change the current allocation
behavior.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..ac5507acb1a0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -32,6 +32,7 @@
 #include <linux/set_memory.h>
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
+#include <linux/topology.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v3.h>
@@ -236,7 +237,7 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 
 static struct page *its_alloc_pages(gfp_t gfp, unsigned int order)
 {
-	return its_alloc_pages_node(NUMA_NO_NODE, gfp, order);
+	return its_alloc_pages_node(numa_mem_id(), gfp, order);
 }
 
 static void its_free_pages(void *addr, unsigned int order)
-- 
2.43.0


