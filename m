Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0414B10AB82A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=H0Xo//S51N13/KGq+sMWaL0MVDuxiwCfI+x+k81AoUI=; b=CGmA5a9DJjZYuj
	kYqHULWTLrkdb0lShjZqQXzXjFg+Z3dxMa1at7kUczD63yXRcQ9BwGXM5IXSXMHkO9+H/9zdxbtf3
	m0OS99febSuIDxKKqLbFhHgHIWbsGuk5HIY9EE4rZwjtLvgLX97gn9PTZNhP1UK1OE7csqL76Gv4Y
	znkMkR2L8SEQGdVTNOWAW0GhOiOe/ocMCIgVPop8P8pV0DdcxD62amRKzyRP2UIbTaGw9xIU2Cufl
	ShgiS90EYJIsGSe3A0hdVACZvm+oYlACJvXIc3ixnkjgJHNYk1jaZVH2j3SOesVBk+5E14NWhb/H6
	k4kcOQk6RJra7/xkgR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sPq-00000006GJq-3zPV;
	Thu, 26 Mar 2026 21:38:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sPp-00000006GJZ-0zET
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 21:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 528CF60054;
	Thu, 26 Mar 2026 21:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00AEC116C6;
	Thu, 26 Mar 2026 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774561136;
	bh=jwsS1BIDUjEh2JcOLMGWa6P9hXlTnFsjvQU1cKg74sI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gNFQ8+yA0iV42+u/1nLa9TFsqd2jFnZBz2YCSsmPg13bYQaf26o48Mt8GvHkBOCw7
	 k7ntWpcEHz/I4GvrsMPfg5S5Sy3sGcsH4PV5D+k8iMHs7lD2VW+OSaR3uctOiYWuZH
	 9USdHUrv4kIUHcsnXqzvr8P4LEFhkYb4JbehD2jBAsN6Z9iHgZHuX8qIHnTSsOEje9
	 0tZkPRtoXTSMKtKfD5B1OCnpLaL2IKX8bg9HrvmbDKQc2vDIBhj/En5cV+mIHQuWZH
	 42vVeJsoO2oLJb8VOdDAJByl1ufhTqTZZkNCX0VTbNjn0YQ9f8yxDVcnwkL1X4Bvf0
	 hckYQN3z50qDg==
Date: Thu, 26 Mar 2026 16:38:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260326213854.GA1348488@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0dd3e4cc5260f55bbec5b3ed6791def33028735.1772833963.git.nicolinc@nvidia.com>
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

On Fri, Mar 06, 2026 at 03:41:15PM -0800, Nicolin Chen wrote:
> Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> device requests a translation service from its associated IOMMU HW running
> on the channel of a given PASID. This is working even when a device has no
> translation on its RID (i.e., the RID is IOMMU bypassed).
> 
> However, certain PCIe devices require non-PASID ATS on their RID even when
> the RID is IOMMU bypassed. Call this "always on".
> 
> For instance, the CXL spec notes in "3.2.5.13 Memory Type on CXL.cache":
> "To source requests on CXL.cache, devices need to get the Host Physical
> Address (HPA) from the Host by means of an ATS request on CXL.io."

Add CXL spec rev, e.g., "CXL r4.0, sec 3.2.5.13"

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

I don't think this really has anything to do with the PCI core.
pci_ats_always_on() doesn't *do* anything with a PCI device; it just
looks for PCI_DVSEC_CXL_CACHE_CAPABLE, and the caller figures out what
to do with the result.  This doesn't make the PCI core turn on ATS
automatically by itself, and the PCI core doesn't care whether the
IOMMU driver always enables ATS.

It's only called from arm-smmu-v3.c.  Is there something unique about
SMMU, or will other IOMMUs need something similar?

> +++ b/drivers/pci/ats.c
> @@ -205,6 +205,48 @@ int pci_ats_page_aligned(struct pci_dev *pdev)
>  	return 0;
>  }
>  
> +/*
> + * CXL r4.0, sec 3.2.5.13 Memory Type on CXL.cache notes: to source requests on
> + * CXL.cache, devices need to get the Host Physical Address (HPA) from the Host
> + * by means of an ATS request on CXL.io.
> + *
> + * In other world, CXL.cache devices cannot access host physical memory without
> + * ATS.

s/other world/other words/

