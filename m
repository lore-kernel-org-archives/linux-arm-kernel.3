Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CA0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAu2ieVtzIhvmbt6JTRjoa4pjjACO3xCWLdKRptxTOw=; b=UD/ovqRTYtpG++OQppB5re4/On
	kJyEdWnL5QUzT+X1x6/DO0/b1cK8YB/37GcTXU0DoeA/F6afHDWC1NdYCF8hY5YsXIxmXo5hM96ll
	MSwDO0WT1tCkjev6rERmfGRq5ku0rAJq1LnaqvzBHxGO+clYsMqSRopeJP/WDVovwU8nvCZTbIWiD
	6uP5qpDUKLs2iR/o5Psi1iMziPTxJse2up5ew/LRD4y3+IKQT9AKqu36JJuyCeQsjHuZFSQIEmPU8
	ze5MQbMZ/M/4O4HpuOFdFguVpVWeLmuwnqcrK5KmTzW3Q3kBGni3mVRJ05QS/e+7hpv+AykVfA+kA
	RFORs5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIFm-0000000CMfC-1X1y;
	Tue, 02 Jun 2026 06:05:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIFj-0000000CMen-1qMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:05:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3430B40D61;
	Tue,  2 Jun 2026 06:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D3E1F00893;
	Tue,  2 Jun 2026 06:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780380326;
	bh=cAu2ieVtzIhvmbt6JTRjoa4pjjACO3xCWLdKRptxTOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ejiohwvKFgfnFx2XmQJmWogP6srPvXp1qAFLczY5GJb2HIDlqC3HdYIisxlQOoTDQ
	 9d0+q911Tt8whJu2idWQDouQLkgMw3HeyJvVoxRRyBIgLaKly8hsqH4jEpW+7FZx3s
	 uW8DJTgURj2lZ3d9qzDtsfpCLzCdGNUwL+gJXBSvIFJFhxQx9XD/vL5XTqzERi1f3r
	 PDVdUnUWGoUUukbyfqIke1SklIUshmo3/e0PrLxKpBC+oHEhWRrh8oC5zA+uiWqHfP
	 vDywZwBvCrB+DEAZKH4p7uw+B8oQEoDGQq3nD2heY/9UFLiC0v8sbZ1HIQJgro2CaY
	 kqhJ0j5Dfw4Lg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
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
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
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
	"x86@kernel.org" <x86@kernel.org>,
	Jiri Pirko <jiri@nvidia.com>
Subject: RE: [PATCH v5 05/20] dma-pool: track decrypted atomic pools and
 select them via attrs
In-Reply-To: <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-6-aneesh.kumar@kernel.org>
 <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Tue, 02 Jun 2026 11:35:13 +0530
Message-ID: <yq5afr35sciu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_230527_516886_5485B33A 
X-CRM114-Status: GOOD (  31.33  )
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

Michael Kelley <mhklinux@outlook.com> writes:

> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>Sent: Thursday, May 21, 2026 9:28 PM
>> 
>> Teach the atomic DMA pool code to distinguish between encrypted and
>> unencrypted pools, and make pool allocation select the matching pool based
>> on DMA attributes.
>> 
>> Introduce a dma_gen_pool wrapper that records whether a pool is
>> unencrypted, initialize that state when the atomic pools are created, and
>> use it when expanding and resizing the pools. Update dma_alloc_from_pool()
>> to take attrs and skip pools whose encrypted state does not match
>> DMA_ATTR_CC_SHARED. Update dma_free_from_pool() accordingly.
>> 
>> Also pass DMA_ATTR_CC_SHARED from the swiotlb atomic allocation path so
>> decrypted swiotlb allocations are taken from the correct atomic pool.
>> 
>> Tested-by: Jiri Pirko <jiri@nvidia.com>
>> Reviewed-by: Mostafa Saleh <smostafa@google.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  drivers/iommu/dma-iommu.c   |   2 +-
>>  include/linux/dma-map-ops.h |   2 +-
>>  kernel/dma/direct.c         |  11 ++-
>>  kernel/dma/pool.c           | 167 +++++++++++++++++++++++-------------
>>  kernel/dma/swiotlb.c        |   7 +-
>>  5 files changed, 123 insertions(+), 66 deletions(-)
>>
>
> [snip]
>  
>> +static __init struct dma_gen_pool *__dma_atomic_pool_init(struct dma_gen_pool *dma_pool,
>> +		size_t pool_size, gfp_t gfp)
>>  {
>> -	struct gen_pool *pool;
>>  	int ret;
>> 
>> -	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
>> -	if (!pool)
>> +	dma_pool->pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
>> +	if (!dma_pool->pool)
>>  		return NULL;
>> 
>> -	gen_pool_set_algo(pool, gen_pool_first_fit_order_align, NULL);
>> +	gen_pool_set_algo(dma_pool->pool, gen_pool_first_fit_order_align, NULL);
>> +
>> +	/* if platform is using memory encryption atomic pools are by default decrypted. */
>> +	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>> +		dma_pool->unencrypted = true;
>> +	else
>> +		dma_pool->unencrypted = false;
>
> I'm curious about the name of the "unencrypted" field in struct dma_gen_pool,
> and similarly in Patch 7 of the series for the swiotlb struct io_tlb_pool and
> struct io_tlb_mem. Up through v3 of this series, you used "decrypted", but
> starting in v4 switched to "unencrypted".
>
> To me, the above "if" statement has some cognitive dissonance in that if
> CC_ATTR_MEM_ENCRYPT is false (i.e., a normal VM), "unencrypted" is set
> to false. But I think of memory in a normal VM as "unencrypted" since it
> was never encrypted. A similar "if" statement occurs in your swiotlb changes.
>
> Two related concepts are captured by the field:
> 1) Is some action needed to put the memory into the unencrypted state,
> and to remove it from that state? This applies when assigning memory to the
> pool, or freeing the memory in the pool.
> 2) Is the memory currently in the unencrypted state? This applies when
> allocating memory from the pool to a caller.
>
> It's hard to capture all that in a short field name. But I think I prefer "decrypted"
> over "unencrypted".  The former implies that some action was taken. It's a
> little easier to think of a normal VM as *not* having decrypted memory. The
> memory was never encrypted in the first place, so no decryption action was taken.
>
> Throughout the kernel, "decrypted" occurs much more frequently than
> "unencrypted".  We have set_memory_encrypted() and set_memory_decrypted()
> that are "take action" names.  But we also have force_dma_unencrypted(),
> phys_to_dma_unencrypted(), and dma_addr_unencrypted(). So it's a bit
> of a mess.
>
>
> But maybe there's more background here that led to the change
> between your v3 and v4.
>
> Michael

The current APIs, phys_to_dma_unencrypted() and dma_addr_unencrypted(),
are the reason I changed the pool attribute name from decrypted to
unencrypted. The rationale was that nobody actually decrypted the
memory; the memory was already in an unencrypted state.

In other words, the DMA pool did not contain encrypted content that was
later decrypted. Rather, the DMA pool itself was in an unencrypted
state.

IMHO, set_memory_decrypted()/set_memory_encrypted() is the right naming
because those APIs describe an operation that transitions memory between
states. In contrast, the pool attribute describes the state of the
memory itself, which is why I used unencrypted rather than decrypted.

-aneesh

