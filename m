Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81952CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 19:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9zWCT6L164MPpYxvYUUjyVKQRnNx7/uPmsbeHhH1oG0=; b=uycSqPMw++3aog
	wXXkf8h8vOZk4dJQGEREM1Q/6+sJOBwoXO0+rVx7vRfrWcL1F/jIcZr/pVnCMPZAsRLLudcT+bYRh
	Y9AJ8Arl5uw0z3RzXvkV2TlWTMyL3h3O9Vbv56+dz6RAc5xs48J+xQ9m8yZSVTMfcr8iY7sXXq6nJ
	2RHy8mhOesVAFugtz6SUY/Hjag4SGxmViUEmEDibH0nTiXHQ8e/VkFg+2AlRJa1c/deddYND2JzZO
	IcixeV12Ov3DGJ87ec1Ayg6qApou6iBKVorHjuRkdifDgXdJEQLIIIlyaLaykO1ffS4pt/ArjWN0U
	NPvSJrqLVBXv7NozC4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQFK-00000002dTZ-1xfM;
	Tue, 19 May 2026 19:36:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQFI-00000002dT8-0NaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 19:36:53 +0000
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 5958A43DBA;
	Tue, 19 May 2026 19:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 05A641F000E9;
	Tue, 19 May 2026 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779219411;
	bh=9zWCT6L164MPpYxvYUUjyVKQRnNx7/uPmsbeHhH1oG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=hOBYQZpO0e5XVVO2zoVjayrxSbwRpUYoEspSmgSZEssnaM0rlFey8b0rrdN6hHa/S
	 YYHhOnIlzQfHOHq4vRYUL1BJ+81JZJXEpIIeUGJAK1kgsruLHfVECy0Q12LHNTXv1x
	 h8bzSY2wPKz+tS7IArsZYnRqR2Te7xVKbARE9af8YXEIa4nUNtOQw8SuXYjczAq9RG
	 2zE7IJm0aQdh0Kw+LDghyeoGwhLxf0S5zO5weZuODHmeteQ2M1O7yMZfN9vxn5V+wD
	 kYzFQvjTFbDXdS+rlXFCYjnZX5aFo2ckcyEkdz6NZO0E88o2gwwt4dxTvgll+cv5Jq
	 i92uvT88ytZUQ==
Date: Tue, 19 May 2026 14:36:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260519193649.GA715262@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_123652_167781_C6FA8F9D 
X-CRM114-Status: GOOD (  24.95  )
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

On Sun, Apr 26, 2026 at 10:54:00PM -0700, Nicolin Chen wrote:
> Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> given PASID on a device is attached to an I/O page table. This is working
> even when a device has no translation on its RID (i.e., the RID is IOMMU
> bypassed).
> 
> However, certain PCIe devices require non-PASID ATS on their RID even when
> the RID is IOMMU bypassed. Call this "always on".
> 
> For example, CXL spec r4.0 notes in sec 3.2.5.13 Memory Type on CXL.cache:
>  "To source requests on CXL.cache, devices need to get the Host Physical
>   Address (HPA) from the Host by means of an ATS request on CXL.io."
> 
> In other words, the CXL.cache capability requires ATS; otherwise, it can't
> access host physical memory.
> 
> Introduce a new pci_ats_always_on() helper for the IOMMU driver to scan a
> PCI device and shift ATS policies between "on demand" and "always on".
> 
> Add the support for CXL.cache devices first. Pre-CXL devices will be added
> in quirks.c file.
> 
> Note that pci_ats_always_on() validates against pci_ats_supported(), so we
> ensure that untrusted devices (e.g. external ports) will not be always on.
> This maintains the existing ATS security policy regarding potential side-
> channel attacks via ATS.

IMO this doesn't really fit in the PCI core.  ats.c encapsulates
discovery and provides interfaces to access the ATS Capability, but
the users of those interfaces are all outside the PCI core.

The decision to enable enable ATS for CXL.cache devices is fine but
it's really an IOMMU usage policy, and I think it should be
implemented in the IOMMU core.  All the pieces needed
(pci_ats_disabled(), pci_ats_supported(), pci_find_dvsec_capability())
are already exported.

One motivation for putting this in the PCI core was to use the quirk
infrastructure, but this series doesn't use any of that.  It doesn't
declare any fixups, e.g., DECLARE_PCI_FIXUP_FINAL, and it doesn't
update any state cached by the PCI core.

> +++ b/include/uapi/linux/pci_regs.h
> @@ -1349,6 +1349,7 @@
>  /* CXL r4.0, 8.1.3: PCIe DVSEC for CXL Device */
>  #define PCI_DVSEC_CXL_DEVICE				0
>  #define  PCI_DVSEC_CXL_CAP				0xA
> +#define   PCI_DVSEC_CXL_CACHE_CAPABLE			_BITUL(0)

This makes good sense, I'm fine with adding
PCI_DVSEC_CXL_CACHE_CAPABLE.

> +bool pci_ats_always_on(struct pci_dev *pdev)
> +{
> +	if (pci_ats_disabled() || !pci_ats_supported(pdev))
> +		return false;

Isn't this the same as:

  if (!pci_ats_supported(pdev))
    return false;

If pci_ats_disabled(), dev->ats_cap should be zero, so
pci_ats_supported() should always return false.

> +
> +	/* A VF inherits its PF's requirement for ATS function */
> +	if (pdev->is_virtfn)
> +		pdev = pci_physfn(pdev);
> +
> +	return pci_cxl_ats_always_on(pdev);
> +}
> +EXPORT_SYMBOL_GPL(pci_ats_always_on);

