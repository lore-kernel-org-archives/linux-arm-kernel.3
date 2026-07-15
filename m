Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5062DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVIqYzBCwkSvrOo9fjsOyZRo3pGQHK7MTvgyv28ckXs=; b=4Sp0Uyz9SntPD/2eYo2bomaNTt
	cHsx7dZ12FG6rGkqog3LeTrIejw4kQ6sP42BMCblUV92rCjMN3q9TQH4oaSheQ+eXfssQaz7/PM4Y
	XY+OxhXPREDmYs48FtQ1z1VVyh4dk0FvK8hrprGZwhMgASrNluwP2z55METHfwT3U02o+eGlm2WEQ
	1fFzMPdLsPqBN/84yKG9PFNNKNgRVwUXtaI3dPpUGqrXsocQhWciI5/OS0ZuyNactv7+rWdgCBIP5
	XQ5gk9UVP/yK2fZJVhjGpfC66zMzRrF7SsSyjPtlnqw5ilgKFlU8hjOcRREq69UOjyKdIVuO8N9jK
	y7K/hZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzas-0000000Ew6e-3ZJW;
	Wed, 15 Jul 2026 13:24:10 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzaq-0000000Ew5p-2b0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:24:10 +0000
Message-ID: <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784121845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVIqYzBCwkSvrOo9fjsOyZRo3pGQHK7MTvgyv28ckXs=;
	b=xmQnBRqZk/0smY8Van6lM/3KQO2IP67/8UEp8x39A7YN4mEtT/2xL+L9Wn19C974/2iXy2
	ovgUTGAPqPyxCmFTeN2U9QpbasQczWGE4FU9wx4SZIIrqIZKetr0OwVPqFjgRhonnC0UKV
	iRYwy0FfWTgT5+044ze3nZpIp6+2CIg=
Date: Wed, 15 Jul 2026 15:24:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062408_899513_497A1AA5 
X-CRM114-Status: GOOD (  29.35  )
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

On 7/13/26 11:57, Sudeep Holla wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>> Overriding the idle mechanism might be useful for debugging and performance
>> testing. Add a cmdline parameter for it, similar to the existing idle=
>> parameter already present for the x86 and ppc architectures.
>>
>> It is also useful on platforms where the WFI instruction misbehaves,
>> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
>> be treated as an erratum and patched using the alternatives framework.
>> However, in the Apple Silicon case we need more flexibility because it is
>> difficult to detect whether the erratum applies. For example, Linux VMs
>> inside macOS have the same MIDR and may even seem like they're running
>> in EL2 in the case of NV, but should continue using WFI (it's trapped and
>> handled correctly by the hypervisor there). Thus, we prefer to
>> let the m1n1 bootloader add the idle=nop parameter[1].
>>
>> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes in v2:
>> - Applied suggestions by Anshuman Khandual (Thanks!)
>> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
>>   arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
>>   arch/arm64/kernel/idle.h                        | 13 +++++++++++
>>   arch/arm64/lib/delay.c                          |  5 ++++-
>>   4 files changed, 68 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index b2d7d3540ded..d7f5471edf8f 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -2239,6 +2239,29 @@ Kernel parameters
>>   
>>   			idle=nomwait: Disable mwait for CPU C-states
>>   
>> +			[ARM64,EARLY]
>> +			Format: idle=wfi, idle=yield, idle=nop
>> +
>> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
>> +			instruction in the idle loop. This is the default and
>> +			allows the CPU to enter a low-power state until an
>> +			interrupt arrives.
> Just curious as when and why one would need to use idle=wfi if that is the
> default behaviour. I am missing the need to have it.
>
>> +
>> +			idle=yield: Use the YIELD hint instruction instead of
>> +			WFI. CPUs supporting simultaneous multi-threading (SMT),
>> +			can continue executing another thread when the current
>> +			thread reaches the idle loop. This will make the CPUs
>> +			eat more power, but may be useful to get slightly better
>> +			performance in some applications, since the CPUs will
>> +			not enter a low-power state.
>> +
>> +			idle=nop: Do not execute any idle instruction in the
>> +			idle loop. This is useful on platforms where WFI
>> +			misbehaves, leading to system instability or loss of CPU
>> +			state. This will make the CPUs eat more power, but may
>> +			give slightly better performance in some applications,
>> +			since the CPUs will not enter a low-power state.
>> +
>>   	idxd.sva=	[HW]
>>   			Format: <bool>
>>   			Allow force disabling of Shared Virtual Memory (SVA)
>> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
>> index 05cfb347ec26..f161711a9954 100644
>> --- a/arch/arm64/kernel/idle.c
>> +++ b/arch/arm64/kernel/idle.c
>> @@ -11,6 +11,27 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/sysreg.h>
>>   
>> +#include "idle.h"
>> +
>> +enum arm64_idle_mode idle = ARM64_IDLE_WFI;
>> +
>> +static int __init setup_idle(char *arg)
>> +{
>> +	if (!arg)
>> +		return -1;
>> +	else if (!strcmp(arg, "wfi"))
>> +		idle = ARM64_IDLE_WFI;
>> +	else if (!strcmp(arg, "yield"))
>> +		idle = ARM64_IDLE_YIELD;
>> +	else if (!strcmp(arg, "nop"))
>> +		idle = ARM64_IDLE_NOP;
>> +	else
>> +		return -1;
>> +
>> +	return 0;
>> +}
>> +early_param("idle", setup_idle);
>> +
>>   /*
>>    *	cpu_do_idle()
>>    *
>> @@ -26,8 +47,13 @@ void __cpuidle cpu_do_idle(void)
>>   
>>   	arm_cpuidle_save_irq_context(&context);
>>   
>> -	dsb(sy);
>> -	wfi();
>> +	if (likely(idle == ARM64_IDLE_WFI)) {
>> +		dsb(sy);
>> +		wfi();
>> +	} else if (idle == ARM64_IDLE_YIELD) {
>> +		dsb(sy);
>> +		asm volatile("yield" ::: "memory");
>> +	}
>>   
>>   	arm_cpuidle_restore_irq_context(&context);
>
> If WFI is replaced by NOP or YIELD, do we really need to save/restore
> IRQ context used for pseudo-NMIs which may add some overhead ?

There are optimizations, even in the ARM64_IDLE_WFI case, which could be 
done here, such as checking that an interrupt actually occurred before 
continuing (and repeating the wfi/yield/nop until this is the case). I 
would prefer not to do these optimizations in this patch series, and 
leave it as future work, because I don't understand all the implications 
at this point. Is this acceptable for you?


Thanks,

— Yureka


