Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB50E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=; b=rNKJzP3pAcFkFthFa9emuoxoek
	L3JJlCjyuIxduBI38TIQA+KmGFgofinuVRgWExSamxHcruxVxd/zmiB6Wf8ykjd7UtSmGMETq0CEW
	VmVdk5r6fmznhOMekYH/cuwav5iIMpY1Q7JupBGyOFUxdSJDlr+xw74c2ueB5sbV54FtzOhKNjlsv
	TOVXWkMGHy4w6PwBzwrsCkLrXTskHQPHbo7a50JFj+1K41RMJm85RQWpBkxiVhOJ++TWFk2RUGRoh
	2rTUjapMnZuIBxz/VQ12SCGH1lf33YD0GvXGA86QAXy6x9oriy+uj7VVy9bmQMe3SAKjp+g+mUxF6
	6KvYerhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7pc-0000000Cp3W-2th9;
	Tue, 10 Dec 2024 21:31:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7mQ-0000000CoIQ-028G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 21:28:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so7684175a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733866108; x=1734470908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=;
        b=PUK6FZaG9LyUUD3ZjSkYbxcYKBpEiXObVB4kQX2kYB5C/pCLo+ao+1cBIZHqdc+QYw
         8XHhQ4jVdOv/N/4s8dX/pGg6vPpid7n1v1MGjUeWRbXyaX3vP3z/pAeTaQ5PSopheop8
         BuiEf5AZThIdAM4dmChe/TPEFyaK6vyO1YGxhxItkTWrIsFi2d2qyhEguSwwbmiG2dVQ
         4LZ6va78D2SX/uOhG8SmeExDwzMYf9GzavZJ2FH1mpxUQto5o3CB+ers1uHj24ivl87q
         njhVQE+5cpSIv9dIIWNklQGpF5UtB39LTQuvHNuOTBskoNMXvHC0ltkqB0Rn4A5nzo06
         Rg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733866108; x=1734470908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=;
        b=b/OdsykY++iV84uPiojwtiJoc/nqwxbN9cOU2uPSTokXetAoD2sXzrNVYzvX81bIEt
         Ay1AH4DRRBOZvULDJEEgjgiSdiXsFQ9PPxjjrF/kUWJso1/1VxKwzypIFQ+UoqW5K8ax
         58B5xtgXRzK1Dwp3g+fWBKSiVPI5XvN4pu5NS5w/otBjVubWe446+Yhs3d7IUoYZbweJ
         6hM3kv7rlLQyYT/bnW2Tih2R745PHl1OCH3/s0CtRj9hbkOgdPA/fIuC5PFPM3FsQ38s
         O+BVroQCPBuZmD6Xd3RRmRgd45vW2Rma6B+j5METWRzf4J3Jpv0IkaFfQjL0ViDj0Rfo
         m3RA==
X-Forwarded-Encrypted: i=1; AJvYcCVlATXk7SXzsK7khuXsJ0sa9y3QIehjNsvea0PDIFGHgMr4oXRWEcIrpjZ0zILM9popeUh/Mskm0qoOt3mB5a2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzfeKj9ZsPt7AdMxKmBeQjlrQvIHSQZsoszN6bnYvqc4SAJ8CEQ
	Mcw9+nUBbm4ovGjqEfJgBW3PKOcBkPIFF5CKiWdKGbt8mNzOU/tH
X-Gm-Gg: ASbGncvde77bOjjVQXcMSY5Y6r1mE8n30XY29nVBUpK12UArNzvFV7N3Ya3b8sVt9AZ
	uqAJQu1A2C9QyPnqx/1NiL2W+BNsSfe2tqF1bfMoptOmbGH7fDtBOrkzLjstNv3UUIyPVeHgJOT
	5aj2qeeEqVxNcxYWqqfQOqibjooGwCs7jZY5L8TjTXnIpCaBGg/cFoyM0tk2VQxzNLNadw39tGc
	xqd8Dtxb+Ovngencrdm0gr9FYxG9AzH7nUEEOpT5fo/GEvOCdqfbmiwK7sacm7Nv1wK5DTzOms9
	7Tjpwl+OuN0PPpIiMIGraL2I/9LnUSrz
X-Google-Smtp-Source: AGHT+IF2lPlG/TM42607y3WI0CId/jCN4zyRMixPec0/CK3oZtt3mBHJ2MfDv98RJm/SF+OlckHE/g==
X-Received: by 2002:a17:906:1ba2:b0:aa6:63e2:535c with SMTP id a640c23a62f3a-aa6b11e7f6emr30829066b.28.1733866107775;
        Tue, 10 Dec 2024 13:28:27 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa695e45fe1sm286058866b.32.2024.12.10.13.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 13:28:27 -0800 (PST)
Message-ID: <e5a847f7-5e63-4860-8b4a-dfa378989c57@gmail.com>
Date: Tue, 10 Dec 2024 23:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and
 syscon-reboot nodes
Content-Language: en-US
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
 <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
 <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_132830_043373_8F3F0C65 
X-CRM114-Status: GOOD (  16.21  )
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

On 12/10/24 23:10, Markuss Broks wrote:
> Hi,
>
> On 12/10/24 8:02 PM, Ivaylo Ivanov wrote:
>> For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
>> of SWRESET register(PMU + 0x400) and power-off is handled by setting
>> bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).
>>
>> Tested using "reboot" and "poweroff -p" commands.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> index 90b318b2f..9eb89dd19 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> @@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
>>               compatible = "samsung,exynos8895-pmu",
>>                        "samsung,exynos7-pmu", "syscon";
>>               reg = <0x16480000 0x10000>;
>> +
>> +            poweroff: syscon-poweroff {
>> +                compatible = "syscon-poweroff";
>> +                regmap = <&pmu_system_controller>;
>> +                offset = <0x330c>; /* PS_HOLD_CONTROL */
>> +                mask = <0x100>; /* reset value */
>> +            };
>> +
>> +            reboot: syscon-reboot {
>> +                compatible = "syscon-reboot";
>> +                regmap = <&pmu_system_controller>;
>> +                offset = <0x400>; /* SWRESET */
>> +                mask = <0x1>; /* SWRESET_SYSTEM */
>> +                value = <0x1>; /* reset value */
>> +            };
>>           };
> Aren't those already included with arm/samsung/exynos-syscon-restart.dtsi? I can see that the values for poweroff are different here though, does it not work with the value from exynos-syscon-restart?

Riiight... seems like I've completely omitted that during testing.
Although the poweroff mask should be different, it's meant to set
BIT 8. I'll check it tomorrow and send a v2.

Thanks!
Best regards, Ivo.

>>             pinctrl_alive: pinctrl@164b0000 {
>
>
> - Markuss
>


