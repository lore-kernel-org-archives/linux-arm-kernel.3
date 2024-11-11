Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F44D41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CxGPRc/hvI7VkJ7WnQuoryGfDbvzXp7f28v45x6BOw=; b=CTGybIIOWG79B6vLz+gpkDGa6x
	Ekq4dQmX0zdMWOIrjB+KpN6yGdlIAXN8QCNFlabAfhqqZDTw6gHl8pk9HTDSoTGtEylhWe+R8YgbY
	zjPvvqWsiyAHRQhOnZcC+vzPFLSPHRed4/tqDg8F55jj22s4dutvcrnKQYCAEieGLgPP4xMQF3zE6
	7AIzqCCdQe3vbhvpDDa1BYnZddrRQxdbCxMhMx91vyeoHtNoq37QaZ+aDYKDn8tLEZjJ4kXW9DW8N
	rPs2QJ/fK9JllcUx4HzjimqK0qgEDEZ/3gtumTpQGbnTE+vXRxT+c+u1RQ7vb8GcwRIYCTrUcDBRU
	fCGCekkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAf2X-00000001m66-359I;
	Tue, 12 Nov 2024 00:45:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdsk-00000001crv-3YIz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:31:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c714cd9c8so51114595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731367902; x=1731972702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0CxGPRc/hvI7VkJ7WnQuoryGfDbvzXp7f28v45x6BOw=;
        b=BtRzjk2PGigm/bJMeP9t3DAG3UZdkyOuCxYYGChueBcFNJ1PXlL/1/lovVWGKWHJMw
         7ft8ueQuHmdy364MfSJ86GsCyMGfTadPo3mLUZOTuo9uoFtAz5J+CLy+lKh0jJEYG66+
         DPZOJ21Xy/Hjd+laDW2W1SO4BLJEEoGRowDsY2AQpC26eAf/eL5yA4CrtnzXKxpDt8mG
         rTbMGKWswFmUXUwycrqz20iboByB8cniM4vFt+HEojbyI8JNQawBVmQUeWHVaAQxm0pw
         CFjR3aC80o0jGbO7Iuna5lF7idWiGpKer4VJ51I/APO9WS0+ynLnOGKPpviopnFszsvm
         F1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731367902; x=1731972702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CxGPRc/hvI7VkJ7WnQuoryGfDbvzXp7f28v45x6BOw=;
        b=qg9QCKdoBZQf915GORypRFiDtB2W18Sgu02GZjSWedyKor13cwCdlyhYGw7eyqXZcw
         SUEEEP3w/vmlOvmqJDkkMAcha2PX516I5r7eYFPgvF5LelRxnP3t6ugpCIyfFvBxjdcL
         jxjwFeZ49RXkB/e7v9BmGJBnqY9BIfzXVXJso9Zy3m4RXxTsQaqPhzgFiE7IRrra6PZG
         mi1Xz017GMiCq16CupM6UgjMo8gmdZ4GsveOdKGfWok0V6PrTz1H0NDcYOLDmLjnlfi/
         3I9cIhIpg3th7WINo4QrgAQqbaRXXWDCf/M4HFk+bjP/UzCFFvLycZAxv/NouDcbRvIN
         d1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWPAEyqt3oJgioG1Mf1fiauWXzgqU4kzmMc+J7aOzz0+QXEfvmlDwoe3KI2qlST9tuu9qSsHR24h+PbQFOsC7ai@lists.infradead.org
X-Gm-Message-State: AOJu0YzgdD67jgb/gOxdJmO8HSnv4fk70f/CDqfHyClqwNBph1Ubi6CQ
	HecBUIK727Wm8QDbh6lt4JrcJcwwEOxl0S+dfBFIgMPdsHnegp+M
X-Google-Smtp-Source: AGHT+IEBkTlHjkg32X7fZGi05A4GmaJEJlXkxAfydPRC5Spm5Nt9TrC8C1I7I6cXzZDuUOCaNe+W3w==
X-Received: by 2002:a17:903:2347:b0:20b:b455:eb4f with SMTP id d9443c01a7336-21183d6eff4mr214496655ad.25.1731367901740;
        Mon, 11 Nov 2024 15:31:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e7b7e0sm80998185ad.263.2024.11.11.15.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 15:31:41 -0800 (PST)
Message-ID: <7bdd2db8-41c8-43d8-ae73-84a221d2d004@roeck-us.net>
Date: Mon, 11 Nov 2024 15:31:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
 <41995c8a-8b05-4c56-b4a3-5f275a88b899@roeck-us.net>
 <e8921251-02bb-409e-88d0-d635e7d08929@roeck-us.net>
 <f2690f72-9b50-438d-8301-9e93b03de3e4@roeck-us.net>
 <ZzKRRdXpeHVyUDOM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZzKRRdXpeHVyUDOM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_153142_917897_2B651E43 
X-CRM114-Status: GOOD (  19.77  )
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

On 11/11/24 15:20, Frank Li wrote:
> On Mon, Nov 11, 2024 at 10:37:04AM -0800, Guenter Roeck wrote:
>> On 11/11/24 10:10, Guenter Roeck wrote:
>>> On 11/11/24 10:04, Guenter Roeck wrote:
>>> [ ... ]
>>>>> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>>>>> +{
>>>>> +    struct device *dev = i3cdev_to_dev(i3cdev);
>>>>> +    struct regmap *regmap;
>>>>> +
>>>>> +    regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
>>>>> +    if (IS_ERR(regmap))
>>>>> +        return dev_err_probe(dev, PTR_ERR(regmap),
>>>>> +                     "Failed to register i3c regmap\n");
>>>>> +
>>>>> +    return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
>>>>> +}
>>>>> +
>>>>> +static struct i3c_driver p3t1085_driver = {
>>>>> +    .driver = {
>>>>> +        .name = "p3t1085_i3c",
>>>>> +    },
>>>>> +    .probe = p3t1085_i3c_probe,
>>>>> +    .id_table = p3t1085_i3c_ids,
>>>>> +};
>>>>> +module_i3c_driver(p3t1085_driver);
>>>>> +#endif
>>>>
>>>> While looking at i3c code, I found module_i3c_i2c_driver(). Can we use
>>>> that function to register both i2c and i3c in one call ?
>>>>
>>> Answering my own question: No, because devm_regmap_init_i3c()
>>> does not provide a dummy function if i3C is not enabled.
>>>
>>
>> I do have another concern, though: What happens if the i2c part of the driver
>> registers and the i3c part fails to register ? module_i3c_i2c_driver() handles
>> that situation by unregistering the i2c driver, but I don't really know
>> what happens if a single module registers two drivers and one of them fails.
> 
> After use module_i3c_i2c_driver(), and remove #ifdef I3C, and disable I3C
> in config, build passed.
> 
> It possible cause by
> 
> static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> 					  struct i2c_driver *i2cdrv)
> {
> 	int ret;
> 
> 	ret = i2c_add_driver(i2cdrv);
> 	if (ret || !IS_ENABLED(CONFIG_I3C))
> 		return ret;
> 
> ^^^ !IS_ENABLED(CONFIG_I3C) is true, so linker skip below part. So no
> ref to i3cdrv, so linker remove all related codes.
> 

Yes, but I don't think we can rely on the compiler removing the call to
devm_regmap_init_i3c().

Thanks,
Guenter


