Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D3AC369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlumGq7vM1zdawKPQ73srx7Hl+6/OZGTFw8mUGlSyF4=; b=SYg3PMyw+pylaQ2AqvBHbLij3E
	Nc03JmV0Iu95NWYHv4ZlkGzzwPAngc+rzgzXzh6vwcKxTrdOw6QOoErRTv8/f8r7sZZJGNxs8VDah
	8KYqzbEh8p+yzTXpp91ecCcmaiw2pmXCMeDHtC5PDGMgYpkXa28gFuhUA3bkRgEts+7eQJut9x8kp
	/T5IsgHIvNRvffy2BQSnz3khaAG8ND+0qx2MSgYkG0RHAgD9BP7i+VHEvyHvGRhBwcXsRwII832Xs
	M51InpcVa38WLtOzOimWo9MNDGQaJ0a7SyYuwRfwq5L6nNf37ecYMIwMgFZTBpvfhJgwDtAp2YRs1
	a7n9wH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hjt-00000006B1y-2QLM;
	Tue, 15 Apr 2025 14:58:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gST-00000005wGB-3NeG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744724174; x=1776260174;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YlumGq7vM1zdawKPQ73srx7Hl+6/OZGTFw8mUGlSyF4=;
  b=nYuFfLSKyyAaBgdKI277lYQ+pCRxKwmKDMMhEm0pjAzT2vX8P1a6PZwP
   F7Xl2wapUNUHpON7NJh63pZZHtIFXXd+C4AKxqWrgZuT+24oiFL6wteXZ
   a37T+FdWK2624WNrxyO/KHje7k1yKm+16U47gYqyRj17V7mUhndZXFlWQ
   l9XkCe9XHpkR5JCet9M+QMDEnWgcmzu6V7LquDp+ZsHO6RpqmPcXDTHvR
   5FwaM+bojA2L8HjhUo91a9sf13aDr2bmIyNw+Pzo8NUX0jd5cgH1ZQYAB
   u45WquwRi+uLrB9FbJXMVWzNmmgDzFuxusBHLyvafTDIf2xZoUp7Wruk0
   A==;
X-CSE-ConnectionGUID: 4JmEHnumSiardRnLnoh2fQ==
X-CSE-MsgGUID: AIsZbzq8TESfdb/5qlUYdg==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43544164"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:36:12 +0200
X-CheckPoint: {67FE60CB-23-903EAEAC-E04C76C8}
X-MAIL-CPID: 5B0AF881536021B586ABAFFC070E78C9_5
X-Control-Analysis: str=0001.0A006378.67FE60CA.0079,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01FA216352A;
	Tue, 15 Apr 2025 15:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744724167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlumGq7vM1zdawKPQ73srx7Hl+6/OZGTFw8mUGlSyF4=;
	b=dfyCBWDGZHU3CnXVHIWtfbqqptMkOcHrAP4hRtPFve4aNIB65zWyJXZoPTtSIwPltsfF9B
	k8ny/K4t4jGaCVbVrVKh5NZBurAF+emH4wlwyKId8gly3C7sGPDBX7QjRJ9R6xBQXrZAQs
	/TJ+QpxUQMCz4vtnRcecHXTrUUhIF1hMxY/m2PjK22CK2MBSsNKzqJXbfwXcxVa0jDsRUg
	jTayiwh69jQGpMa8xAsK2yBins+6R0kixIglhxym1p6OYHarvIf75Ju1qvRef+oOxCDxpe
	klgtzcf9urXZaSPecMtKydMmyHNXI2xsfu5f0PEK3Bg6supf3wmpU2hm8+uwLw==
Message-ID: <659d6affd7c58474c4bca5c92fc762925591d0d9.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft
 <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
 <corbet@lwn.net>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 15 Apr 2025 15:36:01 +0200
In-Reply-To: <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_063614_138465_0914EA81 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, 2025-04-15 at 15:20 +0200, Andrew Lunn wrote:
>=20
> > +  **UNCOMMENTED_RGMII_MODE**
> > +    Historially, the RGMII PHY modes specified in Device Trees have be=
en
> > +    used inconsistently, often referring to the usage of delays on the=
 PHY
> > +    side rather than describing the board.
> > +
> > +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the=
 clock
> > +    signal to be delayed on the PCB; this unusual configuration should=
 be
> > +    described in a comment. If they are not (meaning that the delay is=
 realized
> > +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.
>=20
> It is unclear to me how much ctx_has_comment() will return. Maybe
> include an example here of how it should look. I'm assuming:
>=20
> /* RGMII delays added via PCB traces */
> &enet2 {
>     phy-mode =3D "rgmii";
>     status =3D "okay";
>=20
> fails, but
>=20
> &enet2 {
>     /* RGMII delays added via PCB traces */
>     phy-mode =3D "rgmii";
>     status =3D "okay";
>=20
> passes?

Yes, it works like that. I can't claim to fully understand the checkpatch c=
ode
handling comments, but I copied it from other similar checks and tested it =
on a
few test patches.

One thing to note is that I implemented it as a CHK() and not a WARN() beca=
use
that's what is used for other comment checks like DATA_RACE - meaning it wi=
ll
only trigger with --strict.


>=20
> > =20
> >  Commit message
> >  --------------
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 784912f570e9d..57fcbd4b63ede 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3735,6 +3735,17 @@ sub process {
> >  			}
> >  		}
> > =20
> > +# Check for RGMII phy-mode with delay on PCB
> > +		if ($realfile =3D~ /\.dtsi?$/ && $line =3D~ /^\+\s*(phy-mode|phy-con=
nection-type)\s*=3D\s*"/ &&
>=20
> I don't grok perl. Is this only looking a dtsi files? .dts files
> should also be checked.

It is a regular expression - the ? makes the previous character optional,
matching both .dts and .dtsi files.

Best,
Matthias


>=20
> Thanks for working on this, it will be very useful.
>=20
> 	Andrew

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

