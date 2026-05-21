Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8061CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LQMjIQsaCicY2Fa/lpMnojX2PU9qBdlfzsvyl1rTCWE=; b=VeCyiII0zWginR
	KPAiT6KJpdoH6HcLqJOVPDTRoFkWI1btKEgWmQZp8MMDvNR957RHxUAp2FFfW/XodBeGzChZ8zKH0
	t72vdY2wk1u9ANqLwkEQE4DbS9L6vT16tLlY3aLwRGKNsWN61MUZB56wlLQOKzC0lTLrutyh1PHiK
	w/3eeaDcsGWD/lU7zTpKsC3B38Om/RhPoLSbUrIFkWRvoCxJeIrKTvsIilguxmvPVB9+JKBzV7459
	8X9wMxb8xlqH+QFDgnqXGpYQ5EH/Ej5qCr0CE0UL17vmeQSV2xURiflLFCbWPQ5Sc/obJ+lwIivIB
	Ao7zcmrnTSBoEohyhXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQASP-000000094bG-0Isq;
	Thu, 21 May 2026 20:57:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQASM-000000094aZ-2YPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 20:57:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 40D72600FF;
	Thu, 21 May 2026 20:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C1C541F000E9;
	Thu, 21 May 2026 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779397045;
	bh=LQMjIQsaCicY2Fa/lpMnojX2PU9qBdlfzsvyl1rTCWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=O8VJ5uQg8aY08tRXHOgueVfNu0+dKjNarBou83/g4bGTBFpQLuOMwynz6F0LkpNuS
	 f3OVSYTX2s+3CDmP4fL7ApHSbPjGbmqIBWWqaWlULtLD4GsYwjx2r2WEfM8+ulaimW
	 ow5zfwLdy0zVL+ywuyCEj122ecPDiMVpTWuyFilA0nLbYorSOwleBb/RS4JdXiOwBv
	 9fc4iQ5WaDLdQuwc4unGL7bWBd1tgt2SfpYn4ih6CepSCwaB7C/+R4WykCsD9UZrme
	 h3dQcvddREavCmtePS2cVu5RKH1AzmbidMC6/qFYB++dYDAju5j64vYhxSq246oIvs
	 F7nVU1N8gNAEA==
Date: Thu, 21 May 2026 15:57:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, praan@google.com, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dan.j.williams@intel.com, jonathan.cameron@huawei.com,
	vsethi@nvidia.com, linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 1/3] PCI: Add pci_ats_required() for CXL.cache capable
 devices
Message-ID: <20260521205723.GA184317@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05044d2113e20d81f96677ba53605311662b6b10.1779392420.git.nicolinc@nvidia.com>
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

On Thu, May 21, 2026 at 01:34:20PM -0700, Nicolin Chen wrote:
> Controlled by IOMMU drivers, ATS can be enabled "on demand", when a given
> PASID on a device is attached to an I/O page table. This is working, even
> when a device has no translation on its RID (i.e., RID is IOMMU bypassed).
> 
> However, certain PCIe devices require non-PASID ATS on their RID even when
> the RID is IOMMU bypassed. Call this "ATS always on" in IOMMU term.
> 
> For example, CXL spec r4.0 notes in sec 3.2.5.13 Memory Type on CXL.cache:
>  "To source requests on CXL.cache, devices need to get the Host Physical
>   Address (HPA) from the Host by means of an ATS request on CXL.io."
> 
> In other words, the CXL.cache capability requires ATS; otherwise, it can't
> access host physical memory.
> 
> Introduce a new pci_ats_required() helper for the IOMMU driver to scan a
> PCI device and shift ATS policies between "on demand" and "always on".
> 
> Add the support for CXL.cache devices first. Pre-CXL devices will be added
> in quirks.c file.
> 
> Note that pci_ats_required() validates against pci_ats_supported(), so we
> ensure that untrusted devices (e.g. external ports) will not be always on.
> This maintains the existing ATS security policy regarding potential side-
> channel attacks via ATS.
> 
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Vikram Sethi <vsethi@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Nirmoy Das <nirmoyd@nvidia.com>
> Acked-by: Nirmoy Das <nirmoyd@nvidia.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ...

> +bool pci_ats_required(struct pci_dev *pdev)
> +{
> +	if (!pci_ats_supported(pdev))
> +		return false;
> +
> +	/* A VF inherits its PF's requirement for ATS function */
> +	if (pdev->is_virtfn)
> +		pdev = pci_physfn(pdev);
> +
> +	return pci_cxl_ats_required(pdev);

I acked this before I saw this sashiko feedback, which looks like a
legit issue to me:

  Will this VF inheritance logic ever be reached?

  According to the PCIe SR-IOV specification (section 9.3.3.1), VFs do
  not implement the ATS Extended Capability, which means pdev->ats_cap
  is always 0 for VFs.

  Because of this, pci_ats_supported(pdev) will unconditionally return
  false for any VF. This causes the function to return false before it
  can ever reach the pdev->is_virtfn check.

  Could this prevent VFs from correctly enabling the ATS always on
  feature and leave them unable to access host memory without
  triggering IOMMU faults?

(From https://sashiko.dev/#/patchset/cover.1779304390.git.nicolinc%40nvidia.com)

I withdraw my ack for now until we figure out if it's a real issue.

> +}
> +EXPORT_SYMBOL_GPL(pci_ats_required);
> +
>  #ifdef CONFIG_PCI_PRI
>  void pci_pri_init(struct pci_dev *pdev)
>  {
> -- 
> 2.43.0
> 

