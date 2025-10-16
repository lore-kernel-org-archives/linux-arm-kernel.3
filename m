Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iGb4w2CJ/xWobbduV7z9pfLjGzjU59oSShpLUnHZK0=; b=QyW1dFPz/PhbnBeSj6GpDd7N8z
	OfTZorXRBlfYSG5SkqYWlEbrAiNc5AQZywJSVF/T6MFRoIqOeovBbUGGje/CapXuEEZCi6Lv1Db6V
	WoZQL0zqCR2vlHYprKS2n5F32p9Vo4aNHHL5UpqR/NDiAGRwbgMX2/r8ZS8lyhAK00tjjixZRgB/s
	6Pz00fKW67zVuHRDPIrv/qyUZ9rJSuvy/7Ur5P2dngVMOBRr9fVYhpuzNrTwUzqdXOG4bUZSw3n0p
	vfuYBAMrFWKWn3phy0Hx9T9yk2jb0LkDDL3frMJbcxY2Bms1ffXMjg8NQMSOWtQ+mvSZgqd1CZvwL
	A/jRh7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ddx-00000003GRK-0QpV;
	Thu, 16 Oct 2025 02:23:05 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ddu-00000003GQr-3ETN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 02:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760581380; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=2iGb4w2CJ/xWobbduV7z9pfLjGzjU59oSShpLUnHZK0=;
	b=WnnVfRxPiTyzLzjSPcsypZI0pLFF0CRHxbgwE2EgmTELXfjYe1tgpVLpJa9DP9TZ1YaAvVjDR+S1z3MPbWzUDdGPf4AHRHgRdndjgiOZ4UzZHytt4yyFkjp16XNONH00ASQ7R6rE9HEah2KPiQvyegAQrQ6STQ9jbpOSNuO5gCg=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqId6gu_1760581378 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 16 Oct 2025 10:22:59 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Vlastimil Babka <vbabka@suse.cz>,  Zi Yan
 <ziy@nvidia.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,  Ryan
 Roberts <ryan.roberts@arm.com>,  Yang Shi <yang@os.amperecomputing.com>,
  "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Dev Jain
 <dev.jain@arm.com>,  Barry Song <baohua@kernel.org>,  Anshuman Khandual
 <anshuman.khandual@arm.com>,  Yicong Yang <yangyicong@hisilicon.com>,
  Kefeng Wang <wangkefeng.wang@huawei.com>,  Kevin Brodsky
 <kevin.brodsky@arm.com>,  Yin Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH -v2 1/2] mm: add spurious fault fixing support for huge pmd
In-Reply-To: <d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local> (Lorenzo
	Stoakes's message of "Wed, 15 Oct 2025 12:20:30 +0100")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-2-ying.huang@linux.alibaba.com>
	<4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
	<87ldlcpnbx.fsf@DESKTOP-5N7EMDA>
	<d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local>
Date: Thu, 16 Oct 2025 10:22:57 +0800
Message-ID: <87bjm7lh4u.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192303_269465_5491D532 
X-CRM114-Status: GOOD (  41.79  )
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

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> On Wed, Oct 15, 2025 at 04:43:14PM +0800, Huang, Ying wrote:
>> Hi, Lorenzo,
>>
>> Thanks for comments!
>>
>> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>>
>> > On Mon, Oct 13, 2025 at 05:20:37PM +0800, Huang Ying wrote:
>> >> In the current kernel, there is spurious fault fixing support for pte,
>> >> but not for huge pmd because no architectures need it. But in the
>> >> next patch in the series, we will change the write protection fault
>> >> handling logic on arm64, so that some stale huge pmd entries may
>> >> remain in the TLB. These entries need to be flushed via the huge pmd
>> >> spurious fault fixing mechanism.
>> >>
>> >> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>> >
>> > Right now the PTE level spurious fault handling is dealt with in
>> > handle_pte_fault() when ptep_set_access_flags() returns false.
>> >
>> > Now you're updating touch_pmd() which is invoked by follow_huge_pmd() and
>> > huge_pmd_set_accessed().
>> >
>> > 1 - Why are you not adding handling to GUP?
>> >
>> > 2 - Is this the correct level of abstraction? It's really not obvious but
>> >     huge_pmd_set_accessed() is invoked by __handle_mm_fault() on a non-WP,
>> >     non-NUMA hint huge page fault where a page table entry already exists
>> >     but we are faulting anyway (e.g. non-present or read-only writable).
>> >
>> > You don't mention any of this in the commit message, which you need to do
>> > and really need to explain how spurious faults can arise, why you can only
>> > do this at the point of abstraction you do (if you are unable to put it in
>> > actual fault handing-code), and you need to add a bunch more comments to
>> > explain this.
>>
>> This patch adds the spurious PMD page fault fixing based on the spurious
>> PTE page fault fixing.  So, I assumed that the spurious page fault
>> fixing has been documented already.  But you are right, nothing prevents
>> us from improving it further.  Let's try to do that.
>
> I wouldn't make any kind of assumption like this in the kernel :) sadly our
> documentation is often incomplete.
>
>>
>> The page faults may be spurious because of the racy access to the page
>> table.  For example, a non-populated virtual page is accessed on 2 CPUs
>> simultaneously, thus the page faults are triggered on both CPUs.
>> However, it's possible that one CPU (say CPU A) cannot find the reason
>> for the page fault if the other CPU (say CPU B) has changed the page
>> table before the PTE is checked on CPU A.  Most of the time, the
>> spurious page faults can be ignored safely.  However, if the page fault
>> is for the write access, it's possible that a stale read-only TLB entry
>> exists in the local CPU and needs to be flushed on some architectures.
>> This is called the spurious page fault fixing.
>>
>> The spurious page fault fixing only makes sense during page fault
>> handling, so we don't need to do it for GUP.  In fact, I plan to avoid
>> it in all GUP paths in another followup patch.
>
> OK this is great, let's put it all in the kdoc for the new shared spurious
> faulting function! :) and additionally add it to the commit message.

Sure.  Will do it in the next version.

[snip]

>> >>
>> >> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> >> index 32e8457ad535..341622ec80e4 100644
>> >> --- a/include/linux/pgtable.h
>> >> +++ b/include/linux/pgtable.h
>> >> @@ -1232,6 +1232,10 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>> >>  #define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
>> >>  #endif
>> >>
>> >> +#ifndef flush_tlb_fix_spurious_fault_pmd
>> >> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, ptep) do { } while (0)
>> >> +#endif
>> >
>> > flush_tlb_fix_spurious_fault(), when the arch doesn't declare it, defaults to
>> > flush_tlb_page() - why do we just do nothing in this case here?
>>
>> Because all architectures do nothing for the spurious PMD page fault
>> fixing until the [2/2] of this series.  Where, we make it necessary to
>> flush the local TLB for spurious PMD page fault fixing on arm64
>> architecture.
>>
>> If we follow the design of flush_tlb_fix_spurious_fault(), we need to
>> change all architecture implementation to do nothing in this patch to
>> keep the current behavior.  I don't think that it's a good idea.  Do
>> you agree?
>
> Yeah probably we should keep the same behaviour as before, which is
> obviously, prior to this series, we did nothing.
>
> I guess in the PTE case we _always_ want to flush the TLB, whereas in the
> PMD case we otherwise don't have any need to at the point at which the
> spurious flush is performed.
>
> But from your explanation above re: the stale TLB entry this _only_ needs
> to be done for architectures which might encounter this problem rather than
> needing a TLB flush in general.
>
> Given we're generalising the code and one case always flushes the TLB and
> the other doesn't maybe it's worth putting a comment in the generalised
> function mentioning this?

I'm not sure whether it's a good idea to document architecture behaviors
in the general code.  The behavior may be changed architecture by
architecture in the future.

[snip]

---
Best Regards,
Huang, Ying

