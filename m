Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ED7FD5316
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfR75VbJwY42pMHmMmZD+9qJurzgVw+DNT17CVkxN6c=; b=kzRFvUSx4PBA8u+oea3cQUrpEy
	/Av3waz0WpJiRzMeIj/B3LWGuKLJ2RKiz4l2sDeZsB8bPlL7LC+sjIHccjy12CNeh5SYZZtXffXjC
	H6ISfpWDae2CRKTuRxxmZCKlYc5RHtvVZ0PuB1dlsIoQfkcbcuKBnzt6f3UeGNH5cclDGhDBOaNLB
	idgkz2OLMbeTiGEbXYniYcvckp7HRNmbwH09QMLP/B4rHfoh/+R2P9OO6HDLot6Db0nAZ2dr7XXiK
	0laJpesZA0TeiK/3TWVEDPIWwE/QuDP8d8ZL0NfdchWQXL6RefrifJTips9KnSr2g72GxsvcCcRpP
	kj5cVupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu1N-000000084ae-2MZg;
	Fri, 27 Feb 2026 09:20:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu1L-000000084aR-38h4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9E776133D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF47C116C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772184026;
	bh=S1nQyU+OxaqI2tjVc/itA3ceL+9l9+iwZz8vzA2HlYA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqs6Y0J99hDAK5/9IL3Jc+BV1ftykSYk2DNp4qZSZokW12vdYHifa+mDgDkNTN0+n
	 1nAVBNl/MuJHUH7TE0erioPA8+LUjzvXsXgnu9623fjE+u7uukdAZuUVVOuIdXcvAU
	 Zb7xLSCB8hdlwOuD/MvHRJK9e/9weEWYSr/vePjWTHVpAFl+ZZu6IfaJ6OfkDVw3Pb
	 +PY9qMvvQnD4Ayiuir1jjwPwRqd3cyNcOpVgR0+3b9hNJNToqdjg8Zi5yRgpI94/6U
	 +y05i577oifpw3DvWrVggvebPgYCsnz7fKxyAyNZwn999VDUngzqhyYAkqefYf8Zn5
	 SZ9NGNAmVMU7A==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986fb839f5so15661887b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 01:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWx+lYi11h3EPJChdq8XfiRR6gNtOAKDJBzhSqCKbYjpPT9Qisys0kIg0gi27VY468Qkwga0XOPbG3EWaMebho8@lists.infradead.org
X-Gm-Message-State: AOJu0YwvOuTFpXWTQJdJxxNsYKb0Ip0iktjUQIyQOyxyAfztVh9RVHb7
	K77X9vnIn1PHPFq/g0++e63Oits+4bYh1QJQS3hn3QPFHOTmTBmxRzAY4fKpcW40tYu4IKoXETY
	PL1m4BG1YU17v44qhsINlc22dIRxthSM=
X-Received: by 2002:a05:690c:62c4:b0:796:3917:7291 with SMTP id
 00721157ae682-7988560f22dmr18735227b3.58.1772184025950; Fri, 27 Feb 2026
 01:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com> <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:20:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
X-Gm-Features: AaiRm508vRiGuZWaxCw9uIk2jsJypknsSz-JUmqErGl52ejGnezFiN87PTsKfa8
Message-ID: <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Frank,

thanks for your patch!

On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:

> Many boards use on-board mux chips (often controlled by GPIOs from an I2C
> expander) to switch shared signals between peripherals.
>
> Add a generic pinctrl driver built on top of the mux framework to
> centralize mux handling and avoid probe ordering issues. Keep board-level
> routing out of individual drivers and supports boot-time only mux
> selection.
>
> Ensure correct probe ordering, especially when the GPIO expander is probe=
d
> later.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
(...)

> +static int
> +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                         struct device_node *np_config,
> +                         struct pinctrl_map **map, unsigned int *num_map=
s)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       struct mux_pin_function *function;
> +       struct device *dev =3D mpctl->dev;
> +       const char **pgnames;
> +       int selector;
> +       int group;
> +       int ret;
> +
> +       *map =3D devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> +       if (!*map)
> +               return -ENOMEM;
> +
> +       *num_maps =3D 0;
> +
> +       function =3D devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +       if (!function) {
> +               ret =3D -ENOMEM;
> +               goto err_func;
> +       }
> +
> +       pgnames =3D devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> +       if (!pgnames) {
> +               ret =3D -ENOMEM;
> +               goto err_pgnames;
> +       }
> +
> +       pgnames[0] =3D np_config->name;
> +
> +       guard(mutex)(&mpctl->lock);
> +
> +       selector =3D pinmux_generic_add_function(mpctl->pctl, np_config->=
name,
> +                                              pgnames, 1, function);
> +       if (selector < 0) {
> +               ret =3D selector;
> +               goto err_add_func;
> +       }
> +
> +       group =3D pinctrl_generic_add_group(mpctl->pctl, np_config->name,=
 NULL, 0, mpctl);
> +       if (group < 0) {
> +               ret =3D group;
> +               goto err_add_group;
> +       }
> +
> +       function->mux_state =3D devm_mux_state_get_from_np(pctldev->dev, =
NULL, np_config);
> +       if (IS_ERR(function->mux_state)) {
> +               ret =3D PTR_ERR(function->mux_state);
> +               goto err_mux_state_get;
> +       }
> +
> +       (*map)->type =3D PIN_MAP_TYPE_MUX_GROUP;
> +       (*map)->data.mux.group =3D np_config->name;
> +       (*map)->data.mux.function =3D np_config->name;
> +
> +       *num_maps =3D 1;
> +
> +       return 0;
> +
> +err_mux_state_get:
> +       pinctrl_generic_remove_group(mpctl->pctl, group);
> +err_add_group:
> +       pinmux_generic_remove_function(mpctl->pctl, selector);
> +err_add_func:
> +       devm_kfree(dev, pgnames);
> +err_pgnames:
> +       devm_kfree(dev, function);
> +err_func:
> +       devm_kfree(dev, *map);
> +
> +       return ret;
> +}

This is so close to the pinctrl-internal helpers that you better work with
those instead.

Can't you just use pinctrl_generic_pins_function_dt_node_to_map()?
It was added in the last merge window in
commit 43722575e5cdcc6c457bfe81fae9c3ad343ea031
"pinctrl: add generic functions + pins mapper"

There are problems with the above, for example this is only called
on the probe() path so you would not need any devm_*free calls,
as you can see in the generic helpers.

I think you need to look into using or extending the existing helpers for t=
his,

> +static void
> +mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *=
map,
> +                      unsigned int num_maps)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       devm_kfree(mpctl->dev, map);
> +}

Just use pinctrl_utils_free_map().

> +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> +                                  unsigned int func_selector,
> +                                  unsigned int group_selector)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       const struct function_desc *function;
> +       struct mux_pin_function *func;
> +
> +       guard(mutex)(&mpctl->lock);
> +
> +       function =3D pinmux_generic_get_function(pctldev, func_selector);
> +       func =3D function->data;
> +
> +       mux_state_deselect(func->mux_state);
> +
> +       mpctl->cur_select =3D -1;
> +}

As mentioned I have my doubts about this, explain why this hardware
is so different that this is needed.

Other than that I like the concept!

Yours,
Linus Walleij

