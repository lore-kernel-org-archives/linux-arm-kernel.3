Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3419CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdvQkoVFRZJd6knxP4tq85eT0ySATHGd5CQSQcnTv9c=; b=rwRzm8/ozVeLUtNm0PfHELtpyo
	nS2HTWQyfZQAm3Du+JGYCBk3VZJPD2wb8Z8FH3YyeyhHMcWsW/80QV6aK2PXMSxbIaGlbPr4Is4Ri
	HFP/XBM3xha9gKhpsQ64Pmd5tRGkPC7V7PWA30xa/2E8MnBe4MPKcSk8F/sy6QpMb8ijOSoCB70kn
	LXJ8XkR8VwcjkyMhlOWRpLGwd0udgjdjKgW2Vn+omSKOAsG71cNtNYZXYt0YkRaBeuglm7t/b7p4U
	CuqrEakiSXSs8g3U8UOMIoE/9kvtiAvm7NYRo4ViPr9mud+LBgXJtAYm1wd2ySgfxua2peUTV2C7L
	WNYS3CHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4EF-00000009gAu-0M8i;
	Fri, 12 Sep 2025 13:54:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4EE-00000009gAj-1q5f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD84360249;
	Fri, 12 Sep 2025 13:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B506C4CEF1;
	Fri, 12 Sep 2025 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757685257;
	bh=HIAwmhCNeSypW5N4gjF2EVFOTx2Y1RaxzUCFu5jMQBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5HLOVTRn8pvc+pKJoK4+1B+mArFCpTnmR6tbLA7cUSDW726oWDdKaGQbYsR/cLNU
	 cI/PSFWIBpPpf+eU5vognCEBeEdsyiAp13aPfzJpyE3nFKYAdZVlvSUTwxgNwMWiS8
	 l7aehyrP7Sezh4COKYXi2MGFUE1NIRRWf3JNrEmtPH7jDogV8Uk47L/YhAxVcM3c+u
	 CtSEGBLgfVPKJJdbA5LEN/kIoAoVd7Is5NqKARbYhrBM6qxZfggSXrCcElxTjbSpMR
	 C0vQ7X0/32IWXF7+qgyQcIsX6uLDWzdmETRmiZl8DtpwuX+5mpD1FTe6F5JFkZxcOS
	 5sXX9B9Id3YOg==
Date: Fri, 12 Sep 2025 14:54:11 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <aMQmA9cLaeYWG5_C@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-16-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:43PM +0000, Mostafa Saleh wrote:
> While in KVM mode, the driver must be loaded after the hypervisor
> initializes.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 ++++++++++++++++-----
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 10ca07c6dbe9..a04730b5fe41 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4576,12 +4576,6 @@ static const struct of_device_id arm_smmu_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
>  
> -static void arm_smmu_driver_unregister(struct platform_driver *drv)
> -{
> -	arm_smmu_sva_notifier_synchronize();
> -	platform_driver_unregister(drv);
> -}
> -
>  static struct platform_driver arm_smmu_driver = {
>  	.driver	= {
>  		.name			= "arm-smmu-v3",
> @@ -4592,8 +4586,27 @@ static struct platform_driver arm_smmu_driver = {
>  	.remove = arm_smmu_device_remove,
>  	.shutdown = arm_smmu_device_shutdown,
>  };
> +
> +#ifndef CONFIG_ARM_SMMU_V3_PKVM
> +static void arm_smmu_driver_unregister(struct platform_driver *drv)
> +{
> +	arm_smmu_sva_notifier_synchronize();
> +	platform_driver_unregister(drv);
> +}
> +
>  module_driver(arm_smmu_driver, platform_driver_register,
>  	      arm_smmu_driver_unregister);
> +#else
> +/*
> + * Must be done after the hypervisor initializes at module_init()
> + * No need for unregister as this is a built in driver.
> + */
> +static int arm_smmu_driver_register(void)
> +{
> +	return platform_driver_register(&arm_smmu_driver);
> +}
> +device_initcall_sync(arm_smmu_driver_register);
> +#endif /* !CONFIG_ARM_SMMU_V3_PKVM */

I think this is a bit grotty as we now have to reason about different
initialisation ordering based on CONFIG_ARM_SMMU_V3_PKVM. Could we
instead return -EPROBE_DEFER if the driver tries to probe before the
hypervisor is up?

Will

