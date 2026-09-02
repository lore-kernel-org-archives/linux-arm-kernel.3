Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B56AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LORGKtEmjojKlKzUAL6AcL3FZ1dzN7SRP7UvYdmDE2I=; b=2OCw1VrYhYcBW7RwAOD/h59Nzh
	z4W41WUuxxCKQOr9aUg7kDPr+jpggJvue+NoK3lEE0oBnmjXdNsLcqhL/V0MYBopQLvQ9tG4IcsA0
	/0/KWA0eK1XZu9LZUyOwOvGkQLsusCY/rQvKd9sKrRABXG0lG+SsLY45kGYM4l9lws9otaQAsV/Yi
	cq8gSxPKgJGr2VOi7G0KfG2L+EZKZtT6Vrx/pTqBOIgsjiMN/L4GEtby+BbMseyP3aXU9fj5echQv
	h2qJ6/4n7YXH0t894UgKUsp7SRxgD5LHs+nphN2GqCE3OWWnBNFPLyLZmbwqjEAZDxvvEzLmRYG+c
	JDriCbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lsZ-0000000Evut-3NUZ;
	Wed, 02 Sep 2026 14:23:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lsX-0000000Evu5-2vqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:23:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03455165C;
	Wed,  2 Sep 2026 07:23:48 -0700 (PDT)
Received: from [10.1.34.165] (e121487-lin.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669D23F882;
	Wed,  2 Sep 2026 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788359031; bh=OerhqSxd1xyENhpWH7nbLflrBECJlBgy0uR0tCnVTRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5NaqTUvSbfmyi5QSM7kw1SCtiGgmNbut93K3BQXM0NlrcsCCkyVsONpAN11Q8Vba
	 c1OvglbUQOPZ3i6o8edKY7XL14X+oZBbK2UFp3pkM9i3/bQx12rsG3wJsLDCII3Hia
	 VQ9d9+u76qC33feiFv4NyidJkFrdnbwAd+1iE7tI=
Message-ID: <73f3c180-1915-42be-ba21-86e8f07f8bb1@arm.com>
Date: Wed, 2 Sep 2026 15:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific
 exception masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-15-vladimir.murzin@arm.com>
 <c2c67794-a65c-4c63-b94b-cdb7e99bd92b@huawei.com>
 <928dbd54-19ff-498f-a49c-23bdeccc589e@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <928dbd54-19ff-498f-a49c-23bdeccc589e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_072353_941306_00D04E00 
X-CRM114-Status: GOOD (  14.80  )
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

On 8/29/26 03:34, Jinjie Ruan wrote:
> 
> 在 2026/7/28 17:29, Jinjie Ruan 写道:
>>
>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>
>>> The entry code handles interrupt masking differently from the rest of
>>> the kernel. Exception handlers enter and exit with all exceptions
>>> masked, but they must temporarily unmask the appropriate set of
>>> exceptions so that the rest of the handler executes with the expected
>>> exception state.
>>>
>>> For EL0 handlers, this means dropping to masking context appropriate
>>> for the work to be performed. For EL1 handlers, this means restoring
>>> the masking context of the interrupted task. In both cases, all
>>> exceptions must be masked again before returning from the exception
>>> handler.
>>>
>>> The rest of the kernel typically follows the opposite pattern: it
>>> raises the masking context to protect a critical section and later
>>> restores the previous context.
>>>
>>> Given these different usage patterns, introduce a dedicated set of
>>> exception masking helpers for the entry code. Keeping these helpers
>>> separate from the generic interrupt masking APIs makes the intended
>>> usage explicit and helps avoid mixing the two masking models.
>>>
>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>> ---
>>>  arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
>>>  1 file changed, 113 insertions(+)
>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>
>>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>>> new file mode 100644
>>> index 000000000000..d66eb5d633f0
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>>> @@ -0,0 +1,113 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2025 Arm Ltd.
>>> + */
>>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>>> +#define __ASM_INTERRUPTS_ENTRY_H
>>> +
>>> +#include <asm/arch_gicv3.h>
>>> +#include <asm/bug.h>
>>> +#include <asm/cpufeature.h>
>>> +#include <asm/interrupts/common_flags.h>
>>> +
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>> +						  arm64_exc_hwstate_t next)
>> may be const arm64_exc_hwstate_t next
>>
>>> +{
>>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>>> +	bool force;
>>> +
>>> +	arm64_debug_exc_hwstate(prev);
>>> +
>>> +	if (prev.flags == next.flags)
>>> +		return next;
>>> +
>>> +	if (!irqs_disabled)
>>> +		trace_hardirqs_on();
>>> +
>>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>>> +
>>> +	__arm64_update_exc_hwstate(next, force);
>>> +
>>> +	if (irqs_disabled)
>>> +		trace_hardirqs_off();
>>> +
>>> +	return next;
>> We do not update next; it should be "void".
> Hi Vladimir,
> 
> What do you think?

I have no strong opinion, TBH. It is done that way to make it
interchangeable with the wrappers around it. For instance, the
arm64_inherit_exc_context() wrapper can be easily replaced with
the bare version:

__arm64_switch_exc_hwstate_to(arm64_exc_hwstate_of_context(CRITICAL_CONTEXT),
			      arm64_inherit_exc_hwstate(regs))

yes, it is less readable (and it is the reason we have wrappers),
but functionally equivalent.

I'm happy to change it if people feel strongly about it.

Cheers
Vladimir


