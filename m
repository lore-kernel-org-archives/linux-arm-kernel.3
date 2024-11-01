Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C792CE6F07D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trF5iyL1mDlTJho0oj7yyu6ZEf153IyrywjYMZ102E8=; b=4iJLxL1iFx9osgSWnmq6k1Tmkb
	aAhAfEz5ejf+m3DC4BK3N2CcYDIDK1aCH9s2q1vcN0fJf7cnLwhzSeZD2Zyc7HHs4Z27/+fSOH0C2
	6GzJl7cXm9XozdcdZ4XzHxGMP2VEhGlWmBoYBbwzICkcmbgpwYlhK+u6EMLtIKfiuE2ZqutXOL6Ww
	s2d52574+M4pVehrurHlfg0BUoFwle9Zb9bObfr2rWw3hx4vbR9Xe9swp8uOQKvhnPXfgRjUeXh1p
	VLZPYM1llPbXJwhbmp1ogBLZYjY0lYJG8g0AEE5Qvyt9iIfB6qC/G2c4oWbcymqkp5QiQ6KuKRevW
	b7RPF+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wJx-00000007yHv-1ujL;
	Fri, 01 Nov 2024 18:24:29 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wH3-00000007xss-0uNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 18:21:31 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id BB1AF1140092;
	Fri,  1 Nov 2024 14:21:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 14:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730485284; x=1730571684; bh=trF5iyL1mD
	lTJho0oj7yyu6ZEf153IyrywjYMZ102E8=; b=AzFMUpuBaqQSowX6azU+RejWM2
	wyDtPcAffuWlTQvjZTdW5xCbPQdHPRI7oSsB2q5Jub4hcziQYxC+0ni+LsREexF6
	DkVjErjJ6jWIgKliaHh8QIpWLnGPdIjmS6rcen/7SZKsCGe8ZFK43pl4NDeFp6f4
	8EM6F84JBLCJuALm1JIJcAwcInFwfL7hBYKiZgazW+TpidNPNTZi5Lq8h5NmCFzU
	i7nlVi49WjKHDEoJm8bSLcVMQM5LeKw1yFHtgmoLBkbMrUxUKXM/hEi1QcC0DvlQ
	F1+bWohoMAUkqxoVPAsgjRansJfXu5dmgCzU1kGGoGMYdiEMu4q1mRr7Bzkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730485284; x=1730571684; bh=trF5iyL1mDlTJho0oj7yyu6ZEf153Iyrywj
	YMZ102E8=; b=Y3HFggzA8Cf+GnXEc2itQv6bNdzGXV9LXv7LkmtlbalJtShsb45
	Q83Binl5HZuhhRjn52o83Xd2UeWwo80sZIaPMAHELceowEU4S7HQdk5zHQWpFuDA
	wNjLdlbgrlvLwGfow6j7DAZ1b6EAI3QIEZGFD81dAibSV0I5f1FmK3BVBVvXsNXY
	e3YyLzEt2EGep70iLQc54jEjKMS+0eYfonLPpSEdid5t+7FIjod56ICEmCDEh7bw
	5Z/vqQOShDWKECWDnZkuUozSBXAKdmNacQ3uX5zlxG+wy6PkZU5xuCgO+t+WrGF8
	bM8b2DZh4zWimxeszL9irPUKfJWPejpOF7w==
X-ME-Sender: <xms:IhwlZ-E3r9ZQzkkQzLmtGkxUNjVgdmMF1nIoYBzByHe4QkAAO9cMqg>
    <xme:IhwlZ_UMMb410UlAOtHju9p7NKx5ju5-L_FwIAq674dLj4Jt7WlWfcI1N5QSXo4Dv
    i9CKMICeH8AXpfbu7U>
X-ME-Received: <xmr:IhwlZ4L6wmtfVh-7Ekh4j12RujvpFUkYe59fmIlfRpqbF0fR8w-Rpkf8WYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    dvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhep
    rfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihii
    eqnecuggftrfgrthhtvghrnhepueettdeikeeftdevuefhheetvdeijeekgeekgfdufefh
    feeuteevkeeludeihfdvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghmtgdqrh
    gvsghoohhtqdgtrghushgvqdhuphgurghtvgdrmhgunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
    dpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegt
    hhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhope
    hjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfiestghouggvtgho
    nhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepfihimheslhhinhhugidqfigrth
    gthhguohhgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvght
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhs
    rdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IhwlZ4Hh0P-sbjAofzrjUjvhmSJsy2ucVH52IDH7i8aU_MacgvDxrA>
    <xmx:IhwlZ0WuuZN4vDQLb4oL5LY-rnssf2zvfevD-RWUbV11ccmbimXTuQ>
    <xmx:IhwlZ7PNI7dDHD5EhPv2-zntEshkZ-WieccQv6MPxlVsxiqjyxOLqg>
    <xmx:IhwlZ734rnICFGBVWJ1q2ylBez6T6uAulwZY8E_gbtChialkemR6xw>
    <xmx:JBwlZ5XH7jXOPBijjqX88_lYe23wEXZdzuTLVKmVhgweafNvbTxZdjHf>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 14:21:22 -0400 (EDT)
Date: Fri, 1 Nov 2024 14:21:20 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, wim@linux-watchdog.org,
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Peter.Yin@quantatw.com,
	Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
	DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
	chnguyen@amperecomputing.com
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Message-ID: <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="30YWrylCoTEi3uv9"
Content-Disposition: inline
In-Reply-To: <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_112129_776576_3E128BC9 
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


--30YWrylCoTEi3uv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 08:11:59PM +0800, Chin-Ting Kuo wrote:
> The boot status mapping rule follows the latest design guide from
> the OpenBMC shown as below.
> https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-upda=
te.md#proposed-design
> - WDIOF_EXTERN1   =3D> system is reset by Software
> - WDIOF_CARDRESET =3D> system is reset by WDT SoC reset
> - Others          =3D> other reset events, e.g., power on reset.

I'm quite surprised that the above is relevant for a kernel driver at
all.  Isn't "EXTERN1" a name of a real watchdog signal from your
hardware (my recollection is that there are 2 external watchdogs).  I
think the point of this referenced design document was that most users
of BMCs have "EXTERN1" used a for software reset conditions.
`CARDRESET` should be representing resets by the watchdog itself.

The purpose of this design proposal was not to require very specific
changes to individual watchdog drivers, but to align the userspace use
with the best practices already from other watchdog drivers.  I don't
think the kernel driver should be bending to match a particular
userspace implementation; you should be exposing the information
available to your hardware.

Having said that, it was known that there would need to be changes to
the driver because some of these conditions were not adequately exposed
at all.  I'm just still surprised that we're needing to reference that
document as part of these changes.

>=20
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500: The reset triggered by different WDT controllers can be
>            distinguished by different SCU bits. But, WDIOF_EXTERN1 or
>            WDIOF_CARDRESET still cannot be identified due to
>            HW limitation.
> - AST2600: Different from AST2500, additional HW bits are added for
>            distinguishing WDIOF_EXTERN1 and WDIOF_CARDRESET.

--=20
Patrick Williams

--30YWrylCoTEi3uv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmclHB8ACgkQqwNHzC0A
wRlSow/+Iye/jg2CYP74XxbljSUQyZeOx8XldLsjToFpmX1M0NWHxbdC4wK+YXdS
t2E0NVWhfQNf6LMJtyNgcbjOtQgkI7RCiLfujmeytJTrReN3DEOSsbZmo8U+wIiD
vUzORLpW1qMP8QDfnuNh0fhxNvOGaiR2usV7ZnfQAh2T4IiS91KT+kv9b3RGcaRn
awzwSu8nZOkB+6sRs7JZKyIASS+gQ8Xxrk/o6Nhqy+kdVBXe0yMWOq6l1UezJ6qa
l7SoSLxqG+G3Y4/7A4O0zM/z178a02KccqZyeAnM/OwjTIskf1s8f2yZDPOodN8O
SsuIWOkKGPiFZtGhyKZqAXfT2XnCU0OIBJl2FGY7QsbZI7oe88Hs/zsVg7q5i7iT
r1LffFB7mfuuAADVMkff1Lzmn2wuXfO7yVuoj1hlgoGJriLhletsoqLiBHhVRQSL
5CMBZU6j8B7xbBpKl7MrYWaftPr87Crm5TZgEuhS73J/Y887PuyYl7SKF8NTbQTa
d+0mJ7/gKsRYBSXzbeniOwR49uC7FgkFaf8ghh1lbJQToawg3A8p/UwBVnYWRB22
/4fi+vTdXVNFTg8KYBtNbL4K7WgfgQac+iqpYYNBYZSa/Mfm0eSU8XVM/x/Sx6O8
kfLSVldxTUgqePexvjWNgvJY+Uet8IjvYWT1CIqDvJ/5dXlvZB8=
=kxlo
-----END PGP SIGNATURE-----

--30YWrylCoTEi3uv9--

