Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E39C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dET0ifrxw8xjnq7bSoH/s2JcGBSYI4nj0HDRs0tDGFo=; b=HKSAReRiYPCc6b67RJF8tW8C0p
	NWK+EwWj0jdQVQ43T7YLjvncnZqThh3haD7CRK4RNY7nKP5mKh3bF0XDi4jmrT/GMsZCyL+27sATU
	dFB3kF0FOsrQ/54kNessfnN5U+0OZo3z2DFkupfScWwShHfA9F5RkKXEbe+G4JcreepDO1tDUPpFD
	fgq7mAy/s7ooJYB9zMYGevKZYBFsS5r6+wPeFCY+4jDyuo5Ev+X9KS0RMUlA0QLYXc9Nxidw2LBOJ
	KXo1vWrjqjY5YN8VNNDVJM+/9U8J6c0vyX6WDe3lnol8r1xMhNSgAdeDMpnnRCTZ/Kt7BCuEbZZA8
	9abAeq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyIa-0000000Eh09-1qWD;
	Wed, 15 Jul 2026 12:01:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyI7-0000000Egel-2mPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:00:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB1F1477;
	Wed, 15 Jul 2026 05:00:38 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D8673F915;
	Wed, 15 Jul 2026 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784116842; bh=8A02T0lHiIxirZp8sUQB/UaUlnCq187wjQG2BzedZaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QlJsW7xfFUaYZ9fLphVx4KuZLcri2IKZSUPUHx51sXUYnGJI38lZLHH936OdBU76d
	 Qcc9yuRYUWGOp++xyTebVh3MKsnpdmfrtxGOuqzEnmRfyCYR/h4jdiJQd47SqxiJuF
	 Pboi8Cqw9yAOQBLbwrN1LgdcLCNT2LdYN5R4ZPLM=
Message-ID: <94589fd3-d81c-4603-8226-131894d6af08@arm.com>
Date: Wed, 15 Jul 2026 13:00:39 +0100
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
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <e1694eb7-3459-43bd-9f37-1066bef43a14@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050043_899767_1B2E4043 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

On 7/13/26 09:22, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
>> index e8a9783235cb..479741d52c90 100644
>> --- a/arch/arm64/include/asm/efi.h
>> +++ b/arch/arm64/include/asm/efi.h
>> @@ -5,6 +5,7 @@
>>  #include <asm/boot.h>
>>  #include <asm/cpufeature.h>
>>  #include <asm/fpsimd.h>
>> +#include <asm/interrupts/common_flags.h>
>>  #include <asm/io.h>
>>  #include <asm/memory.h>
>>  #include <asm/mmu_context.h>
>> @@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
>>  	(efi_rt_stack_top != NULL &&					\
>>  	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
>>  
>> -#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
>> -
>>  /*
>>   * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
>>   * And EFI shouldn't really play around with priority masking as it is not aware
>>   * which priorities the OS has assigned to its interrupts.
> Can this comment be deleted?

The comment still looks valid to me. Why should it be deleted?

Cheers
Vladimir

