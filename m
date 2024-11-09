Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC5FD5E374
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghbuLAThgkIRMv7v5y1QI1mRj61wYj6v1lVWxgIrotk=; b=nhwkbldXEUm6yJNe+j/ZeuyKQk
	pUH2Zr/JUrQld/uu7J2HfqfZL8W2qalJL9X5UEdgUtc4Q+u7Rd2cln88ofvl2VsMJV1zcdqZ7RAHs
	XDCViZBfQ33pIah1L2rc4NRk1aBAfHJxrV91nNa+bP7iBOEvcWNExjFhgQEzIqozHPqCvEIInZQ+T
	nywKATzCIH032VDq9nknKWXjptXYvwzOzMJ9r+hzR+ibQHrx6zVXYdVtt3aHc6jXsDvMJTFXKAYvb
	C70pl8z3PrM2DoqxbuvV02MVFppOPOFT5fnL0pQkNgycKUTDuFeNVv7mfISAcZ3iTEt4ytr+9bAmt
	LV3gcJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9mry-0000000DV07-3PGW;
	Sat, 09 Nov 2024 14:55:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9mqD-0000000DUpC-3xev
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 14:53:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cf6eea3c0so33336595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731164012; x=1731768812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ghbuLAThgkIRMv7v5y1QI1mRj61wYj6v1lVWxgIrotk=;
        b=li7NnlIhLcAkLlW2hDk3zZrGuxPd9LruW9XxgmwhZGmLLg7Y555VGPt4OWklAlZXlr
         Kj4u0vxpQqqR+s13OPwSPJOEWvEeznU9XKMeQykY2nvgo7uhdGZS542AjRH3JnxU/m+n
         S4eTGrdHLP86YRnA1osm0RM/C5AEtt5uDCVfaTL2f+Mqvk2q/P7a4Dzz+KF+UERuEtjO
         X7EB9uE27OtlJWq4b1q65LO7bMnzgP83Rbty1y6ndZprdmMik2JIK5EuyzUYSGSb7sSQ
         T89MZU+YSakxKhFgeG2JFtdxKMwjyeb2F4vWzyCYt8czrKUITEW8ZSnNv/PNOy90RqrJ
         kg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731164012; x=1731768812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghbuLAThgkIRMv7v5y1QI1mRj61wYj6v1lVWxgIrotk=;
        b=j0xueiZVvMs79bHME6cDA9hwuxjuAzmsLmJvmOqGNCdxHuPhBwAkRXf/rXdTZTUPEp
         YwtgnTORTVTetf2McXgiVezxtmCd1cz0ZfmTmamTvI+fviBSxqQEQMgAfRd3Ip8oct4X
         gx11ITF19E7CoE/bXFuDvWB+Z72+SQ7chLDxPLBtQaccNGEBHJKE+j8McTDMpNwWfvvf
         CSWpkZv9cN955DUQmhaYY0b6c5NvRzEkumQ7MtRzhNA5aA+GM5X+6i5pDFzxylyUjc34
         MVSAfPbfnVTbH+G+AAfou3/39ooxn/5e83Ww2NFUHvqps25+fpjQ6vyew2OjxNPfaLzN
         HeRg==
X-Forwarded-Encrypted: i=1; AJvYcCXjTm9Yl97GtQuGf4tczv7XxRG0XTkzXXbzXmPs5F9ybLT3drbqHamfDYKsNBuAIZPostf02DSVOyw962Y3paGc@lists.infradead.org
X-Gm-Message-State: AOJu0YwSzZ7i501PbVnb096HZiJWCyiUPW5QT2XkeJ/RTyVsOb66D2hB
	3dCJyL773a+CI71hG99w5/OwCiNmEnNcPOam9qaA+BtkQI2mahMK
X-Google-Smtp-Source: AGHT+IHH537SxY8wFxXvHEldQOX00jSQbhq86kY8P4E7+gzAi230SDoUD4kLOapioickwHuD7+FOwA==
X-Received: by 2002:a17:902:c40b:b0:20d:2848:2bee with SMTP id d9443c01a7336-21183507aa0mr95841435ad.16.1731164012349;
        Sat, 09 Nov 2024 06:53:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e87544sm46034065ad.283.2024.11.09.06.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 06:53:31 -0800 (PST)
Message-ID: <014410fc-8a4c-440f-a6eb-1fafccc444a6@roeck-us.net>
Date: Sat, 9 Nov 2024 06:53:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: tmp108: Add support for I3C device
To: Jonathan Cameron <jic23@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
 <20241109131604.5d8b701a@jic23-huawei>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241109131604.5d8b701a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_065334_026572_8CEDAA40 
X-CRM114-Status: GOOD (  14.77  )
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

On 11/9/24 05:16, Jonathan Cameron wrote:
> On Fri, 08 Nov 2024 17:26:57 -0500
> Frank Li <Frank.Li@nxp.com> wrote:
> 
>> Add support for I3C device in the tmp108 driver to handle the P3T1085
>> sensor. Register the I3C device driver to enable I3C functionality for the
>> sensor.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
>> index bfbea6349a95f..83d6847cb542c 100644
>> --- a/drivers/hwmon/tmp108.c
>> +++ b/drivers/hwmon/tmp108.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/mutex.h>
>>   #include <linux/of.h>
>>   #include <linux/i2c.h>
>> +#include <linux/i3c/device.h>
>> +#include <linux/i3c/master.h>
> 
> Seems odd you need master.h in a device driver.
> I'll guess that's because you should be using i3cdev_to_device()

I assume you mean i3cdev_to_dev() ?

Good point, but there are not many examples to draw from. The one
existing iio driver (st_lsm6dsx) doesn't use it either. I'll send
a patch shortly to fix that to prevent others from making the same
mistake.

Thanks,
Guenter


