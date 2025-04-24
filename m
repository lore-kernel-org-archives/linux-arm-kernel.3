Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC48C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 05:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=; b=XnTVaKVW3YH1BtNQnI5FAyICHw
	/v5TGTbBGYznxycD8RM4w7mMScFCqOWd6JGDveeLKQnMb79OygGlO82XXKMNhcHVZsLhrhJ/bHVr/
	1cbc8Afr+93GTDjB6jQ78Rbew2g3asJaGI/U36d3TaEiCg/tU3wA1M1Nz0aozGWYoiQazVrUCWBXV
	AT6Hp91s9E+rEuMwE1FwToa3I0Qvcg3gG0WW6HpU34OR0CPmvuF8uVI0662tevFdJRu1Y8V/PVKaj
	laaqVGb953VY8Hw9s8HG02NB7Eg+++vg+dFCCeFb3LfHINVCmcMkGRAhM5aJk2bzEcx6leZus3x11
	vIidF7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ojq-0000000CqOK-2Jy0;
	Thu, 24 Apr 2025 05:03:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ohp-0000000CqGC-1vJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 05:01:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224191d92e4so5691055ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745470860; x=1746075660; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=o8X1M8Plgenx7XkxQd8f8Vu0/FNy3sbuVg62y1dWBKrqfziZR4hefQKaMU4KMT8USG
         gVHFjxqBP0YOvZReVW4QkSu7MQmnJJQ62SdJU6MHCy5mc4sRBs4fpbUrYBmfT6Sj2miP
         +ECQIX0oYMX5Fsb1KgyfckSkJA1Y/NxubuCrt46EAjd5Av/r9+9YnVOLa2RQcme1fGus
         V87Jh/NBhHqUOLeeaSeg5qBF21jDzQd6aDpsptPT9S1r9DSd0/JWRw7EqJzVcWF1/kzN
         g/1VjPyfmBOSA6iycOE2YT34lZzUkUes/b3bQ5QZY+jRvHMWKY16Ka1uRjecBdzXvc5L
         s8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470860; x=1746075660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=s3c1n+H7Bemjp0wuxcRfZifc9VIRQZibMHUK3AWoO09N16N+uURdFF5GVsuZ4Fuyn2
         GI+Rb1UbKI3ISEINDI/f8gtq0MmXvKngOBpgJ9pQyrMLBoZgbcTdrGmqpbi0QyueUJSn
         UVsQYNtI96EJL/43RK1T5y4U+XlRl0m94QLWSqlJVf8nmhXF3rlG4ql7+SIlCkQ7Bn0N
         1S7QxTMPAA2y0ERCmW4Q/NxYVpVKDyFwCeMnYbirDCNl8ru70Zg5Y8CVp+eQEpGVFn14
         BJ0LSockwuMt6HjNHMzNXRKOhOT9w9V9QitJnxpQ/CnPsFB0bgiu6lzTE6LOkDTt5j2N
         2g8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi66NqDtIqYfjejIEMDGOLW+LNZGUNbqA51npmDraX3FZSmqxybDmbaUuR0Y+CfUIP2RY1YwBmHI1EQSnETqL/@lists.infradead.org
X-Gm-Message-State: AOJu0YyKvu/EQta7yyW1NGozy4y6/XMcznWqyCI5CusIAiw3d6wBukdK
	/FkJyA+LecLPxHVffJyG1/WbynQEH65cwy2FKV+1bmbpa+ppS4gSVdzrh9j34w==
X-Gm-Gg: ASbGncuXa9njWSSFax4oCbTamgoEYnWucwOz6pQAVPyAYET53p9qIfmqBQjpfU14UfQ
	eT5c++YhOddiYhlTq5cfptv9qN7btjYLiAhSdp2iQIKOmnJJbINmFH6Yv9Ti+NaQJCldmV98FM9
	Vr7x8EIFp+Jjk+HLWyTTgbjVnEoUWAGD2+mSRpN6SxISeXImJBgtvKog5tXOKEOT3wm9zHlmoQm
	xGjnLG4QNtkvv5FBFxVTknb0vdupqfp90PUBOWYRvjMfm0w1itCP5rRNerpkHzdsjtuIQBcTKeZ
	Vmnb7D81g0eCpGSN4oL3ktiNIoUkY1wK1EqK+bkjAzKZ7/fupmI=
X-Google-Smtp-Source: AGHT+IFlCw2SuU4enXP7a4EpyWA+qrfkXjx8G9cFKLJd9YEAI7BU71q90hR3Gq88nNLPSs+CuzFQxg==
X-Received: by 2002:a17:903:94c:b0:220:fe51:1aab with SMTP id d9443c01a7336-22db3d71bbemr19486175ad.38.1745470860040;
        Wed, 23 Apr 2025 22:01:00 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f7fsm3794705ad.33.2025.04.23.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:00:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:30:51 +0530
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
Message-ID: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_220101_519246_E79DF9FB 
X-CRM114-Status: GOOD (  40.15  )
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

On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > The PCIe link can go down under circumstances such as the device firmware
> > crash, link instability, etc... When that happens, the PCIe slot needs to
> > be reset to make it operational again. Currently, the driver is not
> > handling the link down event, due to which the users have to restart the
> > machine to make PCIe link operational again. So fix it by detecting the
> > link down event and resetting the slot.
> > 
> > Since the Qcom PCIe controllers report the link down event through the
> > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > bit in PARF_INT_ALL_MASK register.
> > 
> > Then in the case of the event, call pci_host_handle_link_down() API
> > in the handler to let the PCI core handle the link down condition.
> > 
> > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > reset the slot in a platform specific way. So implement the callback to
> > reset the slot by first resetting the PCIe core, followed by reinitializing
> > the resources and then finally starting the link again.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/dwc/Kconfig     |  1 +
> >   drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
> >   2 files changed, 89 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -296,6 +296,7 @@ config PCIE_QCOM
> >   	select PCIE_DW_HOST
> >   	select CRC8
> >   	select PCIE_QCOM_COMMON
> > +	select PCI_HOST_COMMON
> >   	help
> >   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> >   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -34,6 +34,7 @@
> >   #include <linux/units.h>
> >   #include "../../pci.h"
> > +#include "../pci-host-common.h"
> >   #include "pcie-designware.h"
> >   #include "pcie-qcom-common.h"
> > @@ -55,6 +56,7 @@
> >   #define PARF_INT_ALL_STATUS			0x224
> >   #define PARF_INT_ALL_CLEAR			0x228
> >   #define PARF_INT_ALL_MASK			0x22c
> > +#define PARF_STATUS				0x230
> >   #define PARF_SID_OFFSET				0x234
> >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> >   #define PARF_DBI_BASE_ADDR_V2			0x350
> > @@ -130,8 +132,11 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > +#define FLUSH_MODE				BIT(11)
> >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
> >   #define PARF_INT_ALL_LINK_UP			BIT(13)
> >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> > @@ -145,6 +150,9 @@
> >   /* PARF_BDF_TO_SID_CFG fields */
> >   #define BDF_TO_SID_BYPASS			BIT(0)
> > +/* PARF_STATUS fields */
> > +#define FLUSH_COMPLETED				BIT(8)
> > +
> >   /* ELBI_SYS_CTRL register fields */
> >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > @@ -169,6 +177,7 @@
> >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> >   #define PERST_DELAY_US				1000
> > +#define FLUSH_TIMEOUT_US			100
> >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > @@ -274,11 +283,14 @@ struct qcom_pcie {
> >   	struct icc_path *icc_cpu;
> >   	const struct qcom_pcie_cfg *cfg;
> >   	struct dentry *debugfs;
> > +	int global_irq;
> >   	bool suspended;
> >   	bool use_pm_opp;
> >   };
> >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev);
> >   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> >   {
> > @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >   			goto err_assert_reset;
> >   	}
> > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > +
> >   	return 0;
> >   err_assert_reset:
> > @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> >   	.post_init	= qcom_pcie_host_post_init,
> >   };
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev)
> > +{
> > +	struct pci_bus *bus = bridge->bus;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 val;
> > +	int ret;
> > +
> > +	/* Wait for the pending transactions to be completed */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > +					 val & FLUSH_COMPLETED, 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > +	val = readl(pcie->parf + PARF_LTSSM);
> > +	val |= SW_CLEAR_FLUSH_MODE;
> > +	writel(val, pcie->parf + PARF_LTSSM);
> > +
> > +	/* Wait for the FLUSH_MODE to clear */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > +					 !(val & FLUSH_MODE), 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	qcom_pcie_host_deinit(pp);
> > +
> > +	ret = qcom_pcie_host_init(pp);
> > +	if (ret) {
> > +		dev_err(dev, "Host init failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = dw_pcie_setup_rc(pp);
> > +	if (ret)
> > +		goto err_host_deinit;
> > +
> > +	/*
> > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > +	 * non-sticky.
> > +	 */
> > +	if (pcie->global_irq)
> > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> do we need to enable linkup again here, since all the devices are
> enumerated previously, the linkup irq will do a rescan again which is
> not needed.

Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
is strictly not needed. I will drop it.

> Instead of linkup we update icc & opp bandwidths after
> dw_pcie_wait_for_link() in the below.
> 

Why do we need to update ICC and OPP?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

