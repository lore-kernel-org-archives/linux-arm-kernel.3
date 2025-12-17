Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D27D65C77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNCYahkh/fcmBqFzNzZ6qSdYyO44Ef+U9jbV1jmR+8Y=; b=Qeve29O0nBZjL5zcwOQk6plDeC
	tekVE4qASC/LfGZtnWvIIwLCskzhsfJ1ss1q9oYqCQdLcD75U3nNuxjj0jBwv3u7QNrH9ETVfzMjB
	7GWXs7InOLAe0zcEIAw89pxE3I3bFCxpRb/jA+YYKwC3iAPiUBk/Kyjro1V9qQzpuGhGbaI4mxJPU
	zzwjTZdICKe44fgOaiclB/PGlrBaOFWxQCiRU/ZZscLTlq2yfNuoLPhgKcYrUeewuNY4OufpeN6Ne
	tyqHzYLjNKG6q1+in+jkU8vtSk3fnSGEo0rjOUrbkCrOFnPEGGmEUKGoeYW0cVZHRI787lW5s/mja
	Q2nKwqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVu76-0000000741m-3MOy;
	Wed, 17 Dec 2025 16:10:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVu74-0000000741N-15OD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:10:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70ACCFEC;
	Wed, 17 Dec 2025 08:10:45 -0800 (PST)
Received: from [10.57.47.3] (unknown [10.57.47.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E837B3F5CA;
	Wed, 17 Dec 2025 08:10:44 -0800 (PST)
Message-ID: <799bdcb5-cb18-4b7a-b33f-bea1553f3650@arm.com>
Date: Wed, 17 Dec 2025 17:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
 <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
 <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
 <87a4zhkt6h.ritesh.list@gmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <87a4zhkt6h.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_081054_419622_AC3CB4E9 
X-CRM114-Status: GOOD (  17.84  )
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

On 17/12/2025 16:46, Ritesh Harjani (IBM) wrote:
> Ryan Roberts <ryan.roberts@arm.com> writes:
>
>> On 17/12/2025 09:26, Kevin Brodsky wrote:
>>> On 17/12/2025 05:14, Andrew Morton wrote:
>>>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>>>
>>>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>>>> ensure that it appears active when it should, depending on how
>>>>> enable/disable and pause/resume pairs are nested.
>>>> I needed this for powerpc allmodconfig;
>>>>
>>>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>>>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>>>> @@ -30,6 +30,7 @@
>>>>  #include <trace/events/thp.h>
>>>>  
>>>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>>>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>>>  
>>>>  /*
>>>>   * A linux PTE was changed and the corresponding hash table entry
>>>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>>>  		flush_hash_range(i, local);
>>>>  	batch->index = 0;
>>>>  }
>>>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>>>  
>>>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>>>  {
>>>> _
>>> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
>>> refer to those symbols on powerpc... Maybe a bit overkill to export
>>> those just for a test module, but I'm not sure there's a good
>>> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
>>> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.
>> Does EXPORT_SYMBOL_IF_KUNIT() help?
>>
> yes, that make sense. Thanks for the suggestion!
> I guess we will need a diff like this in that case -
>
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index fbdeb8981ae7..ec2941cec815 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -25,11 +25,12 @@
>  #include <asm/tlb.h>
>  #include <asm/bug.h>
>  #include <asm/pte-walk.h>
> -
> +#include <kunit/visibility.h>
>  
>  #include <trace/events/thp.h>
>  
>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
> +EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch);
>  
>  /*
>   * A linux PTE was changed and the corresponding hash table entry
> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
>                 flush_hash_range(i, local);
>         batch->index = 0;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending);
>  
>  void hash__tlb_flush(struct mmu_gather *tlb)
>  {
> diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
> index 2720eb995714..340d7cda9096 100644
> --- a/mm/tests/lazy_mmu_mode_kunit.c
> +++ b/mm/tests/lazy_mmu_mode_kunit.c
> @@ -69,3 +69,4 @@ kunit_test_suite(lazy_mmu_mode_test_suite);
>  
>  MODULE_DESCRIPTION("Tests for the lazy MMU mode");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Indeed, that's pretty much what I was about to send :)

- Kevin

