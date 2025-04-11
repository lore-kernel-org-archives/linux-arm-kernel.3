Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5CFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/5ONAaPFLmx9elyCQbdSxe17nwef8tSrFs82RQ6dng=; b=Hvq7+dgYcWLK4dQdlYp0/N1NQO
	DXnBJJCxinRSE88quP4k88mgsFPaX0mt3Vb3mpBxFbiCh++cDnXhgK45LsXfAW0AfywLzYcjqS7Rp
	wkvGc0phJgXxpxeHqWUNprZn36HAYTp+MMkFp2/J+gbS43G3l3OJtGj3Uy0BH/Ph1yetrjRPDdz3a
	L9fMzNCJhIiEDdWXgp5qYG1QCGpSi3Ergnuw/9tp4nlX0FQ0hcKJ2vBNMmVDNLbJUuv4+khs5ajH7
	5mwJaxNX5yetIzrFGtyIZufqXTfEgMf27JhCZw82/ly7oyY7yFTLEeVQm7aoAxUZh0WDGHnffAdOx
	WqgsjJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GtY-0000000EKCV-0vTh;
	Fri, 11 Apr 2025 16:06:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GrI-0000000EJqk-1eCk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30ED64362D;
	Fri, 11 Apr 2025 16:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90A6C4CEE2;
	Fri, 11 Apr 2025 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744387438;
	bh=KqcHpLtYGIe+KPzDUv64VC3jawenUyBCz4MhtthBEPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=miPD2+rwV0dQP4B/8sjkwn3hZFOS3HTZ8dEsYwuZ/mWBNUem/giiiMYNTXP63So1u
	 NSQhWAzhggX+gnY7U1IUxICmCzVodgwS1gbql/iAE4kH74RUH0MCdFjC315PsFgWmR
	 NxMNE28xpu4Jx9tXRThlZCPxfZOurye0IEBreA6mH/NTQ6VSlQHqiKLcCnT5vUsPKj
	 tPZpUQ454OzPxPoM6TPun1aHAcgdm90fN+2HrbPrcdwXT3yoXVezrY8MjEw+pxBKKq
	 6dSehQI1sziaJUEwrfw2Wh0RwYf7k80VNscV+YTK82tUDxZ61pghqppOx4ozHdUpc9
	 2gC9jvXD66mew==
Date: Fri, 11 Apr 2025 17:03:53 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com,
	nicolinc@nvidia.com, jsnitsel@redhat.com, praan@google.com,
	kevin.tian@intel.com, ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Message-ID: <20250411160352.GB5675@willie-the-truck>
References: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
 <20250408120919.GB1727154@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408120919.GB1727154@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_090400_449605_C5827E1D 
X-CRM114-Status: GOOD (  15.10  )
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

On Tue, Apr 08, 2025 at 09:09:19AM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 08, 2025 at 09:03:51AM +0530, Aneesh Kumar K.V (Arm) wrote:
> > Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> > introduced S2FWB usage but omitted the corresponding feature detection.
> > As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
> > the following check:
> > 
> > 	if (!arm_smmu_master_canwbs(master) &&
> > 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> > 		return ERR_PTR(-EOPNOTSUPP);
> > 
> > This patch adds the missing detection logic to prevent allocation
> > failure when S2FWB is supported.
> > 
> > Fixes: 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> This should go to rc

Yup. I'll pick this up next week along with any other SMMU fixes kicking
around.

Cheers,

Will

