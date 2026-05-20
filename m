Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111C6CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pB+/av6+zwTO/il0Tm1fN1elFOtl5JYsJPfYTyl/TQI=; b=fRaWORddF6oeV3
	j/0FjiGza7QqXonaYgC37MGHS+uIT+OvHnGk4dtjlrm2bWwdJ5MYa1TCXUxzi/eojjvUYSvn3ttUD
	QmyLisFybpiJ8RHa1IFB0T+QOhvHRF5icjvCKHqADIm+/Jv799VcEr1peV0h0W/EnxMrkKqqNpxmO
	Ll0F+gtPwLhLc9mUitJxT8QsooP7gaZesEEEuMYPM0KReCP9tD8De6RvntemyBpywEXhm+GlPg8rF
	Tp9rVXCqXNLOMAiEeE6ft5DHPFvuML9GHLX1NEO4zCzT2DRoZHg8uxvrnI4bcZoEVDlLHj10QVlPe
	9X2sPy09hS4Fa4XV4Q6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPn8c-00000005gju-3LMB;
	Wed, 20 May 2026 20:03:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPn8b-00000005gjc-1EQY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:03:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id B843360215;
	Wed, 20 May 2026 20:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 43D771F0089A;
	Wed, 20 May 2026 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779307408;
	bh=pB+/av6+zwTO/il0Tm1fN1elFOtl5JYsJPfYTyl/TQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ZSUN4DMIajb4CdwzbusdNFtJPyQFXD3Q9CMCttw1tXxjl29FumFp0AB2nDwBwY19s
	 FsWL/DVWTrBLuhuXQ/kz+9dToMcVmBaviE/zEDvggvIpM8yEa5R4voNA+8/poR+oEW
	 psVczGEdXZuUphW2KQ4sV2S7WEeg513TX/k6zlUflqGYXrhuSObg6z/1v2NOU/20DV
	 6RgbOlRk97pdH0ilD8c6g2Y5qyzbe03hF7LDDl1kST2UKhs7oAbPawFkb3YCtdgVmU
	 Ye1aUeYimoxYnVlknyxto30HqW3Eisf4nm4j5BH0K8vui0rQ/nfEKXiYqGymxA5WFT
	 QxJBmojNqNEUw==
Date: Wed, 20 May 2026 15:03:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, bhelgaas@google.com,
	robin.murphy@arm.com, praan@google.com, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dan.j.williams@intel.com, jonathan.cameron@huawei.com,
	vsethi@nvidia.com, linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v5 1/3] PCI: Add pci_ats_required() for CXL.cache capable
 devices
Message-ID: <20260520200327.GA88349@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e01e6d39deff2bf751da3e1abb43f35a9169194.1779304390.git.nicolinc@nvidia.com>
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

On Wed, May 20, 2026 at 12:46:08PM -0700, Nicolin Chen wrote:
> Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> given PASID on a device is attached to an I/O page table. This is working
> even when a device has no translation on its RID (i.e., the RID is IOMMU
> bypassed).
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
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

One lingering question below that I asked before but I don't think
anybody answered.

> ---
>  include/linux/pci-ats.h       |  3 +++
>  include/uapi/linux/pci_regs.h |  1 +
>  drivers/pci/ats.c             | 46 +++++++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index 75c6c86cf09dc..f3723b6861294 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -12,6 +12,7 @@ int pci_prepare_ats(struct pci_dev *dev, int ps);
>  void pci_disable_ats(struct pci_dev *dev);
>  int pci_ats_queue_depth(struct pci_dev *dev);
>  int pci_ats_page_aligned(struct pci_dev *dev);
> +bool pci_ats_required(struct pci_dev *dev);
>  #else /* CONFIG_PCI_ATS */
>  static inline bool pci_ats_supported(struct pci_dev *d)
>  { return false; }
> @@ -24,6 +25,8 @@ static inline int pci_ats_queue_depth(struct pci_dev *d)
>  { return -ENODEV; }
>  static inline int pci_ats_page_aligned(struct pci_dev *dev)
>  { return 0; }
> +static inline bool pci_ats_required(struct pci_dev *dev)
> +{ return false; }
>  #endif /* CONFIG_PCI_ATS */
>  
>  #ifdef CONFIG_PCI_PRI
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 14f634ab9350d..6ac45be1008b8 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -1349,6 +1349,7 @@
>  /* CXL r4.0, 8.1.3: PCIe DVSEC for CXL Device */
>  #define PCI_DVSEC_CXL_DEVICE				0
>  #define  PCI_DVSEC_CXL_CAP				0xA
> +#define   PCI_DVSEC_CXL_CACHE_CAPABLE			_BITUL(0)
>  #define   PCI_DVSEC_CXL_MEM_CAPABLE			_BITUL(2)
>  #define   PCI_DVSEC_CXL_HDM_COUNT			__GENMASK(5, 4)
>  #define  PCI_DVSEC_CXL_CTRL				0xC
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index ec6c8dbdc5e9c..ebdf761843867 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -205,6 +205,52 @@ int pci_ats_page_aligned(struct pci_dev *pdev)
>  	return 0;
>  }
>  
> +/*
> + * CXL r4.0, sec 3.2.5.13 Memory Type on CXL.cache notes: to source requests on
> + * CXL.cache, devices need to get the Host Physical Address (HPA) from the Host
> + * by means of an ATS request on CXL.io.
> + *
> + * In other words, CXL.cache devices cannot access host physical memory without
> + * ATS.
> + *
> + * Check Cache_Capable instead of Cache_Enable because CXL.cache may be enabled
> + * after the caller uses this to make its ATS decision.
> + */
> +static bool pci_cxl_ats_required(struct pci_dev *pdev)
> +{
> +	int offset;
> +	u16 cap;
> +
> +	offset = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
> +					   PCI_DVSEC_CXL_DEVICE);
> +	if (!offset)
> +		return false;
> +
> +	if (pci_read_config_word(pdev, offset + PCI_DVSEC_CXL_CAP, &cap))
> +		return false;
> +
> +	return cap & PCI_DVSEC_CXL_CACHE_CAPABLE;
> +}
> +
> +/**
> + * pci_ats_required - Whether the PCI device requires ATS
> + * @pdev: the PCI device
> + *
> + * Returns true, if the PCI device requires ATS for basic functional operation.
> + */
> +bool pci_ats_required(struct pci_dev *pdev)
> +{
> +	if (pci_ats_disabled() || !pci_ats_supported(pdev))
> +		return false;

I still have the question about whether it's necessary to test
pci_ats_disabled() here.  I think pci_ats_supported() should return
false if pci_ats_disabled() returns true.

> +	/* A VF inherits its PF's requirement for ATS function */
> +	if (pdev->is_virtfn)
> +		pdev = pci_physfn(pdev);
> +
> +	return pci_cxl_ats_required(pdev);
> +}
> +EXPORT_SYMBOL_GPL(pci_ats_required);
> +
>  #ifdef CONFIG_PCI_PRI
>  void pci_pri_init(struct pci_dev *pdev)
>  {
> -- 
> 2.43.0
> 

