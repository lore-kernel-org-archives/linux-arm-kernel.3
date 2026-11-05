Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCYZGpoN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JT5VLO7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=orqNvCIr/GD7TIfy/qrX+MEjo8QabahDm8euaMSc6BA=; b=fCYZGpoNb381+m0MD1tBVNMsCh
	/8/ixme0Y/8Ch2gfZhadIvzjD+lFCft6SKWRS+ReK0BzlziiLwpjfPxj/9DtPZaNpXWvcKgNoA3Vc
	O7AmBskj89xBfPZwMHWQKnrvMHdnG/0ZzPO/bAuYFLQP8si9xr5NUQP3EG8mZquCe76SBy+QXZmwx
	MoJH1mwRlgyOwWtczqlJjCFVvaIacpI/4M73KokiDWp9fki2/lZ7/Bk5LQkmwXkN3m1VkAYvFumnj
	R7S6zJGXFCClAtSQj9w2M0ItPecpwYeVzMNl43wmbtvAjyrWgAN7hJEp8QhfJJnCjgB34EkengHHw
	OSKF467g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6o-00000007Ki2-1PqR;
	Thu, 05 Nov 2026 00:13:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6m-00000007KgN-36Zm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 00:13:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDBC0601DE;
	Thu,  5 Nov 2026 00:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BADC1F00919;
	Thu,  5 Nov 2026 00:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793837614;
	bh=orqNvCIr/GD7TIfy/qrX+MEjo8QabahDm8euaMSc6BA=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=JT5VLO7cllg7mmJOzhQ5x2Ody9G1mMMBNmw2jsxCje8IhTlkJVfJAk3hlf/pZznu8
	 5FIsPH/ftaR4HBsCCHA2COCVqaXqkO50Fz0hbeKMHJbjmKjo8rblvMjeXToTy0FLwL
	 XiKh/AwUxBshDk8b3WpuC77CzNb3pz5qx0PbxH2OgWDubJDqLYeLV6j7aQYOvd6rZN
	 fy4nNviJ1u0gblzJK7MrFOr0ml1JyfeetmZXbQFHtt1aQuhnm+14OEmF0MnHe3nzJw
	 mjGb1GvvQhU3QMNcrMgnBDPgC7+BvN/pLC4K3tIaCfhl4j1gU7gjVRy41Htog3pARf
	 8bLfx9TaGkOBA==
Date: Wed, 4 Nov 2026 18:13:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>, lenb@kernel.org,
	bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com,
	kevin.tian@intel.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
	etzhao1900@gmail.com, Danny Gonzalez <digonzal@google.com>
Subject: Re: [PATCH v8 5/5] PCI: Suspend iommu function prior to resetting a
 device
Message-ID: <20261105001333.GA1478880@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auvHyrZmMXLTFyz9@nvidia.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:03:22PM -0800, Nicolin Chen wrote:
> On Wed, Nov 04, 2026 at 05:55:00PM -0600, Bjorn Helgaas wrote:
> > On Mon, Dec 15, 2025 at 01:42:20PM -0800, Nicolin Chen wrote:
> > > @@ -4885,10 +4919,20 @@ static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
> > >  		return -ENOTTY;
> > >  	}
> > >  
> > > +	rc = pci_dev_reset_iommu_prepare(dev);
> > > +	if (rc) {
> > > +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
> > > +		return rc;
> > > +	}
> > 
> > Unlike the other reset functions, this one calls
> > pci_dev_reset_iommu_prepare() even when probe==true, i.e., we don't
> > want to actually perform the reset, we just want to know whether the
> > reset method might work.
> > 
> > It's at least unnecessary to call pci_dev_reset_iommu_prepare() and
> > pci_dev_reset_iommu_done() in that case, and maybe even problematic
> > because the pci_init_reset_methods() probe happens from
> > pci_init_capabilities(), which is pretty early during PCI enumeration
> > of the device.
> > 
> > I know this has already been merged as f5b16b802174 ("PCI: Suspend
> > iommu function prior to resetting a device"), and I'm not sure whether
> > we should do anything about it.  I wonder if we should just skip the
> > prepare/done when probe==true?
> 
> I've posted a fix for a few times actually. The latest one was
> posted yesterday after a split:
> https://lore.kernel.org/linux-iommu/c66d5221a8e4356316d4f614c8584a80dc9d71b6.1793729707.git.nicolinc@nvidia.com/

Well, that's embarrassing ;)

I acked the PCI patches there on the assumption that they'll go via
the IOMMU tree since the interesting bits are there.

