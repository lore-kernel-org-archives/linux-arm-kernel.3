Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C59CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Im+Aa3TngIB1QFVLXN/LGM7mqAVaEHiZKdCdR1CrjLQ=; b=XXOW3U4ECpt5+5+0QHdbv2EyXH
	gwxTYFurTE/BDLqshLD/SXS757vS3LXvfHlzaQ5OVM/sfMvv7UccgZ2C9b58rGLwDFVGIK3meFKZT
	UEz2PZQ1nGoz+G0j0LN25F2K3hyyASqTz2ysE+JrgXzJ+oPBeCmXJ7L+FvSvfW7Q/ew3SdLBOMv0J
	1uE7jgvSi30ejG7MqGA+mlvlyG1tHUfxT4b15Bnv8BG2EZzk911pUuwqBkve8RXhHS0gKewNef6vC
	OySmXE2tGzeQkvE8zwJIfWD7DHrrsVBBtQ90VeLlrg+E/aKIYfC9e8iZToBise6sY1RkxI+a31miX
	SlvYpz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjybz-0000000Elcn-0qOH;
	Wed, 15 Jul 2026 12:21:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjybx-0000000ElcH-1yJJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:21:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 568562F;
	Wed, 15 Jul 2026 05:21:08 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D02B3F7B4;
	Wed, 15 Jul 2026 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784118072; bh=92LmSyPv0MDpvg5uzitknZ1qVtZJI7TtPQkAmsIUSRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PCgRZ9nawDHYnDAM/oRjt7HTAqrZTEEpdUrLrcZ/32+W2eMYgMbZ994gaWv2yRfEH
	 L1n1ZlutHwAIaBSGfTfI6pF1Ak9z7SxeKVMKXya+I1rroT4EWFfQHVSBvkx9PWkZ1J
	 gv08rvP9XRnCyiodguckQVdPyOhB/WZFpYjcOWGs=
Message-ID: <c5ed3515-0ea1-4db4-809a-97020439e1f1@arm.com>
Date: Wed, 15 Jul 2026 13:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/36] arm64/efi: Implement override for IRQ flags
 checks
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-24-vladimir.murzin@arm.com>
 <e1694eb7-3459-43bd-9f37-1066bef43a14@huawei.com>
 <94589fd3-d81c-4603-8226-131894d6af08@arm.com>
 <649a6d54-3335-4523-a683-e2bf7fb865d0@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <649a6d54-3335-4523-a683-e2bf7fb865d0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_052113_566877_86D28A1E 
X-CRM114-Status: GOOD (  11.23  )
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

On 7/15/26 13:09, Jinjie Ruan wrote:
> 
> On 7/15/2026 8:00 PM, Vladimir Murzin wrote:
>> On 7/13/26 09:22, Jinjie Ruan wrote:
>>>> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
>>>> index e8a9783235cb..479741d52c90 100644
>>>> --- a/arch/arm64/include/asm/efi.h
>>>> +++ b/arch/arm64/include/asm/efi.h
>>>> @@ -5,6 +5,7 @@
>>>>  #include <asm/boot.h>
>>>>  #include <asm/cpufeature.h>
>>>>  #include <asm/fpsimd.h>
>>>> +#include <asm/interrupts/common_flags.h>
>>>>  #include <asm/io.h>
>>>>  #include <asm/memory.h>
>>>>  #include <asm/mmu_context.h>
>>>> @@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
>>>>  	(efi_rt_stack_top != NULL &&					\
>>>>  	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
>>>>  
>>>> -#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
>>>> -
>>>>  /*
>>>>   * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
>>>>   * And EFI shouldn't really play around with priority masking as it is not aware
>>>>   * which priorities the OS has assigned to its interrupts.
>>> Can this comment be deleted?
>> The comment still looks valid to me. Why should it be deleted?
> The current implementation of arch_local_save_flags() can already know
> the PMR status.
> 
> 112 static __always_inline unsigned long arch_local_save_flags(void)
> 113 {
> 114 >-------arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
> 115
> 116 >-------if (system_uses_nmi())
> 117 >------->-------hwstate.allint = read_sysreg_s(SYS_ALLINT);
> 118
> 119 >-------if (system_uses_irq_prio_masking())
> 120 >------->-------hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> 121
> 122 >-------return hwstate.flags;
> 123 }
> 
> 

How is that related? Comment talks about EFI messing up with IRQs.

Cheers
Vladimir

>> Cheers
>> Vladimir
>>


