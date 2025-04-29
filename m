Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB34C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HTPHirUqJp7iM6IFbqXNuusghxBtTxmX3QXCCMPY0Q=; b=AQG9ESnI8NLIeLChV7pjVIoJyo
	kPGRU3LrJOA5eqmpYnZ7/OqbiFy84Nhe+BpiUq3mXggh4bGJ24e2S5MEM8P/WgsEw6LMxawpu7Xqy
	Ut1RAtb9C4vGCfk06kLiEoJ5+aRGbVdc0ye0bmJAMu0Di2b3EvMEepthgmzze5dSkD1quufq4Mo9J
	alSnY0sLb8+OdhxX12xMZuEefy6yLafNFjhASVHU7FwUw9H1A2/x1bI8a9gmMUoSQVWnkydf0NWqs
	e66+Cy68k2u7+EXUL7EPil/tj6Icn5gfAncylNW5twL9GgN+tgpPfYM6BWimV/Z/4ch7fymlBu31U
	IFQDAEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gMv-00000008wv2-1bbr;
	Tue, 29 Apr 2025 08:31:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fKy-00000008k5U-2Nws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745911504; x=1777447504;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0HTPHirUqJp7iM6IFbqXNuusghxBtTxmX3QXCCMPY0Q=;
  b=hgeubRxhTOrQjMuyF77CMk5h/jnB+0iL1hgx67dZIIS9RUUnb2/ykYPo
   XCZWodjLg93vUwa6fVSb79p+6Bx8CXZejA3pfo9aVyWVGoTwoV0heaW6D
   OepptwCPtzL93EwB77TWmSLOGLSJCM8m9DyGiV2cH3MfnFwLEX7wSKhgW
   ecdWvggq7c5la4jl/9MeGG/F30uMSkrZzdYvhkDXbvH71zoEADcDOYDBy
   My913RjErIeCVmE8mDrwcsqvjBoFB5GaHZnCUWQa7aD1SbkIN2mwo8iRQ
   vnmcdLNYgwKLK4ytzi3WH2lj5nu9g3ls5IBeIGmZpkUcACNqPyO0Id0O0
   w==;
X-CSE-ConnectionGUID: mvncbzE7TwS02I9aCObShg==
X-CSE-MsgGUID: Oo+CuzYXSh2hT+Oi+La46Q==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43772696"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 09:25:01 +0200
X-CheckPoint: {68107ECD-32-F35B2447-E1635CDE}
X-MAIL-CPID: 4C6EC668F1D0F19820FBD4C1ED5AF527_1
X-Control-Analysis: str=0001.0A006376.68107EDB.007D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4E1E160F78;
	Tue, 29 Apr 2025 09:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745911497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0HTPHirUqJp7iM6IFbqXNuusghxBtTxmX3QXCCMPY0Q=;
	b=UMBk4PSSN3UPAEvH64wlD/DQG63n6qyz8Vno1RD6lID08HbYoSOsULofaTdR5GBIBR3dMC
	mFpdWkhtUDfnpSseGPOmYzTQTNSYRZ3DnFJZUo7mFx6/bijMtSUSx/fq3o1dVVYvhFNwBY
	VReTlz6llr68OZdahRTkt+Ae95QczLZHbR+tHmrSa3Ov+pgA5/xelkQS9xi2IR7JUhnW+z
	aBv77qSBW2cGa4CjsTUon7WSlGvklEDnBkpkK3Evpc+ilIBWeOkJZv2CEfoCLy1VBORQSo
	1uolbaIQbqdBZjmupkWsKjxAgm+OzCBGDvoZ6yDjacJyW4yCSNwmIFAxVhla2A==
Message-ID: <b75c6a2cf10e2acf878c38f8ca2ff46708a2c0a1.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Date: Tue, 29 Apr 2025 09:24:49 +0200
In-Reply-To: <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
	 <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
	 <aAe2NFFrcXDice2Z@shell.armlinux.org.uk>
	 <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
	 <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_002505_088547_658403DC 
X-CRM114-Status: GOOD (  22.67  )
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

On Mon, 2025-04-28 at 16:08 +0200, Andrew Lunn wrote:
>=20
> > > However, with the yaml stuff, if that is basically becoming "DT
> > > specification" then it needs to be clearly defined what each value
> > > actually means for the system, and not this vague airy-fairy thing
> > > we have now.
>=20
> =20
> > I agree with Russell that it seems preferable to make it unambiguous wh=
ether
> > delays are added on the MAC or PHY side, in particular for fine-tuning.=
 If
> > anything is left to the implementation, we should make the range of acc=
eptable
> > driver behavior very clear in the documentation.
>=20
> I think we should try the "Informative" route first, see what the DT
> Maintainers think when we describe in detail how Linux interprets
> these values.

Oh, we should not be Linux-specific. We should describe in detail how *any =
OS*
must interpret values.


>=20
> I don't think a whole new set of properties will solve anything. I
> would say the core of the problem is that there are multiple ways of
> getting a working system, many of which don't fit the DT binding. But
> DT developers don't care about that, they are just happy when it
> works. Adding a different set of properties won't change that.
>=20
> 	Andrew

Hmm, considering that

- interpretation of existing properties is inconsistent
- we could like something with a consistent interpretation
- we can't change how existing drivers interpret the properties, as that wo=
uld
be a breaking change,

I don't think we really have any options but to introduce something new, or=
 keep
the inconsistent status quo.

Best,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

