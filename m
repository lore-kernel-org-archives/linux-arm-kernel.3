Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320B7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI73KSwQqhq1Gh+2IcGy32QhBQAYgTIk/JPEYFLFV2Y=; b=Bs3HsZ1GcWXJRcAkwQ1+D8YIZZ
	Er4pN0rI0IhYMFXG43GswUSUeC6WrjhrSwbhq1/F05OSlurt+zUB8X6Q5zmlUN3aTVe4YxPVXwcvN
	6uYUPcuYylteE8apXzwgBeab0EBWi6kLphUGBnV7rJszGceuxtIq7gP2ewKeTolCQ7ANdI85fC3RK
	7v2ljAp4lGsWHN1nev1mJmKCorwe+gOeFtw46ZESZV9PpQAtp0hnACzYVh/0XsgKzlUQdqW0iWUQp
	oi2x1+AOBJUlwpLxP7zL+BcZ06HG7KFl7LHFnZ/ZbfcZZHYTfJ2uaf/Xn3BCDcyUeKrVqpV9mJEWf
	UNfZjHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3z-0000000Fv9L-3hcD;
	Wed, 24 Sep 2025 08:41:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3x-0000000Fv7l-3AAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:41:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e2e363118so3402775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758703280; x=1759308080; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WI73KSwQqhq1Gh+2IcGy32QhBQAYgTIk/JPEYFLFV2Y=;
        b=mjRIDlgzLyGVIMmyz/FAAvslnQmH6LgBV7KfZKFgNuLgbP4zSi5CRanOBr+ccW8JME
         EEKeGSl7pgqSoErX45Xf4OW5vh7ynHOacv5IAlalSdByPAn08KzqlUKEVwsqemKM6wi6
         0sUw8fzGaJcqqJgUqO/hAqPl1++8wz75gOUeUg+mCv1DJ8roRCS7v/43zqKdgACcwVlk
         LPh+f/wcHd4FCtAnrA7jw6CcAUVDLJhVLOEybAFqo8vW4cNkttKNWHdm4gQZ9kSWk2Xa
         aIp2gEmdFyIIpyWK3vCUdMta5y5D63b0XNzarnM2XM9HyUVuhJMb7TNzpRcr07wJ3vbr
         Rhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758703280; x=1759308080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI73KSwQqhq1Gh+2IcGy32QhBQAYgTIk/JPEYFLFV2Y=;
        b=NIHXOQoGbkTdxnlmJjxkTRWnMBdDTn7ARY4utNhBaZ7av5z/5u/CWggAEX+dJu1kUd
         FwKWvlZL6UJjAoYnmodaWdrG+ttvZKcVQ6zyBegdqgjQo/kdtfg4KJ0mK06vXaOeXOhn
         j4+ld+XfD9UcL/gBrC+ouJsDreAD6sn+dTCHHJNFiPC3328ohEFr9fbnm6DGRHnswnHP
         tsf+HIQpMzDLYlmpL2aKY1t6UC0ov9IfADFT3FPorFfGMjD/qOBEQ1fO7W6ibxRpLcHr
         0J620dh1tamb3VIh6WrGIM1Rwcl0F7bbWIj/GnCCSeNzLz9uEY+RKyeiJCJKshkL/q2R
         lCtA==
X-Forwarded-Encrypted: i=1; AJvYcCVwp7RGjM5fDCTL+ziDdT8Dfidopp1GswW7BagbQBCu4rdy8Urh1e7mOMQ481ixrSXxLbE/a/UYi1WjrlmEqfy/@lists.infradead.org
X-Gm-Message-State: AOJu0YyvAp16MwSKYtVlSOF7rcVOCgNJImtEjQ+C7tQeRa7NPTuGCmS8
	aLd6gIYP3Nq4Euut9PGuiIIzYhO6/Xnbn3FcKfaIM3lPRPMHmW/4FU/Ezbs9Jvonbt0=
X-Gm-Gg: ASbGncsYchgd5nMhBYiyBFoYHKOI73VeJQejOTe8iX8ozFrWxQiM6crbFJq3BgxszfP
	Q32wX9yk15USFE23UErpqYWxQHMGyQWm60mmHh7IDUVuKXQFiMqSr29B9wZ0QVZ0C04XNFr9ZxI
	N+mDAaZaF5Qo6lXOxZ/0gRmC2bJgAvIgR4eBDtJF/VajEj/uy+vSQVyX6nJ0bU3cgq+Rn0m7ZUk
	eA5EGm280Ues2Ai5NmaUOziKYYxbtznrEBRkUgs/5S8gX7/2Xamt6UoeUbSe/necHaOdwz4Y4wh
	GxxaUSo/z8yGZmO+tzS3gBo5Az8iOopx7Y/c2bWPzaYNClVv10XsP8mDLNSSObGXtosusN1KR9i
	ej8X8DMWvMSAMiS5c02pNaQOeUJGBvqk8X9eyUPDLDy9GvuJY3j9QURQcLtvdfwMouttohEa01J
	oILQ==
X-Google-Smtp-Source: AGHT+IG1DdlpxlL0duxNewRctsIzz5UZfKcQ2utw+x/rbFZjfa3j++4y90r1/7+EYFvHa6wtluGcQw==
X-Received: by 2002:a05:600c:1c09:b0:45b:74fc:d6ec with SMTP id 5b1f17b1804b1-46e1d974906mr72852475e9.8.1758703278633;
        Wed, 24 Sep 2025 01:41:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bc4b:2611:54b0:29a4? ([2a05:6e02:1041:c10:bc4b:2611:54b0:29a4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2ab7d4e3sm21594365e9.23.2025.09.24.01.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 01:41:18 -0700 (PDT)
Message-ID: <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
Date: Wed, 24 Sep 2025 10:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Will McVicker <willmcvicker@google.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_014121_816617_D65E166A 
X-CRM114-Status: GOOD (  12.09  )
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


Hi Marek,

On 19/09/2025 23:31, Marek Szyprowski wrote:
> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>> For some unknown reasons forcing percpu interrupts for local timers
>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>> flag only when driver is compiled for newer ARM64 architecture.
>>>
>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>
>> I am pretty sure the patch above was not tested on arm32, thus this
>> workaround seems reasonable.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Daniel, any chance to get this merged?

The patch does not apply. However it is not your fault but a glitch in 
the previous pull request and the regression found in the Exynos MCT.

Apparently, Thomas had to drop the entire pull request while I thought 
he dropped only Will's changes.

A pull request with the previous changes for v6.17-rc1 and with the new 
changes for v6.18-rc1 is about to be emitted but without the Exynos MCT 
changes for the modularization. That means your change does not apply 
correctly anymore on the current changes.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

