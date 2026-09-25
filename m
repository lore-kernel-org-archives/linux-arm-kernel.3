Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DC7C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 23:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zdOp4OInhQs1N3FTnInrZQD8rBPlTXBdjpw6h1ZL/c=; b=Xtn+fJhEBki/QK3cCidvA4c6oS
	4TslyR/592J/csGKJ85KMqre6g2+3dfqSexaLUaWpxIxCVyjBI4nL/Sr7t7H3FGkUzMHUkeRoEtZG
	fP63fg4tq8Ou9pag/qcC0zkYPqomMBAgqqdBN7AU/iyL3zK+10mWO2YwMTwqK8J8ZmtuEVArnrvcC
	D2AbMIeuFOnDOOgpVA1ts8RpalYEVlhjk/ZrNCujcrIoaU08iLBxMyj5m5TF5lcVCcFEJVSne8qBV
	lzd1WhBE1YoxD5xohgm3IAd/Uu7Bct/LIr5HxP9J/gJfjBUuBTPHtNE87PqT8iCK+6qvulPqfcwy+
	CqJGXQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAF6T-0000000Ecmv-26kz;
	Fri, 25 Sep 2026 23:13:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAF6S-0000000Ecmm-1x9z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 23:13:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC2A241905;
	Fri, 25 Sep 2026 23:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D4D1F000FF;
	Fri, 25 Sep 2026 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377995;
	bh=4zdOp4OInhQs1N3FTnInrZQD8rBPlTXBdjpw6h1ZL/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QanQH2jICPlqPLsXjriL30mgkc+t/HLU0FDAcsKhv8A2cyVXjF0UjtKLT8gjwKjlK
	 r5OF3xA/kA8PiTKAZwefA7GSmOzTJOxmMn66F2EayD6f+dnJRVrXNqXAZpTTLfRvMg
	 UvlnCF3+fRVCRUpBCHDDTBWzXjh+yOey61zjZzFOmhEqQ8xdxPjI2Lenr1Zxa2VMuN
	 Z+SOMaemdK1J/WL5UzMbw7NgD6lwW08zTaTu7BdyWUjsFe/0b07hg5QcOr2ImSUihy
	 t+TxrnNbn4nG2J/Vx1nTA7OpF5dlbUpVjljJfoNXWBvk96lQuKWm3yOGEW81tWTzvj
	 dZ/gTr5T/uGew==
Date: Sat, 26 Sep 2026 00:13:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pranjal Shrivastava
 <praan@google.com>, Mostafa Saleh <smostafa@google.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
 <vsethi@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v6 02/17] PCI/CXL: Probe the underlying bus reset in
 cxl_reset_bus_function()
Message-ID: <20260926001311.7c4be583@jic23-hlaptop>
In-Reply-To: <a05695c1dcb0682425bad7b8387cd24ad71e2d9d.1790188510.git.nicolinc@nvidia.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
	<a05695c1dcb0682425bad7b8387cd24ad71e2d9d.1790188510.git.nicolinc@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Sep 2026 13:11:21 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> cxl_reset_bus_function() reports "supported" to a probe after checking only
> that the upstream bridge carries a CXL port DVSEC. The underlying bus reset
> can still be unavailable, e.g. on a bus shared with other devices, so both
> the reset_methods[] array and the reset_method sysfs node end up listing a
> "cxl_bus" that is guaranteed to fail with -ENOTTY when it is attempted.
> 
> Probe the underlying pci_dev_reset_slot_function() and then, if it is not
> applicable, pci_parent_bus_reset(). These are the same two checks that the
> actual reset runs, so a shared-bus CXL device no longer advertises a method
> that can never succeed.
> 
> Probing via pci_reset_bus_function() would not work: its cxl_sbr_masked()
> check rejects every CXL port with a masked SBR, while the do-reset path in
> this function unmasks the SBR before resetting. Such a port would wrongly
> probe as unsupported.
> 
> Move the port control register read above the probe branch as well, so that
> probe runs the same checks. That read asserts no reset, and a failure means
> the device cannot be reset this way, which is a probe-time answer.
> 
> Also pass an explicit PCI_RESET_DO_RESET at the do-reset call site, since
> probe is always false at that point.
> 
> Fixes: 53c49b6e6dd2e ("PCI/CXL: Add 'cxl_bus' reset method for devices below CXL Ports")
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Nice clear explanation and it looks like the code does what that says,
so I'm fine with this.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>



