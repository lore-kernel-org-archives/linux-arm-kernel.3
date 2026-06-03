Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6184FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVv22gZyTmtymIxhoGte2pKFNDZ9dT7qVuNtoXNbMUA=; b=JpRr+ZzHwuEzmU4qNc4YEO6Gjb
	0tKWMzXyzh+IaDw5PUobsbnWgArkX+Efp0sXyyH7dPpC45eT9wXjbLa2g8H6ZYgz2wuvQGUjvXLJd
	YA0EevTV1nKhki9ZBtNSQltFMebSw3w/t1kmc6A3PiImVBMYuB6DbC9y6M0Tt+POqkHDGd45Cf72X
	AEaK4ADf2lyoi3Xk4I8NiDxUpjfI92jVWWVRD3kL9qii7zGME9Z+eqe7wtAXphtWCUkEU8aev9s32
	CgGYIJ6c145Spb/UlhDLsFU/RsrU/JmMUyb7fMxzXuIlJgsx4IqOovlfKnRRstaaqNFG1rfdQYBS5
	jV1DOx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhrf-0000000EhbV-0XZ5;
	Wed, 03 Jun 2026 09:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhre-0000000Ehb4-2hi4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LVv22gZyTmtymIxhoGte2pKFNDZ9dT7qVuNtoXNbMUA=; b=cy52uTvKsVJ+u+rQFd9OCGQvg1
	Fd100vmKLisrs9JBXtMAR0k0AJ8o4p3MU0Kt/w6HhuwoHlnszTPjleTu0ISN1WAtHbMl09QgIT1qO
	NZ/EH23zk7cS4MAdIF3KPhcisWx/QmmuA6DY8UM8SWv+bfJxRySjDHtHutWorWHJ1WMq1cEIovVg7
	S4U882ev/IvRpBTHMMDLJWdoBX42fqrS4tftyqg+ZqSUWlJAk7GI1i1wYhPXdBlPiOINMMXD1yogD
	6cAbqx9kPJ+H4bd3LmwOKjeMYSfa+DoLGWKjGwXH4m49jKFBkR5Jolp1bed+ALtDZ35nIReoX5r/6
	4GwBSHZw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhrb-0000000Bhzr-2p3R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:26:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so9470605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780478773; x=1781083573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVv22gZyTmtymIxhoGte2pKFNDZ9dT7qVuNtoXNbMUA=;
        b=I1SoNDoNkFQ7wyYKzbr1SumUpcK7eLMCwPMTlfLFKTATJBL5QPYZ9wlioIGMPLCOQV
         UNzPzaOQNr4FxZSVsdU1enlX0v/ghLkxV/E5YGNnY3Zev2Mm3f3OyrTu1I+hfVE+u+og
         Rk6p4fZuDBVjZyyLtstMk1pL5d9YwBobfeBdTH2dckEIUS31iOczBkoeNHDmD/aLIsN2
         FumRLnGo8Ra62bIHCzQqavaWJCpgpV2OXpCzTY/ndMTnpGhTDTxQrQuMCUB5IfzJS7FN
         fX6Cg81Tyv8z6gkMe8D8ZgMvzC7WCKPUO0jU2dFlJ4KpjtUeGYn+JtJqJJUd+hPpeLrk
         OiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478773; x=1781083573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVv22gZyTmtymIxhoGte2pKFNDZ9dT7qVuNtoXNbMUA=;
        b=WLNYoa4WyPIfd+wiu9Y9cafSobppGdOnGpmTiuQCgxP5cdM5X5mzB4k0NnDih+AS/h
         u3OqsbRJ99gVTZbMaGdFDI/ushHu8/Y28B775cbHqwPoRQSyN2jzbgAArNikzPzHk3mU
         3fzlR9Djl9cqa9D9TrrwzOt5E9cgrY1zAYEpYJXUu9icaJM7Bx0/AmFvzj5zbqmYGXeJ
         9VBMXUFC+d/W2Vt8aIHslhLq66B0l6Z4yebsgTBPrmWLU3qome0f3o2DvfQrT7tBYmOH
         lqWVKt2mAakK9edS3YA5E+7b4gmCfhRL1hK85/40HW1bXx6BeLSnZDuoiO2KvFkpzg+t
         p3vw==
X-Forwarded-Encrypted: i=1; AFNElJ8/zhFl4KUkC0UsnMqAn6UAZh8ndOGbc7rVnAR/My5J+T6QrxS1+kxirurUgZ2eZGhGBpKLfmqbYnanQxxqA27Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxpTkMr1Er3cE94O3Ct3nLByn0uQUqTdXaeKcFFwAVXdFMd4ZYO
	oB/tv2ENvKzI4oBZahJhBTDue+OJrlNaHh49w/BGBhMMrKvmhKQzetkRCMB+E32sVNQ=
X-Gm-Gg: Acq92OFesY/EEf75N5rVoiEALaW2HRhL5gm0FkatTKMxAf3HDUQwtwW/TDCVNPzc0En
	/s/1LWiVps/jQ2PE8RUeWU+I8Nnl/dIggHZkTkOy5+9Iu76tOgeloDknjP4nTllkscXIgrkcFtY
	BF1QxhBU3KqD37YIDQHtN6dOcnAF/D0QwTrkJhjJPFyh79yyKyvQaBj7Ldedi/hvhU8oxuftYMQ
	xSaOQaElhw6c2eUqB2hx48zNY7RGGWYG7B0wW+Rar9qFP+lQM2kgeg5lJvSbLMNS9Qg/errrirV
	CSuIiGjOPtTm1ZaTTC3fUcDOis3Z9Hy1vnWNiCT4dTON22g0KjiCktvORh1TIP7n0nRlG5IGgu9
	IkNFrPfndjdhe9kHHQwA2OtcHWJzztwkvMrIQSFkK1f3wG/zzI1bRy0tXEHLojXz0xrVDLLMkHU
	ky/4iiYUhPiWDpRI/kmSU2NvMRsbUGoRLgbS1tJ0xR8Q==
X-Received: by 2002:a05:600c:45d4:b0:490:5074:651e with SMTP id 5b1f17b1804b1-490b60ef350mr41726765e9.25.1780478773360;
        Wed, 03 Jun 2026 02:26:13 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d64e8sm35451535e9.0.2026.06.03.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:26:12 -0700 (PDT)
Message-ID: <c76c8f9b-bdd1-4006-aa28-735254f0409a@linaro.org>
Date: Wed, 3 Jun 2026 12:26:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
 <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_102615_796732_F60353B3 
X-CRM114-Status: GOOD (  18.76  )
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



On 6/2/26 10:49 PM, Alexey Klimov wrote:
> On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
>> Add driver for the Thermal Management Unit (TMU) managed via the Alive
>> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
>> Google GS101 (and Exynos850, autov920, etc.).
>>
>> The TMU on utilizes a hybrid management model shared between the
>> Application Processor (AP) and the ACPM firmware. The driver maintains
>> direct memory-mapped access to the TMU interrupt pending registers to
>> identify thermal events, while delegating functional tasks - such as
>> sensor initialization, threshold configuration, and temperature
>> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/thermal/samsung/Kconfig    |  19 ++
>>  drivers/thermal/samsung/Makefile   |   2 +
>>  drivers/thermal/samsung/acpm-tmu.c | 618 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 639 insertions(+)
>>
>> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
>> index f4eff5a41a84..383ae3f56cbb 100644
>> --- a/drivers/thermal/samsung/Kconfig
>> +++ b/drivers/thermal/samsung/Kconfig
>> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
>>  	  the TMU, reports temperature and handles cooling action if defined.
>>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>>  	  data from the supported SoCs.
>> +
>> +config EXYNOS_ACPM_THERMAL
>> +	tristate "Exynos ACPM thermal management unit driver"
>> +	depends on THERMAL_OF
>> +	depends on HAS_IOMEM
>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)

I forgot to drop "|| (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)", ACPM is NOT
optional for this driver. I will comply this way with Arnd's solution from:

https://lore.kernel.org/linux-samsung-soc/178006367096.55906.16678510397337205828.b4-ty@b4/T/#t

>> +	default ARCH_EXYNOS
>> +	help
>> +	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs
>> +	  (such as Google GS101 and Exynos850).
> 
> This driver doesn't support Exynos850. There is no initialisation sequence
> and etc, moreover the next section is also not entirely correct for Exynos850.
> Not sure why it is mentioned here in such way.
> (Not even mentioning that ACPM TMU part is not aligned for Exynos850)
> 

Okay, I'll drop the reference to e850.

Cheers,
ta

