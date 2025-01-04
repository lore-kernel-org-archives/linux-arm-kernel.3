Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F32AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1yX8O3eI7bLwjZXX+ME9fT09D1iu/rncyeUGujpTEM=; b=Deh4F+365rSfEbdZbQPSSa79Hb
	FkxyriKp4qRYYJk/PChhrbwGlw94lyChdqrnmAOyqjlxuMLT5izoM63jav3zpCiWLndSe8ojpiFvS
	7Sp9qpXs2Y8eRXBhtZQyzjqjnnVZKJ+JAwD+Pcn6vjDkquy9Kb0mZfJJT+pzS1q1fUGn0sc6SUdf3
	5KJBxppQAbg1YV+fsPZCCJjlA6y9v/J9rZxnb7hkmQclrqAwiZYwbo23atcaTS5AivxlTqxPLJ/Qx
	fWCLyo7Xbhuo2n5IsHb36sJNI/j7MU9dOJZKg4rDc7OHhYa2mZWTe+skuRA8UJmqt7YIbW4FKnDT7
	N5PPxurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0bY-0000000Enzw-1pXd;
	Sat, 04 Jan 2025 09:38:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0aN-0000000Enrc-0qmp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:36:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso3392481a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735983404; x=1736588204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1yX8O3eI7bLwjZXX+ME9fT09D1iu/rncyeUGujpTEM=;
        b=BQjID30gX9b05gNfxlo/x6GI2gti36uVHX1uEjFJgYxoxY7aHt4qs0KCRAUxdym95l
         Xs8tdK/z2YqsrEJGcUMgOPoFGQ2ssu2SpJJA535goafXDxXrvE0Nuo7HTVQwAufWQ67D
         LHV2+y/JDWxZrzAkuRW939TYZ6ZST0esQar8YTznaOzky216YvHPXjyM3pELotwUkLTP
         0FEp/4oVfoEk1cBA1gBOZWoBNjf+nmz90iCh6Xeuw2wj7l8t2hZ5n3PfFgjd6Mlsws+Q
         CoEcBbnzwYmfheRdoX8/kIvWvCdUnuYLBblwchmTSH2R1T91BSKVZvZ7C01dd7VTdPe3
         KTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983404; x=1736588204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1yX8O3eI7bLwjZXX+ME9fT09D1iu/rncyeUGujpTEM=;
        b=bq4DpoRbKeH6Ds7ItHy/wnJa6lG//l+weaahXjlCrVAhatukkOqw1PPxFFGupJO/Tq
         ntaNhkzkvnQFQsZlTsMrcWEvtF9EqtnkE8Hb2yQRTA8vESXH1yUgeJZDCaPrjv3TyOdR
         uRkYaY0r9RYfsqMK/fpLfGp6x1LGtSyizq1V/qCtNRaJNl1iWBUsQjRUUTdRUzfGo2et
         mxret9ljiZa1jQhw5g53+h6dzHFBiu+0Oz3cVkzEY3Zvb1hViQ2TFIMDvMdhlWmlXSea
         OeWrgymPPiSo/VlyzUvJOcGrlpyuSwyL4oFN6wmYUEty3IFW4Z3VkIwt6oikMYjhSBBn
         GAWw==
X-Forwarded-Encrypted: i=1; AJvYcCVd0j570MAve/7ep508fWzqU1BGEKmhFA3/iNcklKH3OJ4lmM0Ub+qtB7smgjYfXc15rJTQyLCSuJYKgHsVrvmI@lists.infradead.org
X-Gm-Message-State: AOJu0YzbpCariVWBg7/U67Zk9Bk7WYOcYNNTDhgnqtjTEoYzAgwppJM4
	IRY2b9lpn1GjvJPe1MJXuyop0xVApRwj8P26CcRsSirG57WgDLpa
X-Gm-Gg: ASbGncuosJImq85YOiWDJu0AvB+sg671ATDcmo6tZd9/UWI1xgNJmEJfL7t/OL0dwsR
	0QnfUQdT24tfzNC1ChEMG0dI5yENAjFC5dYgLAorixmkWfr4dQEhn6XlXFA6qRP1a49fKSiXSRO
	N3x35RNbsD0zlzxOpGasepCf6YX51+rIo7rhT9vFjYNwN6axKXDyZz9WErE4FVaPR8IV620GxS+
	6uixTwttoJX5t3cDjAJudC39Y4xxsqKsOEBhrk6V+X27fuZpZ1IkXDyjYJ9itZB8gpF
X-Google-Smtp-Source: AGHT+IGjJTU2KCxShSpqQzsirXZZgsP5kMOi6w8vAMmqoEpBNdwuvTD8bdgHM7aWk1xHF84c5vbIlg==
X-Received: by 2002:a17:906:9c96:b0:aaf:117c:e929 with SMTP id a640c23a62f3a-aaf117cef2bmr3198160866b.57.1735983403892;
        Sat, 04 Jan 2025 01:36:43 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f2fasm1990107166b.9.2025.01.04.01.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:36:43 -0800 (PST)
Message-ID: <9510ba3c-1879-4c42-ae17-36d8b32fc799@gmail.com>
Date: Sat, 4 Jan 2025 11:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
 <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_013647_249145_E21EE231 
X-CRM114-Status: GOOD (  17.69  )
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

On 1/3/25 10:29, Krzysztof Kozlowski wrote:
> On Thu, Jan 02, 2025 at 10:40:15PM +0200, Ivaylo Ivanov wrote:
>>  /* USIv2: System Register: SW_CONF register bits */
>>  #define USI_V2_SW_CONF_NONE	0x0
>>  #define USI_V2_SW_CONF_UART	BIT(0)
>> @@ -34,7 +46,8 @@
>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>  
>>  enum exynos_usi_ver {
>> -	USI_VER2 = 2,
>> +	USI_VER1 = 1,
>> +	USI_VER2,
>>  };
>>  
>>  struct exynos_usi_variant {
>> @@ -66,6 +79,16 @@ struct exynos_usi_mode {
>>  	unsigned int val;		/* mode register value */
>>  };
>>  
>> +static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
>> +	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
>> +	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
>> +	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
>> +	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
>> +	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
>> +	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
>> +	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
> Now I see why you duplicated the IDs... With my approach your code here
> is even simpler. Allows to drop USI_VER1 as well.

We can't really drop USI_VER1, as we'll fall into USIV2-specific code, like so:
if (usi->data->ver == USI_VER2) return exynos_usi_enable(usi);

Thanks for the feedback!

Best regards,
Ivaylo

>
>
>> +};
>> +
>>  static const struct exynos_usi_mode exynos_usi_modes[] = {
>>  	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>>  	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> @@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
>>  	.clk_names	= exynos850_usi_clk_names,
>>  };
>>  
>> +static const struct exynos_usi_variant exynos8895_usi_data = {
>> +	.ver		= USI_VER1,
>> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
>> +	.min_mode	= USI_V1_NONE,
>> +	.max_mode	= USI_V1_UART_I2C1,
>> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>> +	.clk_names	= exynos850_usi_clk_names,
>> +};
>> +
>>  static const struct of_device_id exynos_usi_dt_match[] = {
>>  	{
>>  		.compatible = "samsung,exynos850-usi",
>>  		.data = &exynos850_usi_data,
>>  	},
>> +	{
>> +		.compatible = "samsung,exynos8895-usi",
>> +		.data = &exynos8895_usi_data,
>> +	},
>>  	{ } /* sentinel */
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
>> @@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>>  {
>>  	unsigned int val;
>>  	int ret;
>> +	const char *name;
>>  
>> +	usi->mode = mode;
>>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>>  		return -EINVAL;
>>  
>> -	val = exynos_usi_modes[mode].val;
>> +	switch (usi->data->ver) {
>> +	case USI_VER1:
>> +		val = exynos_usi_v1_modes[mode].val;
>> +		name = exynos_usi_v1_modes[usi->mode].name;
>> +		break;
>> +	case USI_VER2:
>> +		val = exynos_usi_modes[mode].val;
>> +		name = exynos_usi_modes[usi->mode].name;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>>  				 usi->data->sw_conf_mask, val);
>> +
> No, why? Drop.
>
> Best regards,
> Krzysztof
>


