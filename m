Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C795CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrrBuaV/kWzQy3h0bP5iIsIcB+cyHk6dwoM0ppsVeCg=; b=15dp5uOzSZVaHHmVr3dEgZwYTF
	GhxpfhX9I/gYmgt49p42p+i5dUJj4lyJtuDgjGXj7ogrxDrw2CxwgC4V5sqSVax/lgWbrdLHNOAL1
	jXkIDAlMzLfyh/YybcOy9eY88ZJ+1NRZrlJ40Pvj44eukH69J/kASgLA+5Ws0GZgxae3ceg2d1/Pc
	T7iuyzxzJx62ypRCwsYdNa3stxoaJw5ux9vJddb2o9IljY422NC5DTKPzwVDnJe8aV0Qk5KFpXB0b
	uq74Bz9aTvnhQhUm/tffHf+SjsCDiOTQmVEtFH6XKDy/y96j3tw2gdOA7itZWbIpxf4cx5nQ2tx0H
	JPpM1faQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSaT-0000000EcsM-1KQw;
	Mon, 27 Oct 2025 19:09:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSaP-0000000EcrE-3vP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:08:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4710683a644so42304555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761592136; x=1762196936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrrBuaV/kWzQy3h0bP5iIsIcB+cyHk6dwoM0ppsVeCg=;
        b=csF94MjvZ2bjHCBrJaawUDv/f83lC0zZp0Zf50acIlUs3mzu/FIv4zGHxKcIJLijWo
         GnX+Gs5J2Sg88oj5N96zdXaX3FOdRyCqu54D/ghrNVL9i9buqZxqBT1uweiTLS/uOk08
         L8lsujl+tW3pb+NnGyxfaq1yAvu9lYOopUnmbjpZEf8b51EBxWc+fi6akgegi6ArvM28
         onTovrL0vJVlw1d/jj/biKvgeYxQ77WA2u1RdL5Cc/prLMSbejXrCXmi8R985QWguyWr
         LWFSN2pNKaaDIW68T99v92NSvbqQRrsiay771yD1WD1X1vpe3iNKULh0LdzbBgfq/6ez
         yrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592136; x=1762196936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrrBuaV/kWzQy3h0bP5iIsIcB+cyHk6dwoM0ppsVeCg=;
        b=MVWkzmeqC1U7zwVYSaM+ykTfuyFbfVekXSn7VSAp1KRmvnaJcWoqicjFYoLHPhRxuX
         xXPQBBJe0JmHJ/p65DMnQSnqZjvidsyOE/sEtDV2FrLEaFfeMDr0j324s5+tE1Z4jKyi
         BUw902PoxVjOq6L8T5k0PSm/9vnbmCDsCQFram8apCHnBI0x7EOsFSv4vgbIj1o+ZBw7
         zAXZEOPVNDaDc1uBXXhoZR+Vt/Gyj4AImglUkJYfWwDzrA+uOE+50JqFxXd+MKj1qSrU
         zX6BsvrUm7b3ivnx8te/pWjPYVgDdL7q3RadtMdHYTzbCDLeYImLUystp0G+XrCjndA3
         gUMg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ep21YLPaN6ppm7RThI44uRN2BiTsYH2E6L6wkcNGd9UFjr9n9YFsKnuazIi6SFw7A9rWMBG6e8Fz3OMdyrUv@lists.infradead.org
X-Gm-Message-State: AOJu0YyXWQ6ZyiqyHQlA0pHX5y8Pe8RHGL8n5Fu3T1YlN/c+KpUV0N0X
	tt0xcYoIXBV/TxtR4zFJZrGWknQvt1e/f3nXVRdVLjfhZD6vwQlTZlRN
X-Gm-Gg: ASbGnctf/wH/SUB7WDOx3+v4uqFqQICf1I01pG/dbF92z+oEsGpy3NQasy8KIhbw1IG
	LnQwggHGkKqKXuCbYia01WJYD6JSd6AFkLpV3F3ihW8ZDAMkTXVpTGr9cscVeREKRgZoI8YznHH
	sYXT1tTjJHSDfrxQta0HMaOjNdVm8r1jcz3dbvahAxGUDJAXQmEfVxTHFtmTfkP5l9Hj5Rk8Xul
	i3Ra5UNVaIE8rdqbA63Nk7Mhub35rgh1jl+kIrE6m4lAfy+TrEVt5qLFbXvmvmmo73veIk2Rw94
	Sn0b0eGAf+9UfgjqYCrEgTPMkp2nNRvcPjkJVtqbN95MECODNW+i6NDSs8cIW6bZoSiGinUtDfV
	eFHk6x4fXWVLvqh4FPfPItpRHL83pv0UClQddg3pHbeLCoUCMHMnf7bFsE/cMl5TIUUdT+Padct
	ep4OWl+r5UWKKBCfcDsGGwhI7e8o6/eeOCZNwzHU1RP3UfQOP6CZ40AojMiWKNumo+bxvadknrP
	73+UdvUTVTrNoy+KWzd
X-Google-Smtp-Source: AGHT+IHQpujKOrXJVzT+iAH4rHZKqaP7yZUXY5b+4r1SO7Gypfz170ZMy3c7//TDLo+TKI0txclzNA==
X-Received: by 2002:a05:600c:871b:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-47718d7bfa0mr665135e9.7.1761592136000;
        Mon, 27 Oct 2025 12:08:56 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:1cb3:1c74:2f0b:e9ac? ([2a02:8010:6606:0:1cb3:1c74:2f0b:e9ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477184e4006sm2064515e9.5.2025.10.27.12.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 12:08:55 -0700 (PDT)
Message-ID: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com>
Date: Mon, 27 Oct 2025 19:08:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251026194858.92461-1-sigmaris@gmail.com>
 <CABjd4YxsfxwEbic8QEabX1h9j0B3DBw9LWwctJx7SzdvXZdDhA@mail.gmail.com>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <CABjd4YxsfxwEbic8QEabX1h9j0B3DBw9LWwctJx7SzdvXZdDhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120857_995221_74511E21 
X-CRM114-Status: GOOD (  20.48  )
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

On 27/10/2025 09:14, Alexey Charkov wrote:
> Hi Hugh,
> 
> On Mon, Oct 27, 2025 at 1:09 PM Hugh Cole-Baker <sigmaris@gmail.com> wrote:
>>
>> FriendlyELEC offers an optional heatsink and fan addon for the NanoPC-T6
>> and T6 LTS. Add an overlay which can be applied if the fan is fitted and
>> configures the fan as an active cooling device for the SoC package.
>>
>> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
>> ---
>> FriendlyELEC heatsink with fan addon:
>> https://www.friendlyelec.com/index.php?route=product/product&product_id=305
>> Vendor DT with trip points and PWM duty cycle values:
>> https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L75-L90

Hi Alexey,

> Is there any downside to enabling this unconditionally in the board
> .dts?

Only that it goes against the principle that the DT should describe the
hardware; the board .dts would describe a cooling device that doesn't
actually exist on the base board.

I guess then in theory, an OS might allow the SoC to reach undesirably high
temperatures if it's relying on the nonexistent fan to cool it down. But I
don't think this would be an issue on Linux, at least, in practice.

> Overlays require more user configuration, and not all
> bootloaders support them directly (e.g. systemd-boot users would
> struggle). Compiling with overlays enabled also makes .dtb's a lot
> larger due to added symbols information.

Nowadays (on Debian at least) using overlays is pretty easy, I'm using the
u-boot-menu package in Debian, I just copy the overlay(s) to /boot/dtbo/ and
it detects them automatically and adds them to extlinux.conf for u-boot to
apply.

Couldn't systemd-boot users just use rk3588-nanopc-t6-(lts-)with-fan.dtb as
their single DT to load, if it doesn't support applying overlays and they
want to use the fan addon?

FWIW, I haven't noticed any problems with having a larger .dtb (using mainline
U-Boot to load it) and several other RK3588 boards are also compiled with
symbols enabled already, and I haven't seen any issues reported with them.

Best regards,
Hugh

