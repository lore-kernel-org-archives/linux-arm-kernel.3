Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E2BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wXtZy6LMBzv/duDzrc4vs7XbX/T/7y1xABAgQu3rKE=; b=SqsuV3vKduf3X1kjKm33SDIaCl
	BLp/kQmCaV6G4u6YVu1UP63HcnOduFShIa/2MB4Ao2asyo1W1TXPwXssR8IASiNZtSK78GqX1LtCF
	/Na4nS+HJSCYe5+n90j0p4aZEiReODZVdkiw4Dc7WHdfGrhcaAiG/NFNCVU9Kb+q8wEoV8L+fgBD7
	KkjQjkxiRrplzAyN2O5gJ8ee3TUqcHxP+l+t6LPm/OU7sURpaRoMrXPQCosmvzgeerLQ35MeHBwLg
	EaiY6hHhshW7CXYePNfhTgJVJ+iNzoioA2FtPfQ2ks4r2QGwsFvhbidNBvtoXvdw2YNxiu7td7lmZ
	MiU48BJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRq2-00000008dC4-1Pef;
	Thu, 30 Jan 2025 10:31:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRoO-00000008d24-0UIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:30:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862d161947so318696f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738233014; x=1738837814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wXtZy6LMBzv/duDzrc4vs7XbX/T/7y1xABAgQu3rKE=;
        b=K5Ub4YDlxz+R3cWUU44rf+dPU+EfQ1KV28mH+Gw49sqpXjc6J6LI62F/D6lT54l1uU
         qUkUH0nBVDHjvwYmp/szfo8O04zUySOkc86t7pV+HwUiqKGKtjmEwgq8TrY4TUcmUlem
         VGibx2P8frpKMIm5RH2H6MugFZvcN0cTVGkdslTSBP47DG48JXtsI7M1O+wTPEwfYFwO
         dMceW+nYMC3SZ8GHmP0EoFRyf4iAEO77zbj2b1IKk9QGZDb7sr16fliJLYO/aNlkb3kx
         ZFEKd+zMvTPPZ8dTmXhLjCKxzTzuGj6p3yyOlc+Rt+IKg75AQphaVaRkPdM8v5v3VMKJ
         TqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233014; x=1738837814;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wXtZy6LMBzv/duDzrc4vs7XbX/T/7y1xABAgQu3rKE=;
        b=rilo8ZVX6HCwxxldY9qbRy1hSUJSiREPy2Y7uMqS5uOGBMedgwLfjKK1iHb3NirlaG
         vMk/LfLGNeg5zdQ/vcL+ukMEpc+yhc9y/yPL6ImTd6/J2ruDnvrovekMLwI0n4B68cEu
         rWEghpD/dGrQ07fYJNxmgf5S46AJhCnBrFhhQWxn9rdaNiW4HRA8ihwnQM9tmROGfUoG
         bbQ6lx7j+3k5d/PWvxxflwqbmwLrfA2ngYQQiicqS7KLDcUaWTD8CVlr739krZLr1mbE
         +XBfKBlf2aATfkU9k7P7wpC5tXr/FeiJMft22mtpqV+LqlBbsodZ9uWRklQ5nNvEbFmb
         DhXw==
X-Forwarded-Encrypted: i=1; AJvYcCWdANMkdy5djNS3Dja1GJ6comFhNhrJuElnNY3Ua+/OlTzoVxpEx4NowdhEv76OwYhGVTRxbJ+pc9FZaPGinU6R@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ1mbEJFyX+PIty60+5hns6uvrjqN9IbO1EFrvGccEECMzMZ9g
	f+YyMJmaaktae//j6KsYkdtKWhmMPEYi7nhzwtMTHh4I+mfw/211xUY6MEHPV1s=
X-Gm-Gg: ASbGncv/koB0ybIJWnr3gop5ioGGWdTBS5LwnF3aU9LSQKvTEaVHYuAvXjqXD01sS7p
	javVCiYvvbYE2lqtXUZRyCVHHoqWkyE1XQZOCYawuhz+tTsIqAKBQQYxis0bosJPiQcu6FJWGm6
	TKxnu6oXGWLYLNRENgRsQw6G8iHma6Dq1XMAIEvqc5SBnBlOZpQFdm6VBQb6l77OTdkugtADE2p
	2soi27/omgEcxfBIcBil+9w6TE2Z1lb9KAqP2xUAGIxr1zq3T/nBHaGK3oBWVrdrGQ1AWPZUhxF
	PLopZtNK2doXAaZA1NOebT4Y
X-Google-Smtp-Source: AGHT+IFRsLdabS1EP/8zZABqYuIxLkY55xahqM3ApidGDdm8kd9LPTBfoVk1hedbQbX+OgyCR0PRRg==
X-Received: by 2002:a05:6000:1548:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38c51973d2fmr6410045f8f.23.1738233014363;
        Thu, 30 Jan 2025 02:30:14 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf53asm1512693f8f.87.2025.01.30.02.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:30:13 -0800 (PST)
Message-ID: <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Date: Thu, 30 Jan 2025 12:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <Z5tPR_tv7vWDkUI7@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_023016_165307_95388D52 
X-CRM114-Status: GOOD (  30.17  )
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



On 30.01.2025 12:07, Daniel Lezcano wrote:
> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>> Hi, Daniel,
>>
>> On 29.01.2025 19:24, Daniel Lezcano wrote:
>>> Hi Claudiu,
>>>
>>> On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
>>>> clocks are managed through PM domains. These PM domains, registered on
>>>> behalf of the clock controller driver, are configured with
>>>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
>>>> clocks are enabled/disabled using runtime PM APIs.
>>>>
>>>> During probe, devices are attached to the PM domain controlling their
>>>> clocks. Similarly, during removal, devices are detached from the PM domain.
>>>>
>>>> The detachment call stack is as follows:
>>>>
>>>> device_driver_detach() ->
>>>>   device_release_driver_internal() ->
>>>>     __device_release_driver() ->
>>>>       device_remove() ->
>>>>         platform_remove() ->
>>>> 	  dev_pm_domain_detach()
>>>>
>>>> In the upcoming Renesas RZ/G3S thermal driver, the
>>>> struct thermal_zone_device_ops::change_mode API is implemented to
>>>> start/stop the thermal sensor unit. Register settings are updated within
>>>> the change_mode API.
>>>>
>>>> In case devres helpers are used for thermal zone register/unregister the
>>>> struct thermal_zone_device_ops::change_mode API is invoked when the
>>>> driver is unbound. The identified call stack is as follows:
>>>>
>>>> device_driver_detach() ->
>>>>   device_release_driver_internal() ->
>>>>     device_unbind_cleanup() ->
>>>>       devres_release_all() ->
>>>>         devm_thermal_of_zone_release() ->
>>>> 	  thermal_zone_device_disable() ->
>>>> 	    thermal_zone_device_set_mode() ->
>>>> 	      rzg3s_thermal_change_mode()
>>>>
>>>> The device_unbind_cleanup() function is called after the thermal device is
>>>> detached from the PM domain (via dev_pm_domain_detach()).
>>>>
>>>> The rzg3s_thermal_change_mode() implementation calls
>>>> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
>>>> accessing the registers. However, during the unbind scenario, the
>>>> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
>>>> Consequently, the clocks are not enabled, as the device is removed from
>>>> the PM domain at this time, leading to an Asynchronous SError Interrupt.
>>>> The system cannot be used after this.
>>>
>>> I've been through the driver before responding to this change. What is the
>>> benefit of powering down / up (or clock off / on) the thermal sensor when
>>> reading the temperature ?
>>>
>>> I can understand for disable / enable but I don't get for the classic usage
>>> where a governor will be reading the temperature regularly.
>>
>> I tried to be as power saving as possible both at runtime and after the IP
>> is not used anymore as the HW manual doesn't mentioned anything about
>> accuracy or implications of disabling the IP clock at runtime. We use
>> similar approach (of disabling clocks at runtime) for other IPs in the
>> RZ/G3S SoC as well.
>>
>>>
>>> Would the IP need some cycles to capture the temperature accurately after the
>>> clock is enabled ?
>>
>> There is nothing about this mentioned about this in the HW manual of the
>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>> - wait at least 3us after each IIO channel read
>> - wait at least 30us after enabling the sensor
>> - wait at least 50us after setting OE bit in TSU_SM
>>
>> For this I chose to have it implemented as proposed.
> 
> IMO, disabling/enabling the clock between two reads through the pm runtime may
> not be a good thing, especially if the system enters a thermal situation where
> it has to mitigate.
> 
> Without any testing capturing the temperatures and compare between the always-on
> and on/off, it is hard to say if it is true or not. Up to you to test that or
> not. If you think it is fine, then let's go with it.

I tested it with and w/o the runtime PM and on/off support (so, everything
ON from the probe) and the reported temperature values were similar.

Thank you,
Claudiu

>  
>> If any, the HW manual is available here
>> https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591
>> (an archive is here; the manual is in Deliverables/r01uh1014ej0110-rzg3s.pdf)
>>
>> Thank you for your review,
>> Claudiu
>>
>>>
>>>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
>>>> be used in the upcomming RZ/G3S thermal driver.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
> 


