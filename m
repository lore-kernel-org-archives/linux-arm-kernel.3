Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CBACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BUIVBWzSEg5HnaNi8EEWsgRtlWmX6rseREfNx4QEYE=; b=DDcnz1E5/ARVZvmR0Rvy2h1M2q
	svof3UhVS6vfFUzxWZGYs/LalzxBTm+GFLcZUbJg7d3kJaeUyyi5lsdo/7me/lZw/yMulhARPR2EZ
	tA0TNz7cQiPKLKFYpX5bRtmqicRU7SxlpE/EhtyE1Ak+b/NYW2Cp/dMS1qh+w35pUn69GaYbjwDWe
	RVTofEFDcUSob3SDwFLtEq3WHm5iAzv5ZJns5fkQIWtNJ7zLSn3z8oSgBDwoeEWdUP8mPTuL+wwOp
	fBsUBzelxlLjd94CR9hWZNZ19wW+sY9Momz18henViNgKISeUIIURA9GoPYfpkc9Ff0ayIaiRrirl
	wYeaqV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxav-0000000FLtq-385H;
	Thu, 06 Nov 2025 10:51:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxat-0000000FLtJ-0f5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:51:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A081596;
	Thu,  6 Nov 2025 02:51:45 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6866A3F63F;
	Thu,  6 Nov 2025 02:51:46 -0800 (PST)
Message-ID: <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
Date: Thu, 6 Nov 2025 10:51:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
 <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_025155_322036_EC287833 
X-CRM114-Status: GOOD (  18.38  )
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

On 05/11/2025 16:12, Alexander Gordeev wrote:
> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>> + * currently enabled.
>>>   */
>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>  static inline void lazy_mmu_mode_enable(void)
>>>  {
>>> -	arch_enter_lazy_mmu_mode();
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>> +	/* enable() must not be called while paused */
>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>> +
>>> +	if (state->nesting_level++ == 0) {
>>> +		state->active = true;
>>> +		arch_enter_lazy_mmu_mode();
>>> +	}
>>>  }
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
> Do you have some scenario in mind that could cause an issue?
> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

I'm not sure I understand the issue either.

>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>>  -	arch_enter_lazy_mmu_mode();
>>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>  +
>>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>  +	/* enable() must not be called while paused */
>>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>  +
>>  +	if (state->nesting_level++ == 0) {
>>  +		arch_enter_lazy_mmu_mode();
>>  +		state->active = true;
>>  +	}
>>   }
>>
>> ... I think it make more sense to enable the state after the arch_**
>> call right.
> But then in_lazy_mmu_mode() would return false if called from
> arch_enter_lazy_mmu_mode(). Not big problem, but still..

The ordering of nesting_level/active was the way you expected in v3, but
the conclusion of the discussion with David H [1] is that it doesn't
really matter so I simplified the ordering in v4 - the arch hooks
shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
arch_enter()/arch_leave() shouldn't need it anyway since they're called
once per outer section (not in nested sections). arch_flush() could
potentially do something different when nested, but that seems unlikely.

- Kevin

[1]
https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/


