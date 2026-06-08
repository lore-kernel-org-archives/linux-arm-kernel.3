Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F514CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sd0YG4NJYnrqOJ3l4vioxCsQYopEHLM78GABTPI8G8=; b=ft/NJVCV9dRB+kybgHFDp3oU7H
	o6wOXxsK/9PAQYr4FYpU+YBCz7G1edn0362yW8//AAP0A4Q96W+rRXl7XSgq8FvjslGT8C0bJDJiO
	dHZ6zLNvtMN9xuAwdNcPoSp1Aqn3dfww/jmrlI+n4rCXz+tY7bIG3HExEs34wVISipgmkq/jiZZQL
	RS91SkwSLI3HO1KBuu3Jc23mbIdDJkeZKOAaDcyW7bY7cYZ6puGSMCygMUB6sA4SFTqb6+n4U6XqB
	hDYo3boYHb3lfHx4ronXxTf1/w+bEiUYFvECoSkomonRUhR++wzdrEV6AFyuxjkcWOypSftVrQPg3
	c9KkJOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiXe-00000004Uu9-2dj6;
	Mon, 08 Jun 2026 22:33:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiXd-00000004Uu2-1F7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:33:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E84744532
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842D1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958036;
	bh=+sd0YG4NJYnrqOJ3l4vioxCsQYopEHLM78GABTPI8G8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=afTSL/VpAcfmg9KaNA3tK3UABJm13fvJBePwt4nmkI0QyMy30zXxTA0x7jJmUH3f8
	 +pQe29lMWvHYzNQngRJwSzI0fh+E+cPFMzssEbunZzfrI96M5HP2lIBUWrhj/Sqtnb
	 aOD8qxeMwg4fY8QMVxHhEo/AkE+fVf2zRmIoULsGYwWBLg00waXPYtS9AurVlohqHd
	 5GxYeQZ/FD3w5vrTcypUYywqEYu2dsrYb3GaWqWK/InabY7BrbccMQtwC7skt+VQMF
	 LKGp40LcihtkIcGSfKTb0ekiecObpuGrMogBrBR5xwDsTprsMNVmWL//dHFrwoz7Wo
	 7/GyPXXe6pBEQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso5132020e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 15:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mK3YNYhcWUl2o/WPXJxKvqCZqwCAPBMlhhzqFXr+R1UhQQH/ru/B7QuNKmxmw1/7IMlXBqMxtRpSaRKvduA8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Y5AH5WW1GJ220j3i1hyFWGANNCm0J0M7VGM/F8XtWE+fyiZ+
	z3AoRQpJWW/ntp91abAUqd+J508XqZX8YAKtUNpuAtWxs82FpKKJ2Lj/vH2qcxLljxf63A9G6lo
	aS1tOkm5upP8oxUHmE/dXMZIF7WKEhhc=
X-Received: by 2002:ac2:4e01:0:b0:5aa:6115:e4b6 with SMTP id
 2adb3069b0e04-5aa87bb76e1mr4983094e87.21.1780958035220; Mon, 08 Jun 2026
 15:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
 <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com> <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
 <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
In-Reply-To: <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:33:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
X-Gm-Features: AVVi8CcCR-63_uafKf1goL660j2RzMYR76efORAe2ZPvWCw_f0wQxO2Fdy03EZE
Message-ID: <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, Jun 2, 2026 at 10:05=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The new version (v10) has been updated to use gpio-regmap, with a virtual
> regmap bridge dispatching GPIO accesses to the underlying SIUL2 register
> blocks.
>
> I am not fully convinced this is the cleanest model, though.
> SIUL2 does not expose GPIO as one regular register space: direction is in
> MSCR, input values are read from PGPDI, and output values are written thr=
ough
> PGPDO. These are backed by separate regmaps in the driver, while gpio-reg=
map
> expects a single regmap.

OK I did miss that detail earlier, I definitely thought it was using a sing=
le
regmap.

> So the current path becomes:
>   gpio-regmap -> virtual regmap -> MSCR/PGPDI/PGPDO regmap
>
> The version was updated this way so we can review the approach on top of =
the
> current code. If this is still the preferred direction, it can be polishe=
d
> further. Otherwise, I think direct gpio_chip callbacks using the existing=
 regmap
> helpers might be a simpler fit for this hardware.
>
> What do you think would be the preferred direction for the next revision?

I'm pretty much happy with either version.

I see your point as to why you don't want to use gpio-regmap.

I also think the virtual regmap thing looks pretty OK, it's complex
but the driver is complex anyway.

What could make the gpio-regmap approach is that it will probably
get extended with get/set_multiple() at some point and then you
will get that improvement for free.

But I think you are the best person to choose what to use here,
if you don't think the virtual regmap looks good, then trust your
intuition and go back to the old design.

Yours,
Linus Walleij

