Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7B0C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xCv50BhoaxH2lnmlF0iqAIlsGRDtP4xB9i//TT8B0g=; b=GWZVFhNBAutIyvN/VlJTbFkdOr
	73t3Ed0Cd82smIMCG+xMZgIraBaAKuj9wnDF5nGcgMUgIKmyuIea5W6qOYXaWbsElVTEG50A6RSli
	AoWVy0sY31twzGxt8oO9giuozumgOD3nBgK/KPR3QTSk+bGOyw0SD2YBI+cnT2bzso6+Ti9kNoxt2
	2GevgCb6K9HnuhV+Ze0jlSHIv6KaXhxCI6C8HN3zcLKUr80Twu+C0wD7Kd+14xr/0i/WyLEulWr6X
	pZpy1EhRB4fGRny20m9bQ/9B/OXrqKYhGpTCN/54dm4z5ZMYEg0gxNQ5TtgFQGG8lAGY4Tu25qRL3
	dT21mfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IXR-00000008fRl-1mns;
	Thu, 03 Apr 2025 11:15:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HrD-00000008a0Q-32vC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:31:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59817106F;
	Thu,  3 Apr 2025 03:31:36 -0700 (PDT)
Received: from [10.57.71.20] (unknown [10.57.71.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C1E33F59E;
	Thu,  3 Apr 2025 03:31:30 -0700 (PDT)
Message-ID: <d3f67b35-d3ad-4c84-88a5-8d6ce1a7b3c4@arm.com>
Date: Thu, 3 Apr 2025 11:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf: arm-ni: Unregister PMUs on probe failure
To: Hongbo Yao <andy.xu@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250403070918.4153839-1-andy.xu@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250403070918.4153839-1-andy.xu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_033135_878193_8B8CF888 
X-CRM114-Status: GOOD (  21.47  )
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

On 2025-04-03 8:09 am, Hongbo Yao wrote:
> When a resource allocation fails in one clock domain of an NI device,
> we need to properly roll back all previously registered perf PMUs in
> other clock domains of the same device.
> 
> Otherwise, it can lead to kernel panics.
> 
> Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
> arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
> arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
> list_add corruption: next->prev should be prev (fffffd01e9698a18),
> but was 0000000000000000. (next=ffff10001a0decc8).
> pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : list_add_valid_or_report+0x7c/0xb8
> lr : list_add_valid_or_report+0x7c/0xb8
> Call trace:
>   __list_add_valid_or_report+0x7c/0xb8
>   perf_pmu_register+0x22c/0x3a0
>   arm_ni_probe+0x554/0x70c [arm_ni]
>   platform_probe+0x70/0xe8
>   really_probe+0xc6/0x4d8
>   driver_probe_device+0x48/0x170
>   __driver_attach+0x8e/0x1c0
>   bus_for_each_dev+0x64/0xf0
>   driver_add+0x138/0x260
>   bus_add_driver+0x68/0x138
>   __platform_driver_register+0x2c/0x40
>   arm_ni_init+0x14/0x2a [arm_ni]
>   do_init_module+0x36/0x298
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> SMP: stopping secondary CPUs

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
> ---
> Changes in v3:
>   - Simplify the fix with the existing pmu_base logic.
>   - v2: https://lore.kernel.org/linux-arm-kernel/a1cf32e8-c711-476d-a827-e3affedba780@hj-micro.com/T/#ma3347cf5dca2c3cedbfd475f76931ca7b2751019
> 
> ---
>   drivers/perf/arm-ni.c | 39 +++++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index bdb9e6af8732..de7b6cce4d68 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -575,6 +575,23 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	return err;
>   }
>   
> +static void arm_ni_remove(struct platform_device *pdev)
> +{
> +	struct arm_ni *ni = platform_get_drvdata(pdev);
> +
> +	for (int i = 0; i < ni->num_cds; i++) {
> +		struct arm_ni_cd *cd = ni->cds + i;
> +
> +		if (!cd->pmu_base)
> +			continue;
> +
> +		writel_relaxed(0, cd->pmu_base + NI_PMCR);
> +		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
> +		perf_pmu_unregister(&cd->pmu);
> +		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
> +	}
> +}
> +
>   static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
>   {
>   	u32 reg = readl_relaxed(base + NI_NODE_TYPE);
> @@ -657,8 +674,11 @@ static int arm_ni_probe(struct platform_device *pdev)
>   				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>   				arm_ni_probe_domain(base + reg, &cd);
>   				ret = arm_ni_init_cd(ni, &cd, res->start);
> -				if (ret)
> +				if (ret) {
> +					ni->cds[cd.id].pmu_base = NULL;
> +					arm_ni_remove(pdev);
>   					return ret;
> +				}
>   			}
>   		}
>   	}
> @@ -666,23 +686,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static void arm_ni_remove(struct platform_device *pdev)
> -{
> -	struct arm_ni *ni = platform_get_drvdata(pdev);
> -
> -	for (int i = 0; i < ni->num_cds; i++) {
> -		struct arm_ni_cd *cd = ni->cds + i;
> -
> -		if (!cd->pmu_base)
> -			continue;
> -
> -		writel_relaxed(0, cd->pmu_base + NI_PMCR);
> -		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
> -		perf_pmu_unregister(&cd->pmu);
> -		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
> -	}
> -}
> -
>   #ifdef CONFIG_OF
>   static const struct of_device_id arm_ni_of_match[] = {
>   	{ .compatible = "arm,ni-700" },


