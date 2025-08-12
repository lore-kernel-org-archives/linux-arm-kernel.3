Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19674CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np+mETWK/wBLF8wyDZBrdyhOUjfjYt6Q61iq3OWGzGI=; b=rRYkI/qJFV9cZy9s3GzTZF63eR
	EQLrW+yfPIPEUQVh2GLG/n30hk3ulmNyiQQ92bgeDn/0p9Pl83MU8qHGuq1UD8/yvbxuvbSlbY11K
	w7+Nu2YObWbaTqqFfA0ZFVOOWupHVZid6sOGfp4iTwLnDeZY8kIJ39ZwTYJ4ULexQ8z+vMdWpzEbO
	GYHXYi/XuNEU69z5FknoBh1FCqzVIH6/Ak/CdKkOWWOkoiLmXR46HM9P3aTCeKGgNQvb+Kofcam4K
	apZ2yoDb3QsFrqj4xDwP6dDNdVy2cv5NLoiBEhQsx+1EIBnjJ6ODs7MrlLqVVvr94AmiJz4mglzD1
	sofPIGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgX-0000000BwwW-400i;
	Tue, 12 Aug 2025 20:33:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultRX-0000000BgcJ-32D3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:09:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso38624455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755022190; x=1755626990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np+mETWK/wBLF8wyDZBrdyhOUjfjYt6Q61iq3OWGzGI=;
        b=acmSw6BjXUw2sZzPUwrhwF0aH5GVEyid4Z0MsCR8YizHMGMoyRSUsSx5hHeAckPDu9
         TeWPG99hnm1ZZN0g4VvFDPEjDfe/nMh7jM8D7NF6G54x4IQM5OSfeTnEbnYj8LyYCZd4
         gQ506S21Z5JxM/sweSp0PVRtTUBABjLZ7p574EBwEYr1gq/UhgHerOpem6Gb+Bwj9n5t
         7bAQn5AVqdw6LH0b8RrEI3LyiHkBu2uNmqw0eUmq4jnBGZcTuUUUIqE0UxP/4l1GEP0N
         aOvHvSIt96RqqWuxlp2o8/gICWJxxbg16pcHCQWNPKP2HGaHFlVm/Yf89N9dOEJw80vb
         pLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022190; x=1755626990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np+mETWK/wBLF8wyDZBrdyhOUjfjYt6Q61iq3OWGzGI=;
        b=pPSP90zxa9En98VwRf1WxXwgmWifpfd9Z9u4sXiBXEfMdMeLyZdTqu0vIU1quj54yf
         Gcic7J+FdWpnhliv4DcmftHgGLyL+iJQnsWANs0WzVferb9ogfbKFgk6Qnh3pfoAl1K0
         2gpw52Hh1O3/+eN4Ya7KLNBm80meIpAzhC/3Oz3Kjx5RdvoTyNBdh6vTJk5BxkP6mWFu
         zwiZuCnqsBHf15wpxn7Rshz7TsayhZ2Q1WXRj3hPf2IY/9/MIizZiijTzZc+bo+Aqb8p
         ITWqXMfUhqrKW0WISDnRm6T5m9S5ZifZrTSaX9LQ2POGmC2/wXO7bLYfl7T4FikWichk
         o69g==
X-Forwarded-Encrypted: i=1; AJvYcCVqsNZWwoo1keZm61G8hOr0SEd3/qUgqito+0XWXcvS0Yodsolq9HYZG8tN4Zs8F9BhmQyCreTY1au1atdu7TlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzssiPn57ycJrET1gIs/ikMKjsJcP1nBA11JPe3QOIMYYRKhmnq
	r12VGrOCOqRku1xObayFB7tszQcTT23tkMSUiL4Md0pJQz7hImWWn8DHmv9qSQ==
X-Gm-Gg: ASbGnctCH4T9AxgGnnssZieLSPmcw54xeFiZrUkVv5QC3NflNSft7EO1PmmcYsI9g4z
	rcGESOX/aKLrNV4OKoypz5ABAUbg12nONJJUVqwRNRGIkvIndtBq4xKAOc+1gAFNhcd2Sl1VEJI
	x29kMGMtQvasx0R6gtD0zjrpbTIZKXl/TBF728ge+InjTsHy26SIKP8YuSPnRXZMTEfh2jQAS14
	62m9/nwfdYyIK1l/oI7h5ewEUTJ38maMSO9B219CqJKP9B149rD7w0IF38VVxsOtCEkm50usyWV
	mM9pSuVEIwXe7O2qyRJYO0XmVApHOdasFKAgdHvJEffg3Eo3KzXqgT36N3zoklz5+KhCbcXZ0wh
	VvMd9HM5B+aRUD8HvFqfbIuKc3JopQkLlvnOQntWAuJV05naQNVHEdEzavPtQgWX/vyRUAQDVrC
	OAo/jIhe1nHZLpUpBePw==
X-Google-Smtp-Source: AGHT+IHWtgRWErWP2CSUOwz7QQsptjEQby/FRSJDH+fOmtg9bVEzwZN4gkoyiwE022Ft/1p1KtLEdw==
X-Received: by 2002:a05:600c:4fca:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-45a165a62d6mr1107935e9.11.1755022189674;
        Tue, 12 Aug 2025 11:09:49 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db3048bdsm411212805e9.29.2025.08.12.11.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 11:09:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Date: Tue, 12 Aug 2025 20:09:47 +0200
Message-ID: <2242978.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250812175927.2199219-1-wens@kernel.org>
References: <20250812175927.2199219-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_110951_759942_F4770F35 
X-CRM114-Status: GOOD (  16.97  )
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

Dne torek, 12. avgust 2025 ob 19:59:27 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
> to GPIO pins on the SoC, and the green one is lit by default to serve as
> a power indicator. The red LED is wired to the M.2 slot.
>=20
> Add device nodes for the green and blue LEDs.
>=20
> A default "heartbeat" trigger is set for the green power LED, though in
> practice it might be better if it were inverted, i.e. lit most of the
> time.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index fce2b7d1ba3d..cb2a2b62a2b2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -6,6 +6,7 @@
>  #include "sun55i-a523.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> =20
>  / {
>  	model =3D "Radxa Cubie A5E";
> @@ -28,6 +29,24 @@ ext_osc32k: ext-osc32k-clk {
>  		clock-output-names =3D "ext_osc32k";
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		power-led {
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
> +			default-state =3D "on";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		use-led {
> +			function =3D LED_FUNCTION_ACTIVITY;
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			gpios =3D <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
> +		};
> +	};
> +
>  	reg_vcc5v: vcc5v {
>  		/* board wide 5V supply from the USB-C connector */
>  		compatible =3D "regulator-fixed";
>=20





