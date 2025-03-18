Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9485DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ombszn6O91CSfoMHnX5ooQXEF7lahyLu9yP04jGESI=; b=LrVqsx8mjIapIJ3sdM8CdxffoQ
	BrLS+8JpxDlglm/EuQ8qpgNW2Zj8vo6XKD4ZL1Mc0y0bkI8jicMr1CsjkVONSpkVvq+lcQR4exOeh
	Bv4uHXwTK2jE+Bf0ZIkl6YEeqNNAdTN4ghTOWe7g1t2dbOQ8Towbou7/GCbqxwnYWAyWOQ2KorXTl
	MupNtjtV+Xqw1drHvUaznBd2C+28quuMqg1SrHkGnWLWykkoxw+PEJHMxhbxHby2WbEEkec/YVDTw
	3Ulh5BoGFjX37sHnPof8VaZx88rIsx/pwuKjbIx5edstoAHS4NNgWzn1XcsxFOtarZ4EKIr6G+vlA
	1WCXKBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUfb-00000005caS-1Qt0;
	Tue, 18 Mar 2025 10:59:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUdv-00000005cSs-1Iey;
	Tue, 18 Mar 2025 10:57:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ADA713D5;
	Tue, 18 Mar 2025 03:58:03 -0700 (PDT)
Received: from [10.57.40.187] (unknown [10.57.40.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC01D3F63F;
	Tue, 18 Mar 2025 03:57:48 -0700 (PDT)
Message-ID: <b956d9d0-d169-4deb-9b7e-cbec95363214@arm.com>
Date: Tue, 18 Mar 2025 10:57:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
To: Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
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
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <Z9GFFBvUFg7a9WEg@google.com> <20250317133500.GC9311@nvidia.com>
 <Z9lO-viudk9YGakl@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z9lO-viudk9YGakl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035755_443776_4547967D 
X-CRM114-Status: GOOD (  15.27  )
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

On 2025-03-18 10:46 am, Mostafa Saleh wrote:
> On Mon, Mar 17, 2025 at 10:35:00AM -0300, Jason Gunthorpe wrote:
>> On Wed, Mar 12, 2025 at 12:59:00PM +0000, Mostafa Saleh wrote:
>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>> @@ -263,14 +263,13 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>>>>   				    void *cookie)
>>>>   {
>>>>   	struct device *dev = cfg->iommu_dev;
>>>> -	int order = get_order(size);
>>>>   	dma_addr_t dma;
>>>>   	void *pages;
>>>>   
>>>>   	if (cfg->alloc)
>>>>   		pages = cfg->alloc(cookie, size, gfp);
>>>>   	else
>>>> -		pages = iommu_alloc_pages_node(dev_to_node(dev), gfp, order);
>>>> +		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
>>>
>>> Although, the current implementation of iommu_alloc_pages_node_sz() would round
>>> the size to order, but this is not correct according to the API definition
>>> "The returned allocation is round_up_pow_two(size) big, and is physically aligned
>>> to its size."
>>
>> Yes.. The current implementation is limited to full PAGE_SIZE only,
>> the documentation imagines a future where it is not. Drivers should
>> ideally not assume the PAGE_SIZE limit during this conversion.
>>
>>> I'd say we can align the size or use min with 64 bytes before calling the
>>> function would be enough (or change the API to state that allocations
>>> are rounded to order)
>>
>> OK, like this:
>>
>> 	if (cfg->alloc) {
>> 		pages = cfg->alloc(cookie, size, gfp);
>> 	} else {
>> 		/*
>> 		 * For very small starting-level translation tables the HW
>> 		 * requires a minimum alignment of at least 64 to cover all
>> 		 * cases.
>> 		 */
>> 		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
>> 						  max(size, 64));
>> 	}
> 
> Yes, that looks good.

Although for completeness it really wants to cover both paths, so an 
unconditional "size = max(size, 64);" further up would be even better.

Thanks,
Robin.

