Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=384tdzMvS7W0JS7A89aeTWZ+bDvLCNV8ohHo3USeMhA=; b=rKgR+1dLIZaL2ELA2oaAGfC7ff
	J+1cMBFfDDH0AOgpOGdKu8i7Mejn0Dn6O9vlhvh0i445wGpNTxH0dBOKr2lPZBwN2Mj0nJRKZF8M5
	JTiMTw3v5L+NFbNXQB42xT3ifGSR2xgcbmm5GakWWGj0mCEc009JSzNRnuBrX6Q8/7/LafAOCZFu8
	aJNSTFDRJGwx2vfPDE7fn8WfNtOeoJoG/4BvIMYOE4k9n5wDVU1R9NfIjk+/5+rgOpthoWkIooBWF
	R0UtvBiZJnFWHVmyqjyxXL/6zSFxtaglpbbccxLEjhj4nS9mcdcCjkFkZ0n+t1lCmSGwxmt9sfEyc
	Awia83Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFSJ-00000005TE2-1O31;
	Fri, 10 Jul 2026 17:56:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFSH-00000005TDs-3dVb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:56:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0129A43E26
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6561F01558
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706164;
	bh=384tdzMvS7W0JS7A89aeTWZ+bDvLCNV8ohHo3USeMhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YTPAQvweaJ2rFvz/5+d9QB+Zi2rIZf+lbhYo22L3FT/NCEUt69qDU6lbRTRfuVnrv
	 W05ru/0+mVmgzlkjo5+0qz4o+PAMg2QCzuBk9NhDBNKC6De4RkhR1RM1Y2yEVmLkH5
	 3CDfB6FVZvlGdrQ5XiKrveHg5rNSfxbZHWjBIdFzIuioROnL2IYiG0Viaer8eiXS1a
	 2vuxhnlAGPFfUXjSG/DSAa/49sN0VNGmgQPWxrFVxzpMTUay2lubsYe1Uay+gfcfql
	 402oZPPo5Q7kUkvb9Ra2ZK5TByHRP5h34Q7NQMlwFc943IaTOUtqIKUXJC/RBdVFsQ
	 b7Dqarf508Mmw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so91437e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ros82Oom+Dlp8tGQg2olA8g6yKnT0WVuoSDEpYwMw1Ry3o6YfB4NwRqMr1esUYaHScjLa5G4R7E97FAcnl+0BF1@lists.infradead.org
X-Gm-Message-State: AOJu0YxestPDScrt+GNXk1OvZ6/sfRZCcJFMrxcvhk3qmZfH539VAlnN
	6cl9zZDkJsv+OzqivtD8ycJJIpr2g484x3u97TRgkQ6U8iUslek1aSQPMHHNr1Dh3dhD74kBJJW
	zGXObVFMx//ZPL8l3FxDMWJXrz8NVgy4=
X-Received: by 2002:a05:6512:618b:b0:5ae:a9ec:bb1a with SMTP id
 2adb3069b0e04-5b0236bbe03mr47320e87.54.1783706163539; Fri, 10 Jul 2026
 10:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com> <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
In-Reply-To: <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:55:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLktA7VBbFQUiW2WxiL7xNHrQmLhSJOOTfc_6Q74-CDK+Q@mail.gmail.com>
X-Gm-Features: AUfX_mzw5ThMPydCgYk0-odWP4AK8yu5yX74qvfO2aeQzV6CzbOV8NG9eL21qpc
Message-ID: <CAD++jLktA7VBbFQUiW2WxiL7xNHrQmLhSJOOTfc_6Q74-CDK+Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
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

On Sat, Jul 4, 2026 at 12:33=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> >>  config CPU_BIG_ENDIAN
> >> -       bool "Build big-endian kernel"
> >> +       bool "Build big-endian kernel (DEPRECATED)"
> >
> > I'm not so sure about this patch because it will look like IXP4XX is
> > using a deprecated feature. The IXP4xx actually has many OpenWrt
> > users.
>
> How about the version below? If you like that better, I'll give
> it a thorough build test and use that for v3.

We figured out LE on IXP4xx so I'm fine with this now, provided
we can fold in the LE32 fixes for IXP4xx at the same time.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

