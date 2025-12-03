Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11214D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktrdC3X3Wj1FDCJhFPUlOqx6Gm94Hz6vHaszbn8CHek=; b=W16JwOxv4l+vUybScdX53KqiiR
	IpBngv870o3+yn9RnUERfJYquyVmXP3Zkj6mdMvmFaY08GVcAy0sUp9uV24I+1TnsB6fD04txTJZb
	z+BzIAo7NmAPO7rlDoA1AHISCK0rD2SBxYzDhpS1oFDdUC7tHEaIIK7uKSkXXo4BnnkjkYayG8JNJ
	zjbtoJQm/HtESt/iDPtpYZTRw2ZJSL5FGBeWAqk1YRf/HiHnZVG3BAgVPtUesI/cWO0IOIBoOewtX
	YylWy165O05nKyFOleW8GJAhvayaHRYPqzq542LhsivEI5pQAHhGVbp7Xe9og2k5R6Xs/S1+7itVd
	a6SwQl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgy3-00000006F65-0uYa;
	Wed, 03 Dec 2025 07:08:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgxx-00000006F2d-2Wv3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:08:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67AA8339;
	Tue,  2 Dec 2025 23:07:46 -0800 (PST)
Received: from [10.163.49.22] (unknown [10.163.49.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91BC43F59E;
	Tue,  2 Dec 2025 23:07:51 -0800 (PST)
Message-ID: <296f9c4b-8c93-4464-9b75-e06770a4bd31@arm.com>
Date: Wed, 3 Dec 2025 12:37:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
 <381a3974-aafa-419f-a7ad-ed6e4c1671f0@arm.com>
 <58d796ec-b430-4fc0-9a1c-8f1a6150f051@windriver.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <58d796ec-b430-4fc0-9a1c-8f1a6150f051@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_230757_761459_2E242B74 
X-CRM114-Status: GOOD (  25.63  )
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



On 02/12/25 1:25 PM, Jianpeng Chang wrote:
> 
> On 12/2/25 2:57 PM, Anshuman Khandual wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> On 02/12/25 7:57 AM, Jianpeng Chang wrote:
>>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>>> prevents unnecessary dirty page marking in normal memory management paths,
>>> it breaks kexec on some platforms like NXP LS1043.
>>>
>>> The issue occurs in the kexec code path:
>>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>>    writable copy of the linear mapping
>>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>>    are writable for the new kernel image copying
>>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>>> 4. When kexec tries to copy the new kernel image through the linear
>>>    mapping, it fails on read-only pages, causing the system to hang
>>>    after "Bye!"
>>>
>>> The same issue affects hibernation which uses the same trans_pgd code path.
>>>
>>> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
>> via pte_mkdirty() ?
> Sorry, for this.
> 
> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
> hibernation, making all pages in the temporary mapping writable
> regardless of their dirty state.

Fair enough.

>>
>>> kexec and hibernation, ensuring all pages in the temporary mapping are
>>> writable regardless of their dirty state. This preserves the original
>>> commit's optimization for normal memory management while fixing the
>>> kexec/hibernation regression.
>>>
>>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>>> ---
>>> v2:
>>>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>>>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
>>> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
>>>
>>>  arch/arm64/mm/trans_pgd.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>>> index 18543b603c77..08f5ee6643e1 100644
>>> --- a/arch/arm64/mm/trans_pgd.c
>>> +++ b/arch/arm64/mm/trans_pgd.c
>>> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>>                * Resume will overwrite areas that may be marked
>>>                * read only (code, rodata). Clear the RDONLY bit from
>>>                * the temporary mappings we use during restore.
>>> +              *
>>> +              * For kexec/hibernation, we need writable access to all
>>> +              * pages in the linear mapping to copy the new kernel image.
>>> +              * Mark pages dirty first to ensure pte_mkwrite_novma()
>>> +              * clears PTE_RDONLY.
>>>                */
>>                /*
>>                 * For both kexec and hibernation, writable accesses are required
>>                 * for all pages in the linear map to copy over new kernel image.
>>                 * Hence mark these pages dirty first via pte_mkdirty() to ensure
>>                 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>>                 * required write access for the pages.
>>                 */
> I will change it.
>>
>>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>>> +             __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>>>       } else if (!pte_none(pte)) {
>>>               /*
>>>                * debug_pagealloc will removed the PTE_VALID bit if
>>> @@ -57,7 +62,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>>                */
>>>               BUG_ON(!pfn_valid(pte_pfn(pte)));
>>>
>> The comments should be replicated here as well given the same special situation.
> I will change it.
>>
>>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>>> +             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>>>       }
>>>  }
>>>
>> static inline pte_t pte_mkwrite_novma(pte_t pte)
>> {
>>         pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>>         if (pte_sw_dirty(pte))
>>                 pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>         return pte;
>> }
>>
>> static inline pte_t pte_mkdirty(pte_t pte)
>> {
>>         pte = set_pte_bit(pte, __pgprot(PTE_DIRTY));
>>
>>         if (pte_write(pte))
>>                 pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>
>>         return pte;
>> }
>>
>> So if pte_write() is true, there will be a redundant PTE_RDONLY clearing which is OK.
>> Should this be mentioned in the commit message ?
> TBH, I don't have a better idea - any suggestions?
> 
> Or, let's add some lines:
> 
> Using pte_mkdirty() causes redundant bit operations, but this is
> acceptable since it's not a hot path.

Makes sense - better to call out potential redundancies.

