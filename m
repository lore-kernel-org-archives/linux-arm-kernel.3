Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6647C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFB4Bp0YBQbqUpXC3NxsL0hV18fZ3rk9FR0tAgGa+/g=; b=WT3n9RVJfLDr37w5mN4GCy6Lkn
	ROK9SfQlFxySTvTWBoPLFWd1zBw17UT2lZ1u4gnriLl4p0xK5nMopwT2XFNi5HuUbmTdj8EhLo/zs
	ShpKgS3n99VO4/cBlywIRUCFRrk7OipjC+slfaVew0cEp7gc76gfQNwm4JPD+o4h73Cr8ZRNA0I0I
	5HBDoOE8hvDirDI+lXD8Z+bWsJFeIfve1HgGn/d4jkc0PWjs7rtr3GOToRP/Vg+wDH7WlgCMtdiFj
	49sHLOGyBjVmLHAhW/OHwpxGIkUz5FCDLuM9uDubq0lN22NB6Cf+QEp0dknqpXzppmtHO2UFDIECy
	TiBooz8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBJ-00000001J3z-0oQy;
	Wed, 01 Jul 2026 10:28:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBH-00000001J3t-29wg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:28:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD36944080
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9450F1F0155F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901714;
	bh=dFB4Bp0YBQbqUpXC3NxsL0hV18fZ3rk9FR0tAgGa+/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZdoysyy2AwRuTceUJvoZOL/a54sXju0V3+M5KCqODyfHx4KHWmATSxu7JqEhANNY
	 ds+DQ+QWVwMaPYit9Rhmzfn6G2KLkXwYr+s4wdfp0kUEQ855d0yIvs8zOyBlUjduHI
	 3b5rtwzj+JvIJ58Kj5V9LWPRuQn/ORN6voCKSUS04uslmBPf5Ui6DZJrii4/k7BpFX
	 7ZvnDWg8r4Ik/roEq+O8JaLkUxklpFWLVPaUijKuOMIOHmz/aDQ2d3wM1mswr3ZKmM
	 VvgBrzc7uF4b3s3tj46EZW6aqz0oJXf2ccrqW0qK785u0/a4hJIa9DiB3k0bPKrmvh
	 8Ecrf13lGbp2Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b349ae174so1971471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpNawvKgBg+EopZDuuaLHlfuPIsZmX0S2tb4wHN0Tz+IHwCTXgH/50nCz8M60raoVH+Ik3X8m+3HvT805CgGpeI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/m2CHAugahecfm+fQqWpzxdSxvBPXlm+cBsQTH130lHXn9Zrv
	qLZCr+jTYHb00g6mAzQ/Aii2gVQgYXSib6NpXA9pPq88bMNOXvYKxFlr7u4O+HeuVnFYtS47UK3
	+B4ZxRWRSkXvqSvwzfanxz1HwqVZRbiU=
X-Received: by 2002:ac2:488b:0:b0:5ae:b7d4:b68 with SMTP id
 2adb3069b0e04-5aec801077dmr7489e87.2.1782901713165; Wed, 01 Jul 2026 03:28:33
 -0700 (PDT)
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:28:19 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
X-Gm-Features: AVVi8Ce9zRwSC7YWDdpFS7YxJ1muCcN5kO1IIt7fv-PQnrz6ioPZPYbslWakb_g
Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
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

Hi Khristine,

thanks for the updated patches!

On Tue, Jun 30, 2026 at 2:54=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> Andrei Stefanescu (2):
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: implement GPIO functionality
>
> Khristine Andreea Barbulescu (4):
>   pinctrl: s32cc: add/fix some comments
>   pinctrl: s32cc: remove inline specifiers
>   dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources

I applied these 5 patches to the pin control tree.

>   arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
>     node

Please funnel this one through the SoC tree.

Yours,
Linus Walleij

