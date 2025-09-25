Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB78CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShIUJyxIX8uHOPilJtBwVJ6jHVwtK/zXSDO5Vm57krA=; b=Ceks2LyykHQCWwNCmAIhKR+F00
	ATnaEhfTjKMaFhEdDf3WxSKU10FCz6dsyw0MYhJspfNIU+3NmkywV1ccBwWLFo0/lCYoPz7XF6yWH
	QqCOBGSmzshT2+8zDsmpCZj7M1crb9IvUkPxv/LXS/3oakSL8DWKX1C1hkctuRIEPZy05n9gBryVm
	uKNaRTwh4XoUjYtLmrPYmR9/8cyGGh5PT8+MS9FfkVxabmNB6OxTzQd1S5NVmwt+n4SpPmPaoPzKx
	vwKf9vL9Pvt15Cnv138A8NCAw4unkHPX8EDDGD6RP+A0wsSwlq2A0gpYOPUz/wehPLfvBvacbBdGi
	GvgdN5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hNb-000000079kv-3tgt;
	Thu, 25 Sep 2025 08:31:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hNY-000000079ju-3dzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:31:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF5251692;
	Thu, 25 Sep 2025 01:30:52 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B97F53F694;
	Thu, 25 Sep 2025 01:30:57 -0700 (PDT)
Message-ID: <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
Date: Thu, 25 Sep 2025 09:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-2-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250923001840.1586078-2-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_013105_014368_0BC6960C 
X-CRM114-Status: GOOD (  20.04  )
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

On 23/09/2025 01:18, Besar Wicaksono wrote:
> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 

Ok, but who needs this ? I couldn't see any users in the series.
Did I miss something ?

> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>   drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
>   drivers/perf/arm_cspmu/arm_cspmu.h |  9 +++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index efa9b229e701..75b2d80f783e 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>   
>   	return 0;
>   }
> +
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	char hid[16];
> +	char uid[16];
> +	struct acpi_device *adev;
> +	const struct acpi_apmt_node *apmt_node;
> +
> +	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
> +	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
> +		return NULL;
> +
> +	memset(hid, 0, sizeof(hid));
> +	memset(uid, 0, sizeof(uid));
> +
> +	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
> +	sprintf(uid, "%u", apmt_node->inst_secondary);
> +
> +	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	return adev;
> +}
> +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
>   #else
>   static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>   {
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index 19684b76bd96..9c5f11f98acd 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -8,6 +8,7 @@
>   #ifndef __ARM_CSPMU_H__
>   #define __ARM_CSPMU_H__
>   
> +#include <linux/acpi.h>
>   #include <linux/bitfield.h>
>   #include <linux/cpumask.h>
>   #include <linux/device.h>
> @@ -222,4 +223,12 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
>   /* Unregister vendor backend. */
>   void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>   
> +#if defined(CONFIG_ACPI)
> +/**
> + * Get ACPI device associated with the PMU.
> + * The caller is responsible for calling acpi_dev_put() on the returned device.
> + */
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
> +#endif
If we need this, why not add an empty stub for !CONFIG_ACPI case ? 
Similar to what we do for other cases.

Suzuki

> +
>   #endif /* __ARM_CSPMU_H__ */


