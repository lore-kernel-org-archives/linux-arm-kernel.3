Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34RBRaSTNg9ncyETafJIZVAMQP43RrZ0KiWNhMdMuvU=; b=0J388qdQEKCsE7y/MEy2zM+SwX
	4B+gb87Rpc8VwjCA9yqCaUew8VRoTb0TGUmDnRi8+EEtI573d1gsG30l5JFLtjVdMdZ6pN+M7hgIb
	i3DPY7/l9XsK7q9b59ZprwhW4spkNv3CDvoif1MviwNAPzPQYZ5d+5SZ8GyZQFg7VWxJ2A4uwFWO1
	U+o9qAw1WpwF6/ThnUNc9k8LG3mcCnGaDJXO5L3X0A07J0RofC7LzgJrwHK0aq9nWHmqZ/rvYvsFP
	2ZEAWxahh5H+F0BesgPKLg/w6V0KIrFAX6LzmafkM3Eh1Sp6VxUq663tbq/LeTYtZPmh3AKhnQZRN
	vJdWRNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLqT-0000000HMZK-3YBU;
	Thu, 16 Jul 2026 13:09:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLqQ-0000000HMYx-22s2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D731476;
	Thu, 16 Jul 2026 06:09:35 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1EE03F905;
	Thu, 16 Jul 2026 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784207379; bh=XhpvexryAh1HFBU8MAXPYUlkIzW12Wg+/TI9/A+/jM8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eatQ5NIfTjWDJY8nZuTno5h2B6yKkgBeiKhNZ0hSekJs/WYcshz1H3ItRnLcVIFXt
	 anMYbp+Y7cGDwuvLwLw6d/WLX1MlcjX0TqJUx5FIh0q6cIcZ/h2JgULhYueqEZ7Kkm
	 59MDXcuqCQiujxDcXxi1WNvMb1qpByQZjih8NJB4=
Message-ID: <38a1a39d-b72e-4433-815e-a01c691c0249@arm.com>
Date: Thu, 16 Jul 2026 14:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: arm: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel
 <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Kees Cook <kees@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:QUALCOMM IOMMU" <linux-arm-msm@vger.kernel.org>
References: <20260714133246.575556-1-panchuang@vivo.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260714133246.575556-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_060942_615153_132FBC8B 
X-CRM114-Status: GOOD (  18.28  )
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

On 14/07/2026 2:32 pm, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove
> the now-redundant driver-specific dev_err() and dev_err_probe() calls.

FWIW, the arm-smmu messages do provide contextual information about 
precisely *which* IRQ in SMMU terms was at fault, which generic code 
cannot do - the context/global index gives the developer enough to go 
and directly check the relevant DT/ACPI entry, without first having to 
figure out what hardware resource the Linux vIRQ number represents. 
However I do concur that the generic code is now more than enough for 
the general "something is terribly wrong" case, and beyond that we 
really don't need to optimise Linux for people writing bad firmware...

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c   | 9 ++-------
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 +---
>   2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3..889a0966d36c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -865,11 +865,8 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>   		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
>   				       "arm-smmu-context-fault", smmu_domain);
>   
> -	if (ret < 0) {
> -		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
> -			cfg->irptndx, irq);
> +	if (ret < 0)
>   		cfg->irptndx = ARM_SMMU_INVALID_IRPTNDX;
> -	}
>   
>   	mutex_unlock(&smmu_domain->init_mutex);
>   
> @@ -2219,9 +2216,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
>   				       "arm-smmu global fault", smmu);
>   		if (err)
> -			return dev_err_probe(dev, err,
> -					"failed to request global IRQ %d (%u)\n",
> -					i, irq);
> +			return err;
>   	}
>   
>   	platform_set_drvdata(pdev, smmu);
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index a1e8cf29f594..2b57262b076f 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -712,10 +712,8 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
>   			       IRQF_SHARED,
>   			       "qcom-iommu-fault",
>   			       ctx);
> -	if (ret) {
> -		dev_err(dev, "failed to request IRQ %u\n", irq);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	ret = get_asid(dev->of_node);
>   	if (ret < 0) {


