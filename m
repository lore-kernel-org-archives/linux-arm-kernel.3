Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD979C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZkCTIkoEPF/4oXgPPxT3DQfkcNtTOcqqQ2VA82+SL4=; b=eB6zQOohCfXriHzVvd0YOqUKT+
	rq0qh0N6qvNk3eTt6L9uXW6QulaiXFYIatcyXMN5fwMv1ThgmoZE4lBvm7Fxzn13jwS2QblPV++dk
	qpUKXEMRPtb9yZRYJJqg87M7w2nKTBSHOLX/tJ7AdWycLQgm+lO5mI4tpWSu3hz/D54h+G6WHVKuc
	9ABfwke+6ssRWkD1N8AkDHQA9d5THBtD2Jy5imI7zu2mUONcrT8ijIB1yh7vtaV8m4i8fi3KCwDfh
	eWRAT6X6J+Q9Czx/NO7J8wUyf5XOwaWckx0XkYkdzXC4+/PFsUdxXzpVTKhyzatKI71vRBEc6QNdY
	rrT8fsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZEh-00000004u1f-3PKM;
	Fri, 23 May 2025 20:43:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZB7-00000004tnj-3U4M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 20:39:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so1462465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748032780; x=1748637580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZkCTIkoEPF/4oXgPPxT3DQfkcNtTOcqqQ2VA82+SL4=;
        b=FpkYZTG40GevDTIvqBDqDkkjVMVFW81TOrey9k/zU0fm7V5GJaeRduA7uZ1nH6LHOr
         /ka52hryqoqRhMOBwu7+hdBUSsTwh2ZI1QTDJXCa7HALhdxM86ngPmja+nK44aPF8k8L
         jJLLGlHT98Gr7H7biMB3D91Ztei3WV1qi5aRcqtKWHIcVu+4LL+hrlNGegdpPQSiKaDl
         PDaRxYY02UWOR6SJYP/a3Y3Yv7/nQU8PtIgh0mQTuxjtvzmZnV9K+s52ifGAHU937J0h
         2xEAK3b/2I8mGYFrqbItmz7zgdW8vvf8UHlN9uSIxs7GELPt212GqsoLsulhUm/+8nXM
         FMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748032780; x=1748637580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZkCTIkoEPF/4oXgPPxT3DQfkcNtTOcqqQ2VA82+SL4=;
        b=WGepOX+IIsc/oLQL/fYKf+7G2AymP4v3GLBz9yvymL8avFZucY/h9NkP9W/KB77VWw
         92Tl1cwrs+gY1eAWHXW8ACwqsRcevK9gnLGDUtpcpFjnWn0WEEoRRottIwa1I/7At3En
         OsRp24TA2SngQgwuh82RHZhsMIZWxlbu/jyK5dnajuKs0iHS7QFg3XhlWRnJi5Q5XHj6
         eze7QW/1PW+0eAtXXHkjSL151dz/Egw7qtqVURTGKPfgzq9TCoZ6vRglKdVjqPPmn/GY
         9CgtS/Of99/xy1jDC27c+j0M9crhuleXCTF+frjZVCJdXetVqh6Ad+4RnY3VkzlVvbkm
         6Phg==
X-Forwarded-Encrypted: i=1; AJvYcCWTxyLUJu0nJMAnMbNSQ4p7QNjA1Y4xADs6C1dAFjw3Y36BTWlCNgsHgYxgnJT+1Q1/++n+Ds+o/836R3ArIQ+y@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ5yY7P4rvYcV3pCQ3bCjAJ25k8KQBqj5CRu4j4v0u+FR4YL6q
	2BeR8/FZKa6TOYrxE/DAxIIAf5nDZ367dHrMC7i6cTa9DztLB4z9gHUdC8dCNH7xOOk=
X-Gm-Gg: ASbGnctmzlysDmLCgJdXwjDZ37swBXMt3pcVVtenF/M8zRYA0TImgexyLo5/fi8by16
	bJJfGsjrVUE9iPBgVt+N0nWMoWpVK7O/IuBabhAo661KvNFSxGP2V/uX+DsC/PkB/OEVj7hnF6P
	5orujjK1LfA8Q66NXffcQhrX0qvdZBvV8yWzUvUphaPW4xbjUHSKCzNgZ8Tb15o7+US6bkarVj0
	4l7Ko1PFXRzfb2FKHAgpZD3buEABokmnlEkYHX296E0r0Ukvlln9Q4ZsnXieOPgkhStnCybKXxs
	0IwBMY+0++9+U2gDU1NPQKQArCA7tkKBWC0HSo1d+BvlInHeHIN6XIlk2YomPxQPtkNBPZqp+Ha
	zDo/+UkaXMffwj0M=
X-Google-Smtp-Source: AGHT+IF+UKW8HXeZsU44cfHfwETg11ROq2OaSMViVe7RnCpQ7MvNy+FadpEX11AaD2NWQvNTnzfJag==
X-Received: by 2002:a05:600c:c87:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-44c933ed842mr3184365e9.32.1748032779933;
        Fri, 23 May 2025 13:39:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm148920565e9.18.2025.05.23.13.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 13:39:39 -0700 (PDT)
Message-ID: <f2f914aa-c554-4135-afaa-f075537ed929@linaro.org>
Date: Fri, 23 May 2025 22:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Saravana Kannan <saravanak@google.com>,
 William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
 <aDCrGT67ubNNUoUz@google.com>
 <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_133941_887154_9845D2D9 
X-CRM114-Status: GOOD (  38.83  )
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

On 23/05/2025 20:06, Saravana Kannan wrote:
> On Fri, May 23, 2025 at 10:06 AM William McVicker
> <willmcvicker@google.com> wrote:
>>
>> On 05/23/2025, Daniel Lezcano wrote:
>>>
>>> Hi William,
>>>
>>> On 15/05/2025 01:16, William McVicker wrote:
>>>> On 05/13/2025, Daniel Lezcano wrote:
>>>>> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
>>>>>> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
>>>>>> <daniel.lezcano@linaro.org> wrote:
>>>>>>> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
>>>>>>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>>>>>>
>>>>>>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>>>>>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>>>>>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>>>>>>> source for the arch_timer.
>>>>>>>
>>>>>>>   From a previous thread where there is no answer:
>>>>>>>
>>>>>>> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
>>>>>>>
>>>>>>> I don't feel comfortable with changing the clocksource / clockevent drivers to
>>>>>>> a module for the reasons explained in the aforementionned thread.
>>>>>>
>>>>>> I wasn't CC'ed on that, but to address a few of your points:
>>>>>>
>>>>>>> I have some concerns about this kind of changes:
>>>>>>>
>>>>>>>     * the core code may not be prepared for that, so loading / unloading
>>>>>>> the modules with active timers may result into some issues
>>>>>>
>>>>>> That's a fair concern, but permanent modules (which are loaded but not
>>>>>> unloaded) shouldn't suffer this issue. I recognize having modules be
>>>>>> fully unloadable is generally cleaner and preferred, but I also see
>>>>>> the benefit of allowing permanent modules to be one-way loaded so a
>>>>>> generic/distro kernel shared between lots of different platforms
>>>>>> doesn't need to be bloated with drivers that aren't used everywhere.
>>>>>> Obviously any single driver doesn't make a huge difference, but all
>>>>>> the small drivers together does add up.
>>>>>
>>>>> Perhaps using module_platform_driver_probe() should do the trick with
>>>>> some scripts updated for my git hooks to check
>>>>> module_platform_driver() is not used.
>>>>
>>>> Using `module_platform_driver_probe()` won't work as that still defines
>>>> a `module_exit()` hook. If you want to automatically handle this in code, then
>>>> the best approach is to follow what Saravana did in [1] for irqchip drivers.
>>>> Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
>>>> define the `module_init()` hook when the driver is compiled as a module which
>>>> ensures you always get a permanent module.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/
>>>
>>> Thanks for the pointer and the heads up regarding the module_exit() problem
>>> with module_platform_driver_probe().
>>>
>>> After digging into the timekeeping framework it appears if the owner of the
>>> clockevent device is set to THIS_MODULE, then the framework automatically
>>> grabs a reference preventing unloading the module when this one is
>>> registered.
>>>
>>> IMO it was not heavily tested but for me it is enough to go forward with the
>>> module direction regarding the drivers.
>>
>> Great! Thanks for looking into that. I'll add that in the next revision and
>> verify we can't unload the module.
> 
> Daniel, is the module_get() done when someone uses the clock source or
> during registration? Also, we either want to support modules that can
> be unloaded or we don't. In that case, it's better to make it explicit
> in the macros too. It's clear and it's set where it matters. Not
> hidden deep inside the code -- 

Why do you want to unload ?

That is another aspect and the time framework is not totally ready for 
that. So I would consider for the moment to load only.

> I tried to find the answer to my
> question above and it wasn't clear (showing that it's not obvious).

Globally the idea would be to take a ref to the module when the 
clockevent or the clocksource is in use and release the ref when it is 
unused. That needs an extra function unregister_clockevent_device() and 
a verification of the current time core code to check if the ref is 
get/put correctly which is, after investigating a bit, not correct at 
the first glance.

>>> One point though, the condition:
>>>
>>> +#ifdef MODULE
>>> [ ... ]
>>> +static const struct of_device_id exynos4_mct_match_table[] = {
>>> +     { .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
>>> +     { .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
>>> +     {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
>>> +
>>> +static struct platform_driver exynos4_mct_driver = {
>>> +     .probe          = exynos4_mct_probe,
>>> +     .driver         = {
>>> +             .name   = "exynos-mct",
>>> +             .of_match_table = exynos4_mct_match_table,
>>> +     },
>>> +module_platform_driver(exynos4_mct_driver);
>>> +#else
>>>   TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>>   TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>> +#endif
>>>
>>>   is not acceptable as is. We don't want to do the same in all the drivers.
>>
>> Are you suggesting we create a new timer macro to handle if we want to use
>> TIMER_OF_DECLARE() or builtin_platform_driver()?
> 
> One you convert a driver to tristate, there's no reason to continue
> using TIMER_OF_DECLARE. Just always do the "module" approach. If it
> gets built in, it'll just initialize early?
> 
> What am I missing?

TIMER_OF_DECLARE relies on a mechanism building an array at compile 
time. It is called very early in the boot process.

What would be nice is to introduce something like 
TIMER_OF_MODULE_DECLARE() where builtin means TIMER_OF_DECLARE and 
module means module_platform_driver()



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

