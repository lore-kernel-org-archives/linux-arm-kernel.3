Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8F4CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=; b=JM9Ta9RZkGgwIbaaHsqvzB95tr
	KaN22eAmfg9oEs0Rpb1v3Rc1cbLbvlC+S9UkI3mx+qRCxBeSqvbG7HIlhIu4k9vrewKZdDS1GjWEV
	bE7aWV6mlQVhFgT5lCwWEyMe3FgCDUxQ9pxpCVgVdzK0iiOTkqeSm1n6X99lvCcomx2MUNWmBh2d0
	hAerLvnBt6lv3aVEZxamWrUtzVXpqCULafXzIVOB0haiNlmnISvRWqUoXs8yvBSLt8NILAyVmFBY4
	jFzJcLg/cRPlo/sww9+W6m4drQRQKdfe1hc+qjbeKf33dFwhl7drhF1W98Ouy/sGgXOWKQTpBpTHM
	DYu679Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs06-00000005o48-0FMp;
	Wed, 30 Sep 2026 10:57:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs05-00000005o3f-18Dy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=; b=fgEXwcjMaFMaPyJdDYWGAJk9KI
	Is/3EqbzKySppHUNjzgaLz4Q4FMYQ7Kqn2W29sGVsQ5Tua5DkjUFI0St6BSP4AI+En2bC3UBQeYa/
	FsWzygl9yjzA1gjijF428b1knfp1BH09GZ2gJ5/L7UrphnY+Hf68SnYN2IqGF3H5UBYnaq4dS4SF2
	E7uy5frZpDD8vIcnY8TZrYTtBIqNdIinnQ6xBjxEOjHkGv7a6DecC3jyj3rL2E67VcT7FkvZeKS5n
	5K+O3kAR4uVRheNbcYS3RuV2MTnKvPupW2Qbs2BZ9IO62a18iIBM3dngX0NIhqL6wPiUJk0LfCZoL
	l87+11Rg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBs02-00000003gje-2jH1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:57:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso116296f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765841; x=1791370641; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=pWry5h7KkiHp0q6ZAq6lQLii/Oa4w/DgyJhloczD0QLpESXfdoQMTB2OrzOu2irc2+
         +TkDNCJPbkEoO9dkA7T99vP4nPgAe5enSXR1Vi8s2wUcXz3AKhkZBXJisOl2n710YgIX
         1UY3hyPuxJMMTvkP+s6Euy+vr0aCjxZ0eggJQiI7QCq7ht4U5eYAoHVB1oEqxNP7HoPu
         x3fK9HPWFd3goTaIkLO8uLqPO6+FhjpfZ3CLbCAHtS7zkinFBmRT0rmYOkXEowfYHTB9
         XsEQaYo8uXiRRgprzyCMxI7RV8XRYFpIYKsLGE9NAiaCvzRN+Ps8Noqu0B01W+CLCgse
         EXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765841; x=1791370641;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=2ZKATiZaKek6wS3Yyn1GwDklVdslLfi/miR8334obVmG840QfydvbsrJjLU0Lu284J
         denjiuPeVPr0qskOu0edCWh3WexjgSgpmGMoD9dMCC2ozcr/pZSh2kKQ3MyCeqif56IR
         VKug5Fo4q9GS0ye3mksbzXWoWdLjeaqMFAVZSvRHGniTId5asKA72rkeJqcy58Rik6a+
         NtkyLyB3z4KrzB41VHXoMBb1hPsHjFH8l4hyfQisY0Ahi/K2W+9nt8NEq3BKcjoVvXMz
         trb8KgeuVdDyBblpaKJf2JP25Nt1DhsVNUlmkUVySHWMoABUE3JvuoOVxv3DTk2pgDjI
         qkCA==
X-Forwarded-Encrypted: i=1; AKwUvBw+w77YBiOrD5xpXAz09YX1zw21nXoConkxqd0Kj9c8dQ57tW5vjAxqeZnD0qBUJVwnE+FJi0xJ+ddMIKlDAUK1@lists.infradead.org
X-Gm-Message-State: AFq9FYIi45SiLR84GjqvrJt97gpN1ZLWKwncFNojnfByVZDytB7etfGi
	6spD/Uaf6aKA0wtlZQOsYUO0nrs6vY1EVhjN7R+c3rHs5qesRjJJs3qq
X-Gm-Gg: AYBFou3aIJMNUGMJ/sK4EQ/Zwh+FVjdTlqBghxbM5fMWiuy4XvnNESDiv2KNO72D9Ts
	8WmCyb3esUYEYZvWvnyTsOlJHmml/znKpzq2UqXf8y3431PaGgYxkgDRyw//Oh4vPd9W2ocphDZ
	h+it95mobIQ7IQdcf4aQa+bpwOgptXdMUZQvjFUU8+KEN6O84PbEoiXcf4sHoZVzOyXnjm/aPhq
	9ZV5KMwvAv/5qIYiYVoYRHXlRjGbP492WKoEKb4VTRLKQam5WpSxaT6OgMEAzGIuY3gYmpTFqF8
	qSvj4mayNtBLTiRsh+/wCUKyoNdjuoxkiZrs5q56txoxEus3u5p1VYdvoFTSrom42/RFXoNcUnI
	1mZwKlZoEQ2sNbOZfSGeOjXTmFJ0Qd/cnxvzQe+xTGn8650gCZgKcac9GZacy2uzPNlzGG8LUdk
	lHR0664D4bwM5TYb25iq32Qp4Kary3KDh+CbXi/rNCa7u5lO+JL2DyH7kNcgnZH/zcsrYmYFkLA
	e9szKv0IaL0Yq47J5uVjPsfFUXHkAseg5Y5e6i4RPs=
X-Received: by 2002:a05:6000:41cb:b0:488:8aa5:b4a1 with SMTP id ffacd0b85a97d-48b024b4a4emr2192936f8f.14.1790765840706;
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f3asm2695384f8f.1.2026.09.30.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
Date: Wed, 30 Sep 2026 13:57:17 +0300
Message-ID: <179076583795.3054628.14443934429806440798@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_115722_800757_E459C78F 
X-CRM114-Status: GOOD (  13.16  )
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

On 30/09/2026 12:20, Krzysztof Kozlowski wrote:
> How is it different from Cortina Gemini?

Apart from the vendor, they have little in common. Gemini (SL3516/
CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
controller and NAND controller are different blocks from the Gemini
ones. So it cannot share mach-gemini or its drivers.

>> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)	+= cortina
>
> Arch should be rather per entire family, not one SoC.

CS75xx is meant as the family (the vendor kernel covers the CS7522 and
CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
single part. Following Linus' suggestion of mach-goldengate, v2 will
use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.

Thanks,
Fil


