Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7251FCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtY8PxEyIubqCZUk80T4fMo0woyvuu6eo6/vRZ5dv8s=; b=rRrH9TN8rBsdZj7gCGg8XHFSZ3
	bc1oDJ0RSKpYeQCCu/UHhY2PtEeFb/VxIiXitay/+wt5EyA6femRR4PZD2pHeSjMHMS9B5yfKM4KI
	tV2AOoFYTqcDI/fYyZh07yg65+16Ox+E1ptc83COULJuEp69mlRmUePO9Gs3c/jyCMsyJAM3vfUgv
	VATxpmsHIUQRpJLZPDinMAf/Gt4F6IKgciv3KyFUO4s3+Sq8tBHfmqJxM/SHcgkTfUjbOOghcBbUN
	8Fr1r4biAAhAFspARQnmypMo6aSnyUqkiLKRYqRHNLAhmIyyq8/zFzJ1YZf71Wo8aTiL+01p1WG4T
	uiT1rGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTKJ-00000001tYQ-1djJ;
	Wed, 22 Oct 2025 07:32:07 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTKF-00000001tXP-1pbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761118320; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=QtY8PxEyIubqCZUk80T4fMo0woyvuu6eo6/vRZ5dv8s=;
	b=InR5naqE12shqKfMuSggTZgD8usHpAbCp1sy5++MvTHKbokmqqvBVUH0YwBcyTKGnZafGjaEYwQ0raeIVC62P8rvxIfV1tipTAe2Yl9TgkzL/x8zpphMGNC897AMkyDndkVG1Vk3jUrShQ0iSxOhuQBq5DQFJd9UoKsgBKC/HAs=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqlxQu6_1761118300 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Oct 2025 15:31:58 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  David
 Hildenbrand <david@redhat.com>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,  Zi Yan
 <ziy@nvidia.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,  Ryan
 Roberts <ryan.roberts@arm.com>,  Yang Shi <yang@os.amperecomputing.com>,
  "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Dev Jain
 <dev.jain@arm.com>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Yicong Yang <yangyicong@hisilicon.com>,  Kefeng Wang
 <wangkefeng.wang@huawei.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,  Yin
 Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
In-Reply-To: <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 17:08:47 +1300")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-3-ying.huang@linux.alibaba.com>
	<CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
Date: Wed, 22 Oct 2025 15:31:39 +0800
Message-ID: <87a51jfl44.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_003204_150060_D4FEFED2 
X-CRM114-Status: GOOD (  26.58  )
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

Hi, Barry,

Barry Song <21cnbao@gmail.com> writes:

>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/p=
gtable.h
>> index aa89c2e67ebc..35bae2e4bcfe 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -130,12 +130,16 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>
>>  /*
>> - * Outside of a few very special situations (e.g. hibernation), we alwa=
ys
>> - * use broadcast TLB invalidation instructions, therefore a spurious pa=
ge
>> - * fault on one CPU which has been handled concurrently by another CPU
>> - * does not need to perform additional invalidation.
>> + * We use local TLB invalidation instruction when reusing page in
>> + * write protection fault handler to avoid TLBI broadcast in the hot
>> + * path.  This will cause spurious page faults if stall read-only TLB
>> + * entries exist.
>>   */
>> -#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (=
0)
>> +#define flush_tlb_fix_spurious_fault(vma, address, ptep)       \
>> +       local_flush_tlb_page_nonotify(vma, address)
>> +
>> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)   \
>> +       local_flush_tlb_page_nonotify(vma, address)
>>
>>  /*
>>   * ZERO_PAGE is a global shared page that is always zero: used
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/=
tlbflush.h
>> index 18a5dc0c9a54..651b31fd18bb 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -249,6 +249,18 @@ static inline unsigned long get_trans_granule(void)
>>   *             cannot be easily determined, the value TLBI_TTL_UNKNOWN =
will
>>   *             perform a non-hinted invalidation.
>>   *
>> + *     local_flush_tlb_page(vma, addr)
>> + *             Local variant of flush_tlb_page().  Stale TLB entries may
>> + *             remain in remote CPUs.
>> + *
>> + *     local_flush_tlb_page_nonotify(vma, addr)
>> + *             Same as local_flush_tlb_page() except MMU notifier will =
not be
>> + *             called.
>> + *
>> + *     local_flush_tlb_contpte_range(vma, start, end)
>> + *             Invalidate the virtual-address range '[start, end)' mapp=
ed with
>> + *             contpte on local CPU for the user address space correspo=
nding
>> + *             to 'vma->mm'.  Stale TLB entries may remain in remote CP=
Us.
>>   *
>>   *     Finally, take a look at asm/tlb.h to see how tlb_flush() is impl=
emented
>>   *     on top of these routines, since that is our interface to the mmu=
_gather
>> @@ -282,6 +294,33 @@ static inline void flush_tlb_mm(struct mm_struct *m=
m)
>>         mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>>  }
>>
>> +static inline void __local_flush_tlb_page_nonotify_nosync(
>> +       struct mm_struct *mm, unsigned long uaddr)
>> +{
>> +       unsigned long addr;
>> +
>> +       dsb(nshst);
>
> We were issuing dsb(ishst) even for the nosync case, likely to ensure
> PTE visibility across cores. However, since set_ptes already includes a
> dsb(ishst) in __set_pte_complete(), does this mean we=E2=80=99re being ov=
erly
> cautious in __flush_tlb_page_nosync() in many cases?
>
> static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>                                            unsigned long uaddr)
> {
>         unsigned long addr;
>
>         dsb(ishst);
>         addr =3D __TLBI_VADDR(uaddr, ASID(mm));
>         __tlbi(vale1is, addr);
>         __tlbi_user(vale1is, addr);
>         mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
>                                                 (uaddr & PAGE_MASK) +
> PAGE_SIZE);
> }

IIUC, _nosync() here means doesn't synchronize with the following code.
It still synchronizes with the previous code, mainly the page table
changing.  And, Yes.  There may be room to improve this.

> On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem to use
> set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are visible =
to all
> cores. If a remote CPU later encounters a page fault and performs a TLB
> invalidation, will it still see a stable PTE?

I don't think so.  We just flush local TLB in local_flush_tlb_page()
family functions.  So, we only needs to guarantee the page table changes
are available for the local page table walking.  If a page fault occurs
on a remote CPU, we will call local_flush_tlb_page() on the remote CPU.

>> +       addr =3D __TLBI_VADDR(uaddr, ASID(mm));
>> +       __tlbi(vale1, addr);
>> +       __tlbi_user(vale1, addr);
>> +}
>> +
>> +static inline void local_flush_tlb_page_nonotify(
>> +       struct vm_area_struct *vma, unsigned long uaddr)
>> +{
>> +       __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +       dsb(nsh);
>> +}
>> +
>> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>> +                                       unsigned long uaddr)
>> +{
>> +       __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +       mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & =
PAGE_MASK,
>> +                                               (uaddr & PAGE_MASK) + PA=
GE_SIZE);
>> +       dsb(nsh);
>> +}
>> +
>>  static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>>                                            unsigned long uaddr)
>>  {
>> @@ -472,6 +511,23 @@ static inline void __flush_tlb_range(struct vm_area=
_struct *vma,
>>         dsb(ish);
>>  }
>>
>
> We already have functions like
> __flush_tlb_page_nosync() and __flush_tlb_range_nosync().
> Is there a way to factor out or extract their common parts?
>
> Is it because of the differences in barriers that this extraction of
> common code isn=E2=80=99t feasible?

Yes.  It's a good idea to do some code clean to reduce code duplication.
Ryan has plan to work on this.

---
Best Regards,
Huang, Ying

