Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C744FCE084
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aioWjLdXxUyHstzZT1QKvuIZCFEGdfnJMxNFjxinubc=; b=NYpZ0IFZgQNmFHslqK2Ob398bs
	McYd6kTwFdjKslrbFzdur5zMp/lUWwxzOki6Ma2McUepisyaQpQT42fWza+TRRYYjwtX8qfwKLAFd
	fQj3awwKyuyO3raVsOfhEHQeayo6OO3RCCA1qZoLyFcHkZlyA7GvVVbSAEFKqqoMAKnGC9JWcQTW4
	ILEMogmnodreL1WwsVuBj/7pllllNTozHonm4ESvtY5WdIUp5yV/FEuGKTOIHwZ+ZQHsYGbmCxJly
	0peMnbE3ulGjQOan45RQjAzseIgV8Iduxz8tADDpzWI6jtBphGn0jvXj3odI1qmezhz9KREXT8tT/
	8Is1lopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbjQ-00000006GNo-10yS;
	Thu, 26 Feb 2026 13:48:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbjO-00000006GNH-1oAE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96761516;
	Thu, 26 Feb 2026 05:48:34 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522DA3F62B;
	Thu, 26 Feb 2026 05:48:40 -0800 (PST)
Message-ID: <aa607343-9dd8-4e96-a7e3-5937fa084891@arm.com>
Date: Thu, 26 Feb 2026 13:48:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clocksource/drivers/arm_arch_timer: Expose a direct
 accessor for the virtual counter
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20260226082234.26707-1-maz@kernel.org>
 <20260226082234.26707-3-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260226082234.26707-3-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_054842_515169_9F8E4B4E 
X-CRM114-Status: GOOD (  22.65  )
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

Hi Marc,

On 2/26/26 08:22, Marc Zyngier wrote:
> We allow access to the architected counter via arch_timer_read_counter().
> However, this accessor can either be the virtual or the physical
> view of the counter, depending on how the kernel has been booted.
> 
> At the same time, we have some architectural features (such as WFIT,
> WFET) that rely on the virtual counter, and nothing else.
> 
> If implementations were perfect, we'd rely on reading CNTVCT_EL0,
> and be done with it. However, we have a bunch of broken implementations
> in the wild, which rely on preemption being disabled and other
> costly workarounds.
> 
> In order to provide decent performance on non-broken HW while still
> supporting the legacy horrors, expose arch_timer_read_vcounter() as
> a new helper that hides this complexity.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/clocksource/arm_arch_timer.c | 5 +++++
>  include/clocksource/arm_arch_timer.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index 90aeff44a2764..4e4a62e1c9439 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -137,6 +137,8 @@ static noinstr u64 arch_counter_get_cntvct(void)
>  u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
>  EXPORT_SYMBOL_GPL(arch_timer_read_counter);
>  
> +u64 (*arch_timer_read_vcounter)(void) __ro_after_init = arch_counter_get_cntvct;
> +
>  static u64 arch_counter_read(struct clocksource *cs)
>  {
>  	return arch_timer_read_counter();
> @@ -931,6 +933,9 @@ static void __init arch_counter_register(void)
>  	}
>  
>  	arch_timer_read_counter = rd;
> +	arch_timer_read_vcounter = (arch_timer_counter_has_wa() ?

This matches what is done for arch_timer_read_counter but it seems a bit
surprising to me that arch_timer_counter_has_wa() is checking that the
workaround is in use and not whether the workaround should be in use. Do
we need to worry about what happens if the workaround fails to be enabled?

> +				    arch_counter_get_cntvct_stable :
> +				    arch_counter_get_cntvct);
>  	clocksource_counter.vdso_clock_mode = vdso_default;
>  
>  	width = arch_counter_get_width();
> diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
> index 2eda895f19f54..5bfd6a5db75aa 100644
> --- a/include/clocksource/arm_arch_timer.h
> +++ b/include/clocksource/arm_arch_timer.h
> @@ -88,6 +88,7 @@ struct arch_timer_mem {
>  
>  extern u32 arch_timer_get_rate(void);
>  extern u64 (*arch_timer_read_counter)(void);
> +extern u64 (*arch_timer_read_vcounter)(void);
>  extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
>  extern bool arch_timer_evtstrm_available(void);
>  

Thanks,

Ben


