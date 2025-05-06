Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6994DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+tjm4josKsxx1XYGwI2ueKPNoEguumH2AgRPhy7ttY=; b=IbHPR8cIgGi0c9vNVpMZVYXGed
	/vC5BPwoHKCGNDWS4Xx1fAUgVo1/wakb9kHTCh59LVHAVYZVMR54fSZB/jq1l8AF+td0U1iOUeYPW
	H7ztvl9eoJjMiWj1Ntzxj492muEfroMyO7N1gC6wWCKyWrUxVjyKduObEyPIBDlRfND5X+p+uw0o/
	ObFyGjyoxXTiVn32uxybN9aRPOQidorobaiN48g0R+dMgWjiFajMx8ab/OtJyUOfALFZVzXbqP5ex
	CahY+8Jr4QJILDNuwb1+UJFLE6S54CLKwX8wpmW0AA4HFNx0Y5yrKW9VmjeJslceofUIA3wX3mtYt
	zxJDGKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIrL-0000000CEfO-1pJc;
	Tue, 06 May 2025 14:01:23 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGV4-0000000BkNu-0Zb4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:30:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FA101048C2EF;
	Tue,  6 May 2025 13:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746531012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=j+tjm4josKsxx1XYGwI2ueKPNoEguumH2AgRPhy7ttY=;
	b=W6ahW4CdKTfVxM95VHuGYdddGdilzhWER2Uybu0fbJV8lhKvmzz6jyldsaXQYo1D6rxQed
	/IEuy42LWI6CH6yGXVXl7Wc56T/ZLjItA5b/oRsCRX79p4jsPVSyv717zDHqFhi4AHOvBA
	lwQR/DuRqPbOxCRvz3G8B6k2lI/v7ha/iOgJdQUsh2PpYgzFWu963NQkOtYSMCtdlfelaG
	a5vUosABWOg9xbYof+5USgGRX39V61UGuVb0W6c4RhH2PXKYkBxeuszey34ueGpLi6vqPW
	LbN/LUcrygAtvkk0m6fGRYM+QcSNZkZu+yXJoiRQmgQSdRvRSvGrmrcUycL1eA==
Date: Tue, 6 May 2025 13:30:09 +0200
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
Message-ID: <20250506133009.3e945546@wsk>
In-Reply-To: <20250505131611.0c779894@kernel.org>
References: <20250502074447.2153837-1-lukma@denx.de>
	<20250502074447.2153837-5-lukma@denx.de>
	<20250502071328.069d0933@kernel.org>
	<20250504082811.4893afaa@wsk>
	<20250505131611.0c779894@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VGhUyR7bm1Y+8Pq6wGW6=0i";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_043014_319169_BF773CCB 
X-CRM114-Status: GOOD (  16.03  )
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

--Sig_/VGhUyR7bm1Y+8Pq6wGW6=0i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Sun, 4 May 2025 08:28:11 +0200 Lukasz Majewski wrote:
> > > Now that basic build is green the series has advanced to full
> > > testing, where coccicheck says:
> > >=20
> > > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1961:1-6:
> > > WARNING: invalid free of devm_ allocated data
> > > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1237:16-19:
> > > ERROR: bus is NULL but dereferenced.   =20
> >=20
> > I'm sorry for not checking the code with coccinelle.
> >=20
> > I do have already used sparse and checkpatch. =20
>=20
> No worries. Not testing a build W=3D1 is a bit of a faux pas.

Yes, I'm fully aware of them - mea culpa.

(at least now by default I will have W=3D1 set :-) )

> But coccinelle is finicky and slow.




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/VGhUyR7bm1Y+8Pq6wGW6=0i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgZ8sEACgkQAR8vZIA0
zr2hpwgA4XcfexGrhhN6LFts0lR95BX5rhktdQBEW5FlLs57vikXMEzNzJqty9n3
MqEjDsfAcdHJfe9vwMMVgoxBLBDahgnAki/tyn+PrtH78hmXIZ8p4ZOShnGalF11
13lKMYA8oH/tCLonXLTvspvwR92/S0aUZKszFWwDq4VS8ZBLHRUMtU0TvkA/TZps
7VrU+3V6SX16CPI73894dh5lkc+tV5bnJJu2PTQ+pMhL+DuLmEMSCkxyhAocLcdq
bvcb6o3hjhXzQtE70wXbI2HfH5X/x4hEyliOfK8Q+/s/BsjWFjEsxCvtVCb4UCGR
DQ7kBhb6w1Q4Q5B+D+d8g/R+O/iNbw==
=4Uhq
-----END PGP SIGNATURE-----

--Sig_/VGhUyR7bm1Y+8Pq6wGW6=0i--

