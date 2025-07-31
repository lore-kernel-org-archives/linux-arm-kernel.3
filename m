Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGJP+XM2QRy3xZpyYzAjGI2yVY6aGwV1yQQa+Igvnt0=; b=HYSbPscCMXpzR6N5M1VwaOE2ap
	jhxyx9ekAmlvdWLx9yB2otJT45xW4F0rHZSj0okhtbaxzTTW6zpYgnGXk4XypBDT/xwsD0oBXxs+V
	UobOr4ue2xWHAH0iUrtb6GqFVygsK2zOA5ips7ukUndJ4K3T3CwoNdxQrgjoMIPSUxFf3qQHDn3uW
	mXayz84n00kuDI3PYNRqrjBL+n3WEwzIF6L+DliubuAWEjryXYwbGxDJMQrOLLd9An3KUiE3a9iqD
	K/S8vWPKkgvKnXaUIuvsy73kcsIP2Mk6jseE8UeeP+UD3G2/bL3hmMU2LMwajv+5QMqQjU+3ZUjJu
	Ed4pktjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOpt-00000003Bec-09zP;
	Thu, 31 Jul 2025 08:40:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOjR-00000003Ac2-21V6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:33:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b7910123a0so681162f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753950824; x=1754555624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGJP+XM2QRy3xZpyYzAjGI2yVY6aGwV1yQQa+Igvnt0=;
        b=Kd0jBtopwmAZ3PK8KDBkt5lL8DIU92XW1TnD30bLYW0RbUaV0mfRTVl6Dfh7EtKIBd
         pOZ139HeGR9elcAG6IXBYSah5mhT7EuE3mjS54eJAYjdqBj/Dp3dyythbS1zlfQeW5Hr
         RF3J9zF1xTFqkBwF49BCat3lWBSLjBynVDkad/oQ6ebN8WWQYy1bfU66nB4eY6Q/2RyW
         HNOilgubvYq90IZBkFLx0zWIPIgBg9s4aE1iD7pQB5gpmZM7+fxSIJWJJXprQr0Ry1L1
         OeP2ZmNxTEvVVzqXk0ys0oiA5ZlWhii097bwulXgFgO5OJtNg1EI81IIEvrtcSA00BMr
         WSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950824; x=1754555624;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGJP+XM2QRy3xZpyYzAjGI2yVY6aGwV1yQQa+Igvnt0=;
        b=axmlnKdr/Ak+WzIOTGDklIFoXL9kDUq7pKgpCMz+lL2BwSiN8yxtjLY/0ee/C9UOmj
         GSuuB58n8dYtUfQFvuG6EegE5d97JlF9cxW7UAVsW+eICjxiP8xjUzuM1gqEy1gah9Iz
         RcpEBBXnqCIgW+9Fcm1KZY9658Hm3tJ9N9BlIY8IIq5r7+CzkqEf+5gtF6wh9v91IWki
         3aBhda4ROOgr+oB+3fJN35wvKCHhCd9pwMfJdRpPIldOwxJvccwqTp92HSk3IOKXmvEo
         I19DGQn+J0tonXqntEhvN0Qk5wuFREkJhQk9BahHl1hMk1U3EcNEPvr+eALEqqTvt9Fp
         8uiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Z3xf17fkk8NiRyIs12CfSDz+Foq1AO1PLRDyNyCxfJONtq++i0bWdAFkg6YQxZVlyg0H3FWhc8WszuJrVAg9@lists.infradead.org
X-Gm-Message-State: AOJu0YxHdfyI+PqYo2VSP+6/liWjkoM1DFs/LyquiWhNFYa0HK03HKFD
	pqxxSdnLekIHWGzAmueZUwD6iMStC1v2gSYxKcxPTVoVY+iMlB1SExKt9D/3GRgjIhU=
X-Gm-Gg: ASbGncskARysG1/HarrDw8bv3G/Cpui2ZtAU27/yEkU6Y+cZ7nLGgG4SrW8k0Y1MMka
	kW4cDR/F5Mbza3qZbEzJczlTsa/Kdp48ADho447g1jJMxNttKkntvHhhHqasRay3W5lUBqYJzlE
	w8JVzpwu4NOPXvnWbCnVzCMrVl2LaEww/6ncF+0B1Zxhn96qJimay/fBsjOMea3NHmw+mYVPnFI
	4PH1mL2Ho5UNw4rS+C3tSiUJm4hssRXASB64vO9Q53Js3KSOAntLl1D6fd/JvyK33ZGZS+4nugp
	3HMJN241DBaSbIQKV/sTvAmJACn9dhk8OLb2NNr86BdZPdpWwiObcLEvI4zmlkzuyW1QYAyjit0
	W6xDPz7ecTMGGmgFWVsRCozQxKYUwbaoI3RkJxNTq
X-Google-Smtp-Source: AGHT+IFcq/n9pFKDzQrWbt3Evql0rRci2sD+tCY8uF41SfcY8vu514kFil4FRbrrxqY3Zeg5MXv0vw==
X-Received: by 2002:a05:6000:2907:b0:3b8:893f:a184 with SMTP id ffacd0b85a97d-3b8893fa74bmr257918f8f.52.1753950823904;
        Thu, 31 Jul 2025 01:33:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47908esm1586755f8f.59.2025.07.31.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:33:43 -0700 (PDT)
Message-ID: <100aa0d2-68b6-466d-95e6-0acfb259cf12@tuxon.dev>
Date: Thu, 31 Jul 2025 11:33:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] net: cadence: macb: sama7g5_emac: Remove USARIO
 CLKEN flag
To: Ryan Wanner <ryan.wanner@microchip.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
 <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
 <fe20bc48-8532-441d-bc40-e80dd6d30ee0@tuxon.dev>
 <848529cc-0d01-4012-ae87-8a98b1307cbe@microchip.com>
 <681b063c-6eab-459b-a714-1967a735c37d@tuxon.dev>
 <76e7b9fc-e0e2-4d21-ba5a-dac831522bb2@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <76e7b9fc-e0e2-4d21-ba5a-dac831522bb2@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013345_522634_21E5DFE5 
X-CRM114-Status: GOOD (  18.38  )
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



On 29.07.2025 18:51, Ryan Wanner wrote:
> On 7/26/25 05:56, claudiu beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> Hi, Ryan,
>>
>> On 7/21/25 18:39, Ryan.Wanner@microchip.com wrote:
>>> On 7/18/25 04:00, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>> know the content is safe
>>>>
>>>> Hi, Ryan,
>>>>
>>>> On 14.07.2025 19:37, Ryan.Wanner@microchip.com wrote:
>>>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>>
>>>>> Remove USARIO_CLKEN flag since this is now a device tree argument and
>>>>
>>>> s/USARIO_CLKEN/USRIO_HAS_CLKEN here and in title as well.
>>>>
>>>>> not fixed to the SoC.
>>>>>
>>>>> This will instead be selected by the "cdns,refclk-ext"
>>>>> device tree property.
>>>>>
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> ---
>>>>>   drivers/net/ethernet/cadence/macb_main.c | 3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/
>>>>> ethernet/cadence/macb_main.c
>>>>> index 51667263c01d..cd54e4065690 100644
>>>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>>>> @@ -5113,8 +5113,7 @@ static const struct macb_config
>>>>> sama7g5_gem_config = {
>>>>>
>>>>>   static const struct macb_config sama7g5_emac_config = {
>>>>>        .caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
>>>>> -             MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
>>>>
>>>> Will old DTBs still work with new kernels with this change?
>>>
>>> That was my assumption, but it seems it would be safer to keep this
>>> property for this IP and implement this dt flag property on IPs that do
>>> not already have  MACB_CAPS_USRIO_HAS_CLKEN property.
>>
>> So, this patch should be reverted, right?
> 
> Yes you are right, more testing I see that this could break older DTs. I
> am new to reverting patches, do I send a patch to revert this and would
> it be an issue now?

Not sure about the approach now! Looks like this has already been merged
https://lore.kernel.org/all/20250727013451.2436467-1-kuba@kernel.org/

Thank you,
Claudiu

> 
> Ryan
>>
>> Thank you,
>> Claudiu
>>
>>>
>>> Ryan
>>>>
>>>> Thank you,
>>>> Claudiu
>>>>
>>>>> -             MACB_CAPS_GEM_HAS_PTP,
>>>>> +             MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
>>>>>        .dma_burst_length = 16,
>>>>>        .clk_init = macb_clk_init,
>>>>>        .init = macb_init,
>>>>
>>>
>>
> 


