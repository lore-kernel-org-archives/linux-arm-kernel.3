Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92035C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt5K7BuNNxjf2+WKWQ/tC37O8AiRc2BVogdQmoam4bM=; b=vCk+Sme/FHixmk
	V9H9lxgqPohMeDi1sArI/k/kMfgIf958z9IHMO7idjFYdfrDIthBWkGM2JNt54BvVua9K9NakogZ4
	rZ0hUstBIp4H5QvIdiYfrc51B8ugC0oe5GXu4KI2C4sRtULkSLZK4XsRVhnpY77f8lsKGk3DJbEbe
	KEXc+L5BbVudmbaWfxPNYBLFrQkw0G9kK40Es0FbIV08JJ5jcwHu6bLa0MGML6LEWw/uVQETvvley
	KMq2SWagG0zvYWpGyiLY+IUrgciPN/bmMJRGh8hSb57xv7dxQNzLi38eIj7Hl0sTHnFe74iqJhPVr
	wfxAZEmZxJyj3LpQA+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcSP-0000000ByjE-1NUH;
	Tue, 14 Jul 2026 12:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcSJ-0000000ByiN-3B4b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:41:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B41F497;
	Tue, 14 Jul 2026 05:41:41 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDCA3F7B4;
	Tue, 14 Jul 2026 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784032905; bh=3HfliaT3B7ow7o7OPVYeaLSYYy/Lx8pmXXIrfnYT07w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oidxx6/t6JYTLpTJN0x6OziC5D66HisbRYQxgQqWbhxT8/hD8ZGKHwTr2/6NmUGEI
	 7LpphNir7gCk7MmT6t+BPrU2tASyUDaAUMtBn3H5/hdbtSpak/O/vOcrsT7fiTCsYz
	 umTc5tnafmsX9L28ouifHu477+7YJSIA0xvT6al4=
Message-ID: <2f54a081-c7e7-4064-bc9b-a51ea68de6c6@arm.com>
Date: Tue, 14 Jul 2026 13:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 29/36] arm64: nmi: Manage masking for superpriority
 interrupts
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-30-vladimir.murzin@arm.com>
 <ecc5e80c-89c3-4a62-87e5-cc09c04bc2c6@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ecc5e80c-89c3-4a62-87e5-cc09c04bc2c6@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_054150_978933_548C17BD 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 11:08, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
>> index 72ed6e75d146..315aaec3ea34 100644
>> --- a/arch/arm64/include/asm/interrupts/common_flags.h
>> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
>> @@ -20,6 +20,14 @@
>>  /*
>>   * Exception context mapping
>>   *
>> + * FEAT_NMI
>> + *
>> + * CRITICAL -> DAIF + AllInt (corresponds to the state on exception entry)
>> + * ERROR    ->  AIF + AllInt
>> + * NONMI    ->   IF + AllInt
>> + * NOIRQ    ->   IF
>> + * PROCESS  ->    0
>> + *
>>   * pseudo-NMI
>>   *
>>   * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
>> @@ -76,6 +84,7 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
>>  
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
>> +
>>  }
>>  
>>  static __always_inline
>> @@ -84,6 +93,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
>>  	if (system_uses_irq_prio_masking())
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
>>  
>> +	if (system_uses_nmi())
>> +               return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .allint=ALLINT_ALLINT};
>> +
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
> 
> DAIF_PROCCTX_NOIRQ is universal; can it be initialized with a loal
> varible and set at the beginning?
> 
> 90 static __always_inline
>  91 arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
>  92 {
>  93 >-------arm64_exc_hwstate_t state = { .daif=DAIF_PROCCTX_NOIRQ };
>  94
>  95 >-------if (system_uses_irq_prio_masking())
>  96 >------->-------state.pmr = GIC_PRIO_IRQON;
>  97
>  98 >-------if (system_uses_nmi())
>  99 >------->-------state.allint = ALLINT_ALLINT;
> 100
> 101 >-------return state;
> 102 }

It can be, but I did it this way because it can be quickly and easily
matched with the exception context mapping documented at the top of
the file. I don't have a strong opinion - if others find a different
approach more helpful, I'm happy to change it.

Cheers
Vladimir

