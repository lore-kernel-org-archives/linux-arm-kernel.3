Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E33C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO64nb8Wo3rmY+NlSzYsAo8VOmgXYduHQkU+jiDicSY=; b=0rOVOQKC7G1yZWcB8MfiMr7B4D
	lsPTQlX93SvO/EjBDJiiiwToOdsIRFe7d1GCBiUnmdxYDNOwnZRkj/VURn6kJQ+ATB91tRGvI7rgI
	vehNFnFwFB7mdwQfYyh+asInufOar4niCWmG6VCupHQp9n6LVVlN9MF11dVH93+1Yo1nfQ1bO7C0f
	u96jY5KDLsxSdTox2hGDz+N5IN5JwGz2Ci/B3N8q6wHnSMzgXNsBs0PzwZtAzFxZZT+G+2/SGXMJJ
	+n3fapyfVAuqoPjZqMWGOZr5FYstiwDvOKdnYR+zwy1iv8jRFDkxMOepAQlX/wuls64ulhxBmTotY
	/rUsCNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpBE-0000000CEHD-18cv;
	Thu, 26 Jun 2025 16:10:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoLp-0000000C5YR-2Jp2;
	Thu, 26 Jun 2025 15:17:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae0a420431bso225444866b.2;
        Thu, 26 Jun 2025 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951040; x=1751555840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO64nb8Wo3rmY+NlSzYsAo8VOmgXYduHQkU+jiDicSY=;
        b=YQhQkbfqsWuWZ3QMy9m852TmVawyTSvl3Eshhdu8DumWt9yJ0yB67ccBtnuhGbS9Au
         DwEBmuQSVJESLFnskEXtholofGHD19UfUZkw+CsGCjaFgvE9fFM+Qywx0P7A/TSOI7ac
         nOPkPJ7PvUw5Hd6XPD2uENJp+byf6Y8oxRGYlnQTNgDyKdKQgi3Gm5BGGsRKWaH9qAsR
         asY+k/YbXc22gOFmUR5QuCi3aUF9PJTjNQKR8mJsbmVFFSmdttOk47r2mdJVLAkF3OJ0
         3Lz88wFQSdbqpJVxlSFhL3RLq3Jo2II5nZUgptjQrLIUag9Sozc2lky6I4xYMUq/Y46P
         6hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951040; x=1751555840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pO64nb8Wo3rmY+NlSzYsAo8VOmgXYduHQkU+jiDicSY=;
        b=lniKVcbUhP9PAG3gC812D2aiWjlIrumr5eGhfclWSW7eaGANMfJZPK6aJIURSrpVjo
         x56+BlUQADQu1EE1UaAZmokA2/ee0/AkcyOoCPRyN5TyCkIbMsziWtjQZ6tuqHeQkLfl
         3aBDIWwFQ6j2UCOe+yRrVMU9+BxBb96b5yLIhhDlYFx5eWuR8/xwF2vE/4W5QNes84kZ
         yVsMDIs0qQ4gcd6bLh9vFDM66nsKYqwCxXN3Fz3O1y2smiT6moI3CcCjakie0rPtvW2U
         B+fAR3g6C9XeC5fv9ZfFzJn3vpV0HzyypNaO581mQbzxhNO4h5Jc4O6eXjcSDVIJfzB+
         I5gA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZnOtYGFk/ImoPNhQX2Tcs8ytBtmon7gITgKH6+QRxzslKSOZUJBqHUxVIxFUJ/4sTtZMOPHCHGHSMea7yzk=@lists.infradead.org, AJvYcCVUuf3BITnagxfdgphi7aOAiP+sIC0+gksDD2nFkAC2FX93IVK+X1ihuEsyUpzbDzSF0R1mmZLLrqqz4AvBJCNC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMeslZJRI57+QbUk7Ncf8LcyWse7Ci5RaKFSErRZw2ZT4kInx
	MBKP7ri/kW8O8ZoI8WZ8ipRNjlzmIxQIoh8+iElCcXOVjWpKB1JQC1Kr
X-Gm-Gg: ASbGncsnsqzrTi4vTq1MMXVpR9QLC/bAS9aMSuegu5eFcMEZ9gLFmod0Bj5lBn3EEdb
	458d7WOTK3kBGwpC2HaPkzdF3y3v6eDcwepkNd2+J4c2fjYBD+VkN9PxiPCWqQGnp7Wn4QLk7dN
	U7DJBO8PFW39RaZfBzUHOAYQ6YLJKp17uOuCw5GhLjH+1EitvH6iSceMMKfLUqg4Y6JzjAAsABe
	Kz01GeSgpEADb7wtbSS3qzMyVshBLyL3SnSWaRPeyuSb/Qn0gHIqOKJkFILKYbkBP9NHVKd9lyn
	HU+qIuGmRPGOFP69tf1nOZH2Pt9sGD94mGVJ6qbWUffxx5FSMtX2rwzBvqZCc6bRLS8sS2a6hFO
	5YSy4KapJTCk=
X-Google-Smtp-Source: AGHT+IEhwuVWaVOb65LLZ1reiG1RBr6tyPLd43WAJv5xjaBBth4FGvOOg73t206Gy+Qp2V32L7WCGQ==
X-Received: by 2002:a17:906:7953:b0:ade:c102:dc9a with SMTP id a640c23a62f3a-ae0bef3fecbmr797730866b.40.1750951039401;
        Thu, 26 Jun 2025 08:17:19 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae21c023564sm12447266b.133.2025.06.26.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:17:18 -0700 (PDT)
From: Muhammed Efe Cetin <muhammed.efecetin.67@gmail.com>
X-Google-Original-From: Muhammed Efe Cetin <efectn@protonmail.com>
To: neil.armstrong@linaro.org
Cc: daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	efectn@protonmail.com,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	muhammed.efecetin.67@gmail.com,
	rafael@kernel.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Thu, 26 Jun 2025 18:16:44 +0300
Message-ID: <20250626151644.1492631-1-efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <b4fa3620-53d2-41c3-9b3a-27cc2c1d846a@linaro.org>
References: <b4fa3620-53d2-41c3-9b3a-27cc2c1d846a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_081721_593447_74ECE0EC 
X-CRM114-Status: GOOD (  26.50  )
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

On 6/26/25 17:46, neil.armstrong@linaro.org wrote:
> On 26/06/2025 16:36, muhammed.efecetin.67@gmail.com wrote:
>> On 6/26/25 17:11, neil.armstrong@linaro.org wrote:
>>> On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
>>>> From: Muhammed Efe Cetin <efectn@protonmail.com>
>>>>
>>>> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
>>>> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
>>>> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
>>>> The original behavior can still be used when the cooling-levels property is not specified,
>>>> ensuring that the new functionality does not break old boards. 
>>>
>>> Thanks for the explanation, but would would you like to change that ? The MCU can accept
>>> any value between 0 and 99, so why change the levels from DT ?
>>>
>>> Neil 
>>
>> Thanks for the review. Therefore, you say just add values between 0-100 to cooling-device instead of remapping them using cooling-levels property?
>>
>> What would be the best practise of detecting whether the board is Khadas Edge 2? Adding new bool property, reading model propety from devicetree etc. 
>
> The register DEVICE_NO should be set at 0x12 for Edge V, 0x11 for Edge 1. I don't have the number for Edge 2, perhaps you can read it ?
>
> Neil

The DEVICE_NO register is not available for Khadas Edge 2. Here are the registers [0].

[0] https://dl.khadas.com/products/edge2/tools/mcu/edge2-mcu-register-description-en-v1.0-230520.pdf

>
>>
>> Best regards.
>>
>>>
>>>>
>>>> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
>>>> ---
>>>>    drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>>>>    1 file changed, 72 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>>>> index d35e5313b..504e7d254 100644
>>>> --- a/drivers/thermal/khadas_mcu_fan.c
>>>> +++ b/drivers/thermal/khadas_mcu_fan.c
>>>> @@ -15,10 +15,16 @@
>>>>    #include <linux/thermal.h>
>>>>      #define MAX_LEVEL 3
>>>> +#define MAX_SPEED 0x64
>>>>      struct khadas_mcu_fan_ctx {
>>>>        struct khadas_mcu *mcu;
>>>>        unsigned int level;
>>>> +
>>>> +    unsigned int fan_max_level;
>>>> +    unsigned int fan_register;
>>>> +    unsigned int *fan_cooling_levels;
>>>> +
>>>>        struct thermal_cooling_device *cdev;
>>>>    };
>>>>    @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>>                        unsigned int level)
>>>>    {
>>>>        int ret;
>>>> +    unsigned int write_level = level;
>>>> +
>>>> +    if (level > ctx->fan_max_level)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (ctx->fan_cooling_levels != NULL) {
>>>> +        write_level = ctx->fan_cooling_levels[level];
>>>> +
>>>> +        if (write_level > MAX_SPEED)
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
>>>> +               write_level);
>>>>    -    ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>>>> -               level);
>>>>        if (ret)
>>>>            return ret;
>>>>    @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>>    static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>>>>                        unsigned long *state)
>>>>    {
>>>> -    *state = MAX_LEVEL;
>>>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>>> +
>>>> +    *state = ctx->fan_max_level;
>>>>          return 0;
>>>>    }
>>>> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>>>>    {
>>>>        struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>>>    -    if (state > MAX_LEVEL)
>>>> +    if (state > ctx->fan_max_level)
>>>>            return -EINVAL;
>>>>          if (state == ctx->level)
>>>> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>>>        .set_cur_state = khadas_mcu_fan_set_cur_state,
>>>>    };
>>>>    +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
>>>> +{
>>>> +    struct device_node *np = ctx->mcu->dev->of_node;
>>>> +    int num, i, ret;
>>>> +
>>>> +    if (!of_property_present(np, "cooling-levels"))
>>>> +        return 0;
>>>> +
>>>> +    ret = of_property_count_u32_elems(np, "cooling-levels");
>>>> +    if (ret <= 0) {
>>>> +        dev_err(dev, "Wrong data!\n");
>>>> +        return ret ? : -EINVAL;
>>>> +    }
>>>> +
>>>> +    num = ret;
>>>> +    ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
>>>> +                           GFP_KERNEL);
>>>> +    if (!ctx->fan_cooling_levels)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    ret = of_property_read_u32_array(np, "cooling-levels",
>>>> +                     ctx->fan_cooling_levels, num);
>>>> +    if (ret) {
>>>> +        dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < num; i++) {
>>>> +        if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
>>>> +            dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
>>>> +                ctx->fan_cooling_levels[i], MAX_SPEED);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    ctx->fan_max_level = num - 1;
>>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>>    {
>>>>        struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>>>> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>>        ctx->mcu = mcu;
>>>>        platform_set_drvdata(pdev, ctx);
>>>>    +    ctx->fan_max_level = MAX_LEVEL;
>>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
>>>> +
>>>> +    ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>        cdev = devm_thermal_of_cooling_device_register(dev->parent,
>>>>                dev->parent->of_node, "khadas-mcu-fan", ctx,
>>>>                &khadas_mcu_fan_cooling_ops); 
>>>
>>
>


