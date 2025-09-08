Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2C7CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRchr8pA8KC0RWN0Y1UtmU8dNv+O/thXnplqZUD9t1U=; b=Q4EdC6Pi7TMgWnIkaPl9FRieCk
	XdRCKH/TUtNKipvlPdVUMJLEfCDuaSB8srZttaValrWN+l0agWMzkDw26QRdXe+6rrqTJbHKI7GSm
	fVgNstdxQyGCb+QLzp40izMdv/zIg9RRrLYxog3v6CGH85lxAtLYT6F0ogK9N178vnMEl57JYMBvp
	0bJiFkRceva7asNEnHoTVj5ZSqtbF6GULYj4VFgB47JkQJdY+6ppOmiIhJ/e3ob1BNoIXeJOnxw7m
	hblHUVn9EN7vcp6C1hYmiAfNu8unvIK+NfsB2ZoD+zD/C65j6+L00KcuO5ZdBNvwQ7JXNE5cCsRJg
	8enyKmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviDL-000000026gA-3Dta;
	Mon, 08 Sep 2025 20:11:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvepD-00000000mRo-26J2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:34:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 581001692;
	Mon,  8 Sep 2025 09:34:30 -0700 (PDT)
Received: from [10.57.91.39] (unknown [10.57.91.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C9E13F694;
	Mon,  8 Sep 2025 09:34:36 -0700 (PDT)
Message-ID: <d7cd4004-bacf-47b0-9cd8-f99125e02238@arm.com>
Date: Mon, 8 Sep 2025 17:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, Dev Jain <dev.jain@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <e722e49a-d982-4b58-98f7-6fef3d0a4468@arm.com>
 <dd242f5b-8bbe-48e8-8d5f-be6a835a8841@arm.com>
 <aeb76956-f980-417f-b4e7-fe0503bb5a2b@os.amperecomputing.com>
 <612940d2-4c8e-459c-8d7d-4ccec08fce0a@os.amperecomputing.com>
 <1471ea27-386d-4950-8eaa-8af7acf3c34a@arm.com>
 <f8cf1823-1ee9-4935-9293-86f58a9e2224@arm.com>
 <bf1aa0a4-08de-443f-a1a3-aa6c05bab38c@os.amperecomputing.com>
 <39c2f841-9043-448d-b644-ac96612d520a@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <39c2f841-9043-448d-b644-ac96612d520a@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093439_618098_65D8133D 
X-CRM114-Status: GOOD (  43.16  )
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

On 04/09/2025 22:49, Yang Shi wrote:
> 
> 
> On 9/4/25 10:47 AM, Yang Shi wrote:
>>
>>
>> On 9/4/25 6:16 AM, Ryan Roberts wrote:
>>> On 04/09/2025 14:14, Ryan Roberts wrote:
>>>> On 03/09/2025 01:50, Yang Shi wrote:
>>>>>>>>
>>>>>>>> I am wondering whether we can just have a warn_on_once or something for the
>>>>>>>> case
>>>>>>>> when we fail to allocate a pagetable page. Or, Ryan had
>>>>>>>> suggested in an off-the-list conversation that we can maintain a cache
>>>>>>>> of PTE
>>>>>>>> tables for every PMD block mapping, which will give us
>>>>>>>> the same memory consumption as we do today, but not sure if this is
>>>>>>>> worth it.
>>>>>>>> x86 can already handle splitting but due to the callchains
>>>>>>>> I have described above, it has the same problem, and the code has been
>>>>>>>> working
>>>>>>>> for years :)
>>>>>>> I think it's preferable to avoid having to keep a cache of pgtable memory
>>>>>>> if we
>>>>>>> can...
>>>>>> Yes, I agree. We simply don't know how many pages we need to cache, and it
>>>>>> still can't guarantee 100% allocation success.
>>>>> This is wrong... We can know how many pages will be needed for splitting
>>>>> linear
>>>>> mapping to PTEs for the worst case once linear mapping is finalized. But it
>>>>> may
>>>>> require a few hundred megabytes memory to guarantee allocation success. I
>>>>> don't
>>>>> think it is worth for such rare corner case.
>>>> Indeed, we know exactly how much memory we need for pgtables to map the linear
>>>> map by pte - that's exactly what we are doing today. So we _could_ keep a
>>>> cache.
>>>> We would still get the benefit of improved performance but we would lose the
>>>> benefit of reduced memory.
>>>>
>>>> I think we need to solve the vm_reset_perms() problem somehow, before we can
>>>> enable this.
>>> Sorry I realise this was not very clear... I am saying I think we need to fix it
>>> somehow. A cache would likely work. But I'd prefer to avoid it if we can find a
>>> better solution.
>>
>> Took a deeper look at vm_reset_perms(). It was introduced by commit
>> 868b104d7379 ("mm/vmalloc: Add flag for freeing of special permsissions"). The
>> VM_FLUSH_RESET_PERMS flag is supposed to be set if the vmalloc memory is RO
>> and/or ROX. So set_memory_ro() or set_memory_rox() is supposed to follow up
>> vmalloc(). So the page table should be already split before reaching vfree().
>> I think this why vm_reset_perms() doesn't not check return value.

If vm_reset_perms() is assuming it can't/won't fail, I think it should at least
output a warning if it does?

>>
>> I scrutinized all the callsites with VM_FLUSH_RESET_PERMS flag set. 

Just checking; I think you made a comment before about there only being a few
sites that set VM_FLUSH_RESET_PERMS. But one of them is the helper,
set_vm_flush_reset_perms(). So just making sure you also followed to the places
that use that helper?

>> The most
>> of them has set_memory_ro() or set_memory_rox() followed. 

And are all callsites calling set_memory_*() for the entire cell that was
allocated by vmalloc? If there are cases where it only calls that for a portion
of it, then it's not gurranteed that the memory is correctly split.

>> But there are 3
>> places I don't see set_memory_ro()/set_memory_rox() is called.
>>
>> 1. BPF trampoline allocation. The BPF trampoline calls
>> arch_protect_bpf_trampoline(). The generic implementation does call
>> set_memory_rox(). But the x86 and arm64 implementation just simply return 0.
>> For x86, it is because execmem cache is used and it does call
>> set_memory_rox(). ARM64 doesn't need to split page table before this series,
>> so it should never fail. I think we just need to use the generic
>> implementation (remove arm64 implementation) if this series is merged.

I know zero about BPF. But it looks like the allocation happens in
arch_alloc_bpf_trampoline(), which for arm64, calls bpf_prog_pack_alloc(). And
for small sizes, it grabs some memory from a "pack". So doesn't this mean that
you are calling set_memory_rox() for a sub-region of the cell, so that doesn't
actually help at vm_reset_perms()-time?

>>
>> 2. BPF dispatcher. It calls execmem_alloc which has VM_FLUSH_RESET_PERMS set.
>> But it is used for rw allocation, so VM_FLUSH_RESET_PERMS should be
>> unnecessary IIUC. So it doesn't matter even though vm_reset_perms() fails.
>>
>> 3. kprobe. S390's alloc_insn_page() does call set_memory_rox(), x86 also
>> called set_memory_rox() before switching to execmem cache. The execmem cache
>> calls set_memory_rox(). I don't know why ARM64 doesn't call it.
>>
>> So I think we just need to fix #1 and #3 per the above analysis. If this
>> analysis look correct to you guys, I will prepare two patches to fix them.

This all seems quite fragile. I find it interesting that vm_reset_perms() is
doing break-before-make; it sets the PTEs as invalid, then flushes the TLB, then
sets them to default. But for arm64, at least, I think break-before-make is not
required. We are only changing the permissions so that can be done on live
mappings; essentially change the sequence to; set default, flush TLB.

If we do that, then if the memory was already default, then there is no need to
do anything (so no chance of allocation failure). If the memory was not default,
then it must have already been split to make it non-default, in which case we
can also gurrantee that no allocations are required.

What am I missing?

Thanks,
Ryan


> 
> Tested the below patch with bpftrace kfunc (allocate bpf trampoline) and
> kprobes. It seems work well.
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/
> kprobes.c
> index 0c5d408afd95..c4f8c4750f1e 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -10,6 +10,7 @@
> 
>  #define pr_fmt(fmt) "kprobes: " fmt
> 
> +#include <linux/execmem.h>
>  #include <linux/extable.h>
>  #include <linux/kasan.h>
>  #include <linux/kernel.h>
> @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>  static void __kprobes
>  post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
> 
> +void *alloc_insn_page(void)
> +{
> +       void *page;
> +
> +       page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> +       if (!page)
> +               return NULL;
> +       set_memory_rox((unsigned long)page, 1);
> +       return page;
> +}
> +
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
>         kprobe_opcode_t *addr = p->ainsn.xol_insn;
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 52ffe115a8c4..3e301bc2cd66 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2717,11 +2717,6 @@ void arch_free_bpf_trampoline(void *image, unsigned int
> size)
>         bpf_prog_pack_free(image, size);
>  }
> 
> -int arch_protect_bpf_trampoline(void *image, unsigned int size)
> -{
> -       return 0;
> -}
> -
>  int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
>                                 void *ro_image_end, const struct btf_func_model *m,
>                                 u32 flags, struct bpf_tramp_links *tlinks,
> 
> 
>>
>> Thanks,
>> Yang
>>
>>>
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>> Thanks,
>>>>>> Yang
>>>>>>
>>>>>>> Thanks,
>>>>>>> Ryan
>>>>>>>
>>>>>>>
>>
> 


