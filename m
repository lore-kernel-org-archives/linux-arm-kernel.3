Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00440CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 23:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jO2Ta0NUMLQ10V2/f3ZRqd7JgZIaN4ij+MbFhG+tsVE=; b=SPcQMFYl78/Ojo
	2jcKlgxDnYrj96exhociwgUzL0luTUL1lkmtcb7VKlfn5579kTPReMj/fZBup8+v6WgoQeIReKdGk
	Hb7pvYVLQprdo44QzxB0fIhj5rSwIbVAipWDZMGoYuiLqI/sSAMT1v72tnbiLQ1OBOX5VyrZhlskC
	4ePZhor3S9GI3Mx2ys/qudJOKKwkubj6ngKoS0NruMtGYf5DKhfi9jHfFxmv0E8Q6Dg96U/JqHAIu
	6VxwylcFFt7g1nedJAEC+pGQYZGENmVnBnMcGMysABdnFheddg4IEteVPnOBqKMpz/9XGPEKK5lIl
	OO0v24qsVW35U1R5Z4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8Gj-0000000GzA2-3kgr;
	Mon, 17 Nov 2025 23:04:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8Gh-0000000Gz9S-2bbd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 23:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 512A0401DB;
	Mon, 17 Nov 2025 23:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95830C4CEF1;
	Mon, 17 Nov 2025 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763420657;
	bh=WDy4B5MpxbqhpxY50CYIosUO/OJPo/Xo2FnrKtc4l60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AN5kg5meQGtxz+cRYWriS1/NMxGsJvAXW55WuzhlF2cIbIvnOE+HfQBZhFGA6vVZ4
	 8/j7sqTlUgXCEkiA3Qi/pKj3WUAx/Us/2n94lIn3wYzKfhM2j3rDD0E4hU/ugNra1U
	 e3JvfcVnnLQ9t1rQkOJk0h5o9kvhwTrStYRikWEfhVTI1h4tfVRfXtFwEeGs7mQZXZ
	 pwjJpJkNsBuQTkHXYq3skt71fl1OAxKlWY8to3xGrBMmVMjJ2Srn8IvlU8YJ20RMSW
	 cedp5OC03/dJ83o3lt14fTLY9VdwdAcgsudVwaBOibWtfmn+3Q+gDXmr78dtHQNYLQ
	 KD43b9+WrkRhw==
Date: Mon, 17 Nov 2025 17:04:14 -0600
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
Subject: Re: [PATCH v5 4/5] iommu: Introduce iommu_dev_reset_prepare() and
 iommu_dev_reset_done()
Message-ID: <20251117230414.GA2537490@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28af027371a981a2b4154633e12cdb1e5a11da4a.1762835355.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_150419_701549_4D2A991C 
X-CRM114-Status: GOOD (  25.37  )
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

On Mon, Nov 10, 2025 at 09:12:54PM -0800, Nicolin Chen wrote:
> PCIe permits a device to ignore ATS invalidation TLPs, while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out. E.g. an SVA domain will have no coordination with a
> reset event and can racily issue ATS invalidations to a resetting device.

s/TLPs, while/TLPs while/

> The OS should do something to mitigate this as we do not want production
> systems to be reporting critical ATS failures, especially in a hypervisor
> environment. Broadly, OS could arrange to ignore the timeouts, block page
> table mutations to prevent invalidations, or disable and block ATS.
> 
> The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.
> 
> Provide a callback from the PCI subsystem that will enclose the reset and
> have the iommu core temporarily change all the attached domain to BLOCKED.
> After attaching a BLOCKED domain, IOMMU hardware would fence any incoming
> ATS queries. And IOMMU drivers should also synchronously stop issuing new
> ATS invalidations and wait for all ATS invalidations to complete. This can
> avoid any ATS invaliation timeouts.
> 
> However, if there is a domain attachment/replacement happening during an
> ongoing reset, ATS routines may be re-activated between the two function
> calls. So, introduce a new resetting_domain in the iommu_group structure
> to reject any concurrent attach_dev/set_dev_pasid call during a reset for
> a concern of compatibility failure. Since this changes the behavior of an
> attach operation, update the uAPI accordingly.
> 
> Note that there are two corner cases:
>  1. Devices in the same iommu_group
>     Since an attachment is always per iommu_group, disallowing one device
>     to switch domains (or HWPTs in iommufd) would have to disallow others
>     in the same iommu_group to switch domains as well. So, play safe by
>     preventing a shared iommu_group from going through the iommu reset.
>  2. SRIOV devices that its PF is resetting while its VF isn't

Slightly awkward.  Maybe:

  2. An SR-IOV PF that is being reset while its VF is not

(Obviously resetting a PF destroys all the VFs, which I guess is what
you're hinting at below.)

>     In such case, the VF itself is already broken. So, there is no point
>     in preventing PF from going through the iommu reset.

> + * iommu_dev_reset_prepare() - Block IOMMU to prepare for a device reset
> + * @dev: device that is going to enter a reset routine
> + *
> + * When certain device is entering a reset routine, it wants to block any IOMMU
> + * activity during the reset routine. This includes blocking any translation as
> + * well as cache invalidation (especially the device cache).
> + *
> + * This function attaches all RID/PASID of the device's to IOMMU_DOMAIN_BLOCKED
> + * allowing any blocked-domain-supporting IOMMU driver to pause translation and
> + * cahce invalidation, but leaves the software domain pointers intact so later

s/cahce/cache/

