Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBADC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhrEMPazg4VWtR34qnd0rK9L+bUZ2MhCj/KoPwKqizc=; b=VjtZUrGRRtJi0HnML9I83EKNE3
	3ZVYJD+85tVLP9NfLX9RrD2w+2ST1wlc/+l0+nvwWWDhS9WfaJJn+2R5gPpOl72OiYXIMsDEbTYYZ
	phMaVF6bpGIs1g/bKsNc5/QZVW6G4+Sc8uENez5tFNVb1YGu87gdz5yBav6y0vXJttXBN2qYfk8fd
	hBUAsW7gPpGSA7xcGBmvElSHpKAcNFIyURMeZCZ0DyEZUY5hVDr3eoA4nvlGaEdLygScZuRwIC0Y4
	fYFFB0DGP9Hw8MhXtSG2hD6SGsPB5Ixj31EOFnZf5Th2JAuTxXj7EsMZzorK2YOSrUKCByZXVneHc
	UHAA54SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl972-00000001lt8-3dsd;
	Thu, 20 Feb 2025 16:09:20 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl937-00000001kTt-2Rgk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:05:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A1C810382D3C;
	Thu, 20 Feb 2025 17:05:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740067515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhrEMPazg4VWtR34qnd0rK9L+bUZ2MhCj/KoPwKqizc=;
	b=A4hGitDbo72QAmhefQeUeZL3T3Rp2wKldnOpn/EQrjnDZScLwr/7Rd/j6nY9MKQ/KQtUiP
	JG6759wwrIzoRhywmF9uAcVztzoO0PQMKccT4bfjss4i/bzvHo3e4QsMJ2ZFsmfKki2y0s
	Acm5EEFFlh5RmmRGT0p4iYS3Da9UI9dAV27ZGIPW+JnIDvcDm/vLRZwAnuyp2SY9DGxbBN
	WSS1HcMuR2u97P2HlCwVn4vftvNDGyHa/BA2d77O1avi3nCO/PcdfsCOuhwI7EudA97zsE
	hReD8N+WY0jdzLWeauVDM1r5cp17mHQ9kRTZjsormprBNDTwtHdw6UDOts+SIQ==
Date: Thu, 20 Feb 2025 17:05:11 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610
 SoC
Message-ID: <20250220170511.719a1cac@wsk>
In-Reply-To: <f68ebe15-69ee-428a-8079-8bb05d7aa21b@lunn.ch>
References: <20250219114936.3546530-1-lukma@denx.de>
	<3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
	<20250219233802.20ec53e5@wsk>
	<5a9d9eef-f2ca-4168-aca4-4419dcfcacb6@lunn.ch>
	<20250220154826.3455b15e@wsk>
	<f68ebe15-69ee-428a-8079-8bb05d7aa21b@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LvcxCIoyiyxMRzVmv5VeRt=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_080517_773129_30A5578C 
X-CRM114-Status: GOOD (  23.21  )
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

--Sig_/LvcxCIoyiyxMRzVmv5VeRt=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > > Seems like a reasonable compromise. You would only load this
> > > driver if you intend to make use of the switch... =20
> >=20
> > Yes, the main use case would be the switch (after bridge ... command
> > called).
> >=20
> > However, until then we shall? have port separation. =20
>=20
> Yes. The model Linux uses is that the ports are individual interfaces
> to start with. We should keep to that model.

+1

>=20
> > > MoreThanIP is now part of Synopsys. I wounder if this IP now
> > > exists in other SoCs? The press release however suggests Synopsys
> > > was interesting in the high speed interfaces, not a two ports Fast
> > > Ethernet switch. =20
> >=20
> > I would need some detailed documentation.... =20
>=20
> Which is probably not available. You might be able to get some clues
> from the Freescale datasheets, if they have kept the address spaces
> separated. I don't see it as a strong requirement, given how old this
> IP is, and the limited interest in supporting it over the years, My
> guess is, nobody else uses it.

:-)

>=20
> 	Andrew




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/LvcxCIoyiyxMRzVmv5VeRt=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAme3UrcACgkQAR8vZIA0
zr0WCQgAxyZwB9mNdVIeRsd8mJN2KEWBP3zwFWv3w1XX1glLh9Y/MFa9riYX2/XO
P+so9vOKEXJUCHUxC3GIqJTIoHYB5Rk75zjTDoUs9K851v5SWlXwM2ZtMtbC3DpO
xzh/XjXEoX63V/zJszTYRQKYpjBnep4z4+Qfyabs0TvNSakVz3qdIbSG5zbjiRUr
mP3ZwG/37azFpwaqb2dYwt3IFLlpALBbNaJuSH+UlwqW+JPuiv9bjL6h+tSD7KTB
CPrs16qxPsbOvnilSVURJZOjV9YsgFZBaRquJrlZwoJg9uvo5rUQWjX3x2HlUIX9
uiqcEHdpcgkZDKIOXsnbvZSuE2d87w==
=R4zZ
-----END PGP SIGNATURE-----

--Sig_/LvcxCIoyiyxMRzVmv5VeRt=--

