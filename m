Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82512C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGuysM/Bjj0ONpOPPfU5fE2E0xCxqB9WfBikr1jbeyU=; b=SrwJtHGmt5ywl0craoywh4y9e3
	/wfmeSsa/xBwSLxnd42M1YqOJaUHRsTJJUiTq9JQveysDESttJH1hUe/TDilisEBTqzPEPG3KwEkx
	jSANCgzp2StVZP8c9cp+zU7S8NDvuGxWXJi9t+GYoE1lp8bko4iFxDrWmruqFVyTHS9+2Y7ymz7Bd
	EZ8OuNOtaRfOId+fwFr7Bt0I0scNh4ukhpn0DuwAPKk82awEegj65GqmDI5EkK9rWTwVjHmP4IuyR
	PDvrTByBwYU7+y3Mw+wwWAMQ3GME3w7MsIHL42sXPHsKzCAaZP1AT6Jho4ixovw9/Kfju/Z64V6g/
	Uvh/VuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddsC-00000009mCD-26nC;
	Thu, 30 Jan 2025 23:23:00 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddqt-00000009m62-007d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:21:40 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 905C92109CFE; Thu, 30 Jan 2025 15:21:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 905C92109CFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738279297;
	bh=AGuysM/Bjj0ONpOPPfU5fE2E0xCxqB9WfBikr1jbeyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIcR8ice7xefiWpV+MDI9m+ggfFAsrrfOqh41JrzHYFs5HKza7PZg5WWqrG0sp+mI
	 SHBL24uGENLjYmvamJ2Ilcn5OjnROY0ol9G2DAz8vLWfZxvFGLDruWkoHc8Cc9ZwMA
	 IuYu804xIKrL6FSigmRolmWBtGCsTRCrCAbBj06I=
Date: Thu, 30 Jan 2025 15:21:37 -0800
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250130232137.GA14836@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
 <20250120142643.GM674319@ziepe.ca>
 <67901659.170a0220.20b206.f1f5SMTPIN_ADDED_BROKEN@mx.google.com>
 <20250122001924.GT674319@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122001924.GT674319@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_152139_066664_169AFE72 
X-CRM114-Status: GOOD (  32.84  )
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

Hi Jason,

Apologies for delayed reponse,

> On Tue, Jan 21, 2025 at 01:49:10PM -0800, Jacob Pan wrote:
> 
> > > On Thu, Jan 16, 2025 at 03:23:04PM -0800, Shyam Saini wrote:
> > > > Hi,
> > > > 
> > > > Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> > > > assuming that all platforms have this address available for MSI IOVA
> > > > reservation. However, this is not always the case, as some platforms
> > > > reserve this address for other purposes.  
> > > 
> > > Can you explain this some more? This address is in the kernel
> > > controlled IOVA space, there are few ways a platform can impact this.
> > > 
> > > How is the platform impacting it? Is the non-functional IOVA always
> > > reflected in the iommu_get_resv_regions()?
> > 
> > I don't know the platform impact but just to clarify, are you asking
> > whether this non-functional IOVA is also under IORT RMR or other FW
> > tables? I don't think it is.
> 
> No, I'm asking how can you possibly have a HW platform where
> MSI_IOVA_BASE is unable to be used for DMA?
> 
> MSI_IOVA_BASE is 128M, and most ARM platforms put DRAM starting at
> 0. Most ARM VMMs put DRAM starting at 0 too.
> 
> So a platform saying that DMA to 128M doesn't work is pretty broken,
> to the point it is hard to believe there is a HW issue at work here?

Correct, this is limitation with our HW.
Since we can't fix it in hardware, we would need to fix it in Linux.

> > But this special IOVA is reflected in iommu_get_resv_regions() the same
> > way as the hardcoded MSI_IOVA_BASE. So each iommu group's
> > reserved_regions should show.
> 
> That's great
> 
> > > Why not avoid this conflict in your platform software?
> > I had the same question but it seems there is not enough difference
> > (than the standard smmu) to justify a platform code. i.e. platform
> > specific iommu_get_resv_regions(), is that what you are suggesting?
> 
> And here I mean, why not stop marking it reserved in the ACPI/DT
> inside your firwmare or hypervisor?

even if we reserve it in dts we would still need some address reserved for MSI IOVA

> This smells like some SW component using the same address Linux uses
> for some odd purpose. Just change it and let Linux keep using the
> address it wants?

Unfortunately, it is an HW issue.

Are you okay with this passing custom MSI_IOVA via DTS approach ?

Thanks,
Shyam


