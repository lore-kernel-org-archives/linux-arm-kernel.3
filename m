Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B07FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXJ+oFpN1Uo60lNEzlY3C2en8VdkESOivSYJAKh0F7g=; b=4ppPVSdf60HnSIlEREh/uITbVa
	RnHZQFW5xjPOGmx6vGT0VrNMIm51Dw4DQ4twNLifFDcAcFy+7cqUUg4MV6ETuIWpO9MSDoYjReF28
	dA2k8/NdV7p1l7XWKp3SeD4NsNYFVUkE5iNmk0RkYbf9UZSPOpikiWMPa8o2dyayLG+JfhDmTmmGT
	CfVTzgs9lRncbjXHa4gRWSgWZVw++oPJMbbbUABiw12qHhzBqHCIpNQI+sWmNVCX0Df2dp58EM2Gx
	vlEWsnHhX8oS7eefQmSo9v+d6Aes3ZMXX/4sDWFfX85yjsu+NHppbPnKXOjFcrgWIg8Fdhl2FP118
	g9sBwg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0fg-00000004Rhz-1UVf;
	Fri, 16 May 2025 19:24:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0dd-00000004RHN-0664
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 19:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51337A4E9DE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 19:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6511C4CEF3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 19:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747423351;
	bh=Ek77gpLsXz/q8aiOBEfN+u6gnh5zOQSz5ZZsCaFKCqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iNeGvC9YNn6yFnhSO85bZsHcg0QPPmYJTzAga89DoxPfoNpib0PIxhUdZANcmToAQ
	 F9KQvGnONz3gM7LE3VAtSs0njTcu01fj10VPk+JcUk9ZDb8UKaxUPVqs37b01KbggK
	 NPN9dspZ6DPq9rAyNRMFRyEaS19hFU4ySToU2MsR6lWL65Xur0u775D45wZ9DQdwx5
	 UUsFV8TLsk+mcH5xCVAEFH+gLw+AjHnAHH58cxXbLpc4HlQcdR2W79B7TCtFcOYkJz
	 ELhjsc2VQ0vGFA9n3/JzYL4aRbhEdcaRAzrONBrbFa6zscrhAEGamtMmMsTAlYrYlN
	 uQYCjw6K0U8BA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso213991fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 12:22:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg+kxnWkMEPD0hIbjgpH6N+oqnGaNwJpxoKxc4hIIhyrPxqDUcOf9jCtwJU2XE7e5NuKFvSR5RXMoiMzg/bxC/@lists.infradead.org
X-Gm-Message-State: AOJu0YwkS7+BkQhEHn0xaX8tGgvHOdanPCCEZiSMK///yPUAJ5IaLmCG
	QDAdEwmZ/5A3XBSFeVljPU0Gh5i8u5xy1ESj0RZIlimCwBoy7CNGuppZ9DYZTPDSVskw3S9QWor
	B/9Q92oIw8o9GzfD/s4YtvDeo8sphfo0=
X-Google-Smtp-Source: AGHT+IGl/Xh2m5Yioj8nj711hLigDhrXfyaCMYocztPRG3qWM9ptNmcZPxoSwPv1HnQirxUyGT+7+NI2qwMqctosLrA=
X-Received: by 2002:a05:6870:2484:b0:2d5:a360:7df9 with SMTP id
 586e51a60fabf-2e3c1b67803mr2961587fac.5.1747423351159; Fri, 16 May 2025
 12:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com> <20250507071315.394857-6-herve.codina@bootlin.com>
In-Reply-To: <20250507071315.394857-6-herve.codina@bootlin.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 May 2025 21:22:20 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
X-Gm-Features: AX0GCFvpCPNT-ZeaAeVtc8DjE00SK05z3r-qk3RyVev5M5-s80SOM3ivZ1irWZU
Message-ID: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at probe
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_122233_196667_E807AF3A 
X-CRM114-Status: GOOD (  35.95  )
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

On Wed, May 7, 2025 at 9:13=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> The simple-pm-bus drivers handles several simple bus. When it is used

s/drivers/driver/ (I think)
s/simple bus/simple busses/

> with busses other than a compatible "simple-pm-bus", it don't populate

s/it don't/it doesn't/

> its child devices during its probe.
>
> This confuses fw_devlink and results in wrong or missing devlinks.

Well, fair enough, but doesn't it do that for a reason?

> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
>
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
>
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
>
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
>
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
>
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index d8e029e7e53f..93c6ba605d7a 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device=
 *pdev)
>         match =3D of_match_device(dev->driver->of_match_table, dev);
>         /*
>          * These are transparent bus devices (not simple-pm-bus matches) =
that
> -        * have their child nodes populated automatically.  So, don't nee=
d to
> -        * do anything more. We only match with the device if this driver=
 is
> -        * the most specific match because we don't want to incorrectly b=
ind to
> -        * a device that has a more specific driver.
> +        * have their child nodes populated automatically. So, don't need=
 to
> +        * do anything more except populate child nodes.

The above part of the comment has become hard to grasp after the
change.  In particular, why populate child notes if they are populated
automatically?

> + We only match with the
> +        * device if this driver is the most specific match because we do=
n't
> +        * want to incorrectly bind to a device that has a more specific =
driver.
>          */
>         if (match && match->data) {
>                 if (of_property_match_string(np, "compatible", match->com=
patible) =3D=3D 0)
> -                       return 0;
> +                       goto populate;

Doesn't this interfere with anything, like the automatic population of
child nodes mentioned in the comment?

>                 else
>                         return -ENODEV;
>         }
> @@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device=
 *pdev)
>
>         dev_set_drvdata(&pdev->dev, bus);
>
> -       dev_dbg(&pdev->dev, "%s\n", __func__);
> -
>         pm_runtime_enable(&pdev->dev);
>
> +populate:
>         if (np)
>                 of_platform_populate(np, NULL, lookup, &pdev->dev);
>
> +       dev_dbg(&pdev->dev, "%s\n", __func__);

So how to distinguish between devices that only have child nodes
populated and the ones that have drvdata set?

> +
>         return 0;
>  }
>
> @@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_devi=
ce *pdev)
>  {
>         const void *data =3D of_device_get_match_data(&pdev->dev);
>
> -       if (pdev->driver_override || data)
> +       if (pdev->driver_override)
>                 return;
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> -       pm_runtime_disable(&pdev->dev);
> +       if (pdev->dev.of_node)
> +               of_platform_depopulate(&pdev->dev);
> +
> +       if (!data)
> +               pm_runtime_disable(&pdev->dev);
>  }
>
>  static int simple_pm_bus_runtime_suspend(struct device *dev)
> --

