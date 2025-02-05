Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCBAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Q/GVEhFPhQiXjlDYd3GYuKf39tJF210X9IoIT7rKs=; b=gb5ZnubXXjvjuMxzb/2isDYhhZ
	8X0BwWFy05I1UzsFQT1/P94UkZ2LEhPqpDYZmcOD+71EgqHrTvCR1nDeBAZ2jAc6aTeA5UdpnZVBj
	7Ei6fpLHPR2fQwMEE7SdPBusXIrlOoh14kgRmbGiOw0GVKuX4CZNJpky3XkWbUdUZwrFQh5pyJ6Xm
	eXnvombpX7vrcfWpuSF557blXLrtVcnh/Nl4XU305fUxzLOsuEbjlIPuFYRZSJwDhI35IiijDxWXJ
	qZy5k+nJAZ3rxJFFqDBgk8FBgC40xpD/xEj9mUJrM60zDCnXzvUuR32i49BMx5WgQL6gp5j7MRS7t
	L9QtO5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjnh-00000004Cgb-2ixF;
	Wed, 05 Feb 2025 18:07:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjks-00000004COc-3Afn;
	Wed, 05 Feb 2025 18:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M8Q/GVEhFPhQiXjlDYd3GYuKf39tJF210X9IoIT7rKs=; b=HS6bvX4dnyhLBOeesPnFPEv40D
	VgYbL0LF37IEUnP5aitj0x+v7ZGVg+j4cEliz2S7A3m9D5UJwya3qraELemhqNvCk6Q+2Q+jrgtEW
	8xpkze2tIUk6wAa52wj2LMDrl+ZPzL7qrA7/1Mokie6nDr8YF9HM9eerbwDwH1LZQcC/GFiVfxBJR
	cwEnGWQ6J0C3JkhyHBczndR4KgRCTouqg8JjeEayQ3mruCjs/Z15kbvgUgo4Fe7b1Z+renGUVbOV1
	ly/p6lSuMDDhiEy5k6UK1lJuzIrPS6vTNiCfBmz344w9di4iQPa9R/9Z1LvixrUBc4vbJdjSAPI/h
	clXKT7jA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjkp-0000000GkIc-20Po;
	Wed, 05 Feb 2025 18:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4451063;
	Wed,  5 Feb 2025 10:04:25 -0800 (PST)
Received: from [10.57.35.21] (unknown [10.57.35.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3023B3F58B;
	Wed,  5 Feb 2025 10:03:56 -0800 (PST)
Message-ID: <78707443-7525-42d4-a538-cb0c67cbeb55@arm.com>
Date: Wed, 5 Feb 2025 18:03:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <18-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <23d4c47e-a00c-4f15-ab42-303bd2aca032@arm.com>
 <20250205161017.GB2960738@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250205161017.GB2960738@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_180403_832258_C402DD0A 
X-CRM114-Status: GOOD (  21.40  )
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

On 2025-02-05 4:10 pm, Jason Gunthorpe wrote:
> On Wed, Feb 05, 2025 at 03:47:03PM +0000, Robin Murphy wrote:
>> On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
>>> Convert most of the places calling get_order() as an argument to the
>>> iommu-pages allocator into order_base_2() or the _sz flavour
>>> instead. These places already have an exact size, there is no particular
>>> reason to use order here.
>>>
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>> [...]
>>> @@ -826,7 +825,7 @@ void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
>>>    				  size_t size)
>>>    {
>>>    	int order = get_order(size);
>>> -	void *buf = iommu_alloc_pages(gfp, order);
>>> +	void *buf = iommu_alloc_pages_lg2(gfp, order + PAGE_SHIFT);
>>
>> This is a size, really - it's right there above.
> 
> I didn't want to make major surgery to this thing, but yes it
> could be:
> 
> void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
> 				  size_t size)
> {
> 	void *buf;
> 
> 	size = PAGE_ALIGN(size);
> 	buf = iommu_alloc_pages_sz(gfp, size);
> 	if (buf &&
> 	    check_feature(FEATURE_SNP) &&
> 	    set_memory_4k((unsigned long)buf, size / PAGE_SIZE )) {
> 		iommu_free_page(buf);
> 		buf = NULL;
> 	}
> 
> 	return buf;
> }
> 
>> (although alloc_cwwb_sem() passing 1 looks highly suspicious - judging by
>> other cmd_sem references that probably should be PAGE_SIZE...)
> 
> Indeed, amd folks?
> 
>>>    	if (buf &&
>>>    	    check_feature(FEATURE_SNP) &&
>> [...]
>>> @@ -1702,8 +1701,10 @@ int dmar_enable_qi(struct intel_iommu *iommu)
>>>    	 * Need two pages to accommodate 256 descriptors of 256 bits each
>>>    	 * if the remapping hardware supports scalable mode translation.
>>>    	 */
>>> -	order = ecap_smts(iommu->ecap) ? 1 : 0;
>>> -	desc = iommu_alloc_pages_node(iommu->node, GFP_ATOMIC, order);
>>> +	desc = iommu_alloc_pages_node_lg2(iommu->node, GFP_ATOMIC,
>>> +					  ecap_smts(iommu->ecap) ?
>>> +						  order_base_2(SZ_8K) :
>>> +						  order_base_2(SZ_4K));
>>
>> These are also clearly sizes.
> 
> I didn't make a size wrapper version of the _node_ variation because
> there are only three callers.
> 
>> I don't see any need to have the log2 stuff at all, I think we just
>> switch iommu_alloc_pages{_node}() to take a size and keep things
>> simple.
> 
> Ok it is easy to remove lg2 calls from the drivers, but I would keep
> the internal function like this because most of the size callers have
> constants and the order_base_2() will become a constexpr when
> inlined. Only a few places are not like that.

But what's the benefit of having extra stuff capable of turning a 
constant into a different constant that doesn't represent anything we 
actually want? We still end up doing more runtime arithmetic on lg2sz 
within the allocation function itself to turn it into the order we 
ultimately still need, so that arithmetic could just as well be 
get_order(size) and have nothing to inline at all (other than NUMA_NO_NODE).

Thanks,
Robin.

