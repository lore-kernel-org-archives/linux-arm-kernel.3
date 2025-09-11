Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047EECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4KuZTZsXU0ugaI7cID3g5r9oTH3zieIMz1tYktcbHY=; b=MBQ6B1J956wYC0NuuTRc9AMojU
	2jPR6wtzSN79vhbiXIt2ZybqyL/pEPifQ1hvwFRSOSJEB44ZBPjr+pgr1A2qSIgcCp3QB2C2njHDh
	Q8ie+pob2L49yIIwLN4EOFrctGJ654ClYKGF4l84iLybdOktEZjnTDSLwVFi9WKM/646hjgqQD+UO
	M926M2oRA4/IUIcN9jccHyRqIDFQziQMWQ1dRB6NHXjGqirIh+pjzPs0AasM592OCz6orM/U7no3j
	hDpmV3XVTuEwnv8qN8+phdlqsXyJ375S1ZHLurbpzDPuM+yqr0if5EuCejLcrrHBc+xq19Gz4swmS
	F85/9nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk24-00000004ACN-2pgd;
	Thu, 11 Sep 2025 16:20:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk21-00000004A9t-2zWQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:20:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43CB1756;
	Thu, 11 Sep 2025 09:20:12 -0700 (PDT)
Received: from [10.57.70.14] (unknown [10.57.70.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462913F694;
	Thu, 11 Sep 2025 09:20:14 -0700 (PDT)
Message-ID: <076c7f16-fe56-49a8-910e-7d71d3f8f0b4@arm.com>
Date: Thu, 11 Sep 2025 18:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
 <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
 <80be36e5-d6e1-4b37-a1ca-47e92ac21b02-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <80be36e5-d6e1-4b37-a1ca-47e92ac21b02-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_092021_837318_D0B99FD0 
X-CRM114-Status: GOOD (  28.54  )
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

On 11/09/2025 14:06, Alexander Gordeev wrote:
> On Wed, Sep 10, 2025 at 06:11:54PM +0200, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> On 09/09/2025 16:38, Alexander Gordeev wrote:
>>>>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>>>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>>>>> want to use it - at least that is how I read the description above.
>>>>>>
>>>>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>>>>> that do not follow this pattern, and it looks as a problem to me.
>>>> This discussion also made me realise that this is problematic, as the
>>>> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
>>>> convenience, not for generic code (where lazy_mmu_state_t should ideally
>>>> be an opaque type as mentioned above). It almost feels like the kasan
>>>> case deserves a different API, because this is not how enter() and
>>>> leave() are meant to be used. This would mean quite a bit of churn
>>>> though, so maybe just introduce another arch-defined value to pass to
>>>> leave() for such a situation - for instance,
>>>> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
>>> What about to adjust the semantics of apply_to_page_range() instead?
>>>
>>> It currently assumes any caller is fine with apply_to_pte_range() to
>>> enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
>>> not fine at all and must leave the lazy mode. That literally suggests
>>> the original assumption is incorrect.
>>>
>>> We could change int apply_to_pte_range(..., bool create, ...) to e.g.
>>> apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
>>> that simply skips entering the lazy mmu mode.
>> This is pretty much what Ryan proposed [1r] some time ago, although for
>> a different purpose (avoiding nesting). There wasn't much appetite for
>> it then, but I agree that this would be a more logical way to go about it.
>>
>> - Kevin
>>
>> [1r]
>> https://lore.kernel.org/all/20250530140446.2387131-4-ryan.roberts@arm.com/
> May be I missing the point, but I read it as an opposition to the whole
> series in general and to the way apply_to_pte_range() would be altered
> in particular:
>
>  static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>
> The idea of instructing apply_to_page_range() to skip the lazy mmu mode
> was not countered. Quite opposite, Liam suggested exactly the same:

Yes that's a fair point. It would be sensible to post a new series
trying to eliminate the leave()/enter() calls in mm/kasan as you
suggested. Still I think that it makes sense to define an API to handle
that situation ("pausing" lazy_mmu), as discussed with David H.

- Kevin

>
> <quote>
> Could we do something like the pgtbl_mod_mask or zap_details and pass
> through a struct or one unsigned int for create and lazy_mmu?
>
> These wrappers are terrible for readability and annoying for argument
> lists too.
>
> Could we do something like the pgtbl_mod_mask or zap_details and pass
> through a struct or one unsigned int for create and lazy_mmu?
>
> At least we'd have better self-documenting code in the wrappers.. and if
> we ever need a third boolean, we could avoid multiplying the wrappers
> again.
> <quote>
>
> Thanks!

