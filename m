Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EE4CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ujdLBAXhZY2AOY4FZZ6eP/3+PsXNveO7Mezvnen8AY=; b=nfhOTaM6j4MR9X2KcEqQRs+vGk
	AvAU0yC+BDIaiBcoS/LN/eAC4TyYk6Dk4yDkZKhLLogbwO8MaeAHkVqJO41fcGDSwa1mPh6vioIAR
	X7z1O/+c9M5K4T+olSw+kD9UVqOeulIK7KJ5miJuVndQowI5Vi7jMr9ZgAPOmS0b9WQiPSJGwb05x
	rOVBuDOoWwBxuQo9+tdG94YMgRTAO0CCn6E3wlNdOvnQkeszKBQK00LYl+kELfSpp2Y7bt4Q8Vg5C
	KvKm88bB2ABNyfgPFqhjmuPNQ7uPAS8vh4d7k1vJpz3uAQ5y5qvSESK++K9kCycD4f4g6NlsM8BFM
	t9t44kBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAtI-00000007hyd-1jWC;
	Sat, 01 Nov 2025 12:39:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAVC-00000007Rb7-2ybp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 12:14:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2698384978dso25957245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761999277; x=1762604077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ujdLBAXhZY2AOY4FZZ6eP/3+PsXNveO7Mezvnen8AY=;
        b=Z/PfysO3PYXH09lCSeeQl2JH7qxn/PY0cHcRF2GUQOPfI4sbo9z3O4twwaJFolEJPN
         cpsvS2SqKntzy5zYtiP9HyypYYvNjhZ0/2ttzH/WqS8+TJGcNbK8z2WRxrMTl5buG81d
         xWhIKrofXqoWiVW9u2Td7hVZzQBRqKb3i5ajNF447MT1ze6r9MZ+tLU1LNuXzmKOS87f
         TvZB1Ryaqx4jpab4X/CKpP915kY5Ruw5Vn2975RSuejF9/8vKMQ5SX1GI/H8CPSpFXdp
         SHoJiv/ceyyddcgzeRMP47gJFAsctn6zy0r0/5SZka2ZSh0MpNpHEBBITYxXlV4J+H5S
         b2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999277; x=1762604077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ujdLBAXhZY2AOY4FZZ6eP/3+PsXNveO7Mezvnen8AY=;
        b=D6I77FyMgYNT4vuPtQPMsirHwRNCfL2areb8G6F8FtOVSUU8FHQFFPTITh6suHokOV
         yW3j5tLX3OTLif51InGOLmnuvFBHFlOVrGbl/5Lj8A/cesGfgtS/XXG0S3VLZa92gK6S
         ljzmKhg0dsGRQSCvk3bhzi2AAR995rom9kUoy88zAwFLWJTd1P6v/gdpiTe1XV6vyOvB
         yLvbrV/NRpcgtIQq3736KI8VPItMZDLf2RwiBDh1AEw3uRvfxM6vqlZIVkP0GhL7wHNJ
         /8EiGgv92BmSN//qV30cZqylk5sH3GGw2P8hhNUK8pSrA1zkhRYL4mNBNUYgqnTMODU5
         n5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwSf0EUu3aDQF/6MrmE5GHuN2JDHFKtLX23StybC//8fO07trN8y+Hopyn0IKtgyC6O6fkxvXb1CDclhdjAmbD@lists.infradead.org
X-Gm-Message-State: AOJu0YynyBfiR/mZr2rNuSOhgw2joOr8JCkWRm/YzUmdhWku0Z5M9HWx
	W4vqxUxgYp/Ml0cSOW2p4s80fhKjmIsqVbpnoLRP5n3Egh2I99S8peI3
X-Gm-Gg: ASbGncvUvpXQGYnVFeQ00kJZ1B05XCkBW6S5g38UOQGBtE78gxReqe+ens1TgcN8dMk
	DvO7jyWJq9DxbSlchvL+vl/jE8Lmj2m7+sLOK96cS8M2uPUP4czxzrO/MqWTQoXeiAjNt579xYe
	yqbyIK/mtjn8Qnnce7jcmlglucY+VTruW0ML+sz9UZoSnicCGBX8mKiHq5zUVLT8hiB6+PyxnKC
	YGvUBY9oe5BejR69bhKokYrKfhCZJ7cZWlWBOo6Bl3OpAGY9eb0wWGhEfmYlm4tR91rCcnHZ9tI
	sXcQ2my5VuYdSf/7JcGiqINiGbreR0ikEMmkqzTEL+e7TyiVxAR+bm064G4YAj3gpanhhvv5uAu
	tEXQqLCMhZ4Hq/urF0OcedAYbaEu5EmHCYjl1qyY8JJnQNfCbGu45Ldfuw6SlNa4=
X-Google-Smtp-Source: AGHT+IEeRk+2DxXb5yHODDdJKSDxSfi10vJFhmh11HwS87jb+u5luDPpAWnpSEzbksr4arETIJtz8w==
X-Received: by 2002:a17:903:2343:b0:27e:ef35:2dbf with SMTP id d9443c01a7336-2951a55b4e1mr82703355ad.30.1761999276934;
        Sat, 01 Nov 2025 05:14:36 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2001:df0:a640:1::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952e9a3972sm49654205ad.46.2025.11.01.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:14:36 -0700 (PDT)
Message-ID: <3cba9996-228e-4086-99ba-4a2a00de57ab@gmail.com>
Date: Sat, 1 Nov 2025 20:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Grzegorz Sterniczuk <grzegorz@sternicz.uk>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
 <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com> <10751338.nUPlyArG6x@phil>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <10751338.nUPlyArG6x@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_051438_740575_99DD8B60 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Heiko,

On 2025/11/1 19:54, Heiko Stuebner wrote:
> Am Montag, 27. Oktober 2025, 18:34:25 Mitteleuropäische Normalzeit schrieb Tianling Shen:
>> + Jianfeng
>>
>> On 2025/10/20 12:44, Tianling Shen wrote:
>>> Hi Shawn,
>>>
>>> On 2025/10/20 9:53, Shawn Lin wrote:
>>>> Hi Tianling
>>>>
>>>> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
>>>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>>>
>>>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>>>>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>>>>> stable operation.
>>>>
>>>> May I ask you to test another patch I just posted to see if it fixes
>>>> your issue?
>>>>
>>>> https://patchwork.kernel.org/project/linux-mmc/
>>>> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
>>>
>>> Thank you for the patch! I will ask my friend to test it but he uses
>>> this board as a home router, so it may take a few days or weeks to
>>> report the result.
>>
>> Hi all, sorry for the late. My friend has tested this patch and it works
>> fine after 50 times dd operation. A big thanks to Shawn!
> 
> So I guess, we don't need the patch reducing the speed anymore, right?

Yes! ;)

Thanks,
Tianling.

> 
> 
> Thanks
> Heiko
> 
> 
>> And hi Jianfeng, I found you made a similiar patch[1] for the ROCK 5 ITX
>> board to lower down the mmc speed, could you please check if this patch
>> also fixes your issue?
>>
>> Thanks,
>> Tianling.
>>
>> 1.
>> https://lore.kernel.org/linux-rockchip/20250228143341.70244-1-liujianfeng1994@gmail.com/
>>
>>>
>>> Thanks,
>>> Tianling.
>>>
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/
>>>>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>>> index fafeabe9adf9..5f63f38f7326 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>>> @@ -717,8 +717,7 @@ &sdhci {
>>>>>        no-sd;
>>>>>        non-removable;
>>>>>        max-frequency = <200000000>;
>>>>> -    mmc-hs400-1_8v;
>>>>> -    mmc-hs400-enhanced-strobe;
>>>>> +    mmc-hs200-1_8v;
>>>>>        status = "okay";
>>>>>    };
>>>>
>>>
>>
>>
> 
> 
> 
> 


