Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4735C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByiWSQ8eh42tvoIiWE2lsESYBO+Hgwyud5gxkh10Hsc=; b=uep7euzCARtnxd4hEskwTJxGEA
	9p4zgZZyntl6yJHuqbMWs7qGxQ2wblbIkk9yFEBIdjkWhVa6gopnLFwDvhFNvCotI2x7Ux0qaqd+I
	rliM8hf56bkZEdCTetdtyYK2iHeraNZoMe68OHzYLD4rNoAXJKEZnEnCbzaJ7OfFECPTMl5TrwWAf
	8dAdP7zuPHSCtmQuf+6fcTC5x5Jn23rjLBXxUOuvYl6mYulcJvTCF+qe1DHYqWGqIiku80HOxEzYO
	ziqBQEw7bnpzU5/aX5D0qSml93NEcW/WBui6sQJrxnCpGQ4iShJekM2QRNrIgod0gXDzznPRhH+2a
	60g67gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMu0-0000000D7s2-1cdG;
	Fri, 21 Aug 2026 10:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMty-0000000D7rI-2YMT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63C6E153B;
	Fri, 21 Aug 2026 03:55:05 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D32CC3F66F;
	Fri, 21 Aug 2026 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787309709; bh=KiagOudW+pTgtW3kjnN7v28ThC+8ziEgw7Tys2uqlvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tEZZkdr1CZL3BylTAPCjgW9DQljVWaScCrd7NxczztefZ1vXTpXOfNZfS0QoAyWlW
	 cN2knDWCKN1hLUGwP4Qo8larnr4vgibwngKyC+ZW27dzkWgq1BDdcGmgEhJWNCBYMQ
	 Xr8qRWKs/t3mDITHtgMm9bWqQoLRvNG9EaxJKlZs=
Message-ID: <1b132c5d-41ea-4776-a080-c5b411618984@arm.com>
Date: Fri, 21 Aug 2026 11:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/45] arm64: process: Use helper to check
 exception state
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-14-vladimir.murzin@arm.com>
 <1694f91a-1f0a-4e25-94c8-3885c4560eea@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <1694f91a-1f0a-4e25-94c8-3885c4560eea@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035510_692672_B48FAFB4 
X-CRM114-Status: GOOD (  17.52  )
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

On 8/11/26 08:43, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> debug_switch_state() explicitly checks the hardware exception state
>> for both the pseudo-NMI and non-NMI paths. The expected state matches
>> the NOIRQ_CONTEXT exception context introduced alongside the exception
>> masking helpers and state checkers.
>>
>> Use the helper instead of open-coding these checks.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/process.c | 21 ++-------------------
>>  1 file changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index 581f80e9b9b7..0fd09136d398 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -51,6 +51,7 @@
>>  #include <asm/exec.h>
>>  #include <asm/fpsimd.h>
>>  #include <asm/gcs.h>
>> +#include <asm/interrupts/common_flags.h>
>>  #include <asm/mmu_context.h>
>>  #include <asm/mpam.h>
>>  #include <asm/mte.h>
>> @@ -703,25 +704,7 @@ void update_sctlr_el1(u64 sctlr)
>>  
>>  static inline void debug_switch_state(void)
>>  {
>> -	if (system_uses_irq_prio_masking()) {
>> -		unsigned long daif_expected = 0;
>> -		unsigned long daif_actual = read_sysreg(daif);
>> -		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
>> -		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
>> -
>> -		WARN_ONCE(daif_actual != daif_expected ||
>> -			  pmr_actual != pmr_expected,
>> -			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
>> -			  daif_actual, pmr_actual,
>> -			  daif_expected, pmr_expected);
>> -	} else {
>> -		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
>> -		unsigned long daif_actual = read_sysreg(daif);
>> -
>> -		WARN_ONCE(daif_actual != daif_expected,
>> -			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
>> -			  daif_actual, daif_expected);
>> -	}
>> +	arm64_debug_exc_context(NOIRQ_CONTEXT);

Hi Jinjie,

> Hi Vladimir,
> 
> After taking another look, I have a small suggestion:
> 
> if you postpone the introduction of arm64_debug_exc_context() and
> arm64_debug_exc_hwstate() from the previous patch to this one, the code
> review will be easier.
> 

Yes, I can do that in the next version. I assume I can preserve your
Reviewed-by tags since it is just a mechanical change; otherwise,
please shout.

Cheers
Vladimir

> Best regards,
> Jinjie
> 
>>  }
>>  
>>  /*
> 


