Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8231C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7Nv3D+LAVl5eGsM7/8TZo2OXjqL6TT+3lXEOOWeVno=; b=GckKZy/SLptmZZkULY5zAuxXDv
	ShndCkJ/H4plH97WDudU69O2SpPLYi3X7+idPspBVVpBQishBEnJ9QWYW8c4wekZpJOYZUmCu65fH
	gEeQpwFKbspvwgf5vXgOVV9KN5QLyZXsfY3ZUOGAx17iVjYQ1njqGGa3Pbs0vGlV29LSxC0k9GY8F
	q4glB04LQRF9MzVOH1jgT1/nzjBtI4YHHtbKzOXeuRfLfj52QAGiJTsie19UrRfIJRE44GjUA929v
	nIFV8/zmZA0dltjb8a90UFhPqh9jgWq3h5QKu2IRpLda7ReuPl+sHp4H/YxITcMjPiGhZu8yyrpeX
	Zxjd/qXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6spm-00000009mxa-3rRl;
	Wed, 16 Sep 2026 16:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6spl-00000009mx7-2u4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6016743C9B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425951F008A6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577409;
	bh=L7Nv3D+LAVl5eGsM7/8TZo2OXjqL6TT+3lXEOOWeVno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JRfWJMYb32Rm+IxTGvWpJpVsMLrjJ68BqhbJ1lGRrYsTjhE1OZfZj1qbzkB0veld6
	 aydd8hcy346Zxb6783g1qefug17abCGHwEEP5EzN/vTF6tUlqT5ZPT9NonaNcBN6Mm
	 iFHRI8HRf+oFvcyk19LmsMR/ieQvjycJb8CfLWsfTiXI1BT7/RcsPiDeyUeP4sl6Te
	 lG7eTE1DFCyEJnR2F3YWWd+EREGj4zAlFNo6xxzQLZbMu98CG5M/4U6F5hTA659o1r
	 atcvb2ngG2XHrNfqUI5igAlUejpBaeyRareRjXW7WalzRDlX5tkNV+y19q3/HKoiYf
	 MIIkl+PwLwMGg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76462aae9so904923e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0TiO+DipYTRqpfuHICFib0galF/eH2U3BA9dYmO6qaNqVwiIXfs8zc2plUHGsgv5HJKwuClZ29+4Q/nq33aPK@lists.infradead.org
X-Gm-Message-State: AFuF++l5Ot2ZwBC6ziYeg5uSAFfRsU3BZVupSp6KNgP3F9DO6r4BxEBr
	jbge4VByznD63VhpJqbr9CPXJtJyv5h66c/9FSwHeaVRGQtST/Qutx1/jHgHkFEh1vl7hWUI07w
	P38QzhK/8d/Ke9MNSiN07BPzqPyBF/zo=
X-Received: by 2002:a05:6512:a91:b0:5b5:edd1:471f with SMTP id
 2adb3069b0e04-5b8b660ce5dmr1007964e87.11.1789577407936; Wed, 16 Sep 2026
 09:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-4-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-4-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:49:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-AwYYyJ9s2MTa7r_raesRar36Hugyf1R1Ny0zCqL5_A@mail.gmail.com>
X-Gm-Features: AcwNN1UmqUhvwRMmw62XliPfw_HgO3-Fmrm9oMts4wPzbRxPuRqcz84S4okTZmg
Message-ID: <CAD++jLm-AwYYyJ9s2MTa7r_raesRar36Hugyf1R1Ny0zCqL5_A@mail.gmail.com>
Subject: Re: [PATCH 03/14] mfd: remove unused si476x driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
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

On Wed, Sep 9, 2026 at 3:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The si476x driver was added in linux-3.9 without devicetree
> support, and has always failed the probe function in the
> absence of a si476x_platform_data definition.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

