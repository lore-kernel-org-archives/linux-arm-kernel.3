Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7368FE77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDNEsUfow91uTBH4QnhATUdWKOFKIni6Sk4yAbrFDmE=; b=Vx3PWojMI0ps21KnrYKyJ8Vrfn
	iksQ0BLjTbzYSoVnRrhyWOgRww12m5ynFyvo/KZt4eeMqmi0wF7fzKEVan/mGLY9iZPHiO3OFyAbi
	zgBpS0+SShTn2v/fv7srMZLh+BXaJuQ49q7erH8YcEfmjYWayMAsZAEsS1+aJN/7CuIgarYKDMFt+
	SRT8Wi0IF4vQ0Vpu6ubITB7z2YYrf2+5WxzIgADCIm+KBS5enaa1J94jke+nSggM0wFoaZY2iCfAs
	qFmDyLVtmQSOoZTISIOTDbGGvqqB76m26h7yD/KA3E5CR/v8IoPoQMk4Vf5p64+CZWAcidq+WDKfe
	CkF+6XYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj9h-00000000cdx-2af9;
	Mon, 06 Jan 2025 09:12:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj7m-00000000cLI-13r1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:10:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so9288432f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736154612; x=1736759412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDNEsUfow91uTBH4QnhATUdWKOFKIni6Sk4yAbrFDmE=;
        b=JnsiNExnAYfpfuq9fSwrN5uOH//fRXOpEASV74CSJMtsqSEyOYEUgRmkyV+3CB1TZr
         fn1c2tneuQK5zr8O7+qrfeqTqv7T9owtET7WbMFukMHe/bXshbA+oMLSDarVD9OMfc/k
         hsGRfvS6+jS99DgFN9j6zmLjsHEZkzJC3Oa4mr4M+yz5364dunJwdxxGUzn3RXpK8Yip
         9CSTyWgD5FE0CXdU25lf/QU9gB4bdubP79ZNFVv+18K8qawItWCljuXF/Ux4hwX3SE7v
         Yd0ZRw/kvG9QWEtzsPS3LU5IygYPUEq38pmXKejAsdtyFN379fg0GGSTSfmJokkenQJK
         +rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154612; x=1736759412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDNEsUfow91uTBH4QnhATUdWKOFKIni6Sk4yAbrFDmE=;
        b=OED9k6l7i6BURhuHnIwzT3E322aKghXfKogqnWo5lgHTuVjzEtqgZyZQJAoNWayIJ6
         b4Brsq7qNY0lSqDlA5FXq5PS23N4hlFE4ah3IzlRp8YxO/UKbrB0QMgoswm3txOEHMu9
         Gqta2Pw8ccxpjaNhT8Eltd2nOME14cDx/5cRTMRAp2oshW67jvyf4IyDPPfE983q1doY
         sQ4XayRwJdiF8sgmkW6jSvO4tIFvcCVt8NEFmHjlEtELT/etahHhpuOcTkqf21CgBLys
         1m77/jR/ynkkEuz9BbHeMwKc4Y1y8xXw/cUkVdb4cus1BZx6Ojfp+7O+MN5S4TLdMxLQ
         S4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIuBLK/mM+hmLmxx8DddjPJdLU/ZfeUAYPCtFkb+q/ahNnek6IAPjJvw7ST72rKMfCAYpUaMKapdzAdCl+cQzT@lists.infradead.org
X-Gm-Message-State: AOJu0YwkH38HXfGN1ItzoPpkvgbix94WkGLnJZ1k1Fz1VhZ/2FJPWO7y
	s08ZNHd3osxn+mO4rI25WVZChRmG/+cYEKrgcizg40XKzATpAz2NhNS05u2mEgo=
X-Gm-Gg: ASbGncu1yW2NrhUfTVNA6y8WHUpOYUc87U/Sy+Mlp/u4NHb6rc1lysARWEWvtaKbngA
	fgGRE7oYjKDmii5EYH8C8iBVxz0sQ1SLp2TL7QTjy36p/Dx5b3xsRKs2YUpzye+6bzD14JhVRni
	OJ01hK9N72juwbW7pmyD3iISXuZ56RWDPZeljJecpheNSkyYxfprHYbpyxdY3M7XRRSfWqkKG16
	knD8+phkeltx1+FcVnFMo1mWVdOUbMqAm+zRTGFSvDQP75tcRMWINVaN5rwVV7u
X-Google-Smtp-Source: AGHT+IHf0Kjy2F3wCk6C6D+WwXbOXA3J5Z7TYC7UuHxWyQDK+Pm2Zk/Zqy6o60oRO45YkwwQY81zIQ==
X-Received: by 2002:a05:6000:4024:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a223f5d8cmr44100326f8f.45.1736154612545;
        Mon, 06 Jan 2025 01:10:12 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm46989269f8f.11.2025.01.06.01.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:10:12 -0800 (PST)
Message-ID: <aaa12002-3922-428c-b595-2cad76e9ce2e@linaro.org>
Date: Mon, 6 Jan 2025 09:10:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
 <a7686593-ab07-4e18-912d-745576c6a450@gmail.com>
 <56e13a29-c087-4fe3-abf5-ebbad28ddfdb@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <56e13a29-c087-4fe3-abf5-ebbad28ddfdb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_011014_318789_6DB1BC8A 
X-CRM114-Status: GOOD (  11.19  )
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



On 1/6/25 8:50 AM, Krzysztof Kozlowski wrote:
> On 06/01/2025 08:41, Ivaylo Ivanov wrote:
>> On 1/6/25 09:36, Tudor Ambarus wrote:
>>> Hiya,
>>>
>>> On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
>>>> +#define USI_MODE_NONE		0
>>>> +#define USI_MODE_UART		1
>>>> +#define USI_MODE_SPI		2
>>>> +#define USI_MODE_I2C		3
>>> USI_CONFIG register refers to the protocol selection with USI_I2C,
>>> USI_SPI, USI_UART. How about getting rid of the MODE from the name?
>>
>> I thought about that too but I believe that mentioning that these constants
>> are for mode selection in their name is generally a good practice. Let me know
>> if dropping _MODE is really needed.

no strong requirement.

> I am fine with both, MODE feels a bit more descriptive indicating how
> the USI should be configured.

Fine by me to keep MODE in the name.
Cheers,
ta


