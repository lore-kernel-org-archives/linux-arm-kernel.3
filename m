Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ECBCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORjmM8N4yD/rbNjlEVVF81Wa25kia5y9JaZc6HWpof0=; b=qsI5uEBeIGc4uRteGO4FqhgB+t
	sLwn379+FhLwxyyIsbiMlmV3QJaxym1d8XhzXYK+c7XJuBq8YWqiv/aL+LbvnMeYV+74Kddxq7Drv
	CQzC9FcwLu1Pr7kYtItH2KbOzR7a2VsvxsNRzdMmUxIUYSx4/03lF9gcN0NdbLLHEHsT5UHZBKXIW
	L+q8uP2tNtxGkc2APQamAbdvjUoqK2+JTxgC2ymHjYNdOiScv+M/E0OTmRgSvStZCziBw18JAmri6
	o/XRNfZBTepdsHiyARGqZ1SG68qjks4ItTLlqPYLO0wUEDCBSp2uvyBLRnkQpV0nni/TwIGbHfWhW
	z2IlLv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAGC-00000004iMb-0S75;
	Mon, 15 Sep 2025 14:32:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAGA-00000004iMM-3WP9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FAA660244;
	Mon, 15 Sep 2025 14:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE6EC4CEF1;
	Mon, 15 Sep 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946769;
	bh=+j3LayYJxSUBw9F3gG4AuqtZ1v7+7hcjLS4AmZM8N4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Quuka+LVbaND7romyzfJB2qnudKUfkDXh2lPjp8Y28fo3/4i7zput13t9nqfMfmah
	 kXMLOVUCLRExsL9yQCQ1xUBciPjsOGaclAc8ojd0N8DS4frzpb8rbtZ+YV4RPp5+NA
	 IQYhg/i5/AWhAtaH8aigXVHWiQ+SbNNoaTx+qvuUykmBV8eWHYMdCw7H84/6T84/vL
	 dVFDKeqoIncoe5AyQqLsgC2+ODvlCReVtkW7uQ+DvjWAuWk3scxjjhzsTS0Ox8Qhev
	 XuFcOhajEC8TvbMEbQwfXOtrfck6fDTWKkuhaRblNsCJ6BLQIIu5XFRNp3QAUEzBnL
	 rr9qm8yD+OQOg==
Date: Mon, 15 Sep 2025 20:02:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
Message-ID: <hxaj7c6siernov3qb36rmxpcpdbq6gilaejc27eij4iyqdzuzc@jt76e6vdkbdo>
References: <20250909-controller-dwc-ecam-v9-3-7d5b651840dd@kernel.org>
 <20250912214432.GA1643354@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912214432.GA1643354@bhelgaas>
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

On Fri, Sep 12, 2025 at 04:44:32PM GMT, Bjorn Helgaas wrote:
> Sorry, I missed your repost of this series, Mani.  I'll reiterate my
> questions here.
> 
> I also deleted the pci/controller/dwc-ecam branch, where Krishna's v8
> series was queued up, to avoid confusion (it looked like that branch
> was ready to be included in linux-next, but it's not).
> 
> On Tue, Sep 09, 2025 at 12:37:52PM +0530, Manivannan Sadhasivam wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > To support the DWC ECAM mechanism, prepare the driver by performing below
> > configurations:
> > 
> >   1. Since the ELBI region will be covered by the ECAM 'config' space,
> >      override the 'elbi_base' with the address derived from 'dbi_base' and
> >      the offset from PARF_SLV_DBI_ELBI register.
> > 
> >   2. Block the transactions from the host bridge to devices other than Root
> >      Port on the root bus to return all F's. This is required when the 'CFG
> >      Shift Feature' of iATU is enabled.
> 
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> 
> > +static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > +	u64 addr, addr_end;
> > +	u32 val;
> > +
> > +	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
> > +	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
> > +
> > +	/*
> > +	 * The only device on root bus is a single Root Port. So if PCI core
> > +	 * tries to access any devices other than Device/Function (0.0) in Bus
> > +	 * 0, the TLP will go outside of the controller to the PCI bus. But with
> > +	 * CFG Shift Feature (ECAM) enabled in iATU, there is no guarantee that
> > +	 * the response is going to be all F's. Hence, to make sure that the
> > +	 * requester gets all F's response for accesses other than the Root
> > +	 * Port, configure iATU to block the transactions starting from function
> > +	 * 1 of the root bus to the end of the root bus (i.e from dbi_base + 4kb
> > +	 * to dbi_base + 1MB).
> > +	 */
> > +	addr = pci->dbi_phys_addr + SZ_4K;
> > +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
> > +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
> > +
> > +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
> > +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
> > +
> > +	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
> > +
> > +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
> > +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
> > +
> > +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
> > +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
> > +
> > +	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
> > +	val |= PCIE_ECAM_BLOCKER_EN;
> > +	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
> 
> The driver already supported ECAM in the existing "firmware_managed"
> path (which looks untouched by this series and doesn't do any of this
> iATU configuration).
> 

'firmware_managed' refers to the Qcom platforms supporting BIOS/bootloader that
has initialized the PCIe controller and configured ECAM mode. The driver doesn't
need to do any resource handling on its own including iATU as everything would
be handled by the BIOS/bootloader. This mode is used by the Qcom Automotive
SoCs.

And This mode is different from the DWC ECAM mode implemented in this series as
this one requires doing all iATU configuration in the driver itself. This mode
will be used by the Mobile/IoT/Compute SoCs.

Qcom SoCs have different requirement for different market segments. This is the
reason why we have many different implementations.

> And IIUC, this series adds support for ECAM whenever the DT 'config'
> range is sufficiently aligned.  In this new ECAM support, it looks
> like we look for and pay attention to 'bus-range' in this path:
> 
>   qcom_pcie_probe
>     dw_pcie_host_init
>       devm_pci_alloc_host_bridge
>         devm_of_pci_bridge_init
>           pci_parse_request_of_pci_ranges
>             devm_of_pci_get_host_bridge_resources
>               of_pci_parse_bus_range
>                 of_property_read_u32_array(node, "bus-range", ...)
>       dw_pcie_host_get_resources
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config")
>         pp->ecam_enabled = dw_pcie_ecam_enabled(pp, res)
> 
> Since qcom_pci_config_ecam() doesn't look at the root bus number at
> all, is this also an implicit restriction that the root bus must be
> bus 0?  Does qcom support root buses other than 0?
> 

No, not at the moment.

> > +}
> > +
> >  static int qcom_pcie_start_link(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > @@ -326,6 +382,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
> >  		qcom_pcie_common_set_16gt_lane_margining(pci);
> >  	}
> >  
> > +	if (pci->pp.ecam_enabled)
> > +		qcom_pci_config_ecam(&pci->pp);
> 
> qcom_pcie_start_link() seems like a strange place to do this
> ECAM-related iATU configuration.  ECAM is a function of the host
> bridge, not of any particular Root Port or link.
> 

I thought qcom_pci_config_ecam() needs to be called after
dw_pcie_config_ecam_iatu() and before pci_host_probe() in dw_pcie_host_init().
Since there were no other callbacks in-between other than this start_link()
callback, Krishna has called it from here.

But looks like qcom_pci_config_ecam() could be called before
dw_pcie_config_ecam_iatu() as replied by Krishna [1]. So I will move it to
qcom_pcie_host_init().

- Mani

[1] https://lore.kernel.org/linux-pci/d12e002b-e99e-4963-a732-4873e13c5419@oss.qualcomm.com

-- 
மணிவண்ணன் சதாசிவம்

