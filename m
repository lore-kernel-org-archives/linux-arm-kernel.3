Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459DACA0EE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIR/Mols1mlyhFGOLJI4ypp4infhyhJG+hRmt9kLAWU=; b=JFsDyUUjpgLE/e6B5pQqHM87yu
	/648xKt+buNpd/i3oWlkS3Ce57f9fCaD4jRjqMc8hgM5RK2bPFCO3s5m5V5niigbAIpr4j/JXTtQ6
	48RmvfhpgSM3aw9nPc2VvK13mHkKLVQsqOSO68O6NJaM84oxWXEMlZ8jZVIV4tjALO4RuovxRsMMb
	P0VBnorxwHeEAibbQySe3uJFjLxlGWV9flfdPChs3tSy2gqVJ6NzvrC8IhtOuurAgKAgYJZ0nPdO3
	iXzkX0RhFeEhuQuicZEvVj0BBbmZKLaPJ+KRzkXZRvXBN3sTdaHhMnDA1jQkezgHxsPKxkmJFqF93
	fFwZvHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult3I-0000000BdKo-2efN;
	Tue, 12 Aug 2025 17:44:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulppF-0000000B1yA-2XwV;
	Tue, 12 Aug 2025 14:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88E82A573CA;
	Tue, 12 Aug 2025 14:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A503C4CEF0;
	Tue, 12 Aug 2025 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008284;
	bh=XO4yi+cl35zAmP3v6jAb/UAs/XIZlfZgkA7+goZt8gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKXnghsvCobCiCc1V94xXx9EcY1CxqZVopyNQmp037uV70h1uWJLg3M0VmfiTPz3h
	 ByRRD1j4hVIiL6aUCnFZ8NzgcK4Qd0fUtsYjPQF2gx6FHl+7GF+LFikcd3kIZ0rBrb
	 rvy9gPLUErtuutBlKCnxjKC/NslhH1pwpAF9ZBOIhkAkzo4qZBbjNraTFl2P+u9Lgs
	 QZPMWprmeBHhCm6nIKPKKqIAgkzfJtMrLrjxvBPHb8cfCI6MeeCLfJbgLokI109IGQ
	 eOMOyPCIuiBhlGlzWageG9NOgncojpHfxL/tJolfGEAhIaT0jErLVQvhMXt2cqaq5H
	 Y/ZyOMbrv64aQ==
Date: Tue, 12 Aug 2025 19:48:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Message-ID: <aJtNGGjKy762BLcX@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114316epcas5p49b78db499c2e37a1fe68f4b2f0be62a7@epcas5p4.samsung.com>
 <20250805115216.3798121-5-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-5-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071805_784565_67B5C4E6 
X-CRM114-Status: GOOD (  20.02  )
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

On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> what the existing Exynos850 support does. The difference is that
> some register offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 210 +++++++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 5400dd23e500..c22f4de7d094 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -41,6 +41,13 @@
>  #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
>  
>  #define EXYNOS2200_DRD_UTMI			0x10
> +
> +/* ExynosAutov920 bits */
> +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> +
>  #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
>  #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
>  
> @@ -250,6 +257,22 @@
>  #define EXYNOS850_DRD_HSP_TEST			0x5c
>  #define HSP_TEST_SIDDQ				BIT(24)
>  
> +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> +#define HSPCTRL_COMMONONN			BIT(8)
> +
> +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> +
> +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> +
>  /* Exynos9 - GS101 */
>  #define EXYNOS850_DRD_SECPMACTL			0x48
>  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2054,6 +2077,139 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static void
> +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Disable HWACG (hardware auto clock gating control). This
> +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> +	 * to make sure the PHY clock is not gated by the hardware.
> +	 */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);

maybe add a read-modify-write helper, this is user a lot here

> +
> +	/* De-assert link reset */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg &= ~CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +
> +	/* Set PHY POR High */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* Enable UTMI+ */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
> +		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	fsleep(100);
> +
> +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	/* Setting FSEL for refference clock */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +	reg &= ~HSPPLLTUNE_FSEL;

Empty line here please

> +	switch (phy_drd->extrefclk) {
> +	case EXYNOS5_FSEL_50MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> +		break;
> +	case EXYNOS5_FSEL_26MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> +		break;
> +	case EXYNOS5_FSEL_24MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> +		break;
> +	case EXYNOS5_FSEL_20MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> +		break;
> +	case EXYNOS5_FSEL_19MHZ2:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> +		break;
> +	default:
> +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> +			 phy_drd->extrefclk);

but we still continue?
-- 
~Vinod

