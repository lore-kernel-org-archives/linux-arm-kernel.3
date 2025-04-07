Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0246C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=; b=qZV3DU6dqZgWKzIbR/fvvLtl/B
	CaOnBZ3Eti5oaqHLLCaRG49mh5VwRRPTa6nfb71jma0Hb+Ix6za0hZukN9eehm6lyH90et1oAiovZ
	BNw3I8ox96FjiHnbWJxqo1YcDgo77hPw6tDJw+UDsS/l0G0rbhUmuoLYf5eNiEJyqgHtQlc6lcshB
	Nm0MdNLLFD4Xgm7zmKdfy40W/GoWJuE/f8tenK1q49OZ4TwRe7yDAdQBkoObuTW5fHgEEOXUQM/Kc
	AYFeh0lAEHlD3ObJj2EATINRCqEellCcpnH9sx+NiZky+gTFK0xb89tjQwMcfJDKN68zcfT4Bbu67
	ZrJmAG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hMt-0000000GtpN-0V4R;
	Mon, 07 Apr 2025 07:58:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1h3P-0000000GoDq-1Eaw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:38:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so35117755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744011477; x=1744616277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
        b=EuoZS5ZL5ZBUZJWPbxLaZmEkFRV89M5ioQwXSG/f41Vgb84pusKZsZnr+rmBJz39A3
         nnIYcoyMShP5pkTR2PV2H+EFjDDECEyQrQ/84Koz009UbMA9O6rD8yrDRU6puWXKsjso
         4SoqYSanur6o4Ttl/6kFJ10Wi5o+4tFUfIADJeJvdwit8kI31WhGOoyV532HPVxRvipw
         g8OsrvHYGRR72QhR9inr+hlnr9tfq1G5/+YPPTPdN09HVkCT9+8NBygmsmM8yLgDx2l8
         Nlbe2NgGb5jRymRoFIb3/3P3orjQbpwl3cutp3zGmmmg7ayhoo/3CakOHtsv2xP5X1D4
         gYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011477; x=1744616277;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
        b=dabCllwENZ3i4uH1FFJbk3ojI0xGn1Znhl7LUH9kP/fixvWHyGzWsS+PDn7zQv/EOS
         +QOu6pktSi+c3vYiwtUSSr1QLF3lYlGwZPkqIqm7YV9bIXKohfVaPPvZT04dbT0rc1Ng
         rJ5vJVB3NOGftnFhjb0i+maEiwfscXo8nkUbCrcsf4tf6J2DJqZdsL3T8xjzZ4R5sZH5
         0NtK650O+Q95RVNJcu8rgJKAr9xKrFiJcc1byeqVQTm70ocP1ZqPNEvGdwDsTL/xQzU/
         2wi83DjgULW2SF7BZFonFt/KF75SXAGBRmCZRjJFKzKrPh+j6ycSYzJZc5MQ28o7hd4d
         MiaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcl1GCEwdj0fWdIR5giOA9XVowf/DWvhJkkZ1Rnjmee1BGDL21XQ/JurOKnAZShwN810ebmx0WCxJivSqow3ae@lists.infradead.org
X-Gm-Message-State: AOJu0Ywts8/ku6UBzMPE/85WTKlXH/bh6mog5drWoMscvXuGX57qBfSq
	7R9CLk7ivftG3pF7QYTuB3F046vGfKdKdIerZF1cPtycOP2uLGctJm5IIrAOVWI=
X-Gm-Gg: ASbGnctdbpJCoGPbquN7qjA6GDC/1ga4FeyKe+mnwDd5w+GGBKw5MVv5eb/iBiin4D0
	VkI/9TPSuX4VRhZ6M4wukbB3LZgp5XJyJdsy1GDN0+khZTlskRgKEL35/yet/usWxo/yg6d09+9
	6PZrpZnavBwp/SwM06iVLRoH2CdTXcvTwm2UdTatU8qLaJBGj2Bri5F6dYcOzAdqIbZv16NwnTu
	4IqnxB9gTzecZmR5arGUUMJYdUd7Ca3h0xAUz1OQvIQsFNlsaKOolRv7bXbcj49BAXX5zDi97j/
	xeD+2AFRC82gkQ6GDCO1zdTufG7UECImJiNMJlwOUMipk7xlcvrPglWqm9LYljXakxm+Y0CfW98
	ymCSXG2pe
X-Google-Smtp-Source: AGHT+IEDc/bRsFcizrk4e4TwMWtU8c1AL1TwXJ0IcJRIR1rjn42XqoKfWILEntbQHzwjOQZAQgc+Vg==
X-Received: by 2002:a05:600c:1e27:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43ee0615d04mr74241945e9.4.1744011477415;
        Mon, 07 Apr 2025 00:37:57 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec1692ba4sm123138995e9.16.2025.04.07.00.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 00:37:56 -0700 (PDT)
Message-ID: <c14389a1-1904-450f-98c5-a55351518ed7@linaro.org>
Date: Mon, 7 Apr 2025 09:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: Add NXP System Timer Module
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
 <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Content-Language: en-US
In-Reply-To: <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_003759_336264_D8C9E50E 
X-CRM114-Status: GOOD (  14.91  )
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

On 03/04/2025 17:21, Daniel Lezcano wrote:
> On 03/04/2025 08:33, Ghennadi Procopciuc wrote:
>> On 4/2/2025 12:07 PM, Daniel Lezcano wrote:
>> [ ... ]
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    timer@4011c000 {
>>> +        compatible = "nxp,s32g2-stm";
>>> +        reg = <0x4011c000 0x3000>;
>>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&clks 0x3b>;
>>> +    };
>>
>> The S32G reference manual specifies two clocks for the STM module: one
>> for the registers and another for the counter itself. Shouldn't both
>> clocks be represented in the bindings?
> 
> AFAICS, there are two clocks as described in the documentation for the 
> s32g2 page 843, section 23.7.3 Timer modules.
> 
> The module and the register clock are fed by the XBAR_DIV3_CLK which is 
> an system clock always-on.
> 
> page 1994, 40.5.4 Clocking, the documentation says: "This module has no 
> clocking considerations."
> 
>  From my understanding, we should not describe the XBAR_DIV3_CLK as it 
> is a system clock.

Can you clarify for the STM if you still want to change the binding ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

