Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E61C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR/Osk67Ac6HqpyAtQW/S3wFFV0obNj7GHz2cg+og7E=; b=EsHLXI72qY5BS/XvtCqB2oexhj
	4N1cIqq7711pc3hwFTFTGMOjRqFyPUDyFUg77Wb5cSN1JHCKsbcJYSe21oDnk9ek0f6QLiagb4VdB
	3e7CqwcCCT+P5JgmLXFZrwgTPFgoEMruP7v7Fq6cGy/6cce9xSrJ7zQhnja8CuPDZMEtnS+nY63CL
	RhAIY5a8PkzRApCGWoKD4gS197R7QwPKPjSSM3R/ERQvQB8IjS3yOr02pKlojv+P6H8UrdKJvDoDJ
	M6bjKOh9NyWIo5MJJsJSZlnucIkcGaT6Qm9xgURchm8V9NoKa/JREiUju7GAKp7wyPRS3IYk7lGj4
	rXT27AFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRlK-0000000B9vA-0EjU;
	Wed, 22 Jul 2026 07:53:06 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRlG-0000000B9tf-0cGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:53:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aR/Osk67Ac6HqpyAtQW/S3wFFV0obNj7GHz2cg+og7E=;
	b=QZZpp3lBLxPsjGPC91euFBf8ASSiUf8bQhsrEohyp9pkY8APM2++0QHlbYr9jvQhQhoWBsDN8
	O6Sh9Zjo1YKBxHFEx5tP2x1ztkfziyWsYsdfMj1NJvlwT8orAWgJaN0nZtioFzYHA3XLHtIbJU0
	d1mtfzQ+lW1LB7ESDuuATcg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h4mTB0clkz1T4GB;
	Wed, 22 Jul 2026 15:43:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 925B64057D;
	Wed, 22 Jul 2026 15:52:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 15:52:46 +0800
Message-ID: <5ec6652f-1747-40d1-b0f4-9262f3084757@huawei.com>
Date: Wed, 22 Jul 2026 15:52:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/36] arm64/efi: Implement override for IRQ flags
 checks
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-24-vladimir.murzin@arm.com>
 <e1694eb7-3459-43bd-9f37-1066bef43a14@huawei.com>
 <94589fd3-d81c-4603-8226-131894d6af08@arm.com>
 <649a6d54-3335-4523-a683-e2bf7fb865d0@huawei.com>
 <c5ed3515-0ea1-4db4-809a-97020439e1f1@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <c5ed3515-0ea1-4db4-809a-97020439e1f1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005302_832363_3C7445ED 
X-CRM114-Status: GOOD (  11.38  )
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



On 7/15/2026 8:21 PM, Vladimir Murzin wrote:
> On 7/15/26 13:09, Jinjie Ruan wrote:
>>
>> On 7/15/2026 8:00 PM, Vladimir Murzin wrote:
>>> On 7/13/26 09:22, Jinjie Ruan wrote:
>>>>> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
>>>>> index e8a9783235cb..479741d52c90 100644
>>>>> --- a/arch/arm64/include/asm/efi.h
>>>>> +++ b/arch/arm64/include/asm/efi.h
>>>>> @@ -5,6 +5,7 @@
>>>>>  #include <asm/boot.h>
>>>>>  #include <asm/cpufeature.h>
>>>>>  #include <asm/fpsimd.h>
>>>>> +#include <asm/interrupts/common_flags.h>
>>>>>  #include <asm/io.h>
>>>>>  #include <asm/memory.h>
>>>>>  #include <asm/mmu_context.h>
>>>>> @@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
>>>>>  	(efi_rt_stack_top != NULL &&					\
>>>>>  	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
>>>>>  
>>>>> -#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
>>>>> -
>>>>>  /*
>>>>>   * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
>>>>>   * And EFI shouldn't really play around with priority masking as it is not aware
>>>>>   * which priorities the OS has assigned to its interrupts.
>>>> Can this comment be deleted?
>>> The comment still looks valid to me. Why should it be deleted?
>> The current implementation of arch_local_save_flags() can already know
>> the PMR status.
>>
>> 112 static __always_inline unsigned long arch_local_save_flags(void)
>> 113 {
>> 114 >-------arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
>> 115
>> 116 >-------if (system_uses_nmi())
>> 117 >------->-------hwstate.allint = read_sysreg_s(SYS_ALLINT);
>> 118
>> 119 >-------if (system_uses_irq_prio_masking())
>> 120 >------->-------hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>> 121
>> 122 >-------return hwstate.flags;
>> 123 }
>>
>>
> 
> How is that related? Comment talks about EFI messing up with IRQs.

Not really.

The original comment implies "don't touch PMR, so there's no need to
save PMR.", so it only save daif.

Now the now code also save and restore PMR and allint, therefore, I
believe the comments should also be updated
Maybe，

/*
 * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
 * EFI must not play around with priority masking (PMR), as it is unaware
 * of the priority levels the OS has assigned to its interrupts.
 *
 * However, since EFI may directly toggle DAIF and ALLINT (IRQ/FIQ
masking) during
 * runtime services, we must save and restore the full exception masking
 * state (DAIF, PMR, and ALLINT) across the EFI call. This guarantees that
 * the OS's GIC priority model remains consistent and correctly synchronized
 * with the DAIF state upon return from EFI, even though EFI itself never
 * touches the PMR register.
 *

> 
> Cheers
> Vladimir
> 
>>> Cheers
>>> Vladimir
>>>
> 
> 


