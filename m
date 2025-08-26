Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E6CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmUdeog4n43JlLPwLzabcivOP3kzq6u9GqxXjjFJfy4=; b=PBC+lpaOdxZOyX+f39B4XyVf/W
	Hlbo+gNDREiOwIMZw2dwU4sMAtw3c5f3vHkDo26pCtPFzVph2dQFxPRsRzipISGG7lsZTZlFkxEuD
	9+aMBCNuui5P8VxsF78QfOeIird/BLyV5wdoEuymW65vyfyjtkkBC268E+ZwEZRqMK4HJAwVi/pgj
	ivFu5No5XUiKnyTvW94Dnqq+Arkc/GQIZC+UHfojDFqJpS25NlFMchwluUb7mQaOkwRgNsKctsHV2
	2/3N0wef3jNfqJVHsoHtrx35+03ry/J6FernqwZEWa/b7r6vqEZCRuSgJfYDNLUl5jnDvOcIs2a0Q
	MvLBdE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoj2-0000000AxRW-3SpN;
	Tue, 26 Aug 2025 08:08:17 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnJJ-0000000Aiwz-3oML
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 06:37:40 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250826063729epoutp03c5e301f1030198843603b54746458e5f~fPbo4G4ht0309403094epoutp03H
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:37:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250826063729epoutp03c5e301f1030198843603b54746458e5f~fPbo4G4ht0309403094epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756190249;
	bh=WmUdeog4n43JlLPwLzabcivOP3kzq6u9GqxXjjFJfy4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NwpRV8dpQsXrqhS60KikOY7MaGduMakQQ8G758Cf91IqQBwawro5WSiQV3XUXOZf6
	 GqgMDm/pStaDHR9tmWMjcNHJFiV4euJAk6f0xaeV6JIfPTxnRHh1bzOROBGeV8LGIG
	 Vg27PkGrpBYUCMJ9UhXcHhzbXQdtc0BTMdLfj3Ms=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250826063728epcas5p35aa5aa8be589c61f897a378fe0a9d6f7~fPboM9AQb0070300703epcas5p3T;
	Tue, 26 Aug 2025 06:37:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9ydM5YS8z2SSKf; Tue, 26 Aug
	2025 06:37:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826063727epcas5p27b42d9103a77296440ed5f47a9dc9b6c~fPbmaKZFJ0989209892epcas5p2_;
	Tue, 26 Aug 2025 06:37:27 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250826063723epsmtip2624718a1eacb328a03895f36f45a703d~fPbjWQ0-82085020850epsmtip2R;
	Tue, 26 Aug 2025 06:37:23 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <johan@kernel.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250824-rough-fresh-orangutan-eecb2f@kuoka>
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Tue, 26 Aug 2025 12:07:22 +0530
Message-ID: <007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+7Tit6wg
Content-Language: en-in
X-CMS-MailID: 20250826063727epcas5p27b42d9103a77296440ed5f47a9dc9b6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
	<20250822093845.1179395-6-pritam.sutar@samsung.com>
	<20250824-rough-fresh-orangutan-eecb2f@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_233738_735745_7FF8016A 
X-CRM114-Status: GOOD (  24.43  )
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

Hi Krzysztof,=20

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 24 August 2025 02:26 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> johan=40kernel.org; m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo ssphy
>=20
> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
> > This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> > compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> > =22phy=22 and =22ref=22. The required supplies for USB3.1 are named as
> > vdd075_usb30(0.75v), vdd18_usb30(1.8v).
>=20
> Please do not describe the schema, but hardware. This sentence does not h=
elp
> me in my question further.

This is a combo phy having Synopsys usb20 and usb30 phys (these 2 phys are =
totally different).=20
One PHY only supports usb2.0 and data rates whereas another one does usb3.1=
 ssp+ and usb3.1 ssp
=09
This patch only explains about usb30 (since these are two different phys) p=
hy and omitted inclusion of usb20 reference (added separate patch for this =
patch no 3).=20
=09
Hope this is clear.

>=20
> >
> > Add schemas for combo ssphy found on this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C 23 +++++++++++++++++=
++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > index f0cfca5736b8..96e5bbb2e42c 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > =40=40 -34,6 +34,7 =40=40 properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usb31drd-combo-ssphy
> >        - samsung,exynosautov920-usbdrd-combo-hsphy
> >        - samsung,exynosautov920-usbdrd-phy
> >
> > =40=40 -118,6 +119,12 =40=40 properties:
> >    vdd18-usb20-supply:
> >      description: 1.8V power supply for the USB 2.0 phy.
> >
> > +  dvdd075-usb30-supply:
> > +    description: 0.75V power supply for the USB 3.0 phy.
> > +
> > +  vdd18-usb30-supply:
> > +    description: 1.8V power supply for the USB 3.0 phy.
> > +
> >  required:
> >    - compatible
> >    - clocks
> > =40=40 -227,6 +234,7 =40=40 allOf:
> >                - samsung,exynos7870-usbdrd-phy
> >                - samsung,exynos850-usbdrd-phy
> >                - samsung,exynos990-usbdrd-phy
> > +              - samsung,exynosautov920-usb31drd-combo-ssphy
> >                - samsung,exynosautov920-usbdrd-combo-hsphy
> >                - samsung,exynosautov920-usbdrd-phy
> >      then:
> > =40=40 -262,6 +270,21 =40=40 allOf:
> >        properties:
> >          dvdd075-usb20-supply: false
> >          vdd18-usb20-supply: false
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,exynosautov920-usb31drd-combo-ssphy
> > +    then:
> > +      required:
> > +        - dvdd075-usb30-supply
> > +        - vdd18-usb30-supply
>=20
> Why are you adding usb20 and usb30 suffixes to the supplies? These are
> separate devices, so they do not have both variants at the same time.

This is a combo phy consisting of usb2 and usb3 phys combined.=20
To drive these separate phys, added suffixes for these supplies respectivel=
y.

Moreover, gs101 is also using similar convention for its usb20 and dp suppl=
ies.=20
Added suffix for usb2 and usb3 as per our last communication https://lore.k=
ernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef=40kernel.org/

>=20
> From this device point of view, the supply is called dvdd075 or vdd18.
> If you open device datasheet (not SoC datasheet), that's how it will be c=
alled,
> most likely.

Yes, Agree. In device datasheet, suffixes are not mentioned, but in our boa=
rd schematic it is mentioned.=20
Let me know your suggestion about adding suffixes?

>=20
> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam


