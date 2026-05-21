Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6830CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tq+kuMc+QiIEzKRijb2ZvXgAy//G+v1mhZJfU/LS4n0=; b=DlQuFI2unbx/xf
	C0SNArhOeuLXwpabHwA1zuQyQkJUYWN3e9vH5WtdhMnWctjPz3x+Sz1GZbIFwiza635YOJQe01Ldr
	g4fpUTczZtgvp3rX5hKM/ASH3NuSthbLH5GUmaRb3VOxdc/YpcOZnIggKvQsFyYn3NNAncfqYYdbZ
	0RBlXmk4KB2zmiNbuJCyz9pV0395DSAxMvfVe5LRjpa7evltVNkvp7NXKkFDMCgkLbrNawxlQYOGO
	bCnxHj649fT7l8e7QpPIpqdrR8vIo8nvwi6Rtx5w+235Z4mMR7kD5izyTt/GI6lREFHF0jUUI2Pj9
	klnRK8bAH59L1C4iBM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAzI-000000098Q6-3lQs;
	Thu, 21 May 2026 21:31:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAzI-000000098Pe-0Jlh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 21:31:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 734FE60122;
	Thu, 21 May 2026 21:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F39AD1F000E9;
	Thu, 21 May 2026 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779399085;
	bh=tq+kuMc+QiIEzKRijb2ZvXgAy//G+v1mhZJfU/LS4n0=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Tv8O9OLXEPBkfCCuuxsSqZS+6Bsb+7fPrUiD2mA4bm6j9P1ujSYv9AU93zw5qh9Yv
	 1T3V+gyCtSG/9uFWAY5zyg1bUu7FsDjM3owiTX5V3qoE9jPHrUIHCb0ZImi6hTBjwt
	 nviCpsUO40DOCMDmk+GREpA2xkVp71W+3ghkN4g2hTJBPH53VBjqsrxuAlB2BcC/ys
	 wS6hZFXvXeQN4W5CAzz+r6AqBAKCVdDRbarASPAJIzrAFJ5b6BNHjpfkUW4hZRDGf9
	 Oaov6wCYIhtV+2Z/Ek/gmOiB/Bw+pm7clsGqUhwILoOKHSUtj9nZv90dG5qeUHXVHL
	 trRrOwr0MSfhw==
Date: Thu, 21 May 2026 16:31:23 -0500
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
Message-ID: <20260521213123.GA186424@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag90FlOaljwa0qqU@Asurada-Nvidia>
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

On Thu, May 21, 2026 at 02:07:34PM -0700, Nicolin Chen wrote:
> On Thu, May 21, 2026 at 03:57:23PM -0500, Bjorn Helgaas wrote:
> > On Thu, May 21, 2026 at 01:34:20PM -0700, Nicolin Chen wrote:
> > > +bool pci_ats_required(struct pci_dev *pdev)
> > > +{
> > > +	if (!pci_ats_supported(pdev))
> > > +		return false;
> > > +
> > > +	/* A VF inherits its PF's requirement for ATS function */
> > > +	if (pdev->is_virtfn)
> > > +		pdev = pci_physfn(pdev);
> > > +
> > > +	return pci_cxl_ats_required(pdev);
> > 
> > I acked this before I saw this sashiko feedback, which looks like a
> > legit issue to me:
> > 
> >   Will this VF inheritance logic ever be reached?
> > 
> >   According to the PCIe SR-IOV specification (section 9.3.3.1), VFs do
> >   not implement the ATS Extended Capability, which means pdev->ats_cap
> >   is always 0 for VFs.

Huh.  I wish sashiko would include the spec revision because that sure
looks wrong.  In PCIe r7.0, there is no sec 9.3.3.1.  In PCIe r6.0,
sec 9.3.3.1 is the SR-IOV Extended Capability, which doesn't mention
ATS.  In both, sec 10.5.1 is the ATS Extended Capability and says both
PFs and VFs can implement it.

So I think this is OK as-is:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

