Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C210DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CQEO+SGF92d104qkxIO2rXj+VmRRYkDU1RtTFwuKono=; b=AHNPDxy2MaB4ny
	xXo7Sv4UEu/YIIoPyGTrSjkK0N1ifEa+wgh2B0N6GzsPlUwAMhUL14EbMx4i49pKs2x9hFwZOlAcs
	40WvzzVCJQC/SysAZ7uro0rrArQkIPEm+OyRnOO4C6EVYMimhiVcQAxq/PQq91gaQBQsDuvFpyi/z
	MQ7+G7GONqAum8vokV5aptrPhv1iXBFEOBQ6tLj2UY1RDXdwoBSOcECeSU7t1t6gFFin/G3mLVju0
	tJvxDN+t9lDtd8ENQGuOtSwloUdCOiSrmz/rUAdpGbiTAzLtgA6fLHmbnVd8cNsXE03pr8gLu2e+S
	SRsAZ3alr65RrGNWNHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBZO-0000000Bh44-0Js6;
	Fri, 12 Sep 2025 21:44:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBZK-0000000Bh27-3KI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 21:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B930D442D5;
	Fri, 12 Sep 2025 21:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1A8C4CEF1;
	Fri, 12 Sep 2025 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757713473;
	bh=6UKL5HC+zU7YTOzkHx8luGmERQO7nrAOzQQrNjTkAJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hZNnGh5Pn06b2AoeIWYn4VmJHdZU4hvJ3EcLY0ki9vPN5xFvR6VyhIXQCqM41ApNT
	 Zed+cf/ZelcW9juAhbwF7aMgXsJDoeAESfDBfm2Ed75qXD4DLILzYqyB0lsY4adviy
	 v4+zLmcyEcrsimYdIAznAclnxu33/TSHic1p3xgvlcHEBz2I2e21o7xniruc1K678V
	 Qh3+llXJq93ZXz1ypZeGaNKnadnxt6NNeF7XgYTgGKYtP04g2XU0wUKA5j2HKkbVEM
	 Y3RgJHdupJArCAQC6nTvTnDfEw1wqAC5+1KHv4ohRyAtrW0F/jx0Po9kL/omv8HPTU
	 /VOC52wgsnC6A==
Date: Fri, 12 Sep 2025 16:44:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
Message-ID: <20250912214432.GA1643354@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-controller-dwc-ecam-v9-3-7d5b651840dd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_144434_884091_D0F4A1F3 
X-CRM114-Status: GOOD (  24.59  )
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

Sorry, I missed your repost of this series, Mani.  I'll reiterate my
questions here.

I also deleted the pci/controller/dwc-ecam branch, where Krishna's v8
series was queued up, to avoid confusion (it looked like that branch
was ready to be included in linux-next, but it's not).

On Tue, Sep 09, 2025 at 12:37:52PM +0530, Manivannan Sadhasivam wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> To support the DWC ECAM mechanism, prepare the driver by performing below
> configurations:
> 
>   1. Since the ELBI region will be covered by the ECAM 'config' space,
>      override the 'elbi_base' with the address derived from 'dbi_base' and
>      the offset from PARF_SLV_DBI_ELBI register.
> 
>   2. Block the transactions from the host bridge to devices other than Root
>      Port on the root bus to return all F's. This is required when the 'CFG
>      Shift Feature' of iATU is enabled.

> +++ b/drivers/pci/controller/dwc/pcie-qcom.c

> +static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u64 addr, addr_end;
> +	u32 val;
> +
> +	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
> +	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
> +
> +	/*
> +	 * The only device on root bus is a single Root Port. So if PCI core
> +	 * tries to access any devices other than Device/Function (0.0) in Bus
> +	 * 0, the TLP will go outside of the controller to the PCI bus. But with
> +	 * CFG Shift Feature (ECAM) enabled in iATU, there is no guarantee that
> +	 * the response is going to be all F's. Hence, to make sure that the
> +	 * requester gets all F's response for accesses other than the Root
> +	 * Port, configure iATU to block the transactions starting from function
> +	 * 1 of the root bus to the end of the root bus (i.e from dbi_base + 4kb
> +	 * to dbi_base + 1MB).
> +	 */
> +	addr = pci->dbi_phys_addr + SZ_4K;
> +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
> +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
> +
> +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
> +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
> +
> +	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
> +
> +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
> +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
> +
> +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
> +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
> +
> +	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
> +	val |= PCIE_ECAM_BLOCKER_EN;
> +	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);

The driver already supported ECAM in the existing "firmware_managed"
path (which looks untouched by this series and doesn't do any of this
iATU configuration).

And IIUC, this series adds support for ECAM whenever the DT 'config'
range is sufficiently aligned.  In this new ECAM support, it looks
like we look for and pay attention to 'bus-range' in this path:

  qcom_pcie_probe
    dw_pcie_host_init
      devm_pci_alloc_host_bridge
        devm_of_pci_bridge_init
          pci_parse_request_of_pci_ranges
            devm_of_pci_get_host_bridge_resources
              of_pci_parse_bus_range
                of_property_read_u32_array(node, "bus-range", ...)
      dw_pcie_host_get_resources
        res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config")
        pp->ecam_enabled = dw_pcie_ecam_enabled(pp, res)

Since qcom_pci_config_ecam() doesn't look at the root bus number at
all, is this also an implicit restriction that the root bus must be
bus 0?  Does qcom support root buses other than 0?

> +}
> +
>  static int qcom_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> @@ -326,6 +382,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
>  		qcom_pcie_common_set_16gt_lane_margining(pci);
>  	}
>  
> +	if (pci->pp.ecam_enabled)
> +		qcom_pci_config_ecam(&pci->pp);

qcom_pcie_start_link() seems like a strange place to do this
ECAM-related iATU configuration.  ECAM is a function of the host
bridge, not of any particular Root Port or link.

>  	/* Enable Link Training state machine */
>  	if (pcie->cfg->ops->ltssm_enable)
>  		pcie->cfg->ops->ltssm_enable(pcie);

