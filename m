Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846FD74ED8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=; b=EGUQHMTTPCGsy24QOKPl13rpu+
	6a8EofQyHg2rYy/ThoxCyiWHvCaAqiq5AgBlx20vVhHwKdLv3VgOY8KxFaiq5ldBSUP8Oez1zCj5B
	o/Oc5dnRwxjpNEiOXxi21g6IA3Mw08ywOMD7Fq6MGPK8xLk+f9zPpOBUcCkYJfSgCwHaVR5DgLXpU
	mBmRfzP/u7Tfgf8sGje5KYZ2kDL6RX3I5U941BpLB7af9gmWANulWZOeTCY8QpcEetsPisibaKgBq
	VmzFGmUM6hRQyH6TOYIJlCcNEUHuM3R7m6PDKydSJZsjxbHkT/4d3r8jY/TDo4jHDjP5G1K2tBstu
	0tLBOxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHeG-00000008zaY-3wBn;
	Fri, 23 Jan 2026 13:56:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHeB-00000008zZt-3sL3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:56:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so3270978a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176581; cv=none;
        d=google.com; s=arc-20240605;
        b=FLv0t4+tqdwY1GfGNWtvfV6DVVaTilVAJkGTuWGGLmgRMv1/Ntu25yuwjtGqll/Xk+
         OE5Eah3D9t+ziCEGyq+38Rvr1PuX0uM/eXUb5SlIBXLL9mU2PV1AxNjAxhnWdMQa7vld
         cTw4g4WQSrxsdy7HpfGH6Pwh4Zwm0FDoBwCWZwA09ZynG/3Ul+phEnRW0FaRw2ZQPbLh
         +C5Xnl6X4mK4QlnzcvhbQm8IXL0IEqXC+ioZsKBWXj8OSvg3aEYOoAbMAgdSyOla7ZrH
         PFonpTS0I+wYHGLktKL78MLGgmnYBLS9T5z6hPJH/0683Mxunv1kT2mHZ9SE6L7wsqNk
         6VIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        fh=zL4+fya+9tu06JwHTBfyU/7LbG2oNNSSDiV2A8/SYbk=;
        b=iQ7jg4WL1p3r8057nDRCiXalVEwSg7tAnx39t/06a4NvaPNoFLPRmJokxIzk3zmyG0
         f1+X4cm4ot2aBU34OgahCoPOCBauX6TRAUKb+RPjFi+KyC2c2geiOk5GfjUWhGvroxaz
         Oeni+haYEiO3Fwttk4pfdBGZQDUBofYILu6NI2A8AuCTxQtCn7skeuyu+Gig/7mCabub
         i6w5osjYgo1Dfk5fJqh860zMfuM9UaDx/AaBC29y8CA7RYUJ1tzp+xGzD1VEM6zckldS
         qGYKwiASLSIJT/RCoeLdehPzQLADjjTL/UuVFG7IW8bzlITVObcIlf2BJHXrz5sAhPgY
         hd9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176581; x=1769781381; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=h9TWoBA07wL8SKfyR0jif45b+y9ytgg2w5DnD9/KTFJvlT2oUQl/So/qfvCbjcdgeE
         BTBpTJXrIGfODCKEy0tXs6ZSRKQkVoUhcrjTKibHsWTEPMYv5V8kNOyz1/8VC5ds8nRP
         7a0jzm6+asYHCGsPjSWz+/wmuEXtC1LKa8R2L6+LO+SyaV2gk2je1zuesE6SAesD1gM9
         LXPAQUYRl5ulZ+cxBBug+JnXBEkT9WW7T3fm50GhAFUdCVkzfm68SjtaA0lxLv7NWT0N
         gGybBHDtM8f1kRPD/WjWYo/GoPq0OCcsj3WUeqiTk+yx4I5hijgW41ISa89piXlhRz+V
         9n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176581; x=1769781381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=QZTtePU9UXieSR0h4A1B0d7EGY+oAhoDqOh/dRyQ23LqbhITpY/Mh43QTUl5lHrfuH
         2/Ve8DmzIyu8kct6MV00B1dNHPBGWPGl9GjOQ26iQsRBLGTVJBHjW+OcgLDHX2ldC3z+
         i4fGsgVGuqVfkWQJe1JMvNrLhYqHwDYjmYyfbneTIdhBKgb0Nb5Xsjg/exoNZ7X/ODrU
         JysgEavYA0OfDXTUK6DnR445IDPJ1TWngedr+T99blWC7v3mUAbQ40VrOBGu64Nv6ZnD
         yuFVHjZCK43A3CXMkd6Vny7CcrWh05ZydOuriHVYmEBD7SkffMJ/8HbgOsBCLMTncF+e
         BkRA==
X-Forwarded-Encrypted: i=1; AJvYcCVcmfHxNucSXJS2WhxF0qjSwS3ZdgVz2MYaSCxr/q/A5McfYuhEsWTPwVQTYezAhN58s3UnPaZKiXEHgjowSmYa@lists.infradead.org
X-Gm-Message-State: AOJu0YwlufPg5iDxmc+aS65iQFRETQlOxMnR80fsdk+U0zeUdzoQN4O/
	S0jAzXKzOrj/NIRj5XwH8kn4DxkJKZnVd0FNFYHii35346PLlwpFt7gQvOwNGOaDsUOolMcDEHM
	w7OPiR7bl8CTrPtzGaREyD1egjwJ7eU4mzAcEIecC2w==
X-Gm-Gg: AZuq6aLzqZpzs7KY5Q+eqCseqsWnkHRm0Ymke+7m/TRcSbKEpffNVqkXZwIJ3Inijsg
	SN1uq0JsGiWEcJ+WVOMrdlEPDRuVS4iwLc0p8QtQPLp4OquJe4mZhVZ8ZxdMINQ9nUCYL/LSNH/
	BwMzseGcYl+QcTn5tidUB+KkFBot90C/GmXCTaH8XAQN6SvIesshXLjTTZZkUIZyoC4LIuR66ca
	VBrg40FwJBzHLmDTcD50kMV/cp+uCIlwGj1QU8KF513RqR2oPkCUahWoz57AcMR5nFgt/UCELh6
	y0aTEQhVzdgaBreaaP7xfuch
X-Received: by 2002:a05:6402:35cb:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-6584868efb4mr2064138a12.0.1769176581281; Fri, 23 Jan 2026
 05:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:56:09 +0100
X-Gm-Features: AZwV_QitT_JBj7lN6X8pXiBMkI1LXoq3ivXbG1n_-sBl-TpYf_jVZTRwjJZibTg
Message-ID: <CAKfTPtBCmwL3fpQuWp12HST9Nud583+QUs_BNBA48z9xRbcf9g@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_055626_313017_9BE5D486 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, 20 Jan 2026 at 12:59, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for the existing
> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
> coupled.
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

[..]

> @@ -1068,5 +1318,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>
>         dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
> +
> +       /* Legacy bindings only cover pinctrl functionality. */
> +       if (soc_data->legacy)
> +               return 0;
> +
> +       mfd = dev_get_drvdata(pdev->dev.parent);
> +       if (!mfd)
> +               return dev_err_probe(&pdev->dev, -EINVAL, "Invalid parent!\n");
> +
> +       gc = &ipctl->gc;
> +       gc->parent = &pdev->dev;
> +       gc->label = dev_name(&pdev->dev);
> +       gc->base = -1;
> +       /* In some cases, there is a gap between the SIUL GPIOs. */
> +       gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
> +                   mfd->siul2[mfd->num_siul2 - 1].gpio_num;
> +       ret = s32_gpio_populate_names(&pdev->dev, ipctl);
> +       if (ret)
> +               return ret;
> +
> +       gc->set = s32_gpio_set;
> +       gc->get = s32_gpio_get;
> +       gc->set_config = gpiochip_generic_config;
> +       gc->request = s32_gpio_request;
> +       gc->free = s32_gpio_free;
> +       gc->direction_output = s32_gpio_dir_out;
> +       gc->direction_input = s32_gpio_dir_in;
> +       gc->get_direction = s32_gpio_get_dir;
> +       gc->init_valid_mask = s32_init_valid_mask;
> +
> +       ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);

Your mfd child device doesn't have a DT node, only its parent has one.
How do you point to the gpio controller in DT with a phandle ?

You probably need to create a child DT node


> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Unable to add gpiochip\n");
> +
> +       dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
> +
>         return 0;
>  }
> --
> 2.50.1
>

