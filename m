Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC4BD3CCA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COmQo6MYBxbtzUUO5u+0J0DNbfXimrmm1hv0MrGiH84=; b=gxrJC/fV5Z4dysM3mUbvtS1hCa
	Ml6N4+E6SEZFmN8myWkogXDxa/7kKOyPXJVWvcYiXZByhy67QAIk7bHWaELxh8kNcrDXu7XTG4N58
	ISEDtxY5XwEjtuPe4DliW3LDJyWDzGgy9ZBAZdBye2wzfFAMlozgE6OMOad5dzwKeryndgo1qxQ2N
	poT7DvczU9dmbEu0p5Hm+4agUESnb6A73W3HloBbtNeK/RbfbwDwtJnM+jFTNdk6/Bb4OTQhksIy1
	kFOp03fpK/6EU8fNuR3u2ZREWfJ7lVKqjdMCLUABOYA62hakAbfef8bARY5gONT6xHVUfD9EifAjZ
	fJejdPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDTI-0000000Bb3t-3OST;
	Thu, 15 Jan 2026 02:52:28 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDTF-0000000Bb3D-41SQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:52:27 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so577410eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768445544; x=1769050344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COmQo6MYBxbtzUUO5u+0J0DNbfXimrmm1hv0MrGiH84=;
        b=1sJ+SK7FAz7nmzFzdsdVclc0R/BJ9rJphWlNyhacYH5Elbf+PqUucbVeEd46WKPCqt
         Pd47LAsFp8Aq1LGLkWXvfEfhxuNTsPcLh5sVZx97ztM4Jz4Qg1OVw5nd/Puvh8/Pe+pD
         AekLDVJkAsOxb90SLXmzUfQg4lXZ7+TP8xpyAR96SzmW02SyR83SkLj2ZLK1jQ0/1EsP
         F1Qwip9lfvvFyiBj2gol6dcUdoTkscRQCdO2OL2c29sRfI19aBoO7cmhF2LWARWm5Ydt
         oBXRfvPyol27ZwgUpuEoqqtVuz0AXeHMH3Ja+2s9UVrIDys6pTZQX2uzJUFatIZLrYIu
         7pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768445544; x=1769050344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COmQo6MYBxbtzUUO5u+0J0DNbfXimrmm1hv0MrGiH84=;
        b=RS/eiPXMlt9DS4MSZ4MpySUY4+4Tf7FKP9BnHZOQxPbICuiyJDii8gfalnriseg2G8
         /cPNKxsMih5pSUUff3xy9ZBc79R+w9geJliClfe9X1qMX3jLP+vX6AGQOynU6GeRBShH
         thsiEIzyeSFjF8FPuDgfdbyVw2xa5sS4+rVXK9wN4B+SPLLMB//LQCNlrAFk3qtUqZDn
         29w7Ddkwu7QPkI8sOmN6k8ZLzmFrS5HEYVqGBf6LP8kcUueRoAis0J2y4Gj3wWNeOj30
         3X5inPh18E+MhJrJn+AAfcFws1pidZmgQs14H3z+e5RM+Kd+LlNEX2CVK6Fi1TAe+Si6
         ty8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBdCtoJ9NF6tpZfBPuRIKjuwENfLj45fEAj7uqVCMckXfuhZ2anAlS0pxhBWgydyz1wmcbLz9f+3U/oQtALHl3@lists.infradead.org
X-Gm-Message-State: AOJu0YyUJrjtcz0aIQ4sGLqYK5soto34tQ96LGVI/0jWHURx4LJtdAit
	qi51UqXiSSyxwO8u5hCXAdlI2yyn/n5v7KPGeb0phZo+kPhSWM9X/m399j5THrphtA==
X-Gm-Gg: AY/fxX7RE2vCZ+gQXeivIeP4m+FvzzrYq6iNx3TvFKk6b8pZBBuOv2JRruOGziXXAka
	wbxgOmx7UiNX0SKbimW7KN6ne4wT3kmGLd65Uaqh2kXprfwS4zZdVkOQA+XMT78NhjbOtVhLg9K
	6OeyFKuH3ETj2PSXt06CDnS7JBkAcMwucG+008YVQTUO7e87xsombMm1ebDaK7jpRxPEsMp03Vj
	vmJa+ltCrf9bPbKrmexQLT6D6zMmoPNd7612Mojfvs7z3o2hV/31131H1ITWIvLia2zohieMsIV
	H98tasuYdZGQwew/GgMpe5fBD8JfQy7sCkLZCIafpTOxnrnfRZ/bKMZ70aHl8Y3lqFRocS8bPZr
	FkSyssgxx/1BnaA3Xjcyug3PTvTlyZ7Nc02mIJvdZOFyv7PiO+g/RQm4jU/EM/Rj55N++Q2SpbF
	wLdUW2SEmPaCTaEYWeFL/CjJQAo3bcSKToEQZ34NFlxVUP3YlhaLLPqq3z9gi9AzmLMTjzrddrG
	lX1hOzpj5mobQ==
X-Received: by 2002:a05:7300:f193:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b48f105131mr7217416eec.9.1768445543753;
        Wed, 14 Jan 2026 18:52:23 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:f3e3:a430:9ff4:7b84? ([2a00:79e0:2e7c:8:f3e3:a430:9ff4:7b84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6a5a84333sm181261eec.27.2026.01.14.18.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:52:23 -0800 (PST)
Message-ID: <cf19ac63-c758-45d1-90c3-fe09f5567c64@google.com>
Date: Wed, 14 Jan 2026 18:52:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] power: supply: max77759: add charger driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
 <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
 <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
 <6b37b88e9b7ee57eb1c006916fd995c813ab5e6e.camel@linaro.org>
 <378ee786-2b44-44e7-a3f6-0cd1db3c0481@google.com>
 <48d52ef389ee0e878c36184efbfaa85071f5549a.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <48d52ef389ee0e878c36184efbfaa85071f5549a.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_185226_038855_42215D5E 
X-CRM114-Status: GOOD (  33.38  )
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


On 1/14/26 2:20 AM, André Draszik wrote:
> On Tue, 2026-01-13 at 16:47 -0800, Amit Sunil Dhamne wrote:
>> Hi Andre',
>>
>> On 1/13/26 2:02 AM, André Draszik wrote:
>>> Hi Amit,
>>>
>>> On Mon, 2026-01-12 at 11:37 -0800, Amit Sunil Dhamne wrote:
>>>> Hi Andre',
>>>>
>>>> On 1/12/26 5:47 AM, André Draszik wrote:
>>>>> Hi Amit,
>>>>>
>>>>> On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
>>>>>> On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
>>>>>>> Hi Andre',
>>>>>>>
>>>>>>> On 1/5/26 9:32 AM, André Draszik wrote:
>>>>>>>> Hi Amit,
>>>>>>>>
>>>>>>>> I haven't done a full review, but a few things caught my eye.
>>>>>>>>
>>>>>>>> On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>>>>>>>> diff --git a/drivers/power/supply/Makefile
>>>>>>>>> b/drivers/power/supply/Makefile
>>>>>>>>> index 4b79d5abc49a..6af905875ad5 100644
>>>>>>>>> --- a/drivers/power/supply/Makefile
>>>>>>>>> +++ b/drivers/power/supply/Makefile
>>>>>>>>> [...]
>>>>>>>>> +
>>>>>>>>> +static irqreturn_t irq_handler(int irq, void *data)
>>>>>>>>> +{
>>>>>>>>> +    struct max77759_charger *chg = data;
>>>>>>>>> +    struct device *dev = chg->dev;
>>>>>>>>> +    u32 chgint_ok;
>>>>>>>>> +    int i;
>>>>>>>>> +
>>>>>>>>> +    regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_INT_OK,
>>>>>>>>> &chgint_ok);
>>>>>>>> You might want to check the return value and return IRQ_NONE if it
>>>>>>>> didn't
>>>>>>>> work?
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +    for (i = 0; i < ARRAY_SIZE(irqs); i++) {
>>>>>>>>> +        if (irqs[i] == irq)
>>>>>>>>> +            break;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    switch (i) {
>>>>>>>>> +    case AICL:
>>>>>>>>> +        dev_dbg(dev, "AICL mode: %s",
>>>>>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
>>>>>>>>> +        break;
>>>>>>>>> +    case CHGIN:
>>>>>>>>> +        dev_dbg(dev, "CHGIN input valid: %s",
>>>>>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
>>>>>>>>> +        break;
>>>>>>>>> +    case CHG:
>>>>>>>>> +        dev_dbg(dev, "CHG status okay/off: %s",
>>>>>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
>>>>>>>>> +        break;
>>>>>>>>> +    case INLIM:
>>>>>>>>> +        dev_dbg(dev, "Current Limit reached: %s",
>>>>>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
>>>>>>>>> +        break;
>>>>>>>>> +    case BAT_OILO:
>>>>>>>>> +        dev_dbg(dev, "Battery over-current threshold crossed");
>>>>>>>>> +        break;
>>>>>>>>> +    case CHG_STA_CC:
>>>>>>>>> +        dev_dbg(dev, "Charger reached CC stage");
>>>>>>>>> +        break;
>>>>>>>>> +    case CHG_STA_CV:
>>>>>>>>> +        dev_dbg(dev, "Charger reached CV stage");
>>>>>>>>> +        break;
>>>>>>>>> +    case CHG_STA_TO:
>>>>>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>>>>>> +        break;
>>>>>>>>> +    case CHG_STA_DONE:
>>>>>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>>>>>> +        break;
>>>>>>>> Are the above debug messages really all needed?
>>>>>> I forgot to respond to this comment in my previous email.
>>>>>>
>>>>>> I think we can keep AICL, BAT_OILO, INLIM. They're either special
>>>>>> conditions (AICL) or faulty conditions (like BAT_OILO) and we can in
>>>>>> fact keep them at dev_info level. Rest can be removed and a
>>>>>> power_supply_changed() is sufficient.
>>>>>>
>>>>>> Let me know what you think?
>>>>> I don't think dev_info() in an interrupt handler is appropriate. At
>>>>> least it should be ratelimited.
>>>>>
>>>>> If it's something special / unexpected that needs attention, having
>>>>> a dev_dbg() message only will usually not be visible to anybody.
>>>> I agree. I can change the prints to dev_info_ratelimited for the stuff
>>>> we care about.
>>> If it's an erroneous condition, maybe warn or even err are more appropriate?
>>>
>>> But then, what is the expectation upon the user observing these messages?
>>> What can or should they do? Who is going to look at these and can do
>>> something sensible based on them?
>> The logging will help in postmortem analysis which may or may not
>> possible with just publishing uevents to userspace hoping that they log
>> the psy properties. Illustrating a situation:
>>
>> 1. Over current situation happened where the Battery to System current
>> exceeds the BAT_OILO threshold. This would also generate an interrupt.
>>
>> 2. The MAX77759 takes protective measures if the condition lasts for a
>> certain specified time and reset. Resetting will cause Vsys to collapse
>> to 0 if the system is only battery powered.
>>
>> 3. It'd be better that the BAT_OILO interrupt is logged in dmesg,
>> instead of just delegating it to user space as user can debug this
>> condition by looking at last_kmsg or pstore.
>>
>> 4. This signal can help the user debug conditions such as moisture (this
>> signal + contaminant detection) or indicative of a mechanical failure.
>>
>> I do agree though that this is a hypothetical or very rare situation and
>> if you have a strong opinion against this I am okay with removing the
>> prints completely.
> Thanks for details. OK, they sound useful in this case, but should still
> be warn, not dbg.

Sounds good, will fix.


>>
>>> Also, I just noticed there is a max77705 charger driver. It seems quite
>>> similar to this one, maybe it can be leveraged / extended?
>> Thanks for the feedback. I reviewed the max77705 charger driver. .
>>
>> Here is a breakdown of why I believe a separate driver may be a better
>> approach:
> [...]
>
> Thanks for the analysis, I agree with your conclusion. Mainly I noticed that
> as part of AICL interrupt handling that driver does a bit of work, while here
> we don't. I am wondering if that is applicable here is well.

I double-checked the downstream drivers and datasheet. There exists no 
issue or WAR for max77759. Also, in case of max77759, the current 
limiting will be driven by the hardware and there's no need for software 
intervention. In case of max77705, the driver is explicitly reducing the 
current limit (in max77705_aicl_irq()), implying that hardware is just 
notifying the software to limit current due to (say) poor quality power 
source.


BR,

Amit

>
> Cheers,
> Andre'

