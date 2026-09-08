Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE44BC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjM+NfW0WLuiq2c1NmH2zxMXe3faot5pYKc+rUVJPpc=; b=0+EbEXf4JFvKqiTayVP8v3ySB5
	QQw6pR2LJ0iUhUcqnhIWQcT5/VzZlBz1ZzN976tcdMaHuYW+gNKtX54oa+neU5RrNOdWRiBR0Kal7
	gvlxMJOdwxwsmjAvJywq1BTlWik/B2vShSWEfJTmtKLqgD6NnEgfi1nRJ+DokXJrLGkNRrzi+Uf1r
	41BwmZ+E2k8a99Lns84AuN0gSKOzS1cVRiJJNsfjFMYxl/mAtobcq1xQYyCkg6VyjuhVfLL7ywj8c
	UA9G2dAHd/cQGFd5Z5VKWqhZPHIm7SQ9+jB/hNzEGlRoW8k1r7l1Z9smMV5otGGRnK4ZRWZyT9cE6
	QcVaLE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zc6-00000009p3f-1zTW;
	Tue, 08 Sep 2026 17:28:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zc4-00000009p23-1e7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:28:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3A07601FD
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3591F01561
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888483;
	bh=XjM+NfW0WLuiq2c1NmH2zxMXe3faot5pYKc+rUVJPpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gI9+h4nezNM4jezi/gSGd5v0FLkt/ViVbNzZjvmD3znGXhaCACEMxp772uTPuMKQM
	 zic6KxCNmB1qGktDhB7Q297JxzmoM8+GnkdHIo6O7GM1RtjOrd3fZzRYHyhJZERfAL
	 69YkYNVsnbzvuSM4by/7K8DV//vvvS6EZzyPHUmCVJVsLvVEmvcDqj4PUkSn25Oajf
	 10cbl2TTkZfXsQfX5hnB5ZNJmlkw0FLAF4v960FUXFrX2QuGaGyIrJgQaLePxMk25x
	 x+kVTIVGbOCV2GzFUF+D83VAJVNfudH9m5iPgdODO/y6lagRK9Jy6ORRoDJMgiu/Kr
	 jXIyW+APwKbZA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so4495882e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRYZQGxl1UZsrRZe9VztHXDQyMjFDooCFssg4xbzSq1IfLGOCTazc04oviHh3Nkl7me4YhcJgEro6dGdTkBXaa@lists.infradead.org
X-Gm-Message-State: AFuF++mUGg44mBEA6wiLoEyDLSg0/2R8RSn/ePtQPUW1cWZ1FnuXBypy
	rd56K4tdgKOnMVXV+oyQvkPGVD3IJn71J6p7/+1XO3Vp0YoV4A/Da8AX38o8VZ0aBDiYHzKlT62
	yvvUrUnl/oFdoN5AUaUty0kekLdsMk7A=
X-Received: by 2002:a05:6512:6884:20b0:5b6:1a7c:3f with SMTP id
 2adb3069b0e04-5b61a7c0196mr2554286e87.66.1788888482136; Tue, 08 Sep 2026
 10:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-3-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-3-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:27:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkzrp4hsOERqOt6Zc75p-+KoWj0Tvu6VQk=ma2kgDH=Qw@mail.gmail.com>
X-Gm-Features: AcwNN1UJNXIoMX0oKBuT_VyMabX-dcNfrhwjoX9gJLRVYT9sdHBezlMdahVsqlw
Message-ID: <CAD++jLkzrp4hsOERqOt6Zc75p-+KoWj0Tvu6VQk=ma2kgDH=Qw@mail.gmail.com>
Subject: Re: [PATCH 02/13] ARM: remove footbridge
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ralph Siemsen <ralphs@netwinder.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org
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

On Tue, Sep 8, 2026 at 5:28=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Footbridge was deprecated in 7.3 to be removed along with the other
> StrongARM platforms and most remaining board files.
>
> The main machine here is the NetWinder, which was a popular Arm based
> desktop PC in the late 1990s and contributed to Arm's later success as
> an embedded Linux platform, but was discontinued over 25 years ago and
> is no longer all that useful.
>
> I previously tried to convert this to devicetree in a sensible way but
> gave up due to the platform being too different from modern SoC based
> targets.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Ralph Siemsen <ralphs@netwinder.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

I have one of those machines and it boot mainline but I
certainly consider it a paperweight at this point, I can't use
it for anything useful.

Yours,
Linus Walleij

