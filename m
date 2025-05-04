Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCgrVpFe4biw8hf/ZoueDjqGBEEPT9+1gxH8yMqDfrI=; b=stZlIbfZUwx9jQxofg8GnB2JR9
	I3w/44ywyykJ4wWpmJW8kwBLjHiEmkwrs434Si4DVvtc7NylQEYTCsw7XY97HgThyOWRgIGIiwuzX
	/x26EWu7//xEaMflR/K7EeCKuKRdLiLo3CuaO8pLwojU6aNtjFJZuQXtwfoCMrLS1xS4SvMBQyx2d
	ZiH0sqyiNwMSu0rar+4auiBRcphkn25WD8ITZuyjUyb1UO9HFZKMUM16IqvQBlB9P3t6KFy9rFZPr
	98PTg4vH/rJXg6BEGjjhgMa049ZaaKIsC4bCzpSY57VcFG+s2AcAoBoN3BhNjrzfgOeRmWGrVTjy+
	tXTJM25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBSrs-00000004v1Y-0Cmw;
	Sun, 04 May 2025 06:30:28 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBSpt-00000004uuS-2f6b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 06:28:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C58C102EBA58;
	Sun,  4 May 2025 08:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746340100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=rCgrVpFe4biw8hf/ZoueDjqGBEEPT9+1gxH8yMqDfrI=;
	b=MgE7mYBfXN/HyW3DXX1gurVkn01PGNgPV3q7o0L+9PRlNWoioSE9c6kaq2ZrqXIAPjdDgI
	ONrqX8sYjiREnJHNYF0XKTSgW48osfwDUHKGGigLh3ByV6gUlX3WDHhRaNL9/0t/uJFGc9
	f4ahN/RJd72PKhp8T4/7o+dqVrm7S1+Inh96VoMAZ80yCs+r8KxQRhdoxyEPA2z1Qowo4U
	z2ULxr3K0WOZB44kliZKG41EccEypr8FoznyhCm128qryxuGu+JwdH7mjWkgmX3vCEhyRk
	eDWwJFj7edmMDpl+Z7ZlxTGe9cRJrRxesac92ErNRHW47zCX6GFC1O81tWmhBQ==
Date: Sun, 4 May 2025 08:28:11 +0200
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
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v10 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250504082811.4893afaa@wsk>
In-Reply-To: <20250502071328.069d0933@kernel.org>
References: <20250502074447.2153837-1-lukma@denx.de>
	<20250502074447.2153837-5-lukma@denx.de>
	<20250502071328.069d0933@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6QmTqwgtdiqccoc742SZ04r";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_232825_828723_51BB3C5E 
X-CRM114-Status: GOOD (  23.83  )
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

--Sig_/6QmTqwgtdiqccoc742SZ04r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Fri,  2 May 2025 09:44:44 +0200 Lukasz Majewski wrote:
> > This patch series provides support for More Than IP L2 switch
> > embedded in the imx287 SoC.
> >=20
> > This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> > which can be used for offloading the network traffic.
> >=20
> > It can be used interchangeably with current FEC driver - to be more
> > specific: one can use either of it, depending on the requirements.
> >=20
> > The biggest difference is the usage of DMA - when FEC is used,
> > separate DMAs are available for each ENET-MAC block.
> > However, with switch enabled - only the DMA0 is used to
> > send/receive data to/form switch (and then switch sends them to
> > respecitive ports).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch> =20
>=20
> Now that basic build is green the series has advanced to full testing,
> where coccicheck says:
>=20
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1961:1-6: WARNING:
> invalid free of devm_ allocated data
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1237:16-19: ERROR:
> bus is NULL but dereferenced.

I'm sorry for not checking the code with coccinelle.

I do have already used sparse and checkpatch.

I will fix those errors.

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/6QmTqwgtdiqccoc742SZ04r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgXCPwACgkQAR8vZIA0
zr03AwgAkMNG0YrgvTM3iFWNDJ6IgUY1d14CkUU8GCex+FMbAMEEJeXx/+nws0ZR
9sxsteMOv8I8iImMD1EIgBHdT8YjQKy9afBmzf5t8E9XOeE92W/e4Dc8w5CziCyN
TV4akdUhoaTkhv3s7whhUAEOBvrZ7aHn9uqYzw5AybFcSArlLmmNS4MqWaGK0ATz
tkfp14hOhxRKzMY87sqfTZYw+1DKMwnIn8mStHL8rHFnidLrt6LlAqWYrPw4wocp
Ne/ziIpwkNfLjGtJM29tAB97HI4l4aZ5th6kcZACU+pTgRgY24wLDtXtk8UhY2a5
+EqG6B5zHuTWSNnZiUalr89fo0JhzA==
=HuJH
-----END PGP SIGNATURE-----

--Sig_/6QmTqwgtdiqccoc742SZ04r--

