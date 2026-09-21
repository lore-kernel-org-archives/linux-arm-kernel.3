Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98532C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iILC5xME/b0sfeA5z8m4n3H3q1QyP/rlc3rI+i8SQHU=; b=YnOHGv5auK2VKJ6v1YJQFYlCX4
	B1wW3leivH9Drx4g2J8wShVE9kbT22EKb4qlld2aRmCl1Fxf81ZoAvgFa4uCP/ktymYPXTXTqJHnI
	qHLogi8dHEcP1xUsfQOjtxAgIuyiSrpMehepY2mag7iD/vgVUXYjdKChCJugSNiUtEx9hBGnbDOWj
	NCT0W6890ZaIGdSe6oDPiUojTnoilGLgOSPmF5G+7ba+hQvk5HojV91vXLpooyIqP0ahpWZCX8CT5
	q1xjwuQkSC+eF3bzc3U9S6p3NmfXbyERbTxBA0X+yftC45Ewdx3mfgV7/GiaHXifMWj1BmbcQDbw6
	+ZWNg7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ea4-00000002JwR-0dOK;
	Mon, 21 Sep 2026 14:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eZy-00000002JvK-3beR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:01:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 184411D13;
	Mon, 21 Sep 2026 07:01:04 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E233F528;
	Mon, 21 Sep 2026 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999267; bh=K7Yz+xXlTDKQwFd3K9tXJFvftMjPzQS4ZumX5Km0aC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=so+jMAiVGK5T07Kq6QDOP+bhCFnJGODmCPcwlOOvoEqrsb5jvDxxG7lPdYA4/qQQw
	 zegcNyDs+3uQTbNPl6VFR2fIF5dxqqDNdi+6fnbiOS9LqrHBuDEGYLolhgHEmNhfin
	 +uPUUhEMkTUeBD5bJ02cmbBotGj7mYGDpJk0jULE=
Message-ID: <874c20c9-3aeb-4057-a699-16654982c8b9@arm.com>
Date: Mon, 21 Sep 2026 15:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/38] arm64: entry: replace DAIF helpers with entry
 helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-7-vladimir.murzin@arm.com>
 <15bc779f-e6f5-4c2a-a629-cb020f12a41a@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <15bc779f-e6f5-4c2a-a629-cb020f12a41a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070110_991362_399FAC1B 
X-CRM114-Status: GOOD (  19.28  )
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

On 9/16/26 10:34, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Replace all uses of the `local_daif_...` helpers in `entry-common.c`
>> with the new entry-specific exception masking helpers.
>>
>> Also replace `local_irq_disable()` with a switch to NOIRQ context
>> using the new helpers. This provides:
>>
>> - consistency checks for hardware state
>> - a unified style for managing exception context
>>
>> Now that both the irqflags API and entry code handle DAIF and PMR
>> correctly, remove `GIC_PRIO_PSR_I_SET` from the PMR value set by
>> `kernel_entry` in `entry.S` and by `init_gic_priority_masking()` in
>> `kernel/smp.c`.
>>
>> The `local_daif_...` helpers and other specialized code still use
>> `GIC_PRIO_PSR_I_SET` for now; this commit does not change their
>> behavior.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/entry-common.c | 258 ++++++++++++++++++++-----------
>>  arch/arm64/kernel/entry.S        |   2 +-
>>  arch/arm64/kernel/smp.c          |   2 +-
>>  3 files changed, 173 insertions(+), 89 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 72c03ccea59f..fd0bfead6e70 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -18,11 +18,11 @@
>>  #include <linux/thread_info.h>
>>  
>>  #include <asm/cpufeature.h>
>> -#include <asm/daifflags.h>
>>  #include <asm/esr.h>
>>  #include <asm/exception.h>
>>  #include <asm/fpsimd.h>
>>  #include <asm/irq_regs.h>
>> +#include <asm/interrupts/entry.h>
>>  #include <asm/kprobes.h>
>>  #include <asm/mmu.h>
>>  #include <asm/processor.h>
>> @@ -53,9 +53,10 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
>>   * instrumentable code, or any code which may trigger an exception.
>>   */
>>  static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
>> -						irqentry_state_t state)
>> +						irqentry_state_t state,
>> +						arm64_exc_hwstate_t hwstate)
>>  {
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
>>  	mte_check_tfsr_exit();
>>  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>>  }
>> @@ -64,22 +65,24 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
>>   * We are returning from the context which allows involuntary kernel preemption
>>   */
>>  static void noinstr arm64_exit_to_kernel_mode_preempt(struct pt_regs *regs,
>> -						      irqentry_state_t state)
>> +						      irqentry_state_t state,
>> +						      arm64_exc_hwstate_t hwstate)
>>  {
>>  	irqentry_exit_to_kernel_mode_preempt(regs, state);
>> -	__arm64_exit_to_kernel_mode(regs, state);
>> +	__arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>> -					      irqentry_state_t state)
>> +					      irqentry_state_t state,
>> +					      arm64_exc_hwstate_t hwstate)
>>  {
>>  	if (!regs_irqs_disabled(regs)) {
>> -		local_irq_disable();
>> -		arm64_exit_to_kernel_mode_preempt(regs, state);
>> +		hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
> Hi Vladimir,
> 
> As we discussed earlier in the link below, I think it is neither
> necessary nor correct to switch to NOIRQ_CONTEXT here; the default
> local_irq_disable() is fine.
> 

Hi Jinjie,

Switching to NOIRQ_CONTEXT *unconditionally* is indeed incorrect, but
here we do it only if !regs_irqs_disabled(regs), which implies that
DAIF is 0.  Thus, switching to NOIRQ_CONTEXT is equivalent to
local_irq_disable().

I'd prefer not to mix different APIs and to keep the switch to
NOIRQ_CONTEXT, since this provides:
- consistency checks for the hardware state
- a unified style for managing exception context

If that makes this clearer we can replace regs_irqs_disabled(regs)
with arch_irqs_disabled_flags(hwstate.flags).

Thanks
Vladimir


> Link:
> https://lore.kernel.org/all/77080aa8-7df1-43f0-8c82-1096db05f745@huawei.com/
> 
> Best regards,
> Jinjie
> 

