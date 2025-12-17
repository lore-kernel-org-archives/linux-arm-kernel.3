Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49907D66BA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM/V/k/fSUtW462XR6FXOM+8RdQaX18bynBaXcytSDg=; b=SERT1hMhHsfHydqQlU5C1P3/h1
	I12sQUFTmTquXvBsy3Dhv0/ihQuLfMc1A1ZU25q3oYqTekXTYoSC8u/qRJ0onOQsm2SkZ/eOjORlr
	hELWCzt7hhxtYuBNCq7fBBweeK00+514ay72IiuP0E9bgGk2malSm4ngd2EQWgX2Wl9reb3R54QX7
	C+N5zVskZjVqOhJTLkfM1TJVOfYgd66VFw/j7Mn+Dih2CRNtaUdnbbpmS8kUR6PnV3HYbKgpSj0eO
	lz0yIqQdGakHYHgIoDpRWQ6m3EsdWXxCtQ28M6EIn8gOMhuxEKkI6g3VJXwDpM9oFf7Vr3nuXViUo
	dKY8Icgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxv2-00000007MTB-1cg4;
	Wed, 17 Dec 2025 20:14:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxuz-00000007MSi-3os4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 20:14:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7a72874af1so956943766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766002479; x=1766607279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM/V/k/fSUtW462XR6FXOM+8RdQaX18bynBaXcytSDg=;
        b=C5uFFYXmy4njvccB+bWknmaiHdOv8OQjBrQZ4lt8kX8i2y6Btku+uugfp374ZsjvNF
         r4gmo0FZu/yohvNO8FyYJZPMVpuFdoBfn5R0ETDOnsopR05WxoJXL6+cB5PZJhuQZqxV
         3J51eI6bTC7k7m6qSpUcU63Ns/2DJ9yhdFF6hOYLe65YU2Dx1pJJYDY4O9NB7A0j3ZDY
         gePufz+BEKrThTT+rZxeUCqD5qnI+FsHCfPeaM0M16bvGM8w1piTpl0zPku4jJyVeODe
         7xDMIqAqr08Xt3d/LjEFqxPP74f0q8anKtCq+zE0NR/cw1R+6ayMiT6e/KPbx08rzfqZ
         Tfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766002479; x=1766607279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tM/V/k/fSUtW462XR6FXOM+8RdQaX18bynBaXcytSDg=;
        b=snVPJrDIoCC9ey6VMXGflNq4+NkVRsGXZUVGDrUUlp1nA2Qrdv02FncNEq7hzWAvak
         DZwIuq2G6vlCRiN952pM2WPjXtLqxCSFVpqbU63jnV/sJQ5REWj0aE+OkIS+gOutuWOg
         wwrGrQ2ikcQ5uwKmnmNkB24VTQhmsmpf6vhy9qqZe1AWtYYRYCPPBJheSMB4XXQYNllS
         pzlv09rke1oGalDsTdB216PSx6HzIv2wseeKPi5YsK3jua+76a/isGMpueYm4HUKZmUa
         lszG5sLw/NHsJDtJZ3HHrtiKKZGpmf7R93w31klB923tyH/y3+C9kkMvY6a8avAkH44M
         nejg==
X-Forwarded-Encrypted: i=1; AJvYcCWNzvhVfBgLmTTrU5GJv5kHRbz5njzXYL8U56GOeM/YHHyHgJQ5zDQxsrJJc0kSTRBGfObbZDhhC7tzKA9Wq/+I@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQBWserVCYKkNlqd5yT3kUh/3M+dmebcmmycR9On3H7VPr3sE
	gVTDIfz2HjoqcfEiFUcIfRQHvhf0lREAuLlotsZrgPcChktC71nCd2RASJrYM87aNudcWEBBTuG
	yYlWmb1JRoPuCWc7dipjfhR01xAXWanqpv42l/BiY
X-Gm-Gg: AY/fxX7atuONnLeCPS8BYH8TbclNT1pyCKC/JB4aC7pGLFSeJFWj8KqbMqHMFRL1dFg
	6vv/GcSTg852RgWqAqecjyDsNPYhjtiKvbYKQ+sfY3TRtLXZ934hv+jYHHgtrJ/sUzKfmTV80H0
	TPtHHdBZudaE74bO7naL1bT8FfrojmSFLa9GxHl751+cnmmbABE4YqdEU6kEne4FxWhuxL05eaK
	UiMiDKxP+YHjUT09CejJHz0BPaW86+iQ7/Hgicw+4+LUeVDXyeJAwm23cXXRofaq1ZCNkK2SUai
	9n4W8rYPLMRXLbkG01RF6a36Dw==
X-Google-Smtp-Source: AGHT+IG4PFt6/xl6TY17qdZDo/fSC5jvUriMDmtoPhK6WjCwoIZvzT7uFwVBMWf3+gIeet+IH6pEPp4HA0evjsAE9aQ=
X-Received: by 2002:a17:907:96a6:b0:b79:d152:566a with SMTP id
 a640c23a62f3a-b7d236ca22emr1906214666b.28.1766002478506; Wed, 17 Dec 2025
 12:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh> <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
In-Reply-To: <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 17 Dec 2025 12:14:25 -0800
X-Gm-Features: AQt7F2r-ws7J5EyDz0pvtMEQpxK_o2RQbdVkWKJTgzdUasSvuVkdkxrUDLQsMMI
Message-ID: <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_121441_994878_8A1A1C2E 
X-CRM114-Status: GOOD (  33.69  )
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

Hi,

On Wed, Dec 17, 2025 at 11:18=E2=80=AFAM Roy Luo <royluo@google.com> wrote:
>
> On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > > +config USB_DWC3_GOOGLE
> > > > > +     tristate "Google Platform"
> > > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > > >
> > > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > > work?  Shouldn't tools that check for "invalid config options" trig=
ger
> > > > on this?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Hi Greg,
> > >
> > > The menuconfig looks like the following and it doesn't complain:
> > > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > > | Type  : unknown
> > > |
> > > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > > | Type  : tristate
> > > | Defined at drivers/phy/Kconfig:104
> > > |     Prompt: Google Tensor SoC USB PHY driver
> > > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> > >
> > > According to Kconfig documentation [1], the unknown symbol
> > > would simply be evaluated as an "n", which is what we want.
> > > "Convert the symbol into an expression. Boolean and tristate
> > > symbols are simply converted into the respective expression
> > > values. All other symbol types result in =E2=80=98n=E2=80=99."
> > >
> > > In a different Kconfig documentation, an environment variable
> > > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > > undefined symbols in the "config input", but I can't find one that
> > > catches undefined symbols in the Kconfig tree itself.
> > >
> > > That is, the tool seems to allow this.
> > > However, if this turns out to be a major problem. I think we
> > > can either:
> > > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> > >   the only dependency. Then add ARCH_GOOGLE back
> > >   later once it's in the tree.
> >
> > Please do this.  I do not want to take patches that purposfully add
> > dependencies on config options that might, or might not, appear in the
> > future.  Please just remove all of the dependancies for now, as they ar=
e
> > not needed, right?
> >
> > thanks,
> >
> > greg k-h
>
> Greg,
>
> Yes, we can remove ARCH_GOOGLE for now.
> To clarify, we're not removing all of the dependencies, we still want
> to keep COMPILE_TEST for build tests, right?
> Please let me know if you think otherwise.

I think you'd just remove all of them. Normally COMPILE_TEST just
allows folks to compile stuff even when they don't want the ARCH. We
can can add ARCH_GOOGLE back in later once the config exists.

-Doug

