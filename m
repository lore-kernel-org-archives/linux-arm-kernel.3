Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F13EC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGGHQt362qFxLIPdjCsZ5vAbXoXVOt84VTc31ozsZVY=; b=mmeajmp9oFlnGsdFfztl1szTBz
	PrmFfL6G3HzAJhNBdHX0zvsCIxYhrzR2TsEPpI2eEfKyZmyQ+D+z+BIOqf/7nPBb31TI2XOfu0QjB
	8f6eilrFTFcdrV0wSCFgbVPMQaSgdfkfsC7+gFMe8mwxopirj35bcWhYJ+QrN+Ny6DnmxhJt15ly1
	et7buYoBH+tn+7ByJL9ItSD7cC3ct1OWM3NkCGpN0yFHyiidbKsHcNdhIxBDRJLp4vljEqPmzP+TD
	pMUEqk5FAcOOhPa08hM5fci9dKQE8fyCSVypCZjXL2+aOR3wRweCBkFiwLaqkm2Q4M4l3L7/i6wUX
	9y8HvhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQvi-0000000FBFV-342s;
	Thu, 16 Jan 2025 14:33:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQqK-0000000FA6e-034w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:27:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so1255835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737037650; x=1737642450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGGHQt362qFxLIPdjCsZ5vAbXoXVOt84VTc31ozsZVY=;
        b=QtDsTs8kMjj2wahgsQmFfTAVJavLmdBzaeYM/+z2Kd8gEKc4/TQX56xd9g/R3FurC5
         G2pr+LZr9knEsVIgj/Kx20dDrgFken8FhWs0qzwm3GU0mmB9LysMo4QvDwO1Bfed2JnY
         gVu7DTtxMnLBKM7yEL9PqK+fXhh/VyT/RYJOkucvBRhIxdxZ+rLDRhusLfLFwhKVPT3g
         hBk6cIwm9CZ5RDp+FchHHoaEMZX9mXK3jr5usAgaZNm4eyzDgmsXp1Qr8VRXum0GlWWR
         mYoXigd4hspoDmTQxCS06j7H/h2qtQtHq0Lzq2A+Fnsf82Xh64Vk5tii7a7YfFlbCEXp
         H0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737037650; x=1737642450;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGGHQt362qFxLIPdjCsZ5vAbXoXVOt84VTc31ozsZVY=;
        b=vxSrhXESHp8jC75UqPNUZ0Ce4sr8Ot4y0MLZO7rf4qMb3lKJdO5ssnq7GRZMGpY2TE
         DU9S5UkW6mho/vGWRxe2WTpBoE9fE3yPY5CjdBVEyN+KtHuxjze+zZZkxqvcPFOrkKjd
         UIC1kKhbQDFidFRcS5A/ot/0veRP7zPmaf4aVm4c9268umf9IUcuIst8hkuOqSFg9F9q
         7xwsNdsz8vyYyJ4gO3psKnsEqiCZRlnPcBkxz+iJnh92j+RYlv+oG77L21s5QAs8y78/
         Df0fsQFtOb4g9Y1NOZQe1fumqPp94DXNVqgGAuvWnNiqUlBvg+iHJIKitH2/ILScoihO
         mIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfPlT/RrU6bvV+bKbiea031eS9aoKKnYLgAWQ5RA48Qj+KP7I+uKl+V3EwxKDh+FcdCkROX3MqGlhA+ZuU9QV8@lists.infradead.org
X-Gm-Message-State: AOJu0YxjWKYy7ZFuGI/0sxbzUwJu95nKVsQ1W50JSE9HbntHvUOloetZ
	uulSsR8u+4Tff4hSmmd2FgDYcSghLZm/PFZ5gvwTVwbJV2PDPPTYfSwlY8dpW1M/JvDlW27GkvJ
	/
X-Gm-Gg: ASbGncucE6ccZ4tAFEQVwJ/UuII/fv+uzlryNN7GRILjEBO33yXV8R2eIuD8Klu7wJk
	4YJ0aXuiMmG1RTcEERqAT+ZSv06B6g2Ia2lXFTWEwXlHpirs8yRdsR/e8XPH2gXxogDmGBjZLJc
	Nr4hVL92+dSU5sl8r1GEE+7szSwYyVpqfFe/gHk/6b6beJDt9OZpi9iMSzwPRW/RJetXFcLNuuS
	/SPi/mY6jPuO6mJxj7NZtOuTFx9vHFFpCBUIdWyv9YwJLYjCXH0ruH11u4SBcs8w1z6MFv+4kcH
X-Google-Smtp-Source: AGHT+IGI+9xN5JoVEowoewOfn71ULXmevSitFHnb9tteb6cVjNRGhpgrOwqSBnKP+yMsG2Bh+cLzQQ==
X-Received: by 2002:a05:600c:3554:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-436e26ffdecmr131841165e9.7.1737037649894;
        Thu, 16 Jan 2025 06:27:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm64114495e9.0.2025.01.16.06.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 06:27:29 -0800 (PST)
Message-ID: <8129b52c-f41f-4149-a3e8-8b739db9b991@linaro.org>
Date: Thu, 16 Jan 2025 15:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Align GPIO hog name with bindings
To: Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250116090009.87338-1-krzysztof.kozlowski@linaro.org>
 <cba3c5e0-624b-40a2-8b52-8d07604676a1@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cba3c5e0-624b-40a2-8b52-8d07604676a1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_062732_053350_7844C657 
X-CRM114-Status: GOOD (  11.05  )
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

On 16/01/2025 15:18, Ninad Palsule wrote:
> 
> On 1/16/25 03:00, Krzysztof Kozlowski wrote:
>> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
>> to fix dtbs_check warnings like:
>>
>>    aspeed-bmc-lenovo-hr630.dtb: pin_gpio_b5: $nodename:0: 'pin_gpio_b5' does not match '^.+-hog(-[0-9]+)?$'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  2 +-
>>   .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  4 +-
>>   .../aspeed/aspeed-bmc-asrock-e3c246d4i.dts    |  2 +-
>>   .../dts/aspeed/aspeed-bmc-bytedance-g220a.dts |  4 +-
>>   .../dts/aspeed/aspeed-bmc-delta-ahe50dc.dts   |  2 +-
>>   .../dts/aspeed/aspeed-bmc-ibm-bonnell.dts     |  2 +-
>>   .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  2 +-
>>   .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     |  4 +-
>>   .../dts/aspeed/aspeed-bmc-lenovo-hr630.dts    | 46 ++++++-------
>>   .../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts | 68 +++++++++----------
>>   .../dts/aspeed/aspeed-bmc-opp-lanyang.dts     | 14 ++--
>>   .../boot/dts/aspeed/aspeed-bmc-opp-nicole.dts | 10 +--
>>   .../dts/aspeed/aspeed-bmc-opp-palmetto.dts    | 40 +++++------
>>   .../dts/aspeed/aspeed-bmc-opp-romulus.dts     |  6 +-
>>   .../boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |  8 +--
>>   15 files changed, 107 insertions(+), 107 deletions(-)

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

I was scrolling and scrolling and did not find any comment, but I
stopped in the middle, so if there is something to fix, please send
again with trimmed context.

Best regards,
Krzysztof

