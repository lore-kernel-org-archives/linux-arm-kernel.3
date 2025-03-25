Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F8CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI14fRc9SgUgLwy7/SzPwK7ui4N4JuoaWPwp0MI9v1w=; b=ojBwyS7jsWXU2NvSw2nDArUjNO
	taRYDWNenLumtxMTSjoxi28bo/EE24Hdyb8jcLRjgbgvkRDRAyqVKO0MfUfTOasZyehnyqk3IBB2D
	iM5XVRjTghAfoPNkhGxpAaLG4yN2eNuDGPnxjo7xQjCbgIRx9K8Yty/XVeISWtn4IpVMbj7TOrlYa
	ykoKwRf0ILY5oTkue9FSA4rGaCtlSSL3sry1Xp0Vnz5wAYC3EuoEBrEp6T7m84ACQK7Nl5BMDgJFW
	uNiHMSegHQMQcAmxeXOdzN3KMUz4j71Ke1u2xkCPF/rtunElxGfgKnlufBq/BhTa8bBCV2P27h+oH
	HRWWuWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx88E-00000006dFY-1M9l;
	Tue, 25 Mar 2025 17:32:06 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx86U-00000006d3H-2cuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:30:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D83102F66E4;
	Tue, 25 Mar 2025 18:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742923815; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=eI14fRc9SgUgLwy7/SzPwK7ui4N4JuoaWPwp0MI9v1w=;
	b=eYd7NzepKQqK2eSrPI8FEFriEYWhaavSzTZJ4hcetjyIwJx+vVQimsoU9aOfT5VG5+vl6X
	iCDiYqDiDVvvRetIf3pstTAnVGxtuUydTSc8sJUpPWU4ea8nUIFi8sqqK89G22zhBTUCjY
	UegnfTP43buAPi1PaCWNEOfrZgoYRA3tIaOLY446g0RdlGQBSa9B2K1B2z8SWDefqSJTGF
	PrtAMFV08qt85/1bjQOBFE5ud0RGAmt33zkvcC8hQKNmKl5OcvufCWKM29NwWBqhfnnu+B
	BvATIGVovo0wlnzbyerfviUh+4aYAUtqC0HqH0bRbYcCKNG8BUeKXQk4ERDsgQ==
Date: Tue, 25 Mar 2025 18:30:09 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paolo
 Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, davem@davemloft.net, Andrew Lunn
 <andrew+netdev@lunn.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 5/5] net: mtip: The L2 switch driver for imx287
Message-ID: <20250325183009.3f7e8a1c@wsk>
In-Reply-To: <39ec01b8-c2d7-47c3-90d9-32fe41f08a5d@kernel.org>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-6-lukma@denx.de>
	<32d93a90-3601-4094-8054-2737a57acbc7@kernel.org>
	<20250325142810.0aa07912@wsk>
	<0a908dc7-55eb-4e23-8452-7b7d2e0f4289@lunn.ch>
	<20250325173846.4c7db33c@wsk>
	<39ec01b8-c2d7-47c3-90d9-32fe41f08a5d@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mrx3VObtQardV+8O_zt0.CL";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_103018_960425_D442A3AF 
X-CRM114-Status: GOOD (  34.01  )
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

--Sig_/mrx3VObtQardV+8O_zt0.CL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/03/2025 17:38, Lukasz Majewski wrote:
> >>>>
> >>>> I don't understand this code. Do you want to re-implement
> >>>> get_optional? But why?   =20
> >>>
> >>> Here the get_optional() shall be used.   =20
> >>
> >> This is the problem with trying to use old code. It needs more work
> >> than just making it compile. It needs to be brought up to HEAD of
> >> mainline standard, which often nearly ends in a re-write. =20
> >=20
> > But you cannot rewrite this code from scratch, as the IP block is
> > not so well documented, and there maybe are some issues that you
> > are not aware of.
> >=20
> > Moreover, this code is already in production use, and you don't
> > want to be in situation when regression tests cannot be run. =20
>=20
> This is a good reason to add it to staging, but not to mainline. Just
> because someone has somewhere products with poor code is not the
> reason to accept that poor code.

I've tried to upstream this driver several times. Attempts were
made for 4.19 and 5.12. The reason the code was not accepted was that
conceptually the code had to be written in a different way (exact
discussion is available [1]).

What I've tried to say above - was that I need to have working device
at any point of development.

And, yes "upstream first" is a great policy, but imx287 based HW was in
the kernel long time ago.

> Otherwise all the people and
> companies who upstream BEFORE would be quite disappointed. Why anyone
> would care to work on upstreaming BEFORE hardware release,=20

Yes, this shall be appreciated.

> if you can
> ship whatever to production and then ask mainline to pick up "because
> it is in production use".

Where I've stated this?

My point is that for regression testing I prefer to gradually update
the code and not start from scratch.

I do appreciate your and Andrew's feedback and try to make the driver
eligible for upstreaming.

To sum up:
##########

- Yes, I'm aware that this code needs some more adjustments/update

- Yes, fsl,fec.yaml was the wrong file to use as a starting point

- Yes, bindings are ABI and shall be done right (that was one of the
  reason the driver from 5.12 was not accepted).


Links:
[1] - https://lore.kernel.org/netdev/20210629140104.70a3da1a@ktm/T/

>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/mrx3VObtQardV+8O_zt0.CL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfi6CEACgkQAR8vZIA0
zr3NAAgAhtMjYHZz0S6KDjq/IEmqopGlqJgFjvjtklfA8BpjDXNA6Is65pgFd6LH
idHOlhnCV/PAkb0gwJ3VMuG++BluGUsIWV/JZ236mXW9VFoRFYC5zT4IDPJLd4Or
pObbUtxs3V3ZVpn1ZFQ+y4aDcCYZL0iAIiYWdF36F30xJ821EjeCn5Ah43GfyCWk
WSTG/uTuCNkOoGXyjeJHD+GG+YshNwd0GyJrdbSlUaPsSaBy1D4tST0QKinduNWq
nvSvlUXZlL5o7jHPt+XXtWvyfNp3Odh/fdhshgeS4uIjd+3dGFdg0F4jx/TUVoiv
A9YioUZbLh9npLz19KYNKzaGJDLNsw==
=GR0R
-----END PGP SIGNATURE-----

--Sig_/mrx3VObtQardV+8O_zt0.CL--

