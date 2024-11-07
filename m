Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A6D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJvjIBgWdRVHGu4BERauGlILYwLjHhOYN8wmcaPbpjw=; b=gTApm1qKgQzKdkBfn06NfvoHrh
	A4nxtedcI6OcMXNzodiOB5f4ImLTqIAwXZer2azmSsPo/jDECHPU5jhFWNbDsIllwYfYf9iLmJpBZ
	HeGd3W6GX67RkebwNl7CBwb7hKXhLa6BV1ZAauW4LLtuJoKCJIWfcilMeIC9Quwjr17+d3KZzvbKI
	dWxa4laHB0y6elBaHDuc2TR0kwUwQQshzx4M9Nk/TS0mlbT+BmWe+7an2GL8XzD9qZ9wiIYv6QzRt
	98bYq7D/hJttjeayKIP5mRAK03wsmLPQ7q43qpoWlflf/i57e0R0KOKs6bRgXFNiWslJ5MGpU1WIp
	tx6YHb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9559-00000007YaV-393u;
	Thu, 07 Nov 2024 16:10:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94y0-00000007X8E-0tEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:02:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso147106866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 08:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730995357; x=1731600157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJvjIBgWdRVHGu4BERauGlILYwLjHhOYN8wmcaPbpjw=;
        b=VaSJBKrGgC91qhhUv1Q24eLVCBMuvAAKYbN/CqIvRnY7dCh45WBdh5l9vnzkaJlbQH
         le5gnr6m63iCcrw3rozAVZrnwZacc64kXcVdaZFWxMZB3ZrU8gEaah3mba9vFMaT13et
         +Mt0WdhtU8SVc/xbhVGAdPPsiVra0yKFvod50Q5zesSL/BnUtnGaVxPQagbbbSSdKLvT
         O2DIuMIDT2O1xNr5ctkkOvHqy6xK8DhUeV/w94H7opD0Dw7cmvxy955SJ20cD0ZMoFAX
         JOv4OIbxHRi2J0+YqtFdd5lC1DAhQA5vTCbszI+9W+/C4qwQGZ/WpAyofFRfNwXz2DRC
         lTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995357; x=1731600157;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJvjIBgWdRVHGu4BERauGlILYwLjHhOYN8wmcaPbpjw=;
        b=iNWG7BdEGBPltnmAirgF7FZLAJgrWRtZErgDMhKlFtcy3wcvxDPXZ8aBaWEf1xlTzJ
         hQJ3A7yDiOt5LSbU6dw5L9jEZ1U+zJYdzvI5F/8GzhTsWIoBL0x81R+WKhHG529ecGeY
         uNdQPVtTshhsNENJcU5cFXJBBKG6Ffcr4XtMtUZPn5OXoFHUKtNlDjoVgg0ijF6F4mhv
         EYqBBDjgFbzW4IN543B9QVrEZ/Hc1Oy5F1dx8nclhwlHXz57a7Tjm9a8pCQ0LTi5aQ/8
         SwQeYLEmyj+x6o3eH5V1zXKMCI+dnofNhKzcpp5xdi2mXDwU72VG4e/RObwp1YMVkZE/
         7h0w==
X-Forwarded-Encrypted: i=1; AJvYcCUIA8XF7NW0yrXa59Fw0kLMRYEZ/omF2dXxsiVIJ7tHNw73M/4N/eq0rdqVKdRHQ+DlaA+R3TqmgePPJYjAOD2w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/QbGUQueR0EAKsRQJI+jzpJvR6ZSFovXLBiwNNfdQxk+a68Wv
	r2bGnx37FHzmKdbSW2xFonWPakl95lcRC5YsgPxB+IC8urgX75Xi
X-Google-Smtp-Source: AGHT+IFIPPiN4cxhxgS9k3tSd7lQ8QWj5rw6OUhe8AjJY3X7cg7WQ56GBHxgkVfInFoc7myICEPjJg==
X-Received: by 2002:a17:907:9413:b0:a9a:1f8:6c9b with SMTP id a640c23a62f3a-a9de5fe7455mr4423365066b.37.1730995355539;
        Thu, 07 Nov 2024 08:02:35 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c7asm108284566b.96.2024.11.07.08.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 08:02:34 -0800 (PST)
Message-ID: <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
Date: Thu, 7 Nov 2024 18:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
 <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Content-Language: en-US
In-Reply-To: <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080240_305488_98C3EE4C 
X-CRM114-Status: GOOD (  12.68  )
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




On 10/26/24 15:18, Ivaylo Ivanov wrote:
>
>
> On 10/26/24 15:12, Krzysztof Kozlowski wrote:
>> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>>> Hey folks,
>>>
>>> This patchset adds device tree nodes for multiple clock management unit
>>> blocks, MCT, SPI and UART for Exynos8895.
>>>
>>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>>> have been implemented in this series. Support for USIv1 and HSI2C will
>>> be added in the future.
>>>
>>> [...]
>> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.
> Alright, thanks for applying the rest!
>
> Best regards, Ivo.

Bump - now that the uart patches are merged, are you gonna merge the DT
changes after the merge window? If not, I can send a new patchset that
includes them and also adds PMU compatible node for the mongoose cores,
since that got merged with exynos9810.

Best regards, Ivo.

>
>> Applied, thanks!
>>
>> [1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
>>       https://git.kernel.org/krzk/linux/c/e54eb0465e548a7c6115e336ec5cfec04bbe8747
>> [2/5] arm64: dts: exynos8895: Add clock management unit nodes
>>       https://git.kernel.org/krzk/linux/c/fa986d1073805154888a788eda38d46a796346e8
>> [3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>>       https://git.kernel.org/krzk/linux/c/9ad6c3bd1bcbb73e2a5723e13b9d06e2296b07e4
>> [5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
>>       https://git.kernel.org/krzk/linux/c/a5541d737c8de71948bcdaee912bcb6b0781af7e
>>
>> Best regards,


