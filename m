Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3025CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 01:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmDPUKjdxkABnjlOOT1kBNy0I7s0S7ikbeAULNkoib4=; b=k3DPMKfbs4qW2VkF/RMq9QNKfn
	1FjI8KeWhUUKZPSSFdAMdl2sOzEJn1QHBT2Pj4RSTWeRsuhBYpdsDEXHWY4BNQBFQrwmDtRcxSlkE
	Q9LYEe2g//wU7pmEWLzbCKMNo0YNER1x0/bm3Tei+SbHzgNGrtnQ+ECgk7r/QOTbVSAX5FkcxAm+A
	QAHWWpX3zadmZd0YyQL3DoaQg7MCEKZDeoSdK/EC53al8VGISqWWCrAeSGsEE4uer4Xk8t/4L7zfO
	qo++K7/eYV99Cw+km5RIvGyzCLKsWyH+xDu7S2VrxwufrU0d0ZR7TEdywvU6XIUjApY0xC6LHTDrv
	I6tsy3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhWW-00000008kKV-2VCT;
	Wed, 18 Jun 2025 01:23:32 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhQg-00000008jf2-0oCU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 01:17:31 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250618011728epoutp02c68e3bab27ac90a1990c6f8c5554131a~J-jhtyqMq2148221482epoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250618011728epoutp02c68e3bab27ac90a1990c6f8c5554131a~J-jhtyqMq2148221482epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209448;
	bh=FmDPUKjdxkABnjlOOT1kBNy0I7s0S7ikbeAULNkoib4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=p28eAWFqfSILy8HrE9lGug8ES+qTudu+cz8x/G2s1NgIJIBRk07mpDR/gfMCF3jt/
	 R3EtmQqWBKbKSuOdB9DJ5AFgDlKPs6gyQWQr6WfwA/agAHzfjd7pQH8jKUdYrvrOBH
	 xeOOVZn00YPzpT5QtoHo8O568BAv0Ikr5MjmKLqM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250618011727epcas5p4d4aa4a5e04fb9ac44fd13789efc87711~J-jhKMtDk3093530935epcas5p4v;
	Wed, 18 Jun 2025 01:17:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.177]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bMQny0bkVz6B9mG; Wed, 18 Jun
	2025 01:17:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250617173634epcas5p3dbbe9a86be00bc8124444dc9a2cea1bc~J5RHWoRox3236532365epcas5p36;
	Tue, 17 Jun 2025 17:36:34 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617173631epsmtip1593e56249b8600e799f1c8e2d4c868c4~J5REgnjn72629126291epsmtip1e;
	Tue, 17 Jun 2025 17:36:31 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-boisterous-mouse-of-current-adfd67@kuoka>
Subject: RE: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Tue, 17 Jun 2025 23:06:30 +0530
Message-ID: <000201dbdfae$5ef17e70$1cd47b50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gLGzMbPAZuXxZEB509h9LDl7H+g
Content-Language: en-in
X-CMS-MailID: 20250617173634epcas5p3dbbe9a86be00bc8124444dc9a2cea1bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055043epcas5p2437abc65042529a2012a6ca80559ac80
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
	<20250613055613.866909-3-pritam.sutar@samsung.com>
	<20250616-boisterous-mouse-of-current-adfd67@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181730_555009_E78CEC02 
X-CRM114-Status: GOOD (  19.88  )
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
> Sent: 16 June 2025 01:43 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 2/9=5D phy: exyons5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On Fri, Jun 13, 2025 at 11:26:06AM GMT, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy that supports both
> > UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> > those only support the UTMI+ (HS) interface.
> >
> > Support only UTMI+ port for this SoC which is very similar to what the
> > existing Exynos850 supports.
> >
> > The combo phy support is out of scope of this commit.
> >
> > Add required change in phy driver to support HS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c =7C 25
> > ++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index 917a76d584f0..15965b4c6f78 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > =40=40 -2025,6 +2025,28 =40=40 static const struct exynos5_usbdrd_phy_d=
rvdata
> exynos850_usbdrd_phy =3D =7B
> >  	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> >  =7D;
> >
> > +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D =7B
> > +	.init		=3D exynos850_usbdrd_phy_init,
> > +	.exit		=3D exynos850_usbdrd_phy_exit,
> > +	.owner		=3D THIS_MODULE,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_config
> phy_cfg_exynosautov920=5B=5D =3D =7B
> > +	=7B
> > +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> > +		.phy_init	=3D exynos850_usbdrd_utmi_init,
> > +	=7D,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_drvdata
> exynosautov920_usbdrd_phy =3D =7B
> > +	.phy_cfg		=3D phy_cfg_exynosautov920,
> > +	.phy_ops		=3D &exynosautov920_usbdrd_phy_ops,
> > +	.clk_names		=3D exynos5_clk_names,
> > +	.n_clks			=3D ARRAY_SIZE(exynos5_clk_names),
> > +	.core_clk_names		=3D exynos5_core_clk_names,
> > +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
>=20
> Where are the supplies? Where is power on/off seqequence in the phy ops?
>=20
> No pmu control (missing offset)?
>=20

LDO regulators are always on.  USB don=E2=80=99t=20control=20them=20for=20E=
xynosAutov920.=0D=0APhy=20isol=20is=20shared=20across=20the=20USBs.=20And=
=20it=20is=20handled=20in=20bootloader=20(if=20one=20causes=20phy=20exit,=
=20it=20isolates=20all=20the=20phys).=20=0D=0A=0D=0AHence,=20supplies=20and=
=20power=20on/off=20are=20removed=20from=20phy=20ops.=0D=0A=0D=0A>=20You=20=
have=20entire=20commit=20msg=20to=20explain=20unusual=20things.=0D=0A>=20=
=0D=0A=0D=0AWill=20update=20the=20same=20with=20commit=20message=20in=20nex=
t=20version=20of=20the=20patch-set=20(v4).=20=0D=0A=0D=0A>=20Best=20regards=
,=0D=0A>=20Krzysztof=0D=0A=0D=0A=0D=0AThank=20you,=0D=0A=0D=0ARegards,=0D=
=0APritam=0D=0A=0D=0A

