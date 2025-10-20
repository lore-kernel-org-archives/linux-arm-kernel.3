Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD24CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xaDzCk8g9Yg/TwlJeMcBMF5t+X3WKHYwMzLzHQCj6g=; b=qg76EG+dFYDH8WLLtim4AN3zT0
	++FaPp8ep1dKgCqWP92yGoPMAdXBuOqV3ffYrKCQd5TDB64x2c8rWU1wAmYdfklMiS55C8dXJOjej
	11BHj4XIS4zlRdRLey4+NWcOaH8aqIndxGwWZZ33HuLOd/p+NGioRA6FqJEP3c57qDqPCCm6GahdD
	CWHYPmNezcYhJ63vNiVnNSmBSoacgsqyBO5S+Sl//Uf7vjVRSThHYxHNLqiE7j8qCq/m/9m3Sa6ZE
	Vfo9mdBp6QSJiDLCeZSCERV7j9a1mRRbOaqizPWEqakiqvEcytlH8NOPndwubDINekDalAuNts6vC
	DikVC8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnfD-0000000Cz3e-2IBp;
	Mon, 20 Oct 2025 11:02:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnfA-0000000Cz3A-3XeN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:02:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47118259fd8so23331115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760958171; x=1761562971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xaDzCk8g9Yg/TwlJeMcBMF5t+X3WKHYwMzLzHQCj6g=;
        b=AbIHe41ZuAhAj7biydHTUCviXV8gMLaOB/u7uz6fKOCxnrbhGDjVejGB3HtD/xgEfZ
         qFBK4xqTmxAm9XpIIl/C/WBTJYmozsPu7gfMSn0DNDc9R2f7Tdg/qbwJ2pGDlORc+7tG
         05ScO082ojVKn/IJFyMQN93zS0Lu6QKZtkU7Op73+xfkdh4iBI7Y5XDiBKnJUFD4XDkS
         VRrfZ1OTJgnut4FPdvKlc20H4qOzF8rFjQyHnATYBwNZiX4PduiDcCpnz04AwiIRnpzw
         uiSih5wERBVdnMlgXoC6Ct/4UQS5OavJJyz+mS7+WzF0xkj97dZpNmNvxfYcYJPFR6gR
         Z1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958171; x=1761562971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xaDzCk8g9Yg/TwlJeMcBMF5t+X3WKHYwMzLzHQCj6g=;
        b=OtQ43SU2TDT3De2ny+vJKnyFE80hMuIio9fXFoBLLVVEMxISvnP6JPSNHZpLh42mJV
         HXzmMBRxDB+7nlesjyE01e2bQd5JBQLYrwyQF69iRYzV1vB0xIev/fcthyQ0j+znUW3k
         /PurRFV5xuc/Z1oC7tvF3IUx6Y64qaKm7hExzTTp9eiefx7MZKBSuzCl96SHYRX1Io94
         Ovd1+LMZat6ubuOiq963Li7Ao7TjeTDBSdcXGDSDM7H/sJNaYhE05TT39yUgRBMuf6Yq
         nEn0dAJT5D2gUElNFWCXZ0WYuA2Q1wo2XJwNeILJeAD+yS/UnWfURaYvLcBNqu22WqA8
         F4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4CRuUWNOK/Ea1ARRqn9QiW9e2A5rkojrTQhOwyDYIIP4x16zBzYg4SsU71VFhMfClmIm3r1BHDmGD1eZ1gilq@lists.infradead.org
X-Gm-Message-State: AOJu0YyMFiq09reAGqS3CnHV2qe1Qz2nJ1uvYZ6xCpJuwN05eElpzo/Z
	EYGMYcREwjDa5jyex4TWQwJocXsHkSPLWXGXSPJWTsk8u7V4rv62JezKUGEINVdrQy8=
X-Gm-Gg: ASbGncvYOE/oTUtTQx1d5aY4H5hAoFLfA3J136VJ4qcyI41s64y1HfqL65jY8ECqfVK
	T9M8bfTbAT8NIV1t+rj2KOlSQYhkemXx/QjhIu4EFQEdnTWkQmvpP8mLuw7riZtd4TjkjYcTwl7
	KmwAJk72toJVubnxg8my7Zizr4yDmyi/P2E+66cK2V/tyjutWHyn0Dz3Xvievwd5vugtNVd+hHp
	adjdTnIF4WZvz9VPvGT93iATtv2kH9UgaExHZKZlQcLT3VmaaEHOLjZ5AU0ftHLHvcAMfbRTbX8
	KOA0v1UN2+MxT85zpT9CRfrE2igvR7hN0i8yVGEdMHqyHkdrRCYicrsr+8xu7QVzz0kymWMdAI2
	uPvebE/ETZQXtSMA/TfWb6g9/36HuoscpgubwO0v6Ux+a2/hwXeBZVzi7bmqS6msvQzGnY5uOYl
	2X+RtayXKY
X-Google-Smtp-Source: AGHT+IHVRGuyj2IpvPopVEw/V/0JRaYFv5Zr9eggn9/gr+9TUMeVNtov2/qg5jgRutFZM+D2sOlUeg==
X-Received: by 2002:a05:600c:820f:b0:46f:b42e:e365 with SMTP id 5b1f17b1804b1-4711791dce8mr93413745e9.39.1760958170945;
        Mon, 20 Oct 2025 04:02:50 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm137785635e9.15.2025.10.20.04.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:02:50 -0700 (PDT)
Message-ID: <de77e673-c2f2-4293-88bf-be9c6779a5dc@linaro.org>
Date: Mon, 20 Oct 2025 12:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
 <a03cd07f-8e9f-4b02-b301-f1bbb69eb7db@linaro.org>
 <f6812244-8e8e-45b9-87b9-fe96d740a843@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f6812244-8e8e-45b9-87b9-fe96d740a843@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040252_906170_CF0C5E34 
X-CRM114-Status: GOOD (  17.07  )
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



On 10/20/25 10:58 AM, Krzysztof Kozlowski wrote:
> On 20/10/2025 11:19, Tudor Ambarus wrote:
>>
>>
>> On 10/20/25 9:22 AM, Krzysztof Kozlowski wrote:
>>> On 20/10/2025 09:45, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>>  	  status of the certains clocks from SoC, but it could also be tied to
>>>>>>  	  other devices as an input clock.
>>>>>>  
>>>>>> +config EXYNOS_ACPM_CLK
>>>>>> +	tristate "Clock driver controlled via ACPM interface"
>>>>>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>>
>>>>> I merged the patches but I don't get why we are not enabling it by
>>>>> default, just like every other clock driver. What is so special here?
>>>>
>>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>
>>>
>>> No. I am referring to missing default and defconfig patch.
>>>
>>
>> default m or y would force compilation of EXYNOS_ACPM_CLK and
>> EXYNOS_ACPM_PROTOCOL for all ARCH_EXYNOS, even on Exynos platforms that
>> don't use ACPM. Since ACPM is not universally required by the Exynos
>> architecture, I thought to make it opt-in (default n).
> 
> 
> Just like every clock driver. So again - how is it different?

The key difference lies in the universality of the hardware interface
across the ARCH_EXYNOS family. If EXYNOS_AUDSS_CLK_CON, EXYNOS_CLKOUT
are considered core, integral, or nearly universal features across
Exynos SoCs, then it's alright to have them by default. I can't tell how
common is ACPM across the Samsung Exynos SoCs. I know it's present on
gs{1,2)01 and e850. Heard it mentioned around some other phone but I
can't remember which. Maybe we shall set to a default m when more users
reveal themselves? I'm of course open to drop the defconfig patch and
follow up with a patch setting EXYNOS_ACPM_CLK to
"default m if ARCH_EXYNOS" if you think it's common enough.

Cheers,
ta

