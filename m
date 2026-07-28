Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85795C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnE+b0dufgmuTUYVj4V+PdswXaAJ7opl2QehGSoGDuk=; b=hKlsPm+CqwLvj3
	Mk8VlIEghjdGe/FHUuvUtxPYue6+UXV6m1oZlmeeiKJMSalyUCK410ahplWALpYpG+0jNavjcpdUU
	3flfvwbg1F5PJHqpXViQdEGpqRC32+ijauhT0pMzKBhbIUeA6fXNEmgEFpj50hs8uUIspoLsT0bBP
	sc7Q7PUwkCvZ+cA8i9NOrkoFX4IGZOimZHCQvX56Z8CMjPpbARQ+2PXiSFVt/xxM7tOUURbwp7CEd
	BfLpOdWvg8/6sQt3YsHfnVMNw3Hr8lDB8so5DjuPoIYzX1wdMDADCIKtHunJdlhWWT7VAnVd/CD9U
	9JUx6EobmcjSJMADI2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokAt-00000005k5t-3SxX;
	Tue, 28 Jul 2026 15:56:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokAp-00000005k4K-32Yh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6317D4115B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 15:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459841F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254215;
	bh=OnE+b0dufgmuTUYVj4V+PdswXaAJ7opl2QehGSoGDuk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=X9Yg5r8VHZU27YmZjz/p20xLSnwQ1Ctjug8iPWHroQV+CshsSMnBC4N/YZ0ln7HUF
	 z65JfqcmIh+DT9FMjlnltu7rAUNPuwVoEiqCDz6vIGHnOX+4QUBN3gjliQJZZ2hWKu
	 +0dTI3nMe9PVlMH2synM5U2FWoYSSIQsYZLgM/TZBy2UVEWKUtEWJu8EdllQvEmyIs
	 tn/SF/5uJ+m8KTDjscZCdHgkg6Z6Un99QTycDkgtRyuVS2/nXH9oDFrlTDxquzWMTU
	 ldjQmtycXoJSvsy3qtnnkRa+BMMJ34mVZ+hpCTy7NucwGqvzxX8AteRMACFkijweWo
	 Ab54T5qOj0qvw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so32995171fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruJxEGV+gVDjouHx4FLc0JsA0tGscpOYWT/NriOq2FTCXPDllrsDV7YHdR/AIWzrJsA+dajBAdQF57e0qoOqfU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LHk8l5vXruKmUkajE/+qI8o8hnNxBX3DFq5tWOZbD+46Tw/J
	Uz5tGk5rjlBqE2PowpovtwKhwCgrcd00msn6G0T7zqj7gB6zgyV+OjYp5pONnDgPLpfFV89doci
	YGnQyRSsjx1i7S3Yc2xa7SmCjPFb+Ht4=
X-Received: by 2002:a2e:a9a5:0:b0:39b:35bd:e708 with SMTP id
 38308e7fff4ca-39f51cdef30mr5872591fa.1.1785254213689; Tue, 28 Jul 2026
 08:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260727194208.10082-1-rosenp@gmail.com>
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Jul 2026 23:56:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
X-Gm-Features: AUfX_mz7aI0nbIJpfKBate6Q0TeFbJm95gK2ISGivDgpxVudCD5tFbKP4Fr98_k
Message-ID: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jul 28, 2026 at 3:42=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Replace irq_of_parse_and_map() with platform_get_irq() and move both
> IRQ and MMIO resource acquisition to the top of probe, before any
> allocations, for early error exit.

There's no real reason for the code movement. It's going to fail once
or maybe twice at the most. And the ones you moved are the least likely
to fail.

Now I could see replacing irq_of_parse_and_map() with the more standard
platform_get_irq(), but you haven't given a reasonable reason. And it
should be a separate patch since it has nothing to do with streamlining
the error handling and dropping the remove function.

> Switch from devm_clk_get() + clk_prepare_enable() to
> devm_clk_get_enabled(), which combines both operations and registers
> devres callbacks for automatic disable/unprepare on unbind. This
> eliminates the manual err_disable_unprepare error path and the
> remove callback entirely.
>
> Use devm_mbox_controller_register() for devres-managed controller
> registration, and drop the remove callback and platform_set_drvdata()
> which are no longer needed.

These two are what are important.

> Assisted-by: Opencode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
>  1 file changed, 18 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbo=
x.c
> index 6ba6920f4645..28d8636afad2 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
> @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
>         struct mbox_chan *chans;
>         struct reset_control *reset;
>         struct sun6i_msgbox *mbox;
> +       void __iomem *regs;
>         int i, ret;
> +       int irq;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
>
>         mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
>         if (!mbox)
> @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_devic=
e *pdev)
>         for (i =3D 0; i < NUM_CHANS; ++i)
>                 chans[i].con_priv =3D mbox;
>
> -       mbox->clk =3D devm_clk_get(dev, NULL);
> +       mbox->clk =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(mbox->clk)) {
>                 ret =3D PTR_ERR(mbox->clk);
>                 dev_err(dev, "Failed to get clock: %d\n", ret);
>                 return ret;
>         }
>
> -       ret =3D clk_prepare_enable(mbox->clk);
> -       if (ret) {
> -               dev_err(dev, "Failed to enable clock: %d\n", ret);
> -               return ret;
> -       }
> -
>         reset =3D devm_reset_control_get_exclusive(dev, NULL);
>         if (IS_ERR(reset)) {
>                 ret =3D PTR_ERR(reset);
>                 dev_err(dev, "Failed to get reset control: %d\n", ret);
> -               goto err_disable_unprepare;
> +               return ret;
>         }
>
>         /*
> @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_devic=
e *pdev)
>         ret =3D reset_control_deassert(reset);
>         if (ret) {
>                 dev_err(dev, "Failed to deassert reset: %d\n", ret);
> -               goto err_disable_unprepare;
> +               return ret;
>         }
>
> -       mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(mbox->regs)) {
> -               ret =3D PTR_ERR(mbox->regs);
> -               dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> -               goto err_disable_unprepare;
> -       }
> +       mbox->regs =3D regs;
>
>         /* Disable all IRQs for this end of the msgbox. */
>         writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
>
> -       ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, =
0),
> -                              sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -       if (ret) {
> -               dev_err(dev, "Failed to register IRQ handler: %d\n", ret)=
;
> -               goto err_disable_unprepare;
> -       }
> +       ret =3D devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(=
dev), mbox);
> +       if (ret)
> +               return ret;
>
>         mbox->controller.dev           =3D dev;
>         mbox->controller.ops           =3D &sun6i_msgbox_chan_ops;
> @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
>         mbox->controller.txpoll_period =3D 5;
>
>         spin_lock_init(&mbox->lock);
> -       platform_set_drvdata(pdev, mbox);
> -
> -       ret =3D mbox_controller_register(&mbox->controller);
> -       if (ret) {
> -               dev_err(dev, "Failed to register controller: %d\n", ret);
> -               goto err_disable_unprepare;
> -       }
> -
> -       return 0;
> -
> -err_disable_unprepare:
> -       clk_disable_unprepare(mbox->clk);
> -
> -       return ret;
> -}
> -
> -static void sun6i_msgbox_remove(struct platform_device *pdev)
> -{
> -       struct sun6i_msgbox *mbox =3D platform_get_drvdata(pdev);
>
> -       mbox_controller_unregister(&mbox->controller);
> -       /* See the comment in sun6i_msgbox_probe about the reset line. */
> -       clk_disable_unprepare(mbox->clk);
> +       return devm_mbox_controller_register(&mbox->controller);

Like Sashiko said, this doesn't compile. All devm_*() functions require
a |struct device *| parameter.


Build testing your patch before sending it is a must.


ChenYu

>  }
>
>  static const struct of_device_id sun6i_msgbox_of_match[] =3D {
> @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver =3D=
 {
>                 .of_match_table =3D sun6i_msgbox_of_match,
>         },
>         .probe =3D sun6i_msgbox_probe,
> -       .remove =3D sun6i_msgbox_remove,
>  };
>  module_platform_driver(sun6i_msgbox_driver);
>
> --
> 2.55.0
>

