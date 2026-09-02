Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E9FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYVnLyOaTgHPP6xz/UHsXg+cvDAjK8CW3IzfuxYWXPc=; b=bL38fjB4lATdY80dmWhs0W+fIw
	L+3bWvRLZhHcGauA8QAXJwpY0YKuooZPd5O6g70TyHiZ8wzbygBKuNf85CGwkNC1qauiAcH6SLtxl
	+wLy/FkLpvdez6u0TRoMAckBYjmCNpYtVE3fZhnyHp6t7q8eE8DFhrku91Cq4XAY9cYa67mqYg8Uh
	KUZmK30XvswYTnOdWn8W/Actf6fjT1XbIzSvPg32fNFzLj9dVbai0otjtYTiNwwR9nWfeuNpql/IS
	RDUq93Iu8gYcAm60o+jc4g5TVcCyN7GbHex+wqu6qG7mMpaV0B/hCVBYQbCFEcuDnThs8l54G4Rtj
	9NYxcdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ndz-0000000FBcs-2PbO;
	Wed, 02 Sep 2026 16:16:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ndw-0000000FBYH-0Qwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:16:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9862165C;
	Wed,  2 Sep 2026 09:16:48 -0700 (PDT)
Received: from [10.57.81.239] (unknown [10.57.81.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CC9B3F882;
	Wed,  2 Sep 2026 09:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788365812; bh=gSEvBp+KCkXzHc8dbTVfAUkWIju2bmeIwgUNZoB5Jt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GzQ39Llny2ZuYBIRxqfmTLFB8+xgcnuApQeVF7Znpj2TjYxDzgeaV37nuH25mn0rx
	 KqEIpkSwP29+sHWsyfh1SSc4Iuv7/CcNnzDIC/mdocDoDWU2tgWauk+y1MvmzYSMU+
	 40g6i1Xs00gK1gmyV5Y8FC4PEHfJOL8ZxTLS8jno=
Message-ID: <8e9f7967-710d-4548-89c4-8e5ba46d8714@arm.com>
Date: Wed, 2 Sep 2026 17:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
To: Dev Jain <dev.jain@arm.com>, Karl Mehltretter <kmehltretter@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_091656_300949_09C23372 
X-CRM114-Status: GOOD (  31.17  )
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

On 02/09/2026 15:46, Dev Jain wrote:
> 
> 
> On 01/09/26 6:48 pm, Karl Mehltretter wrote:
>> huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
>> permissions. For contiguous PTE mappings, break-before-make (BBM)
>> requires a TLB invalidation after clearing the set and before making any
>> entry valid again.
>>
>> Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
>> get_clear_flush()") removed this invalidation, relying on the deferred
>> flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
>> TLB invalidation for BBM on contiguous ptes") restored it for
>> huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
>> late for the break step. The modify-prot path has the same problem.
>>
>> Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
>> invalidated during the break step. Leave huge_ptep_get_and_clear()
>> unchanged because it is also used by teardown paths, where the deferred
>> flush is sufficient.
>>
>> Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>> Assisted-by: LLM
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>> ---

Is there a user-visible bug here? Or is this just AI-assisted hypothesising?


> 
> The transition happening here is:
> 
> old_prot+cont -> zero -> new_prot+cont ... (i)
> and then TLB flush.
> 
> Arm Arm rule R_JQQTC says:
> "For a TLB lookup in a contiguous region mapped by translation table entries
> that have consistent values for the Contiguous bit, but have the OA, attributes,
> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
> access permissions, and memory attributes that are consistent with any one
> of the programmed translation table values."
> 
> This implies that a live update like
> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
> 
> is safe. Which should also imply that the transition (i) is safe,
> since the configurations the PE can observe for (ii) is the same
> for (i), except that in (ii) the PE can fault too, which is fine.
> 
> Upon discussing with Ryan I got to know, he was implementing the
> contpte stuff for non-hugetlb user mappings and that basically
> drove a clarification on the semantics of contiguous bit and
> this rule was added.
> 
> If you see currently for non-hugetlb mprotect() we do not flush
> during contpte teardown.
> 
> So if the above reasoning makes sense, I can infact audit and
> remove the flushes in the hugetlb helpers.

I agree with this analysis. I believe it is safe to elide the intermediate flush
in this case (as is done in contpte_wrprotect_ptes()). And I agree that we can
likely remove some existing TLB maintenance in hugetlb helpers.

Thanks,
Ryan

> 
>> An instrumented QEMU detected the missing break-step TLBI on an unpatched
>> kernel and none with this change. A fork() control exercising
>> huge_ptep_set_wrprotect() remained clean. No user-visible failure was
>> reproduced.
>>
>> The QEMU checker was exercised with 4K and 64K base-page kernels. The
>> patched kernel passed the LTP hugetlb tests with both -cpu max and -cpu
>> cortex-a72 (16 TPASS and no failures).
>>
>> Testing on Neoverse N1 hardware would be welcome, as it can use the
>> contiguous hint and can be configured to report TLB conflicts.
>>
>>  arch/arm64/mm/hugetlbpage.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 8e799c1fe0aa..bb53a04b73b2 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -517,6 +517,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>  pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>>  {
>>  	unsigned long psize = huge_page_size(hstate_vma(vma));
>> +	pte_t pte = __ptep_get(ptep);
>> +
>> +	/* The break step for contiguous PTEs must include the TLB flush. */
>> +	if (pte_cont(pte))
>> +		return huge_ptep_clear_flush(vma, addr, ptep);
>>  
>>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>>  		/*
>> @@ -524,7 +529,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>>  		 * when the permission changes from executable to non-executable
>>  		 * in cases where cpu is affected with errata #2645198.
>>  		 */
>> -		if (pte_user_exec(__ptep_get(ptep)))
>> +		if (pte_user_exec(pte))
>>  			return huge_ptep_clear_flush(vma, addr, ptep);
>>  	}
>>  	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep, psize);
>>
>> base-commit: 786262be6048deab760f68c8acc2c85607165894
> 


