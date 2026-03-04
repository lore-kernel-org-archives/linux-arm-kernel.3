Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98784EF8FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyXpXl6bu2okUvtMuzXbBFiVNKQ5edJWxZJefsKwejw=; b=x0CnI+EEjak4cj
	uEmbZ1ZcqjLpSbuNL3SbYKniNugOCXJ5OwrlTVlkoFu6qmBb6K6da/vbpF7Em2fuGhcSAxhyxV/Bi
	evDcKVNCjCp65wLxPZG/Fl7SvXU61K8/MNLrxpOTrxnHpGBERSuaNQn+Rn3XPhlt/eEPPQ4f86sfI
	g1/FsFferipck2OFLgZwUDZNjI3BFu4s/IeLss9PRQQmTs0G202XnhLXecjFeaEG2ZwASG3+ecfFw
	TyLBw2xeB3gSUOwQgrd8Xx+kfdp7oCXW0VK/4PB1b70T4JZJwc97TOejMI6Lxf6zjLayzQ04LVSfI
	No1L8eK9v4vNDHlLqrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmMA-0000000HFhs-0t1M;
	Wed, 04 Mar 2026 13:33:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmM7-0000000HFhT-0RH4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D781F4362B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DFCC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772631217;
	bh=qX8bwC7Pr9sLJEwNHDJdwt6wRYUINp909IFCD+BCZGM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Qif17WzBzBvkoZ/nngJnz8sJxXvmtVb7CDH2GgHnvD8Eg4wXcB7/iUPikO1Rj7Lw+
	 nTyeDShVWEJOTO6LH41cgsGChErXNk4UKZM7InHw5IsnZgGFDjFjAs2YidL2FRDYye
	 wldPBeuWRLX4A9id9QwKZBANP4J2ET6394qW5k7N2UQGEsmgZCa+jY9ZNUFKoJtfcc
	 kp4S9COjdi8zaoMeBQU/KYuckEHF9LS1wWSUozRuey+J3NCBd5gFrq0etry2kCVYsH
	 3j8h0Gcx7Fgo/89C/1X2+zm7mvzM9yMm9WVMK/zifcZLgf5JixXx4xcD8IqOZHyO8b
	 mExfYykDd2sgQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so7561811fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 05:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXoR5LETTft9XlowrNlnKWmDzCSf18052kIxDTHH4J1NKsgDOZCwpFAhtmpRAyP5jrI4BTv+n17v6+/5aTPbMz5@lists.infradead.org
X-Gm-Message-State: AOJu0YxkxcoSsopLIXUpprNRKY/qldK3UInA2bOSntzm3tdwQDUaTaKd
	Wb2zuv8wRKpv24a8tYtMd4SuzhoLNg2MW8+LdJ48yaPlnoT3a1X1cjmblHsUGmAIE+/AiC6zKut
	zdh1+MPjDFe4zo4h+22O/e2Xm5vxvaF0=
X-Received: by 2002:a05:651c:997:b0:389:ff39:d36f with SMTP id
 38308e7fff4ca-38a2c564975mr18004471fa.8.1772631216030; Wed, 04 Mar 2026
 05:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com> <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
In-Reply-To: <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Mar 2026 22:33:23 +0900
X-Gmail-Original-Message-ID: <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>
X-Gm-Features: AaiRm52IhPssfKwic0-9MUev9i9zshO3IgtBuLjVx0xGClavhc7qhY1LONhcieE
Message-ID: <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_053339_183500_D33D137F 
X-CRM114-Status: GOOD (  24.14  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2026 at 12:44=E2=80=AFPM Yuanshen Cao <alex.caoys@gmail.com>=
 wrote:
>
> The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> customized version of ARM PCK-600 power controller. It shares
> the same BSP driver with A523. According to the BSP provided
> by Radxa, unlike A523, it doesn't require reset.
>
> Make reset optional in the sunxi pck600 driver and add support
> for A733.
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  drivers/pmdomain/sunxi/sun55i-pck600.c | 53 ++++++++++++++++++++++++++++=
++----
>  1 file changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/su=
nxi/sun55i-pck600.c
> index c7ab51514531..8f9fdc3915bd 100644
> --- a/drivers/pmdomain/sunxi/sun55i-pck600.c
> +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> @@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
>         u32 logic_power_switch0_delay;
>         u32 logic_power_switch1_delay;
>         u32 off2on_delay;
> +       bool has_rst_clk;
>  };
>
>  struct sunxi_pck600_pd {
> @@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device=
 *pdev)
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> -       rst =3D devm_reset_control_get_exclusive_released(dev, NULL);
> -       if (IS_ERR(rst))
> -               return dev_err_probe(dev, PTR_ERR(rst), "failed to get re=
set control\n");
> +       if (desc->has_rst_clk) {
> +               rst =3D devm_reset_control_get_exclusive_released(dev, NU=
LL);
> +               if (IS_ERR(rst))
> +                       return dev_err_probe(dev, PTR_ERR(rst), "failed t=
o get reset control\n");
> +       }
>
>         clk =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(clk))
> @@ -193,7 +196,14 @@ static int sunxi_pck600_probe(struct platform_device=
 *pdev)
>  }
>
>  static const char * const sun55i_a523_pck600_pd_names[] =3D {
> -       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> +       "VE",
> +       "GPU",
> +       "VI",
> +       "VO0",
> +       "VO1",
> +       "DE",
> +       "NAND",
> +       "PCIE",

No need to change this part.

>  };
>
>  static const struct sunxi_pck600_desc sun55i_a523_pck600_desc =3D {
> @@ -206,7 +216,36 @@ static const struct sunxi_pck600_desc sun55i_a523_pc=
k600_desc =3D {
>         .device_ctrl1_delay =3D 0xffff,
>         .logic_power_switch0_delay =3D 0x8080808,
>         .logic_power_switch1_delay =3D 0x808,
> -       .off2on_delay =3D 0x8
> +       .off2on_delay =3D 0x8,
> +       .has_rst_clk =3D true,
> +};
> +
> +static const char * const sun60i_a733_pck600_pd_names[] =3D {
> +       "VI",
> +       "DE_SYS",
> +       "VE_DEC",
> +       "VE_ENC",
> +       "NPU",
> +       "GPU_TOP",
> +       "GPU_CORE",
> +       "PCIE",
> +       "USB2",
> +       "VO",
> +       "VO1",
> +};
> +
> +static const struct sunxi_pck600_desc sun60i_a733_pck600_desc =3D {
> +       .pd_names =3D sun60i_a733_pck600_pd_names,
> +       .num_domains =3D ARRAY_SIZE(sun60i_a733_pck600_pd_names),
> +       .logic_power_switch0_delay_offset =3D 0xc00,
> +       .logic_power_switch1_delay_offset =3D 0xc04,
> +       .off2on_delay_offset =3D 0xc10,
> +       .device_ctrl0_delay =3D 0x1f1f1f,
> +       .device_ctrl1_delay =3D 0x1f1f,
> +       .logic_power_switch0_delay =3D 0x8080808,
> +       .logic_power_switch1_delay =3D 0x808,
> +       .off2on_delay =3D 0x8,
> +       .has_rst_clk =3D false,
>  };
>
>  static const struct of_device_id sunxi_pck600_of_match[] =3D {
> @@ -214,6 +253,10 @@ static const struct of_device_id sunxi_pck600_of_mat=
ch[] =3D {
>                 .compatible     =3D "allwinner,sun55i-a523-pck-600",
>                 .data           =3D &sun55i_a523_pck600_desc,
>         },
> +       {
> +               .compatible     =3D "allwinner,sun60i-a733-pck-600",
> +               .data           =3D &sun60i_a733_pck600_desc,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);
>
> --
> 2.53.0
>

