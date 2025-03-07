Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE96C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5fyjOg8mqfWfC3KOyV6/MWYR6QrmfV+xzV1wfE7gh8=; b=brpWvX4yToUB6xFDLv5TZsXXh6
	lkSJlBOKorQZ1UHBsYS+vNHt8KFHd4ypU7LyVGBAC8JLVnt/0/Nqr6W6Fj5rr5kjne3RvClv6ryYI
	GHDrHw3wJG0tiMCnVYyMGV59qSxtYIqwDDyoQFlttobkIKBA/8DCqaWzHcHaNjWGt939Ztn84qcxW
	iXtKmK6nWGgfdHa0c9plQRdkFGP5/Q68Oq9G4L0ItojKEM+zVnlcAM0uxcLYIPW6g1v+vvbr3bOU4
	YOUP1kXmGC9XuqfhhcXlvu85P8o13taloaojZogRQxnIoy0dn+RFjzRFG9xfDRAf1JpJXbZltQ63F
	TqT2hjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaFs-0000000EpGq-1dHu;
	Fri, 07 Mar 2025 16:08:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaB0-0000000EoO8-14Yr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:03:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4195A458B2;
	Fri,  7 Mar 2025 15:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FF8C4CEE3;
	Fri,  7 Mar 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741363433;
	bh=jKcE6LBMQIEZD2siLfa8qIZAQzMXrOFejG9YW9TQFCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqtpgJxM+FeMrOrrVjR4r9cUjgMcwN9iUIv+6+iR8KBfhyMfBbVmAMm+VSjWprAou
	 Hbymjq5Syj6JTZBa8Xjni9057HvoMx9qOQLbtsVRXcgEAHwb5dogZFSDMmyBGLqPUT
	 AtOU81kinqiCYTA+fCx98rXK7uz5ZXzgoooO5oYNjrkNQZXgZak8KAnZhlAVdCk3Bc
	 X2zpr2dmAZ8FE+P4BinuR9nTL4qyGZJXZGapTjFcAXfpoIaTMPinysbS6k/eZP5Zbl
	 vlvqKNeR4VPnGk7kmjAYk1FuHqrgxWTPWcTzqZYHzfkgUWJkXty0GgdyQO5oY/9Zpm
	 fQ7VtAswFxmfg==
Date: Fri, 7 Mar 2025 16:03:46 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250307-barbell-pretzel-368d6a4d1336@spud>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
 <20250228-shampoo-uprising-44ae0d3bd68b@spud>
 <OSBPR01MB2775DFC184F78E9FB50F28FFFFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250307-everyone-ragweed-e05a10a9646b@spud>
 <OSBPR01MB277531D7C872C9EB0B287069FFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FptXTXAIhD0gPfos"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB277531D7C872C9EB0B287069FFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_080354_468844_587251B1 
X-CRM114-Status: GOOD (  36.15  )
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


--FptXTXAIhD0gPfos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 03:55:27PM +0000, John Madieu wrote:
> Hi Conor,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Friday, March 7, 2025 4:33 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Docume=
nt
> > the TSU unit
> >=20
> > On Fri, Mar 07, 2025 at 03:14:05PM +0000, John Madieu wrote:
> > > Hi Conor,
> > >
> > > Thanks for your review!
> > >
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: Friday, February 28, 2025 8:03 PM
> > > > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu:
> > > > Document the TSU unit
> > > >
> > > > On Thu, Feb 27, 2025 at 01:24:39PM +0100, John Madieu wrote:
> > > > > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block
> > > > > designed to measure the junction temperature. The device provides
> > > > > real-time temperature measurements for thermal management,
> > > > > utilizing a single dedicated channel (channel 1) for temperature
> > sensing.
> > > > >
> > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > ---
> > > > > v1 -> v2:
> > > > >  * Fix reg property specifier to get rid of yamlint warnings
> > > > >  * Fix IRQ name to reflect TSU expectations
> > > > >
> > > > > +    enum: [0, 1]
> > > > > +    description: |
> > > > > +      TSU operating mode:
> > > > > +      0: Mode 0 - Conversion started by software
> > > > > +      1: Mode 1 - Conversion started by ELC trigger
> > > >
> > > > Can you make this "software" and "elc" or something please, unless
> > > > people will genuinely find "0" and 1" to be more informative.
> > > > And why doesn't the property have a default?
> > >
> > > Sorry for miss-specifying.
> > > ELC is an external event trigger. May be should I specify it like tha=
t ?
> >=20
> > If "elc trigger" is meaningful to people using hte device (IOW, it matc=
hes
> > datasheet wording) then that's fine I think.
>=20
> "elc trigger" matches datasheet wording.
>=20
> >=20
> > > To make sure I got your point, do you mean specifying a default value
> > > in bindings ?
> >=20
> > The property doesn't actually need to be required, it could easily have=
 a
> > default (say software) and only be set in the case of using the elc
> > trigger - which brings you to Rob's comment that it can just be a boole=
an,
> > setting the property if elc and leaving it out of software.
>=20
> Got the point now. I can make it default to software trigger, and add opt=
ional
> Boolean property to ELC trigger. Let's say "renesas,elc-trigger;"

Yah, that works.

>=20
> >=20
> > Rob's other comment was
> >=20
> > | Who/what decides the mode? If a user is going to want to change this,
> > | then it should be a runtime control, not a DT property.
>=20
> Changes are not possible at runtime. Some customers may want software,
> while other may want the external trigger, and this is immutable=20
> configuration.

What makes it immutable? Set by some wiring on the board? I couldn't
find the user in your driver patches to better understand how you were
using it.

--FptXTXAIhD0gPfos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sY4gAKCRB4tDGHoIJi
0ut/APj8ly7agJVBfsuReMJT8RtHUn7mZHkeTYHpMWJm/lYEAQDHM+aoQ7IZhrsm
zco87OB941IsVq/iRfFQNx78HSNvAQ==
=kAfv
-----END PGP SIGNATURE-----

--FptXTXAIhD0gPfos--

