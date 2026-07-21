Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC51C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vlMnn1H9hiO4jT5wquIo2lbFYyrtK27kHf9bWe+2BM=; b=a5GV5CGpgn0OQzikxS/WCOo+Dk
	ZbgvKuVvTAkXRHc75UZdEYCqtXRNudB4qaafBFYONQVxofOdT+LwxdIlKYW/OwlIs2q31sJ2Gv9Ot
	F1q7cwfYqKRHfRIeJ4YP0zZM+Gzof66ENRf53MbOK5A9mIxmLyj8hc9kk3nv0sO+UXvMgZgcQiZdr
	OAmGOdPH/ClHKxEm161ycYQVNZgMuVrQxxN/QE4cBs6bJLyaPu4d8dxxN980WlUagSmuK8UT+pQnb
	oH2pgVAW5wL/jHJ65bzSKlf2K1Sz5elYn90+Qr39SvtsxhN2MDVto8O4HUivcEPrQ503Mr98gg8qr
	q1A/MEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBKc-00000009dsf-2A8e;
	Tue, 21 Jul 2026 14:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBKb-00000009dsJ-3FXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:20:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFF760A59;
	Tue, 21 Jul 2026 14:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992DD1F000E9;
	Tue, 21 Jul 2026 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643624;
	bh=0vlMnn1H9hiO4jT5wquIo2lbFYyrtK27kHf9bWe+2BM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZAXeJTn5Gpmsi+fP/8KnFVJrWtLr1s+gLT8XCY+gJDlj/j3JD5/rYU5iAxSrzp+pd
	 olYQzw9d9qnF622vSrO0xgj0l2V/UWVA/TwCEdteCq9j5ZG5/DBjpuMXcH9FrxHWil
	 v85SMWGDxZbPRG2SeJtJpKBw0NI86LxW0iHL6uBUKgcqneXjADoUesd7rroKVKo3mm
	 SC9mFdCU8LmsaoJ7LEzSPJZXaM2HeNcQ54nqu/ic/L5F5VrXdzNVoDsdMC66+nliHc
	 cM0qXX4fadGnq6/2LCkf6IQ7hjwQ818TGBo7IX/dKg+5Y2YA0GOVfKLHel40zJ33wz
	 APR8zrlv8Umyg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
In-Reply-To: <20260721115456.GI110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
Date: Tue, 21 Jul 2026 19:50:10 +0530
Message-ID: <yq5atsps77c5.fsf@kernel.org>
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

Leon Romanovsky <leon@kernel.org> writes:

> On Fri, Jul 17, 2026 at 11:34:19PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Commit 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool
>> helper") changed dma_direct_alloc_from_pool() to return the CPU address
>> from dma_alloc_from_pool(). That fits dma_direct_alloc(), but
>> dma_direct_alloc_pages() also uses the helper and expects a struct page *.
>> 
>> Fix this by making dma_direct_alloc_from_pool() return the struct page *
>> again, and pass the CPU address back through an out-parameter for the
>> dma_direct_alloc() caller.
>> 
>> Fixes: 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool helper")
>> Cc: stable@vger.kernel.org
>> Tested-by: Michael Kelley <mhklinux@outlook.com>
>> Tested-by: Mostafa Saleh <smostafa@google.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  kernel/dma/direct.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>> 
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index d8219efe3273..363d984d90e7 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -164,22 +164,21 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>>  	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
>>  }
>>  
>> -static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>> -		dma_addr_t *dma_handle, gfp_t gfp)
>> +static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>> +		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp)
>>  {
>>  	struct page *page;
>>  	u64 phys_limit;
>> -	void *ret;
>>  
>>  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
>>  		return NULL;
>>  
>>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
>> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
>> +	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, dma_coherent_ok);
>>  	if (!page)
>>  		return NULL;
>>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>> -	return ret;
>> +	return page;
>>  }
>>  
>>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
>> @@ -247,8 +246,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>>  	 * the atomic pools instead if we aren't allowed block.
>>  	 */
>>  	if ((remap || force_dma_unencrypted(dev)) &&
>> -	    dma_direct_use_pool(dev, gfp))
>> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>> +	    dma_direct_use_pool(dev, gfp)) {
>> +		page = dma_direct_alloc_from_pool(dev, size, dma_handle,
>> +						  &ret, gfp);
>> +		return page ? ret : NULL;
>
> Sorry for joining the discussion late, but the line above caught my
> attention.
>
> Why do we need both ret and page? We can derive cpu_addr from page and
> vice versa. Do we really need the &ret parameter? Or, more generally, do
> we really need "struct page *"?
>
> static struct page *__dma_alloc_from_pool(struct device *dev, size_t size,
> 		struct gen_pool *pool, void **cpu_addr,
> 		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
> {
> ...
> 	*cpu_addr = (void *)addr;
> 	memset(*cpu_addr, 0, size);
> 	return pfn_to_page(__phys_to_pfn(phys));
> }
>
> Why
>

With CONFIG_DMA_DIRECT_REMAP the cpu_addr can be different from
page_address.

-aneesh

