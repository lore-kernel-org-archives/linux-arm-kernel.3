Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296C5C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=; b=e/H6hrlrL+XbkMV/AcMRTmYaq6
	5G4nA6x/cFRQIQ5ZppmpKdvNjhaTtLZTXPBluSo1Rv53IbJ9HBqBq6U1ds02SbnTwl5wshPJG5DwS
	32YpXKP8wH/tUtUg+tktzOGp7jyjnlAd7+57E7rBMVrhOqr+6YfgFKUV+HHbhHXwUa7VVxb6F1u2N
	P2uaeabHS0IYkl+99Zwizgy2dwQZ3iJ/1fKTK6BrKVDv/6UnweimTNyvfn2JTd8TEPCxF2r9rh/OS
	IgOhNCX2ns6I9+5cPciq3d4kL6IQ6OLwIYJWoDz1ZeL2/q0yXk+eJ08biivgtun8es3dDeR70w/Zz
	c6kFsGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvH9-0000000HX4Q-094X;
	Thu, 08 May 2025 07:02:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvD4-0000000HWgn-2woE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:58:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso491283f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746687500; x=1747292300; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=EEInu4yJEfgIUG6nCKlHkogMfkgofPeRYIJuZ/Gz6LBdNm3dUfbGK+P/t72qrwf6qY
         XzgbX3Cai7hx2RNjgEBmX5BATQ+/KGSfE/W6zsokxVXF5JGyWZA41PHHwkvJfJQJC9BT
         khL7QifZugkOVJll99727qYRqCIkNCxBEMc7s9nVXAkqM2qLOdtneeKwpv9TrIyDl1a0
         3sT13gzprLdKrPAr0w1wljDcK3W8bw7H1DTUDCRqwwVZ7OE8eNGOmCE7Vnt/x815o3LY
         5Ytac+by/Y2espgBcFDd1IA1q1VglaD/SR7rpzNRjuZCO6N5i1sGpMGaezUavai2iTo0
         1KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687500; x=1747292300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=timFqid7O89yH3ztIgEwuQJym+kJzPTkkVzgZ4Ee0GVi9M8X6DEYL1nDcTpl7OpUJi
         KpKACLHjb8blFlJEcvE25Gu0B0Z5Bswj+OtqKaPjh9KLd+9dpO6mTigrd1VF/bDiInNf
         7gn+yZKXjwTmW0/YojFBTyKw5px8DISLEBQtCpx8RJrHFwfD/4oftTP6Xj+sLtrkRR+A
         NDChk0fEFasRtnUPFt2zye/SfvbGLlQV/Dx/O6kxR5pwmAjkq0+yUXJ3NMStNta9Ix9c
         e05GihP0g/DWgdarT/dS/oc7ZhDBYG+CRxd6+TCXrPJWxZXgOv+Lmzmse8bC9g3ocPV0
         SxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKiFROhCCPv3CvzhgfcGzg56LOskUgWRo+oZt1VQ+HOwcc3GTHOGOvAtmzVb+lorM3GAyzjEX+XF0FHRtYMRb2@lists.infradead.org
X-Gm-Message-State: AOJu0YyOMhH+mDh+hzrQZcDxw+yVty7DnD9qP2j0rO9RrrRRLbYbl3UT
	yMxKcP9x6M1iDUXE9hSaoyA38d9yTlXbz8DTcYbUEv2vUndsQ1KvIK4zKCi8HQ==
X-Gm-Gg: ASbGncu9MXBU26dYSZ+8muNUvs40avi4m5tFTjmTe/0ALC/e4b9PnzQ0QXLCIaLrKAT
	z4q8M45Wc/VH7UtOWkR8Lm1u+3QKAkiGOLRWqOhmTKmcMPWsPiMVsPgTEg1sQvAy2dhmA7j9kJV
	OBEMYp7m7FB0aYhQYog0yg5ia+fAdJ5BHtJCdc/XdrHbezsJisP4h9S/7WF3LLsvLfY94yEKZWw
	H3EcIXtNq4Ow/B2v/6DbBVK+CqMxVoeP0gt0QiZNBTRlP7AEkglizhSaq6G4cDHOzs2z7El9jD5
	aeT/4TpHjn+ux9V7dqkHJxdpwPgofLPBNd0g5+3hZTDGNWDxwVbkKpZDhoTRPIAs1El6OC/bbTW
	8AcULBQndO6V6f9nWUFWm5I0=
X-Google-Smtp-Source: AGHT+IE6fY7G6i3QYGrY3X5Ul1LizOf1wK5bHxiH9swb38pg5rW4p838LgWBRNHE0H7wg8cPl2p63A==
X-Received: by 2002:a05:6000:1449:b0:3a0:bc28:e0e8 with SMTP id ffacd0b85a97d-3a0bc28e221mr781184f8f.23.1746687500552;
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b300873dsm6123920f8f.78.2025.05.07.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Date: Thu, 8 May 2025 12:28:19 +0530
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
Message-ID: <fxgmyq7rqgxw2omtkfj4zvzqgbfjhafin3dt2yevs4siwol62w@5cz6pfxixd2h>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_235822_750047_6150028D 
X-CRM114-Status: GOOD (  43.51  )
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

On Thu, Apr 24, 2025 at 10:31:00AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
> > 
> > 
> > On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > 
> > > The PCIe link can go down under circumstances such as the device firmware
> > > crash, link instability, etc... When that happens, the PCIe slot needs to
> > > be reset to make it operational again. Currently, the driver is not
> > > handling the link down event, due to which the users have to restart the
> > > machine to make PCIe link operational again. So fix it by detecting the
> > > link down event and resetting the slot.
> > > 
> > > Since the Qcom PCIe controllers report the link down event through the
> > > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > > bit in PARF_INT_ALL_MASK register.
> > > 
> > > Then in the case of the event, call pci_host_handle_link_down() API
> > > in the handler to let the PCI core handle the link down condition.
> > > 
> > > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > > reset the slot in a platform specific way. So implement the callback to
> > > reset the slot by first resetting the PCIe core, followed by reinitializing
> > > the resources and then finally starting the link again.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig     |  1 +
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
> > >   2 files changed, 89 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > > --- a/drivers/pci/controller/dwc/Kconfig
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -296,6 +296,7 @@ config PCIE_QCOM
> > >   	select PCIE_DW_HOST
> > >   	select CRC8
> > >   	select PCIE_QCOM_COMMON
> > > +	select PCI_HOST_COMMON
> > >   	help
> > >   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> > >   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -34,6 +34,7 @@
> > >   #include <linux/units.h>
> > >   #include "../../pci.h"
> > > +#include "../pci-host-common.h"
> > >   #include "pcie-designware.h"
> > >   #include "pcie-qcom-common.h"
> > > @@ -55,6 +56,7 @@
> > >   #define PARF_INT_ALL_STATUS			0x224
> > >   #define PARF_INT_ALL_CLEAR			0x228
> > >   #define PARF_INT_ALL_MASK			0x22c
> > > +#define PARF_STATUS				0x230
> > >   #define PARF_SID_OFFSET				0x234
> > >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> > >   #define PARF_DBI_BASE_ADDR_V2			0x350
> > > @@ -130,8 +132,11 @@
> > >   /* PARF_LTSSM register fields */
> > >   #define LTSSM_EN				BIT(8)
> > > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > > +#define FLUSH_MODE				BIT(11)
> > >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > > +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
> > >   #define PARF_INT_ALL_LINK_UP			BIT(13)
> > >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> > > @@ -145,6 +150,9 @@
> > >   /* PARF_BDF_TO_SID_CFG fields */
> > >   #define BDF_TO_SID_BYPASS			BIT(0)
> > > +/* PARF_STATUS fields */
> > > +#define FLUSH_COMPLETED				BIT(8)
> > > +
> > >   /* ELBI_SYS_CTRL register fields */
> > >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > > @@ -169,6 +177,7 @@
> > >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> > >   #define PERST_DELAY_US				1000
> > > +#define FLUSH_TIMEOUT_US			100
> > >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > > @@ -274,11 +283,14 @@ struct qcom_pcie {
> > >   	struct icc_path *icc_cpu;
> > >   	const struct qcom_pcie_cfg *cfg;
> > >   	struct dentry *debugfs;
> > > +	int global_irq;
> > >   	bool suspended;
> > >   	bool use_pm_opp;
> > >   };
> > >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > +				  struct pci_dev *pdev);
> > >   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> > >   {
> > > @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> > >   			goto err_assert_reset;
> > >   	}
> > > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > > +
> > >   	return 0;
> > >   err_assert_reset:
> > > @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> > >   	.post_init	= qcom_pcie_host_post_init,
> > >   };
> > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > +				  struct pci_dev *pdev)
> > > +{
> > > +	struct pci_bus *bus = bridge->bus;
> > > +	struct dw_pcie_rp *pp = bus->sysdata;
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > +	struct device *dev = pcie->pci->dev;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	/* Wait for the pending transactions to be completed */
> > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > > +					 val & FLUSH_COMPLETED, 10,
> > > +					 FLUSH_TIMEOUT_US);
> > > +	if (ret) {
> > > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > > +		goto err_host_deinit;
> > > +	}
> > > +
> > > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > > +	val = readl(pcie->parf + PARF_LTSSM);
> > > +	val |= SW_CLEAR_FLUSH_MODE;
> > > +	writel(val, pcie->parf + PARF_LTSSM);
> > > +
> > > +	/* Wait for the FLUSH_MODE to clear */
> > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > > +					 !(val & FLUSH_MODE), 10,
> > > +					 FLUSH_TIMEOUT_US);
> > > +	if (ret) {
> > > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > > +		goto err_host_deinit;
> > > +	}
> > > +
> > > +	qcom_pcie_host_deinit(pp);
> > > +
> > > +	ret = qcom_pcie_host_init(pp);
> > > +	if (ret) {
> > > +		dev_err(dev, "Host init failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = dw_pcie_setup_rc(pp);
> > > +	if (ret)
> > > +		goto err_host_deinit;
> > > +
> > > +	/*
> > > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > > +	 * non-sticky.
> > > +	 */
> > > +	if (pcie->global_irq)
> > > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> > do we need to enable linkup again here, since all the devices are
> > enumerated previously, the linkup irq will do a rescan again which is
> > not needed.
> 
> Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> is strictly not needed. I will drop it.
> 

Hmm, I just realized that if the device gets removed and link down happens, we
would still need to have link up to enumerate it once attached.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

