Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B91CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=; b=scuU841S9SdvqUNkJfOvZhCMXH
	DmmffWHTWq0DKxIK3x7xuwNjKlp87uA+zqwJBKbnke3yvGMtKaxug3t4pvjTW8L0Rj/r64NeG0QdX
	GBA8mHdJIbEduDDG/h3I9jvhdClkHnEcHF7QBlpEcuaoOnq7NEgKuN3VR+MotCQAg2XDZZMRc2Ten
	SHsmyyjAswYskl6LpzVKKLizEmZaKx70WJzBGzaaX9Bt7euSObvL4+vPNOpfABRQaugDIcEDHWF6D
	vVh7RqmOV5ft0L4LVkyCE9uZXizn7zCtHsCUp3RMC/KPJ7+j9Uv5Cb0ykNQVXO5eJ2V6pF8nR4M14
	DdbBHoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNja-000000065Nj-0dqr;
	Mon, 12 Jan 2026 19:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNjZ-000000065NV-2C6O
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 Jan 2026 19:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=; b=RPL//sL5zyKrKsORrL6SzBaK9r
	KZQLXT+AjFKXkrAqBzX8lEGNcSy95xt5pi2C3t7hPwsxJWWEAiVUSAExYgXdBsyL4flSmch+yGWLx
	IRYSj7dI3N0V+QiuMrbI9URke1pnLBnW3pmk/nPljviprR4SvKQ47cseGTe4HXUtjB300JBOPL4fn
	sA7JMh6HulwcXmB7OZ9qegV6o8OiU0sXPK15aOeClVOOxKa5mtBiO7s4slOzqvN0u8cMIdFkAxBTr
	DkxebBXlWPhgIJcbrqDqbAj4ZvH97MR7XNSoFyG5s0TOaSeaI3GcFzc3ZvvNiK+q5wveEKo6ae6d5
	H4SJMgpw==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNjW-00000001WOt-3Pub
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:37:48 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so10377187eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 11:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768246663; x=1768851463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=;
        b=NDDpSpmxu6m9+IUCxUpwskk5So7azBvyp7MlUEoYrtLlTramjpFiFm1giPoyKmzcEr
         bAKRKNK4EP3azaFxCb+jNUxF8BrH8m4m0IKojQPsl3uOAss2W40z9Ok1twv4lTyBfVrS
         NTNsv2KomjO20T5NFg3q5LKZZcF06QuMxAYKoiCfyIvyoV9d9fyDFYae+HgXPLFdUgO9
         RTDJ+bsLblw3l6JAr0BmTwBseRhbUJqTo/Hd8Gy6aGaJ26sC7XjP0+A/gdi2VNI89Ihr
         /4jtOia5njZsC7jzWHrJuhGR4vUKiT/uUXk0LRMHuThMaute4aiwPf2kkv58scEtgVoe
         Ze7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768246663; x=1768851463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=;
        b=fcOpELYO3l7MVcmc+BF3u+Pnk0Q+afF0nUaB64VMSztgxHiHC6UdrQ3DOXgdMKqSvq
         WateDyfRkAnFrscl+7Phgp1u19Mcq/tMGKrvkU+eo020238EyUpYd0dnEq8PdVr+A8QO
         MEI0St/v+E8Z5+LwM0y9+6NzlpCwqfaaQKrkQ1afklrxGk+YfukEZ53XVR7jFHAdnylx
         3wufkKNzD/6Nic+T0qfJn1Zl9fRUO+QSg0KyFrrF39ypZtvdFtdmzUDYMuB4x6nrbdn9
         PMuDa+OhzDelSNZkCoOpDSumduT6Sm05/Icl7PNYJC7DA47mwqnhTMXuKXO5dFgpEMm9
         lvqg==
X-Forwarded-Encrypted: i=1; AJvYcCW/XRFBmTwCKKs+DGi+h0UhkIAoEOnwXBgmkU2VTHAVL0E3efHFFzwPuJCEcjOXq99qo3Wzzg9EfcK/dWDzQOKK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2NN22+9oGqvoa7pJoIDqlH1/DBmAP6sHdKTXTi8fDMYUHwu4h
	wt7V7x2/Oktli8JDwrDbyl7gRqjiYbWMk8NZBGbiDp6ihPk11+e1nnGU7xGegCnFGIc4uMN4Iey
	iwSykLO3k
X-Gm-Gg: AY/fxX5L954BxY8f/Js/nzlKqGpuKubn6skRAXa8vqrjFwzT0Ei6shhpJyZqIDsdmlR
	GMlfB0RkmEOzamGMTOzXSnlgFxicONxVXSswN2H5sVRilA9ZtEjLyromFDov7p4Ns1qGXP9D0UF
	EjynWfAiglxB5eA52+V9+XdyMKsJF0GVjtzsV4J8xi2QhlzcX7zKAJIUhO4cGmxQrquwo3hBcFU
	6i4mjjWNWh6qgbW28opoPeJX3V7Zhkp37AT7LQxdzSNhBT5mRqcVrKDm9L4h7QQZjkDmqHMToML
	LaTxztoP1fvnRtL6QRlIYkKXfYDUWYIctdDzSyvreQr1g+HxIBqocrtDkYg28rZiAd4io/4fNt+
	lqh2I0OGELxMelEKYHZsUQSxTPUbIFMJf2LNUlhI4eKRycO9GzZJjrhFbVZMUR0PZSh5rJIc+9L
	beLiZmP3r7WpFF1uTmqv2ERCF45YSQijLekxFzXg/7HodVJRiYsahUM1HxLt3AsCNJLSdnQ+vY/
	qFzz3Y9WStl8w==
X-Google-Smtp-Source: AGHT+IEmezECFIaAtAhii/tXhYAvteHOsxJwusDFq7+Qy4kltOc3o9BThd5irNt42thvcdsfukrSaA==
X-Received: by 2002:a05:7301:29a5:b0:2b0:3d03:37db with SMTP id 5a478bee46e88-2b17d2e2b29mr11583342eec.35.1768246663076;
        Mon, 12 Jan 2026 11:37:43 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:8e84:2c31:d2b4:9c1f? ([2a00:79e0:2e7c:8:8e84:2c31:d2b4:9c1f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d818sm15886663eec.21.2026.01.12.11.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 11:37:42 -0800 (PST)
Message-ID: <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
Date: Mon, 12 Jan 2026 11:37:40 -0800
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
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_193746_923449_20563225 
X-CRM114-Status: GOOD (  24.03  )
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

Hi Andre',

On 1/12/26 5:47 AM, André Draszik wrote:
> Hi Amit,
>
> On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
>> On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
>>> Hi Andre',
>>>
>>> On 1/5/26 9:32 AM, André Draszik wrote:
>>>> Hi Amit,
>>>>
>>>> I haven't done a full review, but a few things caught my eye.
>>>>
>>>> On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>>>> diff --git a/drivers/power/supply/Makefile
>>>>> b/drivers/power/supply/Makefile
>>>>> index 4b79d5abc49a..6af905875ad5 100644
>>>>> --- a/drivers/power/supply/Makefile
>>>>> +++ b/drivers/power/supply/Makefile
>>>>> [...]
>>>>> +
>>>>> +static irqreturn_t irq_handler(int irq, void *data)
>>>>> +{
>>>>> +    struct max77759_charger *chg = data;
>>>>> +    struct device *dev = chg->dev;
>>>>> +    u32 chgint_ok;
>>>>> +    int i;
>>>>> +
>>>>> +    regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_INT_OK,
>>>>> &chgint_ok);
>>>> You might want to check the return value and return IRQ_NONE if it
>>>> didn't
>>>> work?
>>>>
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(irqs); i++) {
>>>>> +        if (irqs[i] == irq)
>>>>> +            break;
>>>>> +    }
>>>>> +
>>>>> +    switch (i) {
>>>>> +    case AICL:
>>>>> +        dev_dbg(dev, "AICL mode: %s",
>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
>>>>> +        break;
>>>>> +    case CHGIN:
>>>>> +        dev_dbg(dev, "CHGIN input valid: %s",
>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
>>>>> +        break;
>>>>> +    case CHG:
>>>>> +        dev_dbg(dev, "CHG status okay/off: %s",
>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
>>>>> +        break;
>>>>> +    case INLIM:
>>>>> +        dev_dbg(dev, "Current Limit reached: %s",
>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
>>>>> +        break;
>>>>> +    case BAT_OILO:
>>>>> +        dev_dbg(dev, "Battery over-current threshold crossed");
>>>>> +        break;
>>>>> +    case CHG_STA_CC:
>>>>> +        dev_dbg(dev, "Charger reached CC stage");
>>>>> +        break;
>>>>> +    case CHG_STA_CV:
>>>>> +        dev_dbg(dev, "Charger reached CV stage");
>>>>> +        break;
>>>>> +    case CHG_STA_TO:
>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>> +        break;
>>>>> +    case CHG_STA_DONE:
>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>> +        break;
>>>> Are the above debug messages really all needed?
>> I forgot to respond to this comment in my previous email.
>>
>> I think we can keep AICL, BAT_OILO, INLIM. They're either special
>> conditions (AICL) or faulty conditions (like BAT_OILO) and we can in
>> fact keep them at dev_info level. Rest can be removed and a
>> power_supply_changed() is sufficient.
>>
>> Let me know what you think?
> I don't think dev_info() in an interrupt handler is appropriate. At
> least it should be ratelimited.
>
> If it's something special / unexpected that needs attention, having
> a dev_dbg() message only will usually not be visible to anybody.

I agree. I can change the prints to dev_info_ratelimited for the stuff 
we care about.


>
> Also will the call to power_supply_changed() down below handle the
> special conditions (e.g. convey to upper levels)? If not, can it be
> made to do so?

Yes it does, as I can see a call to kobject_uevent() inside 
power_supply_changed_work(). Also, power_supply_changed() also notifies 
other subsystems that have registered their notifiers downstream of this 
power_supply object. So I believe we're good there.

If all the above sounds good, I will proceed with sending the next 
revision including the fixes  :).


BR,

Amit

>
> Cheers,
> Andre
>

