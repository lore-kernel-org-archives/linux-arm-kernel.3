Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9D7C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRKKcyPjoabyj6UhYawNm7cMg5b+yHqOJ+jXOfGN160=; b=0V3dInaMgrUyx9wsrgXFupImY7
	yKUtKiqg38XptOh3wOyHBxEyDG+irVfNXQziR51DoBGfO5H0M4jpmgBw8ii8/mvkVyofmf2etalZs
	FCEvDdqD5h93PWk7gfXPnkhzzkDbB+QIH81C5Tez0cCWAxg+yhM5ZMN88ugYcSH/nRxWGkhKlKg1L
	NZwCCEKNAdHzZwl7CSAvcLXnlYEVJpUossXC25pXQ6QYNBLSHTjyycJkV8Fu7JNj/7b2vqwgS5BNu
	S5dTajwm4Pw34rt5+BbeJ1mucKIltxOewQY0yLeKiPwneCzt5cNAL5Pc9MCEeveYNd1SW3xX7ykyF
	UKi4m32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taM8n-00000008rAY-2i98;
	Tue, 21 Jan 2025 21:50:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taM7W-00000008r6F-17Mr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 21:49:15 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.11.185])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5D406205A9EC;
	Tue, 21 Jan 2025 13:49:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5D406205A9EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737496152;
	bh=CRKKcyPjoabyj6UhYawNm7cMg5b+yHqOJ+jXOfGN160=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=AnhMTBG5w0v57AHdyDrH4rfPMLpZGLXbxSxM/kulCk1lIzsyrkv2JKeRXmYR7oW/p
	 uiXeHo2ayumznqIIaVwHPWld1D4Ep4fJEXar+ZvMO7uvNCQEG0aKLI+e0g1YQexhZR
	 xSem6n7ei8EIEw2f0J3o8+6OA/3FR7fFnMikja4s=
Date: Tue, 21 Jan 2025 13:49:10 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 virtualization@lists.linux.dev, will@kernel.org, eric.auger@redhat.com,
 code@tyhicks.com, eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
 jacob.pan@linux.microsoft.com
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250121134910.11797062@DESKTOP-0403QTC.>
In-Reply-To: <20250120142643.GM674319@ziepe.ca>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
	<20250120142643.GM674319@ziepe.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_134914_337986_DFF2DE1E 
X-CRM114-Status: GOOD (  28.20  )
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

Hi Jason,

On Mon, 20 Jan 2025 10:26:43 -0400
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Jan 16, 2025 at 03:23:04PM -0800, Shyam Saini wrote:
> > Hi,
> > 
> > Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> > assuming that all platforms have this address available for MSI IOVA
> > reservation. However, this is not always the case, as some platforms
> > reserve this address for other purposes.  
> 
> Can you explain this some more? This address is in the kernel
> controlled IOVA space, there are few ways a platform can impact this.
> 
> How is the platform impacting it? Is the non-functional IOVA always
> reflected in the iommu_get_resv_regions()?

I don't know the platform impact but just to clarify, are you asking
whether this non-functional IOVA is also under IORT RMR or other FW
tables? I don't think it is.

But this special IOVA is reflected in iommu_get_resv_regions() the same
way as the hardcoded MSI_IOVA_BASE. So each iommu group's
reserved_regions should show.

> Why not avoid this conflict in your platform software?
I had the same question but it seems there is not enough difference
(than the standard smmu) to justify a platform code. i.e. platform
specific iommu_get_resv_regions(), is that what you are suggesting?

> > There was an [1] attempt to fix this problem by passing the MSI IOVA
> > base as a kernel command line parameter.   
> 
> Yuk
> 
> > In the previous attempt,
> > Will suggested reserving the MSI IOVA at runtime whenever there is a
> > conflict with the default MSI_IOVA_BASE. However, dynamically
> > reserving this address has debuggability concerns, as it becomes
> > difficult to track IOMMU mapping failures.  
> 
> Still, this approach seems like the best to me..
> 
> > This patch series aims to address the issue by introducing a new DTS
> > property, "arm,smmu-pci-msi-iova-data". This property allows the
> > configuration of MSI IOVA with a custom MSI base address and a
> > custom length for IOMMU/SMMU drivers. It accommodates platforms
> > that do not have the default MSI base address available for MSI
> > reservation.  
> 
> My understand was using DT to set kernel configurables was frowned
> upon? Ultimately MSI_IOVA_BASE is an arbitary choice by kernel
> software.
> 
> Jason


