Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A22CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfExTXX0Ld2ILtuxmtNgwiF69CLLxtRelz2XH7b/aKo=; b=i1LKPeWaxGD8IvwNlshQXR8eul
	3LL4w6uqVt6iHPrUsP4tcsA1/ZI2LtqI+2tci3HC10leaGX1yRyED8gIb2ibk0RUJGtCuPhQWBzYl
	VKY6EWNzAG3LHsbwYz3LtEIAyOrB6cfB/KhmbPff7nHNSxVsvLHbLkLVaXm/VaCXBa9XZ25HOv698
	bAUBySdvTftxjj59k1aA9NQzcWBaMG7FZFbZUCvcWROGvdifu++hsVe45IP6ZR3KplCVhE0j78ZbU
	JgWPuWsxYApFYdnngPKKQ/e+W9bR5FpjnkjPVitcEnwMpgSwD/yKt9eJfSi1RsoC6ML/MXhLFyjqZ
	UN4XocJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Ca-00000009fjI-2XxL;
	Fri, 12 Sep 2025 13:52:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4CZ-00000009fil-1ITT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69B7260249;
	Fri, 12 Sep 2025 13:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1D1C4CEF1;
	Fri, 12 Sep 2025 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757685154;
	bh=oSkhs3wi6IQurSUKpmheTAydHRp4IZyXAqiEEjRfPHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFzy+L8jBvK/16VKIZcPoi4CdJo4RN8TP/i2/2HDJXLIHeY8K+bHuFCuWKOtukdm/
	 m786a7PFUzlSybyymmOx5uAcaJVznFM9RsgMLQZW8S1vDsyOW1U89DZYt8pLOXqacp
	 tMpWsWhVf5E1oFqVXV7RcgTgKVnrilN4rrTxh3vQhot/QxnPpNK8W8aUO77qrs0E9M
	 FWF285+b8MNNxmLbydljFbgeVmGmX/eh7/morOW/7t9FBnVD1Z4atuaYozCezrBCHT
	 Mv+SKBNiLWjyY3mVoiu/5Moqe1DBBRQOux9cfbYibjMY4NHnQeXQuSMVRLlYx+JQCY
	 zs3/cPWvdF/0Q==
Date: Fri, 12 Sep 2025 14:52:27 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 14/28] iommu/arm-smmu-v3: Add KVM mode in the driver
Message-ID: <aMQlm9ucDtd5-15r@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-15-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-15-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:42PM +0000, Mostafa Saleh wrote:
> Add a file only compiled for KVM mode.
> 
> At the moment it registers the driver with KVM, and add the hook
> needed for memory allocation.
> 
> Next, it will create the array with available SMMUs and their
> description.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h             |  4 +++
>  arch/arm64/kvm/iommu.c                        | 10 ++++--
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |  1 +
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 36 +++++++++++++++++++
>  4 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index fcb4b26072f7..52212c0f2e9c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1678,4 +1678,8 @@ struct kvm_iommu_ops;
>  int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
>  size_t kvm_iommu_pages(void);
>  
> +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> +size_t smmu_hyp_pgt_pages(void);
> +#endif
> +
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> index 5460b1bd44a6..0475f7c95c6c 100644
> --- a/arch/arm64/kvm/iommu.c
> +++ b/arch/arm64/kvm/iommu.c
> @@ -17,10 +17,16 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
>  
>  size_t kvm_iommu_pages(void)
>  {
> +	size_t nr_pages = 0;
> +
>  	/*
>  	 * This is called very early during setup_arch() where no initcalls,
>  	 * so this has to call specific functions per each KVM driver.
>  	 */
> -	kvm_nvhe_sym(hyp_kvm_iommu_pages) = 0;
> -	return 0;
> +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> +	nr_pages = smmu_hyp_pgt_pages();
> +#endif

Rather than hard-code this here, I wonder whether it would be better to
have a default size for the IOMMU carveout and have the driver tells us
how much it needs later on when it probes. Then we could either free
any unused portion back to the host or return an error to the driver if
it wants more than we have.

Will

