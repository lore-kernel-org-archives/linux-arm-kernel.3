Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F03C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLnLOSlhtLpb0tEj9yUCdGtla2q99b0iozFagK1gjew=; b=qrIn3wEJBQGgNvo4Gjnf7L/lfY
	emk+2bYnGMqlK5Z8KQZsrV0urZDXrbGIOcphUeThdPWxE7jL9hbsDEgOLAB/AxohinB5tEgAFUB58
	yQzsupC1gGPf++QachXNBhO9ydwA2CFl8K7P8uzen61IyuFAh1XV+uwlIshKn6rWX6ioweBGq1agC
	JXFkSEJmmrUNQdtS60VXWJxvq4YRgfBHk41bI0uJfSGvBUfBKoOu2xW5tDsQ01SINJesHStUeRDlN
	AFVBoIZFrkHq9jZgTqKCP+tWjjSiazUoE838TxppOLbJ9IFKycFxLDNVRbO33eo3b7xihawBcmlmA
	yDIYSFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPh-0000000DV1J-1pkm;
	Fri, 11 Apr 2025 11:19:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Bl7-0000000DPQY-1aH1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 10:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mLnLOSlhtLpb0tEj9yUCdGtla2q99b0iozFagK1gjew=; b=gNnZyBQCTK8mIaajJcAN2z6Ns4
	q9FyyaSq3dNdlqTmF+6+MQ19eagGfczMz+gDTj7Ezyd400pCqq45FcqI+8QQs99fg0hiCMGmuej63
	Rc+eTokYtCwt9wtENx5NiIfs4w1eDiAcMVOhnxTGWBI5pM3uFH9NTQhkqkj7P3ETY2xP5NOapKwJ4
	hsYLKbGJZk9HJZl/8K/5+arqrPFJitlwdG3Uft0vO35eW8FGxmPoaAqG5vgrsOpVR8HLnD9m/4hDz
	kGCDQFL+w+hN65rn3ktNMWh8ZsDOV0dL7d3xpl8miGq6sVply+u6dqfZCD11eCWaog6oodUtXnlFP
	CikdhW3g==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3Bl3-000000090b1-46EZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:37:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D95BB1026A388;
	Fri, 11 Apr 2025 12:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744367822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mLnLOSlhtLpb0tEj9yUCdGtla2q99b0iozFagK1gjew=;
	b=LsUrmkQgXZOdDCNfeN/NeVHoVZ8ajgk/cioXWtuc1GDsAA0Gswyux/NCtO+KjxeztTBUTp
	DRq78JIC4lPqHo49PB4IkJhcNVm4zqiCwKCEC3n4k5hnt6KQc2pW+Elmh1Jkr4q/aSVe6+
	TnSLD2c3pgMb2RfTqr1ZpSIStYFOazbkq8KzMReZKPlZ9jOtmVWIn66I8ryxpS8DYl3or2
	L9JV3M7EO+ATnGihFUMOPA5NOXbeWf+8diAyRn+oV5LTxUXWf8rLdOgp53qYD4pAcv0rrV
	441Fw4+7K4vhbx+9f3HoLroYjtnoWnejBWT6qOKWfGOMU5pp1Z6YU9HVQ2VVEA==
Date: Fri, 11 Apr 2025 12:36:54 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>
Subject: Re: [net-next v4 1/5] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250411123654.04cfff4a@wsk>
In-Reply-To: <20250410205925.GA1041840-robh@kernel.org>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-2-lukma@denx.de>
	<20250410205925.GA1041840-robh@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pHINZLvXGmujDrt1h/8BuJ7";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_113714_262059_BF85E3CF 
X-CRM114-Status: GOOD (  32.39  )
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

--Sig_/pHINZLvXGmujDrt1h/8BuJ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> On Mon, Apr 07, 2025 at 04:51:53PM +0200, Lukasz Majewski wrote:
> > This patch provides description of the MTIP L2 switch available in
> > some NXP's SOCs - e.g. imx287.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Rename the file to match exactly the compatible
> >   (nxp,imx287-mtip-switch)
> >=20
> > Changes for v3:
> > - Remove '-' from const:'nxp,imx287-mtip-switch'
> > - Use '^port@[12]+$' for port patternProperties
> > - Drop status =3D "okay";
> > - Provide proper indentation for 'example' binding (replace 8
> >   spaces with 4 spaces)
> > - Remove smsc,disable-energy-detect; property
> > - Remove interrupt-parent and interrupts properties as not required
> > - Remove #address-cells and #size-cells from required properties
> > check
> > - remove description from reg:
> > - Add $ref: ethernet-switch.yaml#
> >=20
> > Changes for v4:
> > - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove
> > already referenced properties
> > - Rename file to nxp,imx28-mtip-switch.yaml
> > ---
> >  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 126
> > ++++++++++++++++++ 1 file changed, 126 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > new file mode 100644 index 000000000000..1afaf8029725 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > @@ -0,0 +1,126 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > BSD-2-Clause) +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +description:
> > +  The 2-port switch ethernet subsystem provides ethernet packet
> > (L2)
> > +  communication and can be configured as an ethernet switch. It
> > provides the
> > +  reduced media independent interface (RMII), the management data
> > input
> > +  output (MDIO) for physical layer device (PHY) management.
> > +
> > +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> > + =20
>=20
> > +patternProperties:
> > +  "^(ethernet-)?ports$": =20
>=20
> New bindings should only use 'ethernet-ports'.

Ok.

>=20
> > +    type: object
> > +    additionalProperties: true =20
>=20
> But what's this for? I thought you had some constrants for phy-mode
> and phy-handle?
>=20

I've prepared following changes:

--- a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
@@ -17,11 +17,6 @@ description:
=20
 $ref: ethernet-switch.yaml#/$defs/ethernet-ports
=20
-patternProperties:
-  "^(ethernet-)?ports$":
-    type: object
-    additionalProperties: true
-
 properties:
   compatible:
     const: nxp,imx28-mtip-switch
@@ -55,6 +50,26 @@ properties:
=20
   pinctrl-names: true
=20
+  ethernet-ports:
+    type: object
+    additionalProperties: true
+    properties:
+      ethernet-port:
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              - enum: [1, 2]
+            description: MTIP L2 switch port number
+
+        required:
+          - reg
+          - label
+          - phy-mode
+          - phy-handle
+
   mdio:
     type: object
     $ref: mdio.yaml#
@@ -71,7 +86,7 @@ required:
   - mdio
   - ethernet-ports
=20
-additionalProperties: false
+unevaluatedProperties: false
=20
 examples:

To be applied on top of this patch. It takes into account the
"required:" for 'ethernet-port' and also reuses the=20
$ref: ethernet-switch.yaml#/$defs/ethernet-ports

Last, but not least:
make dt_binding_check DT_SCHEMA_FILES=3Dnxp,imx28-mtip-switch.yaml
make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Dnxp,imx28-mtip-switch.yaml
nxp/mxs/imx28-xea.dtb

show no errors.


> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx28-mtip-switch
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  phy-supply:
> > +    description:
> > +      Regulator that powers Ethernet PHYs.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Register accessing clock
> > +      - description: Bus access clock
> > +      - description: Output clock for external device - e.g. PHY
> > source clock
> > +      - description: IEEE1588 timer clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: ahb
> > +      - const: enet_out
> > +      - const: ptp
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Switch interrupt
> > +      - description: ENET0 interrupt
> > +      - description: ENET1 interrupt
> > +
> > +  pinctrl-names: true
> > +
> > +  mdio:
> > +    type: object
> > +    $ref: mdio.yaml#
> > +    unevaluatedProperties: false
> > +    description:
> > +      Specifies the mdio bus in the switch, used as a container
> > for phy nodes. +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - mdio
> > +  - ethernet-ports
> > +
> > +additionalProperties: false =20
>=20
> unevaluatedProperties: false

Ok.

>=20
> > +
> > +examples:
> > +  - |
> > +    #include<dt-bindings/interrupt-controller/irq.h>
> > +    switch@800f0000 {
> > +        compatible =3D "nxp,imx28-mtip-switch";
> > +        reg =3D <0x800f0000 0x20000>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&mac0_pins_a>, <&mac1_pins_a>;
> > +        phy-supply =3D <&reg_fec_3v3>;
> > +        interrupts =3D <100>, <101>, <102>;
> > +        clocks =3D <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> > +        clock-names =3D "ipg", "ahb", "enet_out", "ptp";
> > +
> > +        ethernet-ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            mtip_port1: ethernet-port@1 {
> > +                reg =3D <1>;
> > +                label =3D "lan0";
> > +                local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +                phy-mode =3D "rmii";
> > +                phy-handle =3D <&ethphy0>;
> > +            };
> > +
> > +            mtip_port2: ethernet-port@2 {
> > +                reg =3D <2>;
> > +                label =3D "lan1";
> > +                local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +                phy-mode =3D "rmii";
> > +                phy-handle =3D <&ethphy1>;
> > +            };
> > +        };
> > +
> > +        mdio_sw: mdio {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            reset-gpios =3D <&gpio2 13 0>;
> > +            reset-delay-us =3D <25000>;
> > +            reset-post-delay-us =3D <10000>;
> > +
> > +            ethphy0: ethernet-phy@0 {
> > +                reg =3D <0>;
> > +            };
> > +
> > +            ethphy1: ethernet-phy@1 {
> > +                reg =3D <1>;
> > +            };
> > +        };
> > +    };
> > --=20
> > 2.39.5
> >  =20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/pHINZLvXGmujDrt1h/8BuJ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf48MYACgkQAR8vZIA0
zr3LEwf4oZ8G6avjAzXGZNtwQoJnqXaGrxBTt50eP6lxNSRlA1NWE7Ey+52LI5MD
eD1tWPzQYjrIprD5a2n7GL9ot7s46olO+T4Qzm5wWiBfmUyL+I4TsUCIHgKZb1fd
sCv8dbYQCHkc8I5um7WEVf/ubo6dBoViXhGbOc4JB7Z7Jm0/TbgOOPSeuusx36md
ffp1o2r0Dh3tfqQUBcvovTUHUDiqctNTV5OWbZbFWronzVBOPyK5AktCcZ9NhPNm
rD9wZK/KSL8ZjJEE89DzprcKbvKgRNr3a5JFau64elrGBlDcByjqGWI1EFiNpN+W
6D2ltGdLv7kIjmfwwsP2A430ye3J
=5i4m
-----END PGP SIGNATURE-----

--Sig_/pHINZLvXGmujDrt1h/8BuJ7--

