Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Z8Fz1fRVkTQIb2KN3JUG08EPIq1mQm84WayplzduZo=; b=cL2SGrbRjULdEKn7+nyKEegYfp
	P6Fst/sG3T4aR8aPCf5EVBbOghl8iDzFe5w4eVMb36r31vHC0vwKrMPVUqdoXcHlu+AOgHqJNqRyX
	RN2ykM9hObdM8qQOOno7GMOx7RZyQY6hVcanj4NY49SOqpr6su3P/nMQpBRDsD+eEo/xUn/nbHRte
	OWW6FMBN6Kcaa9sMMzh6B+IMJdBuavMzUtMgAD1fsF3vvV05dXudbND0wXxzdwTbtDeZP8qCwnU+K
	hfOHI85j7nbUhluFxIQeTkJtMrZW4WZbwGT9IO79LUIgg/PlnUke1qa4b9yxXJ7p6nm6NdFXdr2uD
	3jb3Am/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDNY-0000000EyPD-3Ecp;
	Mon, 29 Jun 2026 14:54:32 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDNW-0000000EyOb-2bjl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:54:32 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6a17f6cce4fso307909eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782744869; x=1783349669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z8Fz1fRVkTQIb2KN3JUG08EPIq1mQm84WayplzduZo=;
        b=pKAEvd92MyVp28XuH9Ph51x1Np78N1achNDTpLtP8iWHdZtmBz3rELac7tujkcC7ED
         bpni83OVphoknySOK4rqChDwNB6RoXwA1bzMYeu+r7EXBk+9ONcp4B2p8xV1B9KUvIgo
         IMvBaLKmykLWy58QF5dSwwz9TBm7kPpYAQ8JzD9lDnMgQjG1pTmVbfL7mvXAtc5/Ykq0
         E+GeAN6Eq00Y+HCOKkU4Y/v+m/0DiHc5DBobgZop7evYiB3oqAlha78ehX50WuuHnRZN
         sEGKuL8PfRjUF29QOrlTWN3cXMaoRhFE51pWjLDdEZ2abL3YguZU9m/Wd3z4/xFgDyF0
         tF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744869; x=1783349669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z8Fz1fRVkTQIb2KN3JUG08EPIq1mQm84WayplzduZo=;
        b=BVxEwYXIei8fJ676yhVfMtlPCOJTE+NJxtzZ7aGz5K9Td1vqdx9RkUG66zHrlEI5IZ
         LWEMijfz9OgWVEM1py5wBiyJTodW4qd99DN9drzQqqGYBoAtPo//gxhpbcR2q5px7Szk
         lOtURY+iZ4717e+iqrO2URe7T7XPzi3+fWL3wwgxS56Sb0FWER6SByb9tLEKvgII1feR
         788KAqKTp63Q636h0LQO1KJrNWNp4uTy1J1dbpmc6OmAE8Eu8PbbVWlKebLAlYXcwYqV
         mc9+FuXMf+lS0XYR3abpCoYEkgVNESa48eIG85isFmO50IEGpJW0T6qNkNPaRaezQ6LU
         EMGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3cMOr9SZWooniGNbssQqKl0n3LH4Q3pr5+s2CEn5yC0nUv4wkGvUR/ueXyfkDM9N3RxotsiJ4eFqAIQFroPYY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kTLLLBBxaXpwXsa0ewW01QR9D08O+/BgqoSIOlXHPUMXJpD1
	/nlXxcjXHly+XGsd4I0TAP14R999tAZccHFtXl/507h8HWCT1UtQE6m0A92Yx27zHZ8=
X-Gm-Gg: AfdE7cl9FHpzumPk7DiSDoPk7H7GgnKPgxuxingnxf4rObFcOA9nXKPd5x8mzH38mQU
	9AhEDruFl4AQ2AhFEDqqtiNCzz33yjZAobrqOsq3mWV4Uzw8QXLtr/oancQy6Ib92vcaZQwUdxM
	K1Fsx2AJ1ysksyM2+5QGhkwWP92cuel1sNWYvlppdbHcIIVFMot15mBGgUE5Uiqu/eJ6PHOI4I3
	7A3s6866eZVtNaWg23GIzlxfi9Wpw5NNfyu1kOAN5S9jQlX5Pz49h3G1WqpYPteBmp14CF2CkMt
	vun8nsXJUkjyzfJouHFPMh1w7GT3SfAm+TKntwwajhDuusKoXnQw2+6qDW8fBH/5OGCd0XgZRco
	5WwMFnpYYCpPSLuw09SyBWghClwisAo+V5eKiiIvItPwherEJFOWpyllfxNzDfO58c34UXz/nB4
	c0sUHaIS8Yst6gbb62q9ypLc15x34SA0+NUx1MDQElQybpTABHOL/5dly1mLYGEeE=
X-Received: by 2002:a05:6820:708d:20b0:69d:f864:d35b with SMTP id 006d021491bc7-6a1890a067dmr11074eaf.23.1782744869202;
        Mon, 29 Jun 2026 07:54:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db51ef14sm36094fac.0.2026.06.29.07.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:54:28 -0700 (PDT)
Message-ID: <06ce8972-55f6-4114-a3c5-1d3bd6f45d73@baylibre.com>
Date: Mon, 29 Jun 2026 09:54:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
To: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
 <6770a7af-06cc-4240-9b20-c299e7080ab1@baylibre.com>
 <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075430_666210_8A06BA5A 
X-CRM114-Status: GOOD (  10.85  )
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

On 6/28/26 9:33 PM, Petar Stepanovic wrote:
> 
> On 6/28/2026 1:07 AM, David Lechner wrote:

...

>>> +};
>>> +
>>> +static void axiado_saradc_disable(void *data)
>>> +{
>>> +     struct axiado_saradc *info = data;
>>> +
>>> +     writel(AX_SARADC_GLOBAL_CTRL_PD, info->regs + AX_SARADC_GLOBAL_CTRL_REG);
>> People usual make read and write wrappers or use regmap to avoid having
>> to write `info->regs + AX_SARADC_GLOBAL_CTRL_REG` so many times.
> 
> My understanding is that simple read/write wrappers are not always
> preferred unless they provide additional value. Would switching the
> driver to regmap be acceptable here to avoid repeating the base address
> calculation?
> 
Yes, regmap is always nice because it brings a lot of extra features
for free.

