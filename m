Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ABAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 05:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZUPcM2JRXU1EZUeYvnEV+B9VdnBQw7RuAghQfhbC98=; b=yaJUyL0M/fzheilmTxbTAhtuED
	0Cytjp9kq4eiRAAVAN+haeSp5cHkADgCrdZ8g3oWXTkzJRfZ0mH2gDYJy/AR7hFrs+Xj/9+M9sTcy
	VN99AyKE6v7UEajCS3GLwcWd6L6MCiCQkgb/U65DIp+C4YCX0gAiyCgl9kaTKOShY3Rj2VMKYUy0V
	6OX4pfH0Rgx2C8KY6GYNMRMP09Kkg939t1gBkyNE62/1HCup4qBq8Xr1EM881JrpJNlqITQMhyglF
	Vk9ND77VKdUHAE5A0Sre4GgeIE3pmgEpAEnwvn1PrVkiXYHiswgFOUdYkRaqK/phtfnTEQJTzoYJD
	Jp+JRptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7p99-0000000Ct2v-0UqY;
	Thu, 24 Apr 2025 05:29:15 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7p7A-0000000CsuJ-0GxF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 05:27:13 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-30549dacd53so495437a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 22:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745472431; x=1746077231; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZUPcM2JRXU1EZUeYvnEV+B9VdnBQw7RuAghQfhbC98=;
        b=xfs1Eil6Bc+J6KA3CdvhWr3Rwqr2jwdM5fPqnLcaPM5HHlE4Fg/kItC+7MZjlhAwPP
         LSNuUKlW8bzhClbtNlX6tOehX92tIr+cNHR6al0IjaPaqikqQRHh1LqRTCxVkcGlUQmB
         n+XkN70TOcR9c7CDTwaKmfZgeuFL7smV6C9RoO7OfUCzNgiPqMMT7hScjIo5NuL0bQX4
         ntTciELWubJc9e0FFXEpPgyt2k4tl3pbMBb6vvxEfS9aBEHbkeiin6XiWfTrFAxZEDna
         Dyey4hM56EAiYGvhkoqiDq32a6+TOEykdLWf1gr0TiClUepcJeD+ePSBI31JL9K3+8jZ
         S/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745472431; x=1746077231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZUPcM2JRXU1EZUeYvnEV+B9VdnBQw7RuAghQfhbC98=;
        b=avFR1GeRSrXa4rd1y+pDpgJjcFICb+SN+iDEpsv6ODx2ewC7wnWOXzeirSOe4hz1U7
         wFAr1h4IT5Mr+wzWJYlTZfyUsT2b3OLjxHGFa726JHU5szom+hchMK3SnOS6Mpf3GEqn
         ukw+3MyIz9ETbFdBi0g+0DjJuLfaAmPQaBtG+BXxkl7p5TwR5opGNDZo1/SpTyvH/77S
         hwphRqujQ7IftrOhskJGAetCd43Pt3LzQIKWMVadTfZTrYz03HKwW5LLvlJ+4seB/DFY
         BMuk22K8QgDT2sCDSCDNJqlTwTkpnrkoWXqVvqQoafYaGfLftnDMWg80mG0ykWvnOzD8
         pRWw==
X-Forwarded-Encrypted: i=1; AJvYcCX48Lehtk0iss8FvMBMtpNFbu0AVsc9DStIJRAqUt8MhxIs4RxEiSR3ofL3HPNPY6Jrv8MVPWhAD4IqfALmd4CN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1vreEI6P+2/rUbKmvpf6LqVgKggy8LI9YZgElOfeGg8XcfkTw
	JMVNXO2/sRthPCOHj+NbzgjaxG4n63TtpznsYwWysXEt/oBob3rotFzJoZiegw==
X-Gm-Gg: ASbGncuaL/82hKGLXNWS6nxIyKEdPM14c9aY4PXohyjnH/NV/2vsdKiVPDlKvBgszCd
	qTewDPvwMA82WyHfjmw1sjmaIwtwfNWgYCvANQSaKDvTFIRwUB9RKUBZC46TxVZ6D//bBljxI8x
	89ioWstpbWuD81jOMnf8nklCWkml2H5qDWeyUA7OytrEKSndTcmPOpBOZo2uPAFOlSCZXXDWBXw
	ETLSv8fRZYvDJp7cqilmyXj6GeVqbV4mrmJS7a6jI0c9jX2ACd07QgNpjwVe6MEjoAkv1T7ax+/
	nUqddCNvF7hKACi72CNyOOfK/9IcNM7niZVX8fv0UDCnIZovjjw=
X-Google-Smtp-Source: AGHT+IEwbpxTA4Qj4NM5rAHZdl1TYE4GZFHTARebZEX16BK4YArP6CGqoSYBRcTbYJYiLhgXJ62sqw==
X-Received: by 2002:a17:90b:45:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-309ee3b5de0mr1568292a91.16.1745472430905;
        Wed, 23 Apr 2025 22:27:10 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1385d2sm347425a91.41.2025.04.23.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:27:10 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:57:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <mr5kunnsv5syckqbclcw2xi6es36fnsnfvrvughqlmv2kblxof@tltliisb5upf>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
 <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_222712_121600_2184E422 
X-CRM114-Status: GOOD (  47.15  )
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

On Thu, Apr 24, 2025 at 10:41:24AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/24/2025 10:30 AM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > 
> > > > The PCIe link can go down under circumstances such as the device firmware
> > > > crash, link instability, etc... When that happens, the PCIe slot needs to
> > > > be reset to make it operational again. Currently, the driver is not
> > > > handling the link down event, due to which the users have to restart the
> > > > machine to make PCIe link operational again. So fix it by detecting the
> > > > link down event and resetting the slot.
> > > > 
> > > > Since the Qcom PCIe controllers report the link down event through the
> > > > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > > > bit in PARF_INT_ALL_MASK register.
> > > > 
> > > > Then in the case of the event, call pci_host_handle_link_down() API
> > > > in the handler to let the PCI core handle the link down condition.
> > > > 
> > > > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > > > reset the slot in a platform specific way. So implement the callback to
> > > > reset the slot by first resetting the PCIe core, followed by reinitializing
> > > > the resources and then finally starting the link again.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >    drivers/pci/controller/dwc/Kconfig     |  1 +
> > > >    drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
> > > >    2 files changed, 89 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > > > --- a/drivers/pci/controller/dwc/Kconfig
> > > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > > @@ -296,6 +296,7 @@ config PCIE_QCOM
> > > >    	select PCIE_DW_HOST
> > > >    	select CRC8
> > > >    	select PCIE_QCOM_COMMON
> > > > +	select PCI_HOST_COMMON
> > > >    	help
> > > >    	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> > > >    	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -34,6 +34,7 @@
> > > >    #include <linux/units.h>
> > > >    #include "../../pci.h"
> > > > +#include "../pci-host-common.h"
> > > >    #include "pcie-designware.h"
> > > >    #include "pcie-qcom-common.h"
> > > > @@ -55,6 +56,7 @@
> > > >    #define PARF_INT_ALL_STATUS			0x224
> > > >    #define PARF_INT_ALL_CLEAR			0x228
> > > >    #define PARF_INT_ALL_MASK			0x22c
> > > > +#define PARF_STATUS				0x230
> > > >    #define PARF_SID_OFFSET				0x234
> > > >    #define PARF_BDF_TRANSLATE_CFG			0x24c
> > > >    #define PARF_DBI_BASE_ADDR_V2			0x350
> > > > @@ -130,8 +132,11 @@
> > > >    /* PARF_LTSSM register fields */
> > > >    #define LTSSM_EN				BIT(8)
> > > > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > > > +#define FLUSH_MODE				BIT(11)
> > > >    /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > > > +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
> > > >    #define PARF_INT_ALL_LINK_UP			BIT(13)
> > > >    #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> > > > @@ -145,6 +150,9 @@
> > > >    /* PARF_BDF_TO_SID_CFG fields */
> > > >    #define BDF_TO_SID_BYPASS			BIT(0)
> > > > +/* PARF_STATUS fields */
> > > > +#define FLUSH_COMPLETED				BIT(8)
> > > > +
> > > >    /* ELBI_SYS_CTRL register fields */
> > > >    #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > > > @@ -169,6 +177,7 @@
> > > >    						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> > > >    #define PERST_DELAY_US				1000
> > > > +#define FLUSH_TIMEOUT_US			100
> > > >    #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > > > @@ -274,11 +283,14 @@ struct qcom_pcie {
> > > >    	struct icc_path *icc_cpu;
> > > >    	const struct qcom_pcie_cfg *cfg;
> > > >    	struct dentry *debugfs;
> > > > +	int global_irq;
> > > >    	bool suspended;
> > > >    	bool use_pm_opp;
> > > >    };
> > > >    #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > > +				  struct pci_dev *pdev);
> > > >    static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> > > >    {
> > > > @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> > > >    			goto err_assert_reset;
> > > >    	}
> > > > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > > > +
> > > >    	return 0;
> > > >    err_assert_reset:
> > > > @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> > > >    	.post_init	= qcom_pcie_host_post_init,
> > > >    };
> > > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > > +				  struct pci_dev *pdev)
> > > > +{
> > > > +	struct pci_bus *bus = bridge->bus;
> > > > +	struct dw_pcie_rp *pp = bus->sysdata;
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > > +	struct device *dev = pcie->pci->dev;
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	/* Wait for the pending transactions to be completed */
> > > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > > > +					 val & FLUSH_COMPLETED, 10,
> > > > +					 FLUSH_TIMEOUT_US);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > > > +		goto err_host_deinit;
> > > > +	}
> > > > +
> > > > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > > > +	val = readl(pcie->parf + PARF_LTSSM);
> > > > +	val |= SW_CLEAR_FLUSH_MODE;
> > > > +	writel(val, pcie->parf + PARF_LTSSM);
> > > > +
> > > > +	/* Wait for the FLUSH_MODE to clear */
> > > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > > > +					 !(val & FLUSH_MODE), 10,
> > > > +					 FLUSH_TIMEOUT_US);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > > > +		goto err_host_deinit;
> > > > +	}
> > > > +
> > > > +	qcom_pcie_host_deinit(pp);
> > > > +
> > > > +	ret = qcom_pcie_host_init(pp);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "Host init failed\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = dw_pcie_setup_rc(pp);
> > > > +	if (ret)
> > > > +		goto err_host_deinit;
> > > > +
> > > > +	/*
> > > > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > > > +	 * non-sticky.
> > > > +	 */
> > > > +	if (pcie->global_irq)
> > > > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > > > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> > > do we need to enable linkup again here, since all the devices are
> > > enumerated previously, the linkup irq will do a rescan again which is
> > > not needed.
> > 
> > Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> > is strictly not needed. I will drop it.
> > 
> > > Instead of linkup we update icc & opp bandwidths after
> > > dw_pcie_wait_for_link() in the below.
> > > 
> > 
> > Why do we need to update ICC and OPP?
> After link retrain, if the link data rate has reduced due to some
> electrical issue or some other reason we may need to update the icc and
> opp votings here.
> 

Hmm, I was not expecting it to get changed, but considering the fact that the
link down might be happening due to any link stability issues, it is plausible.

I will add a call to qcom_pcie_icc_opp_update().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

