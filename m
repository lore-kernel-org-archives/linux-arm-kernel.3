Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A1CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl5p12U2uO9xfcN1YtAosyTJ9NoreSs1ECa/E0M81SM=; b=Ar00Z/Dpg18FLF9KU8o2Aa42E9
	v4dKw+CwZLAynHwCUKU9vSHWZlzfTZ/XwPe+21BoPmWv2LuotFn3iH/jBmp7D+VeotUL0TquaJkH0
	NsVn9rRxUPuxxNNcWXWnSiu5Aews/LY44wO3U3lCxM0Tgw859VMs4eV8jR1N8yTdpSHz404bM8hso
	r819IJBzDcb4J13wQn6fxCEMVbgu7XC9S+ndEEziSC6sU3B3B9gqfeHQlHpf6vdmBDtwTB6q2+Cyw
	XtPrWS1lJnk/HaQxRMSK/UDmZPE7rroCPUwJAswfnDvsK3EXwoCAjSE0bDjTfNYyYkLUN43lxQWLL
	jXTsq6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urz45-00000005oDF-1UdK;
	Fri, 29 Aug 2025 13:22:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwWg-00000005MHK-2Vsv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:40:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb731ca8eso309547766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756464008; x=1757068808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yl5p12U2uO9xfcN1YtAosyTJ9NoreSs1ECa/E0M81SM=;
        b=FwukjtS+Lmk11lqZGneGJe3ayS67mUCu08fFK6xIjaTKI5N6lC1PpyhKBX1pyouQwI
         R8wYGadXm1ABSUSKn/LyABmpV39yx+j3ajCXo2vK/FtnmpVFFbDxOePqdCrA2WXIoyjB
         hMJEic5KBokwUOSKn/LMPTD1I3U90FfEqgXP2vwbHHN4EXwCAH9zoaaDZuFXkAi19YiI
         xje3hM2/YgN7U4vBQ/2Y7+SAkDirb80lYfFzthQqgTc9cvUtHsDD0nNd360Zoab91pOB
         OnICs/6A/thm0ETetUDPBVVt8jjRO+9FpluZTFLotPjEDo5hmGSNs4VdqusZ0DsKh1s8
         f55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464008; x=1757068808;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl5p12U2uO9xfcN1YtAosyTJ9NoreSs1ECa/E0M81SM=;
        b=VrbKmNYssG9pPsST+H+whZJv7Sf9xVjJLkmUDen7lQb7dk29enQ0fgDWoC2AXo/7Ro
         4TNXhfMgpRzMswBKQ7447mtsh23xlEwI7GMLHPDZFLbjb0lb1H+FhH0+k+3AV3wRyz4C
         pYqcso8ryQnsslnHjMucokNlZcrs+p76ie/pucrFIrSv9od6cClqg4UynY0UJ+4ICdQA
         dc49mjntSAX2kFZv6nSL8+XMtrvHDqqiLL6CcZ9WmU7IVJ6Txj96plxQxr1sEAGLj+MA
         NuPWL9EYE9jKZYwjsLpaiYFX2bKjRA2GVwgVBtOu40aW2+TMNJOqDvNSP8zi379Qwnbc
         YDGw==
X-Forwarded-Encrypted: i=1; AJvYcCWE9LqPGG7J4m3/ddwzh76gFt8z6VW1oyROea/6VENBIrP0+iVdk9puAz6PhOyofZ+QrnUzYWdiswEjlAEuJ5Dm@lists.infradead.org
X-Gm-Message-State: AOJu0YzLOtc+V6HzOR9PluPjKC2ScHvfGXl9rOvS2vEeZuHyU5qcf8cM
	vQTq4sm7GHy7SfnhQwho2a/1L8YtPSAAQ9i50RNNflj2SAmOc7BZ91SocuCSnA==
X-Gm-Gg: ASbGncseG6GKOWGvfKjipZLlpN+T7BV9rky3p8TCd7f21yX/ibhd+UHBYs8Iab9NROK
	azISUH22jxtDCaDBstl8MboYELruf8pl388ImKR6x6zIiTxKUB3eDBUbZD+LCnDhk0qGJ39wlcb
	Z+jYZa10rsNqvCVNy6KxdCUMNJWWIdVbvoGLZGOjhA1NiDz6Ds1i4beme3ukWpEk3K4OCHqmLiR
	VkHXyPCwKF1xisVLspY/wlt0kc+gOg9lYCHslLUc1qO3uFD9WH6leYFB+tE3pu2ke5wi+bmkWMA
	hNKGEWidxm1CpSmmycBi+DpsjEOuKzwUixdqZ+WLDoKdQX66wWgJ8/o2Upk0gSxGAa7A5Q7N4pl
	JoMV0vX3CoM2ufBzpV1nzTu7QI2Htfz6UFlLNd+zjaF+ZFebWpNJkgtUmCgSU
X-Google-Smtp-Source: AGHT+IGTd5VpriOznSSUF78PDJ+lBThAc5tfiaPYhgxFnl96GsT4FoZv2KEHpZmkv5khcyAgJC1N0Q==
X-Received: by 2002:a17:907:3f9a:b0:afe:d21f:7af0 with SMTP id a640c23a62f3a-afed21f7e3cmr716079066b.14.1756464008284;
        Fri, 29 Aug 2025 03:40:08 -0700 (PDT)
Received: from [10.82.207.1] (212-39-89-51.ip.btc-net.bg. [212.39.89.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefc7ee8d2sm172652866b.20.2025.08.29.03.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 03:40:07 -0700 (PDT)
Message-ID: <31435f98-5701-4ae0-b822-11a99d1b2eef@gmail.com>
Date: Fri, 29 Aug 2025 13:40:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_034010_645126_F928A243 
X-CRM114-Status: GOOD (  20.91  )
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

On 8/15/25 10:04, Ivaylo Ivanov wrote:
> Hey, folks!
>
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
>
> About the naming convention for usi nodes, I've chosen to keep the
> downstream one instead of relabelling all to avoid confusion when
> cross-referencing the vendor DT and to keep consistency with clock
> names. They're labelled the same in the bootloader too.

BUMP - when is this going to get merged? I had a few other things
I wanted to upstream before merge cycle.

Best regards,
Ivaylo

>
> Best regards,
> Ivaylo
>
> Changes in v3:
> - drop the serial_0/1 patch
> - add r-b tags from Sam
> - increase the size of all syscon to 0x10000 and not 0x3000
> - change description of last patch to be more meaningful regarding the
> usiN and usiN_i2c mess
> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>
> Changes in v2:
> - add a patch that switches address and size cells to 1 in /soc
> - adjust all new nodes to define reg props with 2 cells in total instead of 4
>
> Ivaylo Ivanov (4):
>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>   arm64: dts: exynos2200: use 32-bit address space for /soc
>   arm64: dts: exynos2200: increase the size of all syscons
>   arm64: dts: exynos2200: define all usi nodes
>
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>  2 files changed, 1398 insertions(+), 37 deletions(-)
>


