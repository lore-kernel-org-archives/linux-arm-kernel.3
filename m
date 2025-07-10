Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598D1C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVNRURW7mpHDd03yiBO4hzyqJyZHZgozC/0qPz7n+lE=; b=GDbOseAD0owsfIpbSDhWrlxgSo
	UM/aFuoooZ1jCbDqqZZr5dho77UFgQzwKnS1y2Z2bkDiwyeSivBi9BiQMDF/zFHzUH0H/oVSxGVHf
	Q+qUQ60blea/XcNgLfB78eBLqgEx3kZ9BRfLbx5s8sDFa70CPt0ozzNjjNP36nxLGbocF51u1b/F6
	mrKX+lg9U41o+cY2Rx1luIBbBbk3W7YVkOoO5DacGFm6kKwJjl30HF/zw95AypF4u08IMLcQEY5T9
	zeqI2RPedu0VA0UNA+VSupoJZiL/LkDqOQvcPLsBC3zSdCpIkfZn6a7kzRGxaxOd/ND2jJV4VTLWo
	v2MCQ4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlx7-0000000B3U8-0X9K;
	Thu, 10 Jul 2025 07:44:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZl6V-0000000AuQx-3pdY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EE895C5C9B;
	Thu, 10 Jul 2025 06:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0A0C4CEE3;
	Thu, 10 Jul 2025 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752130198;
	bh=SVNRURW7mpHDd03yiBO4hzyqJyZHZgozC/0qPz7n+lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1W/3He31SVNhKvl70+xMMi1Fdmys3eUZB88yA6pKfZL01RP+sYseLaJMVwqJdyO9
	 uiJ0c8fR3W8tcOY2VexSK0EUI0KRswqKn2gbnoCVvz9v/FZCoN4rZQ4U11HgFzc0r1
	 80Tul8XKx4MOy9Nvsfl96LRsEJejEAax4X9v6SJRRIkdkwAkF3nffHFY05yEt75knP
	 uLVsN6VuHtRuyVzvLeBNsSGWzmYU8v0DXu2iGw/6eZrwkiKvwKAZTEGeSndky8SuO/
	 FubUi9CwWr/xPAO5l09Ub5b18E9kvXCtfCwQgBI1yKwelBZaPu6/7ekWS3pLVWzjl3
	 F1LtCLbaz+4OQ==
Date: Thu, 10 Jul 2025 08:49:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
Message-ID: <vqqcxkefrzp25jjirwqbpmu4ytevt57mwd6fylmywlydjxvfiu@fs4xludzaurl>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
 <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
 <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
 <907a40d6-7d55-4bdf-b16b-01c71b5f4104@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmq3mzfo6amvxnbe"
Content-Disposition: inline
In-Reply-To: <907a40d6-7d55-4bdf-b16b-01c71b5f4104@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_234959_991288_1CD05A0E 
X-CRM114-Status: GOOD (  12.55  )
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


--nmq3mzfo6amvxnbe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
MIME-Version: 1.0

Hello Laurentiu,

On Wed, Jul 09, 2025 at 11:29:16AM +0300, Laurentiu Mihalcea wrote:
> On 7/9/2025 9:05 AM, Uwe Kleine-K=F6nig wrote:
> > JFTR: I marked your patch as "changes requested" now in patchwork and my
> > inbox and expect an updated patch, but without holding my breath :-)
>=20
> Sorry for the long delay! Got this on my TODO list. Busy week :(

No need to hurry for me, I'm not busy waiting and we won't be able to
stop Linus releasting 6.16 anyhow :-)

I prefer well considered patches over patches in quick succession anyhow.

So it's ok to take your time
Uwe

--nmq3mzfo6amvxnbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhvYpAACgkQj4D7WH0S
/k7Bzgf/UmJuQUOMJzEA55s8ZtGd4ndkFp63PO8tRbJYvIX9IBIoaoLRUOWbuAO+
XR6KNfcB4DKlMqMQxR+ULXdTpH8Ph2VbgNSi4JzaMUL3j5BI8aoF0/rvZgDG3Agq
0ZiDQ8aZ8+Y5KWEHdbD73HrJUV7QwzWZ7Ji+5TNlLy5sQwgznzCZCHgkj23bUEC4
yXtpK+XnN4DhQnXLdEkA6/76LWfH7XNsIjphu9RYweLSJQs1NBOwD2hvP0HjhImV
II81sKub/Z3mIbg8kElfsEgi2h7Zk2YwjFUEno7rnjLcmLQPyTXla36I0pfasTFp
uVNinr3DXmMXDPoZuO3WOiKiaJ2T/w==
=TuF/
-----END PGP SIGNATURE-----

--nmq3mzfo6amvxnbe--

