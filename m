Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA13D10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=; b=o6yPDbFQSDNgxGHLd4+NJbt2a9
	FT7F8eBQbM+MSMKPQvlQMd4sph4l0jiVdBEO3+XhRF8S41Z+mAr065kXl99XqGwCRW/zAoqna/hvU
	EdbdihV8f/S8Cgkh+DcZCh3a4+PK6XfLLxTuxqyR2Ihcb1cNfHLSnT9a5J0obsmjjU8r9nxSarFOZ
	Aashp5Vz9mvl4vBx4MsYRTX0YSuk6Fo1uZ9fEub1IamnqjgSCASykuULX3OOuvefgv4lO6+6j9tEW
	61DVSbfWgDJ1WhfME8F2B4lLMv63X6YLyedTM9w3vSJfFAAcloNndwf1+eWTL2Vg0FiACC6sj/J2Q
	5WGAouaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fUA-00000006Z0K-0TYq;
	Sat, 26 Oct 2024 12:01:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fSZ-00000006YtK-46UW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:00:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso423540066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729943998; x=1730548798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=;
        b=iYzd+ZodcQjcq9Qpqr0VFsAzP5KW+bR6naRwxiHyJ2p/GTPYRD7FJJ1rMfRgmDw0at
         /oHS62bgPPut7caknQCVnNHe2KIy0CmrN36jX1DyEY75amCp3RuXMjBFSCiaqRV/2MaS
         bAtm5YNQg751fP8IL4y7t8iah2bHy2UNDMV8wqgqcyOaZ0rvPwVA0PRu1E+we1fTFBsN
         d4RxmOj/ZWm+oi226MBkcM61SIXKxVB1fe3DL21U8hUpskaqEo20Dxyod/xgd7nABCdr
         P6sSGfnbIdQobrw1A/1rHXfkTLzVu7zMKxMcWrZavs0wLVLHIrtAqRGg7GOlH/DM2qBZ
         RQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729943998; x=1730548798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=;
        b=cAERGvmHuzkN7VQDBdZnWKi8YNDePWb5vM9xvOTAESxmdP2cgCGlF3CWt01moeufUk
         mG5MLXHQ/imHMIhnBqfVKml7XHI3cfUrFt59iclrZdeoxFm37wyr30Pp14mfZMd4axw/
         A4kKHJtpMYi7Mp59OZbhmabxHf4KATipyfOhI6tl17mjLUaRen9km4tMwLMFqI+1tijP
         mEJ/xMAqOqleBaXm6OSrzhIBCANc8a9bvHuLNk/2eb2styIM2NxGdjYPN6/PYWec7ePX
         vYmYORAefVLunHNuB0Vw6phUO/R4XPhKmTtJz3F0pPWVYATuf4ZYxTC9DJrIMxatbl2o
         kjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+y6skYh9pLUNAQOQRRcN56b+N5J1kuWfjjNQ/TylkdU9eRB4RSdpaRtF0ezPNzuUKclpaW1UcX+UG086GA1TV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ljRWOfk6btuDicJ7QbP+JWMtfxSimLXVJDwcZiY1VGhuxK3S
	0oj7poDJ+ldOn5iBWxqxFoXYOeXifFIotYMGtieS5DpuIvPm76gu
X-Google-Smtp-Source: AGHT+IETv0EHj3RY4NKxX4kQx37sy1UdTF3SyBHlZtuMNE+HoPSPWxbCv/DN5djcxSrl9V5JqeBi7A==
X-Received: by 2002:a17:907:86a6:b0:a99:f833:ca32 with SMTP id a640c23a62f3a-a9de5cea32amr184020166b.18.1729943997814;
        Sat, 26 Oct 2024 04:59:57 -0700 (PDT)
Received: from [192.168.1.102] ([94.131.202.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7d69sm168167066b.7.2024.10.26.04.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:59:57 -0700 (PDT)
Message-ID: <8e6810f2-366a-4c52-8406-79ea3970b530@gmail.com>
Date: Sat, 26 Oct 2024 14:59:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <8240d3b4-3367-4f13-a42f-0f40da08e371@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <8240d3b4-3367-4f13-a42f-0f40da08e371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_050000_051710_9EDAAC10 
X-CRM114-Status: GOOD (  15.33  )
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




On 10/26/24 14:53, Krzysztof Kozlowski wrote:
> On 23/10/2024 11:17, Ivaylo Ivanov wrote:
>> Hey folks,
>>
>> This patchset adds device tree nodes for multiple clock management unit
>> blocks, MCT, SPI and UART for Exynos8895.
>>
>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>> have been implemented in this series. Support for USIv1 and HSI2C will
>> be added in the future.
>>
>> This patchset is dependent on [1] and [2], which add driver support for
>> CMU and UART.
>>
>> [1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
> I cannot merge driver changes into DTS. Are you sure you have driver
> dependency?
>
>> [2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/
> I cannot merge this either. This is serial tree.
>
> Maybe you these are not really dependencies? What is here depending on
> what, specifically? What prevents me from applying it?

The specified patchsets add driver functionality, as well as bindings,
for serial and clocks. This patchset makes 8895's device tree a user
of them. I guess it's not really a dependency, as 8895 devices should
still function without the driver compatibles merged, but there's gonna
be missing bindings.

Best regards, Ivo.

> Best regards,
> Krzysztof
>


