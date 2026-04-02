Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66367D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pfz69QQwM65LngRsXUfQhV7/YTyykBf5GU3oDEmJuVo=; b=uhceKVSbeKTs7wqpWWNRtLIHvL
	Gsc8Is50KBblcBVyvEDH6HMHQFYI6GFDTQ0EMzYMud8IDn7lvIPF274mL4u1nVVrWdlEJhF8ag9gp
	HCOMKOLM3AzGHECAmtXnpd/DhUnYO5EjV92Mth5ojw+axT6Sa6vD9oR1M8ldFa+EZHCQMFfud1NOb
	AVv9qclwWlgFW4Aalyvpy4faAfd4GSlFXuZ0zE0qkn4NnZgS1VsDwEuzkhb29gKMgIPrLtBMjXLE+
	olM2xcXie2iGmpAsQPVW+anjO+Uop7BcP92f4Z8GMrsbxow2N62xXQS2qhTgwqamF6c6wesjOmJk6
	23q1aLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LPm-00000000ZDn-4BgW;
	Thu, 02 Apr 2026 17:01:07 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LPi-00000000ZC9-0tXH;
	Thu, 02 Apr 2026 17:01:05 +0000
Message-ID: <d0d17d65-893d-44c8-a929-92ba5b71d7f6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775149257;
	bh=2OWqMG9cAvyIiZhUJJh6c3apSC/Ro+i93PaoDjc2ohY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TyDduWOpNvxQeMWOJLRKd7O4x57VGwm/FtjFB4aCLFl7jth9inkleHxhtz7dfmZpO
	 ainHsiv56YhFZcMxmPC6M0wdfV/f5bNz9T4fDyPLaFgxbBcKiYU+Tt4hIw74Jodnmh
	 wBAzw0LIaUuYcMk2fb2yJxzZTEAN/qFAlVGgh+tQ=
Date: Thu, 2 Apr 2026 19:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 5/8] thermal: khadas-mcu-fan: Add fan config from platform
 data Add regulator support
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
 <20260402-add-mcu-fan-khadas-vim4-v1-5-2b12eb4ac7b0@aliel.fr>
 <5e3e8684-f893-4fb0-879e-9661820f72dd@linaro.org>
Content-Language: en-US
In-Reply-To: <5e3e8684-f893-4fb0-879e-9661820f72dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100104_545978_11CB71CC 
X-CRM114-Status: GOOD (  17.29  )
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

On 4/2/26 5:39 PM, Neil Armstrong wrote:
> On 4/2/26 16:27, Ronald Claveau wrote:
>> Replace the hardcoded MAX_LEVEL constant and fan register
>> with values read from platform_data (fan_reg, max_level),
>> as new MCUs need different values.
>>
>> Optionally acquire and enable a "fan" regulator supply
>> at probe time and on resume,
>> so boards that gate fan power through a regulator are handled.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   drivers/thermal/khadas_mcu_fan.c | 43 ++++++++++++++++++++++++++++++
>> ++++------
>>   1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/
>> khadas_mcu_fan.c
>> index d35e5313bea41..55b496625e3bd 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
>> @@ -13,13 +13,15 @@
>>   #include <linux/regmap.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/thermal.h>
>> -
>> -#define MAX_LEVEL 3
>> +#include <linux/regulator/consumer.h>
>>     struct khadas_mcu_fan_ctx {
>>       struct khadas_mcu *mcu;
>> +    unsigned int fan_reg;
>>       unsigned int level;
>> +    unsigned int max_level;
>>       struct thermal_cooling_device *cdev;
>> +    struct regulator *power;
>>   };
>>     static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>> @@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct
>> khadas_mcu_fan_ctx *ctx,
>>   {
>>       int ret;
>>   -    ret = regmap_write(ctx->mcu->regmap,
>> KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>> -               level);
>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>>       if (ret)
>>           return ret;
>>   @@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct
>> khadas_mcu_fan_ctx *ctx,
>>   static int khadas_mcu_fan_get_max_state(struct
>> thermal_cooling_device *cdev,
>>                       unsigned long *state)
>>   {
>> -    *state = MAX_LEVEL;
>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>> +
>> +    *state = ctx->max_level;
>>         return 0;
>>   }
>> @@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct
>> thermal_cooling_device *cdev,
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>   -    if (state > MAX_LEVEL)
>> +    if (state > ctx->max_level)
>>           return -EINVAL;
>>         if (state == ctx->level)
>> @@ -83,11 +86,32 @@ static int khadas_mcu_fan_probe(struct
>> platform_device *pdev)
>>       struct device *dev = &pdev->dev;
>>       struct khadas_mcu_fan_ctx *ctx;
>>       int ret;
>> +    const struct khadas_mcu_fan_pdata *pdata =
>> dev_get_platdata(&pdev->dev);
>>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>       if (!ctx)
>>           return -ENOMEM;
>> +
>>       ctx->mcu = mcu;
>> +    ctx->fan_reg   = pdata->fan_reg;
>> +    ctx->max_level = pdata->max_level;
>> +
>> +    ctx->power = devm_regulator_get_optional(dev->parent, "fan");
>> +    if (IS_ERR(ctx->power)) {
>> +        if (PTR_ERR(ctx->power) == -ENODEV)
>> +            ctx->power = NULL;
>> +        else
>> +            return PTR_ERR(ctx->power);
>> +    }
>> +
>> +    if (ctx->power) {
>> +        ret = regulator_enable(ctx->power);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to enable fan power supply: %d\n",
>> ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>>       platform_set_drvdata(pdev, ctx);
>>         cdev = devm_thermal_of_cooling_device_register(dev->parent,
>> @@ -130,6 +154,13 @@ static int khadas_mcu_fan_suspend(struct device
>> *dev)
>>   static int khadas_mcu_fan_resume(struct device *dev)
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    if (ctx->power) {
>> +        ret = regulator_enable(ctx->power);
> 
> Seems you're missing a regulator_disable() on suspend.
> 
> Neil
> 

You right, I will add the regulator_disable on suspend for next version.
Thanks for your feedback.

>> +        if (ret)
>> +            return ret;
>> +    }
>>         return khadas_mcu_fan_set_level(ctx, ctx->level);
>>   }
>>
> 


-- 
Best regards,
Ronald

