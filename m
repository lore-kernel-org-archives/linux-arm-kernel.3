Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DCED111A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 21:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Vl6vmjbZnutYcglJmDwmyFNn4+druYfeE5E+4a9qj+Y=; b=uYkdGOz5Un4RIt
	CBnww6Eg+qBLFFNt+huyT/A844DBq0cCujD7uUiJurJD9NAZwwEJEzjPNDqyWIuDd8+O3bL24p7CT
	/OniQXNuwUVBEPnbI6bSdItmdSIyf8ueuUtIiq5cQm8MtZIdUxCuXNhksQ6000Owg59p716d8VCbj
	5l2ORwZbit+g9H8C5rNYek6uTisvkN+PnJxZfJ4SQf1/5FqapMCEkmF3yRbHiyG3Hr0RioG9ulm5w
	C42hthO8j+DKOexfLV5byiGXrL//KPJkQV98ONiRcgPYx2T98P9IH3sAvqrg0+2tSCTEoZYnsgbFs
	1dq59bvxKmM1pHr5bQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONIE-0000000Fg3S-0KxZ;
	Wed, 26 Nov 2025 21:43:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONIB-0000000Fg30-2xzz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 21:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99510443B0;
	Wed, 26 Nov 2025 21:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EC8C4CEF7;
	Wed, 26 Nov 2025 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764193394;
	bh=hOrNQuqwLs9HpX+NGhQcIxOyOPGBm6qzJkrnYzen8Og=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bFwMcNF8c8nXGrBt3lcqVsIh2ehDocCqEmlgsB8lulGtp94yxvlaZ2Gt4SVPFboKq
	 69UnISVTzS2U/kEnkW/e0HZrNaWLlpH/9ymwdvitsRSAKNg4QT56jbXgX4Pvbw8ebA
	 IfjATCYR0ZvcFExeeMrqn2f7TdmVnkhMZgtTZs0udr6rrceW67a22ElrKOnO0uEqSz
	 xdWImBogihWMXmZ9hfbg0sfJWMh1JXnE2i/js1nHnEbO8uDXNSJeqF0ZFzUZCd9SMt
	 7am8IwxDK5149+afLj34cdw56KIplcfLBedPT4jChFtvFxBlZJh9qZgSRMesgF5VH5
	 cwe1Ac4VDJCxg==
Date: Wed, 26 Nov 2025 15:43:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, rafael@kernel.org, bhelgaas@google.com,
	alex@shazbot.org, jgg@nvidia.com, will@kernel.org,
	robin.murphy@arm.com, lenb@kernel.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	pjaroszynski@nvidia.com, vsethi@nvidia.com, etzhao1900@gmail.com
Subject: Re: [PATCH v7 5/5] PCI: Suspend iommu function prior to resetting a
 device
Message-ID: <20251126213204.GA2852059@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d2444cc52cf3885bfd5c8d86d5eeea8a5f67df8.1763775108.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_134315_816294_7C0DFB96 
X-CRM114-Status: GOOD (  28.37  )
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

On Fri, Nov 21, 2025 at 05:57:32PM -0800, Nicolin Chen wrote:
> PCIe permits a device to ignore ATS invalidation TLPs while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out: e.g. an SVA domain will have no coordination with a
> reset event and can racily issue ATS invalidations to a resetting device.
> 
> The PCIe r6.0, sec 10.3.1 IMPLEMENTATION NOTE recommends SW to disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.
> 
> The IOMMU subsystem provides pci_dev_reset_iommu_prepare/done() callback
> helpers for this matter. Use them in all the existing reset functions.
> 
> This will attach the device to its iommu_group->blocking_domain during the
> device reset, so as to allow IOMMU driver to:
>  - invoke pci_disable_ats() and pci_enable_ats(), if necessary
>  - wait for all ATS invalidations to complete
>  - stop issuing new ATS invalidations
>  - fence any incoming ATS queries
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci-acpi.c | 13 +++++++--
>  drivers/pci/pci.c      | 65 +++++++++++++++++++++++++++++++++++++-----
>  drivers/pci/quirks.c   | 19 +++++++++++-
>  3 files changed, 87 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index 9369377725fa0..651d9b5561fff 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/init.h>
> +#include <linux/iommu.h>
>  #include <linux/irqdomain.h>
>  #include <linux/pci.h>
>  #include <linux/msi.h>
> @@ -971,6 +972,7 @@ void pci_set_acpi_fwnode(struct pci_dev *dev)
>  int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
>  {
>  	acpi_handle handle = ACPI_HANDLE(&dev->dev);
> +	int ret;
>  
>  	if (!handle || !acpi_has_method(handle, "_RST"))
>  		return -ENOTTY;
> @@ -978,12 +980,19 @@ int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
>  	if (probe)
>  		return 0;
>  
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
>  	if (ACPI_FAILURE(acpi_evaluate_object(handle, "_RST", NULL, NULL))) {
>  		pci_warn(dev, "ACPI _RST failed\n");
> -		return -ENOTTY;
> +		ret = -ENOTTY;
>  	}
>  
> -	return 0;
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
>  }
>  
>  bool acpi_pci_power_manageable(struct pci_dev *dev)
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b14dd064006cc..da0cf0f041516 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/init.h>
> +#include <linux/iommu.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/pci.h>
> @@ -25,6 +26,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pci-ats.h>
>  #include <linux/pci_hotplug.h>
>  #include <linux/vmalloc.h>
>  #include <asm/dma.h>
> @@ -4478,13 +4480,22 @@ EXPORT_SYMBOL(pci_wait_for_pending_transaction);
>   */
>  int pcie_flr(struct pci_dev *dev)
>  {
> +	int ret;
> +
>  	if (!pci_wait_for_pending_transaction(dev))
>  		pci_err(dev, "timed out waiting for pending transaction; performing function level reset anyway\n");
>  
> +	/* Have to call it after waiting for pending DMA transaction */
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
>  	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_BCR_FLR);
>  
>  	if (dev->imm_ready)
> -		return 0;
> +		goto done;
>  
>  	/*
>  	 * Per PCIe r4.0, sec 6.6.2, a device must complete an FLR within
> @@ -4493,7 +4504,10 @@ int pcie_flr(struct pci_dev *dev)
>  	 */
>  	msleep(100);
>  
> -	return pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
> +done:
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pcie_flr);
>  
> @@ -4521,6 +4535,7 @@ EXPORT_SYMBOL_GPL(pcie_reset_flr);
>  
>  static int pci_af_flr(struct pci_dev *dev, bool probe)
>  {
> +	int ret;
>  	int pos;
>  	u8 cap;
>  
> @@ -4547,10 +4562,17 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>  				 PCI_AF_STATUS_TP << 8))
>  		pci_err(dev, "timed out waiting for pending transaction; performing AF function level reset anyway\n");
>  
> +	/* Have to call it after waiting for pending DMA transaction */
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
>  	pci_write_config_byte(dev, pos + PCI_AF_CTRL, PCI_AF_CTRL_FLR);
>  
>  	if (dev->imm_ready)
> -		return 0;
> +		goto done;
>  
>  	/*
>  	 * Per Advanced Capabilities for Conventional PCI ECN, 13 April 2006,
> @@ -4560,7 +4582,10 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>  	 */
>  	msleep(100);
>  
> -	return pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
> +done:
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
>  }
>  
>  /**
> @@ -4581,6 +4606,7 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>  static int pci_pm_reset(struct pci_dev *dev, bool probe)
>  {
>  	u16 csr;
> +	int ret;
>  
>  	if (!dev->pm_cap || dev->dev_flags & PCI_DEV_FLAGS_NO_PM_RESET)
>  		return -ENOTTY;
> @@ -4595,6 +4621,12 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
>  	if (dev->current_state != PCI_D0)
>  		return -EINVAL;
>  
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
>  	csr &= ~PCI_PM_CTRL_STATE_MASK;
>  	csr |= PCI_D3hot;
>  	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
> @@ -4605,7 +4637,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
>  	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
>  	pci_dev_d3_sleep(dev);
>  
> -	return pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
>  }
>  
>  /**
> @@ -5033,10 +5067,20 @@ static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
>  		return -ENOTTY;
>  	}
>  
> +	rc = pci_dev_reset_iommu_prepare(dev);
> +	if (rc) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
> +		return rc;
> +	}
> +
>  	rc = pci_dev_reset_slot_function(dev, probe);
>  	if (rc != -ENOTTY)
> -		return rc;
> -	return pci_parent_bus_reset(dev, probe);
> +		goto done;
> +
> +	rc = pci_parent_bus_reset(dev, probe);
> +done:
> +	pci_dev_reset_iommu_done(dev);
> +	return rc;
>  }
>  
>  static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
> @@ -5060,6 +5104,12 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
>  	if (rc)
>  		return -ENOTTY;
>  
> +	rc = pci_dev_reset_iommu_prepare(dev);
> +	if (rc) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
> +		return rc;
> +	}
> +
>  	if (reg & PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR) {
>  		val = reg;
>  	} else {
> @@ -5074,6 +5124,7 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
>  		pci_write_config_word(bridge, dvsec + PCI_DVSEC_CXL_PORT_CTL,
>  				      reg);
>  
> +	pci_dev_reset_iommu_done(dev);
>  	return rc;
>  }
>  
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index b9c252aa6fe08..c6b999045c70a 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -21,6 +21,7 @@
>  #include <linux/pci.h>
>  #include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
>  #include <linux/init.h>
> +#include <linux/iommu.h>
>  #include <linux/delay.h>
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
> @@ -4228,6 +4229,22 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  	{ 0 }
>  };
>  
> +static int __pci_dev_specific_reset(struct pci_dev *dev, bool probe,
> +				    const struct pci_dev_reset_methods *i)
> +{
> +	int ret;
> +
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = i->reset(dev, probe);
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
> +}
> +
>  /*
>   * These device-specific reset methods are here rather than in a driver
>   * because when a host assigns a device to a guest VM, the host may need
> @@ -4242,7 +4259,7 @@ int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
>  		     i->vendor == (u16)PCI_ANY_ID) &&
>  		    (i->device == dev->device ||
>  		     i->device == (u16)PCI_ANY_ID))
> -			return i->reset(dev, probe);
> +			return __pci_dev_specific_reset(dev, probe, i);
>  	}
>  
>  	return -ENOTTY;
> -- 
> 2.43.0
> 

