Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B00CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCjmppFrEkfW27at5Tw7hdbaaeCwkxbhpSbepynfi98=; b=r875jmZ7Iq8CDJlQLzPjmLI5bc
	/GUM1j4BCR/Aatt80n3FTktW3SXNm6uWwSJvNTK0khnYh/OLiNmeDM5LSqdtQKKohU/NZl5YZHz0U
	NJ0Dq/w3eYkn8r0XRinAFarly/g1hPUWm6MgY6rIfLVCMJPnh1V7yMZ4tDTUqaIlMhiVPDR9TvUa1
	SD/M5pELbO8rc7TQn3Yzb0/c+KM8Q0HPEQLn6TfTy1utgei2wEiApwRLNuUChhjY8GGP3JoDrIoL7
	Wz9+3Ud25lSHVpQVqS9hMc7hmui3SRyQH+CgOiRKD7ozLm9PHqScg+vH5LLeqzq07rfkp7KXluM1D
	zVG0ujog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKPS-0000000HB0y-2Ka6;
	Fri, 07 Nov 2025 11:13:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKPP-0000000HAzY-2dmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:13:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 802C51477;
	Fri,  7 Nov 2025 03:13:24 -0800 (PST)
Received: from [10.1.36.52] (unknown [10.1.36.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21B713F63F;
	Fri,  7 Nov 2025 03:13:28 -0800 (PST)
Message-ID: <84dab8b1-ea28-4dcc-9721-9aaa6fcd12ba@arm.com>
Date: Fri, 7 Nov 2025 11:13:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
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
 <87ikfn3yvs.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87ikfn3yvs.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031335_793389_3EA19468 
X-CRM114-Status: GOOD (  20.50  )
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

On 06/11/2025 16:32, Ritesh Harjani (IBM) wrote:
> Alexander Gordeev <agordeev@linux.ibm.com> writes:
>
>> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>>> + * currently enabled.
>>>>   */
>>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>>  static inline void lazy_mmu_mode_enable(void)
>>>>  {
>>>> -	arch_enter_lazy_mmu_mode();
>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>>> +	/* enable() must not be called while paused */
>>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>>> +
>>>> +	if (state->nesting_level++ == 0) {
>>>> +		state->active = true;
>>>> +		arch_enter_lazy_mmu_mode();
>>>> +	}
>>>>  }
>>> Some architectures disables preemption in their
>>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
>> Do you have some scenario in mind that could cause an issue?
>>
> No not really. But that's a deviation from what previous arch hooks were
> expecting. Although thinking this through - I don't have any usecase
> where this can be a problem.

Which arch hook expectations are you referring to?

> But let me re-visit some of the code paths on ppc64 lazy mmu... 
>
> Looking at the arch specific usecase I see we always do get_cpu_var()
> for accessing the per-cpu batch array which disables preemption before
> accessing the per-cpu structure.. This per-cpu structure is where we
> batch pte updates...

arch_enter() disables preemption so accesses to per-CPU variables
anywhere in the section shouldn't be an issue either way.

The bigger picture (regarding patch 9) is that what in_lazy_mmu_state()
returns is based on the current task's state (not a per-CPU variable),
and always false while in interrupt. As a result whether preemption is
disabled or not should make no difference, only program order matters.

- Kevin

> For e.g... 
>   
>     arch_enter_lazy_mmu_mode()
>         hpte_need_flush()
>             get_cpu_var()   // this takes care of preempt_disable() 
>             adds vpns to per-cpu batch[i]
>             put_cpu_var()   // 
>     arch_leave_lazy_mmu_mode()
>
>> IOW, what could go wrong if the process is scheduled to another
>> CPU before preempt_disable() is called?
> So from above - I don't think your sequence to update
>    state->active = true 
> before calling arch_enter hook should be a problem.
> Based on above this looks mostly ok to me.
>
> -ritesh

