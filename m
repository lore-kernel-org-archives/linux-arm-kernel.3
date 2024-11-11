Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AD1D3ABEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCiEccyKF8GZ8vErZhkNfUE8aukCUXiC4bcALe0PXfI=; b=02yO47KueO4PUtmF7mlzoN0XUh
	6HQwabmFOjg7AjVyR6Sivs9q9e6wu8k6lOw7M+x9DA4PFCPeYMRoSyApKYANKzwx5mqEC14hjg/tq
	+d2GVN+GXTkhqMXZMFGhCzNLWXKpF9sT6zrkUtQOsxln4ne0ReKwKOjdGdFKCtmTBwbNoXPT0bBln
	2/mRO1lc8t/rnV8NrNQFSk1ZA1lae/0xK6NlAa/ag9ZoG2ZKNBPiB9tQ7Xg2WJqjmXRGTFlj7qobT
	8D1lvg8uRQUvJz86v/lEzrVZQVUQuTIUIXHueOiBHC5K57ELMwoUMPQt4YAJ1NTpeqPsfeRPxAg2E
	lyCI21Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZJR-00000000w2j-2tcB;
	Mon, 11 Nov 2024 18:38:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZHf-00000000vnC-3Xx5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 18:37:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cb47387ceso49485385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731350227; x=1731955027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GCiEccyKF8GZ8vErZhkNfUE8aukCUXiC4bcALe0PXfI=;
        b=U/ODGDsw7//zHkBvPtn6/BMa/SU88H0RnoFvrG0T+1XGzGcKU3YVDftBiXD1CgaivU
         AkzsfOPqk35/Q2JLTALi9iywwJg0PSuxTy/OHy3k76uY2RY4SkKyMQniiw1hR9uwLaId
         QUfaTP4BpVYOeEd38jWP6w3d4+hTJphNUFhniIg4TWUUfR4mzWbVyapN/ctNZFG4FsOw
         KRKJ1D7+OqMzJqvJOkabgBd2tcNt1SLHQsHZkNdyHw/EL9LeaF9A3CPYU25osptM1T4e
         r7O7LckGHvvax/jkK6eodcoYykwm3MSd1+qvZZDHGRDOgWVTYPaIlPEPglVYE7rmvZck
         eEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731350227; x=1731955027;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCiEccyKF8GZ8vErZhkNfUE8aukCUXiC4bcALe0PXfI=;
        b=d5Wh6+qSiuzKKm2KkfABffFN+NCEkm6p9gYmbco1x/DMuvGoCSzgd8PiDlRZchN/6a
         3OxCc8Dds+gljXxGNXQrAIyQvRmH4GdJCM741/Q/faxmOf9MuqCfT/2IrkNyiMw2cqsn
         1ZvNP7b9ZJjsCHMfAjYI/zdP6Mz20haacfe4rYZY3MMhGGknIuFRzhdjoU03dYIVYOYJ
         CC5Ne5mJMYyFkNMo40DvEPJdwTev2ioaVJ1zi0q1prPedbJk+3wBL5lk9CLwOUoVEtB6
         ZZdb+eNcD8jKY/LbP5NK7zeIt+zBTWQ2YqDzcrJfCqSM8BOoT4huY0kAIwjcF5j1ZrP/
         LkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0V2o1rO1R6JI7PBH5BbWczKV43GUFof552JKt9WuGUHPwv8rDmGq1qVwUK3SgJTtycVQCAmx63aGIKETR5Kvv@lists.infradead.org
X-Gm-Message-State: AOJu0YyPtfbRotvsoA/yMi9FwaAC9ymk/C8Jjw1Zx1togF52e7dGc4hY
	oLhWLxKW36s5gEqI7nwsvGiEkTFL2oV+FdFcfv2pAO0lf8FMzOPb
X-Google-Smtp-Source: AGHT+IGr8e9DiV3V2QHHPadF3ED2eVTLHuUNPmsGNSWjihoWy0A1RwKBOBxWjUKHuwFj8UAk48IIJA==
X-Received: by 2002:a17:902:d50a:b0:20b:cae5:dec4 with SMTP id d9443c01a7336-21183529badmr191550575ad.24.1731350226814;
        Mon, 11 Nov 2024 10:37:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc9f23sm79351145ad.29.2024.11.11.10.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 10:37:06 -0800 (PST)
Message-ID: <f2690f72-9b50-438d-8301-9e93b03de3e4@roeck-us.net>
Date: Mon, 11 Nov 2024 10:37:04 -0800
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
 <e8921251-02bb-409e-88d0-d635e7d08929@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e8921251-02bb-409e-88d0-d635e7d08929@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_103707_906662_509999EF 
X-CRM114-Status: GOOD (  14.95  )
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

On 11/11/24 10:10, Guenter Roeck wrote:
> On 11/11/24 10:04, Guenter Roeck wrote:
> [ ... ]
>>> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>>> +{
>>> +    struct device *dev = i3cdev_to_dev(i3cdev);
>>> +    struct regmap *regmap;
>>> +
>>> +    regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
>>> +    if (IS_ERR(regmap))
>>> +        return dev_err_probe(dev, PTR_ERR(regmap),
>>> +                     "Failed to register i3c regmap\n");
>>> +
>>> +    return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
>>> +}
>>> +
>>> +static struct i3c_driver p3t1085_driver = {
>>> +    .driver = {
>>> +        .name = "p3t1085_i3c",
>>> +    },
>>> +    .probe = p3t1085_i3c_probe,
>>> +    .id_table = p3t1085_i3c_ids,
>>> +};
>>> +module_i3c_driver(p3t1085_driver);
>>> +#endif
>>
>> While looking at i3c code, I found module_i3c_i2c_driver(). Can we use
>> that function to register both i2c and i3c in one call ?
>>
> Answering my own question: No, because devm_regmap_init_i3c()
> does not provide a dummy function if i3C is not enabled.
> 

I do have another concern, though: What happens if the i2c part of the driver
registers and the i3c part fails to register ? module_i3c_i2c_driver() handles
that situation by unregistering the i2c driver, but I don't really know
what happens if a single module registers two drivers and one of them fails.

Thanks,
Guenter


