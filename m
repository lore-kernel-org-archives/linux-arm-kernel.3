Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FFD64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkuxRBhUdrMqZHEYYqrRzS7syIb4x9GA940/XJZey40=; b=PzRf8sMR413PD9EI3I4B1Lzr4C
	IyCata/zY/IshbczV5nhzxWDZ4wcnVvT32uOxDBJXaiKNYsfViuwwYCfRT+vJrb58yJCSsrV6jly8
	tgdYFXj/cf99qidLvdVxdTDz70ymqa5gFZDZ0X5FSMA02Plc/o6jAkObsfXRwSvQSdjQfVPsnf2EE
	2sGWGwjKVewtPl515Q9ry0d2Vh3Hv0pdsjSI1IulKwRhfA/3f/pzVXBQBHSQPH4Og66Fpw9Tw0B2c
	321SL0PnOVvxxl8X05fZ3cf677P5261Hn1tTdgt7p9uqLahK+7RYs9dWCsWUjN2kS/i8p2C5KsX4w
	MYDqTX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZO8-0000000CLer-3QxY;
	Sat, 09 Nov 2024 00:31:40 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Z3P-0000000CJAw-2TRJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:10:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ede6803585so2876397a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 16:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731111014; x=1731715814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qkuxRBhUdrMqZHEYYqrRzS7syIb4x9GA940/XJZey40=;
        b=hItOUjkxv/gTfzv7Q0KLz5IS4447uZArBpyLPXXhwQ1d3IcxfzBLKkydMKW5Tb1OBy
         HMFy6R/3vo+v4OZGJWP41SKKPyXtecnM67HgnmonYsvUS9j7Yx+U4+84Tl+ed5sPOaok
         Kn1tZb46V1sPLTur4J41NtX+dsYtRTYvjHeRxTEoXBiBk2H8SHrDRxD7692WaQJ7uySN
         IZFXWt3m4FjZUsEM3UEydY22lxA8CT3ifRAElA/1REQ+hfWlIsAADZhOjUhMKzM5iOI5
         uI3xc/cl2ZtwOI3GqZfKt+Np7Up/dTmbCJwuRhZ+93tEciH14DytSjplfOieGKIMocm8
         g6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111014; x=1731715814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkuxRBhUdrMqZHEYYqrRzS7syIb4x9GA940/XJZey40=;
        b=h4Qink+8sExhVKDKaJayWYZ64iGaQTdw0b+tjn9cLB9F9QoAUtbhp4o1zOudH0Q6iM
         jJV1tuZ6g7gpm9IWqZHS9qEV8PEp8WPS1syACJ4hMpBX1a8eDdOz7PQwauu6GqUBXNYp
         WJIrP9SX36Gmm3eqiXvpKio9ssKogsU2hw60SQxN99x8Y0AMllxQDgMSIF7kI6x02uDJ
         uTzto6NHnrm+HUpsOZGJfeVcMYmZwwr45DYeXT7fMDSJE469p8CTKOA/q38wczLH52ns
         jchkRsbq99gZO2cScRO1p6d4VcuQs3T185xCHIjrNTz73/eNwInhC072LLTXRkBtDGwG
         z7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWBE0Hzdkn5Znbt0J1gjanhDi1bt41UzPG3aZpBm/SIOILlrpmiO+ipFUyNMDv8SUYz0fru2VHVkBzzkCOkrMTa@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4ZeHqh4obFIcKWBDXvl7FmeRjGC3rOBzBX2/LlEITg2tT2QQ
	GCpLih8kZOmXVpfQwPBq/umiKYmmXmwNUzIpJ3G8YSttUqkXxX4q9dU8vw==
X-Google-Smtp-Source: AGHT+IHIJjoErnvnQ8M35ks2Kzb8DXfptuyNI+D7IwxYCzr2yibZDe70aA2CeUtxRv8l9Gw9P306pg==
X-Received: by 2002:a17:90b:4b0f:b0:2e9:20d8:414c with SMTP id 98e67ed59e1d1-2e9b0a30173mr7016077a91.5.1731111014538;
        Fri, 08 Nov 2024 16:10:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9be866bdasm415822a91.16.2024.11.08.16.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:10:13 -0800 (PST)
Message-ID: <805495d8-b1d0-4258-8f86-35c92b2b0e61@roeck-us.net>
Date: Fri, 8 Nov 2024 16:10:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: tmp108: Add support for I3C device
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_161015_674918_5433861B 
X-CRM114-Status: GOOD (  20.67  )
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

On 11/8/24 14:26, Frank Li wrote:
> Add support for I3C device in the tmp108 driver to handle the P3T1085
> sensor. Register the I3C device driver to enable I3C functionality for the
> sensor.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index bfbea6349a95f..83d6847cb542c 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -13,6 +13,8 @@
>   #include <linux/mutex.h>
>   #include <linux/of.h>
>   #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
>   #include <linux/init.h>
>   #include <linux/jiffies.h>
>   #include <linux/regmap.h>
> @@ -442,6 +444,35 @@ static struct i2c_driver tmp108_driver = {
>   
>   module_i2c_driver(tmp108_driver);
>   
> +#ifdef CONFIG_REGMAP_I3C

REGMAP_I3C needs to be selected in Kconfig. Maybe with "select REGMAP_I3C if I3C" or
similar, but we'll also need to cover situations where I2C=y and I3C=n. That means
that an additional "depends on I3C || I3C=n" may be necessary. In summary,

	config SENSORS_TMP108
         tristate "Texas Instruments TMP108 and P3T1085"   <--
         depends on I2C
	select REGMAP_I2C
	depends on depends on I3C || I3C=n                <--
	select REGMAP_I3C if I3C                          <--
         help
           If you say yes here you get support for Texas Instruments TMP108
           and compatible sensor chips.                    <--

           This driver can also be built as a module. If so, the module
           will be called tmp108.

Thanks,
Guenter

> +static const struct i3c_device_id p3t1085_i3c_ids[] = {
> +	I3C_DEVICE(0x011b, 0x1529, NULL),
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> +
> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(regmap),
> +				     "Failed to register i3c regmap\n");
> +
> +	return tmp108_common_probe(&i3cdev->dev, regmap, "p3t1085_i3c");
> +}
> +
> +static struct i3c_driver p3t1085_driver = {
> +	.driver = {
> +		.name = "p3t1085_i3c",
> +	},
> +	.probe = p3t1085_i3c_probe,
> +	.id_table = p3t1085_i3c_ids,
> +};
> +module_i3c_driver(p3t1085_driver);
> +#endif
> +
>   MODULE_AUTHOR("John Muir <john@jmuir.com>");
>   MODULE_DESCRIPTION("Texas Instruments TMP108 temperature sensor driver");
>   MODULE_LICENSE("GPL");
> 


