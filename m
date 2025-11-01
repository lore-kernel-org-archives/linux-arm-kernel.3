Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE480CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Upr6LEZod7UihSvIyoqPLtgSmSPBWGzOTDYSELD2Pls=; b=nYfH/zOCTwuS2Q4a7MfJQdW82s
	kOUsLooMLA5e6wxK+xyxrgO2prn095OVqat6TcnIARYp1ghnRNf5r/61dFmkVY/EwL9QGNPzekX5f
	3KW/Iy8U6JHyVwHonKdtaUAAi/A1Ll2b+fUNVtPP636VoqTJIEVJYBLi//gVUI7xEyuEoVmUnRmfz
	Ncx0Q51M0CTwnSU3L93eT0hqLN/RpG95duGYLYQ9bD8MYNdeAvQmxH5isF+AIh3h/aT8h/rUwtP5/
	n4fxkHU6jNSln0TgKpPWEsSOTNBxtiy7DHK6SWGDrUGYc0rckrZKYJLndLn2ab+mvJBuVheBBVMER
	Gos5bVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBRe-00000007lFx-1hih;
	Sat, 01 Nov 2025 13:15:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBRb-00000007lEy-1NSN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 13:15:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-429b72691b4so2847849f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762002897; x=1762607697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Upr6LEZod7UihSvIyoqPLtgSmSPBWGzOTDYSELD2Pls=;
        b=G6+7LZRwAzerrNP3iN/UU2r2xhvpsSO2j7kaoykkqMHC5r4DbZc1H7AboyAECl303V
         8mOqtOXTdS2qhIAsbfdZvx++4dZtQe/zNYwBGcjgS1mg3lszFREF5W+3LCSbgCTOlnTs
         aW60U9+v8u9nt12wWVMOkb7CXRIn60Y4/kHnQvWtVMxVj/8lAfIEOr0acgu5X1zNrBFG
         CthDV3X7k95PuOg5BbXO92TTkhmu1z9w63icNWERJ4hkaEXaPxDXS/wW4BZ0vilaGIPA
         PDAAA0fuxWjoXxFISd6ezth3uDXVdSnfDVnk6HthO3Wh1ct/t0dPLQ5qEURO4N9uI0it
         cn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762002897; x=1762607697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upr6LEZod7UihSvIyoqPLtgSmSPBWGzOTDYSELD2Pls=;
        b=Oe5Dfe2zt4kD/MktSXbM5a6ovuEMuoipEQC70B5juyiFZ//oca1QE14C5TM+JFqdxu
         ukFeiX0/V6vuuDhIX0l33AQ4Pb7buqJ9e6zCTE5qr36abjP2gyuRKXZ1AkETcKH4161p
         6HuXK8B854erbUIurzHOsTTTd5zY4/3B5VSHVBJLVkSzo4yWEKk8CMKR/HKoRJ6RfmFY
         KlZjPGfH36PaDdztRCvD9VZtDBb7ERElNWswaXzShZsveIsa+J8JZ38ou4uyF0XlM+qR
         Gsxf5xgIUk2t26biVJQN5ZdKyMGF12WEK3Kw1UN5te60wLMlfRSTbbxicUHfFFNTOgfL
         KdWA==
X-Forwarded-Encrypted: i=1; AJvYcCV/QjKvD6FPXi1BArMPTcK1Z7+x8NZJYP43toL2iKX6HhIs0bwn6NG38nUmG8OLSxKQuQl7wj00sNu1/1FwIYjC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tOTdyWsR1QCBYfJq9gpg+810I737kwo0aK3ZETMNuhvsO9sq
	WnPTSpWDJnJvcJTSY0mg/f8uVuYB+h5G+XzO22WrbLvakz1WZ659rOMv
X-Gm-Gg: ASbGncsGyB+/2vnP0DD3T+vWh0WAe3qmggrYxMsLkmgLTJencJVF7JaYC0Ja3eUglw9
	k/uuf+5se7AApfq0A6V21KwIS6jP7AiCwgFYPezqftDLk1Iek5zP7dqQPjmyN7/pP5vqiTyMyN0
	1Vv1CFpSH4ZErPub/ks991eW1ao0BST897ENIvXZIspRG03zZEvYACjQg921KqZFp5yMO4iE86X
	UqFJExao8US/qBLsfbAPSjayfON7j6JNcI2C/mYEtHiUUWqj1obMgZLjMnCtqpqvYpYLYvIbQge
	Biy4DKGi0qNwoBvQ9MDLmGaBq8aOphmrKP8b/GAaG3w5xm17tYgpTmKDDpjdMNUnRrB7QxHD9SF
	o+kHvrFZvJm2/Whqc/SWDlrXRtyvyof6Cosk/ig2YmuAZSfXYjd8guZx5PrTX87zluLt9mHstGC
	uDdinFpEDv/2MWazsryeKren1Lae+ZQFN7Lo+JRcZoo1AV6sB25YaqDiO+Jt1f2/6t+l5AIHw=
X-Google-Smtp-Source: AGHT+IG9TQlb1uL0biiWsjyFRLeVv/rKy56YQ2LqQbB7TDvmJ+cIF0BHCesuavP4Wddkzt7LbjMbtQ==
X-Received: by 2002:a5d:584b:0:b0:3ec:2529:b4e5 with SMTP id ffacd0b85a97d-429bd6aa4e9mr7024993f8f.38.1762002896422;
        Sat, 01 Nov 2025 06:14:56 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:4eb:d8a2:c0a2:24db? ([2a02:8010:6606:0:4eb:d8a2:c0a2:24db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e03d0sm9259512f8f.26.2025.11.01.06.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 06:14:55 -0700 (PDT)
Message-ID: <1a66cbba-41c3-425f-b830-efe4b83280f3@gmail.com>
Date: Sat, 1 Nov 2025 13:14:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
To: Heiko Stuebner <heiko@sntech.de>, Alexey Charkov <alchark@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org
References: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com>
 <CABjd4Yzfx-4xBHVB=W_r6nEdbwNJKdpHYB6bN3Xsk8dZOegJWw@mail.gmail.com>
 <2cfeeb0c-f7e0-b101-62c4-3b6eae40a30b@manjaro.org> <2246326.irdbgypaU6@phil>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <2246326.irdbgypaU6@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_061459_423570_9C3EF034 
X-CRM114-Status: GOOD (  38.47  )
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

On 01/11/2025 11:44, Heiko Stuebner wrote:
> Am Montag, 27. Oktober 2025, 22:15:05 Mitteleuropäische Normalzeit schrieb Dragan Simic:
>> Hello Alexey,
>>
>> On Monday, October 27, 2025 21:56 CET, Alexey Charkov <alchark@gmail.com> wrote:
>>> On Tue, Oct 28, 2025 at 12:02 AM Dragan Simic <dsimic@manjaro.org> wrote:
>>>> On Mon, Oct 27, 2025 at 7:08 PM Hugh Cole-Baker <sigmaris@gmail.com> wrote:
>>>>> On 27/10/2025 09:14, Alexey Charkov wrote:
>>>>>
>>>>>> Is there any downside to enabling this unconditionally in the board
>>>>>> .dts?
>>>>>
>>>>> Only that it goes against the principle that the DT should describe the
>>>>> hardware; the board .dts would describe a cooling device that doesn't
>>>>> actually exist on the base board.
>>>>
>>>> Having a separate DT overlay is perfectly fine if we want to
>>>> describe a board absolutely correctly: if the fan actually isn't
>>>> present, the operating system shouldn't be made to think it is
>>>> there, especially if there's no fan RPM feedback, which is the
>>>> case on almost all Rockchip boards that support a fan.
>>>>
>>>> Preventing the kernel from managing a non-existent fan might even
>>>> save some CPU cycles, ending up producing a bit less heat, which
>>>> can only help in passively cooled setups.
>>>
>>> Sounds like an overcomplication without real benefit. It's one thing
>>> with overlays for functionality that can be software-incompatible
>>> depending on whether an external attachment is connected or depending
>>> on the type of attachment connected. Here we are looking at a plain
>>> 2-pin fan which cannot be software incompatible to anything really
>>> (it's not like one could repurpose the fan connector for anything
>>> meaningful if a fan is not in use, and noone gets hurt if a PWM output
>>> is left running without load).
>>>
>>> The CPU cycles spent parsing a slightly larger DTB at boot are likely
>>> comparable to those spent activating a PWM output needlessly upon
>>> hitting the active cooling trip point, and both are negligible for any
>>> practical purpose.
>>
>> Hmm, right, I forgot for a moment that the PWM output is generated
>> by dedicated hardware, so not many CPU cycles would be wasted.
>>
>> BTW, with a fan PWM signal generated by a soft-GPIO output, much
>> more CPU cycles would've been saved by omitting the fan definition
>> if it isn't present, but that isn't the case here.
>>
>>>> However, the practice so far has been to describe the fans in the
>>>> main board dts files, if the board provides fan support, regardless
>>>> of the fan being present in a particular board setup or not.
>>>>
>>>>> I guess then in theory, an OS might allow the SoC to reach undesirably high
>>>>> temperatures if it's relying on the nonexistent fan to cool it down. But I
>>>>> don't think this would be an issue on Linux, at least, in practice.
>>>>
>>>> We're safe, a thermal runaway isn't going to happen when the fan is
>>>> defined in a board DT but actually isn't present.  Thermal CPU and
>>>> GPU throttling will prevent the overheating from happening.
>>>>
>>>>>> Overlays require more user configuration, and not all
>>>>>> bootloaders support them directly (e.g. systemd-boot users would
>>>>>> struggle). Compiling with overlays enabled also makes .dtb's a lot
>>>>>> larger due to added symbols information.
>>>>>
>>>>> Nowadays (on Debian at least) using overlays is pretty easy, I'm using the
>>>>> u-boot-menu package in Debian, I just copy the overlay(s) to /boot/dtbo/ and
>>>>> it detects them automatically and adds them to extlinux.conf for u-boot to
>>>>> apply.
>>>>>
>>>>> Couldn't systemd-boot users just use rk3588-nanopc-t6-(lts-)with-fan.dtb as
>>>>> their single DT to load, if it doesn't support applying overlays and they
>>>>> want to use the fan addon?
>>>
>>> Sure, but it's a manual configuration step, where otherwise the kernel
>>> would just default to the correct dtb for the board that the firmware
>>> told it about. The fan is not discoverable, so the firmware won't ever
>>> offer the "-with-fan" variant, meaning users would need to supply it
>>> manually in every instance.
>>
>> FWIW, the most user-friendly SBC family in the world, Raspberry
>> Pi, :) requires manual enabling of the fan on Raspberry Pi 4.
>> I haven't researched what's the background for that, perhaps the
>> need to keep the GPIO expansion header completely unoccupied by
>> default, because the fan attaches to the GPIO header, instead of
>> to some dedicated fan connector.
>>
>>>> Yes, that's an option.  However, that in general doesn't resolve
>>>> the issues arising from systemd-boot users wanting to apply more
>>>> than a single DT overlay.
>>>>
>>>>> FWIW, I haven't noticed any problems with having a larger .dtb (using mainline
>>>>> U-Boot to load it) and several other RK3588 boards are also compiled with
>>>>> symbols enabled already, and I haven't seen any issues reported with them.
>>>>
>>>> After thinking a bit about it, I'd support the extraction of fan
>>>> definitions into separate DT overlays.  As I wrote above already,
>>>> not managing the non-existent fan might actually help a bit with
>>>> passively cooled board setups, which is a good enough reason for
>>>> me to support separate DT overlays.
>>>
>>> Practical benefits sound far fetched here, while forcing users to
>>> manually configure something that would have otherwise just worked.
>>> Let's see what Heiko thinks.
> 
> Personally, I'm more on the less complication side.
> 
> I.e. if there is an actual fan-connector on the board we should describe
> it as such.
> 
> Overlays I see for things where you attach hats to generic pin headers
> to create specific functionality on top of a generic interface.
> 
> But if the board itself has an actual fan header, it should be described
> as such. Because that then _is_ the standard use of that.

The board does have a fan connector, just no fan by default. But anyway,
since it sounds like the preferred approach I'll send a v2 which puts the
fan into the base board .dts.

Dragan, you mentioned there's no need for more than 2 trip points - if
I remove the trip points between "SoC is warm, start fan at slow speed"
and "SoC is v. hot, run fan at full speed" is the OS/kernel expected to
interpolate between those 2 trip points (if you have a link to docs or
code about this it'd be interesting, I couldn't find anything in the
dt-bindings)?

Best regards, Hugh

