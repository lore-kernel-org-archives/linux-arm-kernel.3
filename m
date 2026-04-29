Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1CBCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1mflq2JmCovYJyevIlYYXkXeU9o+ZpGv13YTJw53l4=; b=sjaEWz0F8kqaXj8I+5f/yJSO5/
	I6PelT9kzSgBCPkH4Mk5oWwPG2crwgtUhrTxtUcWFOBn8Gnj7MFDgOik9shMqkVLHmn1HY3s+F69Y
	rx3IYCdG3Cav/i38dkwx1kPakrbuVHoDH56diSzCnEtuZwImyPN1M5Didyesvk5g9yJlWN4CE6Roo
	NTmuDez1vZcho6vfOqVaT1Z3heK0l7HpOctPIEx0Ot5rdhByzYUU3Ju4iCjhdpdwku7KGvvy7rReA
	YleIc7NUHLtyRz84LkGEy2WJVD4K/6EfY6D6n0R7e/VXr6fIIpzUpBCwQy9C3n6CeQ9o7i4QzyVoE
	xfJ5AbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6ij-00000003pW3-1VUP;
	Wed, 29 Apr 2026 15:21:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6ig-00000003pVO-1fYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:20:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48896199cbaso125068265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777476056; x=1778080856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1mflq2JmCovYJyevIlYYXkXeU9o+ZpGv13YTJw53l4=;
        b=ZazGH07+olmnk5km2P0O/HUcdnIo5r7JAt5lhaVJH8oEyCGYs2Ih0ikF3r//JFQKHH
         K/TG1PVbvWdOtWt+g9qXzWwZdaUHGnwrWv56vOFPZcHJioQPANv+RiZwwUPGUjbMYzT/
         DSvoTZm5wGJr+teI3p791U4IgdV3By7hi8Vqd1InLDrBw1a4StEKYZaWSxVqNHnInnix
         SvK/rjE0CH9VwMrxi+xNnQPzK8+cu5I2Eka4NGFqs2gTrSz8xKH/Pldi0zVqHWecklJD
         IdOyPOQhIYhG83MB2T0IXq3IIjdRmjYu68wjJp2BUuaGbBQrNYqG0yRso+9CCtHWmvO7
         8Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476056; x=1778080856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1mflq2JmCovYJyevIlYYXkXeU9o+ZpGv13YTJw53l4=;
        b=iJZUEP7qfIj7gj0cEV4VnIwv1uqxucBmGTq8yOphgsTpK/3AdYew7s03E/HFZtA92a
         EOQR9JXuidSSQyZkr0p3IEewN/wPI9glRHxVuSpAJFy2fInFAqruvFB+keuFXlNu+zmB
         d67cp23fxFC3ObWKhxT7jf28mqCn9TTFybEZaYXrS/IZQDadhAI8P6AnVpeiIm6C+kMN
         tQIR9UzA9kqVToOCjMb5tTcwQInbRTV/u28b5Ba5cHkqw6Gh5bMF/tPKRpt2/jXaFkgQ
         t3J97YnWXlS7qThj1AvLcbcTG1duSDh97NlI6ZD4oLZi1y/0NB5xSYP3vHrTqfHHOTnw
         yMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6oQdJQjGjqIkJiegMUG/UhUYmouWGI/Xlvy+cSSF/Oq2Mv0rQFQwGT/k85mv66OiU0v4flh+4s3qRWF+1hU0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yy31cDalBHIytrNYSh7AJpZCluGTZQtjBAqC5ycr4UM465hLjWe
	t4bUkyvepXRC7zddyfGkrM9jc1jg1qM1ClXdrdInykAj1xbN5ry/YRZydoVCoUvV3+I=
X-Gm-Gg: AeBDiesaip0AGu/SyYY+4RISbI2s70SDISycaOhtoPOi6Sj55NRKS945nGSRs7xAO4N
	t/HTyom2o64KTE/uSjOkRz7bdgzGgI+NIVgHZALqd8v80Sm9qMSTE5Oy4XA0seFj0mNdUv1W3ff
	Pm+Z0Ag4eLMnMXSZfVkyZ0f38aqnu10tfW+MC2+54YLFqJYocN5MJDJqX0vocT4nB5YeBpiOdvo
	CXpN+OqYUL2//7sXXVhtrZ4sr320WMYfaoiZqywrdnYAqM7mEUqjdOT3jOc1Djyht9+EbcfxEh5
	su4+b1D3iIBaFLrn0ppwGtUpy2P79Nb275T8dWcximIgFj6tIQyz5mokAPBfsbMulPvLsQOmT/t
	OxOmh1/3kxmqM7zu7dFf6E4ewfjXIyhEmVD3GRopNG1IGPFf1VwK2OzT6F/klX0wx0BWm2ZiWgh
	phfVds3Uw9jX2Y2xSBxRV/OWYt8bJsxvaca10TGdg4Vi8=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48a77b054d8mr122018735e9.14.1777476056171;
        Wed, 29 Apr 2026 08:20:56 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5afesm5634461f8f.30.2026.04.29.08.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:20:55 -0700 (PDT)
Message-ID: <001a226f-606a-41fe-a684-c208d8898e17@linaro.org>
Date: Wed, 29 Apr 2026 18:20:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
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
 <41ebf31c-89ca-497e-b206-ece332d0260e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <41ebf31c-89ca-497e-b206-ece332d0260e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_082058_463153_39F42618 
X-CRM114-Status: GOOD (  15.95  )
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

Hi, Krzysztof,

On 4/28/26 12:24 PM, Krzysztof Kozlowski wrote:
>> Dependencies
>> ============
>> - context dependency on the ACPM fixes sent at:
>>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org/T/#t
>> - cleanup and prep firmware patches 2, 3, 4, 5, 6, 7: required by the
>>   thermal driver (patch 8).
> Well, cleanup in one driver cannot be a dependency for other driver.
> 
>> - bindings (patch 1): required for DTS validation.
>> - thermal driver patch 8: required by defconfig (patch 11) - logical
>> dependency. 
> Most of the patches should be taken before, which would leave you only
> final new firmware interface as dependency. Creating such unnecessary
> dependencies is not helping.
> 
> And the patchset even grew and will conflict with other firmware work,
> so I will deal with firmware bits and I can provide them via stable tag
> to thermal for the last patch.

Sounds good, thank you!

I'll send the firmware cleanup and preparatory patches in their own patch
set after the firmware fixes get in.

Then I will resend the thermal driver once all the firmware patches are
sorted out and a stable tag is provided.

In the meantime the thermal maintainers can still check the thermal driver
proposal.

Cheers,
ta

