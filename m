Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F9AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LteyrmhH69QEmehsyqX62nW+pV4+wAljWT6HLYaaBkI=; b=K859D9/fuTmvobXdikwP6z5g2X
	yigz4E7MEEq7hLU3pYs6/P7QduT05usEBEqEBW2jv7jhdfNPRFHXuwCBuazB47tVzCr96xz3NDwDG
	2yZ7StOHrRPN7Fj5OZvRZ0yps5tOrplvTNLk479gIvFbdSi6XTdN0MsY7g0Xj/XJjLrg+/LAxChA8
	3zGQ6b7K93sEU/7e0PyuKwyM9D9DZ4IImNdwylINk/fu6CubKiltGQ8p1fWLCAwky43GodVqyjh1N
	7ecX5x9+4m+wR1VuBEjaLEefBAXeOLfYAQu51ib2pLSQO4gy04CH0A8o7k+r+qyAxxftmRMPzmcIf
	s5ODsBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeJF-000000087Xu-3QD6;
	Mon, 09 Dec 2024 14:00:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeEf-000000086RP-0oPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733752541; x=1765288541;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LteyrmhH69QEmehsyqX62nW+pV4+wAljWT6HLYaaBkI=;
  b=aKyjflzlQlIFhVXCk7d+nHdqsWwijmVqGiXv6Q1hq65ovCncQb3vi8Dg
   F2DGSn/YC8Iy8HxdQG+bcU5BFzFQyhIw5TCgt6h07Y0L2mSeHQeCwJJVx
   4U8lgQbu+JNBsC6pGA1sJn9sPl52IXW0CF1wxadNQDVbo8ZBhaYcRvP8W
   LzFkQvAVPc4Nt5mwst6Bb5vx90rSg5bghQycVxIqwRClBLdE0V5+cXENg
   NnrR5DpPxs5ofWj4iMSECSDC4d0tVNr8SrCFAcLfScI+kKAo3gteM5pjM
   4XZv3Vp5VgbcWJdPWL3krH4v0SJ6gt9fsCazZTg5BZl5l9/S9RPn6muSm
   A==;
X-CSE-ConnectionGUID: oY3/CPafQFaYj6kvAX6lGA==
X-CSE-MsgGUID: 64VLtlciSiyH8wjSMQSoGQ==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40488462"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 14:55:38 +0100
X-CheckPoint: {6756F6DA-18-1B231F50-D910A4E3}
X-MAIL-CPID: 1819D895E6E3B5DBD34CC4AA263FD5E0_5
X-Control-Analysis: str=0001.0A682F1B.6756F6DA.00E2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20C6F166BCD;
	Mon,  9 Dec 2024 14:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733752534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LteyrmhH69QEmehsyqX62nW+pV4+wAljWT6HLYaaBkI=;
	b=QLvbfbmy0PuIHr5aXue1xK8WW6edelWn8QmOxbYyObNboeFIyUcpHv+H+idnIZNdcwpw4D
	58LL1g/e5cxk6Bv2Pe9cKqfA/GWGGWvuUzfR5ouajVv136ABRijxQJtJ94o/kMGCHATg6i
	sqjc50OVIpDk8b7XRN1KWAzrrdsxKKp4RmiCoA/mb5PzVuua+Djfhy05CFd2Lm3QULBDv6
	fnvQM9Oj2CLqHE2KfpYCzQsIPOrJnJxFddZhITrTZrJ2dTQHTDAjPwJ7TzcYkPM04LTDoZ
	/zKyntbPnmhtGa8/BSx31byOgyUwtAN0dymRYLArJ6B79dpOx8SnPIlUvntJWw==
Message-ID: <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Felipe Balbi <balbi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, Hari
 Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Date: Mon, 09 Dec 2024 14:55:31 +0100
In-Reply-To: <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055541_724080_257F2BFF 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, 2024-12-09 at 14:24 +0100, Andrew Lunn wrote:
>=20
> > +&cpsw_port1 {
> > +	phy-mode =3D "rgmii-rxid";
> > +	phy-handle =3D <&cpsw3g_phy0>;
> > +};
> > +
> > +&cpsw_port2 {
> > +	phy-mode =3D "rgmii-rxid";
> > +	phy-handle =3D <&cpsw3g_phy3>;
> > +};
>=20
> rgmii-rxid is very odd.
>=20
> > +
> > +&cpsw3g_mdio {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&main_mdio1_pins>;
> > +
> > +	cpsw3g_phy0: ethernet-phy@0 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <0x0>;
> > +		reset-gpios =3D <&main_gpio1 11 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us =3D <1000>;
> > +		reset-deassert-us =3D <1000>;
> > +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
>=20
> I guess this is the explanation.
>=20
> What happens when you use rgmii-id, and don't have this delay here?
> That would be normal.
>=20
> 	Andrew


This is normal for AM62-based boards, see the DTSI of the TI reference
starterkit for example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi#n451

With rgmii-id, both ti,rx-internal-delay and ti,tx-internal-delay should be=
 set.
As ti,*-internal-delay sets the delay on the PHY side, phy-mode "rgmii" is =
the
one that would not use either:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/net/ti,dp83867.yaml#n78

At the end of the day, does it really matter as long as MAC and PHY agree o=
n the
used mode? We copied this part of the hardware design from the TI reference
board, and did our hardware qualification with these settings, so I think i=
t
makes sense to use the same phy-mode configuration.

Best regards,
Matthias


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

