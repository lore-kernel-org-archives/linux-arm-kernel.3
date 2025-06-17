Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C3C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 01:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtB2nyAmYkJNev8xHYq9d18z8IHo9fhTQMx4FXJI91Q=; b=L/Bn0+IBVwTxE/yBKy/KwErO2D
	WRxlbBIsmp24nRZ71EPVGbkhFlUXmXLklGXKXb9scgOgmEx8oNdPEYr7UhJs4FgoJW05kGVAEfKsn
	674dqLRomGZEsqndc0bKDSZQm9RfRVz5NcKvgAEvuagG/oSt2KmVIDndwTDzVfuWQaKaF9eAFEcI5
	PypWYruz06+F2d6RTCaqo+fIcNiDzuEoyAsnCqDtxKu+3YILcq8CvMQCkVmLiNiGkaWtNnp+3X46z
	rREXLh8pdHPfWLN2S0Me7IrBzsvjezn6Q/VDt8qb1JLrsV/Pdec6MwXtxaDel4YwU7KngtmbyrQai
	ArqZ0TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhfE-00000008kv9-1yij;
	Wed, 18 Jun 2025 01:32:32 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhRt-00000008juO-44H9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 01:18:47 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250618011844epoutp047ddd9770090df0b326471bf9f95406ff~J-koVsAVT2142421424epoutp04t
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:18:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250618011844epoutp047ddd9770090df0b326471bf9f95406ff~J-koVsAVT2142421424epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209524;
	bh=wtB2nyAmYkJNev8xHYq9d18z8IHo9fhTQMx4FXJI91Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hwOfwwPf1PK9Df2XtBITBVGkjWNu/RovmVrO+C5uEhHfZcW1PEsaa9usJPF6RWFha
	 szkvyXwbP0P5sP7J0iC5oIok6+B+Ue4nJhGtxKQ8jcu8WgrFs0gG5+hs1dNHrBCkXy
	 kcV98DhjUY2/DpcVvH7bk0wFBP/zCRAxM1GE1U5I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011843epcas5p3367373e129f7f5754a9dd4a8b63038f1~J-knaQ-wF0610006100epcas5p3L;
	Wed, 18 Jun 2025 01:18:43 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQqP1bF5z3hhT3; Wed, 18 Jun
	2025 01:18:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250617181451epcas5p4b52e90a02e099d01aa319f0235846d28~J5yig9GeW0527705277epcas5p4u;
	Tue, 17 Jun 2025 18:14:51 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617181448epsmtip25216cdd55479e0fd7073a49e4b970357~J5yfuD5Nn2750327503epsmtip22;
	Tue, 17 Jun 2025 18:14:48 +0000 (GMT)
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
In-Reply-To: <20250616-proud-statuesque-polecat-616eaf@kuoka>
Subject: RE: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Tue, 17 Jun 2025 23:44:47 +0530
Message-ID: <000601dbdfb3$b800ecd0$2802c670$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gGep4S9AR7FIqoAhOg89rD+NDxg
Content-Language: en-in
X-CMS-MailID: 20250617181451epcas5p4b52e90a02e099d01aa319f0235846d28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
	<20250613055613.866909-6-pritam.sutar@samsung.com>
	<20250616-proud-statuesque-polecat-616eaf@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181846_320514_0FEE2952 
X-CRM114-Status: GOOD (  11.06  )
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
> Sent: 16 June 2025 01:47 PM
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
> Subject: Re: =5BPATCH v3 5/9=5D phy: exyons5-usbdrd: support HS combo phy=
 for
> ExynosAutov920
>=20
> On Fri, Jun 13, 2025 at 11:26:09AM GMT, Pritam Manohar Sutar wrote:
> > +static const struct
> > +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920=5B=5D =3D =
=7B
> > +	=7B
> > +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> > +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
> > +	=7D,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_drvdata
> exynosautov920_usbdrd_hsphy =3D =7B
> > +	.phy_cfg		=3D usbdrd_hsphy_cfg_exynosautov920,
> > +	.phy_ops		=3D &exynosautov920_usb31drd_phy_ops,
> > +	.clk_names		=3D exynos5_clk_names,
> > +	.n_clks			=3D ARRAY_SIZE(exynos5_clk_names),
> > +	.core_clk_names		=3D exynos5_core_clk_names,
> > +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
> > +=7D;
>=20
> Same questions: where are all other fields and resources?
>=20

LDO regulators are always on.  USB don=E2=80=99t=20control=20them=20for=20E=
xynosAutov920.=0D=0APhy=20isol=20is=20shared=20across=20the=20USBs.=20And=
=20it=20is=20handled=20in=20bootloader=20(if=20one=20causes=20phy=20exit,=
=20it=20isolates=20all=20the=20phys).=20=0D=0A=0D=0AHence,=20supplies=20and=
=20power=20on/off=20are=20removed=20from=20phy=20ops.=0D=0A=0D=0AWill=20upd=
ate=20the=20same=20with=20commit=20message=20in=20next=20version=20of=20the=
=20patch-set=20(v4).=0D=0A=0D=0A>=20Best=20regards,=0D=0A>=20Krzysztof=0D=
=0A=0D=0A=0D=0A

