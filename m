Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9843FCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7v0vfpWbXL2tO4K5nU3J31VniWsuUDENERYOQ4A7IA=; b=wFFjPoDRr5eJUtueoz/RpJWVDP
	04Ii0K5h9Bb5dMj755+8dN6TnUa812MizU0VrfLlTid6h+79ZJFK1kmWZqzT5Bjj1BVlMHM3lwlMd
	x+/AzqAdZgIXu7oOhrF46/8bcT1FnDm7VjUkLRz6KOJrkAhHMsdVnMi3I3Wf94jqCDbX6poKLte3L
	hL7N8lUPZwRdE7ZM1v7STqHZ1Jdv/LftFCAGyMGnUh+b1GK5dTLc/6JgZtAQ6j7mE/29zKKyYSMWc
	qDdZpLcJQh3yHONnVnS+m3gn/SprH3blBNQV91+RSwqqdYshYclDffeUWoPXI2tiERQp4JO912Vmc
	d/cv3Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwST-00000005eOc-0suF;
	Tue, 09 Jun 2026 13:25:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwSH-00000005eLe-0EUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:25:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490a7629453so4898795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781011519; x=1781616319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7v0vfpWbXL2tO4K5nU3J31VniWsuUDENERYOQ4A7IA=;
        b=JBkxrNFxseAyneSmx9c21STFZjVvG5NW/ueL6LDO/T27OczEgBJ8ru2zWAhzxAyOBi
         t3YY5w0RQkWtE1kJjCJ2Wu/XDhKJSXxsNw4q7NE3eFYYsSHxYDXAuWZf5uOReW4PrbyH
         BVAEjruBq+pAyvdtg/yWGuc4SSsNtN00AE+KSjoeeCqRTfY8FWcjGTdeoo4BT0AcqNff
         HVIWGsCR8V2/NgrmqZQ9+6NFmgwGcb37zhLzYAkbAoPhZTEUmh7zBTRWOyzhHz9NqfS+
         A6TFDislputGaD68Q1/2T9gUBokSTPzleXLYCwEw8YTlWiNCnwk+C04Kq2ndmc6C/xlw
         Udog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011519; x=1781616319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7v0vfpWbXL2tO4K5nU3J31VniWsuUDENERYOQ4A7IA=;
        b=HAeYi74mh4dalHVI7jBPjI7rCzEzRUJJkX+fDiWLTCTbR3YE8r0DtHxbdNXRPQ0XOH
         t4sF7MegWdxvHVp1Itf2AT3dc/PV9eIwI+2p+mmc17mK1BgXbIz1HUIHRujqn3Ddy10n
         nmSiLfqsoj99xJjrTRLqiTjDChGn3i5XCoA8W5lDPq4wl5ANcCOnKiY2zRfSIrPyjdoO
         X7O7qrbZrVTDkRb0YF0bFBU3IhRMT2cMKD7x5C4CfMkh6gp4fsCFUP7nP2p+P2+9zNBj
         geKpwz+rndqyGFfTGqNMAsnraheK/71z3EZVGaHJ/ietFxHy4EnRGPcJB/fkcNiZECCK
         uBWg==
X-Forwarded-Encrypted: i=1; AFNElJ/rq0s3RFCLuCOREPjSIMdK60EIm8PvD+8oZkWlpxmKbgyJ7FeCoJqW4vHm/1ebh65GlR+vcduDbUi1JCRkscv1@lists.infradead.org
X-Gm-Message-State: AOJu0YwkuXLKtoGOXyxL8ZuarWI+xh8Yv52xJZCADEuY4NmGq+0k2ZwF
	Rtt/od5pF7NS0MNAqaXNv3PTPh2B7Dj/zc9m4k40klWoU5D9VTvgmBp1774WbwO6CY8=
X-Gm-Gg: Acq92OGCao6AU3RdsRAVXyV0BgK2EscQWDjg4SqVv+Kh6jU8PwehrtcTQEpig0iSKf2
	qm2HjBAoFYOumoJZzKyoSgtXIorb3x165/bxiwGZyLIHqb0HUIDmXf0RuZ/8n5bFsvNfqxC9icY
	YEP+T28zoD6Zw4Ov/wlSwc285Dgd36WykkYVPAPjAxeEc+frO+tKE6fB5pLJCLXn4u2+OiAFoCK
	CXQuN7HwEfTteGohbns6icKjLIkYZ5tzLHNdP4rUgvRSb1WWAVE1tOGeBJSE5qKDDd7Q2GGWQ3o
	1No76msSMkYkh3d1WwEPlH+N/bdTWSon6cQnhpVZKSlirpQa0C8squ5d8lTpP5dPk2U5D/geqIE
	M/4rgNowAQdjleSIus+j30DJNFHLRfBN1C+9HgPcxB02hhabCoKt/oS8PCPCgS/4s6oBvp1spNg
	3q39/yCnME3QltjyB0UgG7sUA=
X-Received: by 2002:a05:600c:1c1e:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-490c25e7e1amr167118665e9.3.1781011519006;
        Tue, 09 Jun 2026 06:25:19 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm574197205e9.9.2026.06.09.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:25:18 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:23:53 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 16/20] dma: swiotlb: free dynamic pools from process
 context
Message-ID: <20260609152353.6a9f60f8@mordecai>
In-Reply-To: <20260604083959.1265923-17-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-17-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_062521_169635_C341FAD7 
X-CRM114-Status: GOOD (  29.96  )
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

On Thu,  4 Jun 2026 14:09:55 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> swiotlb_dyn_free() is used after removing a dynamic swiotlb pool from
> RCU-protected lists. It can call swiotlb_free_tlb(), which may need to
> restore the encryption state of an unencrypted pool with
> set_memory_encrypted() before freeing the pages.
> 
> RCU callbacks run in atomic context, but set_memory_encrypted() is not
> guaranteed to be atomic-safe on all architectures. For example, page
> attribute updates may allocate page tables or take sleeping locks.

Good catch!

> Use queue_rcu_work() for dynamic pool freeing instead. This keeps the RCU
> grace period before freeing a published pool, while running the actual pool
> teardown from workqueue context. Use the same helper for the transient-pool
> error path, since that path may also be reached from atomic DMA mapping
> context.

Strictly speaking, it's not necessary, because this is in the error
path just after allocating a transient pool. There are only two
possible scenarios:

a. The transient buffer was allocated from a sleeping context, and then
   it's also OK to decrypt memory.

b. The transient buffer was allocated in atomic context, but then it was
   allocated from a coherent pool and it is returned to that pool
   rather than decrypted.

However, it's also fine to queue an RCU work. The logic is definitely
cleaner and easier to maintain.

> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  include/linux/swiotlb.h |  4 ++--
>  kernel/dma/swiotlb.c    | 19 +++++++++++--------
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 4dcbf3931be1..526f82e9da45 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -64,7 +64,7 @@ extern void __init swiotlb_update_mem_attributes(void);
>   * @areas:	Array of memory area descriptors.
>   * @slots:	Array of slot descriptors.
>   * @node:	Member of the IO TLB memory pool list.
> - * @rcu:	RCU head for swiotlb_dyn_free().
> + * @dyn_free:	RCU work item used to free the pool from process context.
>   * @transient:  %true if transient memory pool.
>   */
>  struct io_tlb_pool {
> @@ -79,7 +79,7 @@ struct io_tlb_pool {
>  	struct io_tlb_slot *slots;
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>  	struct list_head node;
> -	struct rcu_head rcu;
> +	struct rcu_work dyn_free;
>  	bool transient;
>  	bool unencrypted;
>  #endif
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index f4e8b241a1c4..4c56f64602ea 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -774,13 +774,10 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
>  	add_mem_pool(mem, pool);
>  }
>  
> -/**
> - * swiotlb_dyn_free() - RCU callback to free a memory pool
> - * @rcu:	RCU head in the corresponding struct io_tlb_pool.
> - */
> -static void swiotlb_dyn_free(struct rcu_head *rcu)
> +static void swiotlb_dyn_free_work(struct work_struct *work)
>  {
> -	struct io_tlb_pool *pool = container_of(rcu, struct io_tlb_pool, rcu);
> +	struct io_tlb_pool *pool =
> +		container_of(to_rcu_work(work), struct io_tlb_pool, dyn_free);
>  	size_t slots_size = array_size(sizeof(*pool->slots), pool->nslabs);
>  	size_t tlb_size = pool->end - pool->start;
>  
> @@ -789,6 +786,12 @@ static void swiotlb_dyn_free(struct rcu_head *rcu)
>  	kfree(pool);
>  }
>  
> +static void swiotlb_schedule_dyn_free(struct io_tlb_pool *pool)
> +{
> +	INIT_RCU_WORK(&pool->dyn_free, swiotlb_dyn_free_work);
> +	queue_rcu_work(system_wq, &pool->dyn_free);
> +}
> +
>  /**
>   * __swiotlb_find_pool() - find the IO TLB pool for a physical address
>   * @dev:        Device which has mapped the DMA buffer.
> @@ -835,7 +838,7 @@ static void swiotlb_del_pool(struct device *dev, struct io_tlb_pool *pool)
>  	list_del_rcu(&pool->node);
>  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
>  
> -	call_rcu(&pool->rcu, swiotlb_dyn_free);
> +	swiotlb_schedule_dyn_free(pool);
>  }
>  
>  #endif	/* CONFIG_SWIOTLB_DYNAMIC */
> @@ -1276,7 +1279,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
>  	index = swiotlb_search_pool_area(dev, pool, 0, orig_addr, tbl_dma_addr,
>  					 alloc_size, alloc_align_mask);
>  	if (index < 0) {
> -		swiotlb_dyn_free(&pool->rcu);
> +		swiotlb_schedule_dyn_free(pool);
>  		return -1;
>  	}
>  


