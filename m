Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFB5CC6B15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQzVrs0c3UvtqevA7XvTO2dEu5Cjq2oDofNx0flPKCg=; b=3/nyhQUmw7S6QeVAeG2/HMEd9b
	z0Jzi/rghuPWBC28CO0tD2RfN/zRFIGo1O/jnuHyA2jOiDMQeNC884nNYkZB6nvedfWaCVmiATuSN
	90TgKQPyBh74bfUs+O/8T4hTXxludjmV0oG9T2SrNPUQPP/oBkDUfzgro1v/zFgGzPe6g4BvNakWo
	AARFemHIrYSZBEHA8MC1aEyILKU4WEEiryRTm8eZ60CjrzqA9GcineNM08FTYK7A2rJm6Atfdwfoz
	WFOqRRc1p4/O+9py+rdE5gEwj4pRCNr2QYz3oIQhWolpURpTYq8Or3oIq97woYQDamMYQt7RJ/8Xn
	SuqXLFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGleG-0000000EDRY-0Ze3;
	Tue, 13 Oct 2026 23:11:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGleD-0000000EDRS-2GsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:11:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3AAB600CB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7531F000FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933064;
	bh=tQzVrs0c3UvtqevA7XvTO2dEu5Cjq2oDofNx0flPKCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cXnoMKNUewpGzi0kloDWjmhf/SKeTwdAKWxZK63VS3RqXI1gGkv9WbEss/R+6NtR5
	 afV8Xzak+mL1HcsPdSp3rfi/MDJSfxhvtOd/OApINRNvaemiYhrj5zxjh5Ab6isQ/d
	 43/RrcdFOTfW6rRhkyGbA446qMibkxdBosJUebvyj8ypY2Q0RKkjG3FyHVVgSLuaTW
	 Fjj1ki7atePwDeCeOF2BGAXzuC/UnB4J9eX2hNkmE5GJ5NS3izVSe2aBgyhhR+j1X9
	 p8+N41kn5vQntFvsR6l2BNYwhq3xn8q18tRqjDxPDzwiQqiyhsxksyPHlyoDn4xyU/
	 +jslPJBjMyGQw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a7754c2471so30825371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxqRkAy33+Oh+evn6psa+9w9BaAkq6kwDJ7crzJg10gpSbiPZHKzcRlCzdsUXNHtvYrv6iRXGpgtikLZJRenXJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLl8gHvxYUzBY1VKdYrADe4uopOIgVazlWpKXETgyZi3ROjwEUD
	NsOvz6mIR+Z5AOcjKniGAKHUFv/mnGI+Rc56FSQvycxLl+1PFjX61KIr4DJdK/Mc0Z+vRMXhAwK
	f8HJBiwzybo9geR430CqNCkZU6jkdOxc=
X-Received: by 2002:a05:6512:1586:b0:5ba:3c5e:2b20 with SMTP id
 2adb3069b0e04-5bcde6c08a8mr4390697e87.29.1791933063163; Tue, 13 Oct 2026
 16:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:10:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
X-Gm-Features: AclHuK849G_ijc3QWZ7kME4RYf6sglZkaE0fzQjq6-hvA40gFn4QJl3T4CzdDQE
Message-ID: <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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

Hi Peng,

On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>                 unsigned int offset, unsigned long conf)
>  {
> -       struct device_node *np =3D port->dev->of_node;
> +       int ret;
> +
> +       if (!mxc_gpio_has_pad_wakeup(port))
> +               return false;

Why is the entire call to mxc_gpio_generic_config()
bailing out here if the port does not have pad wakeup?

> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
> +       if (ret)
> +               return false;

Then no generic config can happen.

This looks weird, isn't it just some of the configs that
don't work?

Yours,
Linus Walleij

