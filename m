Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD93CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkRioV8ivxgGUgd1+qjbwL6klLS3KFtJyowVkDaeJe4=; b=fydEABvxPcvEccscPweokQtqBz
	/Jy2ZjD17Q6Y4N0Wu9+MH8lTdBt+Opkq7ZxGeJ+qwnaE8BNGtNXnxrgC34AyLI+nGlDu++nBd5GVb
	fOL0Cf/w3VkriOVSy40eMwf7Rxb3TuIDIYp4Qo91qCr6pZMqHOuTzCszP2oFFSMr1qgXJ1KVK1aWI
	jMSyiiC8HOK80hEIxMToQX0xfg0X2FVeBN25zN3HWeVEwvIzvCOVLTAW1QaqFpdZHa0Es+JkE63hr
	bfm5IVgUuAD/OfSEvmDr4uUr140COF+DfFEAnrmUlkXTUmmLJZjHiz8Pf/lVAZebw/PBcziB3z9Jf
	msY/w/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultAo-0000000BeNI-3RWG;
	Tue, 12 Aug 2025 17:52:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpsh-0000000B2e8-3G33;
	Tue, 12 Aug 2025 14:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 038715C5B57;
	Tue, 12 Aug 2025 14:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C53C4CEF0;
	Tue, 12 Aug 2025 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008498;
	bh=32dxnq96SImnSTkRiNIusVAtLmhJTDIedNBn4szGg1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mh+R0weGvZchr4qwuIprSkbYA8TJGU9c37khvcqjkQ5GFY9/kGlAP1PaTHusAObvx
	 02RVjJgJvoXBG1jLP7ZU3Y8eLvYclLkaF5hNHslKWgTEHwtPcurtnEkG2qWcgNTfnE
	 CSvzm7fCVbkuwu9K1WqSY9pI+NbN0pAzrAdJPBsfcovsxoXxsriCvYxx1gwftDAO3v
	 r29Z51xBqBRxPMsV1iiJuKZwwqsBHsCaTZi4U0OLetk4oCQOQ8/CyIFIU8fxxIYc4y
	 iP9uQ25hAk+DIsD8k4pEVBp2ihk7d/h1GN0V3ZZFdHC+KGYcOxL9PNqRpugdV0GNgI
	 rITCVqKzKMpLA==
Date: Tue, 12 Aug 2025 19:51:34 +0530
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
Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aJtN7uVUV3YhfY5-@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
 <20250805115216.3798121-7-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-7-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_072139_899969_14C9BB1B 
X-CRM114-Status: GOOD (  25.79  )
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
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 327 +++++++++++++++++++-
>  include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
>  2 files changed, 324 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index c22f4de7d094..1108f0c07755 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -273,6 +273,36 @@
>  #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
>  #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
>  
> +/* ExynosAutov920 phy usb31drd port reg */
> +#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
> +#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
> +#define PHY_RST_CTRL_PHY_RESET			BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
> +#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
> +#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
> +#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
> +#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
> +#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
> +
>  /* Exynos9 - GS101 */
>  #define EXYNOS850_DRD_SECPMACTL			0x48
>  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2077,6 +2107,253 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static void
> +exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg = 0;

again..

> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	if (high)
> +		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	else
> +		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	fsleep(1);
> +}
> +
> +static void
> +exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	static const unsigned int timeout_us = 20000;
> +	static const unsigned int sleep_us = 40;
> +	u32 reg = 0;

here too

> +	int err;
> +
> +	/* Clear cr_para_con */
> +	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +	exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +	/*
> +	 * The maximum time from phy reset de-assertion to de-assertion of
> +	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
> +	 * Time to phy ready is < 20ms
> +	 */
> +	err = readl_poll_timeout(reg_phy +
> +				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
> +			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
> +			sleep_us, timeout_us);
> +	if (err)
> +		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +}
> +
> +static void
> +exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
> +				 u16 addr, u16 data)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 cnt = 0;
> +	u32 reg = 0;

this one, former is okay

> +
> +	/* Pre Clocking */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx clks must be available prior to assertion of tx req.
> +	 * tx pstate p2 to p0 transition directly is not permitted.
> +	 * tx clk ready must be asserted synchronously on tx clk prior
> +	 * to internal transmit clk alignment sequence in the phy
> +	 * when entering from p2 to p1 to p0.
> +	 */
> +	do {
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +		cnt++;
> +	} while (cnt < 15);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx data path is active when tx lane is in p0 state
> +	 * and tx data en asserted. enable cr_para_wr_en.
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
> +		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	/* write addr */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/* check cr_para_ack*/
> +	cnt = 0;
> +	do {
> +		/*
> +		 * data symbols are captured by phy on rising edge of the
> +		 * tx_clk when tx data enabled.
> +		 * completion of the write cycle is acknowledged by assertion
> +		 * of the cr_para_ack.
> +		 */
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> +			break;
> +
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +		/*
> +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> +		 * is negated, before accessing control regs to allow for
> +		 * internal resets.
> +		 */
> +		cnt++;
> +	} while (cnt < 10);
> +
> +	if (cnt == 10)
> +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);

Not error?
-- 
~Vinod

