Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A30C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T12VqVTqT9QY5bVVlcekdmYIYdB9sxvGnJLlTnRGMWs=; b=3QeDmsyxpNLBiJpM9DzkIoPoJQ
	/UIvQReLYouQmxTcsBhsNB55wPEI9IYz9W8beYpu+3TjMQChy8hSVKXpR9Lfk1iiQpci5y1EQ/3+v
	AT9zOJCnxXPZZaxq1gB3Qvcwykzu3sK3sUZ6F6wtNYIGSJ+jXcqA8o2o1fqNTL2a/WeQX2Lru78zf
	hcDaSdQqTxQ6NyZPbr3n7rJIcrnYh7cFKqVup8kZIITkjWfGx638xu/KQdXHTYRgkFEO2FlDbY++E
	KIVZR4l6fvw2TRFGz1IfnmetsmoVg8ZUJVu+18RwrZz4Yu04WkTSYGGOjsFoIJIqFQdnCCeRUhoQr
	E8a1RFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhowV-00000005xgg-0ynT;
	Fri, 01 Aug 2025 12:32:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoc2-00000005ipr-0Pkh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:11:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so8380575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754050308; x=1754655108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T12VqVTqT9QY5bVVlcekdmYIYdB9sxvGnJLlTnRGMWs=;
        b=ecIgbzg2TPO8CVjMUEUP2UaSfRGpS2Dp7hlwH61M5e4BDN4jDCIhQ8d43mP4VgrHWG
         LI3a+1I63rfHNRf+3rU+naTBF47VaK82YEF6nytlfPSL7X+dQc2k5qzPQk5ifdVeOK7O
         10Bq6/2lIQKtNbtxlYQ+7tOS+ekavpHoEHCnRcDkuz/Q58bb+bTisXcE0elLPD1uYe75
         kPPVRuZEDRwFxLeIRCxgkXrbqo9p7ie7zIaxid0nCsRkfbuRT9yQJV9IG/TblvM8zLKJ
         hE6lwpbLCm+bVuXYhbPvco8eNFKUIhfVfk+8R9loGHnn5FHRhL4VA/4jjm/BJvpSK4dz
         yFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754050308; x=1754655108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T12VqVTqT9QY5bVVlcekdmYIYdB9sxvGnJLlTnRGMWs=;
        b=Njaa1Y0yMm/feFEiGwnXqx/WvAz/RnH0KI5I4t+9egXf/R3dwcWTnCopTwPpZKfoBq
         f4uhD+xJaEOdRfnMaqYNPH2NK/4GeZxrpYPxkoD2kM8TybEWqn9MeJiU12f7ZE3ujkkd
         J/gdcggxexBelCUcifY5xyufsu8yYzZMZr1cinv3UKaiTrdtgRC9D6mAHRkHYRkZ9hXY
         I09oHaHaLhfMEtW/ZygEHL2EVWye5HJfRJ2S/Kk4ckJ0GN3cj4iU3TZyGyM4ZeNiKCec
         X7zaPwREa6eCCjlVc3bqF0bgzr5VwV1AnH9TtYyd5G4dG/saHNtP4oqr738rFI8UUVqR
         iMrA==
X-Forwarded-Encrypted: i=1; AJvYcCUMNGbBzmIyxKrFyS4lSWHDNFFy9UOzKW/e1cOLnVM1c6COt51SJ+QpSzQwSWMmVTld8LNdKL/ut46lgbqLRwPO@lists.infradead.org
X-Gm-Message-State: AOJu0YwepG8Jm9gCu4uwVPQMk33tyfmG7IrswtKEeSR1iWDsiksZy1wX
	x+6pIZSUhamma7Bu5QFrIorO/Brnv1VC6+Lgl7rz/nchvyvtm9EYhfqn
X-Gm-Gg: ASbGncsikCLXkWVEeizKfDCxBKwuXMwGszO7yu9+eOdLeUfm1zOgn4vc6HMm0GlMqLE
	MMQrkde/ZiQUaUmJs2OXOVqoOxxJ0TOuDz2hp8DwdxXWinnp0YGyBWNzd5dLTm+7ziF7MJ5AX8P
	x/u4dV8V6a7Quv/Qsat7zSJ0RwCtPafz1l9uhDxKtjUY0oGzjloTMnd4L4wQ95G3+aMVmHWpuMb
	sy83HexI7eyPTcMgh9o32Rtx4lODGwFx5RfqGj2rRxW/gfaLCzds9CJ1bM6x5YfTcrGOpLYG3NX
	av1Tv2LRwT3qmv/EWcB34k7z7GVf/fh6d+pDhVsFxk3Up5BDtq51TV/Y3eWr+l/jHO/zu3dRtqz
	/eRxZCQvLCvjwd1hZysVGTOiyEvVdTWTcwY8zTX2LqxKvvPBzwZ8J0BLP6gEo
X-Google-Smtp-Source: AGHT+IFvST29zGsk85DMEnhGey+/+aFmHxqKGQr+Apz5n2YWFAlf/V3qjSSG5bEiZMA7xIBl8huCNw==
X-Received: by 2002:a05:600c:3ba1:b0:456:1fd9:c8f0 with SMTP id 5b1f17b1804b1-45892b947c9mr122493875e9.2.1754050307932;
        Fri, 01 Aug 2025 05:11:47 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458a22365c0sm62954395e9.3.2025.08.01.05.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:11:47 -0700 (PDT)
Message-ID: <8bc1a3c6-b7e0-4256-93ef-57b7b6a41d94@gmail.com>
Date: Fri, 1 Aug 2025 15:11:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
 <3894475.kQq0lBPeGt@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3894475.kQq0lBPeGt@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_051150_148630_1124AA38 
X-CRM114-Status: GOOD (  15.50  )
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



On 7/8/2025 8:42 AM, Alexander Stein wrote:
> Hi,
>
> Am Dienstag, 8. Juli 2025, 01:46:28 CEST schrieb Laurentiu Mihalcea:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
>> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 739b19302865..4d7a60444bf5 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -262,6 +262,7 @@ CONFIG_GOOGLE_FIRMWARE=y
>>  CONFIG_GOOGLE_CBMEM=m
>>  CONFIG_GOOGLE_COREBOOT_TABLE=m
>>  CONFIG_EFI_CAPSULE_LOADER=y
>> +CONFIG_IMX_AIPSTZ=y
> Why not =m?

well, the thought process here was that since the audio block control driver (i.e.: clk-imx8mp-audiomix.c)
is compiled as built-in (CONFIG_CLK_IMX8MP=y) we'd want to have the bridge as built-in too so as to not
defer the probe of the clock provider and its consumers (in case there's any compiled as built-in).

however, the bridge driver could have just as well been compiled as a module so any of the two approaches
is fine with me.

>
> Best regards
> Alexander
>
>>  CONFIG_IMX_SCU=y
>>  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
>>  CONFIG_QCOM_QSEECOM=y
>>
>


