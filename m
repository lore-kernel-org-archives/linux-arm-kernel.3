Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A800FC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vse37ndJVrSuVrU7yJGVW1Lu8SXvK77ID0V4XIpDEEM=; b=zWQWm6IPsy5cKfaCKLpDBrWASX
	ut6LXaUczAf2GH5VJYKPsQJvIizXujW6p78yXEj8iJtmHtNeVoecicD1dwrSM7sparh1X4JL/xDOQ
	5ryaDaMLUMDQ0j6gx2r4rUum3nA03RQqojWy1HH2pTh4mbYow1odhJjDKqD0KtrhZFFbnk12QdHwP
	ltk7xyQFocvppsGgfXVTZBediE5EkdDm7TFheb3ZSC850O2rUcLYn7vKq/tvb9+7pQVR+1PIXD9Tb
	z+GvyAthbIZWLbBoInIE2lW18TRqwZBKFAh9wgH1BPD/Xs/3UFsKDkKmX1DvjgqH3DtgUeuuSkdPW
	j2hRoP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbQe-0000000F2XJ-2n0U;
	Fri, 07 Mar 2025 17:24:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbP1-0000000F2Qh-0v7y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:22:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abec8b750ebso359424666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741368145; x=1741972945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vse37ndJVrSuVrU7yJGVW1Lu8SXvK77ID0V4XIpDEEM=;
        b=pa6XOWSnWVaH9To7XifJZ2WuCW3SPzRx0wif/5vD9vZyg17yhll/RHhr2llcB9kRMf
         lOg99CRg18sZA1lLzQNbqYZ9edXJ8ydBtHN60fbkqQj5pHW4QFKm5KRAGlvKxh2NpUG/
         2qp+ll/0cPXjf2j19OWGlseSVtRoNfU19loYInSm7sJ/CRnOjUERIfHWS1lSc9RwNPlH
         omZTteU4aa8irc9VgRuxWPdPNQIQLJeSG+4E5aHFxGAnGqlU+SwTAnsOTtBVuu1211f5
         J8D7zyZGF+qVWsnsXUWjIAh3qXwBvKJcd8Wffpj9K4bP1ZgoijQ73vY17mbDLWzyi69U
         BxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741368145; x=1741972945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vse37ndJVrSuVrU7yJGVW1Lu8SXvK77ID0V4XIpDEEM=;
        b=VTghbWMAbFSzyoNEUtcZvmjL7uPBgATyppYhKpKdwaCxQ+6/qxRZbZTtCC3qXIUEOh
         wqKF/3N/H0MFHaan4debgKH2Y+s5Gk/8mqI8GeEkMZEd457gz6u83Ky7Np3Otw8urqva
         dSivPK+dWYIPKLa/m+7FHtM+VgPvTIBHinnkRj7P5enpf6suDRU16Oc0BQidxno4v+0k
         1Pmz84zfP/safMIuPj8lUDuNf53StjZ/R+3sbRbWFbXiLKhbQrxuMJ2dpYhoUQPAt/vG
         kvRxwjWXJpAEd3JZXb7JP02jPbKVEepSfiVoPoy89VkmItIiwnMrY20UUPjeuJjrTmcM
         WsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3PV+O4yrH/LcciD+QDsvWnE83Ropc3yPtfdb0s3Br6fJpt1lsvEvYTViPJeHGOfxsd1OOPCXicDYDRG4ITdx@lists.infradead.org
X-Gm-Message-State: AOJu0YyagnaH4WSVFrmBUouJGm1ZCvNPrXNC85nBMjfNmURhmspJlY8/
	iNXFrdoQju/EkmWmTcuaHsAwKOg9jXEW4sYEPwfbqpOgZtnGfrfDvEdmF/oUfIg=
X-Gm-Gg: ASbGncsz/ribRRMafaNzom5WqYONgK+CZ1dvbzLeLJhZCMzIsrw1R5tKX7atsV/7Wwr
	w9RrUpKLjq9z6sEO+nRCtLMRkUbegKksuk6NjPQnR5CzDpJAIreEf8BMrhJDmqr24iP7YpIiazV
	sS7h7h8/E2miqM78+rdNC1OSFmaIxsPjI0E0q/6PBKOwE0MDI9X4xl02niMj3KPnMndn65o+W+V
	b84JlyBcyNW9sRQ6+g4bCtYV6xXg/skBLgWRGKH3JDN/WrybAP11QJu/B+0M4nOARK7VoC5Zgwx
	/Yrydimz5Y3wFwH40+h90X0Us459uhR63aLKQKQYv+idNm9+oyYwnF7St0DCW+Q=
X-Google-Smtp-Source: AGHT+IGr645XsGNFfy2D7vw+gO6HKk73sp4lP/e3Bd4vMO2M4emrS5p1ZDikAS21V2w6uEA4dxu5ag==
X-Received: by 2002:a17:907:94ce:b0:ac1:e1e1:1f37 with SMTP id a640c23a62f3a-ac25273af3dmr535156566b.10.1741368145070;
        Fri, 07 Mar 2025 09:22:25 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac2395174c8sm300319266b.85.2025.03.07.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 09:22:24 -0800 (PST)
Message-ID: <f662da0e-431f-4e04-b8ee-e8b04a08337d@linaro.org>
Date: Fri, 7 Mar 2025 17:22:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: rockchip,otp: Add support for
 rk3562 and rk3568
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250227110804.2342976-1-kever.yang@rock-chips.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250227110804.2342976-1-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_092227_271930_CAEA81F5 
X-CRM114-Status: GOOD (  15.16  )
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

Hi Kever,


On 27/02/2025 11:08, Kever Yang wrote:
> Add compatible entry for the otp controller in rk3562 and rk3568, add schema
> for different clock names for new entry.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Am unable to apply this patch, Could you rebase it on top of linux-next 
or 
https://web.git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next


--srini

> 
> Changes in v2:
> - Update the commit message and add maxItems in schema.
> 
>   .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
>   1 file changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> index a44d44b32809..7572f4a1d73b 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> @@ -14,6 +14,8 @@ properties:
>       enum:
>         - rockchip,px30-otp
>         - rockchip,rk3308-otp
> +      - rockchip,rk3562-otp
> +      - rockchip,rk3568-otp
>         - rockchip,rk3588-otp
>   
>     reg:
> @@ -25,19 +27,15 @@ properties:
>   
>     clock-names:
>       minItems: 3
> -    items:
> -      - const: otp
> -      - const: apb_pclk
> -      - const: phy
> -      - const: arb
> +    maxItems: 4
>   
>     resets:
>       minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>   
>     reset-names:
>       minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>   
>   required:
>     - compatible
> @@ -62,12 +60,45 @@ allOf:
>         properties:
>           clocks:
>             maxItems: 3
> +        clock-names:
> +          items:
> +            - const: otp
> +            - const: apb_pclk
> +            - const: phy
>           resets:
>             maxItems: 1
>           reset-names:
>             items:
>               - const: phy
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3562-otp
> +              - rockchip,rk3568-otp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: usr
> +            - const: sbpi
> +            - const: apb_pclk
> +            - const: phy
> +        resets:
> +          minItems: 4
> +          maxItems: 4
> +        reset-names:
> +          items:
> +            - const: usr
> +            - const: sbpi
> +            - const: apb
> +            - const: phy
> +
>     - if:
>         properties:
>           compatible:
> @@ -78,8 +109,16 @@ allOf:
>         properties:
>           clocks:
>             minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: otp
> +            - const: apb_pclk
> +            - const: phy
> +            - const: arb
>           resets:
>             minItems: 3
> +          maxItems: 3
>           reset-names:
>             items:
>               - const: otp

