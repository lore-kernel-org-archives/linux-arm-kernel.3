Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82426C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odi1efTWWEwIVG7IaIikJsL9BAzjMuppltEZzw/Hk9k=; b=KSPg6bVRLh+OLwTKsNqlHNuOVt
	o7wIOXwWngMw454nK764ccZgJ1eXcYKFvt7N5XQmc0zF5oJ63J0+0QO7DAuItLSF06mEWvlgnutxf
	1UGAc67A5rIingxo71/f1y+oE63OnCXgPCle1mUfO1NRc1azG2Ejpv9sOtjcVpml9tfILm2xKLYDf
	DDk+K3TkrhIei55WMQH0eijjuivwR/36tyTJqgXwV/tpKKhDxwpVPRA3YRFaELKaNg95UWqME7WTu
	b3+VKob5yutvxJR03HaNDvupVRLzqUkq/3jdq+GyiVRnw3st00dR+mE9rw18Qfyabud//xrT8jX5K
	+KOwxwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmAU-00000007m5X-2hCT;
	Sat, 22 Feb 2025 09:51:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm7h-00000007laE-0fNe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:48:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38f286b5281so1416634f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217715; x=1740822515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odi1efTWWEwIVG7IaIikJsL9BAzjMuppltEZzw/Hk9k=;
        b=bOiIR2lrl4e8VLS60+ttLbK1gKBZYymAK/+B8ZHvg+kyeOsbP8qu53YDW1e6yUOw5a
         E0VQ413MaVAg3emZMM9Y7Z2MCrpcBSFVsPvMkamqna0CtwOcpPSx6OL2YcivLHVpiOF0
         j9ttbipXOiAqIZrvq7LIcAXhAQOC9DpMtwm6x4RiyTYn4tnaNELv26KZljF0nb4Vj3eQ
         zfUBmKZf7pEN4oJKFWmEz8ltQPtqbX8edIAmNFN038bKOQmOx8aRxtSRljdMx/YEA27E
         cGvRY6U64p4w7j9YR89rmejIMzFtzPltCdVvsQeDl3oerKGQdZzhyYy9tLD383N6oSUN
         mNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217715; x=1740822515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odi1efTWWEwIVG7IaIikJsL9BAzjMuppltEZzw/Hk9k=;
        b=V14NjBAfGXi6T28zKFmLa8jHvkdMWAUEA6mgwrmfHUtIuduSsnO2uc/K4uABIDMXMe
         F1kwG4UhZf95BHW5LKX8rEWKdOht80im4ia9hsZveqgDl4URrcypMW6IaHYPc992yYdN
         J44Ve+QE+yi+b5lhDWSejeezTqSFZ07nWq73VHXEKp/vQSV9cC8C/ZoP3ddznRGUw4pT
         4a7FZCRj7Pnb6EzD6Ey3EWvuXlF+/DSBvU2ALOTn0dF/wU6kj9X7wGaduv/58927q3tT
         jr0TtESAsfNp0h4ovQMKEEBzcrg/XozLLvTbDv7SnP5UIWEK7yMrRoGn007p/fK4EgLI
         eeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+AjEfZVBLjM211K0NszKzoplJj9XkbSiVEDqZWaZDNZlmSjpPPQ0Rs26RrG/5YoGpIue1eMzTrnLE3Xuln/V8@lists.infradead.org
X-Gm-Message-State: AOJu0YywL6bw7FrBDxD7IZkYCywVdnO1gwK8ggGnJKXXXt0naXonFxG5
	HWCgIj5hE1ZnJ9jRJYRryGlWvk1tLBJOd1vmLjoECz1dSroMz3UQ
X-Gm-Gg: ASbGnctZTFO7ZOSyBIwPFB9BUgWhfDLqvhQOpA1++ok/Cre3Fetw1SFZx2yW8i2/QYh
	8rXHcesj6hYqNVAnu1I3Q+7eZv18gDYOuoLw7GjTfMBa7s98E4mbEU9+vWBq+SnBHXD3YsdRqYy
	7/TVWz8eCuYJkzybYiJqh3QEJ5kZpy10kvOioZcY5Qgb8sHzzPRZg++RbBEb6dPhPvbX/MP+eGU
	H0y+KzhPEe5MS8+FuPTkHWPtIsAZvqEoxDNDbTvz46MSh104QhI1AZIPn+Q+KqZVx2uo7tk+4pC
	pA50hJglbeNecq9piUz4ARJngl/vKJsKBYwRQ2FJtc34daC3yxAJiHe93vJLUZziwgwEJXA+n9a
	MTA==
X-Google-Smtp-Source: AGHT+IFUTa70+9kLfcm5J6KugqNrq5ylrSHEHWyLg2k4fxiZqzwuPYhX/x3EnpJl6rQ7Cmu+/YYJkw==
X-Received: by 2002:a05:6000:1f83:b0:38c:5bfa:a93d with SMTP id ffacd0b85a97d-38f70772c98mr5722741f8f.10.1740217715291;
        Sat, 22 Feb 2025 01:48:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25914171sm26137034f8f.53.2025.02.22.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:48:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 6/8] arm64: dts: allwinner: h616: add LCD,
 LVDS and PWM pins
Date: Sat, 22 Feb 2025 10:48:33 +0100
Message-ID: <4407188.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20250216092827.15444-7-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-7-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_014837_201224_F6931D1C 
X-CRM114-Status: GOOD (  15.09  )
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

Dne nedelja, 16. februar 2025 ob 10:27:13 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The Allwinner H616 (and its H618, H700 and T507 package variants with
> the same die) have 28 video output pins for RGB/SPI and LVDS display.
> These are in GPIO Bank D and are multiplexed.
>=20
> In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
> PD24-PD27 are for clock, DE, HSYNC and VSYNC, and PD28 is a PWM
> backlight control.
>=20
> In LVDS mode, pins PD0-PD9 are for LVDS0 and LVDS1, and can be
> configured by the H616 display engine for either one high-resolution
> (dual link) or two low resolution displays.
>=20
> Add device tree nodes for the LCD, LVDS0, LVDS1 and PWM pins.

Let's just drop PWM pins. PWM support is not yet implemented and it doesn't
fall into display themed patch anyway.

Best regards,
Jernej

>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [ryan@testtoast.com: add RGB, LVDS1 and PWM pin assignments]
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 242bac95840f8..806ad87705abc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -322,6 +322,32 @@ ir_rx_pin: ir-rx-pin {
>  				function =3D "ir_rx";
>  			};
> =20
> +			/omit-if-no-ref/
> +			lcd0_rgb888_pins: lcd0-rgb888-pins {
> +				pins =3D "PD0", "PD1", "PD2", "PD3",
> +				       "PD4", "PD5", "PD6", "PD7",
> +				       "PD8", "PD9", "PD10", "PD11",
> +				       "PD12", "PD13", "PD14", "PD15",
> +				       "PD16", "PD17", "PD18", "PD19",
> +				       "PD20", "PD21", "PD22", "PD23",
> +				       "PD24", "PD25", "PD26", "PD27";
> +				function =3D "lcd0";
> +			};
> +
> +			/omit-if-no-ref/
> +			lvds0_pins: lvds0-pins {
> +				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4",
> +				       "PD5", "PD6", "PD7", "PD8", "PD9";
> +				function =3D "lvds0";
> +			};
> +
> +			/omit-if-no-ref/
> +			lvds1_pins: lvds1-pins {
> +				pins =3D "PD10", "PD11", "PD12", "PD13", "PD14",
> +				       "PD15", "PD16", "PD17", "PD18", "PD19";
> +				function =3D "lvds1";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins =3D "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -348,6 +374,12 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
> =20
> +			/omit-if-no-ref/
> +			pwm0_pin: pwm0-pin {
> +				pins =3D "PD28";
> +				function =3D "pwm0";
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins =3D "PC0", "PC2", "PC4";
>=20





