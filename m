Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A021CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USeovI1td615+m2hPQWxMlhtpdb04/bJ2k3zHNEipJk=; b=S35wYHZ9k1kR0EPgKXGhJR0XZd
	D9elH167zvtIiHuZpVQxABO+CU1/k844xVYdRfJfY9rRR1J+0PxPD6jnwSGbJQPCRGUG2uPSl0GzP
	au54gj1P6xHfWF1CHYVY7TmHX6BN78uRAGwyvBYbg8kLudaApx8XuTob/j308XnQbz3EFl1P0hbCh
	eJ7vvR3DnRrPl9N4RheGuRiTU1DoYGMeOVA5h6zFrFxs6f95JS052ILqt8rMznK7atN9NhepzB5OR
	53tuMA4XOhCA8z63toOl6QkO0yegZ+WcjKnf35I0B8TA9YpasJJS6UIViWDaS6auwreDV9mMVLd0h
	hRRFZiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZiB-0000000HPLU-2Zvg;
	Thu, 14 Aug 2025 15:17:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYXT-0000000H9Jp-1IAd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:02:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso531359f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755180161; x=1755784961; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USeovI1td615+m2hPQWxMlhtpdb04/bJ2k3zHNEipJk=;
        b=gaAM6m/tuEO5dWgagDezh9waOBzI7DYwBdGveb31Lx56twsmBDMIfLcKLczZh8EZLA
         y3w14J5Vx/VwQ9zlYoFTUH3y9Q3RReyW3gPN4iL8GRYmxb2dTRIX4iulP6a1LV7R4bxI
         /qBEyR/3mBt+H8fM1gSKydBmErHIUt77qijwx7HTq7roHRI64XXe17LyRrplwEVpAMM8
         7Gf28cdpBYVSo09XGPqW1tjQS8d51goG7a3veojTcodOUA/tHibbS4sEQxNJtme86B/W
         ezn8sXPkVpvaJMlFa49h/2lCQxI8bskLx4owoLmvxjwaVxy6sSuHjGhpqxYCFVakPQgi
         y4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755180161; x=1755784961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USeovI1td615+m2hPQWxMlhtpdb04/bJ2k3zHNEipJk=;
        b=i7Et5bZW6Kg9ky5KpF0DnWyx7KmXDJIDKl26FwGsY0OwQ8gIHt9AJ9+p1Ze3kd6boc
         RqEQqnMnW7MDwDkUX536Kba2dw/3WxU5ofaD+002YrTcewpEg/Pl1U1Utzo3BDUhg3ds
         qKVGu3cZKPY5U0m3XRM+blDa8wZyQ2rjZ1EeXsx+amj0LOtwNICFugLatnpv/H1GKsN6
         Tk4+u5SZXOYSiKAikWBv1xVleskHaC8MGdpkDu35hNKtUpzq88DE3cuN6+ITbYrKd/i1
         ddrwofKmiQeri7+ToHZiZgybPXt4yLPnJ/nm6/C+sKzmAs/XYTUKRQH2KSUVpih7SeQw
         U6yg==
X-Forwarded-Encrypted: i=1; AJvYcCWFHYZnHebpAZXOs33HA4xICwgnTWHcbeOpYte/UH1a/rG8VEzcClela11ezpyRY2ec337RHD7VTit8G+qGt808@lists.infradead.org
X-Gm-Message-State: AOJu0YySS91+J4OleSrQWmRcszAv//lkHhpI/fPrHaGvVNdg7lQAyFJJ
	QZ4810ymK7ojrRNPpu4c6ksae+p3JrV+aPK3peltSSBmmmgRi7fa+dVK7Gx/G+Em72c=
X-Gm-Gg: ASbGncuKQLpLA3Akf1LhsN7VPPpUDDGCEF/gqcVVr8wjf9XZkumVCE028UrqFF+O8Fx
	e3XMYta3rEvURzxFZLzDVa1Fgb63X0gaMk86FlFci51Sl2FFsKAhu9v9XQoIpPYrJk0xFvdsDbT
	fztdEp6Mat5m56+Pw2Vtal9Ous3vfe/qqfzeC/lYCxmR09xrKP6APuY8bImYyJInCAKjEBe6E15
	T+rpy0Huo557Q+Iu5pFLAoHvKPdrhYX3F0bTPux6UkzAs375TkxHLsxffbPwxPy9hNCRDzRM+Py
	/0S5bcscEiOfAXgwElY0De1t6SmtswH+yp8Dug8kjsSJyGDNd0f/XEdv/lSFscdx+XMZUguG+vJ
	wB5Yp2An3WFpQRnm64R+1+aE002GBHYuXosgA8HoJFBXZ9YH0qvevY79Xa8F0lg==
X-Google-Smtp-Source: AGHT+IERUJslQgwOH4b97ptMQL4N4tOcjICMqR7HsbySu7FxgbLzrjkgYS25JdaV9G4A+kXiHJj3RQ==
X-Received: by 2002:a05:6000:2503:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b9edf1cf68mr2732676f8f.21.1755180161393;
        Thu, 14 Aug 2025 07:02:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b911469bffsm9885157f8f.36.2025.08.14.07.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:02:40 -0700 (PDT)
Message-ID: <52887b08-d5bc-4710-af7c-a70fab5e7f81@linaro.org>
Date: Thu, 14 Aug 2025 16:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clocksource/drivers/arm_arch_timer: Add standalone
 MMIO driver
To: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250807160243.1970533-3-maz@kernel.org>
 <8e58b01b-772d-4ca7-a681-34f10baa07e6@arm.com> <86ldnmdvpl.wl-maz@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <86ldnmdvpl.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_070243_360754_523DE5DF 
X-CRM114-Status: GOOD (  22.08  )
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

On 14/08/2025 12:49, Marc Zyngier wrote:
> On Thu, 14 Aug 2025 11:13:47 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 07/08/2025 17:02, Marc Zyngier wrote:
>>> Add a new driver for the MMIO side of the ARM architected timer.
>>> Most of it has been lifted from the existing arch timer code,
>>> massaged, and finally rewritten.
>>>
>>> It supports both DT and ACPI as firmware descriptions.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>>   MAINTAINERS                               |   1 +
>>>   drivers/clocksource/arm_arch_timer_mmio.c | 420 ++++++++++++++++++++++
>>>   2 files changed, 421 insertions(+)
>>>   create mode 100644 drivers/clocksource/arm_arch_timer_mmio.c
>>>
>> [...]
>>> +static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
>>> +{
>>> +	at->evt = (struct clock_event_device) {
>>> +		.features		   = (CLOCK_EVT_FEAT_ONESHOT |
>>> +					      CLOCK_EVT_FEAT_DYNIRQ),
>>> +		.name			   = "arch_mem_timer",
>>> +		.rating			   = 400,
>>> +		.cpumask		   = cpu_possible_mask,
>>> +		.irq 			   = irq,
>>> +		.set_next_event		   = arch_timer_mmio_set_next_event,
>>> +		.set_state_oneshot_stopped = arch_timer_mmio_shutdown,
>>> +		.set_state_shutdown	   = arch_timer_mmio_shutdown,
>>> +	};
>>> +
>>> +	at->evt.set_state_shutdown(&at->evt);
>>> +
>>> +	clockevents_config_and_register(&at->evt, at->rate, 0xf, CLOCKSOURCE_MASK(56));
>>
>> This doesn't work on 32 bit - clockevents_config_and_register()'s final
>> argument is an unsigned long, and a 56 bit mask doesn't fit. This
>> triggers a compiler warning:
> 
> Already reported, see 20250814111657.7debc9f1@canb.auug.org.au.
> 
>> Possible this should really be min(CLOCKSOURCE_MASK(56), ULONG_MAX)? But
>> I'm not familiar enough with this code. Most likely it's dead code on a
>> 32 bit platform.
> 
> No, this definitely exists on 32bit crap, since it has been part of
> the architecture from the ARMv7+VE days.
> 
> I think this is more of an impedance mismatch between the
> CLOCKSOURCE_MASK() helper and the clockevents_config_and_register(),
> and a (unsigned long) cast would do the trick.
> 
> But it also means that the per-cpu timer also gets truncated the same
> way, and that has interesting impacts on how often the timer is
> reprogrammed.
> 
> Daniel, do you want a patch on top or a new series?

A new series please

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

