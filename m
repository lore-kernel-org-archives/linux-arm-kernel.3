Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B5C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt30vxCZ8dDJGA9f6yl5mbEhlcuKQimFoXdE6IW4R8k=; b=pdUpKRir4z8N17yNflbvWTKwPq
	ZTPSpMZbsHRmjaJCxKNZgftWJYqrKu1294a3Rr8Z6bTev7AdXAn7NZh9JittppThAeBq4QU+0Nwby
	RM9KRS+J8R4YdnCIilxr0k6X4nuG2v3Wo6jmiDMaJVCp8TfvE3XSGAI8y3IxdyR154OpWMLB/BVAj
	xyg5Q2XrfsHMJzxJrlVjkdW//644OIcZIni+GkDQWfseFBi8mF8M540Cg1oX17GkumWmmE4rc2Qah
	y+3dGFq49WfRpfTavr17QVrboAtaqFGaXJo2XqjbzvGXcoed7Mko9FC5tRVbKEu7uk3xkbw2RAsNO
	OHedGdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXwx-00000006WI8-0zig;
	Thu, 27 Feb 2025 07:04:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXut-00000006W17-0kPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:02:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abad214f9c9so9864266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 23:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740639761; x=1741244561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nt30vxCZ8dDJGA9f6yl5mbEhlcuKQimFoXdE6IW4R8k=;
        b=U3+QOGRRovfLqpHyznbNI7khYzEwkgJKLsFiRHLi12Odo0BJutHz8vP50Ba2wYiwYR
         c9EV23n7/961hcNCSA0cCDjm88KOIwuI7LhHSbssuJmNc17DxEr7Y7iPN4SIhKzLytKf
         u2/LqrTnfyl9SWurZeluHASZUqK/ZU19p7E2rLShSNVrGRJZnJANSzjVvaq3JQN1Uye/
         AgbVEbdgVD2abLsCAdfoCCQmXIuW4VxCHOknzC/80TMJYDbseXhfEXlzyWhEUXO4uI3G
         b8uKJRIxTku7ee3jB+2wdEWMzrIXkBX5xRkjxU1F7/PIQI8VfiAg6+wDr81wK6v7Cu5p
         m5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639761; x=1741244561;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt30vxCZ8dDJGA9f6yl5mbEhlcuKQimFoXdE6IW4R8k=;
        b=ryf09MQwy/zR7Ndgw7v98y0LNlFwRT5uZO9yYvmfskxrxAnMQQ27zc1iJAsqrQkZ3T
         Vt6PqIhZDE3E7HvgJjn1E825FRpah7rpVzUkrUU2luP/EqhL3Wq1gS2bXmNAlBv/Ik24
         fSRmdF46uIYFc2xYu6nsT1BMdjtp+O66+YTA51qj7ZWDHRa+VdUwQwzkJfOON3YClw1w
         rXRlhRZlHoUEfQbIGzKEbXLs1z+1rW4mmGntCdrqMf+BMNTYuP/QSw42LBpnh1aeInPJ
         7U0LB+SRUvlhfw1Rx2bBJq/4b5KdTwGcYSirtf586ibY0Jux2uH3tCbBN4b5KPynPCdq
         HPUw==
X-Forwarded-Encrypted: i=1; AJvYcCVXgfFByy8ymKDvdewk+fbBgbyOQIFA1x3nDk+msnfSXjRU8ET4lZDGIRky/kGqrkrqaRiid2fbJnpX8c7scii2@lists.infradead.org
X-Gm-Message-State: AOJu0YzWe10yKc3k+raOQB3U/VxtL4stehKfvQLdMjo2DwOacxgU6GD4
	BT1hE/+CzbEh6S7jlNi0biJ2NMrhe5CTrh0tQZUJ62L62RS1NzA85uBuSyid8SA=
X-Gm-Gg: ASbGncv6rJY4n+CSTEqo8U7gq7npodgq21NxLQ7H3nxBuksy59GiTojRxL22G+ZxgOG
	C2VzJpBvWkP1ujndPwgz0TU4Ox42yZLdTE1RyE+X/Z+nTr11RSGJlVNmG9ILvz5maJB/zRwx945
	xnvSYilGyYxoz1hJLSVLjV0sRZH17xeGcckGS22bMXlNkiPpWPk95Z13MQ1im7PNDzBRZgic1Bx
	SCQghYfkOIRwBUXn8k660VX5aZ/Y7oTEKzFlb94EUFvo/pYntcw4mpyk2MDZ+J7U0b3l0ZrlHQM
	k01YY6M4jlgfzMahPElRud41JGRUvsva9XLevkmvjilOPQ==
X-Google-Smtp-Source: AGHT+IFaX5Xx465ynY+QBW+bAA7zOiG4EkIiD1sgmpBcYUZdAaaw8LwpWoTVpJIUbrMT2ZdTel9FfA==
X-Received: by 2002:a17:907:96ac:b0:ab7:5fcd:d4db with SMTP id a640c23a62f3a-abc09e321a0mr931418366b.9.1740639761342;
        Wed, 26 Feb 2025 23:02:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc5d5sm75582566b.63.2025.02.26.23.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:02:40 -0800 (PST)
Message-ID: <58a96f60-b748-493e-b935-649044c4a750@linaro.org>
Date: Thu, 27 Feb 2025 08:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC
 dependency)
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
 <Z7/+gXVFVzGadc4z@vaman>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z7/+gXVFVzGadc4z@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_230243_243405_24D02DA1 
X-CRM114-Status: GOOD (  18.53  )
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

On 27/02/2025 06:56, Vinod Koul wrote:
> Hi Krzysztof,
> 
> On 15-02-25, 10:41, Krzysztof Kozlowski wrote:
> 
> Can you revise the title to "phy: exynos5-usbdrd: dont depend on type-c"
> or something relevenant which describes the change rather than the
> Fix something!

Sure, it won't change the fact that we are fixing broken USB dependency.

> 
>> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
>> USB DRD PHY does not really depend on Type-C for these devices at all.
>> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
>> missing for exynos_defconfig and as result Exynos5422-based boards like
>> Hardkernel Odroid HC1 failed to probe USB.
>>
>> Drop incorrect dependency and rely on module to be reachable by the
>> compiler.
> 
> Changelog lgtm
> 
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Closes: https://krzk.eu/#/builders/21/builds/6139
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
>> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch for issue in linux-next
>> ---
>>  drivers/phy/samsung/Kconfig              | 1 -
>>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index 7fba571c0e2b..e2330b0894d6 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
> 
> So how would this dependency be sorted..?

That was a v1 and new versions are on the lists with simpler approach.

> 


Best regards,
Krzysztof

