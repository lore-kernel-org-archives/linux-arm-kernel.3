Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D61FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=; b=dSdj2vaLk9ScWHAutnSS9SzxKI
	9A0YCyi6EhnMcgoxczbYOxLI4u6GbjlKQ4K90sZpjxiFXFtMgTBU4x4I4D1uenrI/d+fiDl3vnF6G
	iZxhnfI2spYw8dxnj19/SnGQMP8NjpTyJoatMXHtSmlfQFg96aZDvxLP2OkdErsBOim2JxS2BB9z4
	NjbjetfaQ3+zYPh+PyFjz4epDULWtl9VH5iINhYtJb0zDusZNIxRO9DLdEUgwslxG2QDaBeTxKzU6
	B+op53eli6SKWIQUaefPOmkWuqsrNI2IkYIBRn19hyKfgi5Zf5R7xWLQRIk0fBrQZHK58BXghYXBG
	V9UlKqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRcq-00000005Xyo-2jcq;
	Thu, 30 Apr 2026 13:40:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRco-00000005XyS-0wGN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:40:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44a14580111so93864f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777556415; x=1778161215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=JoF9mMzwVuOr2tJDvCOav8gtaAgojUsjdP2v+VdCcMsJcHEyGyCxwzknmr32WFFSbn
         uQIrD0ERGAJghyRHQbLrbegWIk4/UGvQ2U6YFwxeXiqZC5vPyuPKdarJaUfZVcqej/Fp
         rgpXbqBp1VGFQD/VCz7BlgyOGVno6ad9UgQjOkbKvOvHmMBgmH//pOUPBBWMRgoeWFN6
         1quWJhlKnBbmm2pB4C86U+mQnEHlyypfznzW5gPh2WO0kmNQOMgb9PTIwpQA5cX247IF
         +IFBOxE9ws3ouTuetJtPzvGvm4EpFxTRb2o+Sp7/vLjNQ9uLRvw53uoS3E/5AdtbW6bz
         GF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556415; x=1778161215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=DtAU3hUq4jcE9BiamaZbX8q7lb0vBgFHP/qo9jRCtZlceS2NSMl9x/o4kMaHyE6uuU
         YVHAsQWmlYjHNwDgeJuE8Ke3tH95qezM14QkdOPz6j2tWNTYQqLNvKpuFOHFrtD+2z8O
         z0cdOARfwVO30wRTyPn7XncTBicInGH4eIRLL+aBNyo5g9Xzyx6Kpn3KwRd4OeVZOfPb
         ekF5mmFM9QhFZ+wTyZ33P3apnpKphSpv4DSQY56/G5hvsgKrASjkAGZxzIUrLZPeiqdF
         Ry7H/iR4/5gXjw2NfyD8vuz5rFlD/ZnfAPGPNJEZKWj/UVcRAkp4cjN1knfVi7prkX8k
         ga8A==
X-Forwarded-Encrypted: i=1; AFNElJ/y89aRct5OMa8F0cQ8gt+7TP2NWL9Y2CjDaeLr43IakwkxpNgwlH1ZKQg8ln7mV3+Jl1kGnTGNXwgrknGFSA/s@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhd1YyBeTNwpNdq1rua9GEbS0jS5hvR7L8GM8lLlFsAY/5mrny
	4qPi32hWlcXYrkfj+Y/bZMvX+PE1EQmpzWZQ7yp/1no/6NhEYZ/2BPgxvyGbCW3Ltuk=
X-Gm-Gg: AeBDietYvCe0ILNsY6Gz/XIG+f1CndwkRpECwSoRgwgC3EXl0+n0JeeEmoYv0gee9Q1
	CazX7tUpkPOlX9yrrtjVWqTwGhxMxg0GtTU7GZyWBQAa+AYvnoaA92kgEJ3YBQ2WYWhSwP8fL4h
	rKLoMgK7DOvi+4niGXkkFUncrrxp1FJ2Ty/LIc5gffetvPK2VzRfGhxLxHsiIv9bdOY8y/oMD+e
	F1qWbkuSoJasm2UQQ9lcghR0ef0XbxyxeSXQIpCIv/t2nHKoNhj6FtsJPINCVxkwDvLk+fSetn1
	Vm8rvU4xb0u0D2o1Pk81+QhWkBTfbP/7TxNBmOz+EVP63L83T8MhU7ZtKnTiaD/pt8bzH44IvYo
	cNOMl9kaSa54gC4B87qtJ6Qay3IULbspNw/mTUrVXt+PXI47XkbqUk2En9+wEjvzb368F6l81uY
	koQPZXl6gJbzEwuQi0A3W0gZOFI9DwJUpzfCoRyDhBV4o=
X-Received: by 2002:a05:6000:1862:b0:43d:77c6:be78 with SMTP id ffacd0b85a97d-4493f42beb1mr5272265f8f.39.1777556415022;
        Thu, 30 Apr 2026 06:40:15 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm13806106f8f.35.2026.04.30.06.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:40:14 -0700 (PDT)
Message-ID: <56c1bb6d-54e4-4977-bd88-9ce7a6086b1d@linaro.org>
Date: Thu, 30 Apr 2026 16:40:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
 <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_064018_289953_98C5646F 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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



On 4/30/26 4:07 PM, Alexey Klimov wrote:
>> +static struct platform_driver acpm_tmu_driver = {
>> +	.driver = {
>> +		.name   = "gs-tmu",
> What "gs" stands for in the name?

:) Google Silicon I think.

> Shouldn't it be called something more acpm-ish generic like acpm-tmu
> at least?

yes, it should! will update.

Thanks!
ta

