Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhEpcsjjXSmhdX1KtRS6zM8bWLKgWa3nW473Rduzz5E=; b=plvAhzx7PBqSh9/5q9oVW8wINo
	HyDhrbduMZlZkx1JQsQ/OcSo/ZKrb5C54UZQK11bH0ZFAF41Wd6v4Iq16M+Yoq46gnKzCMkcm2ap+
	MiyINJRHsWVRMz+1cvXT16DmGUGTAiEm/sSh2PO62VjEP3FXjNju8TlorG9ZgBxQU5P125vih8odL
	EQlrcTRXwF3lMJAUW9LXRfaxwscgpTIlQOcC/fbrArQW47uzmNXSFxvsph5E3h3Dvrw1uX6oMKdol
	JVow6PQQ7Q6XZujMWytREILzt/lYOpGJAb/+eAgTjowfhCOIQelpTR25qFh1YcYsKZOuFb6yP+xm8
	opTwVaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZtM-0000000AfCe-398n;
	Wed, 19 Feb 2025 02:32:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZrt-0000000Af1n-0OBZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 02:31:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08A07152B;
	Tue, 18 Feb 2025 18:31:38 -0800 (PST)
Received: from [10.162.16.56] (a077893.blr.arm.com [10.162.16.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8D2D3F6A8;
	Tue, 18 Feb 2025 18:31:17 -0800 (PST)
Message-ID: <3fe309d8-7775-4533-b08b-51ce1a3f362c@arm.com>
Date: Wed, 19 Feb 2025 08:01:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/hugetlb: Consistently use pud_sect_supported()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250218113639.475947-1-anshuman.khandual@arm.com>
 <0ad8b31e-f1f1-426d-89e8-a21cf72814d1@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <0ad8b31e-f1f1-426d-89e8-a21cf72814d1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_183121_179399_2BF59388 
X-CRM114-Status: GOOD (  16.46  )
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



On 2/18/25 19:31, Ryan Roberts wrote:
> On 18/02/2025 11:36, Anshuman Khandual wrote:
>> Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
>> Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.14-rc3
>>
>> Changes in V2:
>>
>> - Added an warning when PUD_SIZE is requested but not supported per Ryan
>>
>> Changes in V1:
>>
>> https://lore.kernel.org/all/20250217065414.49489-1-anshuman.khandual@arm.com/
>>
>>  arch/arm64/mm/hugetlbpage.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 98a2a0e64e25..1d89599a20d7 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
>>  	switch (hp_size) {
>>  #ifndef __PAGETABLE_PMD_FOLDED
>>  	case PUD_SIZE:
>> -		return PGDIR_SIZE - PUD_SIZE;
>> +		if (pud_sect_supported())
>> +			return PGDIR_SIZE - PUD_SIZE;
>> +		break;
>>  #endif
>>  	case CONT_PMD_SIZE:
>>  		return PUD_SIZE - CONT_PMD_SIZE;
>> @@ -364,7 +366,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>>  	switch (pagesize) {
>>  #ifndef __PAGETABLE_PMD_FOLDED
>>  	case PUD_SIZE:
>> -		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
>> +		if (pud_sect_supported())
>> +			entry = pud_pte(pud_mkhuge(pte_pud(entry)));
>> +		else
>> +			pr_warn("%s: pud huge page not supported\n", __func__);
>>  		break;
>>  #endif
>>  	case CONT_PMD_SIZE:
> 
> Personally, I think something like this is cleaner than having 2 warnings:
> 
> pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
> {
> 	size_t pagesize = 1UL << shift;
> 
> 	switch (pagesize) {
> #ifndef __PAGETABLE_PMD_FOLDED
> 	case PUD_SIZE:
> 		if (pud_sect_supported())
> 			return pud_pte(pud_mkhuge(pte_pud(entry)));
> 		break;
> #endif
> 	case CONT_PMD_SIZE:
> 		return pmd_pte(pmd_mkhuge(pmd_mkcont(pte_pmd(entry))));
> 	case PMD_SIZE:
> 		return pmd_pte(pmd_mkhuge(pte_pmd(entry)));
> 	case CONT_PTE_SIZE:
> 		return pte_mkcont(entry);

A "default" entry is needed here for the switch statement above. But that
could be just a simple break statement.

> 	}
> 
> 	pr_warn("%s: unrecognized huge page size 0x%lx\n",
> 		__func__, pagesize);


> 	return entry;
> }

Initially thought about that, but wondered if "unsupported" should be called
out as "unrecognized" instead. But that's a trivial detail. So I will do the
changes as suggested.

