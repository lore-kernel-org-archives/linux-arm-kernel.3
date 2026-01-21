Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B0C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQlphm0aZ0LI3nckK4gkA94JRPY/PapSXEl1mwsykiE=; b=vwEbNjDElCUzVxkL+oyB9kCBss
	2jjkAUcMVGYFCPHaYq6g8+WmOfN+pKtMhQ+kvJahkw2demcBd2Frh4FnIfGGrXOh7PYBj5HEyvWrV
	eLRqZqhuHij38xfH8L4g97eViu6kVymEZdzZ5DZJJLbzQu1wheyF2S9hPFEh6lbReCVeg5b3pqjU+
	V3yEJGcS47/b5dtRFZ4VT2P/AR5sT5VDJXFysP70zuX9bay3ZMFfNFW5tLzf45bPHxScauD+FatDQ
	N4e6ll/KwQpTry59YTMy/0uNlCrQ4rJClABF2IoohcvQDPYRiZgfw/Nkk5GNbCHqQDeFmufqkk+kp
	6qkpqd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVKf-00000005Guz-3MeU;
	Wed, 21 Jan 2026 10:21:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVKd-00000005Gua-26Fm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:21:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17BC51476;
	Wed, 21 Jan 2026 02:20:51 -0800 (PST)
Received: from [10.1.25.175] (XHFQ2J9959.cambridge.arm.com [10.1.25.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B4003F740;
	Wed, 21 Jan 2026 02:20:54 -0800 (PST)
Message-ID: <ee2bf4ba-0121-44dc-a465-4c186dc18f19@arm.com>
Date: Wed, 21 Jan 2026 10:20:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while splitting
 the linear mapping
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Yang Shi <yang@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 catalin.marinas@arm.com, akpm@linux-oundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 chaitanyas.prakash@arm.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 jackmanb@google.com, vbabka@suse.cz, mhocko@suse.com
References: <aW5p1ylQBNXTEmmq@willie-the-truck>
 <aW6hISBu3hNYS771@e129823.arm.com>
 <2619166b-13ef-4daa-82c7-1d44035a8d6c@arm.com>
 <aW9LCX92T9t8iDco@e129823.arm.com>
 <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
 <aW-k_D1Q8jpYMPoI@willie-the-truck>
 <a6c1f21f-43e4-41d2-adb6-c5f9985b3abd@arm.com>
 <aW+t8S1LfwX3LjRi@e129823.arm.com>
 <11a01f4e-9ae5-4001-9f9c-74a746f898cd@arm.com>
 <02bb61cc-f0be-41e5-b8b2-59768afd5254@os.amperecomputing.com>
 <aXCPHaylUbRJ3CME@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aXCPHaylUbRJ3CME@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_022059_623825_227940D1 
X-CRM114-Status: GOOD (  31.50  )
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

On 21/01/2026 08:32, Yeoreum Yun wrote:
>>>> My concern is that if a secondary CPU can race and cause a split, that is
>>>> unsound because we have determined that although the primary CPU supports BBML2,
>>>> at least one of the secondary CPUs does not. So splitting a live mapping is unsafe.
>>>>
>>>> I just had a brief chat with Rutland, and he agrees that this _could_ be a
>>>> problem. Basically there is a window between onlining the secondary cpus and
>>>> entering the stop_machine() where one of those cpus _could_ end up doing
>>>> something that causes us to split the linear map.
>>
>> If I remember correctly, split_kernel_leaf_mapping() does call
>> system_supports_bbml2_noabort() before doing real split. So we basically
>> should fall into two categories:
>>
>> 1. bbml2_noabort is supported on all cpus. Everything is fine.
>> 2. bbml2_noabort is not supported on all cpus. split_kernel_leaf_mapping()
>> just returns 0. Kernel doesn't split page table, so there won't be TLB
>> conflict issue. But the following page prot update may see unexpected block
>> mapping, then a   WARN  will be raised and it will return -EINVAL. So the
>> worst case is the caller will fail (IIRC all the callers of set_memory_*()
>> handle the failure), and we can know who is trying to change linear mapping
>> before the linear mapping gets                    finalized. AFAICT I
>> haven't seen such WARN yet.

Ahh good point! So this isn't quite as terrible as I was thinking.

> 
> Thanks for the great detail :)
> I've missed system_supports_bbml2_noabort() in split_kernel_leaf_mapping().
> 
>>
>>>>
>>>> I'm not immediately sure how to solve that.
>>
>> Do we need some synchronization mechanism? If the linear mapping is not
>> finalized yet, split_kernel_leaf_mapping() will spin. For example, something
>> like this off the top of my head,
>>
>> DEFINE_STATIC_KEY_FALSE(linear_mapping_finalized);
>>
>> Once the linear mapping is finalized, we can call
>> static_branch_enable(&linear_mapping_finalized);
>>
>> In split_kernel_leaf_mapping(), we can just do:
>>
>> retry:
>>     if (!static_branch_likely(&linear_mapping_finalized))
>>         goto retry;
>>

Yuck... But I guess it might work as long as the primary thread never does
anything that would cause an attempt to split; otherwise we have a deadlock.

>>
>> There may be better way to handle it. But this case should be very unlikely
>> IMHO. It sounds crazy to have such complicated kernel threads run so early.
>> I'm not sure whether we should pay immediate attention to it or not.

I think we need to figure out if this is actually possible. We bring up the
secondary cpus, set system caps and finalize the linear map in smp_init().
That's called from kernel_init_freeable() which is called from kernel_init(),
which is invoked as a thread pinned to the boot cpu.

sched_init_smp() is called after smp_init() (i.e. after the linear map is
finalized). I'm guessing (based on the name of sched_init_smp()) that nothing
other than the idle thread will run on any secondaries until after
sched_init_smp() is called? (I'd be greatful if anyone can confirm that).

Rutland suggested that it's probably too early for any PM type stuff to be
running in the idle loop, so based on all of that, perhaps this is not a problem
after all and there is basically zero chance of a secondary cpu doing anything
that could cause a linear map split during this window?

I'm inclined to leave this as is for now.

Thanks,
Ryan

> 
> Thinking about it again, I’m not sure whether
> it is acceptable to use a sleepable synchronization mechanism at this stage,
> like split_kernel_leaf_mapping() does with mutex_lock()
> (even though it may be technically possible).
> It also feels odd that this function can be called at this point in time.
> 
> If this is indeed considered problematic,
> I think it would be better to simply return -EINVAL immediately
> when linear_mapping_finalized has not yet been completed.
> 
> --
> Sincerely,
> Yeoreum Yun


