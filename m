Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++2sm2jBL5ghb+VJdhhrkBgMQI8C9SQeRqvK9ZkzcE0=; b=v828LNKN8YfkrI
	d9UqYHbEw2MgSaI1tlnSWYViDoD1PY7umn/2oz79b+TMgghi0XRxhnLjGs5ngPIQD6VKoGoIcEzF2
	OI83zFn567HP4nkqMtChastdDKFbTHY9vIsvps+lT+QfYbeQCbvcxakTzAHG3FxrQj6O0IkKZ8ykv
	Dr8nVPO3El+E6xRAevuiuuibh3+eSn8b2ARJUMmUmLPLXw4O+hvUzBjCcEnLnEO+oaVOxNJaohFpf
	GfFDFYIIS3sXCLStSg5ucLLBsnmImkxqRYukKJEeeHcd2vuwyQmyQhsCdvczCY4siE8Y+74usu5d2
	CpMADr/Q4yeNg5IMGkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZyH-0000000BWPl-0Qvb;
	Tue, 14 Jul 2026 10:02:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZyE-0000000BWP3-1zkk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:02:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66F95497;
	Tue, 14 Jul 2026 03:02:28 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D3D3F93E;
	Tue, 14 Jul 2026 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784023352; bh=lMd9UsWQkKVgViBSQo5iJeWu/WcFTe/HVNWDQM3hu6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qbnB2gjWbTa7/IOkusHCnpMqNstYdvIUQRV8zxRuDxgU8h6X74Ezlr+TFI8RN0PKO
	 U0OTtMHY2FemAKewAWiqUWSVlac9A4YqfLc7chtT05ijlKcy3Wk+4HpkirLkUvDI0B
	 DOoha48bwGFZhWL2NHygODy2JKM1LQKzWbA3XCIA=
Message-ID: <432a52d8-0526-4477-95fe-2aba6a113153@arm.com>
Date: Tue, 14 Jul 2026 11:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/36] arm64: irq: introduce a helper for GIC priority
 initialization
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-7-vladimir.murzin@arm.com>
 <994f9866-b7f9-408f-8aaf-3591882b5c7f@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <994f9866-b7f9-408f-8aaf-3591882b5c7f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_030234_634546_21F09932 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 08:44, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
>> interrupt masking via DAIF and switch to masking via PMR.  This
>> depends on a very specific behaviour of `local_daif_restore()` which
>> will clear DAIF if masking interrupts via PMR, which will get removed
>> in the future.
>>
>> As `setup_arch()` cleared DA only earlier, introduce a dedicated
>> helper that explicitly initializes the PMR to mask interrupts and
>> clears DAIF, switching to IRQ priority masking.
>>
>> Given it is a dedicated helper, add a lockdep assertion as
>> `setup_arch()` should always have called `trace_hardirqs_off()` when
>> clearing DA, otherwise something bad happened.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/daifflags.h | 15 +++++++++++++++
>>  arch/arm64/kernel/irq.c            |  7 +++----
>>  2 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
>> index 795b35128467..56341578e7e3 100644
>> --- a/arch/arm64/include/asm/daifflags.h
>> +++ b/arch/arm64/include/asm/daifflags.h
>> @@ -141,4 +141,19 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
>>  	 */
>>  	write_sysreg(flags, daif);
>>  }
>> +
>> +/*
>> + * During early boot, we unmask PSR.DA before the GIC has been set up.
>> + * If we use IRQ priority masking, the PMR and PSR will be out of sync
>> + * after the GIC is enabled : sync them up.
>> + */
>> +static inline void local_interrupt_priority_init(void)
> Maybe switch_to_pmr_masking()?
> 

I have no strong opinion on that, tbh.

Having another look at the code made me think that this helper has
only a single caller. Perhaps we should move the system_uses_irq_prio_masking()
check from the caller into the helper, making it clear that the helper
is specific to pNMI without having to inspect the call site.

What do you reckon?

>> +{
>> +	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
>> +	lockdep_assert_irqs_disabled();
>> +
>> +	gic_write_pmr(GIC_PRIO_IRQOFF);
>> +	write_sysreg(DAIF_PROCCTX, daif);
> otherwise LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 

Thanks!

Vladimir

>> +}
>> +
>>  #endif
>> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
>> index 9fafd826002b..c73faa30268d 100644
>> --- a/arch/arm64/kernel/irq.c
>> +++ b/arch/arm64/kernel/irq.c
>> @@ -126,10 +126,9 @@ void __init init_IRQ(void)
>>  
>>  	if (system_uses_irq_prio_masking()) {
>>  		/*
>> -		 * Now that we have a stack for our IRQ handler, set
>> -		 * the PMR/PSR pair to a consistent state.
>> +		 * Now that we have a stack for our IRQ handler,
>> +		 * let's mask interrupts via the PMR.
>>  		 */
>> -		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
>> -		local_daif_restore(DAIF_PROCCTX_NOIRQ);
>> +		local_interrupt_priority_init();
>>  	}
>>  }
> 


