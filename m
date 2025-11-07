Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875AECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 05:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wg2nGX6aFqXgThy+oqw3JxZb/E9R0bH2FID+9HWFig=; b=Kcfzj01ja3QcYL8XrQLRMSUQ6X
	ikX+lprosv41Q7Zn2cwl9FkHGON8YljUHkIc2gDZRdM0FPNpTAOIwIg+kIUNCGmc3+xtpoOd39dvj
	gsHEVfuZzYmlYi2aqXbXNP4SKWjvuf7MxioZ+x9ExU+I057PahBb/CCGX/WRgvwfTsrOHPg0js2ZO
	dXdCDW86750CP2vcOWSvvcwsm199aucHICmcIv3SSlStNSw61gGo3hXWfnQhrBgkMzUnaHKz9wXBz
	xDIV+oOmZiFUpfifImgPZzQdNa4/ipJcgkyCQHua2XcC8dTEW6z+KnpJbKP/TQROpOS+N/gnQ+Sde
	l4dgezpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFHk-0000000GhOF-0qmx;
	Fri, 07 Nov 2025 05:45:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFHg-0000000GhNQ-3SEy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 05:45:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so352830b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 21:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762494315; x=1763099115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6wg2nGX6aFqXgThy+oqw3JxZb/E9R0bH2FID+9HWFig=;
        b=B80bw4k9p0rEhAmXAtbBOhHXgAbWa9WsWcMtXQhhCqt0PZ7DFo7vKBRmxOSpnj8Hr2
         N6XAPDbL7tcGsRay4SO8+i3xN3TzwPb5v++4+rmEethYm4CDnT6GM0m5xytOlGG21USL
         nvJyWhexLgnOcbT+RTdlHSwLCc3eUO/6QkJCBvC7a6M1R/CxRjs1o2LK8FVvSePbbcK6
         ulv0dXSMNdvYOl34D+VskIXtLnidm+9U+ArLCyK0HlBXZvS8YgEtMh35qC4/aLkUJgSV
         sFSCbMW034qPsYWcdqo4vDEdQww2igOtmXyzuMcoQU7Yr2q0d+qKQ690KVcMhgST0bZj
         qIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762494315; x=1763099115;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wg2nGX6aFqXgThy+oqw3JxZb/E9R0bH2FID+9HWFig=;
        b=DvmiQ2BxKvcgKyuAm1il5XFzt0+sYWr0xWi30sqy5pAzS3hL0nOKkXuUvf9wAeOzSY
         Ti0NhhNMZFWOaXZjOJE84Y27OxHditvyq4P0yBmbH5XRpS3hmZNvp8g6p37oCpT3cOg1
         TMi35DHCPVt3kjsunhVrQbi1cedHObEck3AdHVVTqKvUpRPmJHtG4Akw5eyVaYzniGBt
         W/N3D8ufhHE3qth5dU/XTC2qbeXWPkkGVs7ocwTWkE81CcNQEjAD9sdM6PO8U9mOpj5i
         bgkK6pT/xFLUDqBL02HbpSIy/yd8n2/oFhLZrHYVMZib9y8Ubcf58z5TGLnjzEf5u8aT
         BPNA==
X-Forwarded-Encrypted: i=1; AJvYcCUxqVIiWMOROEfDYyJbD5ykJCDWTiDKITiXSZIw0aVfbLh9NRl6SZ5vJLBs3h98SYIicuEH75014RYIMiReI3Fh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq3YKtWqUiw5frDvJEFCit72uo/LwgjB9IuIttq+rieiiuS4/U
	wQbAQwUtx9+4fjuImKiu7CACntWkvjTJsQdioZs2RQKjIodxv/+VRPGB
X-Gm-Gg: ASbGncu++S1jaQezyYWkjINOxjP6ta2D2bJjmPWXJPtd19oWcbOy0ppQ77y1JkTYSDV
	zBvFklrIxoWlRopUuHh4aMo8PnPfS98el78oBRmPxCspelTw2wDjon+DUg0jbdDwDmdG9/xVCiE
	1rTlnbQ0jEEpKFBcw82NMRqFxc3quUcemozPC/Gx7xbILCAqLrga1AleNQ1NfArc0/hGoCxeKCY
	Yi208oj9AU4k/Nz93pqmErqx+09nhW+TF/q3z8LW9QMOJ4OFTQ+2DDIWk4+yALMQAGN8YjgRzha
	lbhVAU6sjhKAQLekqKmXe9DuybASI/D+paONYkHUTilqfIoGgD+KiwugEOTyzhCrcFNUbrNYQ2A
	GARm/Ma4x1wkSKmfOQaDrnKudKjW93wAGNfSCTivVbagYRnCcVxBoTAkndGStNPqA1lvCqzYIfk
	71H7dN8R+hLBc=
X-Google-Smtp-Source: AGHT+IFs4xmBPjKhQDx8H/zt+uSYsPDyhSy02Xe4cpEdlQuCbIIghOhw7URdzsSVFXk9IRU9NXmnRQ==
X-Received: by 2002:a05:6a00:b85:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-7b1482acf23mr748935b3a.1.1762494315321;
        Thu, 06 Nov 2025 21:45:15 -0800 (PST)
Received: from ehlo.thunderbird.net ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9635007sm1579193b3a.2.2025.11.06.21.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 21:45:14 -0800 (PST)
Date: Fri, 07 Nov 2025 13:45:10 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>
CC: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/3=5D_arm64=3A_dts=3A_rockchip=3A?=
 =?US-ASCII?Q?_Add_devicetree_for_the_9Tripod_X3568_v4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <3719039.iIbC2pHGDl@phil>
References: <20251103171702.1518730-1-coiaprant@gmail.com> <20251103171702.1518730-4-coiaprant@gmail.com> <3719039.iIbC2pHGDl@phil>
Message-ID: <8AD7010C-A0E9-4CF5-B66D-1E1A01CF0B43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_214516_875555_4B3F9A22 
X-CRM114-Status: GOOD (  15.04  )
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

On November 7, 2025 6:54:45 AM GMT+08:00, Heiko Stuebner <heiko@sntech=2Ede=
> wrote:
>Am Montag, 3=2E November 2025, 18:17:02 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Coia Prant:
>> The 9Tripod X3568 v4 is an RK3568-based SBC, just like the RK3568-EVB=
=2E
>> It always uses soldered connections between the X3568CV2/X3568CV3/X3568=
CV4 core board
>> and the X3568bv4 I/O board=2E
>>=20
>> The differences between the core boards
>> - PCB size, layout
>> - CPU (RKK3568B2/RK3568J)
>> - Memory type (DDR4/LPDDR4/LPDDR4X) and size
>> - eMMC size
>> - DSI/EDP resistor values
>> Although the components vary, they maintain full compatibility=2E
>>=20
>> The X3568 board has multiple hardware revisions, and we currently suppo=
rt v4 (I/O board)=2E
>>=20
>> Specification:
>> - SoC: RockChip RK3568 ARM64 (4 cores)
>> - eMMC: 16-128 GB
>> - RAM: 2-16 GB
>> - Power: DC 12V 2A
>> - Ethernet: 2x YT8521SC RGMII (10/100/1000 Mbps)
>> - Wireless radio: 802=2E11b/g/n/ac/ax dual-band
>> - LED:
>>   Power: AlwaysOn
>>   User: GPIO
>> - Button:
>>   VOL+: SARADC/0 <35k =C2=B5V>
>>   VOL-: SARADC/0 <450k =C2=B5V>
>>   Power/Reset: PMIC RK809
>> - CAN
>>   CAN/1: 4-pin (PH 2=2E0)
>> - PWM
>>   PWM/4: Backlight DSI/0 DSI/1
>>   PWM/7: IR Receiver [may not install]
>> - UART:
>>   UART/2: Debug TTL - 1500000 8N1 (1=2E25mm)
>>   UART/3: TTL (PH 2=2E0)
>>   UART/4: TTL (PH 2=2E0)
>>   UART/8: AP6275S Bluetooth
>>   UART/9: TTL (PH 2=2E0)
>> - I2C:
>>   I2C/0: PMIC RK809
>>   I2C/1: Touchscreen DSI/0 DSI/1
>>   I2C/4: Camera
>>   I2C/5: RTC@51 PCF8563
>> - I2S:
>>   I2S/0: miniHDMI Sound
>>   I2S/1: RK809 Audio Codec
>>   I2S/3: AP6275S Bluetooth Sound
>> - SDMMC:
>>   SDMMC/0: microSD (TF) slot
>>   SDMMC/2: AP6275S SDIO WiFi card
>> - Camera: 1x CSI
>> - Video: miniHDMI / DSI0 (MIPI/LVDS) / DSI1 (MIPI/EDP)
>> - Audio: miniHDMI / MIC on-board / Speaker / SPDIF / 3=2E5mm Headphones=
 / AP6275S Bluetooth
>> - USB:
>>   USB 2=2E0 HOST x2
>>   USB 2=2E0 HOST x3 (4-pin)
>>   USB 2=2E0 OTG x1 (shared with USB 3=2E0 OTG/HOST) [slot may not insta=
ll]
>>   USB 3=2E0 HOST x1
>>   USB 3=2E0 OTG/HOST x1
>> - SATA: 1x SATA 3=2E0 with Power/4-pin [slot may not install]
>> - PCIe: 1x PCIe 3=2E0 x2 (x4 connecter) [power/clock/slot may not insta=
ll]
>>=20
>> Link:
>> - https://appletsapi=2E52solution=2Ecom/media/X3568V4%E5%BC%80%E5%8F%91=
%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C=2Epdf
>> - https://blog=2Egov=2Ecooking/archives/research-ninetripod-x3568-v4-an=
d-flash=2Ehtml
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video=
-demo=2Edtso b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-d=
emo=2Edtso
>> new file mode 100644
>> index 000000000=2E=2Ee7fa1ca48
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo=
=2Edtso
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0-or-later OR MIT)
>> +
>> +// This is a sample reference, due to lack of hardware can not be test=
ed, at your own risk
>
>and I've also dropped the 2nd overlay now=2E
>Please only ever submit patches for stuff you have actually tested=2E
>
>We don't really add stuff with "use at your own risk" caveats ;-)
>
>
>Heiko
>
>

Okay=2E

I'll ask if anyone has a camera and a screen=2E
This part is extracted from the original equipment tree, and has been corr=
ected by reference to other board=2E

If I can find a test, I will submit a new patch=2E

Thanks!
Wish have a good day=2E

