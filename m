Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BE7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAJSv9h5wRcXrptqovOOWtspStxTbyq+MpU6paZIMew=; b=MWOTc0ik55kluc8dLwonZqPjRD
	pEaqI5Gt8PcNByETgxSs3ejpfLi3EPjV5PHXpcCGt2CWTdDU8mQK3tbQ7SQ4lh5xrxoRPlZs24zwR
	kw3lJmEsa7mtqqGmWC4MxLuePCXXigjO3rmzajLY0zcBO34hQpuacVg1v0NatKOSBPGXgmltuAzjt
	BDU9TkpLwlW0FBFbvD5G/r5g+m1lFLcSn07LloOd5FZ1huOdqiX2EhFb6bCx94igrdKHY5L2/mdpv
	A4U6U6aHFLouS24FKQMUAkK0cwWAEpSFlmqsPYa0U2DMXBcAdSYZw2NvFNfHQW+K1VKe5OW4Mn7Di
	nCuaQDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EMo-0000000Du1p-2EXE;
	Fri, 11 Apr 2025 13:24:22 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Du5-0000000DooF-2brJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:54:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B916C102E4621;
	Fri, 11 Apr 2025 14:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744376076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hAJSv9h5wRcXrptqovOOWtspStxTbyq+MpU6paZIMew=;
	b=ORXkI7Tys/+aHAwaPzH3zrM4L5cGkNhSVzUbIDX0YfMWN2nmpnVIdNGWdw1/8legxzCPD1
	wtxw+ELgb18/QG6eSReH1fXjuApQuStP+GTgStG2YHP2bngukJjBylJWSNlGZnVTHVDxUC
	RrGPy0ilcuVPtmar0YlqFU1otWHJv3I8NLc3CN8bq8J+9JV1x3q6S+yGHvI9GjcISdlgwT
	SoA3YKJFln0pH9iS36F/46RRRzRKIxuzOrXxN7x1xISn4EM4ZRQ8cCSysEFxMeHI1TFoN5
	o5Sno3HBfomj0RLS+u1bhaQIAtaxERGudlso5SFwuuZq/u59w/0Jbe/vftu0vw==
Date: Fri, 11 Apr 2025 14:54:30 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>
Subject: Re: [net-next v4 4/5] net: mtip: The L2 switch driver for imx287
Message-ID: <20250411145430.3001f1db@wsk>
In-Reply-To: <20250409162854.069abe88@wsk>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-5-lukma@denx.de>
	<20250408151447.GX395307@horms.kernel.org>
	<20250409162854.069abe88@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EDd9PYuJ_JPMOcH6VsFq/w0";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_055441_821330_C1B3F100 
X-CRM114-Status: GOOD (  25.55  )
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

--Sig_/EDd9PYuJ_JPMOcH6VsFq/w0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Simon,

> > It is unclear why hwentry, which is a pointer, is being cast to an
> > integer and then back to a pointer. I see pointer arithmetic, but
> > that can operate on pointers just as well as integers, without
> > making assumptions about how wide pointers are with respect to
> > longs.
> >=20
> > And in any case, can't the types be used to directly access the
> > offsets needed like this?
> >=20
> > 	atable =3D fep->hwentry.mtip_table64b_entry;
> >=20
> > 	*read_lo =3D readl(&atable[index].lo);
> > 	*read_hi =3D readl(&atable[index].hi);
> >  =20
>=20
> The code as is seems to be OK.
>=20
> The (atable) memory structure is as follows:
>=20
> 1. You can store 2048 MAC addresses (2x32 bit each).
>=20
> 2. Memory from point 1 is addressed as follows:
> 	2.1 -> from MAC address the CRC8 is calculated (0x00 - 0xFF).
> 	This is the 'index' in the original code.
> 	2.2 -> as it may happen that for two different MAC address the
> 	same CRC8 is calculated (i.e. 'index' is the same), each
> 	'index' can store 8 entries for MAC addresses (and it is
> 	searched in a linear way if needed).
>=20
> IMHO, the index above shall be multiplied by 8.

I've double check it and it turned out that you were right :-)

The following code:

struct addr_table64b_entry *atable_base =3D
fep->hwentry->mtip_table64b_entry;

*read_lo =3D readl(&atable_base[index].lo);
*read_hi =3D readl(&atable_base[index].hi);

Is more readable than the current code.

The same would be used for atable_write()

I will change it for v5.

>=20
> > Also, and perhaps more importantly, readl expects to be passed
> > a pointer to __iomem. But the appropriate annotations seem
> > to be missing (forcing them with a cast is not advisable here IMHO).
> >  =20
>=20
> I think that the code below:
> unsigned long atable_base =3D (unsigned long)fep->hwentry;
>=20
> could be replaced with
> void __iomem *atable_base =3D fep->hwentry;
>=20
> and the (index << 3) with (index * ATABLE_ENTRY_PER_SLOT)




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/EDd9PYuJ_JPMOcH6VsFq/w0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf5EQYACgkQAR8vZIA0
zr3A6Qf9GXE29Y/XpPCVSfPKZ01QAhFm6OWDn29Hd19Xc5zaiBO3NFgCJzxJpCM/
hv949OWXQbxs2glV9RSPxw1OJAIUL+Kub2pt23XEMkkobCV0XzuAW/VqPfjjv8in
Za9ur5L7E840u1z8uu24NbWBDdoRJBCxLy7Z9YSSxPA9UDMytwLWDwelSQADb1lj
FhdpA0swhuzHJsTUfu0NL9NZcbQbVapyKUsNZ+OzZJV682VIOSw7DGrwazG9NWYX
KpHcwfAMp2iiEbVVjjjl5n0VXMXO/Lth4LuGGJaAUd+4ZyZk7n8qoTRldy/PjdJZ
WPYNyrpUjZEEzphLwmzo6N/RRxxp3Q==
=QEuc
-----END PGP SIGNATURE-----

--Sig_/EDd9PYuJ_JPMOcH6VsFq/w0--

