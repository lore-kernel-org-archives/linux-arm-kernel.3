Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EAECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfwHzHA2XUsT+8TtCjyDwFEfJ3aVEcB4nEfq8icciTc=; b=x12ltc0cYSakPR2583K10NVKhh
	z/MjCMc+QRgDKpE/3psG0A0SKUP/9p6gG+YqpeIeSTM56C2fTsfUVT6c6+Od8xgzyUiQyg8x5G6u3
	HhkbOSm/A0KjNqmiWGFSs5XS5+zlKiR2xubxzbEIJVpLHHbDLIMq5sibxm6C2Ru/bxQFA5ABjf4zP
	T5w7oCZdTPBezEsDklVQuZTSiSnILRsRwVuwEVp3nKDru7aVO2TkwSqolspinhnx0OamV9/bckfO9
	vZyLGFNv77PK1gJyDkfFa2jdPdoKB4PnwcyiIbXnodTZ6C/7/rkSZaVz7hszldUi1yZ4Pv3rTXuwl
	T/OJ7kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiGJ-0000000Cz3E-20f9;
	Sat, 23 May 2026 09:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiGG-0000000Cz2h-3Fui
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 09:03:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A81F744531
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5DF1F01562
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526991;
	bh=xfwHzHA2XUsT+8TtCjyDwFEfJ3aVEcB4nEfq8icciTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pv+bdJyb2SZbYXqyk/FDdWCjJKz164AAxhBCDv3Ht1A+I2C5JfpTXXYRZ5NCRMqtS
	 GYRzCBM4e4KhUZtkli3dknFjJdnLJYk017aofGIwyyi7N7gLHPUUnuhOSHzeZOyuYi
	 db4GXBIQGlSzm/OMbAKMniy1tIBM3XILWl4+52Ps/gljOOjtOP540WIziC7rtkS+pp
	 IWzkPv4pFCoBO/xVRpTdzcIz4/pEJsc0IzIWH3z8Z9pIS0PcI/QaHqszaXoC17Ya98
	 DdxZehH+xtO/lu+6pie4M26ds7Wi95yCmxUM+38kdg4yMVrYVXUxlmby46YidNtqSz
	 A9k7HJXRkrZrQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a858881ad2so10436306e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 02:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9TL5hUwGsP2PvF1JvOLjxJJHg3PNAUtarDlum/7Eob3eppedpa+Oz9OnmQ06/qieVVimLuoDZiKqyw/+xmJUy+@lists.infradead.org
X-Gm-Message-State: AOJu0YwjMoszTbM69+0HBj9NYslTYhIm+RvX1RF/b82SzE4gipuo/SSS
	eszVhfqvlTmqtikGUA517meA3dgN9k0tV/aP8MKoAfTbcIub9/jvmYUN/cp+htZk9qiCH4ONkIK
	ujtuepqc2L1DBT4yeUtWNnwFbajDRMHg=
X-Received: by 2002:a05:6512:2303:b0:5a1:b83:c7cf with SMTP id
 2adb3069b0e04-5aa323713f1mr2715311e87.25.1779526989899; Sat, 23 May 2026
 02:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
 <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810> <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
 <agNFaXbd_sMq5eAo@lizhi-Precision-Tower-5810>
In-Reply-To: <agNFaXbd_sMq5eAo@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:02:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=q2+ygUxPPAL7xgivFtMDWF+_0hfYYcXSdqLw65rZd0A@mail.gmail.com>
X-Gm-Features: AVHnY4IVbnMCkexpYe7Hj6Yl5u62bH3gkmReeN1Qdk5zM4QytaZR9MQNjK9gv8A
Message-ID: <CAD++jL=q2+ygUxPPAL7xgivFtMDWF+_0hfYYcXSdqLw65rZd0A@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_020312_840573_C284D022 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue, May 12, 2026 at 5:21=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Mon, May 11, 2026 at 10:34:35PM +0200, Linus Walleij wrote:
> > On Mon, May 11, 2026 at 9:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wro=
te:
> >
> > > I fixed a build warning by missing doc 'np',
> > > https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/
> > >
> > > Anything need me to do futher?
> >
> > Sorry was busy!
> >
> > Applied this fixup on top of the branch and merged it into my
> > devel branch for v7.2!
>
> Sorry, I missed picked up fix patch during rebase.
>
> https://lore.kernel.org/imx/20260512144806.22447-1-Frank.Li@nxp.com/T/#u

Ooops I should have seen it.

Applied it now!

Yours,
Linus Walleij

