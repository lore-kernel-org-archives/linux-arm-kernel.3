Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199B3CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s87vul4GTTme+0lGPMBdBtc6n1F5J2K8K2+8KOsQY00=; b=eiqiHBeCFIwdplBEnRP8fQAfMn
	ZRygFclu/9Au1B2NfOj7CGT0eVpsZNszI+MSMPQqnp1KWuotX2AFPZhLO613S+0rykzuPSwZXy5dY
	G1gNu/2fEM0txrFKv1sgVvb+o+RRXqExxmzcsygeHQ0zJXIVNOsLA8vkh3AXsSoEFZJ1rInJ0GNrw
	fotgqpre9BZQJphht5+w1G9ElZDr5ttwcEjqP9lKryHgWSsqbXhaaDMM0z3hHggS0McG+JQD8D6xS
	4uxz+yb+T57PMoXMtFHIA9DbMX8Kam9k8PEIfRpL0gTec8bpHeoElyb9DqboyG2YWhvC/T4hPZXG9
	cq7WylsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umY2J-0000000H3XB-17vq;
	Thu, 14 Aug 2025 13:30:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWzT-0000000GqIv-0pXp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:23:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8BD41688;
	Thu, 14 Aug 2025 05:23:21 -0700 (PDT)
Received: from [10.1.32.48] (e122027.cambridge.arm.com [10.1.32.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65203F738;
	Thu, 14 Aug 2025 05:23:27 -0700 (PDT)
Message-ID: <d3bd4234-2053-45ce-aad4-6fc577665d72@arm.com>
Date: Thu, 14 Aug 2025 13:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clocksource/drivers/arm_arch_timer: Add standalone
 MMIO driver
To: Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250807160243.1970533-3-maz@kernel.org>
 <8e58b01b-772d-4ca7-a681-34f10baa07e6@arm.com> <86ldnmdvpl.wl-maz@kernel.org>
 <871ppetatg.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <871ppetatg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_052331_327230_C59D66F0 
X-CRM114-Status: GOOD (  19.87  )
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

On 14/08/2025 12:14, Marc Zyngier wrote:
> On Thu, 14 Aug 2025 11:49:26 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Thu, 14 Aug 2025 11:13:47 +0100,
>> Steven Price <steven.price@arm.com> wrote:
>>>
>>> On 07/08/2025 17:02, Marc Zyngier wrote:
>>>> Add a new driver for the MMIO side of the ARM architected timer.
>>>> Most of it has been lifted from the existing arch timer code,
>>>> massaged, and finally rewritten.
>>>>
>>>> It supports both DT and ACPI as firmware descriptions.
>>>>
>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>> ---
>>>>  MAINTAINERS                               |   1 +
>>>>  drivers/clocksource/arm_arch_timer_mmio.c | 420 ++++++++++++++++++++++
>>>>  2 files changed, 421 insertions(+)
>>>>  create mode 100644 drivers/clocksource/arm_arch_timer_mmio.c
>>>>
>>> [...]
>>>> +static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
>>>> +{
>>>> +	at->evt = (struct clock_event_device) {
>>>> +		.features		   = (CLOCK_EVT_FEAT_ONESHOT |
>>>> +					      CLOCK_EVT_FEAT_DYNIRQ),
>>>> +		.name			   = "arch_mem_timer",
>>>> +		.rating			   = 400,
>>>> +		.cpumask		   = cpu_possible_mask,
>>>> +		.irq 			   = irq,
>>>> +		.set_next_event		   = arch_timer_mmio_set_next_event,
>>>> +		.set_state_oneshot_stopped = arch_timer_mmio_shutdown,
>>>> +		.set_state_shutdown	   = arch_timer_mmio_shutdown,
>>>> +	};
>>>> +
>>>> +	at->evt.set_state_shutdown(&at->evt);
>>>> +
>>>> +	clockevents_config_and_register(&at->evt, at->rate, 0xf, CLOCKSOURCE_MASK(56));
>>>
>>> This doesn't work on 32 bit - clockevents_config_and_register()'s final
>>> argument is an unsigned long, and a 56 bit mask doesn't fit. This
>>> triggers a compiler warning:
>>
>> Already reported, see 20250814111657.7debc9f1@canb.auug.org.au.
>>
>>> Possible this should really be min(CLOCKSOURCE_MASK(56), ULONG_MAX)? But
>>> I'm not familiar enough with this code. Most likely it's dead code on a
>>> 32 bit platform.
>>
>> No, this definitely exists on 32bit crap, since it has been part of
>> the architecture from the ARMv7+VE days.
>>
>> I think this is more of an impedance mismatch between the
>> CLOCKSOURCE_MASK() helper and the clockevents_config_and_register(),
>> and a (unsigned long) cast would do the trick.
> 
> Of course not. That would just result in a big fat zero.

No - CLOCKSOURCE_MASK() turns into GENMASK_ULL so a simple truncation to
unsigned long would be ULONG_MAX (all 1s). So an unsigned long cast
should be fine. My suggestion of MIN(, ULONG_MAX) was just to make that
more clear.

>> But it also means that the per-cpu timer also gets truncated the same
>> way, and that has interesting impacts on how often the timer is
>> reprogrammed.
> 
> That question still stand, and I wonder whether we have ugly bugs
> lurking on 32bit platforms because of that... I'll try and have a
> look.

I don't know whether there are other bugs due to the capping to
ULONG_MAX, but I don't think there's an (additional) bug here, it's
"just" a ugly warning.

Thanks,
Steve


