Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D99C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjVsQnSqRQBd2D93xCfGrKX4ZhGOSg4lpjeYRuVrhMg=; b=az1F29g5F2EG1lpmUefv2pT6wF
	VCtXpYJMM7Cg47O7jLZ4psx5337OXDNE4m0s4SwnMRlVd6K0aXnKuOyG11mGCs3BghQM6FkSWDnxz
	S0nKNzVwd52dMyVyeXmydOtzpnW40bOzbjkcIovK8hEqAlGnIopgC6ldxzkUh1PcSH9C1VrYzCrFa
	n3rjQXjEGROBP7ZONLTG/nFywVKCBxXnuI4q4wIWPTM28b+8cx9dpcUnaILmHnGGRcUeXzncoUq7z
	iu3J5zauZyRzeID0ssdV0kZ/bi0IQROjFXSoSu5+nI67d14+lv4D6AvK9PhnTol4gQNeT4NrV7Nmo
	nKvWKdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tps2T-00000008jp9-2HBl;
	Wed, 05 Mar 2025 16:56:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tps0t-00000008jZi-0M7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:54:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224019ad9edso14595555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741193670; x=1741798470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qjVsQnSqRQBd2D93xCfGrKX4ZhGOSg4lpjeYRuVrhMg=;
        b=J6Ikb0yXTdehUblmKHvkSPiqjwxsUMmKVi5w07C8SoVTgaL+MQiQ3rXAlwcbQt4KUu
         3jt+ejjL2DL72PFPK04HMw8LPbkq7Pi2VCF3LoiJLHnP09HI/dJ2fbI5LlquguW5CLwN
         yEjollRa0CcxtURokPlcqoSH6dWdOUJoQEHnszUekAWn3WVjuF9lxuUqBEWFZ06uLcMP
         /X9SdkipQzgaTVB6QZhjeRwQH8EdpWxGYO2TG+u2zzobwwnLrZyUCt/WTj4P5/j/5kFw
         NuX/TlJXd7BGWecwySi62JQs1V4RKjVmnE9q1gRj79YRMCEP2v9rIjfiOGoazTIW/4Bl
         NRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193670; x=1741798470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjVsQnSqRQBd2D93xCfGrKX4ZhGOSg4lpjeYRuVrhMg=;
        b=uLFDURIP90TkDx+mH4/KvuYiJAPA9Vjm2U22iKAbbrNKPbFurOQuVG3gLk9yTcjei8
         iDIuetcgc+R48tanDoHjKqXJFwvUFoor4MclVTT99cLoL6iO9RN5PRti6eZNovdQ8J1a
         L0u4W49ulwG1iVs8u8fAtyhQ0TD6H1kCI88463pGXtucAnHJ/Uw28CfTf6KwmSqLZBQm
         PkS7sdXgNq3XhWD+akH9aSrFY90JoZDq0pMuz6JAwzgclEJLJoFj5pyPyWhkWID1QNnv
         DGuCAMQzAVQS581KZEnU+uS/y3bd9VLl79ODn4PRZNEHi3Us3VOfE3ScWQSDTz+p9HsS
         riFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXW4fo5iBApiYkN8e2oNSjgYq6wJxubv/6GhhAqjsPmrI3IJVKPJCiVfnAIbL35VYfEnr33mFoa7rv3P/jitsL@lists.infradead.org
X-Gm-Message-State: AOJu0YwxteKJHqr+XpWMre1FD41spseiYIorpz1qww+CoYQpFpTs0Sqo
	zVgmO6fRsXedYhYQOFW5BaydcTMAeu/t8hQI/p43st62xdBI++lc
X-Gm-Gg: ASbGncvwiS031n3g4UMXbLBUo871zEKiWrDFZhNI4AKk24T1UJseqmT9kNw+xO+rbUN
	N3x7iEcixHPzvt/ba+fp1NuhjBFKdkTT1bBSslZnimktF95+z3ltCNpZPHKIRRQFS0NMLlyP40q
	izswm37ddouc8FhWgQEGXTrpYzu4Lwz4nzFNnfnL7loxgGPTmyIOccXF8rJ3THEsRNhnNg86KTX
	rLbUf2O110lxyKNO9SdXxjLU13cNkaUCzASNn4xIENVAuhXe21fbae8dE928mCHKUb+VVUjUGMa
	rHg34vaxeBXcWkzQ9hgb196HYKZ9+MrGFbAp6eKuB1vsilelyt0I7Uko9PUoJLTHJbzthn68ezE
	WUg952D84QSPka3x6gA==
X-Google-Smtp-Source: AGHT+IELUYOiv9nEvMo6emFh85nrbdMhcJOVKHgtRdU/NVg8mbP4tsGNtdZVd7IcFJrPh5kmFt3Caw==
X-Received: by 2002:a17:902:f693:b0:223:6455:8752 with SMTP id d9443c01a7336-223f1d39301mr66361165ad.43.1741193669541;
        Wed, 05 Mar 2025 08:54:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9e46sm115772545ad.53.2025.03.05.08.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:54:28 -0800 (PST)
Message-ID: <23608097-f226-471b-b070-d3834e5c129b@roeck-us.net>
Date: Wed, 5 Mar 2025 08:54:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hwmon: emc2305: Use
 devm_thermal_of_cooling_device_register
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_085431_129961_74DAEB85 
X-CRM114-Status: GOOD (  23.72  )
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

On 3/4/25 08:21, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This prepares emc2305 driver to use configuration from Device Tree nodes.
> Using devm_thermal_of_cooling_device_register also simplifies cleanup
> procedure, so we are able to remove the emc2305_unset_tz and emc2305_remove
> functions which are no longer used.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 28 +++-------------------------
>   1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index a236f27c75bc..5f3f06308826 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -112,8 +112,6 @@ static char *emc2305_fan_name[] = {
>   	"emc2305_fan5",
>   };
>   
> -static void emc2305_unset_tz(struct device *dev);
> -
>   static int emc2305_get_max_channel(const struct emc2305_data *data)
>   {
>   	return data->pwm_num;
> @@ -293,8 +291,9 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
>   	pwm = data->pwm_min[cdev_idx];
>   
>   	data->cdev_data[cdev_idx].cdev =
> -		thermal_cooling_device_register(emc2305_fan_name[idx], data,
> -						&emc2305_cooling_ops);
> +		devm_thermal_of_cooling_device_register(dev, dev->of_node,
> +							emc2305_fan_name[idx], data,
> +							&emc2305_cooling_ops);
>   
>   	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
>   		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
> @@ -337,21 +336,9 @@ static int emc2305_set_tz(struct device *dev)
>   	return 0;
>   
>   thermal_cooling_device_register_fail:

This label is no longer necessary. Instead, any goto can be replaced with
an immediate return statement.

> -	emc2305_unset_tz(dev);
>   	return ret;
>   }
>   
> -static void emc2305_unset_tz(struct device *dev)
> -{
> -	struct emc2305_data *data = dev_get_drvdata(dev);
> -	int i;
> -
> -	/* Unregister cooling device. */
> -	for (i = 0; i < EMC2305_PWM_MAX; i++)
> -		if (data->cdev_data[i].cdev)
> -			thermal_cooling_device_unregister(data->cdev_data[i].cdev);
> -}
> -
>   static umode_t
>   emc2305_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr, int channel)
>   {
> @@ -599,14 +586,6 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> -static void emc2305_remove(struct i2c_client *client)
> -{
> -	struct device *dev = &client->dev;
> -
> -	if (IS_REACHABLE(CONFIG_THERMAL))
> -		emc2305_unset_tz(dev);
> -}
> -
>   static const struct of_device_id of_emc2305_match_table[] = {
>   	{ .compatible = "microchip,emc2301", },
>   	{ .compatible = "microchip,emc2302", },
> @@ -622,7 +601,6 @@ static struct i2c_driver emc2305_driver = {
>   		.of_match_table = of_emc2305_match_table,
>   	},
>   	.probe = emc2305_probe,
> -	.remove	  = emc2305_remove,
>   	.id_table = emc2305_ids,
>   };
>   


