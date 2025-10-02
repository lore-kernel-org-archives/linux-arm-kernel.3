Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LbxYgnEojJ93c8rsOWf/bBt3bhhAFbsmGgZt+eHULs=; b=VcZFnfnp2PdQJ+LB82ItIifdz+
	Y89Cy8iGOQVtYAub8iGH9vsQ+10XNE9zUKU8gWIx1ZuoNulx9kHz/4SOK79RuYtHVAiGqPyMGLp9m
	o0eMcJuUemNTEB2Cfu+o/jWaz2VMZvNALOn1LFD88hGF4uwViIXqThDfNHu51lEbHNsVjMSTQPbq6
	1HhpkG4GDrtlUmy1R7sRPrQ36gGtNdUhiPWo29JkL2hYib1VSQif0RKtjZdCY0aRADvKm5UuuRMay
	3o7gIhSJCy2jIlGvVKR9Y8DDsx7HAbiBPetvyCaBGFIjMWR3zjOkyaBH5QYNVKFBQca6SkK13GHqs
	uQARiYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M4n-0000000Aoe3-20Sl;
	Thu, 02 Oct 2025 16:22:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M4l-0000000AodH-012U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:22:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-27d3540a43fso10929635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422158; x=1760026958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LbxYgnEojJ93c8rsOWf/bBt3bhhAFbsmGgZt+eHULs=;
        b=GjylI+AZDgul1XZHHbs1d2S4pi6JFf7FayeZybOgt6iJD0JI5deh9o3gvbXLxGOw6M
         rVYTWoqpJxHWkV8uibREgIu2p+jdsjXs9lkiurVivaZodMCcOleybVkgx6mDIudIp5FM
         xiCVVrJqlTHikbLiIFX5VgaTnRN5nNUP9pPMiYgRUTkMLIX+CG36GLabs2zANQ5eLz28
         ixcHkNJpzZRBewPUqy1wRqMKwjUW3GwRlY6tYpvBZb5d4HzvGuDap/+y7fS6Iyx3hhxx
         cS25h+vBA9Vjc429qo0ghm9ntHx0IVNnuaaFjo8AuXmmiK2dsXE79TQ+gw+euseZhg5U
         8svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422158; x=1760026958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LbxYgnEojJ93c8rsOWf/bBt3bhhAFbsmGgZt+eHULs=;
        b=whYd/rys8FZwJswxyXkMMwhYnfz0oPt+S+gtIxjPlHIcyXYyuKVoxghEPNf8Y1hjnF
         PFNu4TMNq9jZ2NP0J9JqGVVuITiYk6GPqJ4ElEr7E6INgMeZpYECuJGUvJAMO+fscwYF
         mR1qcS1hfdnW0aIFm9SDgJt7LMn+TfS644nwnh8JehYG1h2ND8oW9E6Aq4/mG76x2hyb
         Zyseami/9zPmrVC3qkURUDYEYRItxxDKRjcTeT/PQX2EqUWID5MxplfH/m+1w1FeIoio
         D5wkrZl90zIoAlZDhwpKOyYf8f3MT4Lj674L5G06AqqiGsMihtwQP4OF+HT6ZYSjNYN2
         pnUg==
X-Forwarded-Encrypted: i=1; AJvYcCWbEM8X0G2j1lJiaacq4FYsTb/fy5YiuyLjvx0v+LhkCHeBVj44RNH9lSxqYG/kjXXCSdWDR2LqCNyd3WEKiePV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5csn965W6pXWc0SjbHQBH8PljvSmT8A3FOOjr+G8VaVT5ysJ/
	F9noaIE+yH3ium2K1YDAqh6Qd/CoUnnHJn1iJBTmsGt6trBFfIOE2X/JnQ+hamvZFn2kYypjkCb
	0w4hEhc1hYuE+e0hG6aJAz44XABUzRnc=
X-Gm-Gg: ASbGncvsp4k+L2rNQZ5nUkqtaMMKJ6mzhfi7Lfo/nO+21yj0me9KSKg3J7WpBWm4ZMo
	E/AuxlrbTIogX2GvyBshKMHpPjNaz3iwGVlQxTAFMusgkUFFTZvwS9RZRNn5/EVDHaNdbkFh4qj
	iGflGcO26aA/jXpfMu4diyZyvFbpllivC4Qb98xJMIhnXvHVXbsO2UOGMFU1CbCeO05wYsYDNyo
	8UyCAHdPMFK0k1g2v6PGe9ixwvMmWA=
X-Google-Smtp-Source: AGHT+IGRvLPIfPId+ThviLGcDguWvaiXYJhGL7lLP2ZYkgJ5H9fCJdaZmo7Lu2lqeUHQNIJJrKq42s7JgSMOk7shsiY=
X-Received: by 2002:a17:903:2ece:b0:275:81ca:2c5 with SMTP id
 d9443c01a7336-28e7f47a3f2mr86332225ad.59.1759422158111; Thu, 02 Oct 2025
 09:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:27:35 -0400
X-Gm-Features: AS18NWDLQ6hD1LnWbuZES13_YjRj4m-0ztzOfBvznDKgHuJ8g5udlLpfwGDslIY
Message-ID: <CALC8CXf+FJDcYLr4NwZMesa0kaPABw4j5Jy1bOU3XX7UJ1VcqA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_092239_042957_5E3CC536 
X-CRM114-Status: GOOD (  15.59  )
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

KRZYSZTOF KOZLOWSKI... So... Kyrgastani Polish guy?
Doesn't sound Russkie. Bet the ethnic Russians (Rysskiy) oppress your
ancestors. Who had to just TAKE IT. How does that make you feel?

On Tue, Aug 19, 2025 at 9:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space around '=3D' or '{'
> characters.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts b/a=
rch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> index 83d283cf6633..d425d9ee83db 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> @@ -218,7 +218,7 @@ &usb_otg {
>  &usbphy {
>         usb0_id_det-gpios =3D <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)=
>; /* PH4 */
>         usb0_vbus_det-gpios =3D <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_U=
P)>; /* PH5 */
> -       usb0_vbus-supply   =3D <&reg_usb0_vbus>;
> +       usb0_vbus-supply =3D <&reg_usb0_vbus>;
>         usb1_vbus-supply =3D <&reg_usb1_vbus>;
>         usb2_vbus-supply =3D <&reg_usb2_vbus>;
>         status =3D "okay";
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi b/arch/arm/=
boot/dts/allwinner/sun8i-q8-common.dtsi
> index 272584881bb2..a0f787581dd9 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
> @@ -82,7 +82,7 @@ &de {
>  };
>
>  &ehci0 {
> -       status  =3D "okay";
> +       status =3D "okay";
>  };
>
>  &mmc1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-r40.dtsi
> index fa162f7fa9f0..f0ed802a9d08 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> @@ -705,7 +705,7 @@ uart2_pi_pins: uart2-pi-pins {
>                         };
>
>                         /omit-if-no-ref/
> -                       uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins{
> +                       uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins {
>                                 pins =3D "PI16", "PI17";
>                                 function =3D "uart2";
>                         };
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/=
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> index 5143cb4e7b78..cb6292319f39 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -29,7 +29,7 @@ chosen {
>         clk_can0: clock-can0 {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
> -               clock-frequency  =3D <40000000>;
> +               clock-frequency =3D <40000000>;
>         };
>
>         gpio-keys {
> --
> 2.48.1
>
>

