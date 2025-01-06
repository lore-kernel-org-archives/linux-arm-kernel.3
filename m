Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D2CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuunkLgNDniHW9DBqAePlIoV8lCR704mAeFac1bTM1o=; b=1ETV/ahdlKu1xD19S2a7a9Lz9K
	tyZTjRVOsJlYJBCq5rXq5/jkQuNCjz13YCdjZTumfd5X5c5PdTJ/Rl21+4B7w22nOfHOr4aqM4ITq
	LcGcvh+fTEXIGs1XCB5zYTeHNie2TD8uaPGbxTIdPaqDHWB0UXZgH7H4Pq7+TpbkozWGt1+ekSScT
	qz4cCMc6Re5HDnquOBZ9HUW5CIC8kC9wycmh72Sl7lv/7ETOo81comAMTXNndxYDeQVW3Yjc0i+hB
	31YNGiSTLQdqJYf0XW8qBwOZg7bnJry/VM9HyM2Kdn1ISFYOQuZL6thasCPw2iIREQW8mhkdmC9JI
	nIkjus2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhHv-00000000N60-3P7U;
	Mon, 06 Jan 2025 07:12:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhGi-00000000Mph-36UA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:11:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso24761014a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147479; x=1736752279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuunkLgNDniHW9DBqAePlIoV8lCR704mAeFac1bTM1o=;
        b=Cm+u/oLnm7LCkPZfCEAqsRkg5Yc7XvayK9qYW32h7vusPlMDQv+2OPkhUmljE0WI29
         mc0jxurorkdWZk6Zmi5Cu/KysddI8YRwK5BPXbowpF7h3l9qmoZj4uw2TgaJuILOWVnb
         VEpGsggQYUYqQY3X9h8XH+REvQ8HxTpSp8Ju0UcpwlpjrmWHDP8sL+L22WrOMpZOFFJd
         bykkEzqLMKVNiufmNI5loH4RQCF57NgS5Tpy0XfjxBYmoTjkaFde/Sm3FP3zPlnOJLIC
         HG1+VJCfRL/+fDB7wDLm4dnLC1fQMUJQuarAYl3i3oADSd2SzBlweTrtSNVpIGbYg2Js
         jliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147479; x=1736752279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuunkLgNDniHW9DBqAePlIoV8lCR704mAeFac1bTM1o=;
        b=fHJC9Ft5F/tImeqycoaLahAg3MM8I4/Igju2tOFCHQ4AHWEl8KY97pH0vG9fzeOGhD
         SH3/NFVZovhDDhXSvqgflL5UkKucD16K5w0Ug+gBRjBKjiVsoTSoX0WtFYlv4BTjKBlg
         pZaxBwm5DoiUA6zVH//hVshNqx2OtVxFknWBZVKfltITGKBvyIUT8d3CcBlCdj+M+/WK
         0L1GSoNGi3MVZTMWm7bB9AjEZWOnI2tN43lGJhzjo78N3SCfY2nLmXwYFUdAN7KzHPNs
         A1cgH8C9TgDdrwzCPtiWLQEb9fGP618weOtIjyXd41T//xQiT/1J0txlr6335WuvjPBV
         pVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfMUP0GB+G6xDoH0gEBk+NKBecwjsOiNyj+ENLauj9uGeWVBlJiO9CSE9Ibmw6+e4HbIztD5z35dglJyDQpFEu@lists.infradead.org
X-Gm-Message-State: AOJu0Yya/nvaVzimC1lKDwBJTI1K72Ko96GQQSs1pqzCHEUk3cZFUKXa
	woeggM93CfA/V9B4vpQpvIPeQJlMis4BTKW0vBUlEaKFyVmXuUCJ
X-Gm-Gg: ASbGncuKbZkAkHv4bo3UrnANbYJEee92g+HdlYx32t00rtjJUmYXWYH6hu2O7FcOZZI
	2PF/dAyuvgH9SdM3F7Fs8HnpOH5JiJt1tiZ4X6V4nJm9+3ub3FNzlRyeFSmqCxya4zTRAL2g8d5
	EaZaCf6Z6ij44A8ZRTABJ4UK1VqynN1qCy7NatKU+51HI8g1E2y3xLr9GpRwWiqprYJ2gLX5p5x
	FgWg7n6MwEe7mBLR6+i1SAHaJd70MPqQvMvNwp4y/r7GQjKYPSLe0atVJmIaOQFm8gCb/Y=
X-Google-Smtp-Source: AGHT+IHbLwTDEHotcATlgP44Sg5PEzz1pnmxD3cstjHbts1E6mnuJeL7yroJC8Ey7jKFcDtZXcBLxw==
X-Received: by 2002:a17:907:3f22:b0:a9a:9df:5580 with SMTP id a640c23a62f3a-aac2b0a3f82mr5416462966b.19.1736147478739;
        Sun, 05 Jan 2025 23:11:18 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159b8sm2222577066b.157.2025.01.05.23.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:11:18 -0800 (PST)
Message-ID: <39e29fe1-ae45-47e6-950e-536d56cf1905@gmail.com>
Date: Mon, 6 Jan 2025 09:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
 <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_231120_781580_58C7FFA2 
X-CRM114-Status: GOOD (  14.75  )
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

On 1/6/25 08:31, Krzysztof Kozlowski wrote:
> On Sun, Jan 05, 2025 at 06:03:44PM +0200, Ivaylo Ivanov wrote:
>>    samsung,mode:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [0, 1, 2, 3]
>> +    enum: [0, 1, 2, 3, 4, 5, 6]
>>      description:
>>        Selects USI function (which serial protocol to use). Refer to
>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>> @@ -101,37 +111,62 @@ required:
>>    - samsung,sysreg
>>    - samsung,mode
>>  
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        enum:
>> -          - samsung,exynos850-usi
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - google,gs101-usi
>> +              - samsung,exynos850-usi
>> +              - samsung,exynosautov9-usi
>> +              - samsung,exynosautov920-usi
> I made mistake during last review - the binding had a confusing "else"
> here, but that else was a no-op. All existing compatibles are fallbacked
> to samsung,exynos850-usi, so previous code "contains: enum:
> samsung,exynos850-usi" was covering everything.
>
> You can drop other variants and keep the original samsung,exynos850-usi
> only.

Yeah I thought so too. It's fine, will fix in the next revision.

>
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        clocks:
>> +          items:
>> +            - description: Bus (APB) clock
>> +            - description: Operating clock for UART/SPI/I2C protocol
>> +
>> +        clock-names:
>> +          maxItems: 2
>> +
>> +        samsung,mode:
>> +          enum: [0, 1, 2, 3]
>> +
>> +      required:
>> +        - reg
>> +        - clocks
>> +        - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos8895-usi
> I don't see where this compatible is documented.

Right, ommited that. Yet dtbs_check W=1 still didn't catch that.

Thanks for the feedback!

Best regards,
Ivaylo

>
>> +
>> +    then:
>> +      properties:
>> +        reg: false
>> +
>> +        clocks:
>> +          items:
>> +            - description: Bus (APB) clock
>> +            - description: Operating clock for UART/SPI protocol
> Best regards,
> Krzysztof
>


