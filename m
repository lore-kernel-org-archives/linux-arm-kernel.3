Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F92C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0/jrC7FZZ98ygzWU8GAHQggpQ/PREzbQQ0mhaLXRTE=; b=kj9+bkU+dUREwteQWx2CtfT+Z1
	C9On1mNXXtr+HHr5uxltTYOSQuBP4L+fL/GmO9f3EOdxBRIQPIbWQUzmXOCq575yfOzFID3WkhQZV
	950IJZWFic7BTh6lB0nPLJaNS5UgJqHdeYgY+kjTaAM2E3UJiSfA5xwy1H8lMUSTr3oy5uC875Zz7
	NBfV187wXzsEKFPJialjfl5hnPqiqIKik89hgA6L/AR2dB2drJ9jyU8zZSbT6DQoZaQGPVaqbmdG8
	ZGPON7+w6iqtWr3nF4LZXn7kz+qn2CtkLklrr8RtwNyfAeQlVN9LMagSLw5OOsJs41QMThc5PWIgR
	Ageuz+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PEo-00000006K5z-0yZQ;
	Wed, 09 Apr 2025 06:48:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P6V-00000006Ieu-1usn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 06:40:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913b539aabso3813036f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180805; x=1744785605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0/jrC7FZZ98ygzWU8GAHQggpQ/PREzbQQ0mhaLXRTE=;
        b=DXNnTgImyliXzXkHjlzMBbm0eFWkX4+fgbUkV9u4Wb/7luByWyELY95YwJ+aJ+rEhD
         sYthiPuRR7nyM/GpvNiuz1wEgSCpl6Jt2eia+qwRDi/eouYvaabLZ73Qs0UxXKkV2pC3
         JGiPXuC36ifNrMf+K96hL88kXoKplZlQeUwOwECDsd7JBD4uyiLAd2h6DPtyD1/tnEvm
         qGTPx24GxrmdYO19i2Fe9ELRLGuWwGpjtbu+tDOTgu+n1nUHYaqsTtBW4EIPkhXmnxgQ
         cJphr+PvTILnY53zRSq6yniN10lvWTNkXF36gqSKY8i8xxbN6qIbrUydgxPlzc2QrJ6f
         5G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180805; x=1744785605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0/jrC7FZZ98ygzWU8GAHQggpQ/PREzbQQ0mhaLXRTE=;
        b=mF/Y/k2VQ3MFhFA/1JcSh96O03Kag3ChqQsI/aNSzo+Xa3tKbGuhWJF+8k7VPcM1Ki
         YDoQsJ2nYSz0R1yaTY4BJvTvWGKW9fO+Oh8m8bb0KTkISE/Qh7qij9fXWIFdLwNm+d9V
         BjaakSdBETIS7uoiF5uBit+Nf6Y/ZcLQX7huGPzxXbMLriqTPSl83jvpEsjXA7dpyEb1
         gUdX5TcD2GNTGrbmt1ayrM3eub+cNgOu/qSGC75Y+HzBPJ7rWIrxxhKBo3Kfjy1jzTVT
         TPxh5XDr6BkN+qyJ96VKFuLNviFMkwnqdvRhhdlGl8OLP2Ger7CfUizf6fyN/Ix8TdNr
         bxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0O1stZcJtljJ0bWOnG1ulFdvgsxMOlaKw+mFuvynVcz5k2dV3Y9+iq/hbclCC/NYjvs/rQ1A0QzsIJxfpqq6h@lists.infradead.org
X-Gm-Message-State: AOJu0YxHs/HDR9EEw60Hq/VL/xXasVXLWK/IiwoxY3hJgAhKAhKQkkdx
	wDIvOrdq0xemB20sSn0jQP8p6yzWDwGgThaxQPFWpBRSvRGAJM8yBsHKfPnAbyM=
X-Gm-Gg: ASbGncua2VQkP5aC8J1/0k8lxTXpFIJ7juv/D4BtFmx4pJchgn7NozQKL1ydHgFy/fm
	bpkFp00EAUdrrFcyhBGzUZ5FraM5i40U73NDHy9hHfmYJ4Zq4134wE+KEzsz3Nn9BUhVofq85kP
	3/OVGm/zr1eBksbzbj36TLashsR7PDpKRwS5kWFmVzHIEh9Ot9Vld2YJbErfYn0OP8KpymvCee0
	WiSD7X+3m7pOvnnSjHIVC8JgeRdVs8FwB9BbJ1gu7aA9hPuPAu3GmmqSChZb+Qc0/wwzWBYXTbB
	YHAmaMZ9SXMk3yF4I5UBqALxVXA0Paw+uaOrd/sWMdjOVwMpPw==
X-Google-Smtp-Source: AGHT+IHCjOF2n7U6I7R2utWFFOdC4xw3Tp0UOai+Gccs70xrtthldzaitRhsqdFKtmXADIH6VPcoAQ==
X-Received: by 2002:a05:6000:2204:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39d885313bamr1150097f8f.14.1744180805462;
        Tue, 08 Apr 2025 23:40:05 -0700 (PDT)
Received: from [10.11.12.107] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8940e29csm661397f8f.101.2025.04.08.23.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 23:40:05 -0700 (PDT)
Message-ID: <76e3915a-e69c-4858-bc94-6eff64deeed5@linaro.org>
Date: Wed, 9 Apr 2025 07:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sama5d27_wlsom1_ek : Maximum QSPI frequency
To: Fabio Estevam <festevam@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, claudiu.beznea@tuxon.dev,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <CAOMZO5DyuMv7fQbTz33MvswfDKvpWsTCSX7FGJ4T7hkMsyX-Kg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAOMZO5DyuMv7fQbTz33MvswfDKvpWsTCSX7FGJ4T7hkMsyX-Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234007_499524_4C39A82F 
X-CRM114-Status: GOOD (  22.14  )
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



On 4/9/25 3:56 AM, Fabio Estevam wrote:
> Hi Tudor,

Hi, Fabio,

> 
> On a sama5d27_wlsom1_ek running 6.12 or today's linux-next the QSPI
> fails to probe:
> 
>  # dmesg | grep spi
>  spi-nor spi0.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff

It seems the read id operation fails.

>  # cat /proc/mtd
>  dev:    size   erasesize  name
>  #
> 
> If I revert your commit 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1:
> Set sst26vf064b SPI NOR flash at its maximum frequency") then the
> probe succeeds:
> 
>  # dmesg | grep spi
>  6 fixed-partitions partitions found on MTD device spi0
>  Creating 6 MTD partitions on "spi0":
>  # cat /proc/mtd
>  dev:    size   erasesize  name
>  mtd0: 00040000 00001000 "at91bootstrap"
>  mtd1: 000c0000 00001000 "bootloader"
>  mtd2: 00040000 00001000 "bootloader env redundant"
>  mtd3: 00040000 00001000 "bootloader env"
>  mtd4: 00080000 00001000 "device tree"
>  mtd5: 00600000 00001000 "kernel"
> 
> In U-Boot, the maximum sama5d27_wlsom1_ek SPI clock is 50MHz.
> 
> at91-sama5d2_xplained is populated with an N25Q128A QSPI that can be
> clocked up to 104MHz. However, its dts limits it to 80MHz.
> 
> at91-ama5d29_curiosity is also populated with an SST26VF064B QSPI
> and also restrict the maximum SPI clock to 80MHz.
> 
> Any suggestions?
> 

It's been a while since I did that patch, it was brought to life from
downstream by Nicolas, but I trust myself I tested it. I don't have
access easily to the board, but I can give some hints:

1/ for the jedec,spi-nor compatible one shall set the maximum frequency
supported by the flash. Then the SPI controller will get that and use
the min(flash-max-speed, controller-max-speed). Be aware that even if
104MHz is passed to the controller, because of the atmel-qspi internal
clock divider, you may set in the SPI controller a speed smaller than that.

My assumption is that 80 MHz was chosen for other boards because it was
close to what the internal clock divider can output. Even so,
jedec,spi-nor shall specify its maximum supported frequency, it
shouldn't care about what the controller uses in the end.

U-boot and 50 MHz is a mistake. 50MHz is the read SFDP (serial flash
discoverable parameters) jesd216 standard requirement, so maybe the
spi-max-freq = 50 MHz comes from there. All the flashes that I've seen
up to now support read SFDP at their max supported frequency. So what
linux and u-boot SPI NOR does is to issue read SFDP command at the
flash's max frequency. It worked fine. Ideally we shall introduce per
operation frequency, but nobody worked on that.

2/ I'd check the statements that I made in the commit message.
Flash's datasheet says that:
• High-Speed Clock Frequency:
- 2.7V-3.6V: 104 MHz maximum
- 2.3V-3.6V: 80 MHz maximum

Is the flash operated at 3.3V on wlsom1 ek as I mentioned?
Does increasing/decreasing of spi-cs-setup-ns help?

I rely on Nicolas for further investigation. Or maybe he can add someone
in cc that can help.

Cheers,
ta

