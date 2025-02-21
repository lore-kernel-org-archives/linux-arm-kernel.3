Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2737AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd/u3JuPdLgCF8ZA7GFs1UOYNSt8wqGNDf5YZ4jI4Wk=; b=wJPVT/kK3J7srr9ai3urDnOelS
	h/Q2F5IXGXCZLUID70miqsuQEBbbjFt5jV8dkHwvCsKymywGKGIGUh7YN8dSmqQBOVzI0r5g83JmC
	yys06E9wZdmSCgx4Mz+kJlIdHHlq6HbtDGJoDJs1Tt9BjtFPSDOW8qac/EpE2xAUCzprKNUmIg/VY
	TkBj8A+IuXZhbbrqSTaTzqQdrnJ39tJzDD5mOQ+IRdv8FqwxpdHPhHjbtVSLgOV2Xan8PNr3Sd+9H
	OZi+j7O7RKsgqjoFKkfK2scBnATv8TrbyZke1yJPl86/1/Cg37iJcFMeqs1n5ACi42nPuLbgs0+h0
	fAlBBCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR23-00000005JBt-1rd7;
	Fri, 21 Feb 2025 11:17:23 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQvh-00000005Hxw-1k8A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:10:50 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7EEEC42FC0;
	Fri, 21 Feb 2025 12:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740136247;
	bh=SBubaC/2dyR78TdRAfMdzusbN+238FcRcI5z7z2jjnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBZWlUTWyN5bgQAUNi2L5/qtL/GRXOV7ioh9y/luURzXl3Jphnjyo5x77n0TFLtW1
	 +wLpgZrvijun/aZq18OwnJLqiHWFd2r1UusVMwKzYPo1YsdbqAXzAHGhVYl/fPP3nt
	 ZRbqOdbY8qIje9bfWiSu5XCUy1nJH+jq9kLskquTa2Y+oLxKRzvC34BxGY8biv4bKv
	 EzPoTRApatNO4Gpy/fU1cGfu7lBmdoCa+fijBG2YCR20OYzhRDkWDb7XnLKPdYaJde
	 +due+eJYRr9mXrDekqseqlJMtQ9oZkDEWO13OjGjhWrGaLOZ1qSV7St+E1WEtmIuCd
	 RkGna71M/HsLA==
Date: Fri, 21 Feb 2025 12:10:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, jgg@nvidia.com,
	kevin.tian@intel.com, maz@kernel.org, will@kernel.org,
	robin.murphy@arm.com, shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 1/7] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
Message-ID: <Z7hfNlnSj8BI6C7l@8bytes.org>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <a4f2cd76b9dc1833ee6c1cf325cba57def22231c.1740014950.git.nicolinc@nvidia.com>
 <87ldtzhcjv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldtzhcjv.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_031049_672929_4A210A2D 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Nicolin,

On Fri, Feb 21, 2025 at 10:28:20AM +0100, Thomas Gleixner wrote:
> On Wed, Feb 19 2025 at 17:31, Nicolin Chen wrote:
> > Fix the MSI cookie UAF by removing the cookie pointer. The translated IOVA
> > address is already known during iommu_dma_prepare_msi() and cannot change.
> > Thus, it can simply be stored as an integer in the MSI descriptor.
> >
> > A following patch will fix the other UAF in iommu_get_domain_for_dev(), by
> > using the IOMMU group mutex.
> 
> "A following patch" has no meaning once the current one is
> applied. Simply say:
> 
>   The other UAF in iommu_get_domain_for_dev() will be addressed
>   seperately, by ....
> 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> With that fixed:
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Can you please send a v3 with updated commit message and all the
review/acked tags added? I will pick it up then.

Thanks,

	Joerg

