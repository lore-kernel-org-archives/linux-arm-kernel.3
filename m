Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E03E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+UMIsjDndN8AL7b2HIAyHfKbUMuCypZ2nWH9InOvA0=; b=OqSz5/QO/972TbbcYOqwdj6S10
	DDWhOUQonpI7NbMofOgUnRyJ755UdJVNmdVIwWUFm9L62rQ/OpgqiWjS4loJPEAiv6qKbvPyaG3Iz
	4Nr/5LX7XEYshPuTXb2VChL32TBgNcDHiuLvduU3VvMO4Uawh+9xvomork0Pxp1qzc5r5UI/5ZcN4
	E6CAfJb96eCelU1I2b5bx728weJP2zRtwb/2xqfgaUsRm5vtIUHdbkRIo/g+L5TO7k4Al/4gGYRGG
	dj5CAaWqnAt3s84nxjUoWIOTra8kqOyKflsJFNrSXvt2FWIG8gTvQrsS/Mj4bLnlZTSK9NXr7ybGJ
	juSqT1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWnq-00000008kbx-2mJy;
	Wed, 08 Jan 2025 14:12:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWmc-00000008kVE-1mSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E96A9A41429
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 14:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428DFC4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736345501;
	bh=JMqN0FMxKNJX/JfmYS6rGjbOvbZNa9hglHI1v60kBbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=soirqxjULBREkvMUEMz97SNJHXXZqahmoIXNP6J6EQkOHWRDQ2RPnXhSz3jW7M4Gu
	 4Ol+5ZirdSQRTaaoTnR6XoRdkZiI/3cP1PJOIJswFN20503PzUmQhKXKnQGrrPTBjB
	 ulTaUlznyBC7BVR8tp+WS0aE4HwrZ6uo3iRRGRZGIPeMk1qVyQoQYXGqNJqvJvEEOj
	 WEaVoCJl5lbpFWIoDRaQnyfqA3J2b3n2yhpVDTYtim8KaSGTR+j8LTuqsYPRKC1Q4j
	 t1R8xx89WWrY90HVI2r6Zz05/UBmK1PM+KNauX4IjFQWkBmFRSZJNHQzkM8Se6rEJl
	 8AcHlnmPq6xog==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53a91756e5so23870250276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:11:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpOZ7Zpd2zKevvao51ko1SuKPMTMP1rbROMIX0gmeL7c5S7fDIz1v4cX2lLTJT9dk/t1ULTLZbHQxtuw+1R7vr@lists.infradead.org
X-Gm-Message-State: AOJu0YxP2MZwHrIzQT3/Qvmn4ZPYefA7N9CfbTGx5Y2xSMqGqosvRLYm
	j2zwB8peyhewfBq8se6db3p7EzY1SU2BF0GaVpUamndlOz4XBrFU9O87Dfd9jA9NlFYP0J+gJmI
	57f+ufK8LyXuGlnv2iBgJ9po1wQ==
X-Google-Smtp-Source: AGHT+IGdhCLG62Mh6aIPPiC9srOlBBhzGQ11BLoEicaV94TASjDeEtcCBwDQ+9gbltwMrrjmduoyh2qTvXcRfmcZObs=
X-Received: by 2002:a05:690c:6702:b0:6ef:5ca3:d0d9 with SMTP id
 00721157ae682-6f53123988fmr21886957b3.20.1736345500429; Wed, 08 Jan 2025
 06:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-2-swboyd@chromium.org>
In-Reply-To: <20250108012846.3275443-2-swboyd@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jan 2025 08:11:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
X-Gm-Features: AbW1kvaFOTBHEZ3cFJ0pUUPpuln7GgG7io7PpzUCZXYgw14QZ4clQXIRvz2ZW1g
Message-ID: <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_061142_602063_6CA3DD19 
X-CRM114-Status: GOOD (  38.89  )
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

On Tue, Jan 7, 2025 at 7:28=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> Extract the simple bus into a self contained driver so that devices are
> still populated when a node has two (or more) compatibles with the least
> specific one being the generic "simple-bus". Allow the driver to be a
> module so that in a fully modular build a driver module for the more
> specific compatible will be loaded first before trying to match this
> driver.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: <devicetree@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/bus/Kconfig         | 23 +++++++++++
>  drivers/bus/Makefile        |  3 ++
>  drivers/bus/simple-bus.c    | 79 +++++++++++++++++++++++++++++++++++++
>  drivers/bus/simple-pm-bus.c |  2 +
>  drivers/of/platform.c       | 50 +++++++++++++++++++++++
>  5 files changed, 157 insertions(+)
>  create mode 100644 drivers/bus/simple-bus.c
>
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..7c2aa1350578 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -261,6 +261,29 @@ config DA8XX_MSTPRI
>           configuration. Allows to adjust the priorities of all master
>           peripherals.
>
> +config ALLOW_SIMPLE_BUS_OVERRIDE
> +       bool "Allow simple-bus compatible OF nodes to match other drivers=
"
> +       depends on OF
> +       help
> +         Allow nodes with the "simple-bus" compatible to use a more spec=
ific
> +         driver which populates child devices itself.

A kconfig option for this is not going to work. What does a distro kernel p=
ick?

> +
> +config OF_SIMPLE_BUS
> +       tristate "OF Simple Bus Driver"
> +       depends on ALLOW_SIMPLE_BUS_OVERRIDE || COMPILE_TEST
> +       default ALLOW_SIMPLE_BUS_OVERRIDE
> +       help
> +         Driver for the "simple-bus" compatible nodes in DeviceTree. Chi=
ld
> +         nodes are usually automatically populated on the platform bus w=
hen a
> +         node is compatible with "simple-bus". This driver maintains tha=
t
> +         feature but it fails probe to allow other drivers to try to pro=
be
> +         with a more specific compatible if possible.
> +
> +         Those other drivers depend on this kconfig symbol so that they =
match
> +         the builtin or modular status of this driver. Don't disable thi=
s
> +         symbol if ALLOW_SIMPLE_BUS_OVERRIDE is set and there isn't anot=
her
> +         driver for the simple-bus compatible.

Giving users some rope to hang themselves?

> +
>  source "drivers/bus/fsl-mc/Kconfig"
>  source "drivers/bus/mhi/Kconfig"
>
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..f3968221d704 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -40,5 +40,8 @@ obj-$(CONFIG_VEXPRESS_CONFIG) +=3D vexpress-config.o
>
>  obj-$(CONFIG_DA8XX_MSTPRI)     +=3D da8xx-mstpri.o
>
> +# Must be last for driver registration ordering
> +obj-$(CONFIG_OF_SIMPLE_BUS)    +=3D simple-bus.o
> +
>  # MHI
>  obj-y                          +=3D mhi/
> diff --git a/drivers/bus/simple-bus.c b/drivers/bus/simple-bus.c
> new file mode 100644
> index 000000000000..3e39b9818566
> --- /dev/null
> +++ b/drivers/bus/simple-bus.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple Bus Driver
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +static struct platform_driver simple_bus_driver;
> +
> +static int has_specific_simple_bus_drv(struct device_driver *drv, void *=
dev)
> +{
> +       /* Skip if it's this simple bus driver */
> +       if (drv =3D=3D &simple_bus_driver.driver)
> +               return 0;
> +
> +       if (of_driver_match_device(dev, drv)) {
> +               dev_dbg(dev, "Allowing '%s' to probe more specifically\n"=
, drv->name);
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static int simple_bus_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       const struct of_dev_auxdata *lookup =3D dev_get_platdata(dev);
> +       struct device_node *np =3D dev->of_node;
> +
> +       /*
> +        * If any other driver wants the device, leave the device to the =
other
> +        * driver. Only check drivers that come after this driver so that=
 if an
> +        * earlier driver failed to probe we don't populate any devices, =
and
> +        * only check if there's a more specific compatible.
> +        */
> +       if (of_property_match_string(np, "compatible", "simple-bus") !=3D=
 0 &&
> +           bus_for_each_drv(&platform_bus_type, &simple_bus_driver.drive=
r, dev,
> +                            has_specific_simple_bus_drv))
> +               return -ENODEV;

If this driver is built-in and the specific driver is a module, this
doesn't work, right?

I think we're going to have to have a list of specific compatibles
that have or don't have a specific driver. Today, the list with
specific drivers is short, but that could easily change if this
becomes the way to handle things. We should consider if new platforms
should just avoid 'simple-bus' and use something new.

Rob

