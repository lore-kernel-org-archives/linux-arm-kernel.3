Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C9FD49216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFN4PUl9aGt+xSWJFg9Vqw/HGeawazhq93K3pOCET0M=; b=eOx4yERGNm+//QYrpnZc7d1uqt
	yXVEJiPjt7gNAVKpjZcxZwgkXPA4LYNgyXP1xtXckNVW7tGzc0swJHiSQzVLec6uqEPBpAsqtyCak
	OZuUgPI0ERVia5yTVBsqRh/BmUlH9WPpJAaT/XBRj0Hh69LUVoASrQkA9D5+FkPlLwlFj3wK7jiIN
	q9ewr9ddrKk+QImynOqySJ8NnanZNg5vETvRx1HqEdvVFNSySVaf6HJnRrco7mdbIKej5xg/NjMiK
	1T4cJoxJTbXBSDkzyQIBXSzve3tH0AcCu4NRz0iFSyWPvmpU+OIIqTPGL9DofJFH/KfsxerxL2eBT
	meA+b9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1qI-00000000UpP-0kff;
	Fri, 12 Dec 2025 12:01:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1qG-00000000Uoy-295z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:01:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738A7FEC;
	Fri, 12 Dec 2025 04:01:40 -0800 (PST)
Received: from [10.57.93.22] (unknown [10.57.93.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D8903F762;
	Fri, 12 Dec 2025 04:01:44 -0800 (PST)
Message-ID: <54fce1f8-7675-4351-b292-0009b2e8c599@arm.com>
Date: Fri, 12 Dec 2025 12:01:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/4] iommu/tegra241-cmdqv: Decouple driver from ACPI
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251212060803.1712637-1-amhetre@nvidia.com>
 <20251212060803.1712637-2-amhetre@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251212060803.1712637-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_040148_644696_DFEAB72A 
X-CRM114-Status: GOOD (  24.83  )
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

On 2025-12-12 6:08 am, Ashish Mhetre wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> A platform device is created by acpi_create_platform_device() per CMDQV's
> adev. That means there is no point in going through _CRS of ACPI.
> 
> Replace all the ACPI functions with standard platform functions. And drop
> all ACPI dependencies. This will make the driver compatible with DT also.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/arm/Kconfig                     |  1 -
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  2 +-
>   .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 84 +++----------------
>   3 files changed, 13 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index ef42bbe07dbe..5fac08b89dee 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -121,7 +121,6 @@ config ARM_SMMU_V3_KUNIT_TEST
>   
>   config TEGRA241_CMDQV
>   	bool "NVIDIA Tegra241 CMDQ-V extension support for ARM SMMUv3"
> -	depends on ACPI
>   	help
>   	  Support for NVIDIA CMDQ-Virtualization extension for ARM SMMUv3. The
>   	  CMDQ-V extension is similar to v3.3 ECMDQ for multi command queues
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..42de3da54858 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4542,7 +4542,7 @@ static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
>   	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
>   	if (adev) {
>   		/* Tegra241 CMDQV driver is responsible for put_device() */

Don't we need to bring the put_device(adev) out to this level, since 
impl_dev is now something else that AFAICS we are *not* taking a new 
reference on (and thus should not be putting either)?

Otherwise this looks pretty nice!

Thanks,
Robin.

> -		smmu->impl_dev = &adev->dev;
> +		smmu->impl_dev = acpi_get_first_physical_node(adev);
>   		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
>   		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
>   			 dev_name(smmu->impl_dev));
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 378104cd395e..1fc03b72beb8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -3,17 +3,15 @@
>   
>   #define dev_fmt(fmt) "tegra241_cmdqv: " fmt
>   
> -#include <linux/acpi.h>
>   #include <linux/debugfs.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/interrupt.h>
>   #include <linux/iommu.h>
>   #include <linux/iommufd.h>
>   #include <linux/iopoll.h>
> +#include <linux/platform_device.h>
>   #include <uapi/linux/iommufd.h>
>   
> -#include <acpi/acpixf.h>
> -
>   #include "arm-smmu-v3.h"
>   
>   /* CMDQV register page base and size defines */
> @@ -854,69 +852,6 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>   
>   /* Probe Functions */
>   
> -static int tegra241_cmdqv_acpi_is_memory(struct acpi_resource *res, void *data)
> -{
> -	struct resource_win win;
> -
> -	return !acpi_dev_resource_address_space(res, &win);
> -}
> -
> -static int tegra241_cmdqv_acpi_get_irqs(struct acpi_resource *ares, void *data)
> -{
> -	struct resource r;
> -	int *irq = data;
> -
> -	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> -		*irq = r.start;
> -	return 1; /* No need to add resource to the list */
> -}
> -
> -static struct resource *
> -tegra241_cmdqv_find_acpi_resource(struct device *dev, int *irq)
> -{
> -	struct acpi_device *adev = to_acpi_device(dev);
> -	struct list_head resource_list;
> -	struct resource_entry *rentry;
> -	struct resource *res = NULL;
> -	int ret;
> -
> -	INIT_LIST_HEAD(&resource_list);
> -	ret = acpi_dev_get_resources(adev, &resource_list,
> -				     tegra241_cmdqv_acpi_is_memory, NULL);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to get memory resource: %d\n", ret);
> -		return NULL;
> -	}
> -
> -	rentry = list_first_entry_or_null(&resource_list,
> -					  struct resource_entry, node);
> -	if (!rentry) {
> -		dev_err(dev, "failed to get memory resource entry\n");
> -		goto free_list;
> -	}
> -
> -	/* Caller must free the res */
> -	res = kzalloc(sizeof(*res), GFP_KERNEL);
> -	if (!res)
> -		goto free_list;
> -
> -	*res = *rentry->res;
> -
> -	acpi_dev_free_resource_list(&resource_list);
> -
> -	INIT_LIST_HEAD(&resource_list);
> -
> -	if (irq)
> -		ret = acpi_dev_get_resources(adev, &resource_list,
> -					     tegra241_cmdqv_acpi_get_irqs, irq);
> -	if (ret < 0 || !irq || *irq <= 0)
> -		dev_warn(dev, "no interrupt. errors will not be reported\n");
> -
> -free_list:
> -	acpi_dev_free_resource_list(&resource_list);
> -	return res;
> -}
> -
>   static int tegra241_cmdqv_init_structures(struct arm_smmu_device *smmu)
>   {
>   	struct tegra241_cmdqv *cmdqv =
> @@ -1042,18 +977,23 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
>   
>   struct arm_smmu_device *tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
>   {
> +	struct platform_device *pdev = to_platform_device(smmu->impl_dev);
>   	struct arm_smmu_device *new_smmu;
> -	struct resource *res = NULL;
> +	struct resource *res;
>   	int irq;
>   
> -	if (!smmu->dev->of_node)
> -		res = tegra241_cmdqv_find_acpi_resource(smmu->impl_dev, &irq);
> -	if (!res)
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "no memory resource found for CMDQV\n");
>   		goto out_fallback;
> +	}
>   
> -	new_smmu = __tegra241_cmdqv_probe(smmu, res, irq);
> -	kfree(res);
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq <= 0)
> +		dev_warn(&pdev->dev,
> +			 "no interrupt. errors will not be reported\n");
>   
> +	new_smmu = __tegra241_cmdqv_probe(smmu, res, irq);
>   	if (new_smmu)
>   		return new_smmu;
>   


