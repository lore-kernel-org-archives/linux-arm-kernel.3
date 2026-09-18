Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E9C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iSN1j31Sw9qmqTYVp6Ry3mKQfg4lt3sT+FCrOQ8mF4=; b=xtsznH5RKATxpNWF/uQtF1/bO1
	2fnQe+9YMEEhLUuaseGLcR5oPcrsCCZR5VdBaErj9u26BumHz1AnZq3DCNKWrX87XEf9u7Rs6K0/p
	nRsobe3GM4Of7mJruXQAPaYkEj/Aojuvn+bzIY2R06dltjsvny6ndgY4gD2qam2e1flZ1wYd5oZXC
	xYXPf8FqJIkXfr56I7zp6QLWyjffw0wj2GCtphAhbmGCym7rwaurctIUvwO6/5NygtPFXkDc4t1fY
	lu9iv2UQRdWEjf/Dt1gDq6nNWSQfTC6m0Sktq1jVoj8D+WWE3ahiHoxISLaL7FzjR6JNVwxPc5UK6
	HbnXQhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RjE-0000000DWuH-2GNL;
	Fri, 18 Sep 2026 06:05:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RjD-0000000DWuB-3lYk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:05:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B76F8601EF;
	Fri, 18 Sep 2026 06:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB971F000FF;
	Fri, 18 Sep 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789711542;
	bh=2iSN1j31Sw9qmqTYVp6Ry3mKQfg4lt3sT+FCrOQ8mF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HRYJtWuL74SbBnfcEwdWnfbXL/tQ2LS0eZcRDZCBlNLQXBydIBtYqkiENXlDagnbT
	 C2yEEFg2K7h5z+2opnb1JHsi/x+l+mdBVTLNqkvv/DpshLB82Svt8wnmGViSmp38iu
	 RqWJqCe9NjqFd7sIoVai7vkuR1L3g/ELqekIScdjqxdSM+2tF1sE2M5vUb+ybXhH2T
	 qeHd1/7ezHu35c25/Re5wk4kWvG7SMvYr71yv/QjO7HFaVvMkPqGp28tk2Tjav58QQ
	 8Q3/O3ocmaqrfak5BYTC5KAwevQhgl+fUqMCEBp14MV+FG3sEjD8+8xfzUSXElZXjR
	 UltrRtZcQGVSg==
Message-ID: <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
Date: Fri, 18 Sep 2026 08:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
 <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 17/09/2026 à 23:44, Barry Song a écrit :
> On Thu, Sep 17, 2026 at 10:41 PM Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>> On Thu, 17 Sept 2026 at 22:00, Christophe Leroy (CS GROUP)
>> <chleroy@kernel.org> wrote:
>>>
>>>
>>>
>>> Le 17/09/2026 à 07:29, Wen Jiang a écrit :
>>>> From: Wen Jiang <jiangwen6@xiaomi.com>
>>>>
>>>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>>>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>>>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>>>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>>>
>>>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>>>> pte_clear_huge(), add the generic fallbacks next to the existing
>>>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>>>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>>>> around the block-mapping paths are dropped, so PTE-level block mappings
>>>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>>>> longer includes <linux/hugetlb.h>.
>>>>
>>>> The fallbacks exist only to keep the build working on architectures
>>>> without PTE-level block mapping support. They are unreachable there:
>>>> the callers only run when arch_vmap_pte_range_map_size() or
>>>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>>>> which requires an arch implementation. WARN_ON_ONCE() makes that
>>>> explicit rather than silently doing nothing.
>>>>
>>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>>> ---
>>>>    include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>>>    mm/vmalloc.c            | 19 ++++++-------------
>>>>    2 files changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index cdd68ed3ae1a9..349ced999f959 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>>>    }
>>>>    #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>>>
>>>> +/*
>>>> + * PTE-level block mappings for vmap.
>>>> + *
>>>> + * pte_set_huge() only has to be implemented by architectures whose
>>>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
>>>> + */
>>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
>>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
>>>> +                             phys_addr_t phys, pgprot_t prot,
>>>> +                             unsigned long size)
>>>> +{
>>>> +     WARN_ON_ONCE(1);
>>>
>>> BUILD_BUG_ON() would be better here.
>>>
>>> It should be possible because fallback arch_vmap_pte_range_map_size()
>>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
>>>
>>
>> Agreed. These fallbacks exist only to keep the build working on
>> architectures with PTE-level block mappings and should never actually
>> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
>>
> 
> I am not quite sure. It won't be called at runtime because
> `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> reach this branch. But it will still be built.

The fallbacks are defined as:

#ifndef arch_vmap_pte_range_map_size
static inline unsigned long arch_vmap_pte_range_map_size(unsigned long 
addr, unsigned long end,
							 u64 pfn, unsigned int max_page_shift)
{
	return PAGE_SIZE;
}
#endif

#ifndef arch_vmap_pte_range_unmap_size
static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long 
addr,
							   pte_t *ptep)
{
	return PAGE_SIZE;
}
#endif

Therefore in:

                 size = arch_vmap_pte_range_unmap_size(addr, pte);
                 if (size != PAGE_SIZE) {

GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit 
the branch at all.

It is call constant folding, some explanation here: 
https://en.wikipedia.org/wiki/Constant_folding

> 
> So, would a `BUILD_BUG_ON()` trigger a build failure here?

It shouldn't, if it does it is a compiled bug or this is because someone 
has redefined arch_vmap_pte_range_map_size() and not pte_set_huge() 
which we'd better know at build time rather than at runtime.


> 
> Best Regards
> Barry
> 


