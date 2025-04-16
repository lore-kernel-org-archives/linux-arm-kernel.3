Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4448C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ic5Mzuh+6gVyT/cjuEACzFs09tFVLNoZJQMRkUzWw0=; b=jKARbl6nzTAhYwihm6bXC8LlcH
	/nmD6/9VFbD+XxwwomkIXERLH0itpnDwlXu5RAkGYY3ZngWS7rbttsxp2ieGNXDq2T+XxQVwDm+My
	9SmnzDvxaNzMyqyxPN2yFQo2dusA7VG2RttCGQsyRcTouZucqsShnG9X0Spq6BSuhV5lWqPfiCda1
	yxIAa3f8/As5YxZw6S1+KJJ+rbKXjPZdmEP617hGA3NJn1PmgCvzyrYJVAXUZeoCOy/UQ/b9FoZHm
	2HZAy/I1jMwmjyMMiC5HZb0E3ILb5wVEn7k4hO0RxKnXFUzDNMxbkCvG1IZmGZ1BK0reMgAMGSxit
	kxF6DSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xWg-00000008gp0-1bSb;
	Wed, 16 Apr 2025 07:49:42 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xPS-00000008fJA-2NaY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744789334; x=1776325334;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+ic5Mzuh+6gVyT/cjuEACzFs09tFVLNoZJQMRkUzWw0=;
  b=azNJafqxx+RJ1pLOikNDhtRgS7KsobFkYiIC8ySDMXrKl6PBbGfjAy47
   bwvLAiAh2KwegXhoods+sKwNmbpV+nxXaR30xl7OzkSqcHJZBeLX89Afe
   /W3dIw0fCkx8fTHSqyTQhxBA/u44LCZF78b4JbB3fNILuynWRfhiQyYFN
   hvR3QLox7TBlTqQ2H0oD1nGUqh1xRTIdcwqTRuoaUAr9eiqiUpYAlNlyD
   GR3BaIZ/LEsfgXIzDddAoU8OQuqG+Ym6tLEMN+7WQOFuvOt+EwSKExDAB
   eMyugrVkVhJG7vZy+VpYMOkh4+p+Qo9QB1Dl0IRLTKzTCd0XOSDQe+Zli
   g==;
X-CSE-ConnectionGUID: OjJQBx9WQeiBmnGab79m3A==
X-CSE-MsgGUID: vRI8Fz7rRtunAMcO6SuQeQ==
X-IronPort-AV: E=Sophos;i="6.15,215,1739833200"; 
   d="scan'208";a="43559009"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Apr 2025 09:42:11 +0200
X-CheckPoint: {67FF5F53-32-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 25AC1741F08C06D9D92310D82C1FB32A_4
X-Control-Analysis: str=0001.0A006375.67FF5F50.0006,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B6216C05B;
	Wed, 16 Apr 2025 09:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744789327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ic5Mzuh+6gVyT/cjuEACzFs09tFVLNoZJQMRkUzWw0=;
	b=M/MtMDuaCVsUrYg5k5jSsiYw7QkR3zAqIlGVppUaVxHxGhZSpjRagHzYaOR33GUa8B/+mr
	V0FP85KaNypEdgNHGjWgg18wvlwCMundEPoMouXH05+EG5WFuimPHIA/3nNpAThr8zngt5
	hgxfuLtggXzYfTbkZk80kjc3AdMVR9+048TRxIpdYQbjiU/I04wf2jgTfzLF9tA0JON6Xs
	UKMpKEdOQSQInAg7V41UNqv+dSFfmCplvt49UiPQH9t/ivMVl+bLeNNRh4BP+NRvebEmok
	5qeOCHH4lDDZYwUKOOA/YOz/Gs5IE/v2U/UOIr/fin+QjLjJPw2pvYkyHKwTsA==
Message-ID: <b53fba84c8435859a40288f3a12db40685b8863a.camel@ew.tq-group.com>
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
Date: Wed, 16 Apr 2025 09:41:57 +0200
In-Reply-To: <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
	 <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
	 <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004215_106619_E15DC80F 
X-CRM114-Status: GOOD (  49.22  )
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

On Tue, 2025-04-15 at 17:25 +0530, Siddharth Vadapalli wrote:
>=20
> On Tue, Apr 15, 2025 at 01:28:48PM +0200, Matthias Schiffer wrote:
> > On Tue, 2025-04-15 at 16:06 +0530, Siddharth Vadapalli wrote:
> > >=20
> > > On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > > > As discussed [1], the comments for the different rgmii(-*id) modes =
do not
> > > > accurately describe what these values mean.
> > > >=20
> > > > As the Device Tree is primarily supposed to describe the hardware a=
nd not
> > > > its configuration, the different modes need to distinguish board de=
signs
> > >=20
> > > If the Ethernet-Controller (MAC) is integrated in an SoC (as is the c=
ase
> > > with CPSW Ethernet Switch), and, given that "phy-mode" is a property
> > > added within the device-tree node of the MAC, I fail to understand ho=
w
> > > the device-tree can continue "describing" hardware for different boar=
d
> > > designs using the same SoC (unchanged MAC HW).
> >=20
> > The setting is part of the MAC node, but it is always set in the board =
DTS,
> > together with assigning a PHY to the MAC.
>=20
> The MAC is the same independent of which board it is used in. So are we
> really describing the "MAC" or configuring the "MAC"? Isn't it the PHY
> along with the PCB lines on a given board that determine how the "MAC"
> should be "configured" to make the combination of "MAC" + "PHY"
> functional together?
>=20
> >=20
> > > How do we handle situations where a given MAC supports various
> > > "phy-modes" in HW? Shouldn't "phy-modes" then be a "list" to technica=
lly
> > > descibe the HW? Even if we set aside the "rgmii" variants that this
> > > series is attempting to address, the CPSW MAC supports "sgmii", "qsgm=
ii"
> > > and "usxgmii/xfi" as well.
> >=20
> > This is not about PHY mode support of the MAC, but the mode to be used =
on a
> > particular board. I would not expect a board to use multiple different
> > interfaces with a single PHY (and if such cases exist, I consider them =
out of
>=20
> For a fixed PHY, the MAC will be "configured" to operate in a set of
> modes supported by the PHY. The HW description is coming from the PHY
> that has been "fixed", and not the MAC. But the "phy-mode" property
> resides within the device-tree node of the MAC and not the PHY. So are
> we still "describing" the MAC when it is the "PHY" that introduces the
> limitation or requires the MAC to be configured for a particular
> "phy-mode"?

The phy-mode property does not describe the MAC, but how MAC and PHY are
connected. The MAC node just happens to be where this information is placed=
 in
the Device Tree (Using graph nodes to describe the connection between MAC a=
nd
PHY seems like overkill...)

Also note that (as I understand it) I'm not changing anything, I'm updating=
 the
documentation to reflect what has been the intended behavior already. Pleas=
e see
the previous discussion with Andrew that I linked, where he convinced me th=
at
this is the correct approach.

>=20
> > scope for this patch series).
> >=20
> > >=20
> > > > (if a delay is built into the PCB using different trace lengths); w=
hether
> > > > a delay is added on the MAC or the PHY side when needed should not =
matter.
> > > >=20
> > > > Unfortunately, implementation in MAC drivers is somewhat inconsiste=
nt
> > > > where a delay is fixed or configurable on the MAC side. As a first =
step
> > > > towards sorting this out, improve the documentation.
>=20
> While this patch is improving the documentation and making it consistent
> when it comes to the description of "rgmii" by stating that the "MAC"
> shouldn't add a delay, for the remaining cases, as to who adds the delay
> and whether or not the MAC should add a delay has been left open.
> Existing documentation clarifies what the MAC should do for each case
> except "rgmii" which is being fixed by your patch.

Andrew specifically asked to leave it open in the DT bindings whether MAC o=
r PHY
add the delay, and it might differ between drivers (and different operating
systems using the same Device Tree).

Whether the MAC should add a required delay in cases where it's configurabl=
e is
an interesting question - not one of the Device Tree bindings, but of drive=
r
implementation.

On Linux, there currently isn't a way for the MAC driver to query from the =
PHY
whether it could include the delays itself. My assumption is that most PHYs
either don't have internal delays, or the delays are configurable. If this =
is
the case, having the MAC add them in internal-delay modes and not adding th=
em on
the PHY side would be the best default (also for PHY-less/fixed-link setups=
,
which should be handled like a PHY without internal delay capabilities.)

@Andrew, does the above seem correct to you?

Best,
Matthias


>=20
> > > >=20
> > > > Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434=
dc28@lunn.ch/ [1]
> > > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com=
>
> > > > ---
> > > >  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++---=
----
> > > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/ethernet-control=
ler.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > > > index 45819b2358002..2ddc1ce2439a6 100644
> > > > --- a/Documentation/devicetree/bindings/net/ethernet-controller.yam=
l
> > > > +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yam=
l
> > > > @@ -74,19 +74,21 @@ properties:
> > > >        - rev-rmii
> > > >        - moca
> > > > =20
> > > > -      # RX and TX delays are added by the MAC when required
> > > > +      # RX and TX delays are part of the board design (through PCB=
 traces). MAC
> > > > +      # and PHY must not add delays.
> > > >        - rgmii
> > > > =20
> > > > -      # RGMII with internal RX and TX delays provided by the PHY,
> > > > -      # the MAC should not add the RX or TX delays in this case
> > > > +      # RGMII with internal RX and TX delays provided by the MAC o=
r PHY. No
> > > > +      # delays are included in the board design; this is the most =
common case
> > > > +      # in modern designs.
> > > >        - rgmii-id
> > > > =20
> > > > -      # RGMII with internal RX delay provided by the PHY, the MAC
> > > > -      # should not add an RX delay in this case
> > > > +      # RGMII with internal RX delay provided by the MAC or PHY. T=
X delay is
> > > > +      # part of the board design.
> > > >        - rgmii-rxid
> > > > =20
> > > > -      # RGMII with internal TX delay provided by the PHY, the MAC
> > > > -      # should not add an TX delay in this case
> > > > +      # RGMII with internal TX delay provided by the MAC or PHY. R=
X delay is
> > > > +      # part of the board design.
>=20
> [...]
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

