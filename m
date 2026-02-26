Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F9EFCE086
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIXJZ762sQFrwalkKRB1cp3LN0uZ8Jw8cNXFzWunR8w=; b=Liq1ChejV2x/m+EQmwD0JFSvbC
	Ge+s394UKTj8gwznFJK2E1lZMoX+QrTJxS3Z7CG3J9p7Y3fugZ9UwaDkG9hokNrDfwIptEpfy06NW
	o26x26G95vlx2q3BasNG4kfV2R7d34p/CNrPR/jIpMYoTaYEwKgxfodk1IYu3f1AbK5gpGKzF0AqL
	qbTz294WTJa2jo1eiMRkgLg/YCeldKoysLNIGL0TaIwT913iNAT6GCHGsTF2FWyjBBzauPibT86kk
	6m+clddgvno8O3+Kim8sb+8PR5gD/QiS75R12kKC8TvjcBh/4hCYr0bihACZg+4bEHwRpsZlbuo0C
	tA0qKivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbxz-00000006HG4-0kAQ;
	Thu, 26 Feb 2026 14:03:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbxy-00000006HFn-03Gf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 14:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NIXJZ762sQFrwalkKRB1cp3LN0uZ8Jw8cNXFzWunR8w=; b=H2C9Psnt1zxdjIkOP/mf/knXjR
	NiCbdOH7g+DCmPUnkUhzXwEwi9PJEuILoCmXcdDO33Yil62R/43RQiluI+BSSzWRTg1YAaaY2qib2
	ode0uiwwCgfrRlviAIcUHElp3rS3WbhPrExC1A7dt8INOFYi62cPLJA1QryqtA/poAK9ixddCRQmi
	nKUCev9czGVGS9bErWKooeiLp5WNiVuCjfBGsVYqRoeZ5TpvWb9ywXLVT+qeLD23qtX7LmyD4pdUH
	n3ksgdEQpAqM4/5pPcfAuAziuSFMwOuyPljbq3mfd4ko7WKDSrKcVsJG2jODpY3p0CJkH0JYxo25H
	B/5Ou1/w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbxu-0000000B71P-0Hbm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:03:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6A6497;
	Thu, 26 Feb 2026 06:03:32 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 119BB3F73B;
	Thu, 26 Feb 2026 06:03:37 -0800 (PST)
Message-ID: <4ab7b471-a67f-454e-aaf4-9e0b1f0d96e8@arm.com>
Date: Thu, 26 Feb 2026 14:03:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clocksource/drivers/arm_arch_timer: Expose a direct
 accessor for the virtual counter
From: Ben Horgan <ben.horgan@arm.com>
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20260226082234.26707-1-maz@kernel.org>
 <20260226082234.26707-3-maz@kernel.org>
 <aa607343-9dd8-4e96-a7e3-5937fa084891@arm.com>
Content-Language: en-US
In-Reply-To: <aa607343-9dd8-4e96-a7e3-5937fa084891@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_140342_439084_0718CDC0 
X-CRM114-Status: GOOD (  22.40  )
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



On 2/26/26 13:48, Ben Horgan wrote:
> Hi Marc,
> 
> On 2/26/26 08:22, Marc Zyngier wrote:
>> We allow access to the architected counter via arch_timer_read_counter().
>> However, this accessor can either be the virtual or the physical
>> view of the counter, depending on how the kernel has been booted.
>>
>> At the same time, we have some architectural features (such as WFIT,
>> WFET) that rely on the virtual counter, and nothing else.
>>
>> If implementations were perfect, we'd rely on reading CNTVCT_EL0,
>> and be done with it. However, we have a bunch of broken implementations
>> in the wild, which rely on preemption being disabled and other
>> costly workarounds.
>>
>> In order to provide decent performance on non-broken HW while still
>> supporting the legacy horrors, expose arch_timer_read_vcounter() as
>> a new helper that hides this complexity.
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/clocksource/arm_arch_timer.c | 5 +++++
>>  include/clocksource/arm_arch_timer.h | 1 +
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
>> index 90aeff44a2764..4e4a62e1c9439 100644
>> --- a/drivers/clocksource/arm_arch_timer.c
>> +++ b/drivers/clocksource/arm_arch_timer.c
>> @@ -137,6 +137,8 @@ static noinstr u64 arch_counter_get_cntvct(void)
>>  u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
>>  EXPORT_SYMBOL_GPL(arch_timer_read_counter);
>>  
>> +u64 (*arch_timer_read_vcounter)(void) __ro_after_init = arch_counter_get_cntvct;
>> +
>>  static u64 arch_counter_read(struct clocksource *cs)
>>  {
>>  	return arch_timer_read_counter();
>> @@ -931,6 +933,9 @@ static void __init arch_counter_register(void)
>>  	}
>>  
>>  	arch_timer_read_counter = rd;
>> +	arch_timer_read_vcounter = (arch_timer_counter_has_wa() ?
> 
> This matches what is done for arch_timer_read_counter but it seems a bit
> surprising to me that arch_timer_counter_has_wa() is checking that the
> workaround is in use and not whether the workaround should be in use. Do
> we need to worry about what happens if the workaround fails to be enabled?

Or is the point that if you haven't enabled a relevant workaround then
all cores are treated the same and so there is no need to disable
preemption?

> 
>> +				    arch_counter_get_cntvct_stable :
>> +				    arch_counter_get_cntvct);
>>  	clocksource_counter.vdso_clock_mode = vdso_default;
>>  
>>  	width = arch_counter_get_width();
>> diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
>> index 2eda895f19f54..5bfd6a5db75aa 100644
>> --- a/include/clocksource/arm_arch_timer.h
>> +++ b/include/clocksource/arm_arch_timer.h
>> @@ -88,6 +88,7 @@ struct arch_timer_mem {
>>  
>>  extern u32 arch_timer_get_rate(void);
>>  extern u64 (*arch_timer_read_counter)(void);
>> +extern u64 (*arch_timer_read_vcounter)(void);
>>  extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
>>  extern bool arch_timer_evtstrm_available(void);
>>  
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


