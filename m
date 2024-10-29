Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74FD5B865
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 02:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szb7B8TO5BGzKFYFcIcb5ldGoTFYeX87cqmy6dilJ0s=; b=TYJ4qiXTgLJfL5XVoSQycbFp3A
	eHHOi3ED3JohBOqay1glRhXSqjL/KKFiEBCOvJob/8yJgEAZ0Ok4i4gkPf1xNMteiw3JXeFcVU1Oi
	HFnGNRBb+Upc8kQSo3HHG77j6aRGUE/mY2ikLpfND9/SvuNg/zIwn9ORjQBjmUsT6ydMOP45nsbYD
	gXNpqn36kbVD3iIdiDOaqUnz5Y4kVVJSS6K9Gr/Cz0XPbGl1N4XzbSAd3l4rvnBl05oWA917PIxgj
	fLVdyqOyhp2kdCLh5kKpTDZRBbD3LWH+V50P4QWyCm+gSW0A3dwx5yKLxZfVgHuiXPGsPCzH8ctJ9
	2YB/DndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cDv-0000000D0cY-0HKO;
	Tue, 29 Oct 2024 02:44:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cBo-0000000D0B2-0nbu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 02:42:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XcvcZ4Y88z1T8fp;
	Tue, 29 Oct 2024 10:40:14 +0800 (CST)
Received: from kwepemd200013.china.huawei.com (unknown [7.221.188.133])
	by mail.maildlp.com (Postfix) with ESMTPS id AD9201402CC;
	Tue, 29 Oct 2024 10:42:23 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemd200013.china.huawei.com (7.221.188.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 29 Oct 2024 10:42:22 +0800
Message-ID: <908316ff-75b3-498a-86f8-1cdf1419800c@huawei.com>
Date: Tue, 29 Oct 2024 10:42:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: uprobes: Simulate STP for pushing fp/lr into user
 stack
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mhiramat@kernel.org>,
	<oleg@redhat.com>, <peterz@infradead.org>, <ast@kernel.org>,
	<puranjay@kernel.org>, <andrii@kernel.org>, <andrii.nakryiko@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
References: <20240910060407.1427716-1-liaochang1@huawei.com>
 <ZxpUX1rbppLqS0bD@J2N7QTR9R3.cambridge.arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <ZxpUX1rbppLqS0bD@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200013.china.huawei.com (7.221.188.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_194236_589844_B13403F8 
X-CRM114-Status: GOOD (  42.08  )
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



在 2024/10/24 22:06, Mark Rutland 写道:
> On Tue, Sep 10, 2024 at 06:04:07AM +0000, Liao Chang wrote:
>> This patch is the second part of a series to improve the selftest bench
>> of uprobe/uretprobe [0]. The lack of simulating 'stp fp, lr, [sp, #imm]'
>> significantly impact uprobe/uretprobe performance at function entry in
>> most user cases. Profiling results below reveals the STP that executes
>> in the xol slot and trap back to kernel, reduce redis RPS and increase
>> the time of string grep obviously.
>>
>> On Kunpeng916 (Hi1616), 4 NUMA nodes, 64 Arm64 cores@2.4GHz.
>>
>> Redis GET (higher is better)
>> ----------------------------
>> No uprobe: 49149.71 RPS
>> Single-stepped STP: 46750.82 RPS
>> Emulated STP: 48981.19 RPS
>>
>> Redis SET (larger is better)
>> ----------------------------
>> No uprobe: 49761.14 RPS
>> Single-stepped STP: 45255.01 RPS
>> Emulated stp: 48619.21 RPS
>>
>> Grep (lower is better)
>> ----------------------
>> No uprobe: 2.165s
>> Single-stepped STP: 15.314s
>> Emualted STP: 2.216s
> 
> The results for grep are concerning.
> 
> In theory, the overhead for stepping should be roughly double the
> overhead for emulating, assuming the exception-entry and
> exception-return are the dominant cost. The cost of stepping should be
> trivial.
> 
> Those results show emulating adds 0.051s (for a ~2.4% overhead), while
> stepping adds 13.149s (for a ~607% overhead), meaning stepping is 250x
> more expensive.

To provide more context, I set an uprobe at the grep_file() function from
the grep source code [1], which is likely on very hot path. I suspect that
the high frequency of uprobe traps contribute to the signficant overhead.
I'm not entirely certain about this, and I'll need to investigate further
to pinpoint the source of 13.149s.

https://github.com/brgl/busybox/blob/master/findutils/grep.c#L302

> 
> Was this tested bare-metal, or in a VM?

bare-metal.

> 
> AFAICT either:
> 
> * Single-stepping is unexpectedly expensive.
>  
>   Historically we had performance issues with hypervisor trapping of
>   debug features, and there are things we might be able to improve in
>   the hypervisor and kernel, which would improve stepping *all*
>   instructions.
>   
>   If stepping is the big problem, we could move uprobes over to a BRK
>   rather than a single-step. That would require require updating and
>   fixing the logic to decide which instructions are steppable, but
>   that's necessary anyway given it has extant soundness issues.

That's a very helpful input. I'll rerun the profiling in a VM.

> 
> * XOL management is absurdly expensive.
>  
>   Does uprobes keep the XOL slot around (like krpobes does), or does it
>   create the slot afresh for each trap?

As I know, it doesn't create a new slot for each trap. Instead, it grabs
an slot from a pre-allocated pool. I believe the cost of acquring a slot
from this pool is relatively low compared to creating a new one.

> 
>   If that's trying to create a slot afresh for each trap, there are
>   several opportunities for improvement, e.g. keep the slot around for
>   as long as the uprobe exists, or pre-allocate shared slots for common
>   instructions and use those.

I have sent a patch [2] that aimed to improve scalability of uprobe handling.
While that patch focuses on reduing the cacheline bouncing caused by atomic
operations when grabbing and releasing slot from a pool, I wouldn't say
this has a impact on grep, as it typically use a single thread for pattern
matching on my sytem.

[2] https://lore.kernel.org/all/20240927094549.3382916-1-liaochang1@huawei.com/

> 
> Mark.
> 
>>
>> Additionally, a profiling of the entry instruction for all leaf and
>> non-leaf function, the ratio of 'stp fp, lr, [sp, #imm]' is larger than
>> 50%. So simulting the STP on the function entry is a more viable option
>> for uprobe.
>>
>> In the first version [1], it used a uaccess routine to simulate the STP
>> that push fp/lr into stack, which use double STTR instructions for
>> memory store. But as Mark pointed out, this approach can't simulate the
>> correct single-atomicity and ordering properties of STP, especiallly
>> when it interacts with MTE, POE, etc. So this patch uses a more complex
>> and inefficient approach that acquires user stack pages, maps them to
>> kernel address space, and allows kernel to use STP directly push fp/lr
>> into the stack pages.
>>
>> xol-stp
>> -------
>> uprobe-nop      ( 1 cpus):    1.566 ± 0.006M/s  (  1.566M/s/cpu)
>> uprobe-push     ( 1 cpus):    0.868 ± 0.001M/s  (  0.868M/s/cpu)
>> uprobe-ret      ( 1 cpus):    1.629 ± 0.001M/s  (  1.629M/s/cpu)
>> uretprobe-nop   ( 1 cpus):    0.871 ± 0.001M/s  (  0.871M/s/cpu)
>> uretprobe-push  ( 1 cpus):    0.616 ± 0.001M/s  (  0.616M/s/cpu)
>> uretprobe-ret   ( 1 cpus):    0.878 ± 0.002M/s  (  0.878M/s/cpu)
>>
>> simulated-stp
>> -------------
>> uprobe-nop      ( 1 cpus):    1.544 ± 0.001M/s  (  1.544M/s/cpu)
>> uprobe-push     ( 1 cpus):    1.128 ± 0.002M/s  (  1.128M/s/cpu)
>> uprobe-ret      ( 1 cpus):    1.550 ± 0.005M/s  (  1.550M/s/cpu)
>> uretprobe-nop   ( 1 cpus):    0.872 ± 0.004M/s  (  0.872M/s/cpu)
>> uretprobe-push  ( 1 cpus):    0.714 ± 0.001M/s  (  0.714M/s/cpu)
>> uretprobe-ret   ( 1 cpus):    0.896 ± 0.001M/s  (  0.896M/s/cpu)
>>
>> The profiling results based on the upstream kernel with spinlock
>> optimization patches [2] reveals the simulation of STP increase the
>> uprobe-push throughput by 29.3% (from 0.868M/s/cpu to 1.1238M/s/cpu) and
>> uretprobe-push by 15.9% (from 0.616M/s/cpu to 0.714M/s/cpu).
>>
>> [0] https://lore.kernel.org/all/CAEf4BzaO4eG6hr2hzXYpn+7Uer4chS0R99zLn02ezZ5YruVuQw@mail.gmail.com/
>> [1] https://lore.kernel.org/all/Zr3RN4zxF5XPgjEB@J2N7QTR9R3/
>> [2] https://lore.kernel.org/all/20240815014629.2685155-1-liaochang1@huawei.com/
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  arch/arm64/include/asm/insn.h            |  1 +
>>  arch/arm64/kernel/probes/decode-insn.c   | 16 +++++
>>  arch/arm64/kernel/probes/decode-insn.h   |  1 +
>>  arch/arm64/kernel/probes/simulate-insn.c | 89 ++++++++++++++++++++++++
>>  arch/arm64/kernel/probes/simulate-insn.h |  1 +
>>  arch/arm64/kernel/probes/uprobes.c       | 21 ++++++
>>  arch/arm64/lib/insn.c                    |  5 ++
>>  7 files changed, 134 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>> index dd530d5c3d67..74e25debfa75 100644
>> --- a/arch/arm64/include/asm/insn.h
>> +++ b/arch/arm64/include/asm/insn.h
>> @@ -561,6 +561,7 @@ u32 aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
>>  				  u32 insn, u64 imm);
>>  u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
>>  					 u32 insn);
>> +u32 aarch64_insn_decode_ldst_size(u32 insn);
>>  u32 aarch64_insn_gen_branch_imm(unsigned long pc, unsigned long addr,
>>  				enum aarch64_insn_branch_type type);
>>  u32 aarch64_insn_gen_comp_branch_imm(unsigned long pc, unsigned long addr,
>> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
>> index be54539e309e..847a7a61ff6d 100644
>> --- a/arch/arm64/kernel/probes/decode-insn.c
>> +++ b/arch/arm64/kernel/probes/decode-insn.c
>> @@ -67,6 +67,22 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
>>  	return true;
>>  }
>>  
>> +bool aarch64_insn_is_stp_fp_lr_sp_64b(probe_opcode_t insn)
>> +{
>> +	/*
>> +	 * The 1st instruction on function entry often follows the
>> +	 * patten 'stp x29, x30, [sp, #imm]!' that pushing fp and lr
>> +	 * into stack.
>> +	 */
>> +	u32 opc = aarch64_insn_decode_ldst_size(insn);
>> +	u32 rt2 = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RT2, insn);
>> +	u32 rn = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, insn);
>> +	u32 rt = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RT, insn);
>> +
>> +	return aarch64_insn_is_stp_pre(insn) &&
>> +	       (opc == 2) && (rt2 == 30) && (rn == 31) && (rt == 29);
>> +}
>> +
>>  /* Return:
>>   *   INSN_REJECTED     If instruction is one not allowed to kprobe,
>>   *   INSN_GOOD         If instruction is supported and uses instruction slot,
>> diff --git a/arch/arm64/kernel/probes/decode-insn.h b/arch/arm64/kernel/probes/decode-insn.h
>> index 8b758c5a2062..033ccab73da6 100644
>> --- a/arch/arm64/kernel/probes/decode-insn.h
>> +++ b/arch/arm64/kernel/probes/decode-insn.h
>> @@ -29,5 +29,6 @@ arm_kprobe_decode_insn(kprobe_opcode_t *addr, struct arch_specific_insn *asi);
>>  #endif
>>  enum probe_insn __kprobes
>>  arm_probe_decode_insn(probe_opcode_t insn, struct arch_probe_insn *asi);
>> +bool aarch64_insn_is_stp_fp_lr_sp_64b(probe_opcode_t insn);
>>  
>>  #endif /* _ARM_KERNEL_KPROBES_ARM64_H */
>> diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
>> index 5e4f887a074c..3906851c07b2 100644
>> --- a/arch/arm64/kernel/probes/simulate-insn.c
>> +++ b/arch/arm64/kernel/probes/simulate-insn.c
>> @@ -8,6 +8,9 @@
>>  #include <linux/bitops.h>
>>  #include <linux/kernel.h>
>>  #include <linux/kprobes.h>
>> +#include <linux/highmem.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/mm.h>
>>  
>>  #include <asm/ptrace.h>
>>  #include <asm/traps.h>
>> @@ -211,3 +214,89 @@ simulate_nop(u32 opcode, long addr, struct pt_regs *regs)
>>  	 */
>>  	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
>>  }
>> +
>> +static inline
>> +bool stack_align_check(unsigned long sp)
>> +{
>> +	return (IS_ALIGNED(sp, 16) ||
>> +		!(read_sysreg(sctlr_el1) & SCTLR_EL1_SA0_MASK));
>> +}
>> +
>> +static inline
>> +void put_user_stack_pages(struct page **pages, int nr_pages)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < nr_pages; i++)
>> +		put_page(pages[i]);
>> +}
>> +
>> +static inline
>> +int get_user_stack_pages(long start, long end, struct page **pages)
>> +{
>> +	int ret;
>> +	int nr_pages = (end >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
>> +
>> +	ret = get_user_pages_fast(start, nr_pages,
>> +				  FOLL_WRITE | FOLL_FORCE, pages);
>> +	if (unlikely(ret != nr_pages)) {
>> +		if (ret > 0)
>> +			put_user_stack_pages(pages, ret);
>> +		return 0;
>> +	}
>> +
>> +	return nr_pages;
>> +}
>> +
>> +static inline
>> +void *map_user_stack_pages(struct page **pages, int nr_pages)
>> +{
>> +	if (likely(nr_pages == 1))
>> +		return kmap_local_page(pages[0]);
>> +	else
>> +		return vmap(pages, nr_pages, VM_MAP, PAGE_KERNEL);
>> +}
>> +
>> +static inline
>> +void unmap_user_stack_pages(void *kaddr, int nr_pages)
>> +{
>> +	if (likely(nr_pages == 1))
>> +		kunmap_local(kaddr);
>> +	else
>> +		vunmap(kaddr);
>> +}
>> +
>> +void __kprobes
>> +simulate_stp_fp_lr_sp_64b(u32 opcode, long addr, struct pt_regs *regs)
>> +{
>> +	long imm7;
>> +	long new_sp;
>> +	int nr_pages;
>> +	void *kaddr, *dst;
>> +	struct page *pages[2] = { NULL };
>> +
>> +	imm7 = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_7, opcode);
>> +	new_sp = regs->sp + (sign_extend64(imm7, 6) << 3);
>> +	if (!stack_align_check(new_sp)) {
>> +		force_sig(SIGSEGV);
>> +		goto done;
>> +	}
>> +
>> +	nr_pages = get_user_stack_pages(new_sp, regs->sp, pages);
>> +	if (!nr_pages) {
>> +		force_sig(SIGSEGV);
>> +		goto done;
>> +	}
>> +
>> +	kaddr = map_user_stack_pages(pages, nr_pages);
>> +	dst = kaddr + (new_sp & ~PAGE_MASK);
>> +	asm volatile("stp %0, %1, [%2]"
>> +		     : : "r"(regs->regs[29]), "r"(regs->regs[30]), "r"(dst));
>> +
>> +	unmap_user_stack_pages(kaddr, nr_pages);
>> +	put_user_stack_pages(pages, nr_pages);
>> +
>> +done:
>> +	regs->sp = new_sp;
>> +	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
>> +}
>> diff --git a/arch/arm64/kernel/probes/simulate-insn.h b/arch/arm64/kernel/probes/simulate-insn.h
>> index efb2803ec943..733a47ffa2e5 100644
>> --- a/arch/arm64/kernel/probes/simulate-insn.h
>> +++ b/arch/arm64/kernel/probes/simulate-insn.h
>> @@ -17,5 +17,6 @@ void simulate_tbz_tbnz(u32 opcode, long addr, struct pt_regs *regs);
>>  void simulate_ldr_literal(u32 opcode, long addr, struct pt_regs *regs);
>>  void simulate_ldrsw_literal(u32 opcode, long addr, struct pt_regs *regs);
>>  void simulate_nop(u32 opcode, long addr, struct pt_regs *regs);
>> +void simulate_stp_fp_lr_sp_64b(u32 opcode, long addr, struct pt_regs *regs);
>>  
>>  #endif /* _ARM_KERNEL_KPROBES_SIMULATE_INSN_H */
>> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
>> index d49aef2657cd..c70862314fde 100644
>> --- a/arch/arm64/kernel/probes/uprobes.c
>> +++ b/arch/arm64/kernel/probes/uprobes.c
>> @@ -8,6 +8,7 @@
>>  #include <asm/cacheflush.h>
>>  
>>  #include "decode-insn.h"
>> +#include "simulate-insn.h"
>>  
>>  #define UPROBE_INV_FAULT_CODE	UINT_MAX
>>  
>> @@ -31,6 +32,21 @@ unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
>>  	return instruction_pointer(regs);
>>  }
>>  
>> +static enum probe_insn
>> +arm_uprobe_decode_special_insn(probe_opcode_t insn, struct arch_probe_insn *api)
>> +{
>> +	/*
>> +	 * When uprobe interact with VMSA features, such as MTE, POE, etc, it
>> +	 * give up the simulation of memory access related instructions.
>> +	 */
>> +	if (!system_supports_mte() && aarch64_insn_is_stp_fp_lr_sp_64b(insn)) {
>> +		api->handler = simulate_stp_fp_lr_sp_64b;
>> +		return INSN_GOOD_NO_SLOT;
>> +	}
>> +
>> +	return INSN_REJECTED;
>> +}
>> +
>>  int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
>>  		unsigned long addr)
>>  {
>> @@ -44,6 +60,11 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
>>  
>>  	insn = *(probe_opcode_t *)(&auprobe->insn[0]);
>>  
>> +	if (arm_uprobe_decode_special_insn(insn, &auprobe->api)) {
>> +		auprobe->simulate = true;
>> +		return 0;
>> +	}
>> +
>>  	switch (arm_probe_decode_insn(insn, &auprobe->api)) {
>>  	case INSN_REJECTED:
>>  		return -EINVAL;
>> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
>> index b008a9b46a7f..0635219d2196 100644
>> --- a/arch/arm64/lib/insn.c
>> +++ b/arch/arm64/lib/insn.c
>> @@ -238,6 +238,11 @@ static u32 aarch64_insn_encode_ldst_size(enum aarch64_insn_size_type type,
>>  	return insn;
>>  }
>>  
>> +u32 aarch64_insn_decode_ldst_size(u32 insn)
>> +{
>> +	return (insn & GENMASK(31, 30)) >> 30;
>> +}
>> +
>>  static inline long label_imm_common(unsigned long pc, unsigned long addr,
>>  				     long range)
>>  {
>> -- 
>> 2.34.1
>>
> 

-- 
BR
Liao, Chang


