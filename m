Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E74DD68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKZ8PCGbkt1FS8ro/35R+dWqwveiTYi6QMlhWs5zmGM=; b=dtJnrfXc0R+z+3+7GsMa78JWbj
	iOeQudKS3ox41RE6DQgFTHbzFGWI3dMTCG82kbjy6rQARWAtUDRMfNWbpHxeI35G0755DuSvsYRQe
	Yfhi7R4AFmnMaXTUloqokdoHeDpYbSgNuou0k8tuf/0K+eSdTh5aWZAwK6l7GY77h06GwsQdNfEgX
	hQ1mXeliH3JZHoarES2Zg3vExWCYmycabwXvBsT/zboh0eXL9TqTIe4LA3ETWuBvviKyEycDNi+un
	Qt9dkNSwajlKwPO6uvHsaZo6jSy1w4Ku0IDUXDxAqoG0H+bLrZZTy7jRUnHr5GsRR0PWKm27a1zWc
	dvpK0+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzvU-00000003WC4-3t3r;
	Fri, 15 Nov 2024 17:16:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBztf-00000003VsI-2Z7F;
	Fri, 15 Nov 2024 17:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55F3FA42B5F;
	Fri, 15 Nov 2024 17:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C33C4CECF;
	Fri, 15 Nov 2024 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731690853;
	bh=UKf2D05K/gyn5pqOi5hcQw1T7lYxnxkCGJHDkIuIm10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kYry2eGrXsX0UGQ3VvBEu0GT8bGYLuodLmbR+Z709nCbp7jkTmqmdX4cuXYv+YzCU
	 BH7BTiZOSgiYRO8Vl0v99sR0GVeeIFOzJFfSPFq6bbH1fShKHZbUV8yMYskmMoBdRg
	 88O7T16N5tt4Wwlw8CtIVndiKd2yw6qEiK2w0ZuDtMHGEHgXhxlyjxlI2gYcQMF4Xu
	 G9k8a/nDj3RGpaTgUUvDgeTPPNJm/unoPX4BD5umvhEn2hYCP0zsAugmiYiPD9yORA
	 vrKCzq7Jdu3oifWjHkEAZWzQA5myl5BA75CT4HYzPfomYplqduGTJQWl14kI5yXDzC
	 13UDDLpIC1Cng==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3819b7b57dso940046276.1;
        Fri, 15 Nov 2024 09:14:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8LqFAdPOszVt8XRMjUhc78DTJ0j8GAJWFtH2zxFNEDOHK1DjBed97diuA8Q5+JO4UtZX8mJEdTDSnWO1r6SYVBQ==@lists.infradead.org, AJvYcCXD0s4O25u5BA/Jls6qlxg+ZhNlGZUjsw2ZBOyZext0i2M+P2zXuOeXIWl0QB+BX0AWf/3UqUfXptqt/FJk@lists.infradead.org
X-Gm-Message-State: AOJu0YxUzZ0FC6T/bauqln/OrPqnOM4IL7/h8QvC44QGK2KIVTitSdvm
	ZHHd1WGFlQpFz58wtIM2/iA6N6LxnjpyltaY7KWEH90Z9FDTBfzbenLaQQkRm0WJeJNLycVkR0d
	kCpCBRMCMZd0zSN6WUwncmVanhQ==
X-Google-Smtp-Source: AGHT+IGiE+cnU9ZWYlzlV7eNcWe8xaMDYeLmmNOeSFn104dNU8yMitWKPRWl5TyCIWwi1hpMUQwq+ALlqCkKVFk4tJI=
X-Received: by 2002:a05:690c:d19:b0:6e2:4c7b:e379 with SMTP id
 00721157ae682-6ee55a83a50mr41263137b3.19.1731690853131; Fri, 15 Nov 2024
 09:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com> <20241113180405.GA653353-robh@kernel.org>
 <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
In-Reply-To: <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Nov 2024 11:14:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
Message-ID: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4 SoCs
To: neil.armstrong@linaro.org
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_091415_774396_EF7B0FB8 
X-CRM114-Status: GOOD (  33.61  )
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

On Thu, Nov 14, 2024 at 3:21=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 13/11/2024 19:04, Rob Herring wrote:
> > On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
> >> Add a new pinctrl driver for Amlogic A4 SoCs which share
> >> the same register layout as the previous Amlogic S4.
> >>
> >> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >> ---
> >>   drivers/pinctrl/meson/Kconfig              |    6 +
> >>   drivers/pinctrl/meson/Makefile             |    1 +
> >>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++=
++++++++++
> >>   3 files changed, 1331 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kco=
nfig
> >> index cc397896762c..3e90bb5ec442 100644
> >> --- a/drivers/pinctrl/meson/Kconfig
> >> +++ b/drivers/pinctrl/meson/Kconfig
> >> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
> >>      select PINCTRL_MESON_AXG_PMX
> >>      default y
> >>
> >> +config PINCTRL_AMLOGIC_A4
> >> +    tristate "Amlogic A4 SoC pinctrl driver"
> >> +    depends on ARM64
> >> +    select PINCTRL_MESON_AXG_PMX
> >> +    default y
> >> +
> >>   config PINCTRL_AMLOGIC_C3
> >>      tristate "Amlogic C3 SoC pinctrl driver"
> >>      depends on ARM64
> >> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Ma=
kefile
> >> index 9e538b9ffb9b..c92a65a83344 100644
> >> --- a/drivers/pinctrl/meson/Makefile
> >> +++ b/drivers/pinctrl/meson/Makefile
> >> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) +=3D pinctrl-meson-a=
xg.o
> >>   obj-$(CONFIG_PINCTRL_MESON_G12A) +=3D pinctrl-meson-g12a.o
> >>   obj-$(CONFIG_PINCTRL_MESON_A1) +=3D pinctrl-meson-a1.o
> >>   obj-$(CONFIG_PINCTRL_MESON_S4) +=3D pinctrl-meson-s4.o
> >> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) +=3D pinctrl-amlogic-a4.o
> >>   obj-$(CONFIG_PINCTRL_AMLOGIC_C3) +=3D pinctrl-amlogic-c3.o
> >>   obj-$(CONFIG_PINCTRL_AMLOGIC_T7) +=3D pinctrl-amlogic-t7.o
> >> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinc=
trl/meson/pinctrl-amlogic-a4.c
> >> new file mode 100644
> >> index 000000000000..edc5f2ba2c8a
> >> --- /dev/null
> >> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> >> @@ -0,0 +1,1324 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> >> +/*
> >> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> >> + *
> >> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> >> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> >> + */
> >> +
> >> +#include "pinctrl-meson.h"
> >> +#include "pinctrl-meson-axg-pmx.h"
> >> +#include <dt-bindings/gpio/amlogic-gpio.h>
> >> +
> >> +/* Standard port */
> >> +
> >> +#define GPIOE_0                             0
> >> +#define GPIOE_1                             1
> >> +
> >> +#define GPIOD_0                             2
> >> +#define GPIOD_1                             3
> >> +#define GPIOD_2                             4
> >> +#define GPIOD_3                             5
> >> +#define GPIOD_4                             6
> >> +#define GPIOD_5                             7
> >> +#define GPIOD_6                             8
> >> +#define GPIOD_7                             9
> >> +#define GPIOD_8                             10
> >> +#define GPIOD_9                             11
> >> +#define GPIOD_10                    12
> >> +#define GPIOD_11                    13
> >> +#define GPIOD_12                    14
> >> +#define GPIOD_13                    15
> >> +#define GPIOD_14                    16
> >> +#define GPIOD_15                    17
> >
> > The conversion from bank+index to a single index space seems less than
> > ideal, and looks like a work-around to fit into the existing driver fro=
m
> > a brief look at it.
>
> Not really, it simply adds a custom xlate per SoC, nothing particulary ha=
cky.
>
> I was relunctant at first, but since Xianwei added the plumbing for a per=
-SoC
> xlate, then it was easy to add 3-cells support.
>
> >
> > If there's not really banks of GPIOs here, then DT shouldn't have them
> > either. The question is does anything need to know the bank number
> > and/or index? If it's only for human readability (and matching to
> > datasheet), then just something like this can be done:
> >
> > #define GPIOD(n) (2 + (n))
>
> There's no linear mapping possible, each set of gpios is grouped into log=
ical
> "banks" per group of functions, and this grouping is also in the gpio con=
troller
> register space.

v1 had just that. So it is possible. No one reviewed the driver then,
so I don't know if that was less than ideal on the driver side. But it
looks like that linear map was just moved from DT into the driver. Why
are there a bunch of defines creating a linear mapping? The xlate()
function just converts bank+index into a linear number. At some point
you need arrays of settings I suppose, but why do you need a #define
for every index? Why not an array per bank? I suppose you could use
the above define within the driver to at least not have a bunch of
defines.

Rob

