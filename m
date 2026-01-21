Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2753C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n65W3gPCp4jzg1HuLjzo21G9BSXkaJBGUe/DNkhluXo=; b=eGBIJTuwDQJAjsITn6x/4Lr/tN
	y+3SsHJDtO/ybiqfgURLfhRAzYDZP5oSiZ5hDJ9tFfgxjI3E69nxeqPsStj+LlcwlD6A86i5uy6FV
	ZdwYCARdVZldLEZUkg44mEdW4YLDcb1yq9051g1Ebv66aayhMBtplHXna3sAblah80l9lIZ+QPp+n
	ciHJTZZyyP2cSWNqZWH97V2NH7PP0rErbKtwod6gC/FQSTfJW42bneR1ev0w0NFVYgveOGN4f6vsK
	kgie9qtygr7qyjsK6Mk52Ab/D0igPqQtV96QGtWtYYYGt99wDOekzpLw6xQDR3qY60vJpG01UJMOU
	6dIKH7Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaXH-00000005kSs-3eBq;
	Wed, 21 Jan 2026 15:54:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaXA-00000005kR1-1Irk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09DA043290;
	Wed, 21 Jan 2026 15:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9D3C4CEF1;
	Wed, 21 Jan 2026 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769010854;
	bh=+141CksYSv3b4SLpMVPnysGzcabKoPf7/a948LcWCGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7PyGp6qaS2fhjUjuXbfeoViLVg1VdUaQV7i21HfFLr1KRrNpiJBC0hv4FbJeywiK
	 ZA8Ex9jLxgJwER1WDj3rqmTP5sgOAUpSqeixhKaCnRdJ4gJ3/hhWDQrFRXaMADZ+9C
	 1oMzOYrqkgHIjMVp6hBMriwd323Jn0BYNPHzNTrud5C5JULW/vjVNn25N8tsV04sHd
	 v3cz8509AyBuXDS5sLLJWWWmXSeAkOTzAjT7N3Ux78yMfBrv7v8AwejLqHMt+/NsDS
	 r1Y8Nlj8q8uFHTGTYvB2PtFdQ7apDmoKMtIwFGjAPiEWk6PLwxF1+L/p9xj3NyWjuC
	 T8Ie1VLQWJLSw==
Date: Wed, 21 Jan 2026 09:54:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org, 
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robin.clark@oss.qualcomm.com, hanguidong02@gmail.com, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <h2jbtahw5zcrn3rckul6ixesdvqpcdboz6daselk6cpnxosrii@ui45pvdammup>
References: <20260121141215.29658-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_075416_409668_2A3F7324 
X-CRM114-Status: GOOD (  29.20  )
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

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
> 
> Additionally, it was noted by Robin that the current approach is
> potentially racy with async probe [2].
> 
> Hence, fix this by registering the qcom_smmu_tbu_driver from
> module_init(). Unfortunately, due to the vendoring of the driver, this
> requires an indirection through arm-smmu-impl.c.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thank you Danilo.

Tested-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 14 +++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++----
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 24 +++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++
>  4 files changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index db9b9a8e139c..4565a58bb213 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -228,3 +228,17 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  
>  	return smmu;
>  }
> +
> +int __init arm_smmu_impl_module_init(void)
> +{
> +	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
> +		return qcom_smmu_module_init();
> +
> +	return 0;
> +}
> +
> +void __exit arm_smmu_impl_module_exit(void)
> +{
> +	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
> +		qcom_smmu_module_exit();
> +}
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..22906d2c9a2d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -774,10 +774,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
>  	const struct device_node *np = smmu->dev->of_node;
>  	const struct of_device_id *match;
> -	static u8 tbu_registered;
> -
> -	if (!tbu_registered++)
> -		platform_driver_register(&qcom_smmu_tbu_driver);
>  
>  #ifdef CONFIG_ACPI
>  	if (np == NULL) {
> @@ -802,3 +798,13 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  
>  	return smmu;
>  }
> +
> +int __init qcom_smmu_module_init(void)
> +{
> +	return platform_driver_register(&qcom_smmu_tbu_driver);
> +}
> +
> +void __exit qcom_smmu_module_exit(void)
> +{
> +	platform_driver_unregister(&qcom_smmu_tbu_driver);
> +}
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 5e690cf85ec9..1e218fbea35a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2365,7 +2365,29 @@ static struct platform_driver arm_smmu_driver = {
>  	.remove = arm_smmu_device_remove,
>  	.shutdown = arm_smmu_device_shutdown,
>  };
> -module_platform_driver(arm_smmu_driver);
> +
> +static int __init arm_smmu_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&arm_smmu_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = arm_smmu_impl_module_init();
> +	if (ret)
> +		platform_driver_unregister(&arm_smmu_driver);
> +
> +	return ret;
> +}
> +module_init(arm_smmu_init);
> +
> +static void __exit arm_smmu_exit(void)
> +{
> +	arm_smmu_impl_module_exit();
> +	platform_driver_unregister(&arm_smmu_driver);
> +}
> +module_exit(arm_smmu_exit);
>  
>  MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations");
>  MODULE_AUTHOR("Will Deacon <will@kernel.org>");
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2dbf3243b5ad..26d2e33cd328 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -540,6 +540,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
>  
> +int __init arm_smmu_impl_module_init(void);
> +void __exit arm_smmu_impl_module_exit(void);
> +int __init qcom_smmu_module_init(void);
> +void __exit qcom_smmu_module_exit(void);
> +
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
>  
> 
> base-commit: dc23806a7c47ec5f1293aba407fb69519f976ee0
> -- 
> 2.52.0
> 
> 

