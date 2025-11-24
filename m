Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21D3CFD35C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNDUJmthQourTcGWQiwWkZKKngPE7VebQXmpr0YiSEA=; b=wFEaH+bJkEeJq2X6n6urgJg8C6
	o+SoWYr1GtwSs7uFvcH/liiusmZC99+tBKDdJxFOPKEx6nPc8YL8hxzsKM576zsDh5qg4vVhq4uuR
	E+RJLM3FesirS1hf3Sa76qejoMk7S673S0tPT7ECnucD5MjLh6k7dHZJ2Cv4I5yCcg8f23n5Ocigt
	lQijAS/BAw8ODVqnO8O2uwMRdE2zG7YX90lkxFIXN6fNVFwYby1oIz0ruPlISWTvs/byxSgOgv9Lh
	owAZrs9GmX4p8y5WVNRYTzdHs7dYB1Y1LQxnCZ86ywTt/ih+c0hvYVBN8dyjQxn2co4W+Uw+6jQx9
	FsjOgkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeP8-0000000CMch-0qtf;
	Mon, 24 Nov 2025 21:47:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeP5-0000000CMcJ-2xQ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF02A4372C;
	Mon, 24 Nov 2025 21:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1F7C4CEF1;
	Mon, 24 Nov 2025 21:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764020842;
	bh=m7/o5mHZyAIVDSXHcVUNjqDc6NGLW9bQYFzDWBv1VyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOw30jQ1T6Y0XN6tpOg3M3JXqs51nOVasKj9+pAr/4jGr9GPKFJqOT+jcWX+VKt1m
	 NHWOHwO1m25/crXmLf4CEikcEVU89+pZ2Od1n7c1v8e1lKG6ZJBM9Kq1o6c4C4peT1
	 5ZPw+IbSnDqkTcKoIiQVozmZkQ0tva723Du1NDKh8PF2GFd3wzFRzTf4SLRQ/seUMW
	 TqqtuBXOmi28+SINtTrf9zdVCRAR9ie8YuwNbawp2jMsCKduUzFrC9SZGP2z6X4G4o
	 9RJq8U6M8c+RQcHNvvtOXp7mtqUN8x83UCSWDVP4IiX/MvqJ6GEZQNEaXUItkmFTWX
	 3h0mxQOH6PFuQ==
Date: Mon, 24 Nov 2025 21:47:17 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3-iommufd: Allow attaching nested
 domain for GBPA cases
Message-ID: <aSTSZacbqy3hvKIe@willie-the-truck>
References: <20251103172755.2026145-1-nicolinc@nvidia.com>
 <20251124193435.GL153257@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124193435.GL153257@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_134723_765129_EEE7082A 
X-CRM114-Status: GOOD (  20.29  )
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

On Mon, Nov 24, 2025 at 03:34:35PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 03, 2025 at 09:27:55AM -0800, Nicolin Chen wrote:
> > A vDEVICE has been a hard requirement for attaching a nested domain to the
> > device. This makes sense when installing a guest STE, since a vSID must be
> > present and given to the kernel during the vDEVICE allocation.
> > 
> > But, when CR0.SMMUEN is disabled, VM doesn't really need a vSID to program
> > the vSMMU behavior as GBPA will take effect, in which case the vSTE in the
> > nested domain could have carried the bypass or abort configuration in GBPA
> > register. Thus, having such a hard requirement doesn't work well for GBPA.
> > 
> > Skip vmaster allocation in arm_smmu_attach_prepare_vmaster() for an abort
> > or bypass vSTE. Note that device on this attachment won't report vevents.
> > 
> > Update the uAPI doc accordingly.
> > 
> > Tested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> > 
> > Changelog
> > v2
> >  * Add Tested-by from Shameer
> >  * Skip vmaster allocation instead of bypassing vsid=0
> >  * Revise the uAPI doc to note a corner case when CR0.SMMUEN=1
> > 
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 13 ++++++++++++-
> >  include/uapi/linux/iommufd.h                        |  9 +++++++++
> >  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Will, I will grab this in a few days unless you want it in your tree

Sure, go for it.

Will

