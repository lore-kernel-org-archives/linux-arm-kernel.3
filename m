Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2409BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYMGTzfGZ2Zt3cpte8T9HeVpzYLSAXYFAK7i0FKFTKo=; b=W79h2FGLjb7frB/SNGhhSIn1Q8
	P9QxYNNey0cGX0ZpACPwoLZTvF66VRoZ+qBSJRaxZk1uVI+j/pelZHQuNGiT2U0t1vojhXgIXLBGI
	bW3TBYKFT8KRllEAemvYMUP2AUddh4K1kvLta3UHtdESyiGxMXE3lGiBI5vb1xH8becKsxD+tBWcR
	guEKOWAE+w7nYnnxrD21+qzRBe3rdKd+StI6zXgUeECM4SfIQ7T9pOgeovMcygArdZD8aOJ6ynyMB
	F9LTlt5aP4JzOiEiiE5ckHbobyRSI/8DB3Zlu6pxo34z6lI3jL1oxV30MjSILWLdIVEPjpr2kP7by
	okFj5BOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZnm-0000000EifR-19Ds;
	Fri, 07 Mar 2025 15:39:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZhK-0000000EgHW-09Wv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 647B45C5BB9;
	Fri,  7 Mar 2025 15:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD04C4CED1;
	Fri,  7 Mar 2025 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361592;
	bh=T8pm9fzwyKtv3TmcyIBDRu8FWKQO9PkFtQpCXZzkH5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUObU9qsjd1SooeVdUfrrJl9fVYTuXf+V439lXM1M7u0b5lKvuIMBf/hNgn3h1cZ4
	 wtohVxDmaoJOxnGSx3co3YI7J3bR9OmrleAurHNVvvFApz7SPumbRu06wbccHRPw9C
	 kWAoR5ZN3YcxKvCx416ezcBICJGp8I4SCzzt0WfedBtFKqX5fkqF4wRGVRNabQm0qg
	 DT5qoI699jnzTOO0ne+jj0Z/ZGrQY2S1jojvv40kjy13z0jY1zYwvdBIn4CD5mLC60
	 uesnhPB79pTv8GIMKAiCvAfh5HFBcnskvV9dxt6EUO/v5uje+7FJpHp1AxJWR16Koa
	 g/znbMB1M8rng==
Date: Fri, 7 Mar 2025 15:33:05 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	"robh@kernel.org" <robh@kernel.org>,
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
Message-ID: <20250307-everyone-ragweed-e05a10a9646b@spud>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
 <20250228-shampoo-uprising-44ae0d3bd68b@spud>
 <OSBPR01MB2775DFC184F78E9FB50F28FFFFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aWY9G/uo86esg184"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2775DFC184F78E9FB50F28FFFFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_073314_187215_6CDB8949 
X-CRM114-Status: GOOD (  33.81  )
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


--aWY9G/uo86esg184
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 03:14:05PM +0000, John Madieu wrote:
> Hi Conor,
>=20
> Thanks for your review!
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Friday, February 28, 2025 8:03 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Docume=
nt
> > the TSU unit
> >=20
> > On Thu, Feb 27, 2025 at 01:24:39PM +0100, John Madieu wrote:
> > > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block
> > > designed to measure the junction temperature. The device provides
> > > real-time temperature measurements for thermal management, utilizing a
> > > single dedicated channel (channel 1) for temperature sensing.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > > v1 -> v2:
> > >  * Fix reg property specifier to get rid of yamlint warnings
> > >  * Fix IRQ name to reflect TSU expectations
> > >
> > >  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++=
++
> > >  1 file changed, 123 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > > b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > > new file mode 100644
> > > index 000000000000..e786561ddbe3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.
> > > +++ yaml
> > > @@ -0,0 +1,123 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> > > +
> > > +maintainers:
> > > +  - John Madieu <john.madieu.xa@bp.renesas.com>
> > > +
> > > +description:
> > > +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor
> > > +that
> > > +  monitors the chip temperature on the Renesas RZ/G3E SoC. The TSU
> > > +provides
> > > +  real-time temperature measurements for thermal management.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: renesas,r9a09g047-tsu
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    description: |
> > > +      Interrupt specifiers for the TSU:
> > > +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> > > +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: adi
> > > +      - const: adcmpi
> > > +
> > > +  "#thermal-sensor-cells":
> > > +    const: 0
> > > +
> > > +  renesas,tsu-calibration-sys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: |
> > > +      Phandle to the system controller (sys) that contains the TSU
> > > +      calibration values used for temperature calculations.
> > > +
> > > +  renesas,tsu-operating-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1]
> > > +    description: |
> > > +      TSU operating mode:
> > > +      0: Mode 0 - Conversion started by software
> > > +      1: Mode 1 - Conversion started by ELC trigger
> >=20
> > Can you make this "software" and "elc" or something please, unless peop=
le
> > will genuinely find "0" and 1" to be more informative.
> > And why doesn't the property have a default?
>=20
> Sorry for miss-specifying.
> ELC is an external event trigger. May be should I specify it like that ?

If "elc trigger" is meaningful to people using hte device (IOW, it
matches datasheet wording) then that's fine I think.

> To make sure I got your point, do you mean specifying a default value in
> bindings ?

The property doesn't actually need to be required, it could easily have
a default (say software) and only be set in the case of using the elc
trigger - which brings you to Rob's comment that it can just be a
boolean, setting the property if elc and leaving it out of software.

Rob's other comment was

| Who/what decides the mode? If a user is going to want to change this,=20
| then it should be a runtime control, not a DT property.

which I think needs an answer ;)

--aWY9G/uo86esg184
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sRsQAKCRB4tDGHoIJi
0ioIAP0R4s3zFK5NRjcsBtyJZDB/M7Q2SCqtsT6CE2fAYWOOsgD/UCmd1Aqqudy+
R+Wg5p4BqNSch5uuEQ1JlX9CAR0TwgM=
=rZ5t
-----END PGP SIGNATURE-----

--aWY9G/uo86esg184--

