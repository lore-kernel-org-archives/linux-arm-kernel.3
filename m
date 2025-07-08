Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FBFC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I7U9ozTZ1bfuxyVJsfZXgas4qwfJlXMhYg9fodydFs=; b=bBfdOKC2kUpcJ2
	ngQmWiqqN0/WcXbPU2lvX6/q75mufkoYvMOWpSOy4eUbwyki0v6pn7GAdZhnwuDz/9B/xG/DO3vIw
	kzTt335/ynXN1oDj1+TEkCapQncNDKg3yOUMeODO98Rm8sGN7x+JBSnWTtkY0UrkIrzNGwYLEOimg
	qA3YNFy23b0bLVuQglGgilGolRUPMbG9Z9Yhr4ooQWdFWg9HpTv+MAfha9YQWtLOui0QxjU3xUbBi
	iJMnrOuI9DdzMClLf3uqqjDBqGB02RSwjy4Hl48K3n85wztKN5PnCS70H9Fxl8oFLQJw2wTnWlJIE
	5sKpuO9jbpA1A04dA/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBmn-000000063Xn-3kSn;
	Tue, 08 Jul 2025 17:07:17 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBIv-00000005zLy-1N5G;
	Tue, 08 Jul 2025 16:36:26 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b165c80cso4551747e87.2;
        Tue, 08 Jul 2025 09:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992578; x=1752597378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I7U9ozTZ1bfuxyVJsfZXgas4qwfJlXMhYg9fodydFs=;
        b=driEVBtuBiDKGHcREoC1VV52QBzN1nCTMp3OgoLMRWnarlF6JRDV0PwOftXXh0POy8
         VtRuYQQwR5Khh0+LcvMtNNlQKn0EW0H18au+fUdZXKaHCknhDr5eGJjQebS/Zdehcd4i
         qgDv/P8MNpAopF3ZD/uPXNh7i+rf5YoTyqMMVBXM/6NhbifpcUKsN1fYNrRrpshHL2+s
         9YAPHzRsEoKlx+U1MRFRaDfAetgks3ZzQGgBbarDWVZbbb98J12822LCDDfTSmouzYzR
         3P9fk6r9INQM2fsWx8O8XkAwpQ++G9ywqpheciRkRd7QL6P2jXwunVl/nkCeZJZEA+/H
         8zxA==
X-Forwarded-Encrypted: i=1; AJvYcCUJrErp+ztr3aG3Whq6k11UPke9RipOPQ1NEQhIL+U/V17ow8I9p0L3bhQR1RYoFvzxdnve7r9twanhTollD9km@lists.infradead.org, AJvYcCX1jWpS/zmcAXX59GsW1UMPiHVDYYd1O9wdgt+jm6teMo3so1Ao+oFkbb1Qj6RhkfqSvhu27uRo22AO4Lk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVniPBeNxNdyrNWFQPC2pnfmJySHLyLP/H7cqOOs9PrwMhYsJA
	H027Kz9AiMANXEKk/tuMiuLvk+waU+aYeuLao37F3/kmlzJBlMamF6PGHSnpUpUjx8g=
X-Gm-Gg: ASbGncs/fBGuh/p2pJpdlJjZQGG5vJjDJ7ea1PRwqfhdnntpEWUDQB0GNO7v+6eiW67
	EHCeb43XggfM4DNpzLqRGiBIyID6AbNGiR3jx/cilG+O3N1Y4reS/CwDek+Yisk5QqyXMOduQr1
	qQULYb2hE2jPTRIR4cv2V/S/yRP6O8vOda8wvRsMgcgnzHkkk0VO/Bxo8ATT5Urt293WhNLMjvX
	DwsH/zuPKnehD9l+EZxNfDe0Aus2UtU0xzqmPU0U4qsRU7le99RSffIdiJY/4X7wooSwHnX5A0J
	3nTH2hJanjKLzLrqnctI82Jzdc45NnhjxsDQqBgEjPftUz4/NPhMhO/MdUEix2qR5M92Jn2eCDS
	cPt4xp638Zvs6vXY9QTcCefjGl6g/OA==
X-Google-Smtp-Source: AGHT+IG8DBa+bshn/tlRsQGHd+u2GQO+sO13ysNN3Zrtha8uyWeNptzgxVvpX8sjuDhbnMrfDEu2qw==
X-Received: by 2002:a05:6512:3b91:b0:553:65bc:4250 with SMTP id 2adb3069b0e04-557f8353252mr1163869e87.27.1751992578184;
        Tue, 08 Jul 2025 09:36:18 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ba65csm1726057e87.204.2025.07.08.09.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:36:17 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32f1df5703aso24980261fa.3;
        Tue, 08 Jul 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4LwzyWom2ESZGY+dmE9nt2UvKt9iNw0nYDi5LwCQgJe15DXLAYSczyi12DiztdE9HvIxCBTHSdUmHJgU=@lists.infradead.org, AJvYcCVLY9eAmp0Y8UeyZ82oLqt014hLKeHF1o14bXZIZZfk49/UFfb5qBIFCf4HqLDI/Y1IMz03hSi/CT7J0fsmEHxM@lists.infradead.org
X-Received: by 2002:a2e:be11:0:b0:329:4bfa:9f5a with SMTP id
 38308e7fff4ca-32f39aa391dmr15595031fa.10.1751992576098; Tue, 08 Jul 2025
 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250707184420.275991-1-lukas.schmid@netcube.li> <20250707184420.275991-3-lukas.schmid@netcube.li>
In-Reply-To: <20250707184420.275991-3-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 00:36:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
X-Gm-Features: Ac12FXwC7-T3WWNdeROV3cwvshauCK_N_9KnHuUIE5o3NNtisH1pHGwgJnYBNjo
Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
 required by NetCube Systems Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_093625_364965_9ABA94CA 
X-CRM114-Status: GOOD (  13.02  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 8, 2025 at 8:35=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:
>
> Added the following pinctrl's used by the NetCube Systems Nagami SoM
>   * i2c2_pins
>   * i2c3_pins
>   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
>   * spi1_pins
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..8dc3deccb 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
>                                 function =3D "dsi";
>                         };
>
> +                       /omit-if-no-ref/
> +                       i2c2_pins: i2c2-pins {
> +                               pins =3D "PD20", "PD21";
> +                               function =3D "i2c2";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2c3_pins: i2c3-pins {
> +                               pins =3D "PG10", "PG11";
> +                               function =3D "i2c3";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_pins: i2s1-pins {
> +                               pins =3D "PG12", "PG13";
> +                               function =3D "i2s1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_din_pins: i2s1-din-pins {
> +                               pins =3D "PG14";
> +                               function =3D "i2s1_din";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_dout_pins: i2s1-dout-pins {
> +                               pins =3D "PG15";
> +                               function =3D "i2s1_dout";
> +                       };
> +
>                         /omit-if-no-ref/
>                         lcd_rgb666_pins: lcd-rgb666-pins {
>                                 pins =3D "PD0", "PD1", "PD2", "PD3", "PD4=
", "PD5",
> @@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
>                                 function =3D "spi0";
>                         };
>
> +                       /omit-if-no-ref/
> +                       spi1_pins: spi1-pins {
> +                               pins =3D "PD10", "PD11", "PD12", "PD13", =
"PD14", "PD15";

Could you split out the WP and HOLD pins as separate nodes. They aren't
strictly needed for SPI, and folks might have designs that use the two
pins for other purposes.


Thanks
ChenYu

> +                               function =3D "spi1";
> +                       };
> +
>                         /omit-if-no-ref/
>                         uart1_pg6_pins: uart1-pg6-pins {
>                                 pins =3D "PG6", "PG7";
> --
> 2.39.5
>
>
>

