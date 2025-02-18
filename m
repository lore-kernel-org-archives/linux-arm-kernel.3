Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6782C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4buMDZt+oYnER2QevfGjk33vIp0TLg+x9hZ9LPMTsk=; b=IHaMrux3oIt8E+bjZubWUGnKVO
	YCNAy2+VqTB/i5qzHGI8EZ3lt+l6oAb3D0llLCagWbWHjJ6mPHoN9k8gEOmJpq6o8bInIKVw4w6Ux
	EWhPkCtFG5PmtiPg65w8Y1JYPYxVzB3tBJVtSrkdf4uCSzqWlJFdhWxSAtPzxjfBglsr7E24gGdmK
	UMaiPdzSOTh3a+wZaMDWB6+aOkgu4UnUaBz4BNaoxUkRclm5VYBxWSxRf5lsx9+eybxwS6NoN7Dg8
	BIQcw9WTTPIGJqwH/Ox4DxGhb7rEgeY+kNdVsZvtoRNm73oQy0TwVF7PNxO9kIcT4x6xyEEMkNoRU
	WTAd/mMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFDy-00000006krN-25Yo;
	Tue, 18 Feb 2025 04:28:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEoU-00000006hX7-3evw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 04:02:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF060152B;
	Mon, 17 Feb 2025 20:02:44 -0800 (PST)
Received: from [10.163.37.233] (unknown [10.163.37.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7992F3F5A1;
	Mon, 17 Feb 2025 20:02:23 -0800 (PST)
Message-ID: <110e8959-1d5e-4184-86f8-f4bfbb06e871@arm.com>
Date: Tue, 18 Feb 2025 09:32:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/hugetlb: Consistently use pud_sect_supported()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250217065414.49489-1-anshuman.khandual@arm.com>
 <271c6277-baab-4b69-97ea-d6c80f873fe5@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <271c6277-baab-4b69-97ea-d6c80f873fe5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_200227_012988_557AEA78 
X-CRM114-Status: GOOD (  15.04  )
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



On 2/17/25 19:51, Ryan Roberts wrote:
> On 17/02/2025 06:54, Anshuman Khandual wrote:
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
>>  arch/arm64/mm/hugetlbpage.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 98a2a0e64e25..5b7cfdba9c93 100644
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
>> @@ -364,7 +366,8 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>>  	switch (pagesize) {
>>  #ifndef __PAGETABLE_PMD_FOLDED
>>  	case PUD_SIZE:
>> -		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
>> +		if (pud_sect_supported())
>> +			entry = pud_pte(pud_mkhuge(pte_pud(entry)));
> 
> If this was to get called with PUD_SIZE for a config that doesn't fold the PMD
> and which pud_sect_supported() returns false, we will now return the entry
> unmodified and will not emit the warning that the default case emits. I think we
> should at least either modify the entry (so that it is safe) or emit the
> warning. Doing neither seems less defensive than the current situation.

An warning can be added before breaking when pud_sect_supported() returns false
which will help inform the user that the page table entry did not get modified.

        switch (pagesize) {
#ifndef __PAGETABLE_PMD_FOLDED
        case PUD_SIZE:
                if (pud_sect_supported())
                        entry = pud_pte(pud_mkhuge(pte_pud(entry)));
                else
                        pr_warn("%s: pud huge page not supported\n", __func__);
                break;
#endif

> 
>>  		break;
>>  #endif
>>  	case CONT_PMD_SIZE:
> 

