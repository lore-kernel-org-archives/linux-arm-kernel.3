Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F660C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=; b=ztNK47XU7x5I2Bi9McZiU0s2mB
	qUcYn2lOR/An750Yru8ohpX0tL9eNDDpApBtN7v/DnY717bgyrzNzExmTFvABaKQkyLz4yv/KEHFT
	UUopE+QtMDsrtQ525e3XtT5kurPVDLxnK8rytaXHvSCRofReYknu7KHn9BMpNB0mxLRWwOE9/G5C/
	j1FFi644ZsKT7pPg881tcvBorTbd5d3W7sUH4uZeUrtpP2KvItevx9YxRTqudJbRBAxQmtq6vmEKX
	FU08G82E12/YUelnJ8V9CMy4MoDJ9h/u1Si5P58/MbX42UbYtfYSewIEj4x3xzZPnMaPbDdfws8bF
	6vAH/TvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNl3-00000008NLf-0Fdl;
	Wed, 25 Jun 2025 10:53:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLv-000000087TW-1SF9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=; b=Y4VRqLIFxMImYfxp4RR7BYLeJU
	KUGTt+UG7AHXdtf3zdbXcLyc0prWJ+ILvpHMC25GS+fMGrRokum/g/vjh+tRh7rxuDSIRsqYqwsAD
	re3K1j8TmJQ7+gEU3ZTSLRDz1BX23IksA0j56mTQmMm6VCs0obG5lzrRzVPkHQeUI7p8yAmd3rvMX
	3v3+xCZSPZ3Jrv6M4MULQZiPkmMV617XB5fGPaK6evVgBb+GMl97ll5T0REANh5tRhsbzrLit2wkL
	bWpfDpcn9TCj7i6tfUjz3PffB3VCuAjqmj5wxQVafl4OGpkruQ8dhx+dhatSaZURAbwz9IhFTy3zI
	E/AL7jDA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLq-00000005jNK-2wte
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so379675f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750843406; x=1751448206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=sr2LFAiFzqA4qEZi6yz4vOX5eGWJ9uZb9qdprzV1CuB6GFYCATHcSeSm8djwdaSPFh
         3GjOynYU0YDYG+/kXLpySwlm2rdKPdR0EBkAkK25CLvgi1v5wt18MoKwXKOz4IdOO/51
         KaUo6bICt7CtKGQvANNtb92A0pPUlOZhHPr9RRvMal/i1iuCz54tn3g8LW+vb87KxO6x
         0U1YV2kTG0m8iU8gJfm6ygGKdqcjg9fKH8uA4yFviDJAlla1NKVBeE27egfVxvlZa5fn
         9FK+sng6C8jMPiEJD+94JxeKNZSFg5zERggqZq0vwHSaGrVq0lGFnw8e5BZUMTzML9gy
         FZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843406; x=1751448206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=Raiycfj9ZR48fM/kftuTbWsaK9e6GGUv4uT2b4jOgfzbzGoDAtR2NfB8JYwO+zUabs
         cd9RwdJTqyMZxZ8YN15mmlpCb0L9vQXOyA5hMm7sBRXh6GCogG52uggo8DOHI/26WcOF
         wue6Zkd02z1kIkJYeEVQp15+H+dzETw0s8ZGAZgUiuAWRm+1bNuKGi6/ZQjtaeCy5N/R
         meMmdxtUG2ImLVn6hjaeIwyQt+uORZiPqYR8UsSx/MbWvW1xNAbTF93+IBdgx3W8ny2I
         C7rpYgyoHz23IdPIZh/yLk+rKOCmHN+00j5i4R2OVHDK+ZH3VOITSp72iQ13UzVhVmWk
         3YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaubMJ7wjl+U5cyF5XIYw2gZe8TJ+4Pk5ZtHSw8H86ZgM8cEv/6saw8InLqcQuob1r1JTALxcRJfQna1UZojze@lists.infradead.org
X-Gm-Message-State: AOJu0YzEGr15P2Rw99F1VWav90yvr9Y7alPxhRiQ2d2pvxzrGXGhYEfw
	UW3Fmwv1J3ebIu8N/QOX+mfeShZ0F8TQ6INMyqtIP1sXFpbWTSlrkKCdOPs8KX0Xhc8=
X-Gm-Gg: ASbGncvRBF2q7mk3wfK6jHb2DdmJB94nA40ndliSMIwFng920ZRzhWBcbIAEIlHtcKs
	Lan0Uf3AYHaA5NNmzPfnFqt4noQevwxr1wI8MuvR1xz56vVjqNKlMbHo3OQZWYYf7zrMWQFnzMq
	xClb3Yt7+0BFfDPTPDM3JANqIK19ND35478R/Iqfc7LYRwsR+cHxDZQ3M7bTXqTIjdyPzekEMVo
	Y5fQvd4r9WDUwT7aCgXj2jFztKon/O8cJa649J1Jv5VUlY0MSxJbfKde5tMnyth+x88s8fiCkyB
	XYfRDjgY+n1c/+YNbV4mw4apyOih6WuwNsyhPDPCtdWX/YJ7720SKgcgWbsi4cRImaDtJ9Ve6un
	oUK2EUb/OgkFYYf91t7ld9D0/JA==
X-Google-Smtp-Source: AGHT+IFk44C1BBZqTWRdY4hcFP7t75lLhumDHg3FOCEud/iYnem/WMPerbWTZalUliYOPa9RKBhJtw==
X-Received: by 2002:a05:6000:2081:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a6ecf52ab5mr1972437f8f.22.1750843405762;
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6e8113b00sm4163210f8f.96.2025.06.25.02.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Message-ID: <fdf70587-5960-4420-b1a4-4fc2f467fd06@linaro.org>
Date: Wed, 25 Jun 2025 11:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
 Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
 <aFqsqr7i7cdR5-I0@mai.linaro.org> <aFs4--JdpE1W3Lh8@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aFs4--JdpE1W3Lh8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_102330_852965_3CDFD7E7 
X-CRM114-Status: GOOD (  25.61  )
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


Hi Will,

sorry I missed to add you in Cc but the following proposal help in the 
module conversion:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/


On 25/06/2025 01:47, William McVicker wrote:
> On 06/24/2025, Daniel Lezcano wrote:
>> On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>
>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>> source for the arch_timer.
>>>
>>> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
>>> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Signed-off-by: Will McVicker <willmcvicker@google.com>
>>> ---
>>
>> ...
>>
>>> -static int __init mct_init_spi(struct device_node *np)
>>
>> __init_or_module
> 
> Thanks, I'll update in v5.
> 
>>
>>> +static int mct_init_spi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_SPI);
>>>   }
>>>   
>>> -static int __init mct_init_ppi(struct device_node *np)
>>> +static int mct_init_ppi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_PPI);
>>>   }
>>> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>
>> Are you sure this is not going to hurt the ARM platforms ? Here the
>> timer is enabled very early in the boot process while with this change
>> the timer will be available later.
> 
> I took a second look at the TIMER_OF_DECLARE() macro and FWICT the timer will
> only be enabled "very early" via timer_probe() if "MODULE" is not defined which
> is only defined when this specific driver is compiled as a module. Note, this
> "MODULE" define is not the same as the Kconfig option "CONFIG_MODULES".
> That is why in my v1 and v2 patch [1] I had:
> 
>   #ifdef MODULE
>     ...
>     module_platform_driver(exynos4_mct_driver);
>   #else
>     TIMER_OF_DECLARE(...)
>     TIMER_OF_DECLARE(...)
>   #endif
> 
> However, I dropped that since Saravana mentioned that we should not be using
> TIMER_OF_DECLARE() for drivers that can be modules. I don't have an ARM Exynos
> device to verify dropping TIMER_OF_DECLARE() is safe. So if you and Saravana
> agree, I can work on creating a patch to define TIMER_OF_DECLARE_MODULE() like
> you proposed in [2] to handle this for all the drivers that are used for both ARM and
> ARM64 SoCs.
> 
> Thanks,
> Will
> 
> [1] https://lore.kernel.org/all/6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org/
> [2] https://lore.kernel.org/all/f2f914aa-c554-4135-afaa-f075537ed929@linaro.org/
> 
> <snip>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

