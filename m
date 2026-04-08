Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661F31073C99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCo/KGdYTRJFNwKNUpDIZvF/sPfe++F6/SVEF+nLq80=; b=Udj9Yk4aAkA311oI7U7/IBEumq
	zzR7IBJTPDA5zDDoqxM3j3ciC0/pgD2hNczNGbTmGlE3Gze7DQNJwCqY9bdLnQiqyaWhMgphu3U79
	EpvAUYeEas1bWDj+W1hUqV8+eITwAp8rebIJ/KClgBa1N38cU4JpL/05bPbmTQVSXIldJ+dFEMLTW
	+KqUC7imhWm2sn/3hY5Tlf4uAXD7rjYxLVNY77JWeWELRHw2qrPqzFh7YmrjiV3vC0NY65+XHHMVx
	T3bU1Cnz7zJgGVepT2A23IZ1DvO6upS+FGEf2pg2Yn6R1A6seT7+EPn1vzeSiqWSkeadApt87iBPN
	2D3WqqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQf6-00000008ihA-07IP;
	Wed, 08 Apr 2026 11:01:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQf3-00000008igG-16Z5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:01:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFE92BC4;
	Wed,  8 Apr 2026 04:01:20 -0700 (PDT)
Received: from [10.57.87.42] (unknown [10.57.87.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F3CF3F632;
	Wed,  8 Apr 2026 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775646086; bh=sj8JDaDSYK+tYnVjXLuC+PQF+McDxx+lR1PogM9spE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bNuae1i/ZuzLq7CMWlbVxrPHfN8BimWSWAP3gURWRbaWCS2zs31gmVArdTgAM9DFA
	 mGCCsnP9qltnDf2MIQHjEfpDc+cFpIfeQHBf1LM75b3zMgEgVhInlvFDKtel3ZDx2+
	 xgoASjHChVFUhH352g6g/FvcDa8koEVcRvq2fbV8=
Message-ID: <2a980011-b229-43d4-ad9e-b3e851bff706@arm.com>
Date: Wed, 8 Apr 2026 12:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 00/16] arm64/mm: Enable 128 bit page table entries
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <a77b39a4-c6dd-4a8a-8ea4-2bdc31bd3601@kernel.org>
 <8d2c9ecb-ae33-42f2-a8ed-66b3286b9286@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8d2c9ecb-ae33-42f2-a8ed-66b3286b9286@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_040129_385970_10A8FAC9 
X-CRM114-Status: GOOD (  20.58  )
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

On 08/04/2026 11:53, Anshuman Khandual wrote:
> On 07/04/26 8:14 PM, David Hildenbrand (Arm) wrote:
>> On 2/24/26 06:11, Anshuman Khandual wrote:
>>> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
>>> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
>>> So with this feature arm64 platforms could have two different translation
>>> systems, VMSAv8-64 and VMSAv9-128 could selectively be enabled.
>>>
>>> FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
>>> and virtual address range while also expanding available room for more MMU
>>> management feature bits both for HW and SW. 
>>>
>>> This series has been split into two parts. Generic MM changes followed by
>>> arm64 platform changes, finally enabling D128 with a new config ARM64_D128.
>>>
>>> READ_ONCE() on page table entries get routed via level specific pxdp_get()
>>> helpers which platforms could then override when required. These accessors
>>> on arm64 platform help in ensuring page table accesses are performed in an
>>> atomic manner while reading 128 bit page table entries.
>>>
>>> All ARM64_VA_BITS and ARM64_PA_BITS combinations for all page sizes are now
>>> supported both on D64 and D128 translation regimes. Although new 56 bits VA
>>> space is not yet supported. Similarly FEAT_D128 skip level is not supported
>>> currently.
>>>
>>> Basic page table geometry has been changed with D128 as there are now fewer
>>> entries per level. Please refer to the following table for leaf entry sizes
>>>
>>>                     D64              D128
>>> ------------------------------------------------
>>> | PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
>>> -----------------------------|-----------------|
>>> |     4K    |    2M  |  1G   |    1M  |  256M  |
>>> |    16K    |   32M  | 64G   |   16M  |   16G  |
>>> |    64K    |  512M  |  4T   |  256M  |    1T  |
>>> ------------------------------------------------
>>>
>>
>> Interesting. That means user space will have it even harder to optimize
>> for THP sizes.
>>
>> What's the effect on cont-pte? Do they still span the same number of
>> entries and there is effectively no change?
> 
> The numbers are the same for 4K base page size but will need
> some changes for 16K and 64K base page sizes. Something that
> git missed in this series, will fix it.

Really - I thought the contiguous sizes were the same for D128 as they are for
D64? What's the difference? Perhaps it's different for level 2, but for level 3,
I'm pretty sure it remains:

PAGE_SIZE	CONT_SIZE	NR_PTES		CONT_ORDER
4K		64K		16		4
16K		2M		128		7
64K		2M		32		5

Thanks,
Ryan

> 
>>
>>> From arm64 kernel features perspective KVM, KASAN and UNMAP_KERNEL_AT_EL0
>>> are currently not supported as well.
>>>
>>> Open Questions:
>>>
>>> - Do we need to support UNMAP_KERNEL_AT_EL0 with D128
>>> - Do we need to emulate traditional D64 sizes at PUD, PMD level with D128
>>
>> It would certainly make user space interaction easier. But then, user
>> space already has to consider various PMD sizes (and is better of
>> querying /sys/kernel/mm/transparent_hugepage/hpage_pmd_size instead of
>> hardcoding it). s390x, for example, also has 1M PMD size.
>>> I guess with "emulating" you mean something simple like always
>> allocating order-1 page tables that effectively have the same number of
>> page table entries?
> 
> Yeah - thought something similar.
> 
>>
>> The would be an option, but I recall that the pte_map_* infrastructure
>> currently expects that leaf page tables only ever span a single page.
>>> So it wouldn't really give us a lot of easy benefit I guess.
> 
> Right. So probably need to figure all other benefits this might
> add besides just the user space facing interactions as you have
> mentioned earlier.


