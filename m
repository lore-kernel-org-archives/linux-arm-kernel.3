Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAD8CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 04:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcmTXB2lgA7G/MmVc6Lgh462v2J6ii5qK8aSjHsJld8=; b=fShOP3+Y/hiBbYv2DiDl7hQ195
	gRVsIRSJSLmh6CqEg1RETYyHoW7zEWk/0ZuiLPFlVF7EYIayaXCt+ZJO4JH1ZPJOS61t5vf1LwGwa
	BHLRB8dPoMEkqm9MgPQqZc6qO6Mf8m1Zn2GuUvX2CbmIrl7bEXnm+P9LWDERPfNntnHtcl05BOT1i
	MlxGNyCV4HIpRr4s0JLXfZkokodp7wHAZ/e6Eu6hkaNvqOM/ehSV1Isxf3si69utEWxXlMAq8OAIB
	MC/Avnfi/dVzpHvVOylSJhq3zVJk7QHiNAWg4Pq8Dw89pX/ftqX6+p0rUhG4YRBVMfIV3pmSc1/jX
	PgAlDYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHY8-00000009kuO-3KpP;
	Fri, 22 May 2026 04:31:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHY6-00000009kt8-0GMt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 04:31:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA30243272;
	Fri, 22 May 2026 04:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490C41F000E9;
	Fri, 22 May 2026 04:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779424309;
	bh=dcmTXB2lgA7G/MmVc6Lgh462v2J6ii5qK8aSjHsJld8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j/xCchvPe4MfoXPQoR0SqW+SV/OSZQxiq1dm+OogpuMy4jIINMhXlPkIKXBsWNG4c
	 chVAiBxy6kb/TGkLAS9BamKfkaYocokS55O+vAgutoYZIqTQcH4oXDc8Jwgmdtjma3
	 N1npDpLRGqks29WjG463px4akkaCHmNVVYHX+BHd3d9NsapQWMTAamL8ojxeT6jVWH
	 m9y7yi/fPo6zoTg5kevEsUm+EVB6qCusnExZ6C+3mcLrAXFbYDNtuThai//rRZLtiK
	 Ohv8iSA61InNcTuKe4hQ6rhYHHCEnX2We4GjLcNMOFfdLGd1+7zAwTnAZOW49XJhsy
	 zu/mI96MORqvA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v5 17/20] dma: swiotlb: free dynamic pools from process context
Date: Fri, 22 May 2026 09:58:12 +0530
Message-ID: <20260522042815.370873-18-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522042815.370873-1-aneesh.kumar@kernel.org>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_213150_146451_4100E942 
X-CRM114-Status: GOOD (  17.92  )
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

swiotlb_dyn_free() is used after removing a dynamic swiotlb pool from
RCU-protected lists. It can call swiotlb_free_tlb(), which may need to
restore the encryption state of an unencrypted pool with
set_memory_encrypted() before freeing the pages.

RCU callbacks run in atomic context, but set_memory_encrypted() is not
guaranteed to be atomic-safe on all architectures. For example, page
attribute updates may allocate page tables or take sleeping locks.

Use queue_rcu_work() for dynamic pool freeing instead. This keeps the RCU
grace period before freeing a published pool, while running the actual pool
teardown from workqueue context. Use the same helper for the transient-pool
error path, since that path may also be reached from atomic DMA mapping
context.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 include/linux/swiotlb.h |  4 ++--
 kernel/dma/swiotlb.c    | 19 +++++++++++--------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 4dcbf3931be1..526f82e9da45 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -64,7 +64,7 @@ extern void __init swiotlb_update_mem_attributes(void);
  * @areas:	Array of memory area descriptors.
  * @slots:	Array of slot descriptors.
  * @node:	Member of the IO TLB memory pool list.
- * @rcu:	RCU head for swiotlb_dyn_free().
+ * @dyn_free:	RCU work item used to free the pool from process context.
  * @transient:  %true if transient memory pool.
  */
 struct io_tlb_pool {
@@ -79,7 +79,7 @@ struct io_tlb_pool {
 	struct io_tlb_slot *slots;
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	struct list_head node;
-	struct rcu_head rcu;
+	struct rcu_work dyn_free;
 	bool transient;
 	bool unencrypted;
 #endif
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f4e8b241a1c4..4c56f64602ea 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -774,13 +774,10 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
 	add_mem_pool(mem, pool);
 }
 
-/**
- * swiotlb_dyn_free() - RCU callback to free a memory pool
- * @rcu:	RCU head in the corresponding struct io_tlb_pool.
- */
-static void swiotlb_dyn_free(struct rcu_head *rcu)
+static void swiotlb_dyn_free_work(struct work_struct *work)
 {
-	struct io_tlb_pool *pool = container_of(rcu, struct io_tlb_pool, rcu);
+	struct io_tlb_pool *pool =
+		container_of(to_rcu_work(work), struct io_tlb_pool, dyn_free);
 	size_t slots_size = array_size(sizeof(*pool->slots), pool->nslabs);
 	size_t tlb_size = pool->end - pool->start;
 
@@ -789,6 +786,12 @@ static void swiotlb_dyn_free(struct rcu_head *rcu)
 	kfree(pool);
 }
 
+static void swiotlb_schedule_dyn_free(struct io_tlb_pool *pool)
+{
+	INIT_RCU_WORK(&pool->dyn_free, swiotlb_dyn_free_work);
+	queue_rcu_work(system_wq, &pool->dyn_free);
+}
+
 /**
  * __swiotlb_find_pool() - find the IO TLB pool for a physical address
  * @dev:        Device which has mapped the DMA buffer.
@@ -835,7 +838,7 @@ static void swiotlb_del_pool(struct device *dev, struct io_tlb_pool *pool)
 	list_del_rcu(&pool->node);
 	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
 
-	call_rcu(&pool->rcu, swiotlb_dyn_free);
+	swiotlb_schedule_dyn_free(pool);
 }
 
 #endif	/* CONFIG_SWIOTLB_DYNAMIC */
@@ -1276,7 +1279,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	index = swiotlb_search_pool_area(dev, pool, 0, orig_addr, tbl_dma_addr,
 					 alloc_size, alloc_align_mask);
 	if (index < 0) {
-		swiotlb_dyn_free(&pool->rcu);
+		swiotlb_schedule_dyn_free(pool);
 		return -1;
 	}
 
-- 
2.43.0


