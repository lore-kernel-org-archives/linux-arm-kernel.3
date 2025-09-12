Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1074DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg7qWRUKABPmJe9YUV85wwqlEXsnIyAFDE3XX1No4O4=; b=w+wqRu8OK3LaIuiPM0sKacPh1O
	aD4Y6x5VIf03zhJhA/R+vYNXLTZOXxy27RMvwqyEhO5Kpa5GDHIaZtomnq5HqpSC7z8W7KWLZJAlf
	b549urqV5IrAhFRNi0xMXlZwXlgRefhCUwj/SZqY38XjCZwZbzp4tYASiW97pksLPiAJwgPJHJ8FS
	21tRlyHj794O1brTliQuc+oC23At+oUILmjQWzLIWjnTlYO/IC5hSbNrKK/CsuAHyUHFz5M/9F7L9
	QjXE+C5K+9b/fYLSSnX5uXO6xJ05MKBNdukKESnW8GtWsHh8T3uGQLanyo6Tsl/CgJBh39RcO357o
	UgFyHwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Qw-000000092V7-2yWI;
	Fri, 12 Sep 2025 11:59:18 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Qt-000000092SJ-46yk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:59:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55f6017004dso1974733e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678354; x=1758283154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg7qWRUKABPmJe9YUV85wwqlEXsnIyAFDE3XX1No4O4=;
        b=XXHOxrI/Sy5cbdwkNvrXYHXtQbtsLmhX1wNHL9Snq8lM6AcL9pV0CSFPPmo7YDUfoB
         eHDX8t60GnsUIepPtQiJ4sb4kI7sYK9Ag9FMhRvUPNOPIqky4yPFyev/pp5LSe70yeeL
         yrMR/gs5pppSpshVXZ6CYFw/XTAMWqPrU8st6rtFPPdhdtaQqcHypKDDpodDDApZFn4O
         ijrWG81o//LK5uN9YXYTNjxbyUwvW8GBHUt/2CZDgZwk/MPXuyEWVPOlaOtoMTJH4b5N
         agFK4cahlK9WSVEB+m+D56XmE7nm08QWqmm1goRES6BVbM3yDh2moeWJxv532N/SYd6u
         zDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678354; x=1758283154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg7qWRUKABPmJe9YUV85wwqlEXsnIyAFDE3XX1No4O4=;
        b=qPUIthlIHpzNzsYk1kNzefH98BljVxrA/dsfY86aqGjruuVAvZk1mo2ySuiFCeWHBU
         uB0b4FKgJt8NdfQOCkCDB1azHaYkAClByIFUopunlTotIsCM6WVfZkvH6+tPO61i0iq8
         q8Apo/bz3GX+fcL95+mipMN3eiw+t+CtHP+kT9LSV3f9+EyR+9kjMe15I8skDWm9fOXL
         fbtYkXsN9TL+449uZjCcbP9kw+3AgCCwVPFBJhoFZvDireTWnHFsnmlJIF2MbBO8zNws
         e/lEhzeMl25AwI9jeyBDeMrBgTzsEqiG+U+6gY3sK8AeKkEOl9MrkhQb+28YF5L9m7tu
         OG3A==
X-Forwarded-Encrypted: i=1; AJvYcCXcCLWY4keeruEqM0fx+f7Ea7bGkCUFexHq8HJo9AOPI3M3jpaZVX/FT8SSPKta4IFnSqhGxEwtRl7aSi3hgo2a@lists.infradead.org
X-Gm-Message-State: AOJu0YxirIPFqIDBm8W6a2OBNjIFYMlZ4frMGmxrsEFfFMpa6tq/kwuc
	1YhmAFmrJmqol4bde07lHaAh099F1M2afO+6eUicdTc4PVwtME3RZlBSimRP35R2qzJAIjbW3Fv
	xs9F4Er/T0FRv3XsRPwpFXthga7+MV4xypfupD5Uwwg==
X-Gm-Gg: ASbGncsrSGpfCqxzxyUXKCuoqTeVf1ISXJKIOFv4TxrbS8gIOq1csaaouRZBKugz2ou
	MwaYExOfzeHtDOIIDENQLteewRrZoAhGtvh6mC+t2Dcde9POwnfCfA0jCpnkNgtulQtFJZnvIBJ
	mq9jXlwVzRmiHTQo0s/d2KH8jWat2vSvxHEMTDSZB9Vik2VOHEGkI2ANXV40JbbKnVuAG2DYe2B
	y2MF8o=
X-Google-Smtp-Source: AGHT+IGeZRJRiB/LmqkbexVvmZJ7WX/3/khEzl2E2teMJl+0sV9Tw4l6WBQajDk3wJg2rzu7bsPpdTU3lciwtrFDvjM=
X-Received: by 2002:a05:6512:234b:b0:55f:3faa:7c02 with SMTP id
 2adb3069b0e04-5704e7223e3mr905200e87.40.1757678353719; Fri, 12 Sep 2025
 04:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com> <20250912060650.2180691-2-gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-2-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 13:59:00 +0200
X-Gm-Features: Ac12FXxgQqTM_v6IlK5tuOK400vNP5lgdVRrVI1BjBu-zlzI4VXvJPt0wi-IxX4
Message-ID: <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
Subject: Re: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_045916_079220_19A55F4D 
X-CRM114-Status: GOOD (  30.68  )
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

Hi Gary,

thanks for your patch!

On Fri, Sep 12, 2025 at 8:06=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Add the pin-controller driver for Sky1 platform
>

Add some more description of the pin control on the SoC here please.

> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
(...)

Config structure in Kconfig looks good!

> +++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
> @@ -0,0 +1,581 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +
> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "../pinctrl-utils.h"
> +#include "../pinmux.h"
> +#include "pinctrl-sky1.h"
> +
> +#define SKY1_PIN_SIZE          (0x4)
> +#define SKY1_MUX_MASK          (0x180)

For masks do this:

#include <linux/bits.h>

#define SKY1_MUX_MASK GENMASK(8, 7)

GENMASK generates a bitmask from bit 7 to 8, 0x180.

If its a 32bit register you can use GENMASK_U32() to be
even clearer, etc.

> +#define SKY1_MUX_SHIFT         (0x7)
> +#define SKY1_PULLCONF_MASK     (0x60)

Same idea here.

> +#define SKY1_PULLUP_SHIFT      (0x6)
> +#define SKY1_PULLDN_SHIFT      (0x5)

I would probably do this:

#include <linus/bits.h>

#define SKY1_PULLDN BIT(5)
#define SKY1_PULLUP BIT(6)

Using simple bit references to define what each bit
is for.

> +#define SKY1_DS_MASK           (0x0f)

Use GENMASK()

> +#define CIX_GET_PIN_NO(x) ((x) >> 8)
> +#define CIX_GET_PIN_FUNC(x) ((x) & 0xf)

Maybe define 8 and 0xf as shifts?

> +static const struct sky1_function_desc *sky1_pctrl_find_function_by_pin(
> +               struct sky1_pinctrl *spctl, u32 pin_num, u32 fnum)
> +{
> +       const struct sky1_pin_desc *pin =3D spctl->info->pins + pin_num;
> +       const struct sky1_function_desc *func =3D pin->functions;
> +
> +       while (func && func->name) {
> +               if (func->muxval =3D=3D fnum)
> +                       return func;
> +               func++;
> +       }

Using a NULL func->name to terminate the array looks a bit dangerous.

What about adding:

> +struct sky1_function_desc {
> +       unsigned char muxval;
> +       const char *name;

const char * const *functions;
size_t nfuncs;

> +};

Then you can use nfuncs to iterate over the array of
function names, and define a macro like this:

#define SKY_PINFUNCTION(_muxval, _functions, _nfunctions)   \
(struct sky1_function_desc) {                                  \
                .muxval =3D (muxval),                        \
                .functions =3D (_functions),                    \
                .nfuncs =3D (_nfunctions),                  \
        }

And then this:

+static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
> +       {
> +               .pin =3D PINCTRL_PIN(0, "GPIO1"),
> +               .functions =3D {
> +                       [0] =3D {0, "GPIO1"},
> +               },
> +       },
> +       {
> +               .pin =3D PINCTRL_PIN(1, "GPIO2"),
> +               .functions =3D {
> +                       [0] =3D {0, "GPIO2"},
> +               },

> +       },

becomes

static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
    SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"),  "GPIO1", 1),
    SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"),  "GPIO2", 1),

I don't know about using the PINCTRL_PIN() macro here though,
can't you just put in 0, 1...?

Anyway I think you get the idea.

> +static bool sky1_pctrl_is_function_valid(struct sky1_pinctrl *spctl,
> +               u32 pin_num, u32 fnum)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < spctl->info->npins; i++) {
> +               const struct sky1_pin_desc *pin =3D spctl->info->pins + i=
;
> +
> +               if (pin->pin.number =3D=3D pin_num) {
> +                       const struct sky1_function_desc *func =3D
> +                                       pin->functions;
> +
> +                       while (func && func->name) {

So here you could just for (i =3D 0; i++; i < func->nfuncs)

(etc everywhere)

> +static int sky1_pctrl_dt_node_to_map_func(struct sky1_pinctrl *spctl,
> +               u32 pin, u32 fnum, struct sky1_pinctrl_group *grp,
> +               struct pinctrl_map **map, unsigned int *reserved_maps,
> +               unsigned int *num_maps)
> +{
> +       bool ret;
> +
> +       if (*num_maps =3D=3D *reserved_maps)
> +               return -ENOSPC;
> +
> +       (*map)[*num_maps].type =3D PIN_MAP_TYPE_MUX_GROUP;
> +       (*map)[*num_maps].data.mux.group =3D grp->name;
> +
> +       ret =3D sky1_pctrl_is_function_valid(spctl, pin, fnum);
> +       if (!ret) {
> +               dev_err(spctl->dev, "invalid function %d on pin %d .\n",
> +                               fnum, pin);
> +               return -EINVAL;
> +       }
> +
> +       (*map)[*num_maps].data.mux.function =3D sky1_gpio_functions[fnum]=
;
> +       (*num_maps)++;
> +
> +       return 0;
> +}
> +
> +static struct sky1_pinctrl_group *
> +sky1_pctrl_find_group_by_pin(struct sky1_pinctrl *spctl, u32 pin)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < spctl->info->npins; i++) {
> +               struct sky1_pinctrl_group *grp =3D
> +                       (struct sky1_pinctrl_group *)spctl->groups + i;
> +
> +               if (grp->pin =3D=3D pin)
> +                       return grp;
> +       }
> +
> +       return NULL;
> +}

And this:

> +struct sky1_pinctrl_group {
> +       const char *name;
> +       unsigned long config;
> +       unsigned int pin;
> +};

it's a bit conceptually weird.

Usually a pin can be member of many groups.

The only time this works is when the pin controller is of the type
where every pin is placed in a single group with only that pin in it.

And that seems to be the case, because:

> +static int sky1_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       struct sky1_pinctrl *spctl =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return spctl->info->npins;
> +}

If this is the implied pattern for this driver, write as a comment to
the above function that this pin controller place all pins into a
single group with one pin and that this is why this works.

The normal (as can be seen from the pin control documentation
https://docs.kernel.org/driver-api/pin-control.html )
is to group pins, so e.g.

uart0_rx_tx_grp =3D { pin1, pin2 };
i2c0_sda_scl_grp =3D { pin1, pin2 };

Then this is combined with functions such as uart0 and i2c0:

function, group
("uart0", uart0_rx_tx_grp)
("i2c0", i2c0_sda_scl_grp)

Here you see the two pins are used for uart in the first case
and for i2c in the second case, it's the same pins, but members
of two different groups, and these groups are then used with
a function.

The possible functions for a group are then defined somewhere
so these settings can be applied.

Maybe this pattern is something you have in your driver
because the code was copied from some other driver
which use one group per pin, it's not certain that this is the
best layout for the cix SoC so look it over!

The pinconf part of the driver looks very good to me.

Look over these things, and keep posting updates!

Yours,
Linus Walleij

