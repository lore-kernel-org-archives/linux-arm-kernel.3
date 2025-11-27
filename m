Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38BED11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5j7xH8fTEoSKbVxXFkE4YpsGUIr1lBxjhNUPeg+DYg=; b=IoUdGDjaAMbX56okO9G8Z4/9g6
	L+wJbGMKIElsaQwT7yBZjtXgTAJLW/T4BDSU5TvfztGAoXPe9/yFjWRlYzylznLNpD1gtz9MClz9T
	CRlDhFnlnEWa1imFEpeeqWPcxoNBm11QkHsJ7W28tgKeL1JbqzR+0YDz9qzRybVs1rvFjuV/dHMgL
	pLsOC+uqGkZYouWPtn16bD0o7/M6cAvtc41Qp7UntrLyrs2LCuXejxmkgfdULsqbYEFTmq4c+0nvJ
	+IihZSnaQy8bUXSLwWwL9kslDhTE7k99S6RK8L9Dt1lWOP7d5ke5c+4CzCvCCPB7Wujoye+ShgVov
	T5lw/AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObNd-0000000GaDw-2FaO;
	Thu, 27 Nov 2025 12:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObNa-0000000GaDS-20d3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:45:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C781477;
	Thu, 27 Nov 2025 04:45:36 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC00D3F73B;
	Thu, 27 Nov 2025 04:45:35 -0800 (PST)
Message-ID: <0cb512ba-de15-4ba6-a85a-8287ab67fb53@arm.com>
Date: Thu, 27 Nov 2025 13:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>
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
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_044546_646098_8BB3F413 
X-CRM114-Status: GOOD (  17.38  )
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

On 27/11/2025 13:33, Alexander Gordeev wrote:
> On Mon, Nov 24, 2025 at 01:22:24PM +0000, Kevin Brodsky wrote:
>
> Hi Kevin,
>
> ...
>> +/**
>> + * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
>> + *
>> + * Pauses the lazy MMU mode; if it is currently active, disables it and calls
>> + * arch_leave_lazy_mmu_mode().
>> + *
>> + * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
>> + * lazy_mmu_mode_* API have no effect until the matching resume() call.
> Sorry if it was discussed already - if yes, I somehow missed it. If I read
> the whole thing correctly enter()/pause() interleaving is not forbidden?

Correct, any call inside pause()/resume() is now allowed (but
effectively ignored). See discussion with Ryan in v4 [1].

[1]
https://lore.kernel.org/all/824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com/

> lazy_mmu_mode_enable()
> 	lazy_mmu_mode_pause()
> 		lazy_mmu_mode_enable()
> 		...
> 		lazy_mmu_mode_disable()
> 	lazy_mmu_mode_resume()
> lazy_mmu_mode_disable()
>
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_pause(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_leave_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
>> +
>> +	if (state->pause_count++ == 0 && state->enable_count > 0)
>> +		arch_leave_lazy_mmu_mode();
>>  }
>>  
>> +/**
>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
>                     resume() ?

Good catch! One copy-paste too many...

- Kevin

>> + *
>> + * Resumes the lazy MMU mode; if it was active at the point where the matching
>> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
>> + * arch_enter_lazy_mmu_mode().
>> + *
>> + * Must match a call to lazy_mmu_mode_pause().
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_resume(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +	if (--state->pause_count == 0 && state->enable_count > 0)
>> +		arch_enter_lazy_mmu_mode();
>>  }
> ...
> Thanks!

