Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB138C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYfOX7V+RukALTVJ8Qi0exktDRQwn3ad8TOZoUSa2Qs=; b=dO76ClpStO/VhhND8k+FSUxm4p
	i24v6TazOoiaEAHGjInv2jso5QxgS7VpnQi2XJF8rp1UXuubid+l+/m+4uS0Alf+x0KWXieGZAnzk
	IHpkS+OFt8MmConluUVsQEjiclpX1oO1qi9EijnccTP4xMig+Bw5UZky8mtsS7yf8EWJXMrlfzKq9
	HmLLA0NsSuRJ7iT/JIxCoQja54fgyaYhBx/yJ978MJM7+sHF3nLnLl2peTR4jysqH8Q6nL4KzPoxV
	z8I8TdxEMUiAomjxN7/4yJ7HGxZrwx+XlEhr2rkaXqi5X0FsJTLksEy98aJTGJn8BIhsybWJEIQLU
	NHfSHDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fJQ-00000005idm-3zmz;
	Tue, 15 Apr 2025 12:22:48 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eTJ-00000005XfK-2kwr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744716537; x=1776252537;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mYfOX7V+RukALTVJ8Qi0exktDRQwn3ad8TOZoUSa2Qs=;
  b=Kxo8GrVaw+/g5VLpBFsklJhmCAfeWW4JwVXAE6fc1gDgI0Tgzqq/gFoK
   wIRaEX2rV06yD1dL6dNfHPo/QEFveIj1LwRkjxTmir+6e/Teng43j61Yf
   UKR+voj7Js6r0ajfMRRIAjt1hmP+284a8INrS+MIGgPQ+jHunuigvGnLP
   0UkrxBclsShHZja3kz7bwwC4o74pTzHYObmD+zljz8XmSaByeI3Qtr5dz
   +0CKU7ngKRzKB2BB9FKBxgkdmQ8H+qXTnRedzdV/0cdbO3L53ytq7+32r
   GcqzGC9F+ZdmFGL/CxYeWlI/Y7SfHBz+uxgASdzLfGio1wAqkdENkn75m
   A==;
X-CSE-ConnectionGUID: vXCahAz8Qt2JyThBws63mw==
X-CSE-MsgGUID: kYpqigZ5SqehRJK/H93HBA==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43539741"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 13:28:55 +0200
X-CheckPoint: {67FE42F7-22-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 711BF174EC8067FD99CF9D8CB63779DE_4
X-Control-Analysis: str=0001.0A006374.67FE42EA.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DD8A165E7F;
	Tue, 15 Apr 2025 13:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744716530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYfOX7V+RukALTVJ8Qi0exktDRQwn3ad8TOZoUSa2Qs=;
	b=pfGHhhh1oTEs/xBWDSj8LUf9ShgiCi7VgdPYiuGvNXG5xphp+EBH09XLaali19JDQZxCET
	4gIOjjzMDHQZHiMpK8S9BpuJWqWsjhvdAWZcb/0ike2AGTJ/PmNLgtFwrmKyXuy4qNKdXw
	CRaH+/VtIpzD467WnNG43Q4gg1o3XMr/Ph7tIhKWplLHCS2ZplnPpS7FtM2BIurUgzzD/K
	wymqT2YbGckWBt3/5yJ3aVCix3azGs2ZprELQv61+z+kQH+0UehkQocQwbqDQ16aSKGXmf
	oVwZgl2CKMo1G1thmHXVb83n2a+hYrj9+3exhFUU5QyhngmG84KjYwlPFyd1RQ==
Message-ID: <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>,  Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 15 Apr 2025 13:28:48 +0200
In-Reply-To: <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_042858_009018_6AF85CD2 
X-CRM114-Status: GOOD (  32.46  )
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

On Tue, 2025-04-15 at 16:06 +0530, Siddharth Vadapalli wrote:
>=20
> On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > As discussed [1], the comments for the different rgmii(-*id) modes do n=
ot
> > accurately describe what these values mean.
> >=20
> > As the Device Tree is primarily supposed to describe the hardware and n=
ot
> > its configuration, the different modes need to distinguish board design=
s
>=20
> If the Ethernet-Controller (MAC) is integrated in an SoC (as is the case
> with CPSW Ethernet Switch), and, given that "phy-mode" is a property
> added within the device-tree node of the MAC, I fail to understand how
> the device-tree can continue "describing" hardware for different board
> designs using the same SoC (unchanged MAC HW).

The setting is part of the MAC node, but it is always set in the board DTS,
together with assigning a PHY to the MAC.

> How do we handle situations where a given MAC supports various
> "phy-modes" in HW? Shouldn't "phy-modes" then be a "list" to technically
> descibe the HW? Even if we set aside the "rgmii" variants that this
> series is attempting to address, the CPSW MAC supports "sgmii", "qsgmii"
> and "usxgmii/xfi" as well.

This is not about PHY mode support of the MAC, but the mode to be used on a
particular board. I would not expect a board to use multiple different
interfaces with a single PHY (and if such cases exist, I consider them out =
of
scope for this patch series).

>=20
> > (if a delay is built into the PCB using different trace lengths); wheth=
er
> > a delay is added on the MAC or the PHY side when needed should not matt=
er.
> >=20
> > Unfortunately, implementation in MAC drivers is somewhat inconsistent
> > where a delay is fixed or configurable on the MAC side. As a first step
> > towards sorting this out, improve the documentation.
> >=20
> > Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28=
@lunn.ch/ [1]
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.=
yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > index 45819b2358002..2ddc1ce2439a6 100644
> > --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > @@ -74,19 +74,21 @@ properties:
> >        - rev-rmii
> >        - moca
> > =20
> > -      # RX and TX delays are added by the MAC when required
> > +      # RX and TX delays are part of the board design (through PCB tra=
ces). MAC
> > +      # and PHY must not add delays.
> >        - rgmii
> > =20
> > -      # RGMII with internal RX and TX delays provided by the PHY,
> > -      # the MAC should not add the RX or TX delays in this case
> > +      # RGMII with internal RX and TX delays provided by the MAC or PH=
Y. No
> > +      # delays are included in the board design; this is the most comm=
on case
> > +      # in modern designs.
> >        - rgmii-id
> > =20
> > -      # RGMII with internal RX delay provided by the PHY, the MAC
> > -      # should not add an RX delay in this case
> > +      # RGMII with internal RX delay provided by the MAC or PHY. TX de=
lay is
> > +      # part of the board design.
> >        - rgmii-rxid
> > =20
> > -      # RGMII with internal TX delay provided by the PHY, the MAC
> > -      # should not add an TX delay in this case
> > +      # RGMII with internal TX delay provided by the MAC or PHY. RX de=
lay is
> > +      # part of the board design.
>=20
> Since all of the above is documented in "ethernet-controller.yaml" and
> not "ethernet-phy.yaml", describing what the "MAC" should or shouldn't
> do seems accurate, and modifying it to describe what the "PHY" should or
> shouldn't do seems wrong.

The settings describe the connection between MAC and PHY, thus their explan=
ation
must mention both to make sense. See the linked discussion with Andrew for
details.

Best,
Matthias



>=20
> >        - rgmii-txid
> >        - rtbi
> >        - smii
>=20
> Regards,
> Siddharth.

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

