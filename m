Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B21BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEjlvHcQp4lpZ1m36wlxzDAnqifTiWNPk+NjQID7RjI=; b=YayWI6vFz925niwJKIZEXt61Fs
	9eHS1T/6f1FNr1uLPFuW9+S3J26M5f10C44uZrU59SZ8TR7ybjQvVI3GE6Pd267hAev2zySuZtYau
	31t6E9Bt5NeEhI9x4Q+0J/DzHabZYDhrqVkDBdCudgbkvJ6QIo5sdGGPiLhZ0MorLOdiAEAe7kwc2
	dQXUtluWUAS4T5YBorYlccPQHXI3y8/XX1IeiWks4tJ/6kOv8GwqhYv+HwygqPVVgEx3fWgeRvGUd
	X6J3zErmG85cYbPCeu0hqwicPOvVb7BnjgIxBaX5YKqo6gQpL8s0LLyirzs2cInCjakpTK6wTMqd+
	0a83N/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDR76-0000000ERxB-3P90;
	Mon, 27 Oct 2025 17:34:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDR73-0000000ERwC-0h80
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:34:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-79af647cef2so4225830b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761586472; x=1762191272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEjlvHcQp4lpZ1m36wlxzDAnqifTiWNPk+NjQID7RjI=;
        b=NGKjxsJf5sYw7PoWJP+L1ZpnH8va2mSaqGU/6UqV1QRfuGD1NXv1/q6dU/GWRBubDs
         HdQfoU3XHjlOxBw+kfuxBglOWfNBoYBmaXJcdCeD8T2F2II9YpFCVXK1LNLvP3C3ESpw
         XXZEkN8vVe2/vz2IKflSyF3HugrqUl6ztuArsHZDEFQCk3R0fAGDsnfigIGEU5clgV+A
         1K6rzNgCQTTQ9u+D/BasYUZiowMw8SJ07wluA36Mm8EMudWPZcpsQuKyHwzyiV6wHEcY
         OmevlQhi/xyb8Qf02YNa/9YzToBiyLcWN5CwfwBqu2ngLD/G+vZhEs6F7dPAxjKMoJ2y
         EhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761586472; x=1762191272;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kEjlvHcQp4lpZ1m36wlxzDAnqifTiWNPk+NjQID7RjI=;
        b=IosfwO5zMPqTekeEkwh8p3bRaJCRgXD2NvYV/wKnRVilhFs64HwtNaQU1O3DwjjJbi
         rO4PUe1ZZZln5ruAbTxkiblnw+cd9jOqvZmSgwrHFxAF/OnvrywltAbJXEKXflIv1x19
         Z/1SbQI8dhwrwZu/zLO7TOeBpqGXiV/48UvNpj1hPNRj27Sara+NT8eJwTUm0NxfnyyC
         vXKVR7xcQkLeoxwh8uhVzUx0v6Vp/9Q/+0TkUDiFwpDKatHwK2v3NizDlbS1Hl//Okwi
         gDBZv3LWOby/+TjzHfktxwnMZ0qUVth2l++P9fs7kOSrhchwL/nzDwKfVqT2eQ3WP/pv
         cZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGIcGRRvIBt8g5DCyVKMTuCnBZtMtzhY7ZR6bQ285viwqZ447LrAS7CFD2/J0V6cophaWCfpDfpen/5IlrmY93@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03IXWxwErC528cT0mvAf2YKOgCHhJC7U8G4WiuqIuSottVanA
	tY2EHUB/MZNoc+jYQLZ2L2WZP17WGACvp3ICdQFW7LfMZjOLYy7EDe4t
X-Gm-Gg: ASbGnctd9JWpwBltl6rn1Z4oy8WzHs7+5NHh7FH/rWSCAglSLuuEUKXWipr9sVlm0oT
	Wn86aXlV+ujm0TRXvuH1j9oVQb3miDzeurgpvTY4MFGjmdxW4AOU8hVcs5DqqTpv09Psv+75rWr
	CXGcyeOWkYb1ipqPFwIh+phFWx1aBxKYGmpnzk2RdUmu5qNnjMjw9OR58X+G8Vt9/XF2Pre1ok+
	6J3kJpbPRT/pX9u5GsIHBD24S9kzbbFr8XfiJPWcFhL5urSkQHSugndDg23pH+ddgfuDEKxdPih
	wvnSnuLWX9FZ1TwjWDiZeVE3LCON/EUE5W7oCKiVZ7LEfcDTfUf+vCntF7RTuznYlG38weoP7IF
	O2shS9D/E5ibQ0tVGS4zCtbMzb+Aq67in9MDGwrlAItI9xFi+44mFvFd4iNrgBYdQtxzkVqHODP
	ohVQ==
X-Google-Smtp-Source: AGHT+IHAljstHcaoMHk/lLRlsppwJy/V1KHAMxtXlEIjZrVw2dfhWs2pVvM+g1XbMmpxHBsC5hDZxg==
X-Received: by 2002:a05:6a00:13a0:b0:7a2:8853:28f6 with SMTP id d2e1a72fcca58-7a441c476f3mr801487b3a.22.1761586471576;
        Mon, 27 Oct 2025 10:34:31 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2001:df0:a640:1::15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140a0d47sm8684282b3a.73.2025.10.27.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 10:34:31 -0700 (PDT)
Message-ID: <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com>
Date: Tue, 28 Oct 2025 01:34:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
From: Tianling Shen <cnsztl@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Dragan Simic
 <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jianfeng Liu <liujianfeng1994@gmail.com>
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <d70c0eb5-9aa2-47b1-8205-81b724180319@rock-chips.com>
 <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
In-Reply-To: <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_103433_213637_164A1321 
X-CRM114-Status: GOOD (  21.51  )
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

+ Jianfeng

On 2025/10/20 12:44, Tianling Shen wrote:
> Hi Shawn,
> 
> On 2025/10/20 9:53, Shawn Lin wrote:
>> Hi Tianling
>>
>> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>
>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>>> stable operation.
>>
>> May I ask you to test another patch I just posted to see if it fixes
>> your issue?
>>
>> https://patchwork.kernel.org/project/linux-mmc/ 
>> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
> 
> Thank you for the patch! I will ask my friend to test it but he uses 
> this board as a home router, so it may take a few days or weeks to 
> report the result.

Hi all, sorry for the late. My friend has tested this patch and it works 
fine after 50 times dd operation. A big thanks to Shawn!

And hi Jianfeng, I found you made a similiar patch[1] for the ROCK 5 ITX 
board to lower down the mmc speed, could you please check if this patch 
also fixes your issue?

Thanks,
Tianling.

1. 
https://lore.kernel.org/linux-rockchip/20250228143341.70244-1-liujianfeng1994@gmail.com/

> 
> Thanks,
> Tianling.
> 
>>
>>
>>>
>>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/ 
>>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> index fafeabe9adf9..5f63f38f7326 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> @@ -717,8 +717,7 @@ &sdhci {
>>>       no-sd;
>>>       non-removable;
>>>       max-frequency = <200000000>;
>>> -    mmc-hs400-1_8v;
>>> -    mmc-hs400-enhanced-strobe;
>>> +    mmc-hs200-1_8v;
>>>       status = "okay";
>>>   };
>>
> 


