Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B53FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ksvkKyvoa0KNaL/3iQTUPLbnpuV2y3jjDsGnruIlKA=; b=ZkuSi9jVQcTMXWY2n/Mq8E1/OR
	8Dpg3AB8L6rIj2aUlguWbJSbXPWGxtvTrnVvgMKqU3w/8vT4wufWnlYG7Bv0Px1GeL0UK6xmd0qJ/
	DIzgv2M16vDpWyP0T2aLkb0B43fsImmaGFoi+kS9MUmXQF6DbjNTpd9Lj55/pRvNvxQahKU7U1qvy
	UX3vyROGODLbn7Vy9MBhpvBLMepbxFcb+s5fHLMqQeDlNhQ5w+KMVO1I0kItEO6WFqnu/u6ZWKHg5
	lhWHcQfC5yFwM7/YCodTYnvZ4DoIunkcYZhEgubsFo4PkqZP5UQSD8XfBWD1R/0GnC3gIlDa3vLlZ
	B55nOhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eoi-00000002Mwa-0Y84;
	Mon, 21 Sep 2026 14:16:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eoV-00000002Mt4-2mea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AFE819F0;
	Mon, 21 Sep 2026 07:16:07 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 467003F86C;
	Mon, 21 Sep 2026 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790000170; bh=Hj+6oBfg70cpgLq144GN50BFFQ0oeoIsco4GX+nFiQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hc95X9xkXxkfJ11Dy/+8Gmtv/YaTUUqrKGcb3gdACI0zcOwLUqb/NyPcfECachyjX
	 e/tvFlbtFEZqxBBYEVQSZkex8bEGXwGIllikYEKDMBAFGr5TdQmkRpZS9isNFKJIUF
	 Hw7fLPkouF9LAfMv+NGNd1SoX2451eX1/zWy47Rc=
Message-ID: <df3b4044-74dc-40f3-88a2-8d5899e1364c@arm.com>
Date: Mon, 21 Sep 2026 15:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-27-vladimir.murzin@arm.com>
 <d2ea770e-baf4-4578-9dea-b3c7a5113df4@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <d2ea770e-baf4-4578-9dea-b3c7a5113df4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_071611_783065_07C4D6A8 
X-CRM114-Status: GOOD (  13.48  )
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

On 9/17/26 12:37, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Mark Brown <broonie@kernel.org>
>>
>> Our goal with superpriority interrupts is to use them as NMIs, taking
>> advantage of the much smaller regions where they are masked to allow
>> prompt handling of the most time-critical interrupts.
>>
>> When an interrupt is configured with superpriority, we enter EL1 as we
>> do for any other interrupt. The presence of a superpriority interrupt
>> is indicated by a status bit in ISR_EL1. We check this bit before
>> unmasking interrupts in elX_interrupt(), and if a superpriority
>> interrupt is pending, we handle it as an NMI. Otherwise, normal
>> interrupts are handled as usual.
>>
>> Since superpriority interrupts are always handled as NMIs, the
>> interrupt controller can rely on in_nmi() to distinguish them from
>> ordinary interrupts.
>>
>> Enable IPIs to use superpriority interrupts as NMIs, matching the
>> existing pseudo-NMI behaviour.
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/entry-common.h |  7 +++
>>  arch/arm64/kernel/entry-common.c      | 83 +++++++++++++++++++++++----
>>  arch/arm64/kernel/smp.c               |  2 +-
>>  3 files changed, 79 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
>> index 73d82a8d8e95..0681ba91ac3b 100644
>> --- a/arch/arm64/include/asm/entry-common.h
>> +++ b/arch/arm64/include/asm/entry-common.h
>> @@ -37,6 +37,13 @@ static inline bool arch_irqentry_exit_need_resched(void)
>>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
>>  		return false;
>>  
>> +	/*
>> +	 * If AllInt is set then we must have handled an NMI, so skip
>> +	 * preemption
>> +	 */
>> +	if (system_uses_nmi() && read_sysreg_s(SYS_ALLINT))
> if (system_uses_nmi() && (read_sysreg_s(SYS_ALLINT) & ALLINT_ALLINT))
> 

Ack.

Thanks
Vladimir


