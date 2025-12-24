Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20767E776FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXhnYTRKWSBrdTvGbB7qy2q3xu05EvIJIuYEgLdKQ5w=; b=eo+XbJS9AqV7d256r0n1yJcLR2
	govT/7H1KnxGbYrMLSD27KFXC7663nIjvEXJ1IShyE8p7TSG6q7RZDUtuojGFQTIaopH+ZQuaNtrt
	h16mTggiUsHHOcpQXLhz2Y+lHLfVASmCq5VQKM/jPM2zkB08Q6uRQj9vJ0v7Lci345tFzCKlcNh68
	xUyf9up2Bygt4O+fBoXAVM71PTLycI0PgmCPtUwZB2BtY55XTkYXiwj8e8o6KJOmdTSG1GREMt+se
	sbkoaZNurjNvafJbI+0j2b8iz/b38y7ZzCtuAWxSzRvYs98JzaevJw2lTNiagYQvg9FEQtO1LQFbW
	YW8yMgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUGy-0000000HLLm-1YyV;
	Wed, 24 Dec 2025 19:11:48 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUGw-0000000HLLO-3S6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:11:47 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64661975669so6088465d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766603505; x=1767208305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXhnYTRKWSBrdTvGbB7qy2q3xu05EvIJIuYEgLdKQ5w=;
        b=MbL68kETZo83UrjVPBcJebi1tj6OlE61CsG6ULjU6+LEkWltuP/3FtvN5yNlndgRu1
         cEYQmnK0A8vRVQSANtb9UKQ2An8fIf4i32wy5B7oZECOVk8jk2pS2jZ0ZiRi9+dxQRnN
         I6hADR6tOO4VzU/KqKXoEJ8ZGyH8ecS9IBj6lMtGvvIre4jCQ7/bmWJ+oyTRc+0txeg9
         rXzHiht26zg23/vp+3xUahpmxx7PlPMVaPXfPOKWXpvOmu4hVh3jjyMdvfEPH5JbnSQw
         G6ripFXCfZkQ6xmm15Zbs6lve347SmZR9tkTiKexOoIYutnk+u4kmPwaKlrycvF/Mtwm
         OACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603505; x=1767208305;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXhnYTRKWSBrdTvGbB7qy2q3xu05EvIJIuYEgLdKQ5w=;
        b=Te+UxcVo7ur/qQ8VrQaNGrjCLq7xQqkm7XDGIkqqS7kV9j28/sLRZExD/xcwHpTwDf
         2dtYquY8iFXC/joEVNb0nN4DyU3LWvyJvG+bwqi9B1rXLK+tJyTHbNzAfDisGRlacZs7
         bKGsrEmqz74UKf2yLMYi7g7R59B6AN0RG8WYxNlbDrqlXtAO2GWgsp7DwPbaHpQyrZYJ
         mnQyMsUxTwcTWK8UTuL48udB3DtKWV+qbCnRSsMLi9fYUnk+ieEwuLqBImiXze7uhwlh
         Fr4gC+5OdimDzyCARTjy2amFuet/c6skRIq3ATto+HIcAtRzlP4IQeq/B2qOKGegftdA
         sipQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHJFswOvURwVkGwstWsaINJKMjjK9vORz+R9aCHZAMu5DH4Bv3AhzH2cj1L14S2HkPOJMKDPArDObIQIE0tAD7@lists.infradead.org
X-Gm-Message-State: AOJu0YyCrP+LnhleZ/iH2YOeIs6Yo+CLOxZuSzAhE1MAtbG/HGSQzYBT
	EmV9OaZXiWhU5G2BSr52juYkOTBhyGSBnmoUBaLX1ujFfSdxtbqOigCCsBLWYwkkOQ==
X-Gm-Gg: AY/fxX7RNDIw1GCOXqnEP1XJp338vJHYCgda2km6SrHseVGYoUusKXb2PBnFlfVJpQ7
	AJ+Zt3z94pE/o/6gCq+NoTaJpQD9DNi4aSSq53joulunmBDJI3/Sio5IW13HcE4vo9ZXurtWi19
	iRZsXTvD1l9OyX5TWWh0Wkfgm5RlhD/gJpeHwq0cbfKuS2pK0HTKo2mUcoZL7tsLSb0MVhqJsUv
	moWnnE18KkH2rZ1Y0NqpH9YuDivRe2gTWA5966ixxsqG1DDTFX4ChbWQI2FoMb02NrY5BI8sAQs
	O8K8yS+NwHxRwZVz5RtXDUIVx0+XovD3uvJHc/KQnQRB2W8tAA5tAWI0I3ivD4RpJAanyWPggyX
	g1MWffYB7rDbDB55znW/jl7bPwCxVKv8Og49wfC+RaATmt90xBFApS3Kzr/B2ajdo+TGCZbkU1D
	lq2dJiGC6wKe9OsM0FgA1SYOoZ2v97ekkHOFjc7phYY5/Jvjxse8HEQ2UIlYI=
X-Google-Smtp-Source: AGHT+IF4+78/ybW8h2aFs9XZbSKza4sj6Czw5R4tW02KVHwiK1CyevWiPabB7l4R0Pz1pzDMvfJfng==
X-Received: by 2002:a05:690e:1486:b0:63f:31f7:b956 with SMTP id 956f58d0204a3-6466a898fbbmr15286144d50.27.1766603505319;
        Wed, 24 Dec 2025 11:11:45 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:6872:f79a:c2ff:4f4f? ([2600:1700:4570:89a0:6872:f79a:c2ff:4f4f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a81d4e4sm8640178d50.0.2025.12.24.11.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 11:11:44 -0800 (PST)
Message-ID: <27d2a9de-487a-409b-8807-d1d3bf9e8ee7@google.com>
Date: Wed, 24 Dec 2025 11:11:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: maxim,max77759: add charger
 child node
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
 <20251218-max77759-charger-v2-1-2b259980a686@google.com>
 <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
 <3d156c45-b55d-4ca4-95d6-0d06e067bbdb@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <3d156c45-b55d-4ca4-95d6-0d06e067bbdb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_111146_874400_1C109D19 
X-CRM114-Status: GOOD (  15.76  )
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


On 12/23/25 5:32 AM, Krzysztof Kozlowski wrote:
> On 19/12/2025 09:17, Krzysztof Kozlowski wrote:
>> On 18/12/2025 23:49, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>
>>> The Maxim MAX77759 MFD includes a charger function. Extend the max77759
>>> binding to include the charger. Also, update the example to include
>>> charger.
>>>
>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> ---
>>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> index 525de9ab3c2b..1cffdf2e5776 100644
>>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> @@ -37,6 +37,30 @@ properties:
>>>    nvmem-0:
>>>      $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>>  
>>> +  charger:
>>> +    type: object
>>> +    description: This is a dual input switch mode battery charger for portable
>>> +      applications. It supports wired and wireless charging and can operate in
>>> +      buck and boost mode.
>>> +
>>
>> I do not see any improvements, so same comment: this should be folded
>> into the parent.
>>
>> Please read DTS 101 slides or writing bindings or any other talks...
>>
> No responses to my emails for a few days,so I assume discussion is done
> and I mark it as changes requested in patchwork.

Yes please. Sorry about the delay.

>
> Best regards,
> Krzysztof

