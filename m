Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDB3F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LCCY2f5yMxWwT/ofb2BEvZTO/kVoLLDmzpYMjPSDAs=; b=kA+laWYpicRj15
	CwCnJTXLdBcxwMx3GFTD59F+dO1vb/PTz65UrbqW7q+qkTRQYtfN7ueEh6GzNfrL2CyElYl70Q/0t
	OIo1r9g0A69mCAMHgUZIiOug1aJV/49MCG/prUmnrCh9/LsLbSJSrUa5EmjDq2DQZR8m+q/G1mAj2
	dxLA1CvPyjl4aRmSBhN0Xytid9U/pymcfaRYPexD5YWf+rw5QG0ThZKjB5JkxVC7Q1OcsypB211Gu
	YtYb1d/ua46+tYbpgFqCzWYqoKwaMQc5gIzSTzErMeXqqL1DGhaF41Mra1AyGU3lpCRhPe1lqqn4f
	C/xIdCZvMn+1+1QIgFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jHI-0000000HEyJ-1Mjo;
	Mon, 23 Mar 2026 17:41:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jHG-0000000HExo-0MKQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B63040B3B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 17:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EFAC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774287681;
	bh=US9GCCid6v4HyHFoqm7MLXZb7skaUYoLT9/2dzLkQRo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hDSLPzY0DC6l8WFdmVCPTHtrEhKtxUPN1Rv5keg02z/JXG7r0c2G70yu+iYPUh81m
	 mKOh4NV9eFxKPnIzEsUeYkVydCVE+2bCThQYBes8JGxjnHbB++XZkMuTJIgNP9qP5c
	 mQZ/JajVtmK/U2+6ZCfm5+MeOJ9EZFp6HoUA9wvsgJker/Cogl7DXLT8UvaIh86SkO
	 uIel90J8nsTld2Y4Pvv1tb3IH2bN2Ug5r/c3G3kGseFaMFG4HnPOQjdHO41Cd4dXEe
	 SxC+S6BSQL827BnuUl8uaFMUzCMFg0kIf8NyA1VxXf0XojNs8G1QYq7URqy8Sp3t3o
	 OKd7KWUr6XSFA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so21111541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZutI87/lQo5EuOAZoUrslWQJkwgo9IhWpQ1Sm9vmUdAutQCBW8qTNtPjdIrrJIimI6IYUQjvGZsyp4OqlcQ42@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Q9vZoKFzBFc5eM9xTJ+ZtdupG6L2J15l7EZ30srUw82OJued
	8AGiQ8Ku34xcldOaAsqxZPGValusfCEz4uw3/OpRNJwwJQ7lWHV6nFCfY8nZ0MIBXgU7ERqqIZv
	INSSwfrTctu0F8nXXk9z9mUp3WdztreU=
X-Received: by 2002:a2e:8a96:0:b0:37c:cf34:536c with SMTP id
 38308e7fff4ca-38bf95e8ad2mr42901711fa.3.1774287679365; Mon, 23 Mar 2026
 10:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-6-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-6-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Mar 2026 01:41:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
X-Gm-Features: AQROBzCqD4rc3G7BUhX053yGDoWgA9I1BieDaebJcNf25nsrRp_pPWGt7aUxUjc
Message-ID: <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: sunxi: a523: add missing IRQ bank (plus old
 DT workaround)
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_104122_168511_3114ABFE 
X-CRM114-Status: GOOD (  31.91  )
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

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A532 SoC implements 10 GPIO banks, each of which is
> interrupt capable. However the first bank (PortA) is skipped, so the
> indicies of those banks range from 1 to 10, not 0 to 9.
> We described the skipped bank correctly, but missed that for the IRQ
> banks, where we rely on the IRQ bank index to be aligned with the MMIO
> register offset, starting at 0x200.
>
> Correct that by increasing the number of IRQ banks to 11, to cover both
> the first skipped one, but also the last one (PortK). This fixes a bug
> where the interrupt numbers would be off-by-one, due to that
> mis-enumeration.
> The big caveat is that now old DTs break the kernel, since they only
> provide 10 interrupts, and the driver bails out entirely due to the last
> missing one. So add a workaround for this particular case, where we
> detect the requirement for 11 banks, but only 10 interrupts provided,
> and continue with 10 IRQs, albeit emitting a warning about a DT update.
> This would still be broken in terms of interrupt assignment, but it was
> broken the whole time before, so it's not a regression.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 22 +++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index b6f78f1f30ac..a1d157de53d2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BAN=
KS] =3D
>  /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>         {  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
>
> -static const unsigned int a523_irq_bank_map[] =3D { 0, 1, 2, 3, 4, 5, 6,=
 7, 8, 9 };
> +static const unsigned int a523_irq_bank_map[] =3D { 0, 1, 2, 3, 4, 5, 6,=
 7, 8, 9, 10 };

Actually you don't even need this, since this is a linear mapping.

From sunxi_irq_hw_bank_num():

    if (!desc->irq_bank_map)
            return bank;
    else
            return desc->irq_bank_map[bank];

>  static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
>  /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 6a86b7989b25..ffee79397590 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -19,6 +19,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
> +#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -1582,6 +1583,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         struct sunxi_pinctrl *pctl;
>         struct pinmux_ops *pmxops;
>         int i, ret, last_pin, pin_idx;
> +       int num_irq_banks;
>         struct clk *clk;
>
>         pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> @@ -1715,16 +1717,20 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
>                 goto gpiochip_error;
>         }
>
> -       pctl->irq =3D devm_kcalloc(&pdev->dev,
> -                                pctl->desc->irq_banks,
> -                                sizeof(*pctl->irq),
> -                                GFP_KERNEL);
> +       num_irq_banks =3D pctl->desc->irq_banks;
> +       /* Workaround for old A523 DT, exposing one less interrupt. */
> +       if (num_irq_banks =3D=3D 11 && of_irq_count(node) < 11) {
> +               num_irq_banks =3D 10;
> +               pr_warn("Not enough PIO interrupts, please update your DT=
!\n");
> +       }

I would probably make the check universal, and also use dev_warn().

    num_irq_banks =3D of_irq_count(node);
    if (num_irq_banks !=3D pctrl->desc->irq_banks) {
        dev_warn(&pdev->dev, "Incorrect number of PIO interrupts,
please update your DT!\n");
        num_irq_banks =3D min(num_irq_banks, pctrl->desc->irq_banks);
    }

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


> +       pctl->irq =3D devm_kcalloc(&pdev->dev, num_irq_banks,
> +                                sizeof(*pctl->irq), GFP_KERNEL);
>         if (!pctl->irq) {
>                 ret =3D -ENOMEM;
>                 goto gpiochip_error;
>         }
>
> -       for (i =3D 0; i < pctl->desc->irq_banks; i++) {
> +       for (i =3D 0; i < num_irq_banks; i++) {
>                 pctl->irq[i] =3D platform_get_irq(pdev, i);
>                 if (pctl->irq[i] < 0) {
>                         ret =3D pctl->irq[i];
> @@ -1733,7 +1739,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         }
>
>         pctl->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev),
> -                                               pctl->desc->irq_banks * I=
RQ_PER_BANK,
> +                                               num_irq_banks * IRQ_PER_B=
ANK,
>                                                 &sunxi_pinctrl_irq_domain=
_ops, pctl);
>         if (!pctl->domain) {
>                 dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
> @@ -1741,7 +1747,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>                 goto gpiochip_error;
>         }
>
> -       for (i =3D 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
> +       for (i =3D 0; i < (num_irq_banks * IRQ_PER_BANK); i++) {
>                 int irqno =3D irq_create_mapping(pctl->domain, i);
>
>                 irq_set_lockdep_class(irqno, &sunxi_pinctrl_irq_lock_clas=
s,
> @@ -1751,7 +1757,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>                 irq_set_chip_data(irqno, pctl);
>         }
>
> -       for (i =3D 0; i < pctl->desc->irq_banks; i++) {
> +       for (i =3D 0; i < num_irq_banks; i++) {
>                 /* Mask and clear all IRQs before registering a handler *=
/
>                 writel(0, pctl->membase +
>                           sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
> --
> 2.43.0
>
>

