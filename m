Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB7EC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmBbdGqXn7zX22juAuUHe8n2tln6u/foAWFAk2OvEPI=; b=tSyOSUBB3ucM2s
	nU5jBya5i7wfSVpuNKKCUcIbwi4CEbDSam4L7KnLTpfC1b5ifWVL+U49VkwoXz1ey/7NYADpqotfd
	dyR+Sph/Lcz2ObSNKXjZFozgI9U2zFhD5PUHJMqDVo60fHk5KSwzTCqCloIeAvGxm8s5CGzdlTQAx
	7u6yL88HuhQLqAKUClTj67ToL/jK4wLBJt5fYN2OjAjGSnf94MtpSLIwX3K/aho42/6LEAXSXV0S1
	nKuGvzV44Gbo5E8VzAO4eozlm5Ku4OBUNceHws4niml7QX8k6KbMe29BMzP81ujDqRI2vKuosZBxM
	EoaBXIijYjeZTNFbwTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaic-0000000CSoL-2HKJ;
	Wed, 22 Jul 2026 17:26:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaib-0000000CSoF-0TmX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:26:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 934D4438C8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E7D1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741212;
	bh=bmBbdGqXn7zX22juAuUHe8n2tln6u/foAWFAk2OvEPI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VbJBrVX7eJu20xz06ZlMKi8QIRKS8rsZsooY7QwuebBNONta5I0m69DTasLhllPlo
	 3oi28M/ae9kK6j0h4rD9zTBYSMGWNq/gcMuZOqaxdtaKiFI8lxcB12UqaAjXxtOfg4
	 JtVu1hwtehUyh98Kw1kDSVxb/hWq5yoTLISGFFfASGtC9z1nOquWQ/LYfiaN71On3X
	 P1CO9/geM+92BYzHxKNdU+zf65QUR19ZBBE2Ldd1EUg5AEJ0Q9JLMyaIy+vHziNLDi
	 TIxyunHIMqdDNwQdwM1ZU+XjG8dAOFfN7mnSFcwxuLN/xg9Q56fOSSZkLzbNCdyU1m
	 79tcQ7BNQhekw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39ca300db70so101840261fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp1mDesr51rL1ClPWoUv+5Q5IppNegVEd88y3Ek0ntNiV+Stlcu1IgSYqcqjtlXnv6MnTPdaIXwAuUn7GTwZ0PE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy+JCm0R3VGHFugZ20oTjYx9mJ7VhbPoTIRFM2RnxGx49qCv6k
	X0Uf7wDqER8N4Rmnp1VCPPBXL6ycDD2QkHs6r3TNsvcdzEl+8uKz94PcGiwS7VAYOyXQgvBnEgR
	UQfWfNo8xFn9tjw4ijH0b720uuiq80Z4=
X-Received: by 2002:a05:6512:61b1:b0:5b2:a21a:10e7 with SMTP id
 2adb3069b0e04-5b2a21a12d5mr2494227e87.25.1784741210871; Wed, 22 Jul 2026
 10:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 23 Jul 2026 01:26:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
X-Gm-Features: AUfX_mzV8YT9ywm-27dQuVdFcDOwplaJLY2AjiPlfsSw77am-9UWqKDGzOnYCNk
Message-ID: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
>
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> Ethernet PHYs). The A523 has that enable register, but didn't use it
> so far.
>
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
>
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index dfdcfa740ecc9..cffc1e53eef14 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
>  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
>         .irq_bank_map =3D a523_r_irq_bank_map,
> -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>         .pin_base =3D PL_BASE,
>  };
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 801f62abc93df..001bd42afa3ef 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_B=
ANKS] =3D
>  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
>         .irq_bank_map =3D a523_irq_bank_map,
> -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>  };
>
>  static int a523_pinctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index cabcb8b6f38e5..634d9f1f23947 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>  {
>         unsigned short bank;
>         unsigned long flags;
> +       bool inverted =3D false;
>         u32 val, reg;
>         int uV;
>
> @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 writel(reg | val, pctl->membase +
>                        sunxi_grp_config_reg(pctl, pin));
>                 return 0;
> +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> +               inverted =3D true;
> +               fallthrough;
>         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
>                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
>
> @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 fallthrough;
>         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
>                 val =3D uV <=3D 1800000 ? 1 : 0;
> +               if (inverted)
> +                       val =3D !val;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
>                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index d0936a32123ba..2c8648c3301b6 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
>          * Bias voltage is set through PIO_POW_MOD_SEL_REG
>          * and PIO_POW_MOD_CTL_REG register, as seen on
>          * A100 and D1 SoC, for example.
> +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
>          */
>         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>  };
>
>  struct sunxi_desc_function {
> --
> 2.46.4
>

