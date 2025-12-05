Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A7DD2F7EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIPVyCSJgatZ7JLbD2Uja0xaWq0e923lFU6Qth2saH0=; b=jDYOOM9PqufrS9odgC71vZFuL/
	Wnuz8Mz5XENCoSxe6sv4nwB7rJQe+vdiSqg/GuDfk/aVgbWo5KHFlMrrJ4RIvaJ8bYD4301zeWSwm
	cruj80u2Jb2q5EvPJfDLDjjpGVI9v0DMcgYVaMh+ePlTWuWE9ihAjC8G1bu8k6uUEgUHDtGYCaWOB
	ptsLT5mZf4bDI5P+DdET1uP/jH9LQdEKRBMLjDsdy8sYWTfAJrUxZco2N4spdhlCgRdfXsYRSwopb
	WuN8IC57CxIBFu2H8M6sRwhNDkta9SrZ7oH5yEBtFvzmTlxPeIQHddARwiaVVZrhKmnRH6umu6Rn9
	+Jat18vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVDc-00000009Ujx-2d1R;
	Fri, 05 Dec 2025 12:47:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVDZ-00000009UjX-3svI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:47:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD460339;
	Fri,  5 Dec 2025 04:47:15 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5F6D3F86F;
	Fri,  5 Dec 2025 04:47:15 -0800 (PST)
Message-ID: <573881f1-60f7-4eb3-a484-1df4858aa1b4@arm.com>
Date: Fri, 5 Dec 2025 13:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] mm: introduce generic lazy_mmu helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-7-kevin.brodsky@arm.com>
 <e43c147f-bff8-462a-88dc-4345500f4ed7@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <e43c147f-bff8-462a-88dc-4345500f4ed7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_044726_080236_2A4657DE 
X-CRM114-Status: GOOD (  21.10  )
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

On 04/12/2025 05:17, Anshuman Khandual wrote:
> On 24/11/25 6:52 PM, Kevin Brodsky wrote:
>> The implementation of the lazy MMU mode is currently entirely
>> arch-specific; core code directly calls arch helpers:
>> arch_{enter,leave}_lazy_mmu_mode().
>>
>> We are about to introduce support for nested lazy MMU sections.
>> As things stand we'd have to duplicate that logic in every arch
>> implementing lazy_mmu - adding to a fair amount of logic
>> already duplicated across lazy_mmu implementations.
>>
>> This patch therefore introduces a new generic layer that calls the
>> existing arch_* helpers. Two pair of calls are introduced:
>>
>> * lazy_mmu_mode_enable() ... lazy_mmu_mode_disable()
>>     This is the standard case where the mode is enabled for a given
>>     block of code by surrounding it with enable() and disable()
>>     calls.
>>
>> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>>     This is for situations where the mode is temporarily disabled
>>     by first calling pause() and then resume() (e.g. to prevent any
>>     batching from occurring in a critical section).
>>
>> The documentation in <linux/pgtable.h> will be updated in a
>> subsequent patch.
>>> No functional change should be introduced at this stage.
>> The implementation of enable()/resume() and disable()/pause() is
>> currently identical, but nesting support will change that.
>>
>> Most of the call sites have been updated using the following
>> Coccinelle script:
>>
>> @@
>> @@
>> {
>> ...
>> - arch_enter_lazy_mmu_mode();
>> + lazy_mmu_mode_enable();
>> ...
>> - arch_leave_lazy_mmu_mode();
>> + lazy_mmu_mode_disable();
>> ...
>> }
>>
>> @@
>> @@
>> {
>> ...
>> - arch_leave_lazy_mmu_mode();
>> + lazy_mmu_mode_pause();
>> ...
>> - arch_enter_lazy_mmu_mode();
>> + lazy_mmu_mode_resume();
>> ...
>> }
> At this point arch_enter/leave_lazy_mmu_mode() helpers are still
> present on a given platform but now being called from new generic
> helpers lazy_mmu_mode_enable/disable(). Well except x86, there is
> direct call sites for those old helpers.

Indeed, see notes below regarding x86. The direct calls to arch_flush()
are specific to x86 and there shouldn't be a need for a generic abstraction.

- Kevin

> arch/arm64/include/asm/pgtable.h:static inline void arch_enter_lazy_mmu_mode(void)
> arch/arm64/include/asm/pgtable.h:static inline void arch_leave_lazy_mmu_mode(void)
>
> arch/arm64/mm/mmu.c:    lazy_mmu_mode_enable();
> arch/arm64/mm/pageattr.c:       lazy_mmu_mode_enable();
>
> arch/arm64/mm/mmu.c:    lazy_mmu_mode_disable();
> arch/arm64/mm/pageattr.c:       lazy_mmu_mode_disable();
>
>> A couple of notes regarding x86:
>>
>> * Xen is currently the only case where explicit handling is required
>>   for lazy MMU when context-switching. This is purely an
>>   implementation detail and using the generic lazy_mmu_mode_*
>>   functions would cause trouble when nesting support is introduced,
>>   because the generic functions must be called from the current task.
>>   For that reason we still use arch_leave() and arch_enter() there.
>>
>> * x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>>   places, but only defines it if PARAVIRT_XXL is selected, and we
>>   are removing the fallback in <linux/pgtable.h>. Add a new fallback
>>   definition to <asm/pgtable.h> to keep things building.
>>
>> [...]

