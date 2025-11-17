Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACD2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IvsxRVLcGKJoRuYe6BVzM2nibqC1hRTF+F5p3P43kuU=; b=DBJ+HN1CTgSdQG
	wtxS9NQcDguuKpSGdN9bwGWLm5w/id33JkERpTYe/taCjNIImtNRX12DWqTrAoJPwU7Zve1LaFaKf
	WojoBijRbGCOQZTxQP+O+NEg6mA0vI5DljOSZ9W7bi6mHaWECHHkI77ze8RRzau1/uQXiMJUjS831
	pctVM8r7a1ryA3xn+OBnOHOhLAse6Q5nMNi5FutMKklQbVnNVPPm+5h4BLTQauXi8IBYbEwOPzTNb
	+zawEpfj3+EMl4YQEmiwh6Wp5QwxQ7DAIxoDfz4oe+ywLzGdza90fWS33S+R2GpQGi8ytWOZyh3a8
	gar356tMosSPhCPXwhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8BW-0000000Gysw-0cI3;
	Mon, 17 Nov 2025 22:58:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8BU-0000000Gysl-0d42
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 22:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41724605CA;
	Mon, 17 Nov 2025 22:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D04C19423;
	Mon, 17 Nov 2025 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763420334;
	bh=yfF05U4RF+SjY7Vvy+25AHoW6V6B9W7JtUipFLOoZAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jo7u/QNdMQcZ0HiLdmqU1BcI9yil/ZZRFOvlLcWSCOYpykU32AJPrFgqSxPjOC5WU
	 p5ALUsyQswJELk4yY0ZiwBezUvJswC+0mFC/CZ4CI5WRnqdEXynrrjzuWh5KkldHbz
	 aWnza2wNr+rbBJ3iChBxI84YXKVCQyM3sYO8ypMcz2PnbBialFEXMZ2zpgCQzfNWgo
	 Rf+DPvQRgYH9EbvUlzi/dpVeOoFpuHgYMeaTOzIr23sYK6elAa2c5oOz6nWIxEGIUv
	 FQPmCqAXV7PU+5F+zU3DJIXmr90rdfesgtKl7ueFJHtH3lLwaDp+3kapjBq9dRPm+x
	 KjijbvlphfhIQ==
Date: Mon, 17 Nov 2025 16:58:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, rafael@kernel.org, bhelgaas@google.com,
	alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com,
	will@kernel.org, robin.murphy@arm.com, lenb@kernel.org,
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	pjaroszynski@nvidia.com, vsethi@nvidia.com, etzhao1900@gmail.com
Subject: Re: [PATCH v5 5/5] pci: Suspend iommu function prior to resetting a
 device
Message-ID: <20251117225659.GA2536275@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a166b07a254d3becfcb0f86e4911af556acbe2a9.1762835355.git.nicolinc@nvidia.com>
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

On Mon, Nov 10, 2025 at 09:12:55PM -0800, Nicolin Chen wrote:

Run "git log --oneline drivers/pci/pci.c" and match the subject line
style.

> PCIe permits a device to ignore ATS invalidation TLPs, while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out: e.g. an SVA domain will have no coordination with a
> reset event and can racily issue ATS invalidations to a resetting device.

s/TLPs, while/TLPs while/

> The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.

Include spec revision, e.g., "PCIe r7.0, sec 10.3.1".

> Now iommu_dev_reset_prepare/done() helpers are introduced for this matter.

s/Now ... are introduced for this matter/Add ...helpers/

> Use them in all the existing reset functions, which will attach the device
> to an IOMMU_DOMAIN_BLOCKED during a reset, so as to allow IOMMU driver to:
>  - invoke pci_disable_ats() and pci_enable_ats(), if necessary
>  - wait for all ATS invalidations to complete
>  - stop issuing new ATS invalidations
>  - fence any incoming ATS queries

Thanks for addressing this problem.

> +++ b/drivers/pci/pci-acpi.c
> @@ -971,6 +971,7 @@ void pci_set_acpi_fwnode(struct pci_dev *dev)
>  int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
>  {
>  	acpi_handle handle = ACPI_HANDLE(&dev->dev);
> +	int ret = 0;

Unnecessary initialization.

> +int pci_reset_iommu_prepare(struct pci_dev *dev)
> +{
> +	if (pci_ats_supported(dev))
> +		return iommu_dev_reset_prepare(&dev->dev);

Why bother checking pci_ats_supported() here?  That could be done
inside iommu_dev_reset_prepare(), since iommu.c already uses
dev_is_pci() and pci_ats_supported() is already exported outside
drivers/pci/.

> +void pci_reset_iommu_done(struct pci_dev *dev)
> +{
> +	if (pci_ats_supported(dev))
> +		iommu_dev_reset_done(&dev->dev);

And here.

>  int pcie_flr(struct pci_dev *dev)
>  {
> +	int ret = 0;

Unnecessary initialization.

>  static int pci_af_flr(struct pci_dev *dev, bool probe)
>  {
> +	int ret = 0;

Unnecessary initialization.

