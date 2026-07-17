Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5792EC44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 23:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GBCPJgCnONoIe6VMGY5j1Fmy+0F7iJBPVsm978p2XD4=; b=pipsJnLpeD4MhO79+Z024e0E83
	vr+LlK8LCh/1WEv0C5vEffiVEz0jX9mvCtDwMtk5/sbDElEVEYZZE9vT05wc+MCM1CZCC3nT/Kmkx
	f1oEJM23Fu7xSAIzEbk2f1mRi/PiQP51GkxT3KFQh7H9rhIh1P+xoXEjsjqqxXWw3bzM6MbBHUdSf
	Hr1jPGwoQFuECBGKCuF1vkrdnWvSlDzqlpN8+kbms0bVEMHyGBxfnrc8uoH9SlNvn5t9IDTSDcz3E
	W22zVU7GhPaF/RSPVrAG7Y6hbUJa1LAl0RKkA48BDolcMdQvo9scBlweJdXzEdz0Ok3AXGsjrxiRc
	PAWyVEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkrlG-00000003O2E-2soG;
	Fri, 17 Jul 2026 23:14:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkrlF-00000003O1s-1mHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 23:14:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D93D60A98;
	Fri, 17 Jul 2026 23:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5861F000E9;
	Fri, 17 Jul 2026 23:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784330068;
	bh=GBCPJgCnONoIe6VMGY5j1Fmy+0F7iJBPVsm978p2XD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QiqLFsVGeRC4t1TL6NbvdldNt5+oM07JUShjNVwRj2TkyhqnglZViBhJrvdI+4oe4
	 W0l3Ox4sk2AF1RfJ8LOQgmfTgt2Kuxjs1/z0LgLPDWrQb6AAGVHsoDzbLpUcTwP0pl
	 NiHMNynxnDlEA0YwtsNrPs7DT7lZeKAiNEH9A0tcT4m3+nfSD6e0UEnY7BzE8D/BQj
	 mIO2ifGZd1tF4w9edclbeyGox4XiYsWhACIxUKYB7l3YWFo1dYDCJN+eSV8MXFcy0r
	 N9UL7bmQinwEVYzJXey83qHEmZL1vJheSebcauYzIY20b5XZ60TwNEB8qMhwxyAFED
	 fUUvzjh4US5ow==
Date: Fri, 17 Jul 2026 18:14:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <20260717231426.GA211988@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB1201914A80BB2BF78A10465748CC62@GV2PR04MB12019.eurprd04.prod.outlook.com>
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

On Fri, Jul 17, 2026 at 08:57:04AM +0000, Hongxing Zhu (OSS) wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <mani@kernel.org>
> ...
> > On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> > > From: Richard Zhu <hongxing.zhu@nxp.com>
> > >
> > > Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling
> > > regulators") introduced a boot hang on i.MX6Q/DL variants by changing
> > > the initialization sequence.
> > >
> > > The issue stems from coupling PHY power (TEST_PD) and reference clock
> > > (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> > > managed together, the timing between PHY power-up and reference clock
> > > enablement cannot be properly controlled, leading to initialization
> > > failures.

This is kind of a hand-wavy description that doesn't explain exactly
what 610fa91d9863 changed that broke the boot.

I don't understand what you're saying about timing between PHY
power-up and REFCLK enable because it looks like you enable REFCLK
*first*, then power up the PHY.  There's a 200us delay in
imx_pcie_clk_enable() after enabling REFCLK, but that was already
there in 610fa91d9863.

> > What is the timing requirement here?
>
> The timing requirement is that TEST_PD must be deasserted (cleared) before
> link training starts.

Is there any delay required between deasserting TEST_PD and link
training?

Prior to this patch, imx_pcie_deassert_core_reset() didn't touch
TEST_PD on imx6qp, but it did delay 200us in imx6qp_pcie_core_reset().
Now it will clear TEST_PD and still delay 200us.

On imx6q, it didn't touch TEST_PD or delay.  Now it will clear TEST_PD
but still won't delay.

I don't see any other delay enforced between PHY power up (in
imx_pcie_deassert_core_reset()) and link training.  So after this
patch, it looks like the chipset-specific behavior in
imx_pcie_deassert_core_reset() is:

  imx6sx:  clear TEST_POWERDOWN, no delay
  imx6q:   clear TEST_PD, no delay
  imx6qp:  clear TEST_PD, usleep(200)
  imx7d:   wait for PHY PLL lock
  imx95:   nothing

Here's the path I see after this patch is applied:

  imx_pcie_probe
    dw_pcie_host_init
      imx_pcie_host_init
        imx_pcie_clk_enable
          imx6q_pcie_enable_ref_clk(enable=true)
            regmap_set_bits(IMX6Q_GPR1_PCIE_REF_CLK_EN)   # REFCLK enable
          usleep(200)                                     # <-- delay
        imx_pcie_assert_core_reset
          imx6q_pcie_core_reset(assert=true)
            regmap_set_bits(IMX6Q_GPR1_PCIE_TEST_PD)      # PHY power off
        imx_pcie_ltssm_disable
        imx_pcie_deassert_core_reset

          imx6q_pcie_core_reset(assert=false)
            regmap_clear_bits(IMX6Q_GPR1_PCIE_TEST_PD)    # PHY power on
       -- or --
          imx6qp_pcie_core_reset(assert=false)
            regmap_clear_bits(IMX6Q_GPR1_PCIE_TEST_PD)    # PHY power on
            regmap_update_bits(IMX6Q_GPR1_PCIE_SW_RST)
            usleep(200)                                   # <-- delay

      dw_pcie_start_link
        imx_pcie_start_link

> Before commit 610fa91d9863:
> - imx_pcie_assert_core_reset(): Assert TEST_PD and REF_CLK_EN
> - imx_pcie_clk_enable(): Deassert TEST_PD and assert REF_CLK_EN
> - Link training starts with TEST_PD properly cleared
> 
> After commit 610fa91d9863:
> - imx_pcie_clk_enable(): Deassert TEST_PD and assert REF_CLK_EN
> - imx_pcie_assert_core_reset(): Assert TEST_PD and assert REF_CLK_EN again
> - Link training starts with TEST_PD still asserted (never cleared again)
> 
> This commit corrects the sequence, and makes sure the TEST_PD is cleared
> before link training starts.


> > > Fix this by separating the two concerns:
> > >
> > > - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
> > >   logically belongs with reset operations. This ensures PHY power state
> > >   is managed as part of the core reset sequence.
> > >
> > > - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
> > >   shared PHY power management, avoiding code duplication.
> > >
> > > - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
> > >   (REF_CLK_EN) control, simplifying its purpose.
> > >
> > > - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
> > >   proper sequencing is now handled by the core_reset functions.
> > >
> > > This refactoring ensures PHY power is controlled during reset
> > > operations, fixing the boot hang while improving code maintainability.
> > >
> > 
> > This patch does too many things at once. Can't you split it and
> > keep the minimal fix in one patch?
>
> Okay, I'll split this into a patch series in v3.

The "invoke imx_pcie_assert_core_reset() explicitly in error path of
imx_pcie_host_init() and imx_pcie_host_exit()" part seems unrelated to
the boot hang.

> > > Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling
> > > regulators")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > > Changes in v2:
> > > Regarding sashiko's reivew, invoke imx_pcie_assert_core_reset()
> > > explicitly in error path of imx_pcie_host_init() and imx_pcie_host_exit().
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 45
> > > ++++++++++++---------------
> > >  1 file changed, 20 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 9406bba36953f..53f3da6ab30d5 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -680,21 +680,12 @@ static int imx_pcie_attach_pd(struct device
> > > *dev)
> > >
> > >  static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool
> > > enable)  {
> > > -	if (enable) {
> > > -		/* power up core phy and enable ref clock */
> > > -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_TEST_PD);
> > > -		/*
> > > -		 * The async reset input need ref clock to sync internally,
> > > -		 * when the ref clock comes after reset, internal synced
> > > -		 * reset time is too short, cannot meet the requirement.
> > > -		 * Add a ~10us delay here.
> > > -		 */
> > > -		usleep_range(10, 100);
> > > -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_REF_CLK_EN);
> > > -	} else {
> > > -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_REF_CLK_EN);
> > > -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_TEST_PD);
> > > -	}
> > > +	if (enable)
> > > +		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > > +				IMX6Q_GPR1_PCIE_REF_CLK_EN);
> > > +	else
> > > +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > > +				  IMX6Q_GPR1_PCIE_REF_CLK_EN);
> > >
> > >  	return 0;
> > >  }
> > > @@ -823,23 +814,25 @@ static int imx6sx_pcie_core_reset(struct imx_pcie
> > *imx_pcie, bool assert)
> > >  	return 0;
> > >  }
> > >
> > > -static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool
> > > assert)
> > > +static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool
> > > +assert)
> > >  {
> > > -	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_SW_RST,
> > > -			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
> > > -	if (!assert)
> > > -		usleep_range(200, 500);
> > > +	if (assert)
> > > +		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > > +				IMX6Q_GPR1_PCIE_TEST_PD);
> > > +	else
> > > +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > > +				  IMX6Q_GPR1_PCIE_TEST_PD);
> > >
> > >  	return 0;
> > >  }
> > >
> > > -static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool
> > > assert)
> > > +static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool
> > > +assert)
> > >  {
> > > +	imx6q_pcie_core_reset(imx_pcie, assert);
> > > +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_SW_RST,
> > > +			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
> > >  	if (!assert)
> > > -		return 0;
> > > -
> > > -	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_TEST_PD);
> > > -	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> > IMX6Q_GPR1_PCIE_REF_CLK_EN);
> > > +		usleep_range(200, 500);
> > >
> > >  	return 0;
> > >  }
> > > @@ -1445,6 +1438,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> > >  	return 0;
> > >
> > >  err_phy_off:
> > > +	imx_pcie_assert_core_reset(imx_pcie);
> > >  	phy_power_off(imx_pcie->phy);
> > >  err_phy_exit:
> > >  	phy_exit(imx_pcie->phy);
> > > @@ -1471,6 +1465,7 @@ static void imx_pcie_host_exit(struct dw_pcie_rp
> > *pp)
> > >  			dev_err(pci->dev, "unable to power off PHY\n");
> > >  		phy_exit(imx_pcie->phy);
> > >  	}
> > > +	imx_pcie_assert_core_reset(imx_pcie);
> > >  	imx_pcie_clk_disable(imx_pcie);
> > >
> > >  	pci_pwrctrl_power_off_devices(pci->dev);
> > > --
> > > 2.34.1
> > >
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

