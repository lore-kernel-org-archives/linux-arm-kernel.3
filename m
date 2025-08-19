Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E58CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyOj2mD1XBJQsjbUej7UhOsyW0te2xgLW5AT5ymXHwE=; b=VP7nyc+PyyrMN2xfBFou6YvtXz
	I6ZMDY+1gh6uy3NolUybJg3DDHWD0eBL4c3P9zuyxli1Rw00asZBvXqpTZcG1x1VXq3CT5CYohezN
	Zbe9/lViCRoDXdBy7KjoHao8XHlq3R9bZCFall4b3UVTXKX5LyO1EIWyihibPJfYsiba9jsBNxtnl
	YA2nlOC55tS4WOHuFPPJEz9k56MBHXE2dC7YJKi1TxpBheq8Vo8pjuVSHVKz4WI78zu+Kj1TC2jdN
	e53WtTpAA2X0lKYw9dK4WPw2Ntad8HXtrhdDP4E0BKj9ldcvYLAPYngkEZAXu338R0sPL6evlGv9+
	qKXjFjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOCX-0000000AszV-2vCm;
	Tue, 19 Aug 2025 15:24:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLSB-0000000AQwy-3ExZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43AB145818;
	Tue, 19 Aug 2025 12:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BAFC4CEF1;
	Tue, 19 Aug 2025 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606519;
	bh=Qlxvo8QfEWO0eSzqwnopVLERilYWkNqoXFxKLMekt5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0UOCYXxrQI6myqYnaZ9Cw0ODQ+PlZkp2KwgIjS6XmMtVccmO0w+JDqfqYSul2GnW
	 ZRofUo2eiHpf64xPvb4q3hhuT01l1YiOVmf+FQXDHgO7RliVkCLpLxJfsSHay3yWwi
	 aKFUlT1sEk5oiVFzuO7xoq3lrmLw2jGEGBbc39J3cQDC6qtGxsheEie7yst6/+BSSU
	 S+dEOhP2sGV/GHrs/zbpU+7fOxu1Dl0PL/9N30OtCDHAGN3ZLZ+v8gVizmFX01MCWd
	 ooWbeogqTk+oQnCQoC+ZugRTA6fu3nUiJ3P/UjecO7uXkMOABbDBo7CksDYxJJkUdF
	 zYztPrFkXaYWA==
Date: Tue, 19 Aug 2025 13:28:34 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org
Cc: jgg@nvidia.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters
 decrement
Message-ID: <aKRt8gJVUPZ_VTrA@willie-the-truck>
References: <20250801030127.2006979-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801030127.2006979-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052839_831001_182E0602 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, Jul 31, 2025 at 08:01:27PM -0700, Nicolin Chen wrote:
> The arm_smmu_attach_commit() updates master->ats_enabled before calling
> arm_smmu_remove_master_domain() that is supposed to clean up everything
> in the old domain, including the old domain's nr_ats_masters. So, it is
> supposed to use the old ats_enabled state of the device, not an updated
> state.
> 
> This isn't a problem if switching between two domains where:
>  - old ats_enabled = false; new ats_enabled = false
>  - old ats_enabled = true;  new ats_enabled = true
> but can fail cases where:
>  - old ats_enabled = false; new ats_enabled = true
>    (old domain should keep the counter but incorrectly decreased it)
>  - old ats_enabled = true;  new ats_enabled = false
>    (old domain needed to decrease the counter but incorrectly missed it)
> 
> Update master->ats_enabled after arm_smmu_remove_master_domain() to fix
> this.
> 
> Fixes: 7497f4211f4f ("iommu/arm-smmu-v3: Make changing domains be hitless for ATS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 312bc31d7e8eb..3c81139faecae 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2997,9 +2997,9 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state)
>  		/* ATS is being switched off, invalidate the entire ATC */
>  		arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
>  	}
> -	master->ats_enabled = state->ats_enabled;
>  
>  	arm_smmu_remove_master_domain(master, state->old_domain, state->ssid);
> +	master->ats_enabled = state->ats_enabled;
>  }
>  
>  static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> -- 
> 2.43.0

Acked-by: Will Deacon <will@kernel.org>

Joerg -- please can you pick this up as a fix?

Thanks,

Will

