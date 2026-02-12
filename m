Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68771EB4909
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djFzeD8LgE5itnBYvoAAw4RnPf8xoFG4d8cZIp1ltuA=; b=erQJx9vOlM1FTjyW/1EThfYofq
	alR/MWzAhAneT/Ez0s04JLKlFlBz7H6U5mR2+chuL7j6tMshOY2xGpH+Vl85CFAjoYcl7rViz74M4
	DhlG+Lzik0waRWdJwm2/IzeDwz/WYXaUjBvHlyQDbsj0UlELlbf15zB9f0tynHVZX2IGVdZzAz9zR
	7n5JImQnYrdwQkXyzzTetJOqNhsLFmXh9KbYBae1yzAkrGERZm8sqNp1XraSaZ4DeQY/GHNjzog/N
	xNwNptBFQgLhWzwJEV2tsUjl7K5mFxxUwqFrpCpITe0ei0M0BN+NpObJqt7Urcr3iBmdRdIL/A7yi
	1oER/AcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV0c-000000020X7-3mjq;
	Thu, 12 Feb 2026 11:37:22 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV0W-000000020Vb-1ZWt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:37:21 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260212113708epoutp01a7df4848cb1503ce7cfdcee79ede795f~TfLy6PrpR2834828348epoutp01o
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260212113708epoutp01a7df4848cb1503ce7cfdcee79ede795f~TfLy6PrpR2834828348epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896228;
	bh=djFzeD8LgE5itnBYvoAAw4RnPf8xoFG4d8cZIp1ltuA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EQO5KkqyDTG0iDVC7UzCYPH7wZR1ogKzG1don1kPFerRDc3rDPJ5PugF1XVz44Jxz
	 i+UiAhGhUX7BGKMQNz8E5Ck2zarcXjGz38vmTXaW5BHSE+J8FpHmkEBV4suXT9Uzlg
	 98UQye1NIK+t4nC1Vne/2ar5PlHz2bBja/F069AY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260212113708epcas5p2a4182422726a0cdd595ef6730815be6a~TfLyoyOP-0161601616epcas5p2y;
	Thu, 12 Feb 2026 11:37:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fBYDg1rCpz6B9m8; Thu, 12 Feb
	2026 11:37:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260212113706epcas5p384de9f5dc94f1019c072e2f712567e72~TfLxV9sIV0390603906epcas5p32;
	Thu, 12 Feb 2026 11:37:06 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212113704epsmtip18dbc65302f659bcb336dc1852594d539~TfLvi2Kby1286912869epsmtip1h;
	Thu, 12 Feb 2026 11:37:04 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>
Subject: RE: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add
 regulators for the USB
Date: Thu, 12 Feb 2026 17:07:02 +0530
Message-ID: <000001dc9c13$ea305520$be90ff60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwI+5auhAd1pMcUC7yIEuLbKEyLw
Content-Language: en-us
X-CMS-MailID: 20260212113706epcas5p384de9f5dc94f1019c072e2f712567e72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>
	<20260122130721.205664-3-pritam.sutar@samsung.com>
	<352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_033717_099073_B039B730 
X-CRM114-Status: GOOD (  25.39  )
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
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, January 22, 2026 7:04 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D arm64: dts: exynos: ExynosAutov920: Add
> regulators for the USB
>=20
> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> > Add dummy regulator for USB and PHY supplies.
> >
> > Add vbus regulator that is enabled by GPIO pin.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 139
> ++++++++++++++++++
> >  1 file changed, 139 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > index a397f068ed53..f90f7704597c 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > =40=40 -52,6 +52,76 =40=40 memory=4080000000 =7B
> >  		      <0x8 0x80000000 0x1 0xfba00000>,
> >  		      <0xa 0x00000000 0x2 0x00000000>;
> >  	=7D;
> > +
> > +	/* TODO: Remove this once PMIC is implemented  */
> > +	dummy_regulator: regulator-0 =7B
> > +		 compatible =3D =22regulator-fixed=22;
> > +		 regulator-name =3D =22dummy_regulator=22;
> > +	=7D;
> > +
> > +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
>=20
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-=5B0-9=5Dv=5B0-9=5D'
>=20
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/
> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>=20
> None of the regulators are called like you wrote. Really NONE.
>=20

Thank you for the references. Will bring changes for regulator's name=20
and labels as=20
		=09
-       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
+       reg_usbdrd31_dwc3_vbus: regulator-1 =7B

> Also, carefully follow DTS coding style.
>=20

Sorry for that. Checking the code and will update in next=20
patchset version (v3).

> > +	       compatible =3D =22regulator-fixed=22;
> > +	       regulator-name =3D =22usbdrd31_dwc3-vbus=22;
> > +	       regulator-min-microvolt =3D <5000000>;
> > +	       regulator-max-microvolt =3D <5000000>;
> > +	       enable-active-high;
> > +	       regulator-always-on;
> > +	       gpio =3D <&gpp2 0 GPIO_ACTIVE_HIGH>;
> > +	=7D;
> > +
> > +	/* Use gpio for enabling vbus regulator */
> > +	usb_phy0: usb-phy0 =7B
>=20
> usb-phy-0
>=20
> > +		compatible =3D =22usb-nop-xceiv=22;
> > +		vbus-supply =3D <&usbdrd31_dwc3_vbus>;
>=20
> That's pretty incomplete. Why do you need such node - just to toggle
> regulator?
>=20

There is no external controller to detect or switch the USB modes=20
automatically rather it is switched using userspace control=20
(sysfs attributes) for this SoC.  GPIO pins are required to enable=20
vbus regulators. Existing phy-generic and fixed regulator are used to=20
avoid making any USB driver changes for the same purpose and it is=20
referenced from below -
			=09
https://lore.kernel.org/r/20230825215445.28309-3-semen.protsenko=40linaro.o=
rg
a12af1c20751340ab6e449a5ef78b37d31123aca: ARM64: dts: marvell: armada-3720-=
db: Add phy for USB3
	=09
> > +	=7D;
>=20
> ...
>=20
> > +&usbdrd20_phy2 =7B
> > +	dvdd-supply =3D <&dummy_regulator>;
> > +	vdd18-supply =3D <&dummy_regulator>;
> > +	vdd33-supply =3D <&dummy_regulator>;
> > +=7D;
> > +
> > +&usbdrd20_dwc3_2 =7B
> > +	maximum-speed =3D =22high-speed=22;
> > +	usb-phy =3D <&usb_phy3>;
> > +=7D;
> > +
> > +&usbdrd20_2 =7B
> > +	vdd10-supply =3D <&dummy_regulator>;
> > +	vdd33-supply =3D <&dummy_regulator>;
> > +=7D;
>=20
> That's a bit too much of dummies. This is heavily incomplete. You need to
> bring back the PMIC first.
>=20

Presently, relying on USB LDOs being enabled by the bootloader in this
automotive SoC. However, we understand the concern and it is added in case=
=20
if anyone wants to use implemented PMIC in future. For now, would like=20
to proceed with the dummy regulators to enable the required USB features.=
=20
Dummy regulators are clearly marked so that they will be replaced once=20
the PMIC driver is fully up.

>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam



