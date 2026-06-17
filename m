Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E3CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erXy90F1aVhSTW8POQ0NgCMddX+dCML396UHDEIaezg=; b=vNPGMLGwkvI7p+iZjdn5wrwutK
	mJ6J5ntUPNQ8jvqWNGBnXjketRXQpRl57rJZ5LAUd+D4koW2zQXuSDzEEfSC4QpSwTfrdZNqsDE82
	TZx6bjbg/dCWbEyhxPaiDxcbe6zfjryGrl4LopcD1MaTGZ7VSxsKtf8Ejpgq5BBgEmdp3GFHdv0Il
	AlWBzR20rNvfPbXNWAlrWm+woMh4zfWg5AFA8R+hBQfRk8mDxyzcNGaShi9RWgRsmKfgQGqMArW3a
	KqRTvpD3ewQksTY4hNgr+QmePiXMcr0Yt5ppGIePI+c1VgRp4LrUyuV6KPFlzFKKCujKenA4I2z4t
	j44Pw2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrXb-0000000HUSN-35es;
	Wed, 17 Jun 2026 14:46:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrXa-0000000HUSH-0T7g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:46:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A98A4408C4;
	Wed, 17 Jun 2026 14:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370791F000E9;
	Wed, 17 Jun 2026 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781707613;
	bh=erXy90F1aVhSTW8POQ0NgCMddX+dCML396UHDEIaezg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=laR53S4ZEFqpK1RU2C/yjKgmXtvMoVq6Ik55ii1gAWmh3rRuIBk1UrsjhJal8Mf7Y
	 nKNxtvFmqU30GaFlFd6gJbCL6OuI9sKlymNooPjqVLA22wKu2cf7YHqk3iUzTcFnOg
	 AonnWRxxacImdlprsatSccr+it2PVoCE2farsGQZ0BWMkTXGQH9HozuVaFKisG7AwT
	 5FkwBoRfJFlzW7mX9CM093Zy2Sxh6cGHKqN/0EWAVZkIvKHcMUePMuRTEjPFcC8cMu
	 msrJ3x9CnBMTnDsAFfGnXCnBCSM+Po6oFWp3nnIuybjDCDIkSmxHIeOL5R+Ez/oZG3
	 ThZCeuyOnZbdQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
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
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>, "Cheloha,
	Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
In-Reply-To: <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
Date: Wed, 17 Jun 2026 15:46:41 +0100
Message-ID: <yq5atsr1dy26.fsf@kernel.org>
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

Alexey Kardashevskiy <aik@amd.com> writes:

> On 4/6/26 18:39, Aneesh Kumar K.V (Arm) wrote:
>> Propagate force_dma_unencrypted() into DMA_ATTR_CC_SHARED in the
>> dma-direct allocation path and use the attribute to drive the related
>> decisions.
>> 
>> This updates dma_direct_alloc(), dma_direct_free(), and
>> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
>> 
>> Tested-by: Jiri Pirko <jiri@nvidia.com>
>> Tested-by: Michael Kelley <mhklinux@outlook.com>
>> Tested-by: Mostafa Saleh <smostafa@google.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   kernel/dma/direct.c | 53 +++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 44 insertions(+), 9 deletions(-)
>> 
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index a741c8a2ee66..90dc5057a0c0 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>>   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>>   {
>>   	bool remap = false, set_uncached = false;
>> -	bool mark_mem_decrypt = true;
>> +	bool mark_mem_decrypt = false;
>>   	struct page *page;
>>   	void *ret;
>>   
>> +	/*
>> +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
>> +	 * attribute. The direct allocator uses it internally after it has
>> +	 * decided that the backing pages must be shared/decrypted, so the
>> +	 * rest of the allocation path can consistently select DMA addresses,
>> +	 * choose compatible pools and restore encryption on free.
>
> Why this limit?
>
> Context: I am looking for a memory pool for a few shared pages (to do
> some guest<->host communication), SWIOTLB seems like the right fit but
> swiotlb_alloc() is not exported and
> dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed. Thanks,
>

swiotlb is not the right pool to use for that, right?
CCA had a similar requirement for ITS pages and ended up creating a genpool:
b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")

-aneesh

