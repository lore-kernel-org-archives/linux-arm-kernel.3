Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4024C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/1SBfclmjV9t64jnFhuhheGcpz4E34/v8LbFoFPXNE=; b=fMT+ABnTiyQ09bJqH1ZA4iKf/e
	UI1CtsX51yBZZFWEULQpml4RKaxk75oWeajms/8hffcPQf9uylbnc984CDj20kNIUzCQ4j4SrR8UH
	syQrImH1MW+MpyMqAKbrNlgG0qqgIFMP9EF2YqRPXJ9NqxO4i4+8UR5LKgfS17EPLdfvlJwOzIyMS
	Fnjbc1Jmx1nB5PgsNca4mm/FnODf5feodGYr6tRL/e6vJzNnVYa94ejQKarYBDoCPGUHKYz2XaSGt
	ZnoSw+atlim0Z1ymvLhJOyogSbv5QmN4ROi5NNmYJYCmcAT/Wm6VfGtZli8Qdmk5vblst/jNbzuSK
	kUvcD3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuc6-00000009EqB-15JR;
	Wed, 19 Mar 2025 14:41:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuZ9-00000009EQt-2QIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742395123; x=1773931123;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=G/1SBfclmjV9t64jnFhuhheGcpz4E34/v8LbFoFPXNE=;
  b=DsRGIpjZFUeSTdiqWDFiqHjWXin3aWwgdPwRpKP0Ej8iDRSDN8sZERan
   Ct4EijFBuD8x0AD3NIs73TqX4T8dbxu8UpRejUWCwPit3TkBjjJAljxWG
   b8Wd8c6Ml1LVj3/na5huXSLJkKzLUr4TxTl191yvOxDr+JEaSzaWVdpsM
   iqGfz5+Ba9I8SvnDzG+EA+ixuD1UmTLSEdxZ+pqUl0n8oXH2TDwj/Bgrw
   4vA5b6pBnX3xwpKwZc3+VtytNzQ8VmeWZXkDcK8hiKBU5UuzEBoXhMM9u
   2jyPa+8bmH1Y9p/cQUwczRbz6NmCUPv0WNT1a3AX/vfkIbgNYbXxZWbag
   g==;
X-CSE-ConnectionGUID: lwQFH4ISScqaGNZ5gva7dQ==
X-CSE-MsgGUID: 51DorJIcQv6yWGOuQSuvnQ==
X-IronPort-AV: E=Sophos;i="6.14,259,1736809200"; 
   d="scan'208";a="43049076"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Mar 2025 15:38:41 +0100
X-CheckPoint: {67DAD6F0-30-903EAEAC-E04C76C8}
X-MAIL-CPID: 2F4A6FAFF435457784BD49CF749B144C_5
X-Control-Analysis: str=0001.0A006377.67DAD6E7.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF6B316384E;
	Wed, 19 Mar 2025 15:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742395116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/1SBfclmjV9t64jnFhuhheGcpz4E34/v8LbFoFPXNE=;
	b=fdXpomdnV8/1Q+4z21z1ssyreQpdnexWFElsibVn+mnnJfJbQfjwycUDWMU2njBay99q44
	P6w4hqK7cdT+YWj+rBEjIFu6MqWPi+aahtjscfpjM8kh+LqKMDhkl9vyrNIBevxexQ0PV5
	71QaciqCFHSN5uK1NcWMw27dU0IFX6YR4JS/5R5myoxO2PmMis2ZSG2lk7TOIMO6CJtNs1
	Oe6XhSSEBVyWtui+W3h0U3Y/bt3ZHd1eZZUrYM0uTAhEhR5O9olEQBGY+08tDfmpw4d8H/
	kx+uVFnDi6i3rVEn/Zriqa7sBEfJSVy394dwEyrODQZlfPPDkYEZ6pCW2g9jtA==
Message-ID: <570d9c2a25b437ab75f14104b354027210809028.camel@ew.tq-group.com>
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
Date: Wed, 19 Mar 2025 15:38:33 +0100
In-Reply-To: <262ff436-2334-43bb-a998-ab48f06ea0e3@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
	 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
	 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
	 <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
	 <a2a2f201-73a4-4a99-baef-0d593a88c872@lunn.ch>
	 <309052f3f69950fe43390505cc7254aee8c8f5c6.camel@ew.tq-group.com>
	 <2953e10c-0a57-4d49-b831-3864a07eefd5@lunn.ch>
	 <e6ee878f655c31473bca54e4187d9006a19158b1.camel@ew.tq-group.com>
	 <262ff436-2334-43bb-a998-ab48f06ea0e3@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_073844_108595_D8D6BFFF 
X-CRM114-Status: GOOD (  47.19  )
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

On Wed, 2025-03-19 at 14:37 +0100, Andrew Lunn wrote:
> > Hi Andrew,
> >=20
> > I've just thought about this issue again. As mentioned, a number of MAC
> > drivers(*) implement what is described here:
> >=20
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml?h=3Dv6.=
13#n77
> >=20
> >=20
> > That is, the delay is either added by the PHY or the MAC; having a dela=
y on the
> > PCB is simply not supported.
>=20
> Yes it is, you are reading it wrong. First off, as said a number of
> times in the last couple of months, this description is from the
> perspective of the PHY. It is not the board perspective. So:
>=20
>       # RX and TX delays are added by the MAC when required
>       - rgmii
>=20
> From the perspective of the PHY, "when required" the MAC adds the
> delay. It might not be required, because the PCB adds the delay.

I fail to see how the documentation could be interpreted that way. As you
explained, "rgmii" actually means that the delay is added by the PCB, so th=
ere
simply is no "when required" here - it can't be required if it's already in=
 the
PCB. I stand by my opinion that this doc is plain wrong and not just worded
poorly, and needs to be fixed to express the intended meaning.

(I believe we agree on the point that this should be improved, I just don't
think it is appropriate to make statements like "few developers actually
understand RGMII delays" when the inaccuracy of the binding docs - supposed=
ly an
authoritative resource on the meaning of DT properties - is the cause of th=
e
misunderstanding)


>=20
>       # RGMII with internal RX and TX delays provided by the PHY,
>       # the MAC should not add the RX or TX delays in this case
>       - rgmii-id
>=20
> The MAC should not add delays because the PHY does. But this implies
> the PCB cannot also be adding delays because you would end up with two
> sets of delays.
>=20
> > Fixing MAC drivers to interpret the values without
> > "id" to mean that there is a delay on the PCB will break existing Devic=
e Trees,
> > so that's no good.
>=20
> You need to look at it broken driver by broken driver. I _think_ the
> Aspeed case can be fixed. Others we need to look at the details. Maybe
> in some cases we do need to add a warning to the device tree binding
> the driver is FUBAR and has special, broken meaning for 'rgmii'.

I don't know about Aspeed (maybe you're mixing something up, or I'm not awa=
re of
something?) - in the case of the TI driver I'm dealing with, this is indeed
possible to fix up because the MAC always adds a delay, it is not configura=
ble.

>=20
> > As a first step, I'd update the docs to describe the intended behavior,=
 but
> > mention that some drivers implement it wrong.
>=20
> Feel free to submit patches. However, please think about it. DT is OS
> agnostic. DT describes the hardware, not configuration. Other OSes
> might decide on a different policy about which of the MAC/PHY pair
> implements the delay, since that is configuration, not a hardware
> description.
>=20
> > The question is how to deal with
> > the wrong behavior going forward. I see the following options, but none=
 spark
> > joy for me...
> >=20
> > - Keep current driver behavior forever where fixing it would break exis=
ting
> >   Device Trees
> > - Deprecate all existing "rgmii*" values because of their inconsistent
> >   implementation, come up with new ones. Seems like a huge pain to add =
support
> >   for in all MAC drivers and other code that deals with PHY modes...
>=20
> Won't help anyway. If developers are getting it wrong now, why should
> they suddenly start getting it right when all you are changing is the
> name.
>=20
> The real issue is that you can combine two bugs to get a working
> system. It seems like few developers actually understand RGMII
> delays. They don't spend time to understand it, they just try random
> things until it works. As a result, they get systems where the MAC is
> unknowingly adding delays, and 'rgmii' works, so job done. They don't
> know or care it is wrong.
>=20
> > - Introduce an additional DTS flag next to phy-mode to express that the
> >   phy-mode is supposed to be interpreted correctly
>=20
> If you are going to do add any sort of property, it should be a bool
> indicating the opposite, 'phy-mode-is-fubar'. Something which
> developers will think about before copying into their DT.

The whole point of my suggestions is to allow fixing the drivers while stay=
ing
compatible with old, broken Device Trees. If we could add a property 'phy-m=
ode-
is-fubar' to old Device Trees, we could just fix them instead - but we can =
only
fix in-tree DTS, and it will only have an effect on systems that update the=
ir
DTBs with their kernel, so I believe this simply isn't an option because of
backwards compat guarantees for Device Trees.


>=20
> > Do you have any suggestions?
>=20
> Add a checkpatch.pl check. Any patch which adds a phy-mode !=3D
> 'rgmii-id' needs to have a comment on the previous line containing the
> word PCB. That should at least help stop more broken DT being added.

Ah, I like that idea - I'll see if I can find time to look into it.

Best,
Matthias



>=20
> 	Andrew

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

