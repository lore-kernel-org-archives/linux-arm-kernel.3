Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E2C36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCntAeEomuMLgqZmqZj4SrvGP+3DLTO8xxLbbymA6n8=; b=B2ZSLNXRDbslAwMbOkfosltWbR
	EgEOHhyc803CIGF0YTG+bFG9y356AFVd+lSZsgce5yUCKo2E/okjrb+ycIv8UveErGl8v3zUIjeAR
	R/6A1xatnIf6fmglHjsl1NxfPia0HrcsXFxsFgm7jBZxjg+7qkQUmyHKg6FWfR38X0rjdAhMlWL4U
	fcyVIzC/5UUSJS7NxJHkXmCAeEjO2F3pIKIy1oSHXAod1t7DZKfRhEn3hEacjRGDJzyCbDraGCiJH
	/87NjRPIXDlbalNF3GRy3CDi/VIPskUNUUh3gI6OL+MJ3XRSgXvoFWBq+7U6A9z2dIMLhtFr8OFAT
	N/Nar3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMvi-00000001RWO-3xNd;
	Mon, 31 Mar 2025 21:44:26 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMtv-00000001RKe-3MYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 21:42:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C99410252BE4;
	Mon, 31 Mar 2025 23:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743457353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UCntAeEomuMLgqZmqZj4SrvGP+3DLTO8xxLbbymA6n8=;
	b=FuSaIXewAfF7+H7TSOGHjWpA+pkSIOEwwXyr4uTcTv25w23zJORlyoZajX3yHZ9cxSFd/h
	TRg/I1Bum6UAfwWPzsTmbQOGMTvdldauacrYXlWWyzysy+LqoPAPa7OIYAdLbM2AHvM1mn
	esi3dRDPCrS8TE9Pyt7YGBWySxHpfaZGRotIdeC8zCK/dQULXeiQLU5XvTIJd+aUgufKQd
	6Oxyft17aC5rtHT6vRBlmSLWXkHX6SHTy/FiVzQN6atxZtlgnfbcHIsMVWxPnC82lrnq6/
	pvh23yqBTVlI1/pgsIYjelfif3LZod1cKxlnUJgSpoybxWWyRdz0dbfJEFOCdQ==
Date: Mon, 31 Mar 2025 23:42:28 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] net: mtip: Add support for MTIP imx287 L2 switch
 driver
Message-ID: <20250331234228.5d8249ac@wsk>
In-Reply-To: <ec703b87-91a4-4ed0-a604-aceb90769ab0@gmx.net>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331101036.68afd26a@kernel.org>
	<20250331211125.79badeaf@wsk>
	<ec703b87-91a4-4ed0-a604-aceb90769ab0@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/okte2gjYXUvf+jGnOR83L_j";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_144235_994590_B1B7B900 
X-CRM114-Status: GOOD (  24.36  )
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

--Sig_/okte2gjYXUvf+jGnOR83L_j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi Lukasz,
>=20
> Am 31.03.25 um 21:11 schrieb Lukasz Majewski:
> > Hi Jakub,
> > =20
> >> On Mon, 31 Mar 2025 12:31:12 +0200 Lukasz Majewski wrote: =20
> >>> This patch series adds support for More Than IP's L2 switch driver
> >>> embedded in some NXP's SoCs. This one has been tested on imx287,
> >>> but is also available in the vf610. =20
> >> Lukasz, please post with RFC in the subject tags during the merge
> >> window. As I already said net-next is closed. =20
> > Ach, Ok.
> >
> > I hope, that we will finish all reviews till 07.04, so v4 would be
> > the final version. =20
> well i appreciate your work on this driver,

Do you maintain some vf610 or imx28 devices, which would like to use L2
switch?

> but this is not how it's
> going to work. No version of this patch series had a review time of a
> week.

I just pointed out that patches would not be pulled (or anything else
would be done with them) until the merge window is re-opened.

> It's about quality not about deadlines.
>=20

:-D

> Regards

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/okte2gjYXUvf+jGnOR83L_j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfrDEQACgkQAR8vZIA0
zr3zwggAgZ8Wu0bOaQkLLopJTM9SIopbyU4MrpYpKkdbWhImV32dIF9o6jegDmy0
e/o+Pm2UHCf5eoGg5BuqSjiGZ0tPXSHPMWn6j82p6AtMWaHLq8taHYdJcLBXM/uW
Gyrg1W9Vedntq/vh2vigjnBod/vvmFbSEZgPX4tPMckPvaATJy7BwD04HnvdR5aU
TfXVgDB4KeS13WGXI0wfSadRBUS6AjhAtj93SeQcbbhWOG8hRLvzFaVPKvF5pRzF
UDK1yojMqgDgpAfvCuz2EUH+r8olSz8EAui3nhyMhyI/nqp6HY6VQtkFZOdY9vYu
xUNZIw4qn2L3rsFBbxsdxrDzj3MLuw==
=7djP
-----END PGP SIGNATURE-----

--Sig_/okte2gjYXUvf+jGnOR83L_j--

