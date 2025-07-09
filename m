Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C01C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU5CNr0QBgtWFGV78GzIhAyOCjgZlILuvDXa/fOPmvg=; b=DAgZR0DWf41m27/PeLPbqMRI5s
	VAkdDTMMx9S/bd/XuRLg94cjLh/Bc2oE6x26sf90Y4zfxW4xSjB3Y1QcTT9xt59YobP1hO+x1litP
	NH7gjPWlwTuJt/3ZEJD7jrBLrx3O9/otRo/7pXSTeMv/VvXCwxkgpteobmO3V7pmeN1MHHDyZbvck
	jlzzyJ5KIwkDjQ0J38wndCmXDMsvHwGYyvaqOT41UNya32v6Igy3NI3vdfG58iZlUrek0nQ8qwb+N
	sVCnOveikcnP3d8T8fx+cNXWCPVtBQmTZC0OWvgQGhQvDh9RsSU9JcF8L+DAMBKPhKdpx+97gDzSE
	IhQ85pQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZndP-0000000BM47-092O;
	Thu, 10 Jul 2025 09:32:07 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZm6h-0000000B51x-32co
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:54:17 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250710075408epoutp02968a613ddf968c2287a69be3e5d46a81~Q1KJfOPej1532915329epoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:54:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250710075408epoutp02968a613ddf968c2287a69be3e5d46a81~Q1KJfOPej1532915329epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752134048;
	bh=sU5CNr0QBgtWFGV78GzIhAyOCjgZlILuvDXa/fOPmvg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IHwa/HQoR12RfCWGPXCs3wFVz43sqQkIr+e/qvXwWsa+Q4bX5P8kRtF6Ja2Vu2yCW
	 PDhGQNZH50EEYSezVZQiTwsy9BcIynnlvExcwQOpiez9c5AOiwc1LTNyStm94nOC3m
	 Ris+aESToNFDVNSyWbol2rG9rXOIJh9na+tY/UHQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250710075408epcas5p3e7eb81652514ab73f69e247e00d1f9e0~Q1KIzbU7H2522625226epcas5p3O;
	Thu, 10 Jul 2025 07:54:08 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bd6YT0z7nz3hhTC; Thu, 10 Jul
	2025 07:54:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250709084656epcas5p38f9d9b674f152c0320e9d39afe120cb5~QiO82hp8o0301603016epcas5p3M;
	Wed,  9 Jul 2025 08:46:56 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250709084652epsmtip22e1079a1c27c4cb195263f8c31e4354e~QiO54VHas2181121811epsmtip2U;
	Wed,  9 Jul 2025 08:46:52 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250706-fresh-meaty-cougar-5af170@krzk-bin>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 9 Jul 2025 14:16:51 +0530
Message-ID: <07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAq7Myc6PA
Content-Language: en-in
X-CMS-MailID: 20250709084656epcas5p38f9d9b674f152c0320e9d39afe120cb5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
	<20250701120706.2219355-2-pritam.sutar@samsung.com>
	<20250706-fresh-meaty-cougar-5af170@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_005416_093000_F74D62D5 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: 06 July 2025 03:11 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On Tue, Jul 01, 2025 at 05:37:01PM +0530, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible string for USB HS phy found in this SoC.
> > The SoC requires two clocks, named =22phy=22 and =22ref=22 (same as clo=
cks
> > required by Exynos850).
> >
> > It also requires various power supplies (regulators) for the internal
> > circuitry to work. The required voltages are:
> > * avdd075_usb - 0.75v
> > * avdd18_usb20 - 1.8v
> > * avdd33_usb20 - 3.3v
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>=20
> No, really. Look:
>=20
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C 37 +++++++++++++++++=
++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > index e906403208c0..2e29ff749bba 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > =40=40 -34,6 +34,7 =40=40 properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usbdrd-phy
> >
> >    clocks:
> >      minItems: 1
> > =40=40 -110,6 +111,15 =40=40 properties:
> >    vddh-usbdp-supply:
> >      description: VDDh power supply for the USB DP phy.
> >
> > +  avdd075_usb-supply:
> > +    description: 0.75V power supply for USB phy
> > +
> > +  avdd18_usb20-supply:
> > +    description: 1.8V power supply for USB phy
> > +
> > +  avdd33_usb20-supply:
> > +    description: 3.3V power supply for USB phy
> > +
>=20
> None of these were here. Follow DTS coding style... but why are you addin=
g
> completely new supplies?

Digital supplies were here. Need Analog supplies for exynosautov920, hence =
added new Analog supplies; 'a'vdd075_usb, 'a'vdd18_usb20, 'a'vdd33_usb20

Will add =22full stops=22 for DTS coding style in description.

>=20
>=20
> >  required:
> >    - compatible
> >    - clocks
> > =40=40 -235,6 +245,33 =40=40 allOf:
> >
> >          reg-names:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,exynosautov920-usbdrd-phy
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 2
> > +
> > +        clock-names:
> > +          items:
> > +            - const: phy
> > +            - const: ref
> > +
> > +        reg:
> > +          maxItems: 1
> > +
> > +        reg-names:
> > +          maxItems: 1
> > +
> > +      required:
> > +        - avdd075_usb-supply
> > +        - avdd18_usb20-supply
> > +        - avdd33_usb20-supply
>=20
> Neither was this entire diff hunk here.
>=20
> This was part of other block for a reason.

Added regulators in driver. This block is added for regulators (other block=
 does not have =22required=22 field for power supplies)
if excluded this block, =20
=22make ARCH=3Darm64 dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/=
bindings/phy/samsung,usb3-drd-phy.yaml=22 will fail as mentioned below=20
	=09
/home/pritam.sutar/workspace/auto/kitt2/projects/upstream/src/kernel/github=
/linux-next/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: phy=4016480=
000: Unevaluated properties are not allowed ('avdd075_usb-supply', 'avdd18_=
usb20-supply', 'avdd33_usb20-supply' were unexpected)
	from schema =24id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.=
yaml=23
/home/pritam.sutar/workspace/auto/kitt2/projects/upstream/src/kernel/github=
/linux-next/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: phy=4016490=
000: Unevaluated properties are not allowed ('avdd075_usb-supply', 'avdd18_=
usb20-supply', 'avdd33_usb20-supply' were unexpected)
		from schema =24id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy=
.yaml=23
/home/pritam.sutar/workspace/auto/kitt2/projects/upstream/src/kernel/github=
/linux-next/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: phy=4016500=
000: Unevaluated properties are not allowed ('avdd075_usb-supply', 'avdd18_=
usb20-supply', 'avdd33_usb20-supply' were unexpected)
		from schema =24id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy=
.yaml=23
/home/pritam.sutar/workspace/auto/kitt2/projects/upstream/src/kernel/github=
/linux-next/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: phy=4016510=
000: Unevaluated properties are not allowed ('avdd075_usb-supply', 'avdd18_=
usb20-supply', 'avdd33_usb20-supply' were unexpected)
		from schema =24id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy=
.yaml=23
/home/pritam.sutar/workspace/auto/kitt2/projects/upstream/src/kernel/github=
/linux-next/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: phy=4016520=
000: Unevaluated properties are not allowed ('avdd075_usb-supply', 'avdd18_=
usb20-supply', 'avdd33_usb20-supply' were unexpected)
		from schema =24id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy=
.yaml=23

Note: These patches are being validated by enabling DTS (However, DTS patch=
es are planned in next phase).

If you have any idea to re-use existing block by differentiating required p=
ower supplies, please suggest.

>=20
> NAK
>=20
> Best regards,
> Krzysztof



