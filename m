Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI0vAlJKhDmiOEB6Q23h3G6CLXMXdX46480mhO3rjOk=; b=wWKbJRXpIHUqoekhi68rp/VVFM
	xiM+rVnATcfKGJB9wGD6ThyzGDFEje8bwsArDF/YVwGuJLEmsjLpZqW1cGNniZHlLrGu2NsjIOqJX
	M22JHc4u1d4Dd6ldEElg7IDIZ271QyAN4OojwTqeFrmoehRqbcBxqhSApH8eUnyiHTrlr8NR2TSpX
	1Uut5Pfjpjjcf+ihRHBKQlJG2yarVcwYbmkyvrE99BZAR93AMmqd0oSQJI7OpbboFpkDwRwPaNDGi
	uymmkUjMGH77HZ4w/Tx/Onmfzlk2lG+J32gR+ye812xzIckKyOPp2sRp0uAy76OcyqbzYTObDLF4i
	hfPHUG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LUB-00000008845-0t3R;
	Wed, 23 Sep 2026 11:50:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LUA-0000000883u-1dsL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:50:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F5940A5F;
	Wed, 23 Sep 2026 11:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D332E1F000FF;
	Wed, 23 Sep 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164201;
	bh=jI0vAlJKhDmiOEB6Q23h3G6CLXMXdX46480mhO3rjOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=j3QZjKt2RDG++7vwN6aJe3RA7jXlLMR25KRKluo6b+e2fpyRs/pTz6vg3MeMVgz3Y
	 H/uFrc3+3pyN38Avf0YeUAxm/S/O+UYkxoG1yg2hevAJ7xtnMPU4ruJWSG/bl4vDRu
	 a2+E5u83/YxSpGaDgPepX4M+KVq5eQWV3LxaqaNvqgJ0xF/Xh37LMhSBpaanlugiGi
	 a6+IqmVFl9eTuZSg2ZqPukR9Tb5u+HfSSew9/Q5ZdNFqsJuWTV56233K9JINsg6JB4
	 SaDj00V23Bhf5UDAvsQeyU1kxlfysMR0sLQ47c99jCokiOgVXxgydYh+6zjRxefc3x
	 m/QmnRG8vSOaA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 06/13] dma-contiguous: Accept an explicit minimum
 alignment
In-Reply-To: <arOrgRfi1k12clT7@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-7-aneesh.kumar@kernel.org>
 <arOrgRfi1k12clT7@arm.com>
Date: Wed, 23 Sep 2026 17:19:52 +0530
Message-ID: <yq5a33v02nmn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 08:18:40PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> @@ -125,7 +126,8 @@ static inline int dma_contiguous_reserve_area(phys_addr_t size,
>>  	return -ENOSYS;
>>  }
>>  static inline struct page *dma_alloc_from_contiguous(struct device *dev,
>> -		size_t count, unsigned int order, bool no_warn)
>> +		size_t count, unsigned int order, unsigned int required_order,
>> +		bool no_warn)
>>  {
>>  	return NULL;
>>  }
>> @@ -136,7 +138,7 @@ static inline bool dma_release_from_contiguous(struct device *dev,
>>  }
>>  /* Use fallback alloc() and free() when CONFIG_DMA_CMA=n */
>>  static inline struct page *dma_alloc_contiguous(struct device *dev, size_t size,
>> -		gfp_t gfp)
>> +		gfp_t gfp, unsigned int align_order)
>
> Can we not just bake the alignment further down in these functions
> rather than getting the callers to pass the {required,align}_order?
>

But, we need this to be conditional on CoCo shared allocations. We could
derive that from attrs and pass attrs instead of align_order, i.e.
something like:


 struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
-		unsigned int align, unsigned int required_align, bool no_warn)
+		unsigned int align, unsigned long attrs, bool no_warn)
 {
-	if (required_align > CONFIG_CMA_ALIGNMENT)
+	if (!dma_contiguous_resolve_alignment(attrs, &align))
 		return NULL;
-	align = min(max(align, required_align), CONFIG_CMA_ALIGNMENT);
 
 	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
 }


with

+static bool dma_contiguous_resolve_alignment(unsigned long attrs,
+					     unsigned int *align)
+{
+	unsigned int required_align = 0;
+
+	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
+		required_align = get_order(cc_shared_granule_size());
+	if (required_align > CONFIG_CMA_ALIGNMENT)
+		return false;
+
+	*align = min(max(*align, required_align), CONFIG_CMA_ALIGNMENT);
+	return true;
+}
+

-aneesh

