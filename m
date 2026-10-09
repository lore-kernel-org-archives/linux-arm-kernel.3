Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA9CCA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW384t0h2Ph2SSnHhXZ7QohAhZBqm6VgljxUEN4wbHg=; b=SdLC/vilmemPrU37fb+XCtusMa
	4+fyHB/ThEq1ujuVMLJ5vfn7VZI1v1YOUFGIJpPaSP86i5JbPgzd83QIIG+JQi1Mi+fbFB2iowUp0
	CBElsVqCrG2uzDtED1dkNjFUwDm7daBPPtGW2HPSPn5Mw5dJGtGNaZi99TM++HHG3C4N/1AkwnSjI
	h82RhV0uD8TRZfHI9HVvZYMQnZ7romLWi6uwj3xshjOnWnyvgUGgvwrs0q25sMdC1bbGkbJ7H3276
	nRKnA7JNV/4Ocq+NMFjaglEhz2LkbrQvgT2FkFNdS/LHcx0qsx1O2N9dO0iqf1KMEbcn5iq7XKvz0
	eouR4hPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCez-00000006Y03-0Jin;
	Fri, 09 Oct 2026 15:37:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCew-00000006Xz3-0uHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:37:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CE781476;
	Fri,  9 Oct 2026 08:37:16 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2383F763;
	Fri,  9 Oct 2026 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791560239; bh=4TGnf+qefgabk6iF56KMINVP9Q/BF98PVmUp+DBTV3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sChMW5DBFwMbrPOQZkTOJPaHM48w5+K+UZ8VdfXK6IkcLrLJtFoD2dYMhW2rxT0rA
	 3vMKTV4yI4GFvRQxB0Se5tUyOkJgNWjrPcFVI5aIOxUeUbzRc5xnLrh2H5ZBH25WGa
	 o6Q8WoExOZPOO14JHHOokMnr8Js3yNMG4xIYZMJ8=
Message-ID: <52ba8a64-2d3d-4c3f-ae8f-54ab4f0f164d@arm.com>
Date: Fri, 9 Oct 2026 16:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
 <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_083722_430893_4FD87444 
X-CRM114-Status: GOOD (  18.31  )
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

On 09/10/2026 11:09 am, Vijayanand Jitta wrote:
> 
> 
> On 9/25/2026 4:23 AM, Jason Gunthorpe wrote:
>> On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
>>> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>>
>>>> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
>>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>>
>>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>>> When a set of consecutive PTEs map a naturally aligned contiguous block of
>>>>> memory, set CONT on every descriptor in that group so the hardware can
>>>>> combine translations and improve TLB reach.
>>>>>
>>>>> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
>>>>> those sizes through the normal page-size selection path; io-pgtable-arm
>>>>> then installs the corresponding tagged descriptors directly. A partial
>>>>> unmap of a tagged CONT group is rejected before modifying any descriptor,
>>>>> so a rejected request cannot leave the group partly unmapped.
>>>>>
>>>>> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
>>>>> CONT support for hardware with implementation-specific errata.
>>>>
>>>> smmuv3 has this errata, it must be disabled there too. I didn't notice
>>>> it in this patch?
>>>
>>> SMMU is an architecture specification. I am not aware of errors in
>>> this architecture specification that would preclude the usage of the
>>> contiguous bit. I understand that Arm MMU-700 has the following
>>> erratum
>>>
>>> 3777127 Under invalidation in TBU possible when using contiguous page
>>> table entries
>>
>> And a neoverse one too.
>>
>>> The recommended workaround is described as
>>>
>>> "Ensure that contiguous page tables are removed using a single range
>>> invalidation. Arm recommends using range invalidations to remove
>>> contiguous entries anyway for performance reasons."
>>>
>>> and I believe we are already doing this.
>>
>> No we aren't. Go read my fix on this:
>>
>> https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/
>>
>> I have another patch that fixes it for iommu domain mappings too.
>>
>> Jason
> 
> Sure , will disable it for smmuv3 for now.

I still can't see how that would be necessary. Sure SVA has to cope with 
invalidating any old arbitarily-sized range that could have been a mix 
of pages, blocks, cont, whatever - that's fair enough. But for 
io-pgtable through the IOMMU API, a partial unmap of anyhthing which 
could have been mapped as a cont range would already be invalid and 
should fail. Thus for any unmap which could validly include any cont 
ranges, iommu_pgsize() would have already picked a granularity that is 
some multiple of the largest cont range size being unmapped, so even if 
the total gathered size exceeds a single command, we still wouldn't 
split it _within_ any single one of those ranges, only at a boundary 
between two unrelated ones.

Thanks,
Robin.

