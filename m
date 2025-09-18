Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B169CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XK2IhyKZnZW9qeR5LuEW76gdLYeK5oITDYIZuRfy8cw=; b=FGz3/gw9p3jB9lNyKTWePfOsCB
	f+owGoQ/zOmbGE8cnOqq42Lo6EePg6TKTNjF3pT2rGS9AA3k9oP/bT6mXrTxuIK9+oL115N3kXN5D
	SWAy4KOyNqONPZBMSjV8CqxmYwbc3+DYj9ONVDs4kAZrSFhB2qde4YRh3L2WDmG3dyC5LRirjph8T
	uemH8Opp8VoJYbEjIz0CPUzf7OZ3thePs62NaJRdtQQeagIkd1588sXdFRw98sQm2qNurfeRKAM0D
	7XzesB3a4U+k7u10nZUFEHkLVyDpmzQStliNuAyYyw49WJhjgsBcY6y1sfeqj14nwpvwUZ0cmt7oV
	qXV6jufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGaF-00000000Nly-3R99;
	Thu, 18 Sep 2025 15:30:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGaD-00000000NlL-0wCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:30:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 474C3176C;
	Thu, 18 Sep 2025 08:29:56 -0700 (PDT)
Received: from [10.1.33.171] (XHFQ2J9959.cambridge.arm.com [10.1.33.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563263F66E;
	Thu, 18 Sep 2025 08:30:02 -0700 (PDT)
Message-ID: <960fbbba-8018-4e42-b1fd-6ed96c148007@arm.com>
Date: Thu, 18 Sep 2025 16:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: kprobes: call set_memory_rox() for kprobe
 page
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-6-yang@os.amperecomputing.com>
 <aMv_nhEuCSHKp5J6@arm.com>
 <22732cbe-20f8-4d1e-b086-e34d0f9bbb35@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <22732cbe-20f8-4d1e-b086-e34d0f9bbb35@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083005_395297_9201C51B 
X-CRM114-Status: GOOD (  22.67  )
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

On 18/09/2025 16:05, Yang Shi wrote:
> 
> 
> On 9/18/25 5:48 AM, Catalin Marinas wrote:
>> On Wed, Sep 17, 2025 at 12:02:11PM -0700, Yang Shi wrote:
>>> The kprobe page is allocated by execmem allocator with ROX permission.
>>> It needs to call set_memory_rox() to set proper permission for the
>>> direct map too. It was missed.
>>>
>>> And the set_memory_rox() guarantees the direct map will be split if it
>>> needs so that set_direct_map calls in vfree() won't fail.
>>>
>>> Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/
>>> kprobes.c
>>> index 0c5d408afd95..c4f8c4750f1e 100644
>>> --- a/arch/arm64/kernel/probes/kprobes.c
>>> +++ b/arch/arm64/kernel/probes/kprobes.c
>>> @@ -10,6 +10,7 @@
>>>     #define pr_fmt(fmt) "kprobes: " fmt
>>>   +#include <linux/execmem.h>
>>>   #include <linux/extable.h>
>>>   #include <linux/kasan.h>
>>>   #include <linux/kernel.h>
>>> @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>>>   static void __kprobes
>>>   post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs
>>> *);
>>>   +void *alloc_insn_page(void)
>>> +{
>>> +    void *page;
>> Nit: I'd call this 'addr'. 'page' makes me think of a struct page.
> 
> Sure.
> 
>>
>>> +
>>> +    page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>>> +    if (!page)
>>> +        return NULL;
>>> +    set_memory_rox((unsigned long)page, 1);
>> It's unfortunate that we change the attributes of the ROX vmap first to
>> RO, then to back to ROX so that we get the linear map changed. Maybe
>> factor out some of the code in change_memory_common() to only change the
>> linear map.
> 
> I want to make sure I understand you correctly, you meant set_memory_rox()
> should do:
> 
> change linear map to RO (call a new helper, for example, set_direct_map_ro())
> change vmap to ROX (call change_memory_common())
> 
> Is it correct?
> 
> If so set_memory_ro() should do the similar thing.
> 
> And I think we should have the cleanup patch separate from this bug fix patch
> because the bug fix patch should be applied to -stable release too. Keeping it
> simpler makes the backport easier.
> 
> Shall I squash the cleanup patch into patch #1?


Personally I think we should drop this patch from the series and handle it
separately.

We worked out that the requirement is to either never call set_memory_*() or to
call set_memory_*() for the entire vmalloc'ed range prior to optionally calling
set_memory_*() for a sub-range in order to guarrantee vm_reset_perms() works
correctly.

Given this is only allocating a single page, it is impossible to call
set_memory_*() for a sub-range. So the requirement is met.

I agree it looks odd/wrong to have different permissions in the linear map vs
the vmap but that is an orthogonal bug that can be fixed separately.

What do you think?

Thanks,
Ryan


> 
> Thanks,
> Yang
> 
>>
>> Otherwise it looks fine.
>>
> 


