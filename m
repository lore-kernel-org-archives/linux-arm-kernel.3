Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85CBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DS+EOqKK1louwjHrfViatEdOTYOmJ4Od1ElM/tDC0Ho=; b=Taurj1PU+zK5bU
	3RY4o5pDNuZes1Zv5aSgdKElWUBPyjyS8WSwy8L0PAELg/5wsv7wxHXvSFQNLO9aUzQeYX8zkefev
	z95aX00aHpY0zHLF+8NfxLWpITSITagWj+bGr6oE+030KfaM9mUdhhBeoQ+WxJxqUtxJPyzJnd1y/
	+kr8/NTLtI7QrBZNQVBMpSg7mqLXGNorw6QI6IAwL9CdYrkE17b0ydI7F7aD3LWrapL61qSOh2VjV
	6n+g73HMOQneTuYSTZoOCvX0nkWyz+9aXwZ3d3ncQQz++Z11Iui2kYqRzceDM5uTHhsqfE4Gkjxsi
	Le+rekA7E1cSbPgzNkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfvv-0000000CeIO-2qnV;
	Tue, 14 Jul 2026 16:24:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfvs-0000000CeHz-3DH5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:24:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 167D2339;
	Tue, 14 Jul 2026 09:24:27 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 531183F7B4;
	Tue, 14 Jul 2026 09:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784046271; bh=Jf2eGCnMUVmmpSxGM34ym/y8n3HA22HahD6Tr5G6wwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPnark1PPiruVeNo+STn9lerp9yWdw6B01HibtVC6ivqVSuYjkyNXUzUC1PsOp1Ob
	 x7q040QAOtOmGkG28jZw2Sgoww+gXY+hZGjmcePZUYKgbmlYj7sU2JHlbLPYcesr5d
	 /yG/xiwyi9Fbs0YVlQ1TuSD3pqGaDlq9AX3YDUE0=
Message-ID: <63cb9447-a219-4115-a6ed-c69aeaa45535@arm.com>
Date: Tue, 14 Jul 2026 17:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
 <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_092432_977048_1166E098 
X-CRM114-Status: GOOD (  11.10  )
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

On 7/10/26 11:13, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index a13653b228b7..de71d5a3a6a1 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -525,8 +525,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>> -static __always_inline void __el1_pnmi(struct pt_regs *regs,
>> -				       void (*handler)(struct pt_regs *))
>> +static __always_inline void __el1_nmi(struct pt_regs *regs,
>> +				      void (*handler)(struct pt_regs *))
>>  {
>>  	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>> @@ -545,7 +545,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>>  
>> -	arm64_unmask_exc_context(NONMI_CONTEXT);
>> +	if (system_uses_nmi())
>> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
>> +	else
>> +		arm64_unmask_exc_context(NONMI_CONTEXT);
> This looks strange; whether it's a pseudo NMI or FEAT_NMI, the behavior
> should be consistent.

Here is my understanding of how things behave.

No NMI support

  NONMI_CONTEXT and NOIRQ_CONTEXT are the same, so we cannot take any
  IRQ while handling an IRQ. On return from the handler, we remain in
  NOIRQ_CONTEXT. Easy.

pNMI

  We cannot distinguish between an NMI and an IRQ on exception entry,
  so we have to postpone unmasking the IF bits until the interrupt
  handler. In other words, we enter the interrupt handler in
  NONMI_CONTEXT.
  
  In the handler:

    1. For an NMI, we handle the NMI and then drop to NOIRQ_CONTEXT.

    2. For an IRQ, we drop to NOIRQ_CONTEXT (allowing NMIs to preempt
       the IRQ handler) and then handle the IRQ.

  In both cases, we return from the handler in NOIRQ_CONTEXT.

FEAT_NMI

  We can distinguish between an NMI and an IRQ on exception
  entry. Thus, for an IRQ, we can immediately drop to NOIRQ_CONTEXT
  before passing control to the IRQ handler, allowing NMIs to preempt
  the IRQ handler. This corresponds to case 2 of the pNMI flow above.


Perhaps above could be better expressed with:

if (gic_supports_pseudo_nmis())
	arm64_unmask_exc_context(NONMI_CONTEXT);
else
	arm64_unmask_exc_context(NOIRQ_CONTEXT);


Have I missed anything?

Cheers
Vladimir

