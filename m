Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D7ACA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AWIYj2epFr+qx1fVpqnAX5UanwZB2y/LnSEJHpETPc=; b=HrSfiAewE3T9lLP0M07pPYN0Lx
	EIXkzc/5RQLl3qJtPk0a2VpCqv/Qqa5hUdVKEOCBJqjeyEpxO9cVTSSKPuWLyb96bvSbFWoxBaNF+
	h7ChT0v7TogOkncym3ekivg+i1ycNh/Kkz8wzLpfG9NIYbGQI2+oWxfcIqs04w7IHWibzSKNEqik9
	2nqrJkv+L9Dp7d4sdvjQuxj/vv4Q/MvvKOLu3zT+i4ifQtCV6cFrx/hrIBbOcOhp+C3URDT6Vyu0K
	HcZwkDaH+ZZbsmBSX/2L3zRddUrLA5Lcr1YnyQjioQjaiV0bFCm0ASd9G+GZgSoQj6RpSMpM2p9ia
	d8RR5dxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFOR-00000009TgB-2QU5;
	Tue, 19 Aug 2025 06:00:23 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFLq-00000009TSs-05u1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:57:44 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250819055736epoutp02d833a97592c21247b5fdbb8f6337eb51~dFXzt-yn-2443424434epoutp02V
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:57:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250819055736epoutp02d833a97592c21247b5fdbb8f6337eb51~dFXzt-yn-2443424434epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755583056;
	bh=0AWIYj2epFr+qx1fVpqnAX5UanwZB2y/LnSEJHpETPc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KNSW+IwRMopQ1HaN87qTcS0ySHULMA+cVlVfrLHwswVS4Kx2rTyHdixJ1+Ec+WWbH
	 1PnbPlr8opoX5C/Hy5PbzSa2S3PMXKdueVDGEgGvCY3LBnGdVHxpv4wh0Rm3hDUrua
	 ++ebrrMeFsmmEcDZ3CRoW4LcIhEAJQUH3dh1snHE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250819055735epcas5p3e2ba939105f3a113e44f166c5accc5f8~dFXzAutSr3096130961epcas5p3v;
	Tue, 19 Aug 2025 05:57:35 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c5f4Z1pyLz2SSKf; Tue, 19 Aug
	2025 05:57:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250819054102epcas5p3d7ddf2f221eb29aea94e01a20ae475f1~dFJWy6v4S2754527545epcas5p3R;
	Tue, 19 Aug 2025 05:41:02 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250819054059epsmtip17dc08bb104387a48e7c613e31273ea49~dFJT6ERqW0874408744epsmtip1h;
	Tue, 19 Aug 2025 05:40:59 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <aJtNGGjKy762BLcX@vaman>
Subject: RE: [PATCH v5 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Tue, 19 Aug 2025 11:10:58 +0530
Message-ID: <008401dc10cb$d97ebec0$8c7c3c40$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQOFHe52AnwI3/8CqtxTAbLfaf6A
Content-Language: en-in
X-CMS-MailID: 20250819054102epcas5p3d7ddf2f221eb29aea94e01a20ae475f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114316epcas5p49b78db499c2e37a1fe68f4b2f0be62a7
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114316epcas5p49b78db499c2e37a1fe68f4b2f0be62a7@epcas5p4.samsung.com>
	<20250805115216.3798121-5-pritam.sutar@samsung.com> <aJtNGGjKy762BLcX@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_225742_719845_070AE338 
X-CRM114-Status: GOOD (  28.02  )
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

Hi Vinod,

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 12 August 2025 07:48 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-samsung-
> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v5 4/6] phy: exynos5-usbdrd: support HS combo phy for
> ExynosAutov920
> 
> On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> > Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> > what the existing Exynos850 support does. The difference is that some
> > register offsets and bit fields are defferent from Exynos850.
> >
> > Add required change in phy driver to support combo HS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c | 210
> > +++++++++++++++++++++++
> >  1 file changed, 210 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index 5400dd23e500..c22f4de7d094 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -41,6 +41,13 @@
> >  #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
> >
> >  #define EXYNOS2200_DRD_UTMI			0x10
> > +
> > +/* ExynosAutov920 bits */
> > +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> > +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> > +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> > +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> > +
> >  #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
> >  #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
> >
> > @@ -250,6 +257,22 @@
> >  #define EXYNOS850_DRD_HSP_TEST			0x5c
> >  #define HSP_TEST_SIDDQ				BIT(24)
> >
> > +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> > +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> > +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> > +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> > +
> > +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> > +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> > +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> > +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> > +#define HSPCTRL_COMMONONN			BIT(8)
> > +
> > +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> > +
> > +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> > +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> > +
> >  /* Exynos9 - GS101 */
> >  #define EXYNOS850_DRD_SECPMACTL			0x48
> >  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13,
> 12)
> > @@ -2054,6 +2077,139 @@ static const struct exynos5_usbdrd_phy_drvdata
> exynos990_usbdrd_phy = {
> >  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> >  };
> >
> > +static void
> > +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd) {
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +	u32 reg;
> > +
> > +	/*
> > +	 * Disable HWACG (hardware auto clock gating control). This
> > +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> > +	 * to make sure the PHY clock is not gated by the hardware.
> > +	 */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg |= LINKCTRL_FORCE_QACT;
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> 
> maybe add a read-modify-write helper, this is user a lot here

Used this convention for readability purpose. Other SoCs are also using 
convention in this file. 

Moreover, noted this and will consider to clean-up this file later.

> 
> > +
> > +	/* De-assert link reset */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> > +	reg &= ~CLKRST_LINK_SW_RST;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> > +
> > +	/* Set PHY POR High */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +
> > +	/* Enable UTMI+ */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> > +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND |
> UTMICTL_FORCE_UTMI_SLEEP |
> > +		UTMICTL_FORCE_DPPULLDOWN |
> UTMICTL_FORCE_DMPULLDOWN);
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> > +
> > +	/* set phy clock & control HS phy */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +
> > +	fsleep(100);
> > +
> > +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> > +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID |
> EXYNOS2200_UTMI_FORCE_BVALID;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> > +
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +
> > +	/* Setting FSEL for refference clock */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> > +	reg &= ~HSPPLLTUNE_FSEL;
> 
> Empty line here please

Will add empty line.

> 
> > +	switch (phy_drd->extrefclk) {
> > +	case EXYNOS5_FSEL_50MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> > +		break;
> > +	case EXYNOS5_FSEL_26MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> > +		break;
> > +	case EXYNOS5_FSEL_24MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> > +		break;
> > +	case EXYNOS5_FSEL_20MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> > +		break;
> > +	case EXYNOS5_FSEL_19MHZ2:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> > +		break;
> > +	default:
> > +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> > +			 phy_drd->extrefclk);
> 
> but we still continue?

This SoC supports 19.2Mhz refclk and it sets default reg value for this
refclk if it does not find clk.

> --
> ~Vinod

Thank you,

Regards,
Pritam


