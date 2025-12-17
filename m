Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF27D65521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpa2rhDPjPOei7xhJfHDGmklb1GOZ+SO0ChmZ0J+oe4=; b=xl2Ulg8xXjduzI50MrhlVcMnGb
	/Wn9iTyeSMwfPdOFLnJrV+KUDwrGQH8g0lji57AfJwiCvB9jnyWQeAfZ70RZB7yn/dya65iQUQBNe
	XOmHTOLc90R08ait7J1uPodMK0UXmT3qg2SJyeO+c7WCBMK3kpJlTYc2ZZH32Rtt6WYE+eJ9thFZc
	gvSi1YIRci2lVudknSxiyylm1KOFdEefpjOymcmqKwLDkOjZyC5bLQYFh1oNiKpMe/K+m0oSgUVmn
	6AYV/69BjzzdPJ0AZr/bzyAcG7sa2bZK8rARO7Fm5zHb1cmeKePsOXc7KFKdLEzOt3Fq6zMcEp9mZ
	rZUf0hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnvh-00000006R9v-0Wil;
	Wed, 17 Dec 2025 09:34:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnvM-00000006QnF-3IQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:34:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9305914BF;
	Wed, 17 Dec 2025 01:34:16 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 894773F73B;
	Wed, 17 Dec 2025 01:34:17 -0800 (PST)
Message-ID: <100cc8da-b826-4fc2-a624-746bf6fb049d@arm.com>
Date: Wed, 17 Dec 2025 09:34:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] introduce pagetable_alloc_nolock()
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, catalin.marinas@arm.com,
 will@kernel.org, kevin.brodsky@arm.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <916c17ba-22b1-456e-a184-cb3f60249af7@arm.com>
 <aUGOPd7gNRf1xHEc@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aUGOPd7gNRf1xHEc@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013425_036933_EC586AD1 
X-CRM114-Status: GOOD (  33.73  )
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

On 16/12/2025 16:52, Yeoreum Yun wrote:
> Hi Ryan,
> 
>> On 12/12/2025 16:18, Yeoreum Yun wrote:
>>> Some architectures invoke pagetable_alloc() or __get_free_pages()
>>> with preemption disabled.
>>> For example, in arm64, linear_map_split_to_ptes() calls pagetable_alloc()
>>> while spliting block entry to ptes and __kpti_install_ng_mappings()
>>> calls __get_free_pages() to create kpti pagetable.
>>>
>>> Under PREEMPT_RT, calling pagetable_alloc() with
>>> preemption disabled is not allowed, because it may acquire
>>> a spin lock that becomes sleepable on RT, potentially
>>> causing a sleep during page allocation.
>>>
>>> Since above two functions is called as callback of stop_machine()
>>> where its callback is called in preemption disabled,
>>> They could make a potential problem. (sleeping in preemption disabled).
>>>
>>> To address this, introduce pagetable_alloc_nolock() API.
>>
>> I don't really understand what the problem is that you're trying to fix. As I
>> see it, there are 2 call sites in arm64 arch code that are calling into the page
>> allocator from stop_machine() - one via via pagetable_alloc() and another via
>> __get_free_pages(). But both of those calls are passing in GFP_ATOMIC. It was my
>> understanding that the page allocator would ensure it never sleeps when
>> GFP_ATOMIC is passed in, (even for PREEMPT_RT)?
> 
> Although GFP_ATOMIC is specify, it only affects of "water mark" of the
> page with __GFP_HIGH. and to get a page, it must grab the lock --
> zone->lock or pcp_lock in the rmqueue().
> 
> This zone->lock and pcp_lock is spin_lock and it's a sleepable in
> PREEMPT_RT that's why the memory allocation/free using general API
> except nolock() version couldn't be called since
> if "contention" happens they'll sleep while waiting to get the lock.
> 
> The reason why "nolock()" can use, it always uses "trylock" with
> ALLOC_TRYLOCK flags. otherwise GFP_ATOMIC also can be sleepable in
> PREEMPT_RT.
> 
>>
>> What is the actual symptom you are seeing?
> 
> Since the place where called while smp_cpus_done() and there seems no
> contention, there seems no problem. However as I mention in another
> thread
> (https://lore.kernel.org/all/aT%2FdrjN1BkvyAGoi@e129823.arm.com/),
> This gives a the false impression --
> GFP_ATOMIC are “safe to use in preemption disabled”
> even though they are not in PREEMPT_RT case, I've changed it.
> 
>>
>> If the page allocator is somehow ignoring the GFP_ATOMIC request for PREEMPT_RT,
>> then isn't that a bug in the page allocator? I'm not sure why you would change
>> the callsites? Can't you just change the page allocator based on GFP_ATOMIC?
> 
> It doesn't ignore the GFP_ATOMIC feature:
>   - __GFP_HIGH: use water mark till min reserved
>   - __GFP_KSWAPD_RECLAIM: wake up kswapd if reclaim required.
> 
> But, it's a restriction -- "page allocation / free" API cannot be called
> in preempt-disabled context at PREEMPT_RT.
> 
> That's why I think it's wrong usage not a page allocator bug.

I've taken a look at this and I agree with your analysis. Thanks for explaining.

Looking at other stop_machine() callbacks, there are some that call printk() and
I would assume that spinlocks could be taken there which may present the same
kind of issue or PREEMPT_RT? (I'm guessing). I don't see any others that attempt
to allocate memory though.

Anyway, to fix the 2 arm64 callsites, I see 2 possible approaches:

- Call the nolock variant (as you are doing). But that would just convert a
deadlock to a panic; if the lock is held when stop_machine() runs, without your
change, we now have a deadlock due to waiting on the lock inside stop_machine().
With your change, we notice the lock is already taken and panic. I guess it is
marginally better, but not by much. Certainly I would just _always_ call the
nolock variant regardless of PREEMPT_RT if we take this route; For !PREEMPT_RT,
the lock is guarranteed to be free so nolock will always succeed.

- Preallocate the memory before entering stop_machine(). I think this would be
much more robust. For kpti_install_ng_mappings() I think you could hoist the
allocation/free out of stop_machine() and pass the pointer in pretty easily. For
linear_map_split_to_ptes() its a bit more complex; Perhaps, we need to walk the
pgtable to figure out how much to preallocate, allocate it, then set it up as a
special allocator, wrapped by an allocation function and modify the callchain to
take a callback function instead of gfp flags.

What do you think?

Thanks,
Ryan

> 
> [...]
> 
> --
> Sincerely,
> Yeoreum Yun


