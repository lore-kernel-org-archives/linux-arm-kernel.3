Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F87BE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 05:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2gS7QPW0Vau0TRfECG0tWh0O+TEzQcOd404Ys3R6dI=; b=48dw0+EVLGVD+bq/7DZQBTlOUA
	GaaAvdJEpF9Bk4fpcouNtKDLqYuV6V46vFqIi8b9D8vKGgjbfnVlifc3juP9ze8rB6bKX4pi5PebG
	MGyS960jtfwNSmLd5CDTd+qK7lL7IvBGvFgWyLSEDVkB8t0iO6LpFIDeVeXfZWyfF2MH3mrMRTx3+
	X3YguKJc3m9AX/Qg5NxNQskZPC351iJdKs184GYFcAGt80PiWZWhUlH0j3VyGmb4s21Xc5MRsc+Is
	wv95hIAazCJe6l6eWIQQtqrnYE41xpvb+1td9GScdBu3pwjOteZOizwFf5gn0j0M4aoWlIYW4NHLP
	Vj3Riddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsaDN-00000009K7n-0N4n;
	Wed, 18 Feb 2026 05:35:09 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsaDJ-00000009K7S-3dor
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 05:35:07 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64ae222d978so4812720d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 21:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771392904; x=1771997704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2gS7QPW0Vau0TRfECG0tWh0O+TEzQcOd404Ys3R6dI=;
        b=RMm1YQka/CQ2yJhFZbjZMpzpMxuIsmZ6ca3a4eTg/70DseUaZ72uJZMjLLPkjSIUbF
         W5CfOfl8v8v8CyCq2TJT/DxKJ/lzZY6eKARvWPguc8PqcaZon0nX0cCAwLiJ9NMLl3v6
         BlfvPXg2O2rYAAJv0Gg9B/eny4DFZa63qihKTNMch1wcgQdUnvjAzwL3q5Jd/nqX9TyJ
         dWadbIoJuU3+eMLqSPdS/mlEX16d5sz+VQ3mdPag3NQLz5son+/HwcYmjrlYBC4Ly++6
         tn+7+sEguAT+sE+hqhl2ZG2vxVwCMR7fo8FmSTYyFNaCaIlQ8j239RMJKa15Ors7cH7B
         1fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771392904; x=1771997704;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2gS7QPW0Vau0TRfECG0tWh0O+TEzQcOd404Ys3R6dI=;
        b=GKZg5TRk0Ii9DEE+7uwgQMfLC3qvRWU63LCT9TPHeirWKX13HIlhptM0R+DmndgcZF
         axBxzcwRGGN65zwBHWP39xG+jgVLYQiTvzqm4OvoYpsgWHJjyOV2sXhX741bOmvbXcZx
         otlwlsiItWbGvenIS6oXnAyQolkwRS0C/oV4oGJjIVk2+osdLsWJBLobPw5cscLMe/L3
         DpbvQmjnIkZvX0DFuU9IIeUaiCB+DCefCRhjmeOw95j3WCCHysDecFBWJVWtWxOxZzQx
         5cD1BTR9nlNIqzoGHfUGQA6uV98b2dq0eT8K5WytiQlRoh9uExFbN2/ySWr+5fTKZwMm
         5AkA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjPCCHTh9h1wG+LAmlW66Gk8gaMB6ss7AXlxqbjWxCGE2j32GA/sppBzrhhLZ7+Qv0trIYWg5ktl2CJg3FmaT@lists.infradead.org
X-Gm-Message-State: AOJu0YxCu9hVaN2uG8ccQ3fJF/AaIO9sdQ/HBXHKFAhYIfbyALdwWpts
	cVdR9lhdzUat5GsE1FOnziM1/yUaqoKnC7o/cCASgJlvBPADEIcf78MBxK9dBIuY3w==
X-Gm-Gg: AZuq6aLBrroACBMrmNBQCEegFSLEMjN4vfxIKVu8DNW+DjjLxcs06siT+sw55LvzP4I
	97OrlpL8INxQlYnhVNVXbquSAGasYj20R2X//VQw9Y1ZBtBsM6tiKFeRUscgf7YWsZO6+gt0Gt7
	mdvXfyKFv8h1qbBClHNMWUGrT03FCDkzn8G8SGXyel9VoUqcXBauXBoIdANFRO7nbv53+fbQ4ig
	+r8Y70uxWpLKVGwYpnR+++V0sEMRE364/8NQb396Iw0kY5RqkjySa+HYDSBbC0m5N7TL4eF8nxC
	a5IFut7KtsL/K60fqYi2Mah2VvgDIGSy6Fyq07pDQLmb9yFC459CakwfGES4ZO7Fg7rre2dFFp/
	3yEtjOEJyP/HM8KvinlrBu0dw3eVq0+6ThtkOMXVwIDJrNdyy5Uyk0B3rAsS0fGmvVKmccmCI2V
	zcvnjYJxnKaelI1OEVZ31Fta3b75knREkzt1PAsciZN6JloyuSlJ5gcCVR17mqwlMTLxc1EsFWP
	h2S
X-Received: by 2002:a05:690e:4005:b0:649:3b9:924e with SMTP id 956f58d0204a3-64c555942aamr701484d50.22.1771392903977;
        Tue, 17 Feb 2026 21:35:03 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:b4:5cb3:5345:8019? ([2600:1700:4570:89a0:b4:5cb3:5345:8019])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22f8fa1fsm5666809d50.15.2026.02.17.21.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 21:35:03 -0800 (PST)
Message-ID: <7103a273-f066-4c1b-ad14-7e8fd7ba002a@google.com>
Date: Tue, 17 Feb 2026 21:35:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] power: supply: max77759: add charger driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-5-28c09bda74b4@google.com>
 <0b6e7cb7223e553d9b53df464959e97fd3d1ce43.camel@linaro.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <0b6e7cb7223e553d9b53df464959e97fd3d1ce43.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_213505_921253_EE5FC0F1 
X-CRM114-Status: GOOD (  30.14  )
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


On 2/17/26 5:14 AM, André Draszik wrote:
> Hi Amit,
>
> All below comments are only minor, feel free to ignore them.
>
> On Sat, 2026-02-14 at 03:12 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
>> Li+/LiPoly dual input switch mode charger. While the device can support
>> USB & wireless charger inputs, this implementation only supports USB
>> input. This implementation supports both buck and boost modes.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  MAINTAINERS                             |   6 +
>>  drivers/power/supply/Kconfig            |  11 +
>>  drivers/power/supply/Makefile           |   1 +
>>  drivers/power/supply/max77759_charger.c | 768 ++++++++++++++++++++++++++++++++
>>  4 files changed, 786 insertions(+)
> [...]
>
>> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
>> new file mode 100644
>> index 000000000000..d4e02764ba04
>> --- /dev/null
>> +++ b/drivers/power/supply/max77759_charger.c
>> @@ -0,0 +1,768 @@
> [...]
>
>> +
>> +/* USB input current limits (in uA) */
>> +static const struct linear_range chgin_ilim_ranges[] = {
>> +	LINEAR_RANGE(100000, 0x3, 0x7F, 25000),
>> +};
> Shouldn't this one also have a entry for 0x00...0x02:
> 	LINEAR_RANGE(100000, 0x0, 0x2, 0),
>
> Then you can also drop the umax() call in get_input_current_limit().
>
> Ah, I see now there is no linear_range_get_selector_within_array(),
> meaning the code is fine as-is, unless you want to add that as
> well :-)
>
>
> [...]

I would go with the code being as is for now.  :-)


>
>> +static int max77759_charger_init(struct max77759_charger *chg)
>> +{
>> +	struct power_supply_battery_info *info;
>> +	u32 regval, fast_chg_curr, fv;
>> +	int ret;
>> +
>> +	ret = regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_00, &regval);
>> +	if (ret)
>> +		return ret;
>> +
>> +	chg->mode = FIELD_GET(MAX77759_CHGR_REG_CHG_CNFG_00_MODE, regval);
>> +	ret = charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (power_supply_get_battery_info(chg->psy, &info)) {
>> +		fv = CHG_FV_DEFAULT_MV;
>> +		fast_chg_curr = CHG_CC_DEFAULT_UA;
>> +	} else {
>> +		fv = info->constant_charge_voltage_max_uv / 1000;
>> +		fast_chg_curr = info->constant_charge_current_max_ua;
>> +	}
>> +
>> +	ret = set_fast_charge_current_limit(chg, fast_chg_curr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = set_float_voltage_limit(chg, fv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = unlock_prot_regs(chg, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Disable wireless charging input */
>> +	ret = regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
>> +				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
>> +				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return unlock_prot_regs(chg, false);
> Should early error returns here try to lock the protection again? Something
> like:
>
> +	ret = unlock_prot_regs(chg, true);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable wireless charging input */
> +	ret = regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_12,
> +				 MAX77759_CHGR_REG_CHG_CNFG_12_WCINSEL, 0);
> +	if (ret)
> +		goto relock;
> +
> +	ret = regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_18,
> +				 MAX77759_CHGR_REG_CHG_CNFG_18_WDTEN, 0);
> +	if (ret)
> +		goto relock;
> +
> +	return unlock_prot_regs(chg, false);
> +
> +relock:
> +	(void) unlock_prot_regs(chg, false);
> +	return ret;
>
> I guess if one of the regmap_update_bits() failed, then locking the
> registers might not work either, so I have no strong opinion on
> adding that.

Nice catch!

I need to send a next revision to keep the Linux Test Robot happy. I
will address this issue in that.


>
> With or without updates:
>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>
LGTM! Thanks!


Regards,

Amit

> Cheers,
> Andre'

