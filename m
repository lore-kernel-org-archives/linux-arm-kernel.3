Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D02C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARa48UJeOnruk4y6hfaItaqVnAuMM94e4bCCTCC0nD8=; b=AWE/8xUlyZjWpCNozjPMElRxf1
	b6esKFdbbi+kdm6k8HSztKe3F17xywXwO7mEwnhT8ixGHH7RZFTnjWf8s/Hmce6QAXKeQjuZGcqJA
	COxazcUQNrKevSuj5I0zgnZFS5NOcYhztvTMd56Cy3ZjxFw8IqI4NfA0wrXOaYG3wx/vSAnhq6dRi
	A67ZEA7/StHCBYYR0MptStUbBEGfki0ZD7tfNqu45m3MgOzqbiKXm7jpf2oa9UMAR/y/esH9MUWGC
	+7aeZjSreI4oTGrxNOT4fhAlSRW/t+lvGPVoYLEcKn6iPW5n9evnHm80C+ArWei77p7u0JBO9fTtv
	k58YgwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6ph-0000000EXKR-2xOH;
	Fri, 14 Mar 2025 15:20:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6mg-0000000EWxy-3RiV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:17:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so3952938a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741965434; x=1742570234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ARa48UJeOnruk4y6hfaItaqVnAuMM94e4bCCTCC0nD8=;
        b=XBjoIOjUrdM/jgUkFiG4FDqY1Jr41gW45st5g01IBrJSs/JXeQj4r2eNCvdDTwV52Z
         uG2B4r6Z0436rup0jhzAztoNSNZa9Q1QfCYbYw1j4EVuws+6i5ihW2oB7A+3oeigqxN/
         y7a5j7T6YDlPWk5/bHlClajdKSeD2Z9FTGh54AUYdy3mGg1ncYoo+TgjXCyumuk0f+TF
         UPG74xXj4eby056TvotELZe0tCexTVD8rujqQXMpuxbgCPIEFpowWqWMRn7VAgFXcixo
         NL7ReMpEVrKlx8ywFGSIsnDnSy+9o0HtmA3eV6aP/+f/hFS53culj8yVqHZi0uRa5nxT
         ePJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741965434; x=1742570234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARa48UJeOnruk4y6hfaItaqVnAuMM94e4bCCTCC0nD8=;
        b=GnRWoir+UjAHPLiYLMINAsw49Ll6TlYST08X+BtM82JVNH6LT/J21G2rU6mqXntl2t
         a5KJ7ij+6rT2plJDMpvMJ162L6nsqONMG1Z+RNemV8bPIoi2+ww/ilFK1plkJA1Cofmr
         Q92Ev7sWHdIKab3JY3Ng34xG84QMrye/Ax3TLCSym4wsn8CpemgPEQG2TacuLhndX24L
         jXs9fIutETlDqLdAB098IiewNQwwmkgYhC9/Qt0ePHZ2OlgYByOg05vBkgU2Ws5I29wy
         2/Y0bSft8kKhhPZs7PI5eEEHRMeJJ5ZfB4/tPyhqqwF/s7tiFUHzYg4JviNwf37RcG1x
         pRmw==
X-Forwarded-Encrypted: i=1; AJvYcCXaDJlBhKgBiP2SBEiQel/Rl24yFurvjq6d8HIajTPEbpx5FIDkzvJ2tgZaHoIPKCC3+7S9cUKOWVZWCpbtnV4c@lists.infradead.org
X-Gm-Message-State: AOJu0YyAC6+89ycxqfvM7yJCWiZ8MxEAQN43psbFE1ArQT87qWup8M+5
	2UbWeDvMBZFH1HeqLhOZEx4MI/akSMIPOAfSNGp/lY131S1ZGrBE
X-Gm-Gg: ASbGncu4K8llmIBLIVNv99lJ/3aZmWUM+WtE62hAC8XWSuBlL6AJ7/pre4cN4IAnZgf
	RJhMVJEUxG4baZ60WTepfJTBa54SkMEg++A+nm8ZR4DvghHB49kWC6sBRCGpYmQGHf30CDmaiM/
	+EsKbPRZAgNGkxMUFkSRjXY4BIC1ivG6AeJmPqr3eJgsOSRYsskIswzZPSijF0Sp3soM40CGxMF
	z6WrkefaKQ8KFhvTNZRr3W22FmWioiN0TmSgZv53JjpDcjNv2dClNVWK4L46nxPVkWu4Han3jUn
	Sc/aNrTVR8dcbHrEK+7wevxnZQpbcRfYE8g7zx1GCsLQaBb8I6EXznaS2acCTTxQh2tBM4iRtQT
	0lG5/lo+lw8h7GEuMfQ==
X-Google-Smtp-Source: AGHT+IG2jRdPaGI0FWtVKjiiomdk6D9DJZF/EZKSpoKP8xh69ls7UwRCiGvxWs2pkQtYbrkW+pYPKg==
X-Received: by 2002:a17:90b:5608:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-30151d9d704mr3737985a91.28.1741965433831;
        Fri, 14 Mar 2025 08:17:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539ed283sm1234279a91.18.2025.03.14.08.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 08:17:13 -0700 (PDT)
Message-ID: <c3d438aa-504f-4d13-909e-ed9be0394b75@roeck-us.net>
Date: Fri, 14 Mar 2025 08:17:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: "Florin Leotescu (OSS)" <florin.leotescu@oss.nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Viorel Suman <viorel.suman@nxp.com>, Carlos Song <carlos.song@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "festevam@gmail.com" <festevam@gmail.com>,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20250313125746.2901904-1-florin.leotescu@oss.nxp.com>
 <20250313125746.2901904-2-florin.leotescu@oss.nxp.com>
 <20250314-encouraging-fabulous-ant-e1f7b0@krzk-bin>
 <DU7PR04MB11163B2B2D8D429B2667DAA65FFD22@DU7PR04MB11163.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <DU7PR04MB11163B2B2D8D429B2667DAA65FFD22@DU7PR04MB11163.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_081714_892398_8DD25AED 
X-CRM114-Status: GOOD (  19.27  )
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

On 3/14/25 08:02, Florin Leotescu (OSS) wrote:
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  '#pwm-cells':
>>> +    const: 2
>>> +
>>> +patternProperties:
>>> +  "^fan@[0-4]$":
>>
>> Keep consistent quotes, either ' or "
>>
> 
> Thank you! I will correct that.
> 
>>> +    $ref: fan-common.yaml#
>>> +    unevaluatedProperties: false
>>> +    properties:
>>> +      reg:
>>> +        description:
>>> +          The fan number.
>>> +
>>> +    required:
>>> +      - reg
>>> +      - pwms
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        fan_controller: fan-controller@2f {
>>> +            compatible = "microchip,emc2305";
>>> +            reg = <0x2f>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            #pwm-cells = <2>;
>>> +
>>> +            fan@0 {
>>> +                #cooling-cells = <2>;
>>> +                reg = <0x0>;
>>
>> Please follow DTS coding style, so reg is here the first property.
>>
> 
> Ok, I will correct it. Thanks!
> 
>>> +                pwms = <&fan_controller 1 1>;
>>
>> It's the same PWM for all fans? So isn't it basically one fan? How do you exactly control them independently, if the same PWM channel is used?
>>
> 
> It is the same PWM controller, but each fan has a different PWM channel. According to datasheet, the EMC2305 could control up to five programmable fan control circuits.
> The driver will parse all fan child nodes during probe and use reg to differentiate the channels, similar as it is done on max6639 hwmon driver.
> The 'pwms' arguments in the example are used to select the polarity and pwm output, which will be parsed in the driver to generate the bits for the registers used to select pwm output and pwm polarity.
> (... <&fan_controller [pwm_polarity] [pwm_output]> ...).  Now, I realized that I should use: <&fan_controller [pwm_channel] [pwm_frequency] [pwm_polarity] [pwm_output]>. I will also document the arguments in #pwm-cells description.
> Thanks!
> 

Please also document that the channel assignment is fixed. Technically it
doesn't even make sense to specify the pwm channel (it is fixed and
matches "reg"). I don't know if the channel number can be omitted from pwms.
All you really need is polarity, frequency, and output type.

I am not really sure what to do if the channel number is mandatory.
If it is, I'd suggest to document it as mandated but not needed/used,
and then ignore it in the code.

Thanks,
Guenter


