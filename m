Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8ADFCE07F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fOC6G5oitZY2VH1tsmRRiibKlfVA1cBXkfWhwNNi5c=; b=OPeQERaiK9jOusbTQ6UgH/LFBk
	KxnfHpPx+czmABGYIIqGIv56x83FRhzKedwPRwvmHMfYACoBlhVMpBs1EVP2AY07k//kFmUnV/q26
	HAV2zeZURvtNxA7r8FRqC5AAwGNKqSsbK2kbQ+LFKJp5A9QSJJuouOUggJgFcxt6ik/pUiZeMWBKB
	mssfBGDObTK2x4zG4mLiQi4GMPWlXn9qGhZkFz48Li5EGdDFahQ1w76+yPbyXwRjWDXZr+14Ne5Mp
	8ks32TbSmotIwEb9nQjdOkvgSRDPrO/Kk5SREeKyg99qSy1zLGQ98yy5XEI9lZpuWJc9hCuxCaxX2
	DW+tt+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbXl-00000006EMB-1MU0;
	Thu, 26 Feb 2026 13:36:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbXi-00000006ELn-3Y8g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:36:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BD141516;
	Thu, 26 Feb 2026 05:36:31 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78E083F62B;
	Thu, 26 Feb 2026 05:36:36 -0800 (PST)
Message-ID: <282125fe-99b8-4c85-9e6a-808b00ae21de@arm.com>
Date: Thu, 26 Feb 2026 13:36:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: WFxT fixes, take #2
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20260226082234.26707-1-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260226082234.26707-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_053638_955956_66A4A32A 
X-CRM114-Status: GOOD (  15.75  )
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
> After my previous WFxT fix went in 7.0-rc1 as 29cc0f3aa7c64 ("arm64:
> Force the use of CNTVCT_EL0 in __delay()"), Ben reported that it isn't
> playing nice with preemption, due to the use of the timer workaround
> percpu variable. This series tries to address this, and propose a
> hopefully better alternative.
> 
> That alternative is in the form of a new "virtual counter" accessor,
> available in the same way arch_timer_read_counter() is, except that it
> is guaranteed to be the virtual counter. This helper (a function
> pointer, really) is updated on each CPU boot in the same manner the
> counter accessor is.
> 
> This is then plugged into the __delay() helper, providing the expected
> guarantees (and resulting in a much nicer code gen).
> 
> Patches on top of -rc1.
> 
> Marc Zyngier (3):
>   arm64: Fix sampling the "stable" virtual counter in preemptible
>     section
>   clocksource/drivers/arm_arch_timer: Expose a direct accessor for the
>     virtual counter
>   arm64: Convert __delay_cycles() to arch_timer_read_vcounter()
> 
>  arch/arm64/lib/delay.c               | 5 ++++-
>  drivers/clocksource/arm_arch_timer.c | 5 +++++
>  include/clocksource/arm_arch_timer.h | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 

I checked with just the first patch applied and with all the patchs
applied. In both case I no longer see the preemption warnings on the s/w
model FVP Base C with CONFIG_DEBUG_PREEMPT.

Tested-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


