Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 22:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nn7aTGxs0fZIZsteSxxOdiaizy01Z8EgP8KAplxUb/s=; b=hREY0NSywFHYwIDaMhnfzfpzaF
	9srN4TAejhZn++3j7kKJAYz1wiEpoyPN0EJA1wQtSVSrYFbUU3szcKt/z/VIio3I2cV+tATo88U5M
	ImnnLqvZZBjbscQKtB4xyubnAuVpOWYwB4/HEvSE9lu30uhgeMcf6Qicoy73k2crBcCch9sWKR1sn
	0TTs4FYMr5yiCsyzfxMjX+GLeMQBafqD8DiarQmb2/coBLHsFMuA7feKbT2JZ+o4vFTIevvoAf7oF
	UC/kNXyP8sH0EuLu/zWptKzYHclselYbaHFzYA+olYr+OlxVMJkMh1rb97tSVe9MHL3HCEu2SBoyC
	Y/SATEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrL7-000000023DH-3JYX;
	Thu, 12 Dec 2024 22:07:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrK2-00000002353-2Qxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 22:06:15 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd2ff40782so1046281a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 14:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734041173; x=1734645973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn7aTGxs0fZIZsteSxxOdiaizy01Z8EgP8KAplxUb/s=;
        b=DiZoJU8YHcUVmIpgLaf4MW4r17FscTgznfX/0xHiPvQTCmVHYzFBHYxGl6I5SGalTQ
         P3pARlbOoJuEukGHtlSDZF+IuPnQdNZOP130zB0uNon11VoDQGri/ZvajvQedddQmw8s
         HUZeA3Q/1Aftdd1Cmv8xpwsCXHUqAGeIt1Tf3Ov2enF+kJh5RVA/TL7tv8IZHuxG1diH
         UXuCvxEZHE6DiCiuaisGA6p7Vj8Y1Gv6vUZPaF9ZkngDrVuBHP1FlKh+8ww6UcplIjT/
         lkjNmyT2Qb1/uTnASn7VvFmxsoxvwDBCGquglcbafcavllLvnmHGqgx7kfXbhBIeyX+A
         +iTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734041173; x=1734645973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn7aTGxs0fZIZsteSxxOdiaizy01Z8EgP8KAplxUb/s=;
        b=p+mILq/edv2kLk4a+46STKIY9EAJXob42G0dsiwMUPhpp9inyFdX/MYhyir7k5O0ap
         rz8STD795KRQebdPUlOfRryMZqYVU2T/++8zxsNKCLAiNJt8zOPJ11nQQswBbVRIOc+/
         b3JQjisKRrEKlx23ELsKTjcfY+BNhzkK/XCvtDI/kgjEuQDlABAJ/EY1Yz8iHenmiKj2
         BAy0YqjUEP9z5BuM71JK+IATWNVneAPo4z3hbZv5MW0Be5T40Yn/gKzkjcr2VXUwDbEj
         3NTLY7FEbAGzaAxwZX7r0KtxOv40fBxtlF/qaAQU0phlGkjW5p/ldX+r6wJiofEGAC4I
         cryA==
X-Forwarded-Encrypted: i=1; AJvYcCUdtkLRdsNdCJe8kO26jkJi/RqocmZmF03GdC2pBshOSR3erGK1KVr8PTWlF1j7CNIjk4Lf/rBbMszGD5rpcSms@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1lTYKb9dCy8mnuv6yrSrrKtMKC/GdppJj1FtUspKEbnjDS9y
	YzDMwqAnSJLiIciKXM+5U5l1ZuGGFMlre12hqihzVsOi/kCUFRdd
X-Gm-Gg: ASbGncuJnTTQpJGE56O73U6HB3ms0uAtNbIsXpgnW1vUfcBgFJIuIu+6UXtpaJRocgH
	BdtR7gYg9EQ9tohjHO9YoW23bke7XtgfCwkLdfGZnO6aGAt9vGPnJ4j8M7pouVEsuxLj0MMqrXe
	kj/jnDrvjdSztcEuzST1T2C7wbggwWncocp+XfhxVsh5vIIAe4lHNOZqq1yigFnjtr/fLmwH5lC
	nwJVq5YTrA5D79/U4hebhUVEGsh/6LKAACE7CoazdO3NVqLHcxoKp6/srr6NS6AJ8vCpfu0fzrV
	ltQZNwe1Tuy2O/qrPcH3qh0XC9kHSQ==
X-Google-Smtp-Source: AGHT+IEjcDWDcj+xx58FwEzylYzqnHeRBxwumiFyM7ZjcMUkstRS8dJbxY3ZD6142f7rcv8umWohsA==
X-Received: by 2002:a17:90b:2682:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-2f2901b3181mr476376a91.32.1734041172844;
        Thu, 12 Dec 2024 14:06:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142de7ddfsm1799771a91.26.2024.12.12.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 14:06:12 -0800 (PST)
Message-ID: <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Date: Thu, 12 Dec 2024 14:06:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212214927.3586509-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_140614_623502_A5FCF96E 
X-CRM114-Status: GOOD (  17.04  )
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

On 12/12/24 13:49, Ninad Palsule wrote:
> Adding label files for fan and temperature sensors in the power supply.
> The openbmc application dbus-sensor(psusensor) requires those files to
> consfigure those sensors.
> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
> as dbus-sensor(psusensor) application calculate index based on last
> digit in the name so we do not want to make index double digit after
> appending page index.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

We are not going to fix userspace problems in the kernel.

Guenter

> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index a7000314e5ad..149b3c5f3a4c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2144,6 +2144,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	{
>   		.reg = PMBUS_READ_TEMPERATURE_1,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempA",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2156,6 +2157,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	}, {
>   		.reg = PMBUS_READ_TEMPERATURE_2,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempB",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2168,6 +2170,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
>   	}, {
>   		.reg = PMBUS_READ_TEMPERATURE_3,
>   		.class = PSC_TEMPERATURE,
> +		.label = "tempC",
>   		.paged = true,
>   		.update = true,
>   		.compare = true,
> @@ -2282,6 +2285,17 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>   					     PSC_FAN, true, true, true) == NULL)
>   				return -ENOMEM;
>   
> +			/*
> +			 * Add fan label.
> +			 * Assuming paged attributes while passing page index
> +			 */
> +			ret = pmbus_add_label(data, "fan", index, "fan",
> +					      page + 1, 0xff);
> +			if (ret) {
> +				dev_err(data->dev, "Fan label add failed ret=%d\n", ret);
> +				return ret;
> +			}
> +
>   			/* Fan control */
>   			if (pmbus_check_word_register(client, page,
>   					pmbus_fan_command_registers[f])) {


