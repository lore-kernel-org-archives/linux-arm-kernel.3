Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D305DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVwkVrfyGE5jNI5m8RpdSOR/P9iTL3WO9FAc4h/G4jI=; b=QqVc6xn6I8oDJpA5S1yTU2+3OL
	CEak6J0Q3tGvu2YTNFu7/KDgKAqkuc351V9okMRnx6ZgrYPpGU17zb7IubKlEBY79zKreqjQy7rxO
	sX6RqVRIfaNvvIyhDoG2lYpWjKy0GUexvadDehamqctSDvTItz/FEFbueSORCOKLEmnxrFT/I+9oZ
	uvlKltpOizAyCqM+kkO8NbCE2VjIp/zGEzaiASBDsYb2Cnkp3gYRzI+X7IMxKx5MSOXXrui/3SfpG
	1N/J1mPNAo6o5GofhJ28RFG+SvU1n2wbWivRHBYydDTogF/Gomx4/oexci0V2jRHomNY6C1O8eEgf
	7ViWHAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAzC-0000000De3l-0i6o;
	Fri, 28 Mar 2025 14:47:06 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyA59-0000000DUb8-2vJo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:49:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81C34101DC310;
	Fri, 28 Mar 2025 14:49:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743169749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=JVwkVrfyGE5jNI5m8RpdSOR/P9iTL3WO9FAc4h/G4jI=;
	b=XQ83om8/DM3sqB2fArlp7DnJFKCtr2Gv2USp+87UVmuQ26qoHiAtMU4VoXbxqSMa/BMI8G
	6E7oPPbILVMKplyRByzgDl6FaaOGsJj4zF7ld87uApL5820/mxGdsyo/gTMPDMocEZzJ8B
	NhGlrd70IfV/Yrpq62xkDJnxPwE8czJOJwBm9/86EtEvORK0Iu3+XynIuRYIPovnD6uxYh
	u+XwWufYnUG/isY0d/u6RIcJv+/T5AipbHYcRrcVlUT/5k2D79jpJkLb3UKmDlMX+kHPok
	KXs+o4ip3Xx6GIpPMrc0WD5+CP5fZ3DURVSnMDQRResDTf8pyq3+XM9kqbk49A==
Date: Fri, 28 Mar 2025 14:49:06 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] net: mtip: Add support for MTIP imx287 L2 switch
 driver
Message-ID: <20250328144906.62323a6b@wsk>
In-Reply-To: <20250328064353.33828cd2@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328064353.33828cd2@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lpezb_=T1N_DAZZjyrP30mM";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_064911_877918_1C4875E5 
X-CRM114-Status: GOOD (  18.36  )
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

--Sig_/lpezb_=T1N_DAZZjyrP30mM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Fri, 28 Mar 2025 14:35:40 +0100 Lukasz Majewski wrote:
> > This patch series adds support for More Than IP's L2 switch driver
> > embedded in some NXP's SoCs. =20
>=20
> ## Form letter - net-next-closed
>=20
> Linus already pulled net-next material v6.15 and therefore net-next
> is closed for new drivers, features, code refactoring and
> optimizations. We are currently accepting bug fixes only.
>=20
> Please repost when net-next reopens after Apr 7th.
>=20

:-/

> RFC patches sent for review only are obviously welcome at any time.
>=20

I hope, that I will receive some feedback regarding this driver, so I
can repost (hopefully) final version at 07.04.2025.

> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#devel=
opment-cycle




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/lpezb_=T1N_DAZZjyrP30mM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfmqNIACgkQAR8vZIA0
zr39+gf+PnMP4baRM3Pye2pJkO6dcXzrP69VEz0RJFuksfJE+oZrtyLeel3iEdjs
D4fsoDvxwgFjX11+7ggdUVjUgwHW0bxDsuAr1FLBrIh4hrzlzLkfdX4k2URWKoxk
0bPF7IJpjD8/eCtKh9nX+FhYdjogrfre1npCwxixcC2i3jxnjwCqEOgLbKkiADfq
M2SVJvq+An+OJwAVnKxmzKjEkKSkB6DIcyKIWae9g8lcnRkzuAcraSpOgUdOOU+6
E7fMyIkYSy5R6cWSRzYQZDfyifH6GrIM1aTyqwgHrKHOCjJvqNM536fwrhrVYxpi
GcFqr75XS4DhdMUvefB9aZ6Dkn80rg==
=33fD
-----END PGP SIGNATURE-----

--Sig_/lpezb_=T1N_DAZZjyrP30mM--

