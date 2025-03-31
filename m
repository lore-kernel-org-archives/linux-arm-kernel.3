Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8ACC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tuk9xLLGOA3p2uSHVjgEZqViacVfaAPTNHEavU4XDWs=; b=PKfOfYOtdwH597t2YAIfbh1/A6
	QFxMngSPdl0uzRI2sAmq+0qmSZokkgdr9N1fPDJY7vLDbbAPE+J3hz4LKDEw0xAfAmLN9Icdx7VyW
	UxCLN3asyK2tXoFGC0vSNdzlhv5Tt7pAByc/aDc4yi1qbuFo4xuIsQOE50BygcKnGt6okNLy/MSiH
	0sUItglrsWT9JUUj4+UDHekueQlNweCy50AzeMjFAsQdPWOpqfSc6o6ZRLIRLrqI1yQ/bX5SKK0LC
	TZ0JFfEfSI1REwQD4iD7rGMA8a5kDgrqu892en4jTQnalWcz6ZQaJWJ1f+EmRpg9HH+411llqyLFi
	USN9hrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9AF-0000000H9f7-148U;
	Mon, 31 Mar 2025 07:02:31 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz98V-0000000H9NQ-2TG3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:00:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07FFA102F66E1;
	Mon, 31 Mar 2025 09:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743404439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Tuk9xLLGOA3p2uSHVjgEZqViacVfaAPTNHEavU4XDWs=;
	b=NnnXc3jbq7tgb9NvNsc9O9FQmE+niADmjpA5rKPOCm1kMZVJGVlMDhqRZeGk8x5hTsguYq
	pvGzvAwYbMQeIaXFyfvOCg8JFIkR1j6JinU2OEH+7nQiniop+N4eEQOPkZbgW57u/Jlw62
	Lgurh2V2yvOKoaFccfxzeseieCKCbVYDcKh6NX/1vrCfORggFLr5GE1YIWnX1dxcaF/fBb
	vCkCijMHFcCZW7rxNFWZpap+LszDiTYnSNwq8nuF8IvsBmxEYJUCqQ9iq/KL5qfYdIKIqo
	fsZ0OiFr2imsRSjTGUSExQBccEI/TXhceVDp4zQpSVtLNOUUjjPKIcEirUQKUw==
Date: Mon, 31 Mar 2025 09:00:33 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <20250331090033.281807b2@wsk>
In-Reply-To: <022e19f5-9a9c-42eb-9358-a6fe832e8f5f@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-5-lukma@denx.de>
	<3648e94f-93e6-4fb0-a432-f834fe755ee3@lunn.ch>
	<20250330222041.10fb8d3d@wsk>
	<022e19f5-9a9c-42eb-9358-a6fe832e8f5f@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O3v+DOu0N.qQTG3HhCy4w.0";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000043_788549_A2A8EB40 
X-CRM114-Status: GOOD (  19.38  )
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

--Sig_/O3v+DOu0N.qQTG3HhCy4w.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew.

> > > > +	/* Prevent a state halted on mii error */
> > > > +	if (fep->mii_timeout && phy_dev->state =3D=3D PHY_HALTED) {
> > > > +		phy_dev->state =3D PHY_UP;
> > > > +		goto spin_unlock;
> > > > +	}   =20
> > >=20
> > > A MAC driver should not be playing around with the internal state
> > > of phylib. =20
> >=20
> > Ok, I've replaced it with PHY API calls (phy_start() and
> > phy_is_started()). =20
>=20
> phy_start() and phy_stop() should be used in pairs. It is not good to
> call start more often than stop.
>=20
> What exactly is going on here? Why would there be MII errors?
>=20

Exactly.

I've double check it - this can be safely dropped.

> 	Andrew


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/O3v+DOu0N.qQTG3HhCy4w.0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfqPZEACgkQAR8vZIA0
zr2uZAf/X9cFX5/KF/UwjOOG5zujQrAPZ8w1dyFZMuxUtk8kuXMPb15aOYHrHNru
75mZmO+XEFjn8ZH1zo8gNFkcIZtXXRl9ySXNdv3qKnlRBNdMddQR5lMI+l1OixPr
SEH8lCzHgIi3s+RHFNsFrOrRnkKYkQwNHjiciDsgOFfn2Pzn7/oysfr0N/0guAsf
o4IQTXOe6HKQk/xiKYSiYSxbxZEYkEhVaRiizQwFF/lPbInPSJYN4/QMPkoaldcT
qcRyDKlHIAcvHnts/1lsTgrlugfSqAIdXgnUYKwi0GCmpkX7U6DA15uN7+kfhKSq
wm1rAr67gqNHiUvqXB6WyIQRFbZPNg==
=ACUc
-----END PGP SIGNATURE-----

--Sig_/O3v+DOu0N.qQTG3HhCy4w.0--

