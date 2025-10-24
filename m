Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29325CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3sXu4j8MfMq52gqBAavsMTcndSosYtjB52S1c8LUjs=; b=c//Kc/4+eeYHL0ZKDCpC8JhCHn
	4dKciv6ZaaDClkymj5d85mkyYCm8cFt69O/IDFZ17JUt665kmosG+JI5rtenDkkE0PXgJtUD6hbKR
	/yjEBz0GGMK77ZY/USUxbl73uXsp+oQUAJyKRAGuyyWy++cz6qlUgVRu7heVORV+iBP4P0S+wwj+Z
	x08j+gnCg8rNoMeU2duezlkd2L+NQN/d7BrTC1IjfFTaqHKivFHsZcoH+TopBa1iIUs8Z40ZKrQEl
	W3LI5pjuZ02somwc9Tpky04j7Bqyb5I1EJzSs9eBSxY2sx53c4DSml+tyN8HI/PLVx176u6LOUyL8
	VCUz9GQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGg2-00000009KMP-0Rep;
	Fri, 24 Oct 2025 12:13:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGfz-00000009KLY-1ilk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:13:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA231515;
	Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2833F66E;
	Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
Message-ID: <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
Date: Fri, 24 Oct 2025 14:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_051347_571601_EE9538B9 
X-CRM114-Status: GOOD (  24.21  )
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

On 23/10/2025 21:52, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> [...]
>>
>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>    followed by an immediate exit/rescheduling and some followed by a
>>    conditional exit. These functions assume that they are called
>>    with lazy MMU disabled and we cannot simply use pause()/resume()
>>    to address that. This patch leaves the situation unchanged by
>>    calling enable()/disable() in all cases.
>
> I'm confused, the function simply does
>
> (a) enables lazy mmu
> (b) does something on the page table
> (c) disables lazy mmu
> (d) does something expensive (split folio -> take sleepable locks,
>     flushes tlb)
> (e) go to (a)

That step is conditional: we exit right away if pte_offset_map_lock()
fails. The fundamental issue is that pause() must always be matched with
resume(), but as those functions look today there is no situation where
a pause() would always be matched with a resume().

Alternatively it should be possible to pause(), unconditionally resume()
after the expensive operations are done and then leave() right away in
case of failure. It requires restructuring and might look a bit strange,
but can be done if you think it's justified.

>
> Why would we use enable/disable instead?
>
>>
>> * x86/Xen is currently the only case where explicit handling is
>>    required for lazy MMU when context-switching. This is purely an
>>    implementation detail and using the generic lazy_mmu_mode_*
>>    functions would cause trouble when nesting support is introduced,
>>    because the generic functions must be called from the current task.
>>    For that reason we still use arch_leave() and arch_enter() there.
>
> How does this interact with patch #11? 

It is a requirement for patch 11, in fact. If we called disable() when
switching out a task, then lazy_mmu_state.enabled would (most likely) be
false when scheduling it again.

By calling the arch_* helpers when context-switching, we ensure
lazy_mmu_state remains unchanged. This is consistent with what happens
on all other architectures (which don't do anything about lazy_mmu when
context-switching). lazy_mmu_state is the lazy MMU status *when the task
is scheduled*, and should be preserved on a context-switch.

>
>>
>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>> definition to <asm/pgtable.h> to keep things building.
>
> I can see a call in __kernel_map_pages() and
> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>
> I guess that is ... harmless/irrelevant in the context of this series?

It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
this series; we're adding new calls to it from the generic layer, but
existing x86 calls shouldn't be affected.

- Kevin

