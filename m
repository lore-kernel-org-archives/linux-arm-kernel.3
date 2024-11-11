Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64394D3ABE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ou+pakJnN8GqsivMPkhl1TNQ2JSe3WqaNFbGvCJlURM=; b=H8mg+7dhlZ9DSK5J7MnX7pqgzA
	uBcHO0l7HdNmUPPsLpPDUK3qLDEXRayHJULimiZrWsmVrzQFox2ySdRI4WOknBuPUKfD0VkKAHwLR
	L4rXrTYAOcHat9gSb9A/oScXMIt9z2wP1YBERSPkYg1G6BC+R4Ohvt+FvxYZyMJN49MGfBR5P8uQI
	fx2rt8Y02vIDvCsiP8xHqsn+zXCCNn1R2CSvhvBRF1tQFTma1ON8MLWEoro967iU9nhQGqsX3eBC4
	9f6iZgPDay478xpdAWSf7u81kJ2AWqsFj7+AVg2xV5verzIK54LAdn/JNc8bXP9TsIlVUpS5340gt
	5exmuGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYvW-00000000rsN-0mTo;
	Mon, 11 Nov 2024 18:14:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYsL-00000000rEI-2dYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 18:10:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cdbe608b3so47912845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 10:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731348656; x=1731953456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ou+pakJnN8GqsivMPkhl1TNQ2JSe3WqaNFbGvCJlURM=;
        b=ZAv+elavL59KtlY0aYVtq4VPZtFbQoKBvNgn519ktailMQVTpUg8gjfd5cdBUD+236
         9GKkp9Q8qKeLoD+2ncFg22kLnfjs5AFgYvpiLMlHDFWsMnBMw8FVn0NLxXNoqEFNJSrf
         c6OReUhUUyXzHDX8bAPO4Q+9uiTxZLNIDeKmphzmJAsez11nl2GZzTRwySZP/R7aW6jH
         O38LjNls73tkNPU3xjAUBmGC18/kIDEZJkDJNByN80A/0JPrr0rXXrbNHHCNwLZSseoc
         qCJz3jdH5A73pQXpnf9m8sF0diQDJpieob0Z7EGPaM+l8hM3u6w393Oqgy0CMiJJM9PL
         e+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731348656; x=1731953456;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou+pakJnN8GqsivMPkhl1TNQ2JSe3WqaNFbGvCJlURM=;
        b=Egz2j7GJu3rrnk2blDluRMMRLMAJ+4UrXmXa/HanpsrK/WZW4bwSHtn2D4NkgGgT2s
         5Z6od2VZlYy+ujH4vcPrcuoZP1RVe+59P5vU+Wu968butSB+Jyf9fHsg416nxtbbtoAz
         BVQWfWNB+1ASQyZgcjBCgKwz+BMrLVR9kvHzL3JNjJBkv8qJgdDLDKTUWXjZwE2OlVvI
         /B98WIUZXoaTeTkuZxhFSNSDwKSxJBrI6TXzP5/gZqgT4ydJrwTdQZH+mf1PD2eTsjh2
         E+y4WBC3pyReGs4GuFHpSIfIqMA5E3mWA6G62eZduaNHHT+KiXvhRf5R0IvHd+Iqkqzi
         J8+g==
X-Forwarded-Encrypted: i=1; AJvYcCVG8tUDHwcCOR0L2v5y2fguI3QyGYybOB4ZlhoKwBlNYy6KNfVfmjhhy8kesNb9vea2Vndr2Y6MErsrvbAvQ9FK@lists.infradead.org
X-Gm-Message-State: AOJu0YzasooWtKZqMb1jCgfU+Ys97gKcsujo2cA/gLSPTATO51oPU555
	vSM2bSsQnT9GLO6veFqCjWj5LhMcG9PYw9yZuTiGA3M2NG356Y/z
X-Google-Smtp-Source: AGHT+IEyM4w+bqgLpiyEoaQvV2sZGwHKl/UVHBGsIq5HXpnePLWUsiA8UymSNUOxXTSnqCLnhu1Vsg==
X-Received: by 2002:a17:902:d50f:b0:20c:cf39:fe2d with SMTP id d9443c01a7336-21183533a62mr202214645ad.5.1731348656518;
        Mon, 11 Nov 2024 10:10:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58316sm78945275ad.188.2024.11.11.10.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 10:10:55 -0800 (PST)
Message-ID: <e8921251-02bb-409e-88d0-d635e7d08929@roeck-us.net>
Date: Mon, 11 Nov 2024 10:10:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
From: Guenter Roeck <linux@roeck-us.net>
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
 <41995c8a-8b05-4c56-b4a3-5f275a88b899@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <41995c8a-8b05-4c56-b4a3-5f275a88b899@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101057_690246_E9C5C87E 
X-CRM114-Status: GOOD (  12.69  )
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

On 11/11/24 10:04, Guenter Roeck wrote:
[ ... ]
>> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>> +{
>> +    struct device *dev = i3cdev_to_dev(i3cdev);
>> +    struct regmap *regmap;
>> +
>> +    regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
>> +    if (IS_ERR(regmap))
>> +        return dev_err_probe(dev, PTR_ERR(regmap),
>> +                     "Failed to register i3c regmap\n");
>> +
>> +    return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
>> +}
>> +
>> +static struct i3c_driver p3t1085_driver = {
>> +    .driver = {
>> +        .name = "p3t1085_i3c",
>> +    },
>> +    .probe = p3t1085_i3c_probe,
>> +    .id_table = p3t1085_i3c_ids,
>> +};
>> +module_i3c_driver(p3t1085_driver);
>> +#endif
> 
> While looking at i3c code, I found module_i3c_i2c_driver(). Can we use
> that function to register both i2c and i3c in one call ?
> 
Answering my own question: No, because devm_regmap_init_i3c()
does not provide a dummy function if i3C is not enabled.

Guenter


