Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51206606D839
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pQRSUXt5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvi8mwQk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IdsyS82S9xmEux1Z7p//48MeApymfROqKvbsztaBC5Y=; b=pQRSUXt5SQJKo4oV/AbNOJUadz
	j6u1I+42AY2KVx6pH09oBwRzlz657khyE/6UZkqXJrfIHWuS7au6XAIq3Ht3SwFrNCIwjfQXZPz8p
	n5OnSYBOUZ3KEovAnar7zdfUkEY8zLw7uS0b/hEOaCni9+pxP/EUCJsYuiQAu5dwOyVWRznn2GY/x
	CIYXP/EO2VM1CWOOA0gipEsO7I95w965Ngyv4Mf8VFBd0UrW/JRnysCECUyEVwVLCSBGmYzgejEKh
	9gzm+iO5UPviOzJChfEXdVO+8M7i0DVWT5xPiSkOKsoNa8i7Xt8ogz731fJ5qDT5v9F2yrr6yG27l
	r7V8zp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkor-00000007Iww-0lTL;
	Wed, 04 Nov 2026 23:55:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkop-00000007Iwd-0omH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 23:55:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58C344068E;
	Wed,  4 Nov 2026 23:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1061F000C1;
	Wed,  4 Nov 2026 23:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793836502;
	bh=IdsyS82S9xmEux1Z7p//48MeApymfROqKvbsztaBC5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=mvi8mwQkbBCz1G8u+WsLGD2et7mREaqQJRVO2phq/i6ayqccFRl8LXutTZ+rFZi+d
	 golFdWhlzEcOiUR8yOuCXOU55n9Zgc9jsYhVAf4aY5D44zXaXhvWWyXfBxEs6m3MoA
	 P94Yx31Gdivl/UaUaGVlY4twI7tXiNTnGjaU6SyOLwcWtaXA9pBGksWJoiSSCxbP79
	 mldFp9P8J6COVJS3NnLJAVzx7BgYUpGU/0uyHtHQvTUq2wYAafsRZAJbBFtpA3WOzl
	 jXlo9SqRqt2yAxScV/n4ptBh26+98j/xrV8MqxRSYmelR7eefqr2eLvbJNgk1u63gK
	 nacOVLl4F3jMA==
Date: Wed, 4 Nov 2026 17:55:00 -0600
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
Message-ID: <20261104235238.GA1469671@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <348c50ab6e95b5ec6d48ee3fa05d529a784a34c3.1765834788.git.nicolinc@nvidia.com>
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

[+cc Danny; this question was prompted by sashiko review of a
pci_ats_supported() patch at
https://lore.kernel.org/all/20261020181053.2646782-1-digonzal@google.com]

On Mon, Dec 15, 2025 at 01:42:20PM -0800, Nicolin Chen wrote:
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
> ...

> @@ -4885,10 +4919,20 @@ static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
>  		return -ENOTTY;
>  	}
>  
> +	rc = pci_dev_reset_iommu_prepare(dev);
> +	if (rc) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
> +		return rc;
> +	}

Unlike the other reset functions, this one calls
pci_dev_reset_iommu_prepare() even when probe==true, i.e., we don't
want to actually perform the reset, we just want to know whether the
reset method might work.

It's at least unnecessary to call pci_dev_reset_iommu_prepare() and
pci_dev_reset_iommu_done() in that case, and maybe even problematic
because the pci_init_reset_methods() probe happens from
pci_init_capabilities(), which is pretty early during PCI enumeration
of the device.

I know this has already been merged as f5b16b802174 ("PCI: Suspend
iommu function prior to resetting a device"), and I'm not sure whether
we should do anything about it.  I wonder if we should just skip the
prepare/done when probe==true?

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

