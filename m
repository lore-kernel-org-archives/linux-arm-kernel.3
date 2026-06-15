Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37DCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRde05t57TYKLH/mElqBxXibIHpq+CO80Mfo9j1+ysc=; b=DyZ09Nl8pAOIRTHMGZTEgfDgnQ
	EV1Y19PWUe28KndvFqfQUa1zHQNq/eBkg1Qe0JsQ6ptV5wkkrE3GbYgaKkxJPVhS/6Jxc2bemM1/V
	+Vojj4xyFa88oJZOAUvmGzDw1/rnJlGtVWoLnLhhTsBi8q5MDwPYF/Yow12rMl8qKFFkTAnDnDoX3
	8cjILvBQnB945vYSLQKffnJBtyAW9DWejfeSl4BGFMwqsvfKQ4UmlaDECprpzsCGMjCOHt1iTL0Um
	3H9LQZ3L/t4ZJF7S/ZHWC7xXfSeqrN/yJPdkYEUICBg5c7eXL81a22YazJCZcknV7JAhOkM2zkajQ
	BnbEwiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAe2-0000000Ec6y-2ZyL;
	Mon, 15 Jun 2026 16:58:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAdz-0000000Ec6S-1JTn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:58:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so2135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781542712; x=1782147512; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRde05t57TYKLH/mElqBxXibIHpq+CO80Mfo9j1+ysc=;
        b=lD6FUY2aihkyMSLvBWPUooX6twM/L5Q/NeTlnriuTZ5n2FIrRjxpMMQofuGTOLkc7D
         ii/l16m9ViCpuFRIknGQm9rtAZZukC26YtuP/nfNhIXblefx+ONiICxlMKQekcjtgv6b
         PJnjgE3sB3z39YqHGylfS7t+Vm/uAAqh1bS5p+2Xw0Qm77+Zo9sTaAWRZFwqNAdZqFOg
         hEK2eMLfoeoUEMBLqfcxxZtKR781MN/z1DvjT+qGIp5x2buB44KpcXYDTeNvdtTyyGBs
         /LlQhZR0tdCOiLWE7uyHowIUUzOhJzsSoqdTbvMVn7xdo9hDIkPYEM2Eq2Ix2JqwIrR5
         0R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542712; x=1782147512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRde05t57TYKLH/mElqBxXibIHpq+CO80Mfo9j1+ysc=;
        b=mo8sN7TD4HcenMfnlhd0tPfHEQzua9VyZzwUFuFcfr41NrGr90/gpkD565Sq6d8Giu
         p6iitb3NuenQ/jYyfLHq+V572lwbd2kIox4YCVDRd5CXee2wss8CliLAocGyIecHlGK+
         xfSgXZ54W3NkhWbm9SCdmO3OD8gi8yZ6akVaLmmqpKQV7qfXHRH1zOm+/tcVP3c/AQc8
         x3msZLqD2r8w5AqApGxQb5eyeR/SEZSmVK+dlSCCRPAoatk9zB1Dq8mVHq1Wp86kuPIf
         oF2uwi1ScTzp/SSnAZ+cMaDDbLndqgO/zp5CKRkbK6+dwE8Xe2DRkf4RJqGBPLKjgCpj
         aZyA==
X-Forwarded-Encrypted: i=1; AFNElJ+phvXwptVArbx4l+045aA/EZzccd8+vUAvGD/qIjQPhehDnZr2CJmrW8RYg38dhVOzDXLyo0rXYL8XWBVytLRq@lists.infradead.org
X-Gm-Message-State: AOJu0YyfOS22n8k7hOuxFBrnxNYEyzV7oR9eGpwS1un7GaRQsMe9GwNs
	+nRNrLOLrYyzyuY9wFQ8xYNhzUMnLCAkQNG5Ko+nFDxY4+6IwMDcFFoDYG8IicSFZQ==
X-Gm-Gg: Acq92OHqUPT5jfYjGJkwxhFVbJ9zHRXZ1k/G9ItQa7230gYBVKkBQ84KxbOGaz0NxJ2
	wJy6ZRuR5YLqecK703UQfBV6BgI6aoOCKJ+Ms0HSSzuOKC9NZJicFbZwx5ogNw9d6PDR3xq2mPM
	QtL8xNAXx7cLkgM/KTqUXCFysCUoK7ePFcCT8mXp/5E8qZqAlPY3Q1+7TA5b0zEFbikHXOsegX9
	5Z3v8u80ToUEYZo50sOH4ZgS/OtoxG4RRALeb/C1clTKcUmntws5sd0OKIGMxD2TuI671JxUmc/
	Wt7mHSGO+QDXI9LhQEVXIAQBD3cX7AfPl4vwA4FV7wjFwZdixmV2Oqor9GFX6X/Awv+vbzLqchw
	rsEiZrmBVcFA7yOHf+cnCex41p5K3ThMM5fHZTluLz5wV4Y7YMJ8YAepuPejdEqhsy59u2S2Hkn
	fUNr2Qh7H25wrYThT2uvB3pn2UrGpFtcwTXZBBZET2bxNdVYnwY5BThpUXr43EK9a3kpn9gPcH
X-Received: by 2002:a05:600c:e555:20b0:48f:d634:b18d with SMTP id 5b1f17b1804b1-4922fcb119dmr16525e9.8.1781542711740;
        Mon, 15 Jun 2026 09:58:31 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922f9ccd86sm7626165e9.0.2026.06.15.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:58:31 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:58:27 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 03/12] iommu/tegra241-cmdqv: Add a helper to drain
 VCMDQs
Message-ID: <ajAvM5tJ4Ae17Lk8@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-4-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601215909.3958732-4-praan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_095839_378994_5F08784E 
X-CRM114-Status: GOOD (  31.65  )
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

On Mon, Jun 01, 2026 at 09:59:00PM +0000, Pranjal Shrivastava wrote:
> The tegra241-cmdqv driver supports vCMDQs which need to be drained
> before suspending the SMMU. The current driver implementation only uses
> VINTF0 for vCMDQs owned by the kernel which need to be drained. Add a
> helper that drains all the enabled vCMDQs under VINTF0.
> 
> Add another function ptr to arm_smmu_impl_ops to drain implementation
> specified queues and call it within `arm_smmu_drain_queues`.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  7 +++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 27 +++++++++++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0e77ef1e4523..8682be5060ed 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -915,6 +915,13 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
>  	 */
>  	ret = arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
>  
> +	if (ret)
> +		goto out;
> +
> +	/* Drain all implementation-specific queues */
> +	if (smmu->impl_ops && smmu->impl_ops->drain_queues)
> +		ret = smmu->impl_ops->drain_queues(smmu);
> +out:
>  	return ret;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c855ab4962ed..24d5e28eea88 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -885,6 +885,7 @@ struct arm_smmu_impl_ops {
>  	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
>  			  const struct iommu_user_data *user_data);
> +	int (*drain_queues)(struct arm_smmu_device *smmu);
>  };
>  
>  /* An SMMUv3 instance */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 67be62a6e764..cb1e75e4ee91 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -414,6 +414,32 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
>  	return &vcmdq->cmdq;
>  }
>  
> +static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
> +{
> +	struct tegra241_cmdqv *cmdqv =
> +		container_of(smmu, struct tegra241_cmdqv, smmu);
> +	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
> +	int ret = 0;
> +	u16 lidx;
> +
> +	/* Kernel only uses VINTF0. Return if it's disabled */
> +	if (!READ_ONCE(vintf->enabled))
> +		return 0;

I am not familiar with this driver, but the READ_ONCE() caught my eye,
I see that’s already what is the existing code is doing, but it is not
clear to me why, it seems to be an attempt to make this path lockless.

However, won’t we need some aquire/release semantics?

For example in tegra241_vintf_hw_deinit() it WRITE_ONCE() cmdq and then
vintf and finally writel() with a write memory barrier.

While in tegra241_cmdqv_drain_vintf0_lvcmdqs() (or in
tegra241_cmdqv_get_cmdq()) it checks READ_ONCE(vintf->enabled) then
READ_ONCE(vcmdq->enabled)

Now it is possible that this executes in any order, due to the lack
of barriers,which means you can see:
Thread#1: READ_ONCE(vintf->enabled) => TRUE
Thread#2: Writes both vintf->enabled and vcmdq->enabled to FALSE
Thread#1: Still sees vcmdq->enabled as TRUE because it was speculated.

Am I missing something?

Thanks,
Mostafa

> +
> +	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
> +		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
> +
> +		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
> +			continue;
> +
> +		ret = arm_smmu_queue_poll_until_empty(smmu, &vcmdq->cmdq.q);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>  /* HW Reset Functions */
>  
>  /*
> @@ -845,6 +871,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>  	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
>  	.device_reset = tegra241_cmdqv_hw_reset,
>  	.device_remove = tegra241_cmdqv_remove,
> +	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
>  	/* For user-space use */
>  	.hw_info = tegra241_cmdqv_hw_info,
>  	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
> -- 
> 2.54.0.1013.g208068f2d8-goog
> 
> 

