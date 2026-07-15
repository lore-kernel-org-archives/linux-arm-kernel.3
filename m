Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F39C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjArfSKSb01Cwkat5HUd7BN9p0H3kPu5v5ARrfYmrd8=; b=WPrPMpVJHObsdaktd3JZqTdkVC
	9g4ixV8zB4Dna7xGb75gXhd9zyMrVMfLxG+a5/gSnP03Up+yIC7maCBuQxqhyCrhQo0aUssypfcfr
	mGp5eLzIs58wy/hRLt/Mwv0QtpzZeXDrFvVHd8HDTzlVH9sCUyCG4Uk1Z5xWiem4/LVC+cr5LjpSE
	lfDwE0HgzAndJehjARz91wBoWcIe1TRtzKmEWAjFifgGJP4MK8qkYGWywuxXgJjztFj3oNgaYLd5L
	uv5iZCZwllV/JM4hWDfUEd05dfLGfZdSsOA5bljhhm4WwV1ynD1TbvK+SJPfYwAM4zMCDtWbuVZ+F
	E2pmwLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyVP-0000000Ek3r-1Y4y;
	Wed, 15 Jul 2026 12:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyVM-0000000Ek3C-1lml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DCBC2F;
	Wed, 15 Jul 2026 05:14:17 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29C2F3F7B4;
	Wed, 15 Jul 2026 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784117661; bh=Oo24supxqHGQF/xR33i1jri7lLQABYTzlem84t/Uj/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k9B32DcQJrkF5e4lot+BTUtvQC5lX8mMTfzEwECqdCFlZu8Rdhq4wGKx62YjotCNz
	 CSr6EVSxOhQzpJVOGdeOFGSQTyp5VHbWYK1ZdrL6PZnP8c8sapp2kujSgyyotgXdgN
	 AH33LRK42Nfo4NT0qt9RVcYAoWh7fLTcTyap/j6I=
Message-ID: <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
Date: Wed, 15 Jul 2026 13:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ald3CuddY6I7gml1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051424_909820_A45A4632 
X-CRM114-Status: GOOD (  23.98  )
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

On 15/07/2026 1:03 pm, Will Deacon wrote:
> On Wed, Jul 15, 2026 at 08:39:13AM -0300, Jason Gunthorpe wrote:
>> On Wed, Jul 15, 2026 at 11:25:42AM +0530, Vijayanand Jitta wrote:
>>> On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
>>>> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
>>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>>
>>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>>> When a set of consecutive PTEs map a naturally-aligned contiguous block
>>>>> of memory, the CONT bit can be set on all entries in the group to allow
>>>>> the hardware to combine them into a single TLB entry, improving TLB
>>>>> utilization.
>>>>>
>>>>> The contiguous hint sizes per granule are:
>>>>>
>>>>>    Page Size | CONT PTE |  PMD  | CONT PMD
>>>>>    ----------+----------+-------+---------
>>>>>        4K    |   64K    |   2M  |   32M
>>>>>       16K    |    2M    |  32M  |    1G
>>>>>       64K    |    2M    | 512M  |   16G
>>>>
>>>> My series to convert smmuv3 to the iommupt takes care of this and
>>>> supports all the orders too. I'd rather we move forward with that then
>>>> try to patch up this.
>>>
>>> Thanks for details, I have gone through your series. As this patch
>>> targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
>>> Apple DART, etc.), not just SMMUv3. I think there will still be value in
>>> this patch for the other users.
>>
>> If other users care they should also be converted to iommupt, there
>> are many benefits to this besides just cont support.
> 
> I really have no interest in maintaining two copies of the page-table
> code, so I agree that we should convert users of the architectural (long
> descriptor) page-table format over to iommupt with a view to removing
> the io-pgtable implementation eventually. If you want two parallel
> implementations, then one should really be in rust :)
> 
>  From what I can tell, the fiddly parts for iommupt will be:
> 
>    1. Hardware bugs / quirks. Some of the simpler ones could probably be
>       handled but for the more invasive stuff like the Mali format
>       format, io-pgtable will probably need to hang around. Perhaps
>       it becomes io-pgtable-mali.c?
> 
>    2. The pKVM work from Mostafa. We'll probably end up with something
>       separate at EL2 for this (ideally, just reusing the CPU page-table
>       code when it learns about BBML3).
> 
>    3. Non-coherent walkers, although I think this might actually be fine
>       because x86 needs it anyway?
> 
> So, for now, I wouldn't require new drivers to use iommupt but I'm not
> particularly keen about teaching io-pgtable new architectural tricks
> either.

Conversely though, I really wouldn't want to have to maintain arm-smmu 
supporting two completely different pagetable APIs simultaneously either :/

Thanks,
Robin.

