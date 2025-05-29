Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21442C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VomYZ8DhUGSyNUtNd2VjxUdO/qFiwBiW7v/8dYm1pFg=; b=woDMkH6uw17M8s+/hhSg7pOEM7
	qqyiFoEuJ8Dp+Jqoz67kw2glbnEFw1QvhR2T7OguzxWSud7N1RkNlSHHn9s4IM8MOwkBVYlrqV65C
	ch2mQ0HSpwwz2KvvOaxmHXvw2AGkxl5vNfvYVlQlDSorl1NX2M7JYtpelNXF7Sr8HbsfFaXc4T5k3
	Yj347oJsT0S2xhKg2MDLMuhzTXSiNKS6jBFzjZNTmOSKbt6mtlJoSLouVlh0R+xUuwW2bEkaMf9ad
	s3mTWMIbE8gcxg6+rEwLLyJp+b6xjMTuO/ImjEMmbImBg4AFxQ/rguXhfcpDfYh16FWSDvuv1cVy3
	1aitf0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZRl-0000000FOfb-0kIR;
	Thu, 29 May 2025 09:21:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZKM-0000000FNWL-00vw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:13:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA95176A;
	Thu, 29 May 2025 02:13:12 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3FD13F5A1;
	Thu, 29 May 2025 02:13:27 -0700 (PDT)
Message-ID: <9a9f18e7-db69-48f2-916f-4565cdb59821@arm.com>
Date: Thu, 29 May 2025 10:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false
 warning
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain
 <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: david@redhat.com, mark.rutland@arm.com, yang@os.amperecomputing.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20250527082633.61073-1-dev.jain@arm.com>
 <7b9a9ad4-7a7a-4e99-ba72-f5be0f609a21@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7b9a9ad4-7a7a-4e99-ba72-f5be0f609a21@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_021330_096645_00DE3C70 
X-CRM114-Status: GOOD (  15.60  )
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

On 29/05/2025 10:02, Anshuman Khandual wrote:
> 
> 
> On 5/27/25 13:56, Dev Jain wrote:
>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
>> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
>> a pmd_present() check in pud_free_pmd_page().
>>
>> This problem was found by code inspection.
>>
>> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>

LGTM!

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

>> ---
>> This patch is based on 6.15-rc6.
>>
>> v2->v3:
>>  - Use pmdp_get()
>>
>> v1->v2:
>>  - Enforce check in caller
>>
>>  arch/arm64/mm/mmu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..5a9bf291c649 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>  	next = addr;
>>  	end = addr + PUD_SIZE;
>>  	do {
>> -		pmd_free_pte_page(pmdp, next);
>> +		if (pmd_present(pmdp_get(pmdp)))
> 
> This code path is only called for the kernel mapping. Hence should
> pmd_valid() be used instead of pmd_present() which also checks for
> present invalid scenarios as well ? 

I think a similar question came up in a previous round, where we concluded that
it's better to be consistent with what vmalloc is already doing. So personally
I'd leave it as pmd_present():

	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
		return 0;

> 
>> +			pmd_free_pte_page(pmdp, next);
>>  	} while (pmdp++, next += PMD_SIZE, next != end);
>>  
>>  	pud_clear(pudp);


