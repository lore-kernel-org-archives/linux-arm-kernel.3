Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF10D6CFDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RPQmuSxOPQocN28fEo09qLmjHogtnjKF/F4OduQGvU=; b=jswdnSZa8HlXY6qXogIaWRV3fw
	8xpHtQXU5dOIr6O94aKMXbyRAh3nMdMCaXQPqiChp1aj8SkGEEzk4pjku50Du1a8/LwYNkfiPtBQX
	6HQgbxY/LbYnIzv6CIO5gExT8DBxAyhC2UwMuxj4bwrldScXbyLF7bZ6wurpIyHgHS/kPS39js1V9
	4XNYRl9RDJHu8V1QBcCnH3P1RA7YGfk1AtfEi4X3WXnQC9TkZ+DI76Ubs4rh3gHTLPb4ntDuZS5iX
	de0ygC/OYWLpeN0wfqGiyCk0o+SHWo6lZJxOHVc+ardo5ssL5/Roe2QLeaE19vVic3zn+mXCyalmn
	bM1HZRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAaa-00000008I4d-0jcV;
	Fri, 23 Jan 2026 06:24:12 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAaW-00000008I3z-13IK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:24:10 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260123062358epoutp0458c17c7feb48275ef33e0b4079aaf7b5~NSAqLnGBC0287102871epoutp04L
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:23:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260123062358epoutp0458c17c7feb48275ef33e0b4079aaf7b5~NSAqLnGBC0287102871epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769149438;
	bh=0RPQmuSxOPQocN28fEo09qLmjHogtnjKF/F4OduQGvU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GkocXiS2EjGQOYtgzSoUiiDs5S/zrS5PVKFhy44lRP2csHUOXoulDaAsTXExZS2Sg
	 qYvtMUxFhuYTpdVZBkLrY29Na4PxzhCZuHbEIoiK5JV7r0gnKR5/MCIiDHTeFz0Y2l
	 7e6qW6P6SqS6Ba3momQN1zldtcztLt2pni/gzjMM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260123062358epcas5p4a10e82c20a10782f1679e0e364521e58~NSAp0MxBn1166311663epcas5p4Z;
	Fri, 23 Jan 2026 06:23:58 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dy7DY28xQz6B9m6; Fri, 23 Jan
	2026 06:23:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260123062356epcas5p400afeca56023fdac971e4aadcc5b4e17~NSAoUWxu-0467104671epcas5p42;
	Fri, 23 Jan 2026 06:23:56 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260123062353epsmtip28685e67cf6325a2907a69c45fe833912~NSAlVK75a0087800878epsmtip2E;
	Fri, 23 Jan 2026 06:23:53 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: <alim.akhtar@samsung.com>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <rosa.pila@samsung.com>,
	<selvarasu.g@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
	<muhammed.ali@samsung.com>, <faraz.ata@samsung.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dev.tailor@samsung.com>
In-Reply-To: <176910209177.2703219.7993114273484886473.robh@kernel.org>
Subject: RE: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Fri, 23 Jan 2026 11:53:47 +0530
Message-ID: <000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHZrJ6Mjzaw1gIwj373G9ghj88fmQEa27yOAk8cNCe1SaKKMA==
Content-Language: en-in
X-CMS-MailID: 20260123062356epcas5p400afeca56023fdac971e4aadcc5b4e17
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
	<20260122130721.205664-1-pritam.sutar@samsung.com>
	<176910209177.2703219.7993114273484886473.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_222408_969318_56F4AEEA 
X-CRM114-Status: GOOD (  30.42  )
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

Hi Rob,

Thank you for your feedback on the patch series.=20

> -----Original Message-----
> From: Rob Herring <robh=40kernel.org>
> Sent: 22 January 2026 10:46 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: alim.akhtar=40samsung.com; conor+dt=40kernel.org; krzk+dt=40kernel.or=
g;
> linux-arm-kernel=40lists.infradead.org; rosa.pila=40samsung.com;
> selvarasu.g=40samsung.com; linux-samsung-soc=40vger.kernel.org;
> muhammed.ali=40samsung.com; faraz.ata=40samsung.com; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org;
> dev.tailor=40samsung.com
> Subject: Re: =5BPATCH v2 0/3=5D Add and enable USB nodes for ExynosAutov9=
20
> SoC
>=20
>=20
> On Thu, 22 Jan 2026 18:37:18 +0530, Pritam Manohar Sutar wrote:
> > This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
> > controllers and among them, one single USB3.1 DRD combo phy and three
> > USB2.0 only phy controllers. This patchset adds and enables USB and
> > USB-PHY nodes in dts.
> >
> > PMIC is not implemented yet, we rely on USB LDOs being enabled by the
> > bootloader and used dummy regulators for now.
> >
> > To drive vbus for host mode, it needs GPIO pin to enable vbus regulator=
.
> > GPIO expander is present in the dts, we used it to enable the
> > regulator using GPIO.
> >
> > USB ports are configured as OTG, and default mode is configured as
> > peripheral. It will be changed based on requirements.
> >
> > changelog
> > ----------
> > Changes in v2:
> > - As v1 was pushed 3 months back, resending this patchset.
> > - Since dependencies are merged, removed links from coverletter.
> >   link for v1:
> > https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-prit
> > am.sutar=40samsung.com/
> >
> > Pritam Manohar Sutar (3):
> >   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
> >   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
> >   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
> >
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 160
> +++++++++++++++++
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 162
> > ++++++++++++++++++
> >  2 files changed, 322 insertions(+)
> >
> > --
> > 2.34.1
> >
> >
> >
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform maintai=
ner
> whether these warnings are acceptable or not. No need to reply unless the
> platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then make sur=
e dt-
> schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20260121 (exact match)
>  Base: tags/next-20260121 (use --merge-base to override)
>=20
> If this is not the correct base, please add 'base-commit' tag (or use b4 =
which
> does this automatically)
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for
> arch/arm64/boot/dts/exynos/' for 20260122130721.205664-1-
> pritam.sutar=40samsung.com:
>=20
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-
> nop-xceiv): '=23phy-cells' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D91401ba9-
> cedb2354-914190e6-000babff317b-0af64cc1fcd35e1a&q=3D1&e=3De0bf9bed-
> 20f5-431c-9a8f-
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> sb-nop-xceiv.yaml
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-
> nop-xceiv): '=23phy-cells' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Db208eda5-
> ed93d558-b20966ea-000babff317b-f6650041a1e910a7&q=3D1&e=3De0bf9bed-
> 20f5-431c-9a8f-
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> sb-nop-xceiv.yaml
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-
> nop-xceiv): '=23phy-cells' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Dce686cfd-
> 91f35400-ce69e7b2-000babff317b-ccbf1b3c353ecfc0&q=3D1&e=3De0bf9bed-20f5-
> 431c-9a8f-
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> sb-nop-xceiv.yaml
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-
> nop-xceiv): '=23phy-cells' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D633aebf3-
> 3ca1d30e-633b60bc-000babff317b-ef5a169bc853eddb&q=3D1&e=3De0bf9bed-
> 20f5-431c-9a8f-
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> sb-nop-xceiv.yaml

Apologize for any inconvenience caused by the issues you=E2=80=99ve=20ident=
ified.=20=0D=0ABelow,=20Have=20outlined=20the=20changes,=20will=20implement=
=20to=20address=20the=20warnings=20=0D=0Aand=20ensure=20the=20patch=20set=
=20aligns=20with=20the=20required=20standards.=0D=0A=0D=0AProposed=20Change=
s:=0D=0A1.=20Will=20include=20=23phy-cells=20=3D=20<0>;=20in=20the=20USB=20=
PHY=20nodes=20=0D=0A=20=20(usb_phy0,=20usb_phy1,=20usb_phy2,=20and=20usb_ph=
y3)=20=0D=0AThis=20is=20a=20crucial=20addition=20to=20avoid=20compilation=
=20warnings=20and=20ensure=20compatibility.=0D=0A=0D=0AExample:=0D=0Ausb_ph=
y0:=20usb-phy0=20=7B=20=20=20=20=0D=0A=20=20=20=20compatible=20=3D=20=22usb=
-nop-xceiv=22;=20=20=20=20=0D=0A=20=20=20=20=23phy-cells=20=3D=20<0>;=20=20=
=20=20=0D=0A=20=20=20=20vbus-supply=20=3D=20<&usbdrd31_dwc3_vbus>;=20=20=20=
=20=0D=0A=7D;=20=20=20=20=0D=0A=0D=0A2.=20The=20errors=20were=20not=20caugh=
t=20by=20the=20make=20dt_binding_check=20and=20make=20dtbs_check=20=0D=0A=
=20=20commands=20=0D=0A=20=20make=20-j=20ARCH=3Darm64=20dt_binding_check=20=
dtbs_check=20DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/phy/samsun=
g,usb3-drd-phy.yaml=0D=0A=20=20make=20-j=20ARCH=3Darm64=20dt_binding_check=
=20dtbs_check=20DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/usb/sam=
sung,exynos-dwc3.yaml=0D=0A=0D=0A3.=20Once=20the=20above=20changes=20are=20=
verified=20and=20tested,=20I=20will=20incorporate=20them=20into=20the=0D=0A=
=20=20next=20version=20of=20the=20patch=20set=20(v3).=0D=0A=0D=0AQuestions:=
=0D=0A1.=20Are=20the=20Proposed=20Changes=20Correct?=0D=0A=20=20Please=20co=
nfirm=20if=20the=20inclusion=20of=20=23phy-cells=20=3D=20<0>;=20in=20the=20=
USB=20PHY=20nodes=20is=20the=20correct=20=0D=0A=20=20fix=20for=20the=20issu=
e.=20If=20there=20are=20additional=20changes=20required,=20kindly=20let=20m=
e=20know.=0D=0A=0D=0A2.=20Why=20Warnings=20Were=20Not=20Captured=20During=
=20Initial=20Checks?=0D=0A=20=20The=20make=20dt_binding_check=20and=20make=
=20dtbs_check=20commands=20did=20not=20flag=20the=20warnings,=0D=0A=20=20wh=
ich=20suggests=20the=20schema=20or=20bindings=20might=20not=20be=20comprehe=
nsive=20enough.=20Could=20you=20=0D=0A=20=20provide=20insights=20or=20recom=
mendations=20on=20how=20to=20improve=20the=20schema=20to=20catch=20such=20i=
ssues=0D=0A=20=20in=20the=20future?=0D=0A=0D=0A>=20=0D=0A>=20=0D=0A>=20=0D=
=0A>=0D=0A=20=0D=0AThank=20you=20for=20your=20valuable=20input.=20I=E2=80=
=99ll=20proceed=20with=20the=20changes=20and=20provide=20an=20updated=20=0D=
=0Apatch=20set=20once=20the=20fixes=20are=20confirmed.=20Please=20let=20me=
=20know=20if=20there=E2=80=99s=20anything=20else=20I=20need=0D=0Ato=20consi=
der=20or=20address.=0D=0A=0D=0ARegards,=0D=0APritam=0D=0A=0D=0A

