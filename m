Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098E4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ1isTw3oip7OndEZVcRVQKbaw5JctUHOF1az7Tr1Y0=; b=uDb5wSPUTvLpfMpF4lFjbee58X
	zZjiCPg2KrHbC5ng9mMDgTzGq8xktZExxiciw3jpn9+K8iYYMS6brQOMG7AK2nw1JJPOVDzid6qc9
	CI1cLXekasctD/qopDF8ug79EZ382HqabFe98dDEYy1XnmoBUUszGthGHb4iZiEaY9nNM87mxRIcI
	iwbCkXBmlAy+fuedzTCAc582nyQYPt1HjnQg6/ZS0I+KIWT1QtyAhKtPSHxzBk52tBDgt59N4EyN9
	7fjBOTx2Z/svhjbYc2nLfpVaqfHnv4pX0USp48vKkTQXHa+tx+Su8x5KN4WF4Nb+BS6vGcFCchuQi
	FJuZwNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJHs-0000000CC95-30uJ;
	Tue, 20 May 2025 09:29:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ2L-0000000C9JM-2OTL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 09:13:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBE2152B;
	Tue, 20 May 2025 02:13:11 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35A483F5A1;
	Tue, 20 May 2025 02:13:21 -0700 (PDT)
Message-ID: <7d5476a1-baa8-4bd0-965f-009bfa01c3c3@arm.com>
Date: Tue, 20 May 2025 14:43:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Restrict pagetable teardown to avoid false
 warning
To: Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand
 <david@redhat.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250518095445.31044-1-dev.jain@arm.com>
 <5763d921-f8a8-4ca6-b5b5-ad96eb5cda11@arm.com>
 <7680e775-d277-45ea-9b6c-1f16b8b55a3f@redhat.com>
 <df7eb016-bea4-489d-aecb-1a47eb5e33b2@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <df7eb016-bea4-489d-aecb-1a47eb5e33b2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021325_748855_6A88F788 
X-CRM114-Status: GOOD (  20.20  )
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



On 19/05/25 6:17 pm, Ryan Roberts wrote:
> On 19/05/2025 13:16, David Hildenbrand wrote:
>> On 19.05.25 11:08, Ryan Roberts wrote:
>>> On 18/05/2025 10:54, Dev Jain wrote:
>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>
>>> nit: please use the standard format for describing commits: Commit 9c006972c3fe
>>> ("arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table()")
>>>
>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
>>>> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
>>>> a pmd_present() check in pud_free_pmd_page().
>>>>
>>>> This problem was found by code inspection.
>>>>
>>>> This patch is based on 6.15-rc6.
>>>
>>> nit: please remove this to below the "---", its not part of the commit log.
>>>
>>>>
>>>> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from
>>>> pXd_free_pYd_table())
>>>>
>>>
>>> nit: remove empty line; the tags should all be in a single block with no empty
>>> lines.
>>>
>>>> Cc: <stable@vger.kernel.org>
>>>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>> v1->v2:
>>>>    - Enforce check in caller
>>>>
>>>>    arch/arm64/mm/mmu.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index ea6695d53fb9..5b1f4cd238ca 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>        next = addr;
>>>>        end = addr + PUD_SIZE;
>>>>        do {
>>>> -        pmd_free_pte_page(pmdp, next);
>>>> +        if (pmd_present(*pmdp))
>>>
>>> pmd_free_pte_page() is using READ_ONCE() to access the *pmdp to ensure it can't
>>> be torn. I suspect we don't technically need that in these functions because
>>> there can be no race with a writer.
>>
>> Yeah, if there is no proper locking in place the function would already
>> seriously mess up (double freeing etc).
> 
> Indeed; there is no locking, but this portion of the vmalloc VA space has been
> allocated to us exclusively, so we know there can be no one else racing.
> 
>>
>>> But the arm64 arch code always uses
>>> READ_ONCE() for dereferencing pgtable entries for safely. Perhaps we should be
>>> consistent here?
>>
>> mm/vmalloc.c:   if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> 
> Yes, I saw that. I know that we don't technically need READ_ONCE(). I'm just
> proposng that for arm64 code we should be consistent with what it already does.
> See Commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when accessing
> page tables")

(Sorry for the spam, managed to import the mbox into thunderbird)
So we can just pmdp_get() here?

> 
> Thanks,
> Ryan
> 
>>
>>
>> :)
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>>
> 


