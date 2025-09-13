Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB2CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4M9q1sBtoJdbch2HX+0f+gEgUbmufQuxtOpAtokmLRw=; b=MBP/UpaWY59i2M
	QCgDa3UPTaK6piv6dYTIOF27pGvrP2VZanipxHgwGiTdO7OB2I91f1XD1oMoERqwKbkgVju2b8nqY
	/8JiU9R1Jc7uRIJdlFmEG5HXUUo4yt9rVqc6ygk+riSyRlOTw4UciGG9wkiYchBw5P3taEgG4K56P
	CRu5FjEKTsLGy0K13/oUGDxCgx/XYlPGp2Iz1EQDm2mts9tfqPV8JDgsFb3zljFg5dmUFlPbedqRB
	UZXS3Z1GNNEGKtP/AqqqphFk2mvFBaFz/24g1wplSL47xi1MiNL7y0lTqz4tfs9CpMZNBBLAuyMBh
	p2gYDb3hA+2PxQpEaWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMG6-0000000E2DF-0bsQ;
	Sat, 13 Sep 2025 09:09:26 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMG3-0000000E2B8-34nO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:09:24 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-571a58b385aso1232899e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757754559; x=1758359359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4M9q1sBtoJdbch2HX+0f+gEgUbmufQuxtOpAtokmLRw=;
        b=dnXJuuhKjqH3w58WhYWhY3nE19TyLhvSedZbvx3bryV5yY36+cO0TI/EawE4WeuNPR
         gwOjawoqIW3jV3llogn7AfvcydBjI0BTiPCSeRHHWqmP7yeAxv6C3O9vQPbn49L7A0Mm
         2P9vSfS4VBr5Yo49sfbyc097yUbbBQuGwFwJhxx5+UAwtizbNW6J9+u/v48d8BRKjZQ0
         HfGeWDwWhCEWyQU5WkckgeuW36vX90rmBhCmZ+4e+a+lte2QjPULnBfPQ6wQAfSACYgD
         fa9izp2PdWkNhj2+P4H0v/I8Kn0aXof+0rTUJo3r11unk+xCA677t068yQrtiDqyRsKx
         fj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEQx7xzkYCtjMiZ2QjLnLIL1ygIzGjRdsAUCyDmpgg1+vMg/gOoZ8n1UnMlbvTXC0TVNAe3be8D3hSFk759Q8N@lists.infradead.org
X-Gm-Message-State: AOJu0YzGsNGwOAKbXMKAT5RpdLcT+kO60O8AslqgqXLE5iVB6ctHRLsH
	qk5k6McSiS2sAkUKjqzHyNx+JSxpdsCJYtELrcnCltRCHQLa1uSCAk4k0+HjBzKo
X-Gm-Gg: ASbGncuCwVHDgS+tvuwujR3Hc73SuLarX3XHK7M9fDhmwcX6oSVSI+d4/dzCTTJPx+0
	W83QYpbyjJ+hyd89HViF+hMiq1suFSf/sB6Sl3m3ZQUB57pFV6IpihQhPm2jzMD6RYtEdXs9QKj
	Ej/4Vn0oNRPpaKkJbHfolPTsSqA1JDo5Fxxf4xWnuWr51ZqumMLMAIYQIeaySkKuHPEsMzw4/aD
	Jl5LfgDELi0CdGL4lEtl6oExrU4MxH3Ero2uXDJs+8tJdN8BVoFUqFYNAVtWGqsqWHhIbEqKyxR
	H8AP4JUkhxKoCYTppJd8PTUxXZ43oQnSOLn6TnDvhS3ajwaKTnbyq6w1KFwIJvvYf+nyXXWvral
	KTAW1j8JpikdYYVoQa4fg0zNfLNdlJE5t1S3k7kl5v/p4Ka01XCP0mBUGSaI94OjPRQ==
X-Google-Smtp-Source: AGHT+IHwpjleoJnGyYJk336ec6vwtgn07RwHbWe7rfyA+HtajB0Jb6Q+4t1Qsr229W6Y+1bycJ9Imw==
X-Received: by 2002:a05:6512:114c:b0:572:f47:d10e with SMTP id 2adb3069b0e04-5720f5716a5mr400732e87.3.1757754558776;
        Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a547ae5bsm849546e87.19.2025.09.13.02.09.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-351f5cec42dso10572071fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4Ar1eyasBXd4/2FxvoZPo4dfC4+JADfTWly213QYxBPSypckhU/HH4FG+ZkV4G9YfALUE5eycKbSZOUKYRjNo@lists.infradead.org
X-Received: by 2002:a2e:bc13:0:b0:336:ed88:f3b1 with SMTP id
 38308e7fff4ca-3513a042fe1mr16058841fa.7.1757754557881; Sat, 13 Sep 2025
 02:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250831162536.2380589-1-lukas.schmid@netcube.li> <20250831162536.2380589-3-lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-3-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:09:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
X-Gm-Features: Ac12FXypVtt3w9R-5_aPJlDVL7mEoeRUisSDiiTl2jorYCCDiG8XoTwLb6M_2sQ
Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
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
X-CRM114-CacheID: sfid-20250913_020923_792969_7C49B308 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, Sep 1, 2025 at 12:26=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> Added the following pinctrl's used by the NetCube Systems Nagami SoM
>   * i2c2_pins
>   * i2c3_pins
>   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
>   * spi1_pins, spi1_hold_pin, spi1_wp_pin
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb028da..c00996d6275c5 100644
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

Because i2c2 and i2c3 have multiple options, they should be named
appropriately, like i2c2-pd-pins and i2c3-pg-pins

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

Should be *din0* and *dout0*, since you have din1 and dout1 on the same pin=
s
but swapped around.


ChenYu

> +
>                         /omit-if-no-ref/
>                         lcd_rgb666_pins: lcd-rgb666-pins {
>                                 pins =3D "PD0", "PD1", "PD2", "PD3", "PD4=
", "PD5",
> @@ -126,6 +156,24 @@ spi0_pins: spi0-pins {
>                                 function =3D "spi0";
>                         };
>
> +                       /omit-if-no-ref/
> +                       spi1_pins: spi1-pins {
> +                               pins =3D "PD10", "PD11", "PD12", "PD13";
> +                               function =3D "spi1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       spi1_hold_pin: spi1-hold-pin {
> +                               pins =3D "PD14";
> +                               function =3D "spi1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       spi1_wp_pin: spi1-wp-pin {
> +                               pins =3D "PD15";
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

