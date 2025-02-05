Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D65FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKHV/JQ3QffWyh6cdizuTNe5OOYudjWKLtxMFE92V8g=; b=qTq3b2VjKN087M3kxC7+ijWf2N
	MitfegTv9lDCfPta+s1j89Xb75vew4R/SvY7sE0FotIOjPushMWH7QyNnp/mhMf+GFt9m4pR3bF7w
	+NnyFXolPY4J7D0HUkKoovPzXVekEurTJLNe9I9jnwhyZ46q54dpSb9y/8Pih97YN7Jreh9wh4k9K
	UXjn9+ddfV8tX2PoFkS3gJJs+m+rTIsUBTvikAKIBfxspa19mr7P2TQD5LoSbZIlH5WVmyagI8HwC
	5QZcfGQdcJeUNX58+/dvTvVR90RrKqV/v2R2hd5K5WCUJXhE8pWqopof5R+1N7ubOxwbwyFIkvp75
	6bBnhmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoE7-00000004lpa-2eps;
	Wed, 05 Feb 2025 22:50:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoCj-00000004lcA-3s2P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:49:11 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.11.69])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1107A203F59E;
	Wed,  5 Feb 2025 14:49:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1107A203F59E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738795747;
	bh=UKHV/JQ3QffWyh6cdizuTNe5OOYudjWKLtxMFE92V8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=Fhtun/HHTs8cKMk/GQjP30TwMFP3lggFolDvN5IWoUQCAavvOTaORuftLmNqt2MEe
	 wc/5XmAuc4gu++Yp7MgRaQsbFvJaau3iJQF2g8wJ8CizocAJrXFg3A9Iz60Nwuuoqf
	 Fi8d59U12O6oLOTupv0RXcxCJ3t2T30irlL6Thxo=
Date: Wed, 5 Feb 2025 14:49:04 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
 <kevin.tian@intel.com>, <tglx@linutronix.de>, <maz@kernel.org>,
 <alex.williamson@redhat.com>, <joro@8bytes.org>, <shuah@kernel.org>,
 <reinette.chatre@intel.com>, <eric.auger@redhat.com>, <yebin10@huawei.com>,
 <apatel@ventanamicro.com>, <shivamurthy.shastri@linutronix.de>,
 <bhelgaas@google.com>, <anna-maria@linutronix.de>, <yury.norov@gmail.com>,
 <nipun.gupta@amd.com>, <iommu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <patches@lists.linux.dev>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
 <mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
 <smostafa@google.com>, <ddutile@redhat.com>, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
Message-ID: <20250205144904.39285de4@DESKTOP-0403QTC.>
In-Reply-To: <cover.1736550979.git.nicolinc@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_144910_019154_772B49EC 
X-CRM114-Status: GOOD (  20.18  )
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
Reply-To: jacob.pan@linux.microsoft.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nicolin,

On Fri, 10 Jan 2025 19:32:16 -0800
Nicolin Chen <nicolinc@nvidia.com> wrote:

> [ Background ]
> On ARM GIC systems and others, the target address of the MSI is
> translated by the IOMMU. For GIC, the MSI address page is called
> "ITS" page. When the IOMMU is disabled, the MSI address is programmed
> to the physical location of the GIC ITS page (e.g. 0x20200000). When
> the IOMMU is enabled, the ITS page is behind the IOMMU, so the MSI
> address is programmed to an allocated IO virtual address (a.k.a
> IOVA), e.g. 0xFFFF0000, which must be mapped to the physical ITS
> page: IOVA (0xFFFF0000) ===> PA (0x20200000). When a 2-stage
> translation is enabled, IOVA will be still used to program the MSI
> address, though the mappings will be in two stages: IOVA (0xFFFF0000)
> ===> IPA (e.g. 0x80900000) ===> PA (0x20200000) (IPA stands for
> Intermediate Physical Address).
> 
> If the device that generates MSI is attached to an IOMMU_DOMAIN_DMA,
> the IOVA is dynamically allocated from the top of the IOVA space. If
> attached to an IOMMU_DOMAIN_UNMANAGED (e.g. a VFIO passthrough
> device), the IOVA is fixed to an MSI window reported by the IOMMU
> driver via IOMMU_RESV_SW_MSI, which is hardwired to MSI_IOVA_BASE
> (IOVA==0x8000000) for ARM IOMMUs.
> 
> So far, this IOMMU_RESV_SW_MSI works well as kernel is entirely in
> charge of the IOMMU translation (1-stage translation), since the IOVA
> for the ITS page is fixed and known by kernel. However, with virtual
> machine enabling a nested IOMMU translation (2-stage), a guest kernel
> directly controls the stage-1 translation with an IOMMU_DOMAIN_DMA,
> mapping a vITS page (at an IPA 0x80900000) onto its own IOVA space
> (e.g. 0xEEEE0000). Then, the host kernel can't know that guest-level
> IOVA to program the MSI address.
> 
> There have been two approaches to solve this problem:
> 1. Create an identity mapping in the stage-1. VMM could insert a few
> RMRs (Reserved Memory Regions) in guest's IORT. Then the guest kernel
> would fetch these RMR entries from the IORT and create an
> IOMMU_RESV_DIRECT region per iommu group for a direct mapping.
> Eventually, the mappings would look like: IOVA (0x8000000) === IPA
> (0x8000000) ===> 0x20200000 This requires an IOMMUFD ioctl for kernel
> and VMM to agree on the IPA.

Should this RMR be in a separate range than MSI_IOVA_BASE? The guest
will have MSI_IOVA_BASE in a reserved region already, no?
e.g. # cat
/sys/bus/pci/devices/0015\:01\:00.0/iommu_group/reserved_regions
0x0000000008000000 0x00000000080fffff msi

