Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FB7C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRBvgTHgZntCXNJBY5rtdZ4n3FATvNkFDQYn5xNJfuw=; b=zQ/V2kjs+KBzzL9QHbHQlidxKI
	Kxa4B7vNfCM+fWRXivwA1vHZ/LfvN5PpLacWqzUSMgZOuq49Mtb9DoPx0rKYzrzfM/HG8jD/kVRfV
	EBQVMxwx1I9VGmu7Oj4g3b5et6IHS/Yq7yQ9Yro0jkVAu36Otc5MiU5aiUzMJWZGaWtflALxUk7b/
	E26yljSbqZ3mOKkwbtVGd077URD0J9IvyEseRru2TJXJYM+3fLdHlurYnYI6u7Why25LOdS/ArQXU
	V1mxfnMtCTeoS/sLVd0+gsA42NiGeNBN0k0heL1Hzvj5ZM5JxKjVSQhOT24dlfkIf4/u6XAgRfvuG
	uM949wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH19d-00000009P03-3NMP;
	Mon, 19 May 2025 14:07:45 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH00V-00000009DfK-0two;
	Mon, 19 May 2025 12:54:16 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1038226241.2;
        Mon, 19 May 2025 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659252; x=1748264052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRBvgTHgZntCXNJBY5rtdZ4n3FATvNkFDQYn5xNJfuw=;
        b=TDtpPsS10pa07Nv7hWQCFxYDo889lz3qCEoO7flTFy+dk/+YMw3I1g++9NZHuBQ3Yd
         7GYekatPCrz+25IpJxBf98lCzWsetOBCZNQyhVT1dpyFTyy+cXnu+97qDNmD1mEX3kKo
         d9cM0Kcvthm01YslSZ4hGk0nCs/7l6GvABY3oK4GUOJrrThET68j9Eic8m7c8wTMbKnj
         4f6lWZEDTPFIVRTBWsz28TOGtjs1+FrvQCvfjG5Cz41xV5ro+Qoygwk1akuyDz8mp1rW
         uuHUG/+Hd5zCllQyAcdDi9mw/W4NC5MDAyW39SxZcL6+Ib/3X18Jqk5K6JAPrj1N6bo8
         ftzw==
X-Forwarded-Encrypted: i=1; AJvYcCVoAFOMbmrVRCLMtfZyd13S3Vw/4yT2fWZLNEcrRMq6D80gBvMv8EW3krkRlzQYfpWcC9KoNE3FeH7Bl+JK8jk=@lists.infradead.org, AJvYcCWIDg1g5enkBx59U/edBToLficIP4u3dtsZ11jpwl7LXq5qmMW5SUQgjLTEptNiljnLplQPQpEfQr1/ct7WP/nw@lists.infradead.org, AJvYcCXLbQ9pMajpiLCl9BypcYWuPJ51rhNwFVvwkR3xL0VfealS5pOuuq+1v1GmPItVmGSmi41Q9cMecXeJ+28=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZi+/zVG233LPuZMfSIWrsLOtnWSMTVXtIG76h7YRoK5h1TYOl
	8MwH/3hdMLj9eydoujTcmE8mhP+FkyH7k6WaO9eB041ZoxG1q6wauZEPRwJOu5KU
X-Gm-Gg: ASbGncsDxpTurbVBVZ4EX4sTBm0spkSWr+jC5t+N3UdkwlFDXkIKHENpbQ0cURK3Tm0
	Z94YmHm6agmf7kKDA26c+o/3mpXG3nrOfdK0HUNetjQKB5LGLIYOtyCW8N5YNHnREdp43qFixR4
	KjEj5uUANWsrElHfvj48E4FVjqpcImAqbQ2j1C6O8YG42wIJY8DY34LeFzEV5QH1k8PYJc6vR43
	OpPvPk3piu7khw9ZNINFaa+WRE/k1cKOWT0osBJyUyDhw9hVxng1VoXhM9f8wLofb4tB3iCxaEi
	FNs/U4ZxbXkqlQk3vehyGY322BXyteoDCLecEvBlduqNhOu8xgUzJ0PsPTorAxuqdwPgWm8cYLE
	b8EQE1n79NojeAQ==
X-Google-Smtp-Source: AGHT+IFaXbNDLlYcLP1pwxr7DH97DBlr5IyRrv4pD2XRtPVt9pyFnrYg+IImNpjMJjWDUpAF/qircA==
X-Received: by 2002:a05:6102:2c0f:b0:4c5:904d:f358 with SMTP id ada2fe7eead31-4dfa6c495a4mr12257888137.23.1747659252592;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e144511052sm5219269137.26.2025.05.19.05.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87bfd1499f0so448965241.0;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+QnKdat7eyT83sC5e2pKJUeDvfqYqeOx/ZM8sb46HbogoYKQvjJsPu/L4XzcCGYHrpbk8V2fuPb2hXEtI3H4N@lists.infradead.org, AJvYcCVEiKtCEjbtji+MuZoGaaixPMoCZzHHHnYWiSWXRPelCq+OriE6Wh1fkG2J7ApRXBsLR3iM5VHVkrZnMKs=@lists.infradead.org, AJvYcCVrhT/KJJpaiQrJWfg8Esegp6QswcQvdPOFqOxO9o8u+DTTv3rjGYtbDh/eRjU+IcslDmktVlpAyxaQiG/6/zI=@lists.infradead.org
X-Received: by 2002:a05:6102:50a4:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4dfa6c4654bmr11600429137.22.1747659251869; Mon, 19 May 2025
 05:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 14:54:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
X-Gm-Features: AX0GCFs8QnZ4h0I_0NgB8aYbEDIYXLj_xXnsltgGbg-TV1xw1OOT1Ne11-uflm8
Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	loongarch@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_055415_250273_AD2A3888 
X-CRM114-Status: GOOD (  21.13  )
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

Hi Wolfram,

On Mon, 19 May 2025 at 14:15, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.
>
> Based on linux-next as of 20250516. Build bots are happy. ARM patches
> depend on another cleanup series[1], the rest has no dependencies. I
> suggest that patches go via their subsystem trees.
>
> Tested on Calao USB boards using AT91 chipsets and a Renesas Lager board
> using R-Car H2.

Thanks for your series!

>   arm64: dts: exynos: use proper node names for GPIO based I2C busses
>   arm64: dts: mediatek: use proper node names for GPIO based I2C busses
>   ARM: dts: microchip: use proper node names for GPIO based I2C busses
>   ARM: dts: samsung: use proper node names for GPIO based I2C busses
>   ARM: dts: stm32: use proper node names for GPIO based I2C busses
>   LoongArch: dts: use proper node names for GPIO based I2C busses
>   riscv: dts: allwinner: use proper node names for GPIO based I2C busses

Hmmm... which of these changes affect the R-Car board? ;-)
Am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

