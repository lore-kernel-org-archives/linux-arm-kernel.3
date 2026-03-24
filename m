Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB03F54ABE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wop5tCrh4NFNkjp3h1K94xhilr3gToEOFc9o6TuyOz4=; b=QyOsF1dvPVp0CjgHG+8ytgUyze
	MUt6+gOajE/NQW2de49xWBF1IKZVvVKzIMnDeku8GwSKJAw4WiZnKatg3i9zjE1whY/s9VTdY2CyZ
	CMh6nf7dX/18lbIn+BvjyvumuYzTKpzToDCUoE0ry2exz+x56NjLv5YPTDFNsPZlgarSmXsAu4wFI
	4HrLgezplvEUVZHHkwb/bW+qG0r7PRjJzBf8Hxc5ct+qTROeL1IfTSEV+ARkt5nWrz1/f2Yq8zi45
	GFcM9UxvLdbfFSfXARppiZiMC5xkdzBbyODzJPT/U2X4+7QqfdzfZoCfccuVm2i4Z4KF8HwREIL3f
	zL/4ZaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Mg-00000001bfG-09ds;
	Tue, 24 Mar 2026 14:04:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Md-00000001beT-0MGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E667C442C1;
	Tue, 24 Mar 2026 14:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7881C19424;
	Tue, 24 Mar 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774361049;
	bh=89bzxAh1/2+814fvMl+BUIb2U5xxsZkW9mR2TP8okBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWccyQc7+Y2hNwb6SUv36aq9LdfRpsfqiVgZ9UqB5570HMO+wxAWxoiDesVzRgpY7
	 CsqA8NvUO4QSwA9brOW6is+EL3diAL13jH51mGl4OdvGH35/ofYYmGtm0Umg/s60I6
	 IpOFCo6V3GJqHK0cZ0xIzgmUpkrBX+AcuBAoEJ+OPLMc6dmQMUDjoBG800pQEeXJf1
	 SNSfXYN6T2Q84QH/eZP9+bY4eHU4Tv+SWYg6j/GsG/zBYre941WtFB3glKzQYBvAFC
	 /lKcpQ0nOXsVcuSDlyENJoE//PL2DHG01/MgW9F9Z3YYY8BZeuRKqwvQ1V6vM4wcrm
	 IPTfsb+1ql5Pw==
Date: Tue, 24 Mar 2026 14:04:03 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, praan@google.com, mmarrid@nvidia.com,
	kees@kernel.org, Alexander.Grest@microsoft.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, bbiber@nvidia.com,
	skaestle@nvidia.com
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Drain in-flight fault handlers
Message-ID: <acKZ0wtfi5R_dHm0@willie-the-truck>
References: <20260307001723.964956-1-nicolinc@nvidia.com>
 <abLE3rdM9YAu81tq@willie-the-truck>
 <20260312142509.GA1586734@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312142509.GA1586734@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_070411_162854_CB33C991 
X-CRM114-Status: GOOD (  32.68  )
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

On Thu, Mar 12, 2026 at 11:25:09AM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 12, 2026 at 01:51:26PM +0000, Will Deacon wrote:
> > On Fri, Mar 06, 2026 at 04:17:23PM -0800, Nicolin Chen wrote:
> > > From: Malak Marrid <mmarrid@nvidia.com>
> > > 
> > > When a device is switching away from a domain, either through a detach or a
> > > replace operation, it must drain its IOPF queue that only contains the page
> > > requests for the old domain.
> > > 
> > > Currently, the IOPF infrastructure is used by master->stall_enabled. So the
> > > stalled transaction for the old domain should be resumed/terminated. Fix it
> > > properly.
> > > 
> > > Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Barak Biber <bbiber@nvidia.com>
> > > Signed-off-by: Barak Biber <bbiber@nvidia.com>
> > > Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> > > Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> > > Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index 4d00d796f0783..2176ee8bec767 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -2843,6 +2843,12 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
> > >  	if (master->iopf_refcount) {
> > >  		master->iopf_refcount++;
> > >  		master_domain->using_iopf = true;
> > > +		/*
> > > +		 * If the device is already on the IOPF queue (domain replace),
> > > +		 * drain in-flight fault handlers so nothing will hold the old
> > > +		 * domain when the core switches the attach handle.
> > > +		 */
> > > +		iopf_queue_flush_dev(master->dev);
> > 
> > So this drains the iopf workqueue, but don't you still have a race with
> > the hardware generating a fault on the old domain and then that only
> > showing up once you've switched to the new one? What is the actual
> > problem you're trying to solve with this patch?
> 
> HW doesn't generate faults on domains, it calls
> iommu_report_device_fault() which calls find_fault_handler() that
> uses iommu_attach_handle_get() to find the domain. It then shoves the
> domain pointer onto a WQ.

Sorry, that was sloppy terminology on my part. I'm trying to reason about
faults that are generated by accesses that were translated with the
page-tables of the old domain being reported once we think we are using
the new domain.

> The ordering is supposed to be
>  1) IOMMU HW starts using the new domain
>  2) iommu_attach_handle_get() returns the new domain
>  3) IOMMU driver flushes its own IRQs/queues that may be concurrently
>     calling iommu_attach_handle_get()

Does that mean we should kick the evtq thread? I'm not sure what this
means for the priq.

>  4) iopf_queue_flush_dev() to clear the iopf work queue
>  5) domain is freed, no pointers in WQs or other threads
> 
> So the naked iopf_queue_flush_dev() doesn't seem right, I'd expect a
> synchronize_irq() (is that right for threaded IRQs?) too as the
> threaded IRQ is concurrently calling iommu_attach_handle_get().

I don't think we can rely on the IRQ being taken, though, so presumably
we have to kick the irq thread manually and see what's actually sitting
in the event queue after the CMD_SYNC?

Will

