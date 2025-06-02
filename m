Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2062C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+XEFxO/LtEnDQGgeRib3d+uqi8ybJrgpgJW2iCyhrA=; b=TmFeoMU5anvKx/
	OTk8YSigO9FUAt69uVjSMYsfOzG5V8vxDLGLcM6fdSejmjRERhSB7Lbe3/DDwP5HwuJ5MaiGRFFCg
	salacf/AuUal870vNKzRzGC8rKf4eDYyKkliN9rjmIw93UP9vKHRLOiBMU8twDQwh9iANd97sjch2
	LqgtvQuWaUJmSAt60SdHQ7QRAnPlE//Xo9toFQLY6aOwT8MTPLcvZjwQeYaEI6pBQvPpr19BdiY6c
	PlP4crohG1JYjElyQwkaPrL309wr5Xuxw0oogmuMlfNyJ8nMZB7QkWjHfiAZdtPn4x/vsnGdzFdss
	1Npc+sUP62Dy6bsjk63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8Eb-00000007uyk-1r1M;
	Mon, 02 Jun 2025 16:42:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8CO-00000007uqZ-2m1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 16:39:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 981E91424;
	Mon,  2 Jun 2025 09:39:23 -0700 (PDT)
Received: from [10.1.30.122] (e137867.arm.com [10.1.30.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83A063F5A1;
	Mon,  2 Jun 2025 09:39:38 -0700 (PDT)
Message-ID: <d6a141d8-8889-438f-a8a4-81d9ddf43b6b@arm.com>
Date: Mon, 2 Jun 2025 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] arm64: debug: call software break handlers
 statically
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-3-ada.coupriediaz@arm.com>
 <20250520153545.GB18901@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250520153545.GB18901@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_093944_799935_5444245E 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 20/05/2025 16:35, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:17PM +0100, Ada Couprie Diaz wrote:
>> diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
>> index be7a3680dadf..b27dd6028e6a 100644
>> --- a/arch/arm64/include/asm/kprobes.h
>> +++ b/arch/arm64/include/asm/kprobes.h
>> @@ -38,6 +38,12 @@ struct kprobe_ctlblk {
>>   void arch_remove_kprobe(struct kprobe *);
>>   int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
>>   void __kretprobe_trampoline(void);
>> +int __kprobes kprobe_brk_handler(struct pt_regs *regs,
>> +				 unsigned long esr);
>> +int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,
>> +				 unsigned long esr);
>> +int __kprobes kretprobe_brk_handler(struct pt_regs *regs,
>> +				 unsigned long esr);
>>   void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>>   
>>   #endif /* CONFIG_KPROBES */
> If you add these _after_ the #endif...
>
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
>> index 676fa0231935..4ece4a93b872 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -21,8 +21,11 @@
>>   #include <asm/cputype.h>
>>   #include <asm/daifflags.h>
>>   #include <asm/debug-monitors.h>
>> +#include <asm/kgdb.h>
>> +#include <asm/kprobes.h>
>>   #include <asm/system_misc.h>
>>   #include <asm/traps.h>
>> +#include <asm/uprobes.h>
>>   
>>   /* Determine debug architecture. */
>>   u8 debug_monitors_arch(void)
>> @@ -299,20 +302,50 @@ void unregister_kernel_break_hook(struct break_hook *hook)
>>   
>>   static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>>   {
>> -	struct break_hook *hook;
>> -	struct list_head *list;
>> -
>> -	list = user_mode(regs) ? &user_break_hook : &kernel_break_hook;
>> -
>> -	/*
>> -	 * Since brk exception disables interrupt, this function is
>> -	 * entirely not preemptible, and we can use rcu list safely here.
>> -	 */
>> -	list_for_each_entry_rcu(hook, list, node) {
>> -		if ((esr_brk_comment(esr) & ~hook->mask) == hook->imm)
>> -			return hook->fn(regs, esr);
>> +	if (user_mode(regs)) {
>> +#ifdef CONFIG_UPROBES
>> +		if (esr_brk_comment(esr) == UPROBES_BRK_IMM)
>> +			return uprobe_brk_handler(regs, esr);
>> +#endif
>> +		return DBG_HOOK_ERROR;
>>   	}
>>   
>> +	if (esr_brk_comment(esr) == BUG_BRK_IMM)
>> +		return bug_brk_handler(regs, esr);
>> +
>> +#ifdef CONFIG_CFI_CLANG
>> +	if (esr_is_cfi_brk(esr))
>> +		return cfi_brk_handler(regs, esr);
>> +#endif
>> +
>> +	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
>> +		return reserved_fault_brk_handler(regs, esr);
>> +
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
>> +		return kasan_brk_handler(regs, esr);
>> +#endif
>> +#ifdef CONFIG_UBSAN_TRAP
>> +	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
>> +		return ubsan_brk_handler(regs, esr);
>> +#endif
>> +#ifdef CONFIG_KGDB
>> +	if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
>> +		return kgdb_brk_handler(regs, esr);
>> +	if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
>> +		return kgdb_compiled_brk_handler(regs, esr);
>> +#endif
>> +#ifdef CONFIG_KPROBES
>> +	if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
>> +		return kprobe_brk_handler(regs, esr);
>> +	if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
>> +		return kprobe_ss_brk_handler(regs, esr);
>> +#endif
>> +#ifdef CONFIG_KRETPROBES
>> +	if (esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
>> +		return kretprobe_brk_handler(regs, esr);
>> +#endif
> ... then I think you can use IS_ENABLED() here instead of the #ifdefs.
> I didn't check everything, but the diff I was hacking on is below.
>
> Will
Oh, I didn't know about `IS_ENABLED()` !
I took the time to check that all the other functions are 
unconditionally declared
and test a few configs : it seems to be all good and it is much more 
readable than with the #ifdefs.

Thanks for the suggestion !
Ada


