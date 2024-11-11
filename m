Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD16D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uyz9YnL8JQ8CcaKccCYaQlhEH98w9W4nVFTm7U0nGws=; b=dDgjc6RuiHZgUs5nbp4mKgqC6n
	84o8NOzzH5btjyDZ+CTXdL4qS2IA/tNTYXlpQWxxbMrLcBoEPuz2FrYiEeTrDo5nqRCQDmCK+DxVw
	At3rlMb5xZmFBCgqDA/lrVfYFTWUQhi9LOykDiyfePNlEVAx9LLHlB5dj+2sPAWvoEFj++E3PGxbH
	RhdgvVlqDTWcu44kJRJUf/yDgR299SGroom/F7dwIVQRS1tAf4AZLswqtldloFD/cwRsJx2jMrrhX
	+iwuA+7FBJPPUqCfyaHsKpkFIczb30oDlYdsPwGRJBQOCTUNOzOshFnBIFqzRgYILdIwDP+FjvVwn
	FtrcdkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdyi-00000001dPw-0Q3w;
	Mon, 11 Nov 2024 23:37:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdvF-00000001d6n-0JJH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Nov 2024 23:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Uyz9YnL8JQ8CcaKccCYaQlhEH98w9W4nVFTm7U0nGws=; b=cSikMUVGdtj3lY1JBgC4jW2KPe
	qHf8QzuxgBOtfjR7g5nBN8N1iYKxVkTWUFdJoCw8aQXyfJ50Ua7cmRbfBmeC5QGZ75nqjhDFwWomR
	tEUVrClaBauI23Le7joc0q0d8D4xKW50Oluib/V6QOOGuG2QczNeRHR0BQYysq4sDOzul6Plxj+sC
	Da5Edl49spVshYZ9BYnF1uYILaO+rtI0ooI5gTmTX3Kjemz8wmswhOA0Ucn+xR6POG6thGeydbHqM
	qwfN+hsZoMKG67gMUD5aHxbuWitrH3AIRq43NjpDRezQN39ZIJCOqDdPD3T8voyd7W4zWt8l0ynsU
	XmDMc/PQ==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdvA-0000000CxQ0-02iv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:34:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso3788624a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 15:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731368046; x=1731972846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyz9YnL8JQ8CcaKccCYaQlhEH98w9W4nVFTm7U0nGws=;
        b=bJIl29VgT4rMlHMXo3VY6LcmvMhzFNqaV/+B/jijx91DNY35j0aW9RhwJSAKgkx7fe
         1jjditZ6XFj0RSw2gZl6XcoUhLt94RKsLjuh7O3k+hyRvzs+IohXkBmae134HsuzUE+8
         59RGsRF5QdgbAEg+5lYqTLMG7FWLjIxLXdABUbLikkqr11x1dx17pllQRh52kqFAKy3q
         g83EJ1EKZuEujHSkPbikq6rVDqnIX/rW5pZw+99+l4hfMWHJY9SXS9zIazVMqK8AEmgJ
         lHDJ1eaxNqzp3yD3XbrawQJavSd9L/20UZD7ijOInhbOHWxpoCwb8ZY5fMKlA99OFxxi
         DyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731368046; x=1731972846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uyz9YnL8JQ8CcaKccCYaQlhEH98w9W4nVFTm7U0nGws=;
        b=IrDj1k9XNx10QLK7yBj+ZnshgAuUSf2SAqcNKPjX+ZZguV/EhJM6/eVrk/JndqYF7E
         RGZqLcqHORCVjEfMY0hugJDuFMSGgBefzPnOdp4l7bnJCKFCV5i4zb2z5AMPRSf9A45m
         ajenvNbfYrydOQh4bL2pmsotwcwasLhxit8JiTP8y7f5ECAtAGwWNfRs9L1aFrJxBoCm
         wRV7xlcj7HxxELUq+i4Kzhr0HscKp9UA/Vq5SKAkmyXI8glG/wq/+JLbtciz7Dj8OeTc
         S9RWPkafGJ3vHPkxRsfRz3RuG/cXxYUi5SmvJCvzcN5lX5dVaUB8MaGCu1EIgGD1Bu74
         +eog==
X-Forwarded-Encrypted: i=1; AJvYcCUpcgIESdjQ52efq9GOcAKNXLH9G5cgyjEaan/cn3vd+9fnm0S9aObH2naWZjGGsO4m4NKu5zKxlfoETVEY8ZfL@lists.infradead.org
X-Gm-Message-State: AOJu0YzRPtnOBQeNkdVz2HkmFoXZNUn88e9azVKpln0DUa7uM+7ujbd4
	WHoMR9lgwlbG7wzGUFu2/8Qe47TRycAxKM2SRODNRGwcNq/JIJz3
X-Google-Smtp-Source: AGHT+IG9ySGad1eHdQXp8A01AVJ4oBG066aIkqdlV81tYJjacM4Jfd+cxJ+lIqY+DKLiM04Mxk+Vpw==
X-Received: by 2002:a17:90b:2744:b0:2e2:af88:2b9f with SMTP id 98e67ed59e1d1-2e9b172005emr21600604a91.16.1731368046258;
        Mon, 11 Nov 2024 15:34:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd3c65sm9176678a91.35.2024.11.11.15.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 15:34:05 -0800 (PST)
Message-ID: <47f113db-162e-4476-984a-52a81e915009@roeck-us.net>
Date: Mon, 11 Nov 2024 15:34:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
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
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_233412_354697_9751F6AC 
X-CRM114-Status: GOOD (  24.41  )
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

On 11/11/24 09:32, Frank Li wrote:
> Add support for I3C device in the tmp108 driver to handle the P3T1085
> sensor. Register the I3C device driver to enable I3C functionality for the
> sensor.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - change kconfig to select REGMAP_I3C if enable i3c
> - remove i3c/master.h
> - remove , after {}
> - use #ifdef CONFIG_I3C about i3c register code
> 
> I2C    I3C
> Y       Y       support both
> Y       N       i3c part code will not be compiled
> N       Y       whole TPM108 will not be compiled
> N       N       whole TPM108 will not be compiled
> ---
>   drivers/hwmon/Kconfig  |  1 +
>   drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d43ca7aa4a548..9579db7849e1f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2298,6 +2298,7 @@ config SENSORS_TMP108
>   	tristate "Texas Instruments TMP108"
>   	depends on I2C
>   	select REGMAP_I2C
> +	select REGMAP_I3C if I3C
>   	help
>   	  If you say yes here you get support for Texas Instruments TMP108
>   	  sensor chips and NXP P3T1085.
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index bfbea6349a95f..deb1505321335 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -13,6 +13,7 @@
>   #include <linux/mutex.h>
>   #include <linux/of.h>
>   #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
>   #include <linux/init.h>
>   #include <linux/jiffies.h>
>   #include <linux/regmap.h>
> @@ -442,6 +443,36 @@ static struct i2c_driver tmp108_driver = {
>   
>   module_i2c_driver(tmp108_driver);
>   
> +#ifdef CONFIG_I3C
> +static const struct i3c_device_id p3t1085_i3c_ids[] = {
> +	I3C_DEVICE(0x011b, 0x1529, NULL),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> +
> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev = i3cdev_to_dev(i3cdev);
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);

It is a bit kludgy, but maybe

#ifdef REGMAP_I3C
	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
#else
	regmap = ERR_PTR(-ENODEV);
#endif

and then using module_i3c_i2c_driver() would work.

Guenter

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "Failed to register i3c regmap\n");
> +
> +	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
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


