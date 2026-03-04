Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CD4EDEC1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOSxfB+UsOuozAKdJYcd03wV8YPEdksJx4QCQmr+or8=; b=mUz1Afue4ShrXF4q8WDnvTvF5I
	Ztu3Z8wdB4OjqeoqF20JRJdBTesOapeaHVucVV6dkAik8g7/v1HpvYgA9WH63oQ6jcKMVZ7ny/jPd
	f8ymUbzoU9Rxh4hH0OUHzCEttJzCeXWKMw/gBqGpuxo8vPi9rp3gBLESVWFcMnet7jrBQeKFEhZiE
	srlRXbKvtKHpfXYq1/0Dar+FcavHN+OwdfZs9zc/1lMQkfLjuyLykQRAd9XVkIy08yuBHemv+P2r/
	LjScnhFHB7M70M4NE3ttlsmqtKMrG/gE6tm/e6BxFGC5GToNZ5JgYkYdnMo+VCfoUMQUdv7/eTyqQ
	e0WiXvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgwX-0000000Gdsl-0a4I;
	Wed, 04 Mar 2026 07:46:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgwT-0000000Gdrz-2iIS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:46:51 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260304074642epoutp021466cfe98c615a78fb3b67cf11c8e1e9~Zk8TiqCvR2148921489epoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 07:46:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260304074642epoutp021466cfe98c615a78fb3b67cf11c8e1e9~Zk8TiqCvR2148921489epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772610402;
	bh=kOSxfB+UsOuozAKdJYcd03wV8YPEdksJx4QCQmr+or8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=pXBvI9b4K3VDKV1w2jS/GCWc6tbiKJBYMJ5bufAoYj6dWJ4F6WxxFZr4Go8uCpyg4
	 2iuIFnprpBNiZRU/adQqSSVFCSi33gcfrQo4V+Kl0Di/ZllKUREBi1e6Tg8sHd1H43
	 AA8uCwt+YpxmfH6rJ67XgHD/4CBHro7SrHNdnPfg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260304074640epcas5p36b26a45cf9acf580c7c717f5998248ed~Zk8SFl5eK0732507325epcas5p3R;
	Wed,  4 Mar 2026 07:46:40 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fQl9W4R4Sz6B9m7; Wed,  4 Mar
	2026 07:46:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260304074638epcas5p23e2fddcfdad2ac7eaff71907d902f706~Zk8QW3l0b0808608086epcas5p29;
	Wed,  4 Mar 2026 07:46:38 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260304074636epsmtip2d413503c49f5f56dc235c3bf9bc61751~Zk8N9uXGh0539805398epsmtip2V;
	Wed,  4 Mar 2026 07:46:36 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <a7c5c5df-28d9-4b4e-87f0-572b7f637d26@kernel.org>
Subject: RE: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add
 regulators for the USB
Date: Wed, 4 Mar 2026 13:16:34 +0530
Message-ID: <000001dcabab$089a75d0$19cf6170$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwI+5auhAd1pMcUC7yIEuAId+/jbAjLLeawBtyOf6wEmYkR7tq/MoMA=
Content-Language: en-us
X-CMS-MailID: 20260304074638epcas5p23e2fddcfdad2ac7eaff71907d902f706
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
	<000001dc9c13$ea305520$be90ff60$@samsung.com>
	<2edff611-76bb-45aa-922e-f96581dd0525@kernel.org>
	<019001dca0b8$f709e640$e51db2c0$@samsung.com>
	<a7c5c5df-28d9-4b4e-87f0-572b7f637d26@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_234650_345390_2E55AEF8 
X-CRM114-Status: GOOD (  28.18  )
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
> Sent: Thursday, February 19, 2026 1:24 AM
> To: pritam.sutar=40samsung.com; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D arm64: dts: exynos: ExynosAutov920: Add
> regulators for the USB
>=20
> On 18/02/2026 10:28, pritam.sutar=40samsung.com wrote:
> >>>>> +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
> >>>>
> >>>> Please use name for all fixed regulators which matches current
> >>>> format
> >>>> recommendation: 'regulator-=5B0-9=5Dv=5B0-9=5D'
> >>>>
> >>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.
> >>>> gi
> >>>> t/tree/
> >>>> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> >>>>
> >>>> None of the regulators are called like you wrote. Really NONE.
> >>>>
> >>>
> >>> Thank you for the references. Will bring changes for regulator's
> >>> name and labels as
> >>>
> >>> -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
> >>> +       reg_usbdrd31_dwc3_vbus: regulator-1 =7B
> >>
> >> Did you read the binding? That's not what I asked.
> >>
> >
> > Yes.
> > Sorry for misinterpreting above comment. Is it expected as below?
> >
> > This is based on our understanding by referring binding and other vendo=
r
> dts.
> >
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > =40=40 -59,7 +59,7 =40=40 dummy_regulator: regulator-0 =7B
> >                  regulator-name =3D =22dummy_regulator=22;
> >         =7D;
> >
> > -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
> > +       reg_usb_vbus0: regulator-5v0-vbus0 =7B
>=20
> Yes, that's better.

Thank you for the confirmation.

>=20
> Only under the assumption these are actually dedicated single-enable-pin
> regulators, not pins going to the PMIC.
>=20

Yes. this is dedicated single-enable-pin.

> >                compatible =3D =22regulator-fixed=22;
> >                regulator-name =3D =22usbdrd31_dwc3-vbus=22;
> >                regulator-min-microvolt =3D <5000000>; =40=40 -75,7 +75,=
7 =40=40
> > usb_phy0: usb-phy0 =7B
> >                 vbus-supply =3D <&usbdrd31_dwc3_vbus>;
> >         =7D;
> >
>=20
> ...
>=20
> >>>>
> >>>> That's a bit too much of dummies. This is heavily incomplete. You
> >>>> need to bring back the PMIC first.
> >>>>
> >>>
> >>> Presently, relying on USB LDOs being enabled by the bootloader in
> >>> this automotive SoC. However, we understand the concern and it is
> >>> added in case if anyone wants to use implemented PMIC in future. For
> >>> now, would like to proceed with the dummy regulators to enable the
> >>> required USB
> >> features.
> >>
> >> And I don't see the point of these dummies. Solves nothing.
> >>
> >
> > Are you expecting details as mentioned in above section in commit
> message?
> > However, we have mentioned these details in cover letter.
>=20
> No, I am expecting proper PMIC to be represented here. One dummy
> regulator during the fast development phase is okay. Dummy added by
> community contributors without resources and schematics would also fly.
>=20
> But Samsung, with all the resources, schematics doing development since
> 2023 and still adding 20 dummies to every device? Nope, no, sorry.
>=20
> Please start doing this properly. Look how entire new SoC was upstreamed
> by Linaro:
> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-
> db9d0507ffd3=40linaro.org/
>=20
> Or something newer by Qualcomm:
> https://lore.kernel.org/linux-arm-msm/?q=3Ds%3Aglymur
>=20

Appreciated for the references.

As you might know, the regulator control and power=E2=80=91management=20arc=
hitecture=20=0D=0Ahas=20changed=20in=20recent=20Exynos=E2=80=AFSoCs.=20It=
=20is=20now=20controlled=20by=20the=20ACPM/APM=20core,=20and=20=0D=0Athe=20=
PMIC=20is=20interfaced=20over=20SPMI=20(instead=20of=20the=20legacy=20I2C=
=20interface).=20I=20am=20checking=20=0D=0Ainternally=20how=20to=20implemen=
t=20this,=20and=20it=20may=20take=20a=20bit=20longer=20to=20have=20the=20fu=
ll=20recipe=20=0D=0Aready=20to=20add=20an=20actual=20regulator.=0D=0A=0D=0A=
USB=20is=20one=20of=20the=20critical=20IP=20blocks=20that=20needs=20be=20en=
abled=20to=20allow=20the=20rest=20of=20the=20=0D=0Ateam=E2=80=99s=20workflo=
w=20over=20USB=20(e.g.,=20enabling=20automation=20via=20USB=20for=20testing=
,=20etc.).=0D=0A=0D=0AIf=20these=20changes=20can=20be=20accommodated,=20it=
=20would=20be=20great.=20In=20the=20meantime,=20=0D=0AI=20will=20continue=
=20working=20internally=20to=20see=20how=20we=20can=20push=20the=20missing=
=20pieces=20upstream.=0D=0A=0D=0A>=20=0D=0A>=20Best=20regards,=0D=0A>=20Krz=
ysztof=0D=0A=0D=0AThank=20you.=0D=0A=0D=0ARegards,=0D=0APritam=0D=0A=0D=0A

