Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087C9C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQyerW7t6Bd+bJtenwArRhRB5Pn1kPMUDZ4Lln1tqfw=; b=hRoomfvbpYnkP7AQGGOtLuuViT
	1xWQOsVB3a2tXSi66FRmGiK72Z6fFDDlPvsX5TlCzip0f/vzqqyas2pzhz1lAjJrbMQSDFyycpHk+
	IWwUgJ0emnzncAeYd7M778c3lNr4nJpLpAaS9mbrSeyiJxMdAfTUmULC9y+FEdUrq+JlQyCGzYGHb
	2azyohd7iWozdSYFJg+B/bEHTmzRBohMU48uUmCy3XJWnvqb7Uj3lVWD29pCD2tGdmXRM+maPIV11
	mLUfaN0ma6VB2qSxNdrlOK1Lj5nepXBM7EMmwzy4OJONbS5dDF0kecoTXZIDaHXVoLXoabe4KoNyo
	9Bg8W/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nfh-000000094Gt-2zJO;
	Wed, 16 Sep 2026 11:19:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nff-000000094GU-0qBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:19:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0EA31A07A8;
	Wed, 16 Sep 2026 11:19:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80BB360337;
	Wed, 16 Sep 2026 11:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD72A11C7AFE8;
	Wed, 16 Sep 2026 13:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789557554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DQyerW7t6Bd+bJtenwArRhRB5Pn1kPMUDZ4Lln1tqfw=;
	b=rGjgbUUnMZGoIULBVDkMYvcKXJhf8MHhxSVLnCW7abAyI2qrXQMPNGaH5Kxf5T6waKZcQ8
	reHjxvtYnTQVp7h5B0F+T7Ijeg8nJjtfAHwIJcoI0HLnMMAPQGhw8M5iOfTgFdEAHp0DXg
	tP/VjECAntD4GF9T65VpU1jpwEs3tl6K9jF59W0AimgMer1/QzNwBjyjqYrqnehnFzc001
	OiLl1s37pkgwnWePBneyITwjpC8lOhqe/FUyqLWnF+EXp3uRt1sYTbnZb6+YLQOfOXWP8B
	50UbFG5DdH+0QkPG91JjF+9C8pQg8oXMmnP/nr5NTM2KQGRnRdbJDSJVHsjk8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:19:08 +0200
Message-Id: <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
In-Reply-To: <20260916091543.GA277833@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_041923_402424_CF01D226 
X-CRM114-Status: GOOD (  23.18  )
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

On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
> Hello Luca,
>
> On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. T=
he
>> > format reported by the downstream panel or bridge describes the displa=
y
>> > input, but it does not describe how the LCDIF data pins are physically
>> > wired on the board.
>> >
>> > These can differ. For example, a 16-bit LCDIF bus can be connected to =
a
>> > 24-bit display by wiring the available color bits to the corresponding
>> > display inputs. In that case, using the display's 24-bit format to
>> > configure LCDIF selects the wrong data-bus mode and changes the assign=
ment
>> > of color bits on the LCD_DATA pins.
>> >
>> > Read the optional bus-width endpoint property from the LCDIF output po=
rt
>> > and use it to select the media bus format used to configure LCDIF. Thi=
s
>> > allows the LCDIF bus mode to describe the physical interface
>> > independently of the downstream display format.
>> >
>> > When the optional property is absent, or it has an invalid value, cont=
inue
>> > using the format reported by the downstream display device, preserving
>> > the existing behavior. The code is not validating the DT for
>> > correctness and just fall back to the previous behavior in case of
>> > errors.
>>
>> Why? Generally speaking errors are better spotted immediately, not ignor=
ed
>> silently.
>
> My understanding is that the C driver code should not validate the DT
> and that this is the general recommendation when parsing properties from
> the DT.
>
> The DT checker is going to spot errors in the DT even earlier and in a
> static way.

Drivers typically check for invalid values.

And people writing their private dts can do mistakes and not run the static
checks. Bad on their side, sure, but having a runtime error would be useful
there.

Also consider potential regressions. Say someone has an invalid value in
their product, say bus-width =3D <15>, which works because the default 18
which gets used as a fallback happens to be the correct value for their
hardware. Some years later we implement the new bus-width =3D <15>, and the=
n
that user upgrades to a newer kernel and their display won't work because
it will start using that incorrect bus-witch =3D <15>. Better stopping this
before it starts, IMO.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

