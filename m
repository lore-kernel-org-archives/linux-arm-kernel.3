Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF21067020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdWU2KXXZiV8tMZH2zrm7oSs+hJu0maGIcfjpDRK++E=; b=z/H9PtGxchvOSi870Vstgg2Mj/
	IUdh/Y04vVGAfokrTHvHuLOfRmo6x/DTI90G97G+RkEg+gl3Yohf2ZfKu4NiqR25ulB9wE1L36PXe
	sPAZmKMjvlC0rGYgypK2Sau78ZxbeStELwVLBQ4fSYIeg21SZ2uBSVjm8SlChqLaNYuWztNo3N8B+
	nta62SsBm4nmb0hcqEJJbxsSO8R3592J6exo1/FahQCYiDr9JjtyeE5gOjqaT7tDhjv2n332hIJ7U
	1bGb40A2V72UHmYZ4iUF0RlnSDTxFvx2dkEdD6M4ac/RWcKptn1tzSmNBX+vkxfAzNHmQ4pzx0AI4
	FMMrmf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gRq-0000000EA3p-2yD0;
	Thu, 12 Mar 2026 13:51:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gRp-0000000EA3h-1Pby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A538660137;
	Thu, 12 Mar 2026 13:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A11C4CEF7;
	Thu, 12 Mar 2026 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323492;
	bh=PtSQ2Ji9q7XrnlvdmM/5zKCUgRKhbcNIzSsBGPLburI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xp4kGILZZoZG5mZO5MA4SQjgRU9aeQOtahllK7QTjyngC8DSEWRdrR6ZtRdlLyYtD
	 jIzQK5EPE18m9+V+3gZo7yEW7QwUrcim9204Sqm7QPeR24mzGu1rd1HcxGQee2eJx7
	 UoXhhyIvw4evqAD5J/B2/x2xHVpukB/fM2xAgbaznDlV8/xxFbSrXLMyZA30gU7Neh
	 koOCGw754sJuWUx4uBJQ7FiAzpAOmG9EwcO8FgHww1mN9c2iCHcLhjRBVChXYMUfZR
	 M32XVIj7KmWwNPZ1oYTVrCaIBpZfyGjz/vCV04fsHijCk0uNBJK5JJYOpGd94IA9XL
	 6QKXEfJEFKFtw==
Date: Thu, 12 Mar 2026 13:51:26 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com, praan@google.com,
	mmarrid@nvidia.com, kees@kernel.org, Alexander.Grest@microsoft.com,
	baolu.lu@linux.intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, bbiber@nvidia.com,
	skaestle@nvidia.com
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Drain in-flight fault handlers
Message-ID: <abLE3rdM9YAu81tq@willie-the-truck>
References: <20260307001723.964956-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307001723.964956-1-nicolinc@nvidia.com>
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

On Fri, Mar 06, 2026 at 04:17:23PM -0800, Nicolin Chen wrote:
> From: Malak Marrid <mmarrid@nvidia.com>
> 
> When a device is switching away from a domain, either through a detach or a
> replace operation, it must drain its IOPF queue that only contains the page
> requests for the old domain.
> 
> Currently, the IOPF infrastructure is used by master->stall_enabled. So the
> stalled transaction for the old domain should be resumed/terminated. Fix it
> properly.
> 
> Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
> Cc: stable@vger.kernel.org
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 4d00d796f0783..2176ee8bec767 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2843,6 +2843,12 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
>  	if (master->iopf_refcount) {
>  		master->iopf_refcount++;
>  		master_domain->using_iopf = true;
> +		/*
> +		 * If the device is already on the IOPF queue (domain replace),
> +		 * drain in-flight fault handlers so nothing will hold the old
> +		 * domain when the core switches the attach handle.
> +		 */
> +		iopf_queue_flush_dev(master->dev);

So this drains the iopf workqueue, but don't you still have a race with
the hardware generating a fault on the old domain and then that only
showing up once you've switched to the new one? What is the actual
problem you're trying to solve with this patch?

>  		return 0;
>  	}
>  
> @@ -2866,8 +2872,11 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
>  		return;
>  
>  	master->iopf_refcount--;
> -	if (master->iopf_refcount == 0)
> +	if (master->iopf_refcount == 0) {
> +		/* Drain in-flight fault handlers before removing device */
> +		iopf_queue_flush_dev(master->dev);
>  		iopf_queue_remove_device(master->smmu->evtq.iopf, master->dev);

Why doesn't iopf_queue_remove_device() handle the draining? Is there a
case where you _don't_ want to drain the faults on the disable path?

Will

