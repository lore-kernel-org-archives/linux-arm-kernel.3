Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7DDC54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=; b=TFaXq+DrglyRuqwnWpmD4Z9lwU
	YV6sH28dK1QXekAstek1YS2IVvO0n+RoK5c1qUvHXkPi5SU3eXSFbLoxC7eUa13iwjBFdBYsrGNR5
	XPHbJnUAXHLw3BcTIhG8B9rW8BN76mYzIp64d6G/YzvXT4n/c5NG/4aP4k6Nea1bYPbMTKkYecvBF
	puSYDnj9314phQauF8qwurZoFqgVHTC4z94njf4oWH20pK4eYJkLcotwpUOH6may4IIZHpYjel/lm
	PXkkHTeMAsEu2bn2lPBNj3opbnI93SK9IN/w79GZ/VHALJqYqujBF/9SeNCXqY2JnjKNkg9G9AVn3
	BFqJ6mXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvJ-0000000G1si-0XBB;
	Wed, 14 May 2025 18:33:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF4S-0000000Flqg-1h6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:35:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so4263060f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240503; x=1747845303; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=Joh321GTET8F4rZPbzBvkud1hxuvEnNVWys2l1ZiWUMU7P/2nRsnVTEFgcxg3q507I
         BoPc8dnxx9FF5uZnirXj8EL3psA/CL/9/9sVRVdeyWXJHBlU7vmp1N4Zp2F9+mhoN0wH
         CKk2rIu7UhEA89rEQO0NaSz6vTmKqryxsFGmIauLPh+DDnOJzYMfyoy5cMc0tehahsRW
         GKm/Y3Y8cJLCJithdBapDPrb+2Q8tIPcbCBibkkMgNeulS/lXqwt1MDbKZ+htk5ZpPUy
         ZeMCg/4zx1eGu2jZ6x44QAolbJ8c8k3agxlmEFjSxuzD9fmpuRJBOWmQHZbQ4jFrtKWL
         eT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240503; x=1747845303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=dNV6lb+d74Rr8Dj0Lx05PC/HuJQZ+vJsEC1N+mjIP7x7Hm/HPrywK2vwENE3rszDYk
         Grg4Y/+tcyvNLVzzx3NMfZXK8sye5fp2yXDu4HtdPVwM+UOF3BnFHrerP+XWgd1w6VR6
         wf5umxM54Qa8BeSFtESwgloZapl+Eon6FENHuO3aJ2PD8+Wpu6gtXMtv/ieco44BmiS7
         xydPdh94kcxf0R0EU0gymk50W+Rk7Hhx+ZOna6WgNPURRwUDSIFEEtbVb4+qKfaQupxf
         0L0ovgNKIauSpHiZWjrM/QqmHv1nVC6YlqMVtz//SgDYOOZi+9xoBjiChFv+HcxwDgXS
         LVnA==
X-Forwarded-Encrypted: i=1; AJvYcCXqVS2+YmcD3H6QT8aLiLjX4L3DhSNAY582Qy/N5k3EqIGk/fzQL3zI1JY2rhb43BQqzTNtZUpzXlODOrr80bJZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyMjOZJq/7GJOy2biY9QIg8QIB2MPm2chheNgOotatgwKstD5gz
	klrtsFcQrPFK8ghhSzhyo3JRLXxa7rkro971Z3oZ614FKQO/bAbdkSysxI9w7g==
X-Gm-Gg: ASbGncv48dORGbakQJy56HuKNPVOwlGuOwdgqZGwJ3ygvN3zUZBQy5ohER3JTye36yZ
	vcPfEBHHyOlA44bRDfF3abAv2aGtiPetEsovkyjwN4gQ++T7Xna1ZaR8vdKs2rp4MzVCUsWVu6W
	PawochuJG/PUpEs/0PP9opYjIqBHZHVa3f5s920bfVuXJopX0M9l99jgP895O9bGF+gVO1W0ZJs
	09wc+0zZYV0XJeBkrrloVK0C8HLrjluV5d3jiN4YNbOATa5lpKNR3uVpMFVDEe2VzvYINibcZnu
	prHZjSkBRuX7HtYWfFQ3KPWLk7zMeIrJKQkezGV1FwsX8ecu6rnJiLsqbF6SRR6l4945+ggqGTp
	g0QkQPjRsISsb3A==
X-Google-Smtp-Source: AGHT+IGj3+htGnEIyMivpivIivCnjfIy6Tideg6ovbKdF3ZUejVVtTS1+sX05zRZKNfgj9Ou9ozS3A==
X-Received: by 2002:a05:6000:1848:b0:3a0:b4f1:8bb8 with SMTP id ffacd0b85a97d-3a3496c38b8mr3799664f8f.34.1747240502599;
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm20577369f8f.63.2025.05.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Date: Wed, 14 May 2025 17:35:00 +0100
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
Subject: Re: [PATCH v4 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <sotge26h35mcijcu3eqkbf7aimkwnxzhbgltoz74nfnefc7fjd@xct54hpv5ane>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
 <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093504_466294_E31E7E10 
X-CRM114-Status: GOOD (  40.00  )
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

On Wed, May 14, 2025 at 11:52:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
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
> > in the handler to let the PCI core handle the link down condition. Note
> > that both link up and link down events could be set at a time when the
> > handler runs. So always handle link down first.
> > 
> > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > reset the slot in a platform specific way. So implement the callback to
> > reset the slot by first resetting the PCIe core, followed by reinitializing
> > the resources and then finally starting the link again.
> > 
> Only one comment see below.
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig     |   1 +
> >   drivers/pci/controller/dwc/pcie-qcom.c | 112 ++++++++++++++++++++++++++++++---
> >   2 files changed, 105 insertions(+), 8 deletions(-)
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
> > index dc98ae63362db0422384b1879a2b9a7dc564d091..e577619d0f8ceddf0955139ae6b939842f8cb7be 100644
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
> > @@ -130,9 +132,14 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > +#define FLUSH_MODE				BIT(11)
> >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > -#define PARF_INT_ALL_LINK_UP			BIT(13)
> > +#define INT_ALL_LINK_DOWN			1
> > +#define INT_ALL_LINK_UP				13
> > +#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
> > +#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
> >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> >   /* PARF_NO_SNOOP_OVERRIDE register fields */
> > @@ -145,6 +152,9 @@
> >   /* PARF_BDF_TO_SID_CFG fields */
> >   #define BDF_TO_SID_BYPASS			BIT(0)
> > +/* PARF_STATUS fields */
> > +#define FLUSH_COMPLETED				BIT(8)
> > +
> >   /* ELBI_SYS_CTRL register fields */
> >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > @@ -169,6 +179,7 @@
> >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> >   #define PERST_DELAY_US				1000
> > +#define FLUSH_TIMEOUT_US			100
> >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > @@ -274,11 +285,14 @@ struct qcom_pcie {
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
> > @@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >   			goto err_assert_reset;
> >   	}
> > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > +
> >   	return 0;
> >   err_assert_reset:
> > @@ -1517,6 +1533,74 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
> >   	}
> >   }
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
> > +
> > +	qcom_pcie_start_link(pci);
> > +	if (!dw_pcie_wait_for_link(pci))
> > +		qcom_pcie_icc_opp_update(pcie);
> This icc opp update can we removed as this can updated from the global
> IRQ.

Right. I forgot to remove it after keeping link up IRQ change. Removed it while
applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

