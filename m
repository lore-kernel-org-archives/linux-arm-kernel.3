Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA512C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyew1MxDu19C3OjjtiwDxB9nbZkc14Dt2w507Oz3TyY=; b=S9FVRV8/0qLOkpXp01i/rVGQsw
	YhUbWHwwXYl9QPUN6IV36S6aIqYqnK4Vl9XhBmQO1u5kIkPbPuJj2wdyUR0oiJuYBpjRuB3Je/jAw
	8T4lll1NGj2GbHE132pg7ApzE2VPWsL/COQwgXWznJL1KQcd0bmbU+pGSdNB+2lZGh1HG7LDqIi/Y
	+z0ciAqFBV+VC8PuwGFWQzf/o4PVWtPGsEcFg36vYvbTCj160F9FDWhg4YayU3vefdgFAnA2RV5lx
	SFZk5Wi2iaR2Zj8quSWXMEqNJQp23I4MMc9b7StLG5qs2vvj2pPhKGvokw+fUorS5bm1jT4HDQArb
	yyis+WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hhL-0000000FiTs-1RaU;
	Fri, 18 Apr 2025 09:07:47 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hcC-0000000Fhi4-18oN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 09:02:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3953A102E6336;
	Fri, 18 Apr 2025 11:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744966946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lyew1MxDu19C3OjjtiwDxB9nbZkc14Dt2w507Oz3TyY=;
	b=EpGng0DelcMIUsNvKPpsZEFgb8UNtpCfv4Zb/FiQckyHVaIepb7eyl2o8OM8GAVJyiF+Qu
	9fSCZkjBP2RC1PgEydrW6zJkarvFUtbUEHYMxhD/r3+KCUKfRCBNmUHD3GZOGyktFzwXUE
	u6l2HDekPay9dh4glCNgAtKITh5tVazdlB3rNbJ9ZOl3BQeYF2dh2D0WzEp2aUM3omyxxC
	nT92P13KW4i8+kHQt4XEN97GHuwUQmDnBuur1G/i+hbS0C9Fmi5g4lfYeAnfdfRmlmbbo8
	NQjeiRDZw2+wBczT8RX2Yj1xSSF7g4bnadwLkU0KYEPloYv4DZkDOmYWTb57Hw==
Date: Fri, 18 Apr 2025 11:02:23 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [net-next v6 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250418110223.594f586f@wsk>
In-Reply-To: <38f36d00-e461-4fc5-a98b-9b2d94d93c69@gmx.net>
References: <20250418060716.3498031-1-lukma@denx.de>
	<20250418060716.3498031-5-lukma@denx.de>
	<38f36d00-e461-4fc5-a98b-9b2d94d93c69@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iP=CeZYpD+_6T=lMjmJSf8s";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_020228_450160_7D10A198 
X-CRM114-Status: GOOD (  23.14  )
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

--Sig_/iP=CeZYpD+_6T=lMjmJSf8s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Am 18.04.25 um 08:07 schrieb Lukasz Majewski:
> > This patch series provides support for More Than IP L2 switch
> > embedded in the imx287 SoC.
> >
> > This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> > which can be used for offloading the network traffic.
> >
> > It can be used interchangeably with current FEC driver - to be more
> > specific: one can use either of it, depending on the requirements.
> >
> > The biggest difference is the usage of DMA - when FEC is used,
> > separate DMAs are available for each ENET-MAC block.
> > However, with switch enabled - only the DMA0 is used to
> > send/receive data to/form switch (and then switch sends them to
> > respecitive ports).
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
> After changing the IRQ name part mention in patch 1, you can add
>=20
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>=20

Shall I add RoB tag to all patches?

I will wait for ACK from at least Andrew and then reset the v7 with all
tags collected.

> Thanks




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/iP=CeZYpD+_6T=lMjmJSf8s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgCFR8ACgkQAR8vZIA0
zr0z6Qf+OLTAcpxhxBxIYWQNZrcVuoJouHXGObXilKYz0taH+/2NJPlEVldKdt79
T+rTrMBKLCx6NFaUAujS63HHdli4yR7wfZsv5Ry2QTdN92nMuSnyeUOyITaBDwVA
wrfxapywH5KswGvbq0ZdINFP3MN8RjmFx46R6vkDxThOKDmqaOLYmXKWkaQ0Hfl+
V792yJjlhFn+LhNipqZ3c0k5aPEhX8qKnJaCuggj1A0BqZIsxrYKtwF0bXaNcmRm
EbJVY4AKMQGEcFNTXBJkDb3Xx9ODt6OotMibszn1VIXfSMRtyzfTRzxYTiC6ey7I
lntBmtTVZUzf2tBd8OqK9Yka8B27GA==
=iHKp
-----END PGP SIGNATURE-----

--Sig_/iP=CeZYpD+_6T=lMjmJSf8s--

