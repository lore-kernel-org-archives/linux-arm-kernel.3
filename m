Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7574C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 06:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef+EBezQpcy3FcBFm+eU7MkGtMSmPuuasBxJN60QVdI=; b=R8pCr8y9BqaOMY/kZiE+4Vsiv5
	6PIVMBnFn4u4szIpxhV2w3e/OZmmYBih6r6XMrioeWRyNbDNMfWndAFPpEktpFTW7hoSRISmdUhpI
	jk5cFsEqHVFJpyy2ypgL+rnWWwn3p2TUEeDnILH8tVgRDhIDwFDV/dew5BAmvzqlSMRnei2tfiWpY
	9PJq1MBleYuKSzpA6Y78lJe4zSw6NpHEgGiMBS6P7CeNa39U5V8A3nFVFXukLSZnAE4WrVq/rrJfj
	EPPzU9TDn/pXo1n86i8w7dvEoUUzRkt5I4nriqSzzQpR3x3f+Bf3lDoD4C41OvrVYNp32qB3YSw0f
	jAqlbYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8CEM-0000000G2qc-12Q3;
	Fri, 25 Apr 2025 06:08:10 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8CCV-0000000G2gw-27ho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 06:06:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26943102E13D0;
	Fri, 25 Apr 2025 08:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745561170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ef+EBezQpcy3FcBFm+eU7MkGtMSmPuuasBxJN60QVdI=;
	b=Hw/Oj/IO4Av7kOb3s35NwLPns3+xpbMuJVuqH+xEDaSFwjxveKEzr7E6GkEmGAbQ6i35dM
	xfOtt+ma5ftYQe0YIuzr79f1lSRMvhwmHrJ1MKL1Op+VIQRjqdCRHl+OHvEnjjOZFJ+2Wa
	LtflvHzHZfua9V3s/vsxEA9p/kxptvSAfc7b76Z9sg6Ev2gHQTqPZMgpYWon2RLzLaBCt2
	4eoUgjaLQqtWm1M1X9UOXtMvYvlshLvuIQD/NRGIjBf/RLx1pizmf2RUTYAxUobIlbDqLt
	ch/aX+sPqLBv6lvEWY1nDorOB4GpeiZ3MwqBpoZ7xZCUbBWY95Mbz5LJzCAHiQ==
Date: Fri, 25 Apr 2025 08:05:56 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v7 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250425080556.138922a8@wsk>
In-Reply-To: <0bf77ef6-d884-44d2-8ecc-a530fee215d1@kernel.org>
References: <20250423072911.3513073-1-lukma@denx.de>
	<20250423072911.3513073-5-lukma@denx.de>
	<20250424181110.2734cd0b@kernel.org>
	<0bf77ef6-d884-44d2-8ecc-a530fee215d1@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8.TKQ2DIg4Q.iOHILDMF3JC";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_230615_701023_E5B21673 
X-CRM114-Status: GOOD (  25.01  )
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

--Sig_/8.TKQ2DIg4Q.iOHILDMF3JC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof, Jakub,

> On 25/04/2025 03:11, Jakub Kicinski wrote:
> > On Wed, 23 Apr 2025 09:29:08 +0200 Lukasz Majewski wrote: =20
> >> This patch series provides support for More Than IP L2 switch
> >> embedded in the imx287 SoC.
> >>
> >> This is a two port switch (placed between uDMA[01] and
> >> MAC-NET[01]), which can be used for offloading the network traffic.
> >>
> >> It can be used interchangeably with current FEC driver - to be more
> >> specific: one can use either of it, depending on the requirements.
> >>
> >> The biggest difference is the usage of DMA - when FEC is used,
> >> separate DMAs are available for each ENET-MAC block.
> >> However, with switch enabled - only the DMA0 is used to
> >> send/receive data to/form switch (and then switch sends them to
> >> respecitive ports). =20
> >=20
> > Lots of sparse warnings and build issues here, at least on x86.
> >=20
> > Could you make sure it's clean with an allmodconfig config,=20
> > something like:
> >=20
> > make C=3D1 W=3D1 drivers/net/ethernet/freescale/mtipsw/  =20
>=20
> ... and W=3D1 with clang as well.
>=20

The sparse warnings are because of struct switch_t casting and register
access with this paradigm (as it is done with other drivers).

What is the advise here from the community?

> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/8.TKQ2DIg4Q.iOHILDMF3JC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgLJkQACgkQAR8vZIA0
zr03Fgf+KfcqvqXrwV6oo9XJVMdSNQIoB0p4NlpvVAe5aBxAydJI1xm3RrEZXNPB
TrcywFHW7nVupYx2HApaLOvpgBFWEK0WbXSfc2EbwtFXWaaUQ+HGbpV4jAmvHbul
RWNftPG+5U26bQE9B6hrXU7Ceve1/wAscafs+U677XofK1RyE33ZOZYsuUsKbVgo
duYePABd2Vo4o97byc0pHVPqCmjhfPA0ID+Arzs+7aGx2ym7JqZUjRjmbADnmKg3
7dRtO0/LmgzGdP9i4B7AvcYeHox7iUjmmqp9yXfbqyagRKcsOKqguUVviqtSjwmP
AlDFyZxoEjM8RW9Jw2Lyzwycn6MhzA==
=ESLF
-----END PGP SIGNATURE-----

--Sig_/8.TKQ2DIg4Q.iOHILDMF3JC--

