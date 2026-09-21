Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBBC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NqgY6PswTEBy8Ql3ryxfhlIyJkIeEuwOW64TnavHIk=; b=IUNvoImvHrMja0iFORFbli1/rx
	LkfZtPYOrKkQWaB6/N6U97jgQ/wyRcgqQnQOjZv7LjLXd4Q5vAEovLsUfeiaGujEM6bI4uJRwxaj7
	u0pUMTCzNybBBGxvldyEN9Og6oOOwZ82D6hc0PBc9jUKrDWdkTgzAc7glJJvk/BjtFDPDE0o1IRDB
	pmsAw1C5e41ixM1hZI+xTtZllswzdUBunM+iUfImkbxzaW7OPctlCUXjq/tW35ruHpjWjbI50MZ1f
	AtD5pnt3c16gsy+mJklYjRNFYKkKWKZB2fjfz7do7DNNfjiHeZzycLRx3MPdZphu9DR/7shhFhiR8
	LRXae5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8enc-00000002MiK-0piZ;
	Mon, 21 Sep 2026 14:15:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8enZ-00000002Mhu-3V6N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:15:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9501E176C;
	Mon, 21 Sep 2026 07:15:08 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268103F86C;
	Mon, 21 Sep 2026 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790000112; bh=QrfcEyyCuOa4e/SO8MXzejyGVXjLsOvmYfYwjNB4neM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzD1Ge+NflcbXNe0vVMSkIpA82XGBhQIuxPaR/Rrr/joTBQOe/KzCT+Nx6Ar/8+KK
	 COwDKhH5V/4rCgZzZg5GNhk/1TSCmXMHoAJ0Bf8/mDJ6QVEk2Qy2j8YlDts0IDycIi
	 77p6JakMfoas8q4P+z48TE6wNlqnP4GM03RGBFnA=
Message-ID: <17c7ffbb-ed00-4c6d-b255-c77aff977721@arm.com>
Date: Mon, 21 Sep 2026 15:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/38] arm64: entry: Introduce entry specific exception
 masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-6-vladimir.murzin@arm.com>
 <77548d26-25b4-4e88-b902-bae52e520289@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <77548d26-25b4-4e88-b902-bae52e520289@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_071513_950094_6490F2E1 
X-CRM114-Status: GOOD (  25.07  )
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

On 9/17/26 10:53, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> The entry code handles interrupt masking differently from the rest of
>> the kernel. Exception handlers enter and exit with all exceptions
>> masked, but they must temporarily unmask the appropriate set of
>> exceptions so that the rest of the handler executes with the expected
>> exception state.
>>
>> For EL0 handlers, this means dropping to masking context appropriate
>> for the work to be performed. For EL1 handlers, this means restoring
>> the masking context of the interrupted task. In both cases, all
>> exceptions must be masked again before returning from the exception
>> handler.
>>
>> The rest of the kernel typically follows the opposite pattern: it
>> raises the masking context to protect a critical section and later
>> restores the previous context.
>>
>> Given these different usage patterns, introduce a dedicated set of
>> exception masking helpers for the entry code. Keeping these helpers
>> separate from the generic interrupt masking APIs makes the intended
>> usage explicit and helps avoid mixing the two masking models.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/interrupts/entry.h | 100 ++++++++++++++++++++++
>>  1 file changed, 100 insertions(+)
>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>
>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>> new file mode 100644
>> index 000000000000..0cfca62aa25b
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2025 Arm Ltd.
>> + */
>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>> +#define __ASM_INTERRUPTS_ENTRY_H
>> +
>> +#include <asm/arch_gicv3.h>
>> +#include <asm/bug.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/interrupts/common_flags.h>
>> +
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>> +						  arm64_exc_hwstate_t next)
>> +{
>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>> +	bool force;
>> +
>> +	arm64_debug_exc_hwstate(prev);
>> +
>> +	if (prev.flags == next.flags)
>> +		return next;
>> +
>> +	if (!irqs_disabled)
>> +		trace_hardirqs_on();
>> +
>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>> +
>> +	__arm64_update_exc_hwstate(next, force);
>> +
>> +	if (irqs_disabled)
>> +		trace_hardirqs_off();
>> +
>> +	return next;
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>> +{
>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
> Could it be renamed to a more intuitive name, such as
> arm64_exc_hwstate_of_regs()?
> 

Ack.

>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>> +
>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>> +		WARN_ON_ONCE(prev.daif < next.daif);
>> +
>> +		if (prev.daif == next.daif) {
>> +			/*
>> +			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
>> +			 */
>> +			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
>> +		}
> The if branch is a dead code now, we can remove it.
> 

Let compiler do the job :)

> arm64_drop_exc_context is only used directly in the context of
> el0t_64_error_handler below. It switches from ERROR_CONTEXT to
> PROCESS_CONTEXT.
> 

Such specialization goes against the idea of generalization. We don't
want to touch the helpers every time we decide to change a caller -
it's too much cognitive load to keep all these details in mind, and
they're easy to miss.

Thanks
Vladimir

> And now arm64_unmask_exc_context always switch from CRITICAL_CONTEXT
> to ERROR_CONTEXT/NONMI_CONTEXT/NOIRQ_CONTEXT/PROCESS_CONTEXT.
> 
> So there is no case where prev and next DAIF are the same.
> 
> 1009 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
> 1010 {
> 1011 >-------unsigned long esr = read_sysreg(esr_el1);
> 1012 >-------arm64_exc_hwstate_t hwstate;
> 1013 >-------irqentry_state_t state;
> 1014
> 1015 >-------arm64_enter_from_user_mode(regs);
> 1016 >-------hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
> 1017 >-------state = irqentry_nmi_enter(regs);
> 1018 >-------do_serror(regs, esr);
> 1019 >-------irqentry_nmi_exit(regs, state);
> 1020 >-------hwstate = arm64_drop_exc_context(hwstate, PROCESS_CONTEXT);
> 1021 >-------arm64_exit_to_user_mode(regs, hwstate);
> 1022 >-------arm64_debug_exc_context(CRITICAL_CONTEXT);
> 1023 }
> 1024
> 1025 asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
> 1026 {
> 1027 >-------__el0_error_handler_common(regs);
> 1028 }
> 
> 
>> +	}
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>> +
>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>> +		WARN_ON_ONCE(prev.daif > next.daif);
>> +
>> +		if (prev.daif == next.daif) {
>> +			/*
>> +			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
>> +			 */
>> +			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
>> +		}
>> +	}
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>> +
>> +	return arm64_drop_exc_context(prev, context);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
>> +{
>> +	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
>> +}
>> +
>> +#endif /* __ASM_INTERRUPTS_ENTRY_H */
> -- Best regards, Jinjie
> 


