Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155FBC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySuGWbXUDGRFaGMKt5Y7z0dskEZPyGt9AbN/dMvXf1U=; b=vFlZ2/lwJf/5uLT2RaQ0O1XF5s
	1iZA7FM1ENZuMYXbVQT891EtdN83itB5JAXIEE7TSIG/vi4jtA6tfwIGxOZXENnIqPsmc/wW3n/FT
	1pCKUzBciet3cEye5tCvJFNgNS6C9GDCkQTTsamKq+qYDx1wGMmBYSOTOJRwsF68x7vXO2dwr31po
	LeeuaQgvKhjCzkfqmrBhIVa2hB5gGAyZgwCHj7p6Wwg4kXoyqKS9sekEVoQAgDeYmNI2G7AgN/d+q
	0TIlmhxypPQ9zc4yW7AXt+NENgD8YrctnXhJ0eaPhkZnk/8lu5kSE5ATe1s/BluC/Mi1U+d6Z/bhr
	N8O2scvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLyw-0000000BMZi-1OPs;
	Mon, 10 Aug 2026 09:07:42 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLyr-0000000BMYg-1R7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:07:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260810090730euoutp02f7b9709c04b553a5c0d5fadac9823431~KZnQV0R580704107041euoutp02R;
	Mon, 10 Aug 2026 09:07:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260810090730euoutp02f7b9709c04b553a5c0d5fadac9823431~KZnQV0R580704107041euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786352851;
	bh=ySuGWbXUDGRFaGMKt5Y7z0dskEZPyGt9AbN/dMvXf1U=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=HPsvRX7C15j1heJymtevQXoi/AnN/UmZgnpt+LPxF3VYvuPtRJ3PYpNdLnmaXR0Ag
	 59kf/XM9EHs3O50nSy+7hCuFxp4Q55Xi5/hdzAIdCWJOo8JxnrbbHOV1ClSd71HV0d
	 r4jlBz+O8JAs/tO9cz+lHcFefZSDAVIP9ORDDg9o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260810090730eucas1p23ceee7c50d9b5f62e163a92c91aa20de~KZnPjUrlt0040900409eucas1p2L;
	Mon, 10 Aug 2026 09:07:30 +0000 (GMT)
Received: from [106.120.50.46] (unknown [106.120.50.46]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260810090727eusmtip10eb84a9d5031d28278c93306c2caa136~KZnNUvdOP2715827158eusmtip1g;
	Mon, 10 Aug 2026 09:07:27 +0000 (GMT)
Message-ID: <8a988f86-e497-4e9b-92db-c9b454467df5@samsung.com>
Date: Mon, 10 Aug 2026 11:07:26 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko
	Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
	Villemoes <linux@rasmusvillemoes.dk>, Russell King <linux@armlinux.org.uk>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew
	Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
	Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
	Hocko <mhocko@suse.com>, Robin Murphy <robin.murphy@arm.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
	Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org, linux-trace-kernel@vger.kernel.org
Content-Language: en-US
In-Reply-To: <anSuYvj1JU5K8xUO@orome>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260810090730eucas1p23ceee7c50d9b5f62e163a92c91aa20de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
X-EPHeader: CA
X-CMS-RootMailID: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
	<CGME20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c@eucas1p1.samsung.com>
	<20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
	<3f47aeab-33b1-4966-a5ce-5d6d5261e0e2@samsung.com>
	<e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
	<83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com> <ak_E4UxfnFJywJa7@orome>
	<1eec88e6-1ea8-4525-bb17-e41444d715dc@samsung.com> <anSuYvj1JU5K8xUO@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_020738_019167_DFB1FBE1 
X-CRM114-Status: GOOD (  34.09  )
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

On 06.08.2026 18:09, Thierry Reding wrote:
> On Thu, Jul 16, 2026 at 12:43:56PM +0200, Marek Szyprowski wrote:
>> On 09.07.2026 17:59, Thierry Reding wrote:
>>> On Thu, Jul 09, 2026 at 07:56:45AM +0200, Marek Szyprowski wrote:
>>>> On 08.07.2026 10:35, David Hildenbrand (Arm) wrote:
>>>>> On 7/7/26 12:02, Marek Szyprowski wrote:
>>>>>> On 01.07.2026 18:08, Thierry Reding wrote:
>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>
>>>>>>> There is no technical reason why there should be a limited number of CMA
>>>>>>> regions, so extract some code into helpers and use them to create extra
>>>>>>> functions (cma_create() and cma_free()) that allow creating and freeing,
>>>>>>> respectively, CMA regions dynamically at runtime.
>>>>>> Well, the technical reason for not creating cma regions dynamically at
>>>>>> runtime is that on some architectures (like 32bit ARM) the early fixup
>>>>>> for the region is needed to make it functional for DMA.
>>>>> Can you point me at the code that does that? Thanks!
>>>> Check dma_contiguous_early_fixup() and dma_contiguous_remap() in 
>>>> arch/arm/mm/dma-mapping.c. Those functions ensures that the CPU mappings for
>>>> the CMA reserved region in linear map are remapped with 4k pages instead
>>>> of the 1M sections, so later, it will be possible to alter the mappings and
>>>> change them to coherent when needed (altering 1M sections is not possible,
>>>> because each process has it's own level-1 array even for the kernel linear
>>>> mapping).
>>>>
>>>>
>>>>
>>>> However, in the use case in this patchset the reserved region is only shared
>>>> with buddy allocator by using the CMA infrastructure, not registered to the
>>>> regular DMA-mapping API, so it would work fine. I'm not convinced that this
>>>> is the right API to use for this though.
>>> Are you saying you're not convinced that CMA is the right API to use for
>>> this? Or something else?
>> I read this again and indeed CMA seems to be right solution. I only wonder
>> why do You want to create the CMA areas dynamically? Imho it would work if
>> You just create large enough CMA area on boot, what would automatically
>> share the memory with buddy allocator and then allocate dynamic VPR regions
>> with cma_alloc(), potentially unmapping or marking the allocated region as
>> reserved in linear kernel mapping to avoid any potential speculative access
>> to the protected memory.
> Hi Marek,
>
> sorry for missing your reply earlier.
>
> The reason why we want to create the CMA areas dynamically is because we
> want to split the secure memory into multiple areas. And the size and
> number of these areas may need to vary, so I didn't want to have to rely
> on rebuilding kernels with different numbers of maximum CMA areas
> depending on the chunk size that we choose.
>
> The reason why we need to split up the protected memory into multiple
> CMA areas is that allocation patterns can create holes within a CMA
> area. For the VPR memory, however, we must ensure that there aren't any
> holes within the protected region because it is specified using a single
> base address and a size. So there is one contiguous region that can be
> marked protected.
>
> If we were to use a single CMA area, we could get holes within an area
> that is marked protected and once the pages are returned to the buddy
> allocator with cma_release(), something else could be attempting to
> access it and cause an error because it is still protected.
>
> The only way to make sure we get a single, resizable and contiguous
> region is by using multiple CMA areas and allocating the entire area
> once our allocations need to expand into that new area. So we're not in
> fact using much of the CMA infrastructure and actually need to duplicate
> some of it. We primarily need it for the page migration and reclaim
> functionality.

This still looks over-engineered. I understand that in case of a single CMA

area using cma_alloc() is not enough for Your use-case, but You already

pointed that You need to have custom method of managing which part of memory

is assigned to secure world, so wouldn't it be much simpler just to add

cma_alloc_exact_range() -like function and keep using a single, boot-time

defined CMA area? Then in instead of creating and deleting CMA areas

dynamically, You just 'allocate' respective ranges from the single CMA area

and manage them on You own (like in current patchset).

>> In both cases You will probably won't need the DMA-mapping API on top of
>> it, although it might be even possible to partially use with by
>> registering custom dma_ops for the devices using the protected region
>> (assuming that it would support only DMA_ATTR_NO_KERNEL_MAPPING
>> allocations).
> Yeah, I don't think we want the DMA API on top at all. The allocator has
> special needs, like clustered allocations to minimize fragmentation and
> keeping as few chunks activated as possible. We also want to avoid
> resize operations because they can be quite heavy depending on system
> load.

That's okay.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


