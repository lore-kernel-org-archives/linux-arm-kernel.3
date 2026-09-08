Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF7BC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj8K0bKr+QZ/S9dYM6RKCNRt49IKM+zHKFTuOaeQz0M=; b=uNBFc1caI1tjKWUTOFYNtn+98q
	2QkmeXwvLvXIhC5hCMGBO8PNa/vwQunNbyOVF2O8LNsGo37zHrtdzzVPdDPyow8Krtld1YaC1rfR6
	ENQo5LlFV5WQj16pnIgC3NhPsXbkIho4zWRsjzTxnypL06bZdOcWInvJQniD5n1gcaEMt3dGsa6Rr
	WOzWGntxOSYBMRZD4f1pVqRq6icl55/Y/Un9i4YuFWgx2Aqy/+azaJA10WlyIXI0ilzijV/6KMPg0
	Wy9k1Uk1NPxcBC7kM/eKjeLGplT66UpMakSNZzgZhCfQbBVggZHXjD5PM1jRh9sSR4ZR292Yr+5+A
	L1UXHMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zXr-00000009nxn-0EjM;
	Tue, 08 Sep 2026 17:23:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zXq-00000009nxd-0oU7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 279D3438EA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C62F1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888221;
	bh=Sj8K0bKr+QZ/S9dYM6RKCNRt49IKM+zHKFTuOaeQz0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ddQrHN30nhOEvSokqtHBmBF2IZEjMngfe66I7z/xF+nIpLfQMFzhrkZstpyTC3SCV
	 YVCXh4rNCyfy9alx3+pQF0UabMq1QP9Geu/5dOJsxjAU9iFSO6rPpTGGiy41e48re+
	 vmBhARYlPQ25cfGK5oj7P7w1JEYaJNt2ko7ZoJnM0EuQY++WA+raK9Cen8G/MNPAMA
	 6rE1in8zhab5s2tXfBzaWc3zIaZD+qYvlZ3pNYFsQiPDK2xEg3eTX9njnMCtFhgHKi
	 pWs3oOdNQJM7qOTCwOxNN5ytMf9umeDqGI3grPh6+BxUhER9YiG82Aj0h0C3LkFGKv
	 uM3fkgpb3KvEQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20f56876eso46611611fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:23:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz7UjM8T0bP2Qqk1HWah2JHubnHt51rS/eIUK6Bii0329OiA0YvsAKU1GlHgQI2CUF6Kd7q3vIesZiEywJAbOYP@lists.infradead.org
X-Gm-Message-State: AFuF++kJ/M6Ca/Ku2NZ8hZzlOjAF4POOfVkV63j7w7HUj3OckhMqlgnu
	LJyDuuANHkfMei3Xkm5do8/os0rbnnbw+HmaHFvf7GEL3IbEqDwGFdurAmyoKAYeTA03NqvTVMY
	4atU13b7E1pmbwCkNO2WyPRaAeG6Imk0=
X-Received: by 2002:a05:6512:6c3:b0:5b6:1a7c:39 with SMTP id
 2adb3069b0e04-5b61a7c02f1mr4244449e87.60.1788888219653; Tue, 08 Sep 2026
 10:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-2-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:23:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7NjsvV6_2Ea9qyi9fDvDiSASPsLH3uTrPz30_ug7BQQ@mail.gmail.com>
X-Gm-Features: AcwNN1VilFNAiGqYj4DGWJSxsv2DtJDi9vb9QstH70LkavpX1Bq02jgwVJfqHBE
Message-ID: <CAD++jL=7NjsvV6_2Ea9qyi9fDvDiSASPsLH3uTrPz30_ug7BQQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
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
	Guenter Roeck <linux@roeck-us.net>
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
> Most sa1100 platforms were removed a few years, with the remaining
> ones left as a starting point for a conversion to devicetree.
>
> Nothing ever happened on that front, so remove the rest now,
> including the sa1111 and locomo drivers that were once shared
> with pxa but are already sa1100-exclusive now.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

If some user really want to keep this platform around and it
willing to invest time in testing, I do not think it is hard to
convert it to device tree using an LLM.

But if there are no users, away it goes.

Yours,
Linus Walleij

