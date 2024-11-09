Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB157D64076
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IZGLZAVK1oqGbVkQTDsgw2qviq88uDM6MYfmQbYgOw=; b=MB3lPBdeXd9etKHcgdyKS0jUTG
	i2tfBtBl0+IqYDmeLwoq+2JMYE6sQu21vLZgcF+EMyp6k6207IdivpIFeAUJnvGWCyt8wwYawKybw
	WJPZb2UwHAGG8IdNAcGjd8409HGI1oxm5YtnhwAa77GwWONaI7ZuRY9b2ewLGjOO1EnduSPiIuODi
	ySMxNcwahCpUpvsTNUEz0sN7uyXf6fmdfT/DyqdurGj5gcMj31ep22KNxU8yQB6hv2a1H9DLJNkIO
	ZSvnkLvj0nC+YKd7N049Wb5qrTjHBINaMUoev35CBTpx/Os5Mn+uaGymDTHs+pFdx24W3b1iTuMyV
	+HW9JOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZPs-0000000CLu4-0uMU;
	Sat, 09 Nov 2024 00:33:28 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Z4e-0000000CJJV-2Ama
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:11:33 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7edb6879196so1943531a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 16:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731111091; x=1731715891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3IZGLZAVK1oqGbVkQTDsgw2qviq88uDM6MYfmQbYgOw=;
        b=UqIqxD2LfgGZWcisYBDQGizGrM06+e0pkK8ICEc4pk0EP5IpAJL8/5F7geA2IMIh3c
         41XwWFL+K46ry5uIdxKS9foU7ifrni15SN6Pkp3ePbNIynXFdElwFCP6g/AgWCcBlTKn
         vyCaRp99N2dPYT5xpDAQd272hMwNIHRlwoCxgST0zBH6Y+bFF0i/tsn1N02RRv6PcxfV
         USp7YlBohVB5nTWDqD3oUhzNz2fGOSDyaERwITrlcx5U5zTEbDOpyWeXbyO5eLAz0uf7
         ZIkawTQuTlZu3z6t9/yStHKr81P5vHWxVwHd3kR6F1jeY+2wGIhRq6QuEBlEFMTAHSOU
         yi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111091; x=1731715891;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IZGLZAVK1oqGbVkQTDsgw2qviq88uDM6MYfmQbYgOw=;
        b=CO93YUTYBUKTLS26SSSKCUskNexM+aW2wBg7OFQleFMeE1jL0EG1xzBYkjqfLXOWF8
         1Ka1NX1LtCQDdVuQ6Se+NJpQQfIdaIYFPfZkWIB0/AKBo+QQcJpPYZPWV/HGCfF15a0R
         i4RvO7WoPhyUvsYx+wm17rsYCf6V2y1GGks32SSKc3JDxpu9m4qcJ49DDeJPhh+Eov67
         9uK20Zi9EHrSu1nqMKnFrIgCwkCUzrx/bbHJ7mx24vTVmN4SNaSpbunaPamP3ceZikDf
         4WYW51+MH4i0QSzs4nhYpt3xlb8PWcdHm0NRN2WDrVfoZ8Fv83k9QmTmMALutaFde2ob
         4Rkw==
X-Forwarded-Encrypted: i=1; AJvYcCXOIflznJtdIah9njHIJf+7VBf2EoMFAVoqsvgj9Rzeu0sq0xb8B2QkyvthbgKcTtt+BzVZxaSzgpqmDHM9GLtO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6eUhfz87mrN0Ikqll+WQsssR06W/jSmKwsd3L0lxY1aBmQLDz
	2POnznqCBo1gXmo6i39zCkXmTI8Z02ESe6IgjooXB+Ay5C1duSN0
X-Google-Smtp-Source: AGHT+IGuXcqZTQ3uvvLT9UskUYdxGCdtqXC8QEEu9t5fHd+ir4QXBLBtFwW74giJKCVZUtxSJ6Qjqg==
X-Received: by 2002:a17:90b:314a:b0:2d6:1981:bbf7 with SMTP id 98e67ed59e1d1-2e9b17947a4mr6159364a91.32.1731111091548;
        Fri, 08 Nov 2024 16:11:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f8f1dasm4677556a91.25.2024.11.08.16.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:11:30 -0800 (PST)
Message-ID: <b262ff19-dc57-4a72-9395-25d81e48a476@roeck-us.net>
Date: Fri, 8 Nov 2024 16:11:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hwmon: tmp108: Add help function
 tmp108_common_probe()
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
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
 <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_161132_597046_7D5EBA9D 
X-CRM114-Status: GOOD (  12.28  )
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

On 11/8/24 15:55, Guenter Roeck wrote:
> On 11/8/24 14:26, Frank Li wrote:
>> Add help function tmp108_common_probe() to pave road to support i3c for
> 
> help -> helper
> 
>> P3T1085(NXP) chip.
>>
>> Using dev_err_probe() simple code.
> 
> Use dev_err_probe() to simplify the code.
> 
>>
>> Add compatible string "nxp,p3t1085".
>>
> 
> This is borderline and problematic. First, it is the one functional change,
> and second, that functional change is not mentioned in the subject. At the very
> least it needs to be mentioned in the subject. I would, however, prefer two
> separate patches, even if that is just a one-liner.
> 
I forgot: The additional chip support should also be mentioned in Kconfig and in
Documentation/hwmon/tmp108.rst.

Thanks,
Guenter


