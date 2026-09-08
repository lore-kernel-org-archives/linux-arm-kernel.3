Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BD7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68dTFTlGjK0XaJEAddlzUlXXUgt+rSGSQ0njU5H9lxc=; b=0slI3nGXJOxn7C0cjCkPYokaWC
	qW+ms4A0ukKn+StDX47VwtC9yAO9PtEBiAQpSAjY4i4xO4coHSz+J5U4h02oHYkzYV3/IJhAuaszZ
	RmNywRvkKt5q3Wk3nXcbOYXunmtYgIHd6mS4ndnbRna1ZxyMdY5MhzqIVo6laRf72Iz14wKrWnyZ2
	xzpP/eP8zkH+QWwpzTNntD7NnamQuMnpN4jBwklECHz2wyXX4v2/sdh5fPVRqm4NoxK68jA8hpA1U
	WQG2CdzGyRrxKjnBJCEkWF4sNYGa6Zkdpzd2XMAMSzZVWsSuwQ9f0mMxeK/YO62mFLupD2Sq9ZyHC
	w8s+f/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zed-00000009phd-1DtU;
	Tue, 08 Sep 2026 17:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zeb-00000009phH-41F8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B01B04008C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930081F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888640;
	bh=68dTFTlGjK0XaJEAddlzUlXXUgt+rSGSQ0njU5H9lxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oxrv/ClxN2t78XeQbMP1BOQ2CF7BRSdBlylr6GW7o5+/v5GYQVd60IwisZn6HiGsJ
	 9RNqbkS68Pppw2cn+v5FA+PAWCNn2YMVBbWALX2+hALj/iBCSNzWIx3MqOR5Mo5tgV
	 70O9as9qVLJ6hHVbxRTZC3jcjJfupxQQH2Pl2p0Hwd+hFuhAHt0AaJ25PHkfkCoFXI
	 xXOtNRg2wCFas1yuSrwrvKDhy+o8lMgX5v4BGSyo166IzndsjZGIVmsTezw4ewkgYI
	 X40EsPBLjrq0tDb2gMLQ3cQU0n2dV5bZlEWe6WpAj3cEufphl2aaG9ekhrHoOREV8Y
	 aeQg2R1NDfojA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso3934826e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrkXvXHDxJrf9MAa8s8cN2yF7R1X8dhkW7u6ex74updOZgwtEy2uMgi7PUFbeB8lnpZ2VuerT/Z/WVW6Jzlz7z@lists.infradead.org
X-Gm-Message-State: AFuF++lLojKtQG4VSypdkuv5ggl4xtU6Yc3DTbNDLmlIx4IfYNrx98wa
	DWPY+gmZp4LvMK9uJEL7p5W+Imob03tNOavGeKmLACJY3iCdD8dpXgp+k6zHYi+DGr6xnguFGSo
	m3a2B9skMaXt3hK9wJv/tlOIHKJwgJ0w=
X-Received: by 2002:a05:6512:1252:b0:5b6:4ae:19e7 with SMTP id
 2adb3069b0e04-5b61706d22fmr5531696e87.26.1788888639310; Tue, 08 Sep 2026
 10:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-5-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-5-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:30:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=XWMMjJvLrLH-g3wfUEOFdzU_8K1oMHGuf2ZzfjFtxQ@mail.gmail.com>
X-Gm-Features: AcwNN1VtwTPYEunvryYhcDqpN6EJYSgh3lXDGedkufyoJM4Ll9RbC4SzO6PXMr4
Message-ID: <CAD++jLm=XWMMjJvLrLH-g3wfUEOFdzU_8K1oMHGuf2ZzfjFtxQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] ARM: remove legacy pxa board files
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
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Tue, Sep 8, 2026 at 5:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The PXA platform supports devicetree based booting, but still has a
> few traditional board files, which were left as a starting point for a
> possible conversion to devicetree during the last mass purge of board
> files in 2022.
>
> None of these boards were actually converted, so drop support for these
> now, along with the 'scoop' support chip that was used on some PDAs that
> are no longer usable now.
>
> The only remaining board support is for the "Raumfeld" speaker system
> based on PXA300 SoC, though basic support for PXA250 and PXA270 is still
> there and may work with external dts files.
>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

I ACK this based on the number of refactorings I did on this
to remove the static GPIO assignments, I'm really tired of
doing them if no-one benefits.

Yours,
Linus Walleij

