Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7373D10371
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uKMid7mHBul9Q0TO4PibzdXQbMZDvFms1DpBKwMu7E=; b=oA9iEUMxI4wEwQHgWH3S6rEU6J
	jmmKXAbTJqbWsdw2b1riOjBAqF/4mfUkZVOQLYStKUGofNsnFnWeybrzC5tfdJgu5wFwKkBkL08+Y
	udiA+3kBMeLejhu4E698yGtwSrKM1hLlPAOg4ed+x1qEhhupJhWUkw3JrK9na7HFu8ONUHKj873jJ
	mdteruLWZd+pluvZ10AFfZt34F7Ogo0Gmpg9bruML0m7GAzNkdpAWsvhWOOXAUJOMRBkbyx/cTs/q
	TFkB+GVVr8PI25SbbSGoKEyynJcCUEzBYpcMFh9uV/VLb4EToezGEUDXmtXSsbWYTn9Jz7d1IWDSr
	z2CvtjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO42o-0000000E9Vd-1sxZ;
	Wed, 26 Nov 2025 01:10:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO42m-0000000E9VE-1AU8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 01:10:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4977066b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764119403; x=1764724203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uKMid7mHBul9Q0TO4PibzdXQbMZDvFms1DpBKwMu7E=;
        b=aI0h6fmDGjQIVLh0OR1KYYnZdW1mszaWSZv7o0Q6f7EJbwCv2gYDUrdEJSuJpa0hNf
         qfEWy+pRrs9VEP/nxVtldY4nVG4hiCsWbvOqe3+DHC1IqZRkg5qhWq+4XYsMVvKqueru
         EWKxXpTXtM6RmXir1VlQLIt/kspSMnHgL7Q9z1ps1iqFo5ru8k8UDOLs+iIinc+fFVt8
         jGrmojQQu+TJuqnlyETO6qi3Gpi+HT2xPg69Aygs3I3pjqZOgA0t3f2dPnPnCPwSvodC
         SYkQCgVGRv7CGijeO7HrsIVb9RaBJjC2jl9bUZ/VJYw2LuEHfjV3bG9MZMZy88XqY6V3
         vFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119403; x=1764724203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uKMid7mHBul9Q0TO4PibzdXQbMZDvFms1DpBKwMu7E=;
        b=NnJ1tQU5Da3t8eZPul3xhQUdaUEBt1kifYG3feBtOerXS2g0kxrX+7kDfio3Anmm0c
         3nYNFSy0NY55Upw0DPloMeKmv5EbRj3NYyrAFQk58G4w1w4RgKPJ0ii5UpnLBcvxZX7L
         PVoY0gnElKWRK3VYNht3hqxMgzk9P/eioNIea1B+9ecafb5h6qicSIDoXQ2WJ8LwJere
         jB2ubcYIBuRwOVE1hPvoFDznRTh+SOeAKjVA79zinNdIJGYLHKkydf5xhtVzQ95AnGY1
         8UB+0vOQaVVdbtfZn/kEqZMYfcqXvix3/AbeUQ5QyqPSzwCs5eHISe+V+2X0h6j3xg+Z
         ZF+w==
X-Forwarded-Encrypted: i=1; AJvYcCV7bQKS+3NdnjVfhZuol3a+eIPVW+meBhyWY8KnGUC0H6QtUzCv1ZYpTQYkflA/5zEB7i9hxSFsEY4gq21XNUOd@lists.infradead.org
X-Gm-Message-State: AOJu0YybUMrQBGGxhEW8EEDz9uYQM67KPI/IkDaK7xkEja3FEsPTsAV5
	2o1L9iBh+aveGEg64+QgxCe7XMIzmVONQJJz4IYvOH2PKPZpx+eTdRMOtpYaMtHjoA==
X-Gm-Gg: ASbGncuSKaYIOnXJmbRq9MRm+MODKV2lbiUG4ptdi+TFa4cWGiiwDhWSjnjrxX76y+c
	jfdK+0OH+frrBSCHZls62+TK91IYbldzSiltnC3XQ9Nnv64wBi5lFfXy+Z0hCxrqOtSp6tHaFPR
	3Vi63PlDdxuE/gDwNWj6WO3aKXWLydpByDzoSBCHQeCXJWVfVv07K17F8Qd4FUCQqr5QclvtISC
	l2oeJG+3rmyu5DN+G7kjd7hEJhmIIRIu5DZA38z/5F0LTCb3QjLilZOx74O8OIWDmlLgRGBRnUh
	eFJIg+0HpD7umTi9MbCisnFJicFyqy/2b9lbcmKWxfQxpmG2v/hYAUlBVV1W73b6aSYZRGp8zIW
	zT3UExrVKmd1FdntzuBzBGuIbpnHvPYnZtaomg7wQe3mFFNkmjLjaCbv0etC6kzJmz5c6fI3yy5
	+M2pMPw1jDhJKuhpQKWMyC8xcODAnYJWPQpjQ/KNW14yicEgNgYiDKAodHPJS3k6frWpR7uVcp5
	GX6r+THg8DxrQ==
X-Google-Smtp-Source: AGHT+IFsz/ljJrcpzA2pBF+IG/pUKgJQ17kleGBABcAzWrEfAKNQP91IPN/fvXc4LjZFpbtSbbWOBg==
X-Received: by 2002:a05:7022:ec16:b0:119:e56b:91da with SMTP id a92af1059eb24-11c9d811990mr11140572c88.11.1764119402831;
        Tue, 25 Nov 2025 17:10:02 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm17216416c88.7.2025.11.25.17.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:10:02 -0800 (PST)
Message-ID: <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
Date: Tue, 25 Nov 2025 17:10:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
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
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_171004_329065_9E43B071 
X-CRM114-Status: GOOD (  33.90  )
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

Hi André,

On 11/23/25 10:21 PM, André Draszik wrote:
> Hi Amit,
>
> Thanks for your patches to enable the charger!

Ack!


>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Define specific bit-level masks for charger's registers and modify the
>> irq mask for charger irq_chip. Also, configure the max77759 interrupt
>> lines as active low to all interrupt registrations to ensure the
>> interrupt controllers are configured with the correct trigger type.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/mfd/max77759.c       | 24 +++++++++++++++++-------
>>   include/linux/mfd/max77759.h |  9 +++++++++
>>   2 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
>> index 6cf6306c4a3b..5fe22884f362 100644
>> --- a/drivers/mfd/max77759.c
>> +++ b/drivers/mfd/max77759.c
>> @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[] = {
>>   };
>>   
>>   static const struct regmap_irq max77759_chgr_irqs[] = {
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
>> +		       MAX77759_CHGR_REG_CHG_INT_AICL |
>> +		       MAX77759_CHGR_REG_CHG_INT_CHGIN |
>> +		       MAX77759_CHGR_REG_CHG_INT_CHG |
>> +		       MAX77759_CHGR_REG_CHG_INT_INLIM),
>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
>> +		       MAX77759_CHGR_REG_CHG_INT2_BAT_OILO |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO |
>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE),
>>   };
>>   
>>   static const struct regmap_irq_chip max77759_pmic_irq_chip = {
>> @@ -486,8 +495,8 @@ static int max77759_add_chained_irq_chip(struct device *dev,
>>   				     "failed to get parent vIRQ(%d) for chip %s\n",
>>   				     pirq, chip->name);
>>   
>> -	ret = devm_regmap_add_irq_chip(dev, regmap, irq,
>> -				       IRQF_ONESHOT | IRQF_SHARED, 0, chip,
>> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT |
>> +				       IRQF_SHARED | IRQF_TRIGGER_LOW, 0, chip,
>>   				       data);
> Please correct me if I'm wrong, but I don't think this makes sense for a
> chained IRQ in this case. What problem does this change fix?

While this patch was meant only for modifying the interrupt mask, I 
added this for consistency because the main SoC -> PMIC line is active 
low. However, I agree it is not strictly necessary here. I will drop it 
in the next revision.


>
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
>> @@ -519,8 +528,9 @@ static int max77759_add_chained_maxq(struct i2c_client *client,
>>   
>>   	ret = devm_request_threaded_irq(&client->dev, apcmdres_irq,
>>   					NULL, apcmdres_irq_handler,
>> -					IRQF_ONESHOT | IRQF_SHARED,
>> -					dev_name(&client->dev), max77759);
>> +					IRQF_ONESHOT | IRQF_SHARED |
>> +					IRQF_TRIGGER_LOW, dev_name(&client->dev),
>> +					max77759);
> dito.

Agreed, will drop.


>
>>   	if (ret)
>>   		return dev_err_probe(&client->dev, ret,
>>   				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
>> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
>>   		return dev_err_probe(&client->dev, -EINVAL,
>>   				     "invalid IRQ: %d\n", client->irq);
>>   
>> -	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
> I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-specific.
> The polarity is meant to be set via DT (and the only current user of this driver
> does so).

You are correct. Since I am already retrieving the trigger type from DT 
via irqd_get_trigger_type() below, I will drop this change.


>>   	irq_flags |= irqd_get_trigger_type(irq_data);
> That's what gets us the config from DT.
>
>>   
>>   	ret = devm_regmap_add_irq_chip(&client->dev, max77759->regmap_top,
>> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
>> index c6face34e385..0ef29a48deec 100644
>> --- a/include/linux/mfd/max77759.h
>> +++ b/include/linux/mfd/max77759.h
>> @@ -62,7 +62,16 @@
>>   #define MAX77759_CHGR_REG_CHG_INT               0xb0
>>   #define MAX77759_CHGR_REG_CHG_INT2              0xb1
>>   #define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
>> +#define MAX77759_CHGR_REG_CHG_INT_AICL          BIT(7)
>> +#define MAX77759_CHGR_REG_CHG_INT_CHGIN         BIT(6)
>> +#define MAX77759_CHGR_REG_CHG_INT_CHG           BIT(4)
>> +#define MAX77759_CHGR_REG_CHG_INT_INLIM         BIT(2)
>>   #define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
>> +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO     BIT(4)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC   BIT(3)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV   BIT(2)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO   BIT(1)
>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
> Even if wireless out of scope, it'd still be nice to add macros for
> the remaining bits to make this complete and avoid having to update
> these again in case wireless support gets added in the future.

I would prefer to only define the macros I am currently using to keep 
the review focused, unless you consider this a strict requirement.


>
> Also, would be nice to keep existing style and indent the bits from
> the registers (see existing bit definitions in this file a few lines
> further up).
> Finally, can you add the bits below the respective register (0xb0 / 0xb1)
> please, to keep suffix meaningful, and to follow existing style for cases
> like this (see MAX77759_MAXQ_REG_UIC_INT1).

I will fix the indentation and ordering in the next revision.

Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver 
defines bits for the register addresses defined in this file. Currently, 
those macros are only used locally by the max77759 charger driver. Would 
you prefer I move those definitions to this header file as well?

BR,

Amit


>
>
> Cheers,
> Andre'

