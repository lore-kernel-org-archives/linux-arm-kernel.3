Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46933C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRMlbA7pPv12jHHuru+v6fogzQ7XIEeseEz9D/+56lE=; b=R8G4dSK54/suTrr0VNfQtixyZj
	Svjhv9No/3u5yS2fWbE7DLNqN20c64HvTo5RDSJU25jyi8AbjPNNjV0OimaYShfxp4vnwA/DEofsJ
	nVgJTBDC868hgtxWrihvmv+cfCSMmGnD/XgbbZmgdQ7qw4WhLbdBA2MISLIHc7bPJBPKRi6GOZBE9
	uID0T8MueYayjSHeYPzMwnbkPj+83Ns/+TiJOw4H+jZSBLfRvj3Rw0vzHywj5U95MjIlc6Hd7tS0c
	Q7o3KlN7EyOJJ6o2TlzL+na5OhDOwYDm3OMRKhpILsgM4kJc41bUU/jPAWRV609roVBLGLnr6k4DH
	y74p6Wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhSB-00000008jxT-3ZB4;
	Wed, 18 Jun 2025 01:19:03 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhPo-00000008jPD-20Kx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 01:16:40 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250618011627epoutp0260d1fc639d4fceec6210a8442eff7e8f~J-io6V1oj2210022100epoutp02w
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:16:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250618011627epoutp0260d1fc639d4fceec6210a8442eff7e8f~J-io6V1oj2210022100epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209387;
	bh=wRMlbA7pPv12jHHuru+v6fogzQ7XIEeseEz9D/+56lE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=l+yVhniC9cyeqVRljDADHfge3OKpyASwHOW+U7TBP0uMGdfB1nGwsEw0RqzoqA6Q5
	 nSrtlPyQlIpZO1Io/lCVhlHfXxn14twINn5Lsjg34GcEW0964DVJpPiBBBE2S+xDM0
	 kf15+rMvIL/djwzKJyK7Idqt4v8UPry+HFNRsQTQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250618011626epcas5p2ca60f5bcd17d26af9261e5b0e56a1ee6~J-ino0dRK1703617036epcas5p25;
	Wed, 18 Jun 2025 01:16:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQmk6Hglz3hhTH; Wed, 18 Jun
	2025 01:16:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250617171023epcas5p3e6e775a8c375edeca1ef9dd0ee905a50~J46PaZeUn1047610476epcas5p3u;
	Tue, 17 Jun 2025 17:10:23 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617171020epsmtip23ef4349f3a07b2221f3be0969ba87e87~J46Mk13VN2161021610epsmtip2U;
	Tue, 17 Jun 2025 17:10:19 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Neil Armstrong'" <neil.armstrong@linaro.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
Subject: RE: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB SS combo phy nodes
Date: Tue, 17 Jun 2025 22:40:18 +0530
Message-ID: <000001dbdfaa$b605f640$2211e2c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gGRKuf5ApVTYEcCparjMbDhz82w
Content-Language: en-in
X-CMS-MailID: 20250617171023epcas5p3e6e775a8c375edeca1ef9dd0ee905a50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
	<20250613055613.866909-10-pritam.sutar@samsung.com>
	<9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181637_140429_2F440C27 
X-CRM114-Status: GOOD (  23.19  )
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

Hi Neil,=20

> -----Original Message-----
> From: neil.armstrong=40linaro.org <neil.armstrong=40linaro.org>
> Sent: 13 June 2025 02:42 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; rosa.pila=40samsung.com;
> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 9/9=5D arm64: dts: exynos: ExynosAutov920: add U=
SB
> and USB SS combo phy nodes
>=20
> On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> > Update the USB 3.1 DRD controller and USB31DRD phy nodes to support SS
> > combo phy for this soc.
> >
> > The USB 3.1 DRD controller has the following features:
> > * DWC3 compatible
> > * compliant with both USB device 3.1 and USB device 2.0 standards
> > * compliant with USB host 3.1 and USB host 2.0 standards
> > * supports USB device 3.1 and USB device 2.0 interfaces
> > * supports USB host 3.1 and USB host 2.0 interfaces
> > * full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
> >    2.0 interface
> > * super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
> > * super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
> > * single USB port which can be used for USB 3.1 or USB 2.0
> > * on-chip USB PHY transceiver
> > * supports up to 16 bi-directional endpoints
> > * compliant with xHCI 1.1 specification
> >
> > USB3.1 SSP+(10Gbps) is supported in this commit and SS phy in combo
> > phy only supports PIPE3 interface and it is added in index 0 of SS phy.
> > UTMI+ and PIPE3 PHY interfaces are specified in =22phys=22 property,
> > UTMI+ (index 0 HS phy) and PIPE3 (index 0 SS phy).
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >   .../arm64/boot/dts/exynos/exynosautov920-sadk.dts =7C  4 ++++
> >   arch/arm64/boot/dts/exynos/exynosautov920.dtsi    =7C 15
> +++++++++++++--
> >   2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > index a21386bd9af3..40588f7c9998 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > =40=40 -88,6 +88,10 =40=40 &xtcxo =7B
> >   =7D;
> >
> >   /* usb */
> > +&usbdrd31_ssphy =7B
> > +	status =3D =22okay=22;
> > +=7D;
> > +
> >   &usbdrd31_hsphy =7B
> >   	status =3D =22okay=22;
> >   =7D;
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index 4efc005cae80..5ee7fad346b9 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > =40=40 -1048,6 +1048,17 =40=40 pinctrl_hsi1: pinctrl=4016450000 =7B
> >   			interrupts =3D <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
> >   		=7D;
> >
> > +		usbdrd31_ssphy: phy=4016480000 =7B
> > +			compatible =3D =22samsung,exynosautov920-usb31drd-
> ssphy=22;
> > +			reg =3D <0x16480000 0x0200>;
> > +			clocks =3D <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
> > +				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
> > +			clock-names =3D =22phy=22, =22ref=22;
> > +			=23phy-cells =3D <1>;
> > +			samsung,pmu-syscon =3D <&pmu_system_controller>;
> > +			status =3D =22disabled=22;
> > +		=7D;
> > +
> >   		usbdrd31_hsphy: phy=4016490000 =7B
> >   			compatible =3D =22samsung,exynosautov920-usbdrd-
> hsphy=22;
> >   			reg =3D <0x16490000 0x0200>;
> > =40=40 -1109,8 +1120,8 =40=40 usbdrd31_dwc3: usb=400 =7B
> >   					 <&cmu_hsi1
> CLK_MOUT_HSI1_USBDRD>;
> >   				clock-names =3D =22ref=22, =22susp_clk=22;
> >   				interrupts =3D <GIC_SPI 491
> IRQ_TYPE_LEVEL_HIGH>;
> > -				phys =3D <&usbdrd31_hsphy 0>;
> > -				phy-names =3D =22usb2-phy=22;
> > +				phys =3D <&usbdrd31_hsphy 0>,
> <&usbdrd31_ssphy 0>;
> > +				phy-names =3D =22usb2-phy=22, =22usb3-phy=22;
> >   				snps,has-lpm-erratum;
> >   				snps,dis_u2_susphy_quirk;
> >   				snps,dis_u3_susphy_quirk;
>=20
> I think at least patch 6 & 9 should be squashed.
>=20

Patch 6 and 9 are posted to add support for HS and SS phys in combo phy sep=
arately.
We will squash them in next version of patch-set (v4).=20

> Neil

Thank you.

Regards,
Pritam


