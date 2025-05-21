Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F139C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2h7KCuIKufhoXQ+HqVz6bMuYfLM8cjaKOqTDsJazrs=; b=hQs5pyC35mKfSZZDb9xLZuhw0X
	phy+KUv+7zY3rmkOLyIvE/mHIEVgxYb/eaFE3rviJ5exUAJ3sdkt83C7SCcgniWG9OG291Rf+RvhR
	L0S37QzGjHQczmrBd4KZf6eqcA/TtrDBVV7yfggC40LWvOkxCV3x8uVhwYaT5Ev6xS8crLULGw1lJ
	cgCKY+6poZA83gmE8IQ93gnl9Jcaxy3wViq2Tb2jN5BdJY9k3JtzpAD7zkFSYVYArbXRpdqFFH8QH
	CXQYGn0PDYPWw6C014GqhO7RV5iL8D9mw/iU/hAblDiD8uOs8umOMqh/AEKCCH4yOyEK9hCLVRCi6
	pdO5P9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHerf-0000000FAEA-0CN7;
	Wed, 21 May 2025 08:31:51 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHem4-0000000F9YP-0EM3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:26:05 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250521082602epoutp04d995a6795c12e86255a44fec474a857c~BfVt9PZC20622906229epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 08:26:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250521082602epoutp04d995a6795c12e86255a44fec474a857c~BfVt9PZC20622906229epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747815962;
	bh=i2h7KCuIKufhoXQ+HqVz6bMuYfLM8cjaKOqTDsJazrs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uiU+QXh0yseY53apSWTPTe0zkVRRk41uWPtI7yQYP4zUWt/ib2vqQHbvd3Lx4AIqA
	 jIlFTHB+l3cyFC8hxCO/vMgvlXl1exzsT+RP74SBZKjlVOErepUU5OWxV6Yec/qOrF
	 E0X5j5ZHsqqbjQQXOQDTRyymem8qIkN2DF8jkbCM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250521082601epcas5p316f95d8ada181f4e1fc5afe080d1bf78~BfVs6fOAM1638916389epcas5p3L;
	Wed, 21 May 2025 08:26:01 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.182]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4b2PdM2j3jz6B9m7; Wed, 21 May
	2025 08:25:59 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250521071037epcas5p483fb51fbe57e825f3b92b74acecd7fd6~BeT3qLpfg2957529575epcas5p48;
	Wed, 21 May 2025 07:10:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250521071037epsmtrp159c4b20cbd010c6af7c78308c92386cc~BeT3j5OOV2250922509epsmtrp1X;
	Wed, 21 May 2025 07:10:37 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-1d-682d7c6c84c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F9.62.08766.C6C7D286; Wed, 21 May 2025 16:10:36 +0900 (KST)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250521071033epsmtip289c9df62f7646cc8b9d91dbb8617fb40~BeT0E7yQ-0529005290epsmtip2h;
	Wed, 21 May 2025 07:10:33 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Neil Armstrong'"
	<neil.armstrong@linaro.org>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <1f63af35-7d10-434b-b802-115611ce2ed6@kernel.org>
Subject: RE: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Wed, 21 May 2025 12:40:32 +0530
Message-ID: <000201dbca1f$737647d0$5a62d770$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiRnTfgkV106HBI/lpdza94uXQvgIU2wPiAQ+Sme8BD11JvgOKbRrxsxG8SaA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWy7bCSvG5OjW6GQdMkG4sH87axWWx5tZnF
	Ys3ec0wW93YsY7eYf+Qcq8W1GwvZLf78O89mcbT1P7PFy1n32CzOn9/AbrHp8TVWi8u75rBZ
	TFj1jcVixvl9TBZrj9xltzj/oovV4v3OW4wWG2b8Y7H4v2cHu8WXnw+YLQ6/aWe1OLL8I5PF
	zjsnmB3EPU6u28zksWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5ALYoLpuU1JzMstQifbsErowT
	M/4xFazXrzgx+R1LA+MltS5GTg4JAROJS30/WbsYuTiEBHYzSqycNpkNIiEj8WjaRlYIW1hi
	5b/n7BBFzxklFkxYB1TEwcEmYC4xd506SFxEoJFZomHWShYQh1ngMJPEpymzWCA6VjJJvDw/
	EWwUp4CdxM9Lp5lBbGGBIInp5+6xg9gsAqoSj+7PB6vhFbCU+LG1lQXCFpQ4OfMJmM0soC3x
	9OZTOHvZwtfMEOcpSPx8ugysV0TAT+LN95msEDXiEkd/9jBPYBSehWTULCSjZiEZNQtJywJG
	llWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMGxr6W5g3H7qg96hxiZOBgPMUpwMCuJ
	8Mau0MkQ4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUIJsvEwSnVwOSu
	wXZlyiOZgKlLpJ+kL3RoUVq420dW91zKu+kXUi4fjVPtnf5Lcs7ZY0afk15O2GhnHqXtVzPv
	yuEpy5sLZ9VEPLoz4fulvfcm/Tp3yPddkufL06c/dPjv+vXg+d6DZZd65vv4bzdU/ZT72479
	n/UOn8obwfJbWCaZFjmH9QbM676ZtTH6bV3ivAPuEmGm0dkrErVuJVsUTDb/Ntn3m9niCcs+
	62zmqf25JuVRHdf6lk/aP9ptF38sZbqur3ptr7/CvICcmWfsZ7vIN4fFMTLeWMHIsUUk9Hn+
	6W2S91szzNc+WZCeV9cmvNMh2tS2ebvFmhkvvj2VvNch0FXZdsP1zRu2Oo3I3ZYBhdohPC+U
	WIozEg21mIuKEwGbejekbAMAAA==
X-CMS-MailID: 20250521071037epcas5p483fb51fbe57e825f3b92b74acecd7fd6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
	<20250516102650.2144487-3-pritam.sutar@samsung.com>
	<a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
	<1f63af35-7d10-434b-b802-115611ce2ed6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_012604_411977_DC201A3C 
X-CRM114-Status: GOOD (  28.31  )
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
> Sent: 20 May 2025 01:13 PM
> To: Neil Armstrong <neil.armstrong=40linaro.org>; Pritam Manohar Sutar
> <pritam.sutar=40samsung.com>; vkoul=40kernel.org; kishon=40kernel.org;
> robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; andre.draszik=40linaro.org; peter.griffin=40li=
naro.org;
> kauschluss=40disroot.org; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/2=5D phy: exyons5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On 20/05/2025 09:39, neil.armstrong=40linaro.org wrote:
> >> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> >> b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> >> index 634c4310c660..b440b56c6595 100644
> >> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> >> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> >> =40=40 -177,6 +177,9 =40=40
> >>   =23define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3,
> 0)
> >>
> >>   /* Exynos850: USB DRD PHY registers */
> >> +=23define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
> >> +=23define CTRL_VER_MAJOR_VERSION			GENMASK(31,
> 24)
> >> +
> >>   =23define EXYNOS850_DRD_LINKCTRL			0x04
> >>   =23define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
> >>   =23define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
> >> =40=40 -1772,6 +1775,10 =40=40 static const char * const
> exynos5_regulator_names=5B=5D =3D =7B
> >>   	=22vbus=22, =22vbus-boost=22,
> >>   =7D;
> >>
> >> +static const char * const exynosautov920_clk_names=5B=5D =3D =7B
> >> +	=22ext_xtal=22,
> >> +=7D;
> >> +
> >>   static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy=
 =3D
> =7B
> >>   	.phy_cfg		=3D phy_cfg_exynos5,
> >>   	.phy_ops		=3D &exynos5_usbdrd_phy_ops,
> >> =40=40 -1847,6 +1854,81 =40=40 static const struct exynos5_usbdrd_phy_=
drvdata
> exynos850_usbdrd_phy =3D =7B
> >>   	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> >>   =7D;
> >>
> >> +static void exynosautov920_usbdrd_utmi_init(struct
> >> +exynos5_usbdrd_phy *phy_drd) =7B
> >> +	u32 version;
> >> +
> >> +	version =3D readl(phy_drd->reg_phy +
> EXYNOSAUTOv920_DRD_CTRL_VER);
> >> +	dev_info(phy_drd->dev, =22usbphy: version:0x%x=5Cn=22, version);
> >
> > Please do not add mode info to boot log, use dev_dbg instead.
>=20
> Just drop entirely, not even worth dbg (see coding style, driver developm=
ent
> debugging guide). It is fixed per given compatible, isn't it? If not, the=
re is entire
> commit msg to explain unusual things.

This SoC has a single USB 3.1 DRD combo v400 phy and three USB2.0 DRD phy v=
303
controllers those only support the UTMI+ interface. Currently, supporting o=
nly=20
v303 phy in this patch-set, and planning v400 phy later (soon). Same may be=
=20
also updated in commit  message.=20

If there's any issue in phy init, dbg print is needed to debug which phy ca=
used it.=20

>=20
> >
> >> +
> >> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) =3D=3D 0x3)
> >> +		/* utmi init for exynosautov920 HS phy */
> >> +		exynos850_usbdrd_utmi_init(phy_drd);
> >> +=7D
> >> +
> >> +static int exynosautov920_usbdrd_phy_init(struct phy *phy) =7B
> >> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> >> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> >> +	int ret =3D 0;
> >> +
> >> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd-
> >clks);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* UTMI or PIPE3 specific init */
> >> +	inst->phy_cfg->phy_init(phy_drd);
> >> +
> >> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks,
> >> +phy_drd->clks);
> >> +
> >> +	return 0;
> >> +=7D
> >> +
> >> +static void exynosautov920_v3p1_phy_dis(struct phy *phy) =7B
> >> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> >> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> >> +	void __iomem *reg_phy =3D phy_drd->reg_phy;
> >> +	u32 version;
> >> +
> >> +	version =3D readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> >> +
> >> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) =3D=3D 0x3)
> >> +		exynos850_usbdrd_phy_exit(phy);
> >> +=7D
> >> +
> >> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy) =7B
> >> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> >> +
> >> +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
> >> +		exynosautov920_v3p1_phy_dis(phy);
> >> +
> >> +	return 0;
> >> +=7D
> >> +
> >> +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D =7B
> >> +	.init		=3D exynosautov920_usbdrd_phy_init,
> >> +	.exit		=3D exynosautov920_usbdrd_phy_exit,
> >
> > <snip>
> >
> >> +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> >> +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
> >
> > <snip>
> >
> >> +	=7D, =7B
> >> +		.compatible =3D =22samsung,exynosautov920-usb31drd-phy=22,
> >> +		.data =3D &exynosautov920_usb31drd_phy
> >
> > All those new ops are only called when matching this compatible, it it
> > really necessary to check the version ? is there
> > =22samsung,exynosautov920-usb31drd-phy=22 PHYs with version different f=
rom 3
> in the wild ?
>=20
>=20
> Yeah, this looks like downstream code. Anyway this would need explanation=
 in
> the commit msg.

Commit msg can be updated as mentioned below=20

=22 This SoC has a single USB 3.1 DRD combo v400 phy that supports=20
both UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD v303 phy=20
controllers those only support the UTMI+ (HS) interface.=20
=09
Support only HS phy in this commit which is very similar to what
the existing Exynos850 supports.

Support combo phy later (soon) and this is out of scope of this commit.

Add required change in phy driver to support HS phy for this SoC.=22

>=20
> Best regards,
> Krzysztof

Thank you,
Pritam


