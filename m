Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B83C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2mcflxfBxIV/B48VQj7W/0lUBgUkzS4skiTvHWnqOo=; b=hkVcIgCyAsui3wxROxTr0TgSHB
	jInpNX9r3JYWlqNw81On+RzgI/+4HQPfM4zlKq4WcJ99VWdfJb2w044tNT+PCDDmgV/23MhmEN2C+
	/yPINEW2FiJqhij13fbWaHADQ7FvnSTO93ZYVkEmf4oqcb7a7Kt0TnlG/TabmdMdO1AYolwHrGrS4
	/0gALjjRRN+IwenGa8qXzayCVHgM6juP/Z6+bNWNtPQ4wze/4PzCKXKucOcyLx+nBmPdqJqBux95i
	Hw51TmJuhVPOrmHAf7QAQHyVeiZM5UN1w/GbOaqpR7ZDdN+TFt3ikOyVbCkKtwAhiQY0j84ft/ste
	yuW8H1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWBs-00000009n5S-0yDn;
	Wed, 25 Jun 2025 19:53:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPqc-00000008jog-31lr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:07:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE26106F;
	Wed, 25 Jun 2025 06:07:11 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1B03F58B;
	Wed, 25 Jun 2025 06:07:25 -0700 (PDT)
Message-ID: <636c8901-6e05-479f-ae06-ee391d4d36e8@arm.com>
Date: Wed, 25 Jun 2025 14:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: yang@os.amperecomputing.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
 broonie@kernel.org, ardb@kernel.org, baohua@kernel.org,
 suzuki.poulose@arm.com, david@redhat.com, jgg@ziepe.ca, nicolinc@nvidia.com,
 jsnitsel@redhat.com, mshavit@google.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com> <aFRlDSZ2PPnHixjc@arm.com>
 <7105112f-b0bb-4191-b3c9-93522162319c@arm.com>
In-Reply-To: <7105112f-b0bb-4191-b3c9-93522162319c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060730_834161_E8138A16 
X-CRM114-Status: GOOD (  19.29  )
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

On 20/06/2025 17:10, Ryan Roberts wrote:
> On 19/06/2025 20:29, Catalin Marinas wrote:
>> On Tue, Jun 17, 2025 at 09:51:04AM +0000, Mikołaj Lenczewski wrote:
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index bcac4f55f9c1..203357061d0a 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -68,7 +68,144 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>>>  			pte = pte_mkyoung(pte);
>>>  	}
>>>  
>>> -	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>> +	/*
>>> +	 * On eliding the __tlb_flush_range() under BBML2+noabort:
>>> +	 *
>>> +	 * NOTE: Instead of using N=16 as the contiguous block length, we use
>>> +	 *       N=4 for clarity.
>>> +	 *
>>> +	 * NOTE: 'n' and 'c' are used to denote the "contiguous bit" being
>>> +	 *       unset and set, respectively.
>>> +	 *
>>> +	 * We worry about two cases where contiguous bit is used:
>>> +	 *  - When folding N smaller non-contiguous ptes as 1 contiguous block.
>>> +	 *  - When unfolding a contiguous block into N smaller non-contiguous ptes.
>>> +	 *
>>> +	 * Currently, the BBML0 folding case looks as follows:
>>> +	 *
>>> +	 *  0) Initial page-table layout:
>>> +	 *
>>> +	 *   +----+----+----+----+
>>> +	 *   |RO,n|RO,n|RO,n|RW,n| <--- last page being set as RO
>>> +	 *   +----+----+----+----+
>>> +	 *
>>> +	 *  1) Aggregate AF + dirty flags using __ptep_get_and_clear():
>>> +	 *
>>> +	 *   +----+----+----+----+
>>> +	 *   |  0 |  0 |  0 |  0 |
>>> +	 *   +----+----+----+----+
>>> +	 *
>>> +	 *  2) __flush_tlb_range():
>>> +	 *
>>> +	 *   |____ tlbi + dsb ____|
>>> +	 *
>>> +	 *  3) __set_ptes() to repaint contiguous block:
>>> +	 *
>>> +	 *   +----+----+----+----+
>>> +	 *   |RO,c|RO,c|RO,c|RO,c|
>>> +	 *   +----+----+----+----+
>>
>> From the initial layout to point (3), we are also changing the
>> permission. Given the rules you mentioned in the Arm ARM, I think that's
>> safe (hardware seeing either the old or the new attributes). The
>> FEAT_BBM description, however, only talks about change between larger
>> and smaller blocks but no mention of also changing the attributes at the
>> same time. Hopefully the microarchitects claiming certain CPUs don't
>> generate conflict aborts understood what Linux does.

I think what you are saying is that despite going via invalid, the HW may see
this direct transition:

+----+----+----+----+
|RO,n|RO,n|RO,n|RW,n|
+----+----+----+----+
to:
+----+----+----+----+
|RO,c|RO,c|RO,c|RO,c|
+----+----+----+----+

There are 2 logical operations here. The first is changing the permissions of
the last entry. The second is changing the size of the entry.

As I understand it, it's permissible in the architecture to update the
permissions of the a PTE without break-before-make and without issuing a tlbi
afterwards; in that case the HW may apply either the old permissions or the new
permissions up until a future tlbi (after which the new permissions are
guarranteed). That's the first logical operation.

The second logical operation is permitted by FEAT_BBM level 2.

So both logical operations are permitted and the Arm ARM doesn't mention any
requirement to "separate" these operations with a tlbi or anything else, as far
as I can see.

So I would interpret that combining these 2 in the way we have should be safe.
RNGLXZ and RJQQTC give further insight into the spirit of the spec. But I agree
this isn't spelled out super clearly.

Perhaps we can move forwards based on this understanding, and I will seek some
clarifying words to be added to the Arm ARM?

Thanks,
Ryan


