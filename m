Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F108DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onDwLQJsnBJFPmm1fOiNWOV2V2/OfeEnsevme4QIeyY=; b=PJCjSHZE5P4T8CZfrRVeQ8ddRW
	tc1xMkEjWtMCZwH9KWX0KxuucrfldQctgSM0H17GnO20SuM8MXHVFvepaCPyFxCkhKvqOfDJypnPH
	orU3Cjr2aZ62HOpJbJXpYRyNNro0E7FiiMP+eZ4WZfgSoMxcsMNWfEwOufH5yQDSgiYemWoHE2HU8
	C6JKUCsStgXgVqC7+hS2DnwYKYRY2Uqj9ZBLMiMcevOuBmQktf6zcGx1tBiXwWgDc4flUd/Tyw1JG
	wjS1PhupmTZKt73u786Y6JVFFGnkoOTABFWjS6eBarVFmjQJbZ0m0tuTE34MclSOBRjtkdx0L9Sgf
	eQqUI89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdwp-000000083ZP-1cyk;
	Tue, 14 Jan 2025 10:14:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdvZ-000000083O9-3Y35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:13:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa6b7f3c6edso82191866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849620; x=1737454420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=onDwLQJsnBJFPmm1fOiNWOV2V2/OfeEnsevme4QIeyY=;
        b=kHjuZA04X0nrN6VfEJDtSOD6gRjw5Gp8P372Q2/lj7cnkuUYeAaT085zvBIySSO3w8
         GyqS29oYtSB+zCAEm+B1lfmhcSig81mgGO3xi5+sjs1Sbviy2zpxfzew0o5INcFCOP+d
         +xD7IcuszE0XwmPudbmGEDDuf+w43LT5WujAsJjRTTgfZzVhn25uCUP2z+iTMmSAu7ZH
         1/jPhJgCj/UB9vIuw1boGE76nnfKCva5m/OBmUTYL4YnmcPBKgyslSIW4ZGMwbEy5jWZ
         qf3SPbMW7IAaWcmBFdplwymla7KeJQ9n87GaFjH4ElC6DEyNfXWH84s9uVVMIRBoaa+M
         wbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849620; x=1737454420;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onDwLQJsnBJFPmm1fOiNWOV2V2/OfeEnsevme4QIeyY=;
        b=tGYH8e/WCOHnoA4/xaSKH+Z1uLJwmQiHc6NEwK/zWme4iiJchZZDQrqlDVV+vRKtG0
         gZmoBq3lxMpA4zq+Iuy5cNRMcv/XcQDmyzm2ccrBQzufoJxYWLWlO+aReQGbvL9HNHRR
         2PqjkRa2i0poVSlfG031QYbeXsQnPXge4ZArB0xDYr2CAxeGq2HIs2he1ltEzw1qiNxz
         Bud22LdJohabXIfT78GLqHQNDmx9NMzExnCGOVS1C/CKqGj9hTWEWoxJnixMDkLiG/Fo
         ejCVCWuYm5i5dyfj5HsE2PCQhaMx1t9WTEnQZpM5vb0zn223iWKknCywFuIOfHuSuR4k
         RKTw==
X-Forwarded-Encrypted: i=1; AJvYcCUd9Y+Vc/0AmQSk3nzIot/0OEmju66kZhqUoTDCW4G/7eaSg9LQULaCqCEl9IupCU1QbzT1Njtz3G3q/+mzIoFF@lists.infradead.org
X-Gm-Message-State: AOJu0YxzTt2B2wNgnlABtIkjxVbUDGyDybJgKPlTLvvHSN7kYLk9tAKA
	E1frnBqhOS0Ur9jvUk+/4i/4RIjRQ7Z1w2pXx0duOv+2Q00yDBa5dLIfSR+K7N8=
X-Gm-Gg: ASbGncsWLi8f3o4fUd9OToNWwyLGgRfVaIdm8/CnPVRgGBjjfJlVjcqgYZJODeNcpdS
	k7k3/HnIiw5ycFDoZKsFrlSN/2YGlN96pevQtWeM0rI+IsjhLDtLXXF08dcHhNW+3Aa7lXNU6D4
	s5+xlyofEXeQOQWfQFlbqtKEmGO9C8CgJpn3o9t8CwtVDeppQ14IY8/soh55KPPlh1CbLTlY4Jv
	R6Z4jK0E2qTBEH+wNgq3JxLObS9UudbmfuKopyG7kqu5ZZxBBTsGR9h7uk/zxp8aZFvrXKcWfps
X-Google-Smtp-Source: AGHT+IGgnkpVyamMUhyft+dfggczs/yHwby6IDz6TiynQnKUxT5g12HieH3ic3vi60H6gnSWHwhdkg==
X-Received: by 2002:a17:907:9621:b0:a99:4a35:2400 with SMTP id a640c23a62f3a-ab2ab73bdccmr944668766b.7.1736849620286;
        Tue, 14 Jan 2025 02:13:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95647absm605929966b.118.2025.01.14.02.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 02:13:39 -0800 (PST)
Message-ID: <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
Date: Tue, 14 Jan 2025 11:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to
 json-schema
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
 <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021341_899036_51318BAA 
X-CRM114-Status: GOOD (  14.33  )
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

On 14/01/2025 11:00, Dario Binacchi wrote:
> On Tue, Jan 14, 2025 at 10:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 14/01/2025 10:36, Dario Binacchi wrote:
>>>> Nothing improved here.
>>>
>>> In my humble opinion, there is nothing to improve. Any modification
>>> made causes the tests to fail.
>>>
>>> $ git grep st,stm32f746-rcc arch/
>>> arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =
>>> "st,stm32f746-rcc", "st,stm32-rcc";
>>> arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =
>>> "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
>>>
>>> Or am I missing something?
>>
>> How can I know what you are missing if you do not show the code?
> 
> Sorry, but I still can't understand. I run multiple tests, trying to

You don't understand that I cannot improve your code if I do not see the
code? So let me rephrase: In order to tell what is wrong with some sort
of code, I need to see it. I cannot tell what is wrong with code without
seeing it.

> modify things
> based on what I understood of your suggestions, but the tests failed
> every time.
> 
> Could you kindly provide an example of what you'd like me to do?
Any qcom binding? Any other SoC binding with multiple devices?

Best regards,
Krzysztof

