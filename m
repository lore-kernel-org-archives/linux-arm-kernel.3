Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD5AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmRnlbEicfo57AAZvezn0z0uuZ1cfiLTFbR9RI0t2I8=; b=gfjuYfhZaqBcZ3
	DVZuuhb53zmPSdMPNIQn8BwU8Kq1Q5iHGmcqXXkb8/q5bBUx+M4/bISFN9fka26Z2HH63x/eftE9F
	Y/g+NGwC3ZnPVCZJoY4CJCAq/chI+2j6RNgtX4vVBxJXOytqG2A/r2t9lpS5NKnn1XyTPnd+mxyCb
	Z6BGewfDO1/jKgCTFP2j7H4kmYRMslklyNrYrkwwya4Q4ewyPwUMTkvg1CnMbqnY/WwHOpBySVreq
	aDpps99oWNhkGYHkZKpPZkJqs5WIgqV1XH/gXAyPq5mIvti7VTdDTmlJaJXp5vN68BPZoYLKLbOcs
	MaA5PJgowmNoelUKq0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81gO-0000000F5D0-34Ro;
	Thu, 24 Apr 2025 18:52:24 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80be-0000000EwHp-0Nj9;
	Thu, 24 Apr 2025 17:43:27 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30f30200b51so15978221fa.3;
        Thu, 24 Apr 2025 10:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516601; x=1746121401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmRnlbEicfo57AAZvezn0z0uuZ1cfiLTFbR9RI0t2I8=;
        b=UNHedOhPxv/QXoZZLib/ypV/scVzNj3el057Vt8XUmPQ0tjiD8MS7G28Jg7CycZ9ET
         nr6fMhqnsP8xmNbcVkzfDoPE4APeX7biD21KKGsqtUT4zRbv6/NwcztOq4cee/x5qfTU
         oGRsl+kP5e3EV45yIJv29wl8lIzZ4/DZ7+4G96i9vK0IhaJh/DJrFySiQnlgrwN4mlsc
         pAFiL35pu4jZiVIy0aWOdjYIMOqn2Eq1JOH849a6cPsqGKWkvKJ6EaCCANvcxxKBzxRD
         R+8yiuphvIaBQAli8qAtGAy2gNw9yKAaHdsM189Dzk7kB70caaidxspDyh8mMZ8Wydlg
         Rg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyicKYapHsuCOm5tPgmV9FxKsSnueMiY9ck6I5EGEZBHQAQu4FAW1ZSTBXQuVVGKuuXeAU+/2+s/rVLJvZpOcPvg==@lists.infradead.org, AJvYcCXRFIqdgb9NXGiZ1rOXXh60mSQsKNSeCB/PNLimRR94rNe6CdQs+ZpfvIbNzG/22475Wc5M3Hd/5NkH7dpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCS+eZJUPORxtYrQZbwf3V1Pmu89GGKDmfGhBqQD+lNrOgZ3+u
	qq8D87xH6dSyK2ONUdcDWTprvGoLi7MIw+ESu74q+DD8g6Vx5W3rTPv7nkgR
X-Gm-Gg: ASbGncsprl4Fg1BI7/bLctcbymcc9SCFAWWDBoRQH8T7e9lhNePUtWgzLxfUB/hsLSm
	dvA2KJdbBRU/9N0KVBpBre0H62nOmPjhKGLUpXwqRVeSYhIAhdh4YWRJLFEB0GOoB8UN1UM53oe
	4zqTaF486e+7Em3TNsa114XhX0LiszJ1suBf5bVUE8F2znorrIQsRzXIqtnTfsenS56Sh1DLDS/
	Clp4+Tgp8uuxI9SnIRrPBnpIuqJd6Zeawep1vtrwU/w/FSNd7/gZ3T3dhCL5PogE9C3eBjMktPU
	DgTNPO3tHtgH6E1870LRPCu4a/xJTE402aznnh+dxWmjC5Qlm4jZgIL8iIM0SSKhRBYjpA==
X-Google-Smtp-Source: AGHT+IE2POU3GAEGj3/zM4dVQxU2TcerHK1l+2EH1zon9hJrjTdXElXvuU1u+7Bu0Vr88tcRf5YfWA==
X-Received: by 2002:a05:651c:30c1:b0:30a:4428:dead with SMTP id 38308e7fff4ca-318a928b000mr2102851fa.27.1745516601267;
        Thu, 24 Apr 2025 10:43:21 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfa53c84sm3449101fa.25.2025.04.24.10.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499614d3d2so1349516e87.3;
        Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2G3skYlbKruE4vX9UhXeCcqRCDR3JSgey4T09KmHWdjxRv501TQiCTZ2i5TW+Q1SPQdP2KPRwYOOnzDp69F+eLQ==@lists.infradead.org, AJvYcCWujEmmF79OsCSZs/izXJ+/vcIInM2cledyChPxt5WWkW4Su7ZeuVrK+HPd3UZpjZzbwf/bwt09KV/i15Wu@lists.infradead.org
X-Received: by 2002:a05:6512:2310:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54e8977aeb9mr70103e87.16.1745516600353; Thu, 24 Apr 2025
 10:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 01:43:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
X-Gm-Features: ATxdqUHeMGKXwILdemaV4iIduxoy9n-SC7kRH607ob8j4Z0cm-iXg78WkqCwkx4
Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104326_128799_95A24524 
X-CRM114-Status: GOOD (  18.39  )
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

On Thu, Apr 24, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-axp209.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-a=
xp209.c
> index 2b4805e74eed..28ff846d263a 100644
> --- a/drivers/pinctrl/pinctrl-axp209.c
> +++ b/drivers/pinctrl/pinctrl-axp209.c
> @@ -192,34 +192,31 @@ static int axp20x_gpio_get_direction(struct gpio_ch=
ip *chip,
>  static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offse=
t,
>                               int value)
>  {
> -       chip->set(chip, offset, value);
> -
> -       return 0;
> +       return chip->set_rv(chip, offset, value);
>  }
>
> -static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -                           int value)
> +static int axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
>  {
>         struct axp20x_pctl *pctl =3D gpiochip_get_data(chip);
>         int reg;
>
>         /* AXP209 has GPIO3 status sharing the settings register */
>         if (offset =3D=3D 3) {
> -               regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
> -                                  AXP20X_GPIO3_FUNCTIONS,
> -                                  value ? AXP20X_GPIO3_FUNCTION_OUT_HIGH=
 :
> -                                  AXP20X_GPIO3_FUNCTION_OUT_LOW);
> -               return;
> +               return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL=
,
> +                                         AXP20X_GPIO3_FUNCTIONS,
> +                                         value ?
> +                                               AXP20X_GPIO3_FUNCTION_OUT=
_HIGH :
> +                                               AXP20X_GPIO3_FUNCTION_OUT=
_LOW);
>         }

I guess you could also drop the curly braces, but otherwise

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
>         reg =3D axp20x_gpio_get_reg(offset);
>         if (reg < 0)
> -               return;
> +               return reg;
>
> -       regmap_update_bits(pctl->regmap, reg,
> -                          AXP20X_GPIO_FUNCTIONS,
> -                          value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
> -                          AXP20X_GPIO_FUNCTION_OUT_LOW);
> +       return regmap_update_bits(pctl->regmap, reg, AXP20X_GPIO_FUNCTION=
S,
> +                                 value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
> +                                         AXP20X_GPIO_FUNCTION_OUT_LOW);
>  }
>
>  static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offs=
et,
> @@ -468,7 +465,7 @@ static int axp20x_pctl_probe(struct platform_device *=
pdev)
>         pctl->chip.owner                =3D THIS_MODULE;
>         pctl->chip.get                  =3D axp20x_gpio_get;
>         pctl->chip.get_direction        =3D axp20x_gpio_get_direction;
> -       pctl->chip.set                  =3D axp20x_gpio_set;
> +       pctl->chip.set_rv               =3D axp20x_gpio_set;
>         pctl->chip.direction_input      =3D pinctrl_gpio_direction_input;
>         pctl->chip.direction_output     =3D axp20x_gpio_output;
>
>
> --
> 2.45.2
>

