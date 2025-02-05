Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA14C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWJMgZaIr7eyfAuY5Dzkz5IEHRAy8S7VHAn+U+qmklk=; b=LmEZK/8umHRmgIIf//cumsGoLM
	g83WDB/mCmexQI7E5wpFaCbN7aJ9tkgXQ4pFdXerwacSkLVp/ChzgK47cP//RX5NYKn7+zJmwGU1C
	6F88c4mQbeuvURakBHIYuMDsWQWhgXshM6gn06ypmMIUlkVaaRZv7xGV1YnatwLxPacPUQscFd255
	TSxJiSG33As2DPmvwwvRys20nVej2Ic+eefJ498Kt7lE6EDTnTK4D3k0jhHeeWyzcP4r722/1IAUC
	/rfBvvddWLAJpdgJC67MOa6GGDNNTk1Lt5oeaT+gU6kgdJcKjr+cfrGBl670UWrZ5eezpXvKhb4C7
	bg/sKq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfasJ-00000002arX-0Sby;
	Wed, 05 Feb 2025 08:35:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfaqv-00000002ah4-26Qt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:33:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso8409758a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738744423; x=1739349223; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWJMgZaIr7eyfAuY5Dzkz5IEHRAy8S7VHAn+U+qmklk=;
        b=LW2Ld3zvtgMVmGQ37p3zpbj9cnspmlnMCZHlorL6Dhw7+i1SvuB7ys8nlU1JCTeerp
         ichU1OL2oekQhH06zKHlHjQN4IdN09KmOZC+wxoMT5QXgkHve6w/IuTZd0+7NMfvd/9z
         14aRX0IvZIGe5nBAKD2X85EgVuUtRvWC2UTzWKE/GpAZEFDadLaEH43MfWXB4cnLBxFz
         WnVoVuNGNyW1XT5QlMS/G27IZA4h0YSD0UN+ctSaVgqMigUlsYo+OANoQAT/KCtzAnjG
         ScwZWA+FZaUivXc2kxOCxiF2zKaWDKQV1E4ZUrnKJDRGpGQ8JXrMXCKCeLy+SZcKS7D3
         KuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744423; x=1739349223;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWJMgZaIr7eyfAuY5Dzkz5IEHRAy8S7VHAn+U+qmklk=;
        b=TQNLVEQ1cEb5y/3QXstSmtnw/S96x74p4dWd/TrmhNyG6yeXm5Il/b3VwBaMCVR3Y8
         cCMgSCDA9daEtJkVCsBRU80z/P8dTqxuYISVNmeO1FuZLb7WzqoTtQxHRJHfRJG8DE/a
         nrmeWr+eNzp2smfDroqpxmHaNkA4x13+X/w03EJllb8H+Y7G87tmqVzqlvidkFEBshwB
         LKLJ5JXOvoBi/bpRNokg7d7JhKtpdkpCoSP9zS8B92a2pOvcybsZJCCCF3PrrYeqbQTP
         TfLyxZjdnn6k+cVq9zZP6L5x9Iu39XypEfu+mcSLgTfMqAh1oxTCuBTsNdj45szgyuPA
         VVcw==
X-Forwarded-Encrypted: i=1; AJvYcCWXvAl6EezMs6nFgv+CERU8md3DhnpgKl2eKHmOkCQXbMS+cxI5XTWJyEvQeGsxflMiTjVlXE8fcmMyLVHey0/E@lists.infradead.org
X-Gm-Message-State: AOJu0YxrtokSQhsNZ2fmpYFeiaFdnj7VHyDjyal7t7KPhRl0p7UUj5kP
	aUvZUgcz9WMq2d1KSf4r8lDptu6fUtKrPVXB1GFTrHVspMJDV7JaosXrYYHYIJY=
X-Gm-Gg: ASbGncte+gdycKvly1Ow6DTxgJ5XlG8anKPW2Y+UZ5PAfJFZ0fhJu7QbbABvd60HDdF
	iQQhpihyKK2MjvwcMsV0VkFEGBExFqNm1Cy8IH/b+JazoSL9aChrMYEtnUpEc/dVkHo8P/ZQayc
	Kn1cmE7MzTHr39mo40ItrjhFSUutySWqo9xacqUjkrxdyn1cxCVG76PAm6T4uCwVwNXj+joTlXh
	H8WYSTiNS4vFuZT3Uj7GPg4iixofx1Qv5KkGRfZW0qdQeBDtvRTMLU8aOBjBe6DSQfvcv9rAye4
	tW0+sE1dn5kzGw80yMAqyZm2
X-Google-Smtp-Source: AGHT+IGEhtb+H3GSiFZ15hfS2O4DULBg79tuO2z8AqJ7PA+RjBlmFu+bQNPdm0vgf5fs1z4uefNclg==
X-Received: by 2002:a17:906:6a1a:b0:ab3:974:3d45 with SMTP id a640c23a62f3a-ab75e24c011mr195996166b.1.1738744423032;
        Wed, 05 Feb 2025 00:33:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff2c6sm1074003866b.96.2025.02.05.00.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:33:42 -0800 (PST)
Message-ID: <567adde6-a348-41c0-b415-80daf16d3dbb@tuxon.dev>
Date: Wed, 5 Feb 2025 10:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <46c8e8ff-ea39-4dbd-a26c-67fcabf4b589@linaro.org>
 <CAPDyKFq40KB6jKapnm0mOkFGB9-7VEGiBhNrVn_2fzrcziq0=Q@mail.gmail.com>
 <20250204143303.0000174a@huawei.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250204143303.0000174a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_003345_636023_4201872E 
X-CRM114-Status: GOOD (  30.18  )
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

Hi, Jonathan,

On 04.02.2025 16:33, Jonathan Cameron wrote:
> On Wed, 15 Jan 2025 16:42:37 +0100
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
> 
>> On Thu, 9 Jan 2025 at 18:34, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>>
>>>
>>> Ulf,
>>>
>>> can you have a look at this particular patch please ?
>>>
>>> Perhaps this scenario already happened in the past and there is an
>>> alternative to fix it instead of this proposed change  
>>
>> I think the patch makes sense.
>>
>> If there is a PM domain that is attached to the device that is
>> managing the clocks for the thermal zone, the detach procedure
>> certainly needs to be well controlled/synchronized.
>>
> Does this boil down to the same issue as
> https://lore.kernel.org/linux-iio/20250128105908.0000353b@huawei.com/
> ?

Yes, as described in the cover letter.

> 
> Just to point out there is another way like is done in i2c:
> https://elixir.bootlin.com/linux/v6.12.6/source/drivers/i2c/i2c-core-base.c#L630
> 
> Register a devres_release_group() in bus probe() and release it before
> the dev_pm_domain_detach() call.  That keeps the detach procedure well
> controlled and synchronized as it is entirely in control of the driver.

From the IIO thread I got that Ulf doesn't consider it a good approach for
all the cases.

Thank you,
Claudiu

> 
> That IIO thread has kind of died out for now though with no resolution
> so far.
> 
> Jonathan
> 
> 
>>>
>>>
>>> On 03/01/2025 17:38, Claudiu wrote:  
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
>>>>    device_release_driver_internal() ->
>>>>      __device_release_driver() ->
>>>>        device_remove() ->
>>>>          platform_remove() ->
>>>>         dev_pm_domain_detach()
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
>>>>    device_release_driver_internal() ->
>>>>      device_unbind_cleanup() ->
>>>>        devres_release_all() ->
>>>>          devm_thermal_of_zone_release() ->
>>>>         thermal_zone_device_disable() ->
>>>>           thermal_zone_device_set_mode() ->
>>>>             rzg3s_thermal_change_mode()
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
>>>>
>>>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
>>>> be used in the upcomming RZ/G3S thermal driver.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>  
>>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>
>> Kind regards
>> Uffe
>>
>>>> ---
>>>>   drivers/thermal/thermal_of.c |  8 +++++---
>>>>   include/linux/thermal.h      | 14 ++++++++++++++
>>>>   2 files changed, 19 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
>>>> index fab11b98ca49..8fc35d20db60 100644
>>>> --- a/drivers/thermal/thermal_of.c
>>>> +++ b/drivers/thermal/thermal_of.c
>>>> @@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
>>>>    *
>>>>    * @tz: a pointer to the thermal zone structure
>>>>    */
>>>> -static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>>>> +void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>>>>   {
>>>>       thermal_zone_device_disable(tz);
>>>>       thermal_zone_device_unregister(tz);
>>>>   }
>>>> +EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
>>>>
>>>>   /**
>>>>    * thermal_of_zone_register - Register a thermal zone with device node
>>>> @@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>>>>    *  - ENOMEM: if one structure can not be allocated
>>>>    *  - Other negative errors are returned by the underlying called functions
>>>>    */
>>>> -static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
>>>> -                                                         const struct thermal_zone_device_ops *ops)
>>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
>>>> +                                                  const struct thermal_zone_device_ops *ops)
>>>>   {
>>>>       struct thermal_zone_device_ops of_ops = *ops;
>>>>       struct thermal_zone_device *tz;
>>>> @@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
>>>>
>>>>       return ERR_PTR(ret);
>>>>   }
>>>> +EXPORT_SYMBOL_GPL(thermal_of_zone_register);
>>>>
>>>>   static void devm_thermal_of_zone_release(struct device *dev, void *res)
>>>>   {
>>>> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
>>>> index 69f9bedd0ee8..adbb4092a064 100644
>>>> --- a/include/linux/thermal.h
>>>> +++ b/include/linux/thermal.h
>>>> @@ -195,13 +195,23 @@ struct thermal_zone_params {
>>>>
>>>>   /* Function declarations */
>>>>   #ifdef CONFIG_THERMAL_OF
>>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
>>>> +                                                  const struct thermal_zone_device_ops *ops);
>>>>   struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
>>>>                                                         const struct thermal_zone_device_ops *ops);
>>>>
>>>> +void thermal_of_zone_unregister(struct thermal_zone_device *tz);
>>>>   void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
>>>>
>>>>   #else
>>>>
>>>> +static inline
>>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
>>>> +                                                  const struct thermal_zone_device_ops *ops)
>>>> +{
>>>> +     return ERR_PTR(-ENOTSUPP);
>>>> +}
>>>> +
>>>>   static inline
>>>>   struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
>>>>                                                         const struct thermal_zone_device_ops *ops)
>>>> @@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
>>>>       return ERR_PTR(-ENOTSUPP);
>>>>   }
>>>>
>>>> +static inline void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>>>> +{
>>>> +}
>>>> +
>>>>   static inline void devm_thermal_of_zone_unregister(struct device *dev,
>>>>                                                  struct thermal_zone_device *tz)
>>>>   {  
>>>
>>>
>>> --
>>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>>
>>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>>> <http://twitter.com/#!/linaroorg> Twitter |
>>> <http://www.linaro.org/linaro-blog/> Blog  
>>
> 


