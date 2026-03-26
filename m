Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9DA109E557
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=; b=Pq0EqCMkFoXPa04LuhYzTWGWvM
	uGpFNoxEM1ktdbChePwDOjz5e5S3TYuAj/nTBdB+ku66cCNHQFvaKRnNu6BHHOIuLDB9txVtiJvdW
	0ayw4Rv0bBpW6CFp2oJfZOCDe7C2JoGo/yhBv2yFsHRSmYRbQ6S8c2WUFX3lly2o6quNm4ElqRCMV
	Hc96tPbVSvu/hr58wVlhLbOCGEgktA1Gvz+R4xkGb0pyC74Wi/CUCPvfmeJEmnRw5T6Z4LjJYI8y/
	A2Ij6+TmY2/eeCtOymaQppykEJaO6CW5tOeg4tilwuvaB0vTjaqDaOxrjuQZHdFddbDTnXCI7kMab
	6kX3Ukjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5deO-00000004lJd-3Oxm;
	Thu, 26 Mar 2026 05:53:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5deM-00000004lJF-1z2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:52:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso325174a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774504377; x=1775109177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=JXaLeHoRGO5Z8Kz4h5g73GbMnS5/dKT5weYONpcNo1xPKUnFPzAEF89Qp6S7juc3Oi
         +2unocOEl2UzkkiGKc3XM3CnJnEya97F7ZgfS2GHk4eWVXVY0pP/dT77hR4JBzCj+ZMV
         qA1o4pCN0oM3CDtIsYTqxpVUFhldWw8nkGanjN9qmFg0ssNVRmTQTsJZ32RG+TofOo1u
         wAqwDR9jXui8ZZQVPmwRQZOctyswmixfRIv3XVE3w6qZB3G7Fw7vfDuguH7v8WAXTLQ/
         lBNMgj0XVM8P1o6ZA7AQzW/x5NqkQpUnTpXzrk3QQt35VRMleiw1oCXf+sD4CRo9VFjO
         8QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504377; x=1775109177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=TOuCm1ACSkHrYlUEDruavDjfN85V0h3ppX+7IvZSAm4YQ0vlhKKA/0iVSNtfZPnIP9
         imTa/91d5mVvz5MuG+5A4yG9qw3ZXMhycZuSszmS7gG+OC42pXiLS7lgU5/ob6cC7rfI
         22VRDn0cA6Bl0OipnYvmLzQJmHHqPgIL/jUgipaZvdQwzLbsi7XQeqKUOGgx8bZX/cfV
         mDbmqnsvO7BVYcTfBY2uUI423O754GCmKPMiy174bsOa2j/FxAz7747TyuIjWkcn9wCz
         OklYUwpmbeZS7Hhoo05txCDDBL56rnVfSJNlftwm/AxXI0bP3AHoZj1e0iuO6wdbKoNx
         kVaA==
X-Forwarded-Encrypted: i=1; AJvYcCUbkI05KZf0L/BR0dF6TvBiwTODwnXWapILUNLJLdY3DJtlnLfin1e2ehrJwFXeha1bMWrCpVaBNmaFY75K7RC+@lists.infradead.org
X-Gm-Message-State: AOJu0YymsY3I0u3bNgPobnFA0A32rj5xGbnBfEkkOlfiVuhqJkqAN+h2
	xmW3zXpZEsBo6RsBYb8y0chXM3/smJPhYj/9NR0PKFqVs7jne+ZqlDcO
X-Gm-Gg: ATEYQzxFV8SCD4MrY/Vi+SBsdrxbOPoXynjoP7JRXMnM0Vs490yimDc4K6IO+UgY9EK
	YKZ79e0Ol3RvEG2BB8KbzrO6DvWX/KxtIiEqHK8UZsaknNYManXrzRr0I3K6Ml8Nfe2rgyseI7R
	lSJkO8fe2n5Q1XyvBINGzGPWTCDjJHjaY1V167TVZFnSGeiqoD7IaDGPJ7X++k5TF3j0ZEKJIwL
	wLQjVQ2vG+BBwdepqaaMcWcjbBpl6oZYOkFCexwPwGE2uWTGPrbHn4Xs/G9RCKiy6EMYmvND4+1
	gwvNBlFKNB361F2AhGgv+ONGJHxUolvSrOSaTBAgIxcFC2U4NLdjCS6fLldslsdVCIxM7Qv/Lzs
	byIw0mNccg2Ahj6fa+Gp7e3Im3qE3JH26jvwVsKWTuKKYq7oeNj2xblghChWpGWrcxbAoAtLSi5
	PZdz95CkAReGcXTr9YTO6ClpKbal4e/A+iZKYv1FKm7LhttnjwH55SQ1OR2RDKWcaJzSTznnuC1
	T8+28m+nss=
X-Received: by 2002:a17:90b:3f46:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35c0ddf6eabmr5677531a91.31.1774504377493;
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22ce693csm329442a91.14.2026.03.25.22.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Message-ID: <9648e0ae-8102-4f70-866b-163fbd5050eb@roeck-us.net>
Date: Wed, 25 Mar 2026 22:52:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
 <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_225258_530706_8BB6FD0B 
X-CRM114-Status: GOOD (  30.63  )
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

On 3/25/26 09:04, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Sashiko has a couple of concerns.

https://sashiko.dev/#/patchset/20260325160444.1736866-1-florin.leotescu%40oss.nxp.com

I don't know about the shutdown problem. If that is real, a lot of drivers
have the same problem. Don't bother about it right now.

However, the range check should indeed be a separate patch.

Thanks,
Guenter

> ---
>   drivers/hwmon/emc2305.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..722ec1d054f8 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -32,6 +32,7 @@
>   #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
>   #define EMC2305_OPEN_DRAIN		0x0
>   #define EMC2305_PUSH_PULL		0x1
> +#define EMC2305_PWM_SHUTDOWN_UNSET      -1
>   
>   #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
>   	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
> @@ -104,6 +105,7 @@ struct emc2305_cdev_data {
>    * @pwm_output_mask: PWM output mask
>    * @pwm_polarity_mask: PWM polarity mask
>    * @pwm_separate: separate PWM settings for every channel
> + * @pwm_shutdown: Set shutdown PWM.
>    * @pwm_min: array of minimum PWM per channel
>    * @pwm_freq: array of PWM frequency per channel
>    * @cdev_data: array of cooling devices data
> @@ -116,6 +118,7 @@ struct emc2305_data {
>   	u8 pwm_output_mask;
>   	u8 pwm_polarity_mask;
>   	bool pwm_separate;
> +	s16 pwm_shutdown[EMC2305_PWM_MAX];
>   	u8 pwm_min[EMC2305_PWM_MAX];
>   	u16 pwm_freq[EMC2305_PWM_MAX];
>   	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
> @@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   				      struct device_node *child,
>   				      struct emc2305_data *data)
>   {	u32 ch;
> +	u32 pwm_shutdown_percent;
>   	int ret;
>   	struct of_phandle_args args;
>   
> @@ -548,6 +552,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= EMC2305_PWM_MAX) {
> +		dev_err(dev, "invalid reg %u of node %pOF (valid range 0-%u)\n", ch, child,
> +			EMC2305_PWM_MAX - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)
> @@ -579,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   	}
>   
>   	of_node_put(args.np);
> +
> +	ret = of_property_read_u32(child, "fan-shutdown-percent",
> +				   &pwm_shutdown_percent);
> +
  > +	if (!ret) {
> +		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
> +		data->pwm_shutdown[ch] =
> +			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -631,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	for (i = 0; i < EMC2305_PWM_MAX; i++)
> +		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
> +
>   	pwm_childs = emc2305_probe_childs_from_dt(dev);
>   
>   	pdata = dev_get_platdata(&client->dev);
> @@ -714,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
> +			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
> +							data->pwm_shutdown[i]);
> +			if (ret < 0)
> +				dev_warn(&client->dev,
> +					 "Failed to set shutdown PWM for ch %d\n", i);
> +		}
> +	}
> +}
> +
>   static const struct of_device_id of_emc2305_match_table[] = {
>   	{ .compatible = "microchip,emc2305", },
>   	{},
> @@ -726,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
>   		.of_match_table = of_emc2305_match_table,
>   	},
>   	.probe = emc2305_probe,
> +	.shutdown = emc2305_shutdown,
>   	.id_table = emc2305_ids,
>   };
>   


