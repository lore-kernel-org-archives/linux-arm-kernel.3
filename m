Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3478ED64097
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDNI3QDwWxgmxejo6jXXE94KMUDPX67xnOmgp5Nl8dg=; b=qxWaojwNgPRNu/SECa/pzddeZ/
	QgIqxs6sDR8jmYDQHIe8bDDd4ozr6asz9C1JhQuG8+sHZtDIaoRZja0Y3Ty6KAtxEq6gzXGO7HZh/
	cJYKTCgEODz+nMESIYqY81qV8TyHB4VI7qZ8rGovnKveQG7iygUtOIiaoRQKvDRHQFS/8r96pxABe
	+TjKbljJ9fTjImcx0l1v9fJ75sCS0V2wG21lkzfYo3C+aVv3gNhnlrxPqVH/iR1phBRIxbpUTFRL7
	WAHi5qtU/LnGR7R0lkAGpEJkUVaBJqzyAdeJ9yGUyHV87r49BqHripqKSBTy3eSItR3PheUCMkprd
	Aw85CntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZIz-0000000CL9K-1m8a;
	Sat, 09 Nov 2024 00:26:21 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YpN-0000000CHC2-1qkf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:55:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-720c2db824eso2953850b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731110144; x=1731714944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YDNI3QDwWxgmxejo6jXXE94KMUDPX67xnOmgp5Nl8dg=;
        b=DQtLjwnv5EJQ2IwKi3HeVdSlO+0wf4UOIN+xN6vgSfeYwx619AhNflUyOw9Rd3MZhb
         06zhooswJFfAIyq4g+GR4yrT2yEpyaPnNodwXI9ioCpTDnfQ1DgAPQxzzFdklv9w46cJ
         LAuzipJxUypsoewNlAO9ru2E0Y4mWF50qEEXYD2gKLD9GWt50wtxQhKo2OFN23famlAC
         lHfblt8WdisMZvBwC+m9Yg9xBTIVREOMG7RZjJpPgJs/4Q+KQ0NYiL5Uj8lhJtlGGbG1
         SPSbV+pDCz3eWbZjD1Gjev3nI/BOfgH7PKuo6h2ujDg7Y4k8fY+4pTOW2EJVAJp8a4HL
         GGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110144; x=1731714944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDNI3QDwWxgmxejo6jXXE94KMUDPX67xnOmgp5Nl8dg=;
        b=Byp4G/O7lmVB/z3It13KmVHy4Uw1uz8nVIZbEE9xxPYReSpfFHI0AnM6HzxpFd2ru2
         t7USw4b0KiDbWkWgQpu2o3fre/xArMKTdosk39b1l/SO02Pt0mgv84QgoiLAmVriPgnp
         lFsjKhqKtUjzU0B6QYdreXZr4acnbyrXorDA13JwMVaDCvNqbKG8l8+X8BEO4tWty9Bf
         POF9heEz+qMsqK11WsRSzRj02BvDOyZe+y5eMbmYzYSFMWgc/ZEvQ7q7kBL686GNvGCu
         wyYaxnqTWxWbdBAC+ys/9iN+PSaxezctZD7UYj2aediLzrwTryb3Ozj+jXsWPhzjZU17
         O2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6A5Igqkeoqr6bh4niQyuhNXLrP2ld3uLmaytXhkVFW+xW0qWTcSoN01C5cOVthNhUvGzWr+HIDEtJ2QGF92sE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg0B3Eyhh7W/wyeRAJnvQ+dEmaETT3wyS9yPlv/j5oC1M3g8F6
	gr0MfLDDqd85uM3ECZzxfc0jBuVy7/0G2iY1tqQexkRHIMtOabam
X-Google-Smtp-Source: AGHT+IEHn7LvKyz4qiE1kjywUOaxbLk9LaMdw4OZkuMYZImvcCX2vvxzceeB2V3jYqAdtqDqMOyhJw==
X-Received: by 2002:a05:6a00:99b:b0:71e:4c86:659a with SMTP id d2e1a72fcca58-7241328ea12mr5446159b3a.9.1731110143875;
        Fri, 08 Nov 2024 15:55:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078aaa21sm4398854b3a.51.2024.11.08.15.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:55:43 -0800 (PST)
Message-ID: <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Date: Fri, 8 Nov 2024 15:55:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hwmon: tmp108: Add help function
 tmp108_common_probe()
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
 <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_155545_539087_CADF4E1F 
X-CRM114-Status: GOOD (  27.98  )
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
> Add help function tmp108_common_probe() to pave road to support i3c for

help -> helper

> P3T1085(NXP) chip.
> 
> Using dev_err_probe() simple code.

Use dev_err_probe() to simplify the code.

> 
> Add compatible string "nxp,p3t1085".
> 

This is borderline and problematic. First, it is the one functional change,
and second, that functional change is not mentioned in the subject. At the very
least it needs to be mentioned in the subject. I would, however, prefer two
separate patches, even if that is just a one-liner.

Also, the key change is preparation for i3c support, not that a helper function
is added. The subject should be something like "Prepare for adding I3C support",
and the description should then mention the added helper function.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> dev_err_probe() have not involve addition diff change. The difference
> always list these code block change regardless use dev_err_probe().
> ---
>   drivers/hwmon/tmp108.c | 40 ++++++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index a82bbc959eb15..bfbea6349a95f 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -323,33 +323,19 @@ static const struct regmap_config tmp108_regmap_config = {
>   	.use_single_write = true,
>   };
>   
> -static int tmp108_probe(struct i2c_client *client)
> +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
>   {
> -	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct tmp108 *tmp108;
> -	int err;
>   	u32 config;
> -
> -	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA)) {
> -		dev_err(dev,
> -			"adapter doesn't support SMBus word transactions\n");
> -		return -ENODEV;
> -	}
> +	int err;
>   
>   	tmp108 = devm_kzalloc(dev, sizeof(*tmp108), GFP_KERNEL);
>   	if (!tmp108)
>   		return -ENOMEM;
>   
>   	dev_set_drvdata(dev, tmp108);
> -
> -	tmp108->regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> -	if (IS_ERR(tmp108->regmap)) {
> -		err = PTR_ERR(tmp108->regmap);
> -		dev_err(dev, "regmap init failed: %d", err);
> -		return err;
> -	}
> +	tmp108->regmap = regmap;
>   
>   	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
>   	if (err < 0) {
> @@ -383,13 +369,30 @@ static int tmp108_probe(struct i2c_client *client)
>   		return err;
>   	}
>   
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, name,
>   							 tmp108,
>   							 &tmp108_chip_info,
>   							 NULL);
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   
> +static int tmp108_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "adapter doesn't support SMBus word transactions\n");
> +
> +	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> +
> +	return tmp108_common_probe(dev, regmap, client->name);
> +}
> +
>   static int tmp108_suspend(struct device *dev)
>   {
>   	struct tmp108 *tmp108 = dev_get_drvdata(dev);
> @@ -420,6 +423,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
>   
>   #ifdef CONFIG_OF

It might also make sense to get rid of this conditional and of the
of_match_ptr() below to enable instantiation through ACPI.
That should be a separate patch, though.

Thanks,
Guenter

>   static const struct of_device_id tmp108_of_ids[] = {
> +	{ .compatible = "nxp,p3t1085", },
>   	{ .compatible = "ti,tmp108", },
>   	{}
>   };
> 


