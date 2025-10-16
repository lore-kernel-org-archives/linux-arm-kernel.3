Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77608CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgeHUBnnzn4F0XCj9WH4FTp3VMCD901IrDDVgd7Moos=; b=FYVPrYZ2uF/31w6059en3U0Ng0
	v3AqtmRQlxGz8vqG5uv5ILlk3Lgbyw544KWcB9Knbm4hGd7mrVXa1+5qP3GHlcDqjHZbiddNPGQEq
	jTlt/tnkOtOddrsEXEe74z7Ci8Lk6QNiU0GIGKwzA7EnVgLhqRsjscCPFqoHdHg8fa+tgYx/DIydA
	S/rY3KN4mH8yPT63w/FzSHBKKk/yZobDkiaj4RzC4OF/3nybYc5Z7dVuobrfPIN7mySDTUwrfnrEH
	lZHcbHI/U6qIZOknPE3gn78s9I9M9iHf1XMDwogfjQb2psDoylxwC5fJRk4vxhh38VxoaLKlxzwu2
	LV9Jpj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K1v-000000048hy-1xsq;
	Thu, 16 Oct 2025 09:12:15 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K1r-000000048gS-1X34
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760605927; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=fgeHUBnnzn4F0XCj9WH4FTp3VMCD901IrDDVgd7Moos=;
	b=oNeAWAdYxYZs9ysXbbNF/T0xflB58d7nDdUQwfFYc5L8dG85LowfDbXqI2ROe5MyTgJyrhLWWsITQ2sfVPy5DsrSlYIrmCWQGZd15db9wJcIPk/PKlB88ATB9CbTe80/ZKr8tcUKz8wnh+77Jt0hRb6kctVUrFUt9wNUlTVDutA=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqJqvSn_1760605925 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 16 Oct 2025 17:12:06 +0800
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
In-Reply-To: <3fc642be-b8f3-4fcb-b13c-3359cd52e921@lucifer.local> (Lorenzo
	Stoakes's message of "Thu, 16 Oct 2025 09:25:12 +0100")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-2-ying.huang@linux.alibaba.com>
	<4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
	<87ldlcpnbx.fsf@DESKTOP-5N7EMDA>
	<d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local>
	<87bjm7lh4u.fsf@DESKTOP-5N7EMDA>
	<3fc642be-b8f3-4fcb-b13c-3359cd52e921@lucifer.local>
Date: Thu, 16 Oct 2025 17:12:04 +0800
Message-ID: <87o6q7i523.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_021212_091268_DA229C36 
X-CRM114-Status: GOOD (  23.58  )
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

> On Thu, Oct 16, 2025 at 10:22:57AM +0800, Huang, Ying wrote:
>> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>>
>> > On Wed, Oct 15, 2025 at 04:43:14PM +0800, Huang, Ying wrote:
>> > OK this is great, let's put it all in the kdoc for the new shared spurious
>> > faulting function! :) and additionally add it to the commit message.
>>
>> Sure.  Will do it in the next version.
>
> Thanks!
>
>>
>> [snip]
>>
>> >> >>
>> >> >> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> >> >> index 32e8457ad535..341622ec80e4 100644
>> >> >> --- a/include/linux/pgtable.h
>> >> >> +++ b/include/linux/pgtable.h
>> >> >> @@ -1232,6 +1232,10 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>> >> >>  #define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
>> >> >>  #endif
>> >> >>
>> >> >> +#ifndef flush_tlb_fix_spurious_fault_pmd
>> >> >> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, ptep) do { } while (0)
>> >> >> +#endif
>> >> >
>> >> > flush_tlb_fix_spurious_fault(), when the arch doesn't declare it, defaults to
>> >> > flush_tlb_page() - why do we just do nothing in this case here?
>> >>
>> >> Because all architectures do nothing for the spurious PMD page fault
>> >> fixing until the [2/2] of this series.  Where, we make it necessary to
>> >> flush the local TLB for spurious PMD page fault fixing on arm64
>> >> architecture.
>> >>
>> >> If we follow the design of flush_tlb_fix_spurious_fault(), we need to
>> >> change all architecture implementation to do nothing in this patch to
>> >> keep the current behavior.  I don't think that it's a good idea.  Do
>> >> you agree?
>> >
>> > Yeah probably we should keep the same behaviour as before, which is
>> > obviously, prior to this series, we did nothing.
>> >
>> > I guess in the PTE case we _always_ want to flush the TLB, whereas in the
>> > PMD case we otherwise don't have any need to at the point at which the
>> > spurious flush is performed.
>> >
>> > But from your explanation above re: the stale TLB entry this _only_ needs
>> > to be done for architectures which might encounter this problem rather than
>> > needing a TLB flush in general.
>> >
>> > Given we're generalising the code and one case always flushes the TLB and
>> > the other doesn't maybe it's worth putting a comment in the generalised
>> > function mentioning this?
>>
>> I'm not sure whether it's a good idea to document architecture behaviors
>> in the general code.  The behavior may be changed architecture by
>> architecture in the future.
>
> Right, but we are unconditionaly doing a TLB flush in the PTE case but not PMD
> so let's document that to be clear :)

Sure.  Will do this.

>>
>> [snip]

---
Best Regards,
Huang, Ying

