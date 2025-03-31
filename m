Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC916C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/SHOmvheFUaxFxBZZI7R6pWQfCAUUDodtSq/v4HDjc=; b=A/8xUFMrPm8XPWU2A5N7k5CKCV
	ISR5hXXL+oqWZbyOkWvise9jCs89MztPDg+2ccd4lzNdP6HvIhkusUKjhRAJRKrUe5uPWlPMBYUIf
	i4BNzfvsT3C4StPwklsvdQ9gTkE9AfgyyWnNdA2flh6E9Z/DSZxBPv83dT4gqEEt7EkNk6kN9kZ+N
	qtYVPNtM2y8pC2IIfS3ZZxpBHSSY2s0R14aRBNdj/PS8cZCrfPDyB1Ez0DkvdJqDKuh24dpqSl4N0
	Yrp1hHcHfGCIPg6HmfKx14XMIV8x6W6lIZu9xkOg/gUPaCAK9XS8gxZ3IO/UMhcm1MCIQpcwjVdrQ
	p13pONog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKmy-00000001ENQ-1PGy;
	Mon, 31 Mar 2025 19:27:16 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKYC-00000001Cno-3A1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 19:12:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA0D610252BE4;
	Mon, 31 Mar 2025 21:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743448318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9/SHOmvheFUaxFxBZZI7R6pWQfCAUUDodtSq/v4HDjc=;
	b=ErTQUikq8Yq1gbsG42OM7WOuS/wFDQR3u/62VzEkp4h+LO9+Qsr6jM3CXMy1VtU0AwAWsC
	5bd/zrrEuJIi8bYAbNK7x6Y47RmZcQf5lVtk/KARkQY0U0hjwIDXuW9qggrn2OiXbuaIx/
	zTyfPkDIQlFwiwvD1vQUPWzMme4QIy/tcRrB4dEGLDW6PlCdt2DCFRuGuMR3jWWjPjfqzP
	ouCIX7zWiJK8PpJKGTqv0lSPNgqUWtJSpji3e0oDCUBftWGUI1lb6Tt5O0W1hy5DDMDE5x
	BMligRAUNuvWKjlB+LMfLMj0EFkIF/PXDrBHN/5BFIUbj7xu4O5g40J9ChpRRQ==
Date: Mon, 31 Mar 2025 21:11:56 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250331211156.5ed247a4@wsk>
In-Reply-To: <CAOMZO5A4P=JbmXRyz91e3DSFbXjG7aRxMyBaTMsfB9jpVG9tww@mail.gmail.com>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331103116.2223899-2-lukma@denx.de>
	<CAOMZO5A4P=JbmXRyz91e3DSFbXjG7aRxMyBaTMsfB9jpVG9tww@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hmMXF+Ye_GiLI=a_V4UguL=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_121200_939937_8DAC8370 
X-CRM114-Status: GOOD (  14.02  )
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

--Sig_/hmMXF+Ye_GiLI=a_V4UguL=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Mar 31, 2025 at 7:31=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > +properties:
> > +  compatible:
> > +    const: nxp,imx287-mtip-switch =20
>=20
> For consistency, please use "nxp,imx28-mtip-switch" instead.
>=20
> imx287 is not used anywhere in the kernel.

Ok. Thanks for the info.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/hmMXF+Ye_GiLI=a_V4UguL=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfq6PwACgkQAR8vZIA0
zr0b+wf/VzyowjhouF6JR3WeSp7yXgH7z8RnuEMkuhmmxnMRHdWg27ciMWanNTuJ
2lZbqG9jDifMh4TUGrcp15UZUvHXHrCiXVUu+Vb7s+SlQ54AWSqw4Lrx5NUwRARC
0Qg5UAvlzdINusmiMg1/e7O08e2n/1778Qj/9QHangd/mGKbUpnqgbcRvjWaXHy5
Hs/fVc9PowiXcb4lfG5pnbxajk4/KTekDgdgPRNl2Fwu2UQEOgM7FqoZiNEExAH8
SewXSt/DZreOqHffMFs+NRQB8KjPGAwAtP1m4m44salTi+4aNEHiMbFogj4gVIJW
Ns3oNfBz5Wxakq4qzhaweo7D10biug==
=uXKq
-----END PGP SIGNATURE-----

--Sig_/hmMXF+Ye_GiLI=a_V4UguL=--

