Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F16AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQRfyzai7ZWY+ER9WAmrVRipd4P7HvZq4QOb0oXkcEo=; b=0CW4bZqksTPD3P0nGt+ih8SEpL
	DzTeph5hGbsiIlh11sSTMUUpDmyOOHji38/a1XyPAllrSi+MxBbnOpKtwfnrRVvl2OWLB/tHRJDDt
	opxebEbMLp9tGZ6mggy7vMKxX2+Om50ge4H5E6GXBtgjgUFrONWgJ/tryf4vhKyQwAwGtIijKYMcO
	p2vr6bjDdSxsion8wZK/4bajCGIMoCPTQtrP6UQhJE+izvaKnody4gOirZv1JqFbkCG6e4Fqnh5bz
	gU7am77NYeQr91QJNQmRPBqXMDiaFUBRw13L+VIYCewM/NfpuMMClNJBadJw05wKPCgS/1dsJLmki
	GJqPy6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujylX-00000000N8A-3pWQ;
	Thu, 07 Aug 2025 11:26:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyLr-00000000JW1-3GdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:00:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-af9176e6134so14313266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564402; x=1755169202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pQRfyzai7ZWY+ER9WAmrVRipd4P7HvZq4QOb0oXkcEo=;
        b=rbc60DDYhOetYNfVKsfnhLqQPmaASy9thkSYH4PglCwxfu0L/yBkzGaxcXbOfHMGGP
         YxNj/40vqjP5iiyIfTEkqHTo9mqmoy9T2DTFG0BQzMVmsmwLU8YN11Od4s9wa2Q1riDp
         fsI5BT70G4A+9thSpLUIwlgOlk5+gHukzQ0nndyFxirdIh07Bj9LTV+E/0Q3VdsPGarX
         VeZJyuQ2GP5GG8pFmrlehAGC7FGdkJC9i5YIqX2nHnB4iW1byEwG9bWYxQHskDZ2xNO9
         WBdcevtp+a7aanS9+SdidbBLgWMOUvSfLTWwa/vCHn5ElVN2OQjZ+tWWWp4P8N7crlBC
         1Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564402; x=1755169202;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQRfyzai7ZWY+ER9WAmrVRipd4P7HvZq4QOb0oXkcEo=;
        b=v0Nh6NMJ2tXS+RX0vxL3OaJ+yIuj2a1njxrvUWYqOCKTsJCMU/KJhZB0dEhl4u2CKM
         RJbEvnzCzQQaHT56fWCqMihHSZDiGSVmYP/VyT9JXZjkAGlrONFti5emnPuEntk2MyCG
         5fZSfHhdDvWPnmcP+YC9HrkY8OyTpLWYJzuk+T2ratP6NqYFDw16LjtTV4Di6ws8o26V
         AhrRVRo4a7LuVtJ/CG8etT6ra44bvqay2bbAqZdzG4sh7kDyd5VBv604E/ZwSVve/7Ep
         sus73OSq1bRRVx8KfIFtFvmwXNdI4zVTYXicnYzdNjxnDwYa4fULRuNQM1Z3ibUIEIEz
         QPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa1MV2FzKttoYtuM3ESQhanTYPP5QPXYj6F7J8xKi8bBD/78GhKInSIitRPuDSLmJC0XdRHb1IcDgmzXQ5ENCK@lists.infradead.org
X-Gm-Message-State: AOJu0YzOeVHvWZCyNl1VnEHk3cmn4bRBPqdOD1zlSLIKLfsT4iVSZ62e
	E4qsjt2KJYk6LQn2fwb44tZg5Jjz3RgGKsROAAJYFDAR3gUGUq6SKZsuIP6BHserDy4=
X-Gm-Gg: ASbGncvlrK5a4S8u6DWd3tk681XdZClq7Y+LCpRACAXJ/CahN4xJ8bhyKn7ebNkYyt5
	VCuW/h3GSG6jXP1jtLP1VVEyIKdYyX/i1Sb0Kf3ut8QnvB3/QgJzAg2FQgLB9CMT14KaoEKSjrf
	CeUvB16S1p0wzUOQWZsDIw3UwcmO5e7DnnDafrP94TZRIyMHXWOKUkGPY1Dc5ORWRPcx/zrS0ii
	mldaNsI9Zohoy7vEKsMs63nnFn1G0Hw6pbTqh0iX2fUJHY3UXvLkTPA4b7QEh1SxgNU19Mw+KwT
	W8NXdypi8iBnY8bttkYRV0GxKpp8X4XFIRzZOGIauq50oSdTUPvGJc7BgCRIy4WVfo5Cug8Fsj2
	nO6LO4x3Nnv+h7Ml37KfXxOe4BPRLGxauc3gE6d/5BTx2Vn6TKtvjFg==
X-Google-Smtp-Source: AGHT+IE4kHUsCaFrOmMEP4qyRP98QlRLge4KS7mWMGaAZOWXRlwTk01SGGX5ntkel70axSn5eoZ2qg==
X-Received: by 2002:a17:907:3f8c:b0:af9:3d0a:f379 with SMTP id a640c23a62f3a-af98feffb63mr271235666b.0.1754564401932;
        Thu, 07 Aug 2025 04:00:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92b650c8asm1138206266b.65.2025.08.07.03.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:00:00 -0700 (PDT)
Message-ID: <0d835f3a-cc28-44f6-801f-c787f5e363d1@linaro.org>
Date: Thu, 7 Aug 2025 12:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>
 <20250807032449.92770-3-aakarsh.jain@samsung.com>
 <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_040003_825437_3A00225A 
X-CRM114-Status: GOOD (  16.43  )
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

On 07/08/2025 12:59, Krzysztof Kozlowski wrote:
> On 07/08/2025 05:24, Aakarsh Jain wrote:
>> Modify the MFC device tree node to use a SoC-specific
>> compatible string instead of a generic one.
> 
> Why?
> 
>>
>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>> ---
>>  arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
>> index ed47d0ce04e1..a2f15fbe98cb 100644
>> --- a/arch/arm/boot/dts/samsung/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
>> @@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
>>  		};
>>  
>>  		mfc: codec@13400000 {
>> -			compatible = "samsung,mfc-v5";
>> +			compatible = "samsung,exynos4-mfc";
> 
> There are so many things wrong here...
> 
> 1. This breaks all users
> 2. Not a correct compatible - there is no exynos4 (see writing bindings)
> 3. Commit msg does not explain why breaking users is reasonable

Ah and 4: there is no such compatible, so this fails tests.

Best regards,
Krzysztof

