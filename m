Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D22C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flyezF4TtXk8qf2Ne0CNQDG15imQ1Yy0mFM2A5ig8b8=; b=zbfnBmkH7HYR6TBesgkgqDvl7Z
	V/RxMq6poLxdhetsY4hMylSxehPex2zLQ5TcGS2TUHWGBom/ppks15lYqOD7ArX5P+REc+5vUZ8/6
	8sqLjG61+gF18qBXFsZ2GTQNWJE6ZiC4yT6iQQeZ9UFLqd1MKBscxOeEGtGlqK46PJ1t+F5gRKXHP
	0FSqTaM1T5PdpjAK0D3fn89OzHf4V8ZB+C3e8PnDEVYNBdA4P1uNzDJt6JVbG4ROGw7qcl3hA8rm1
	vAAYLam9yE5wuiSAiS9AFD01EdNlHGgZ6hnQkpWBNPc+enmT+ukclkpTdSKc/+29/tae+IaM6UvM/
	DxDgv+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx3v-0000000634V-1dQC;
	Wed, 02 Apr 2025 12:19:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx25-000000062h7-2luw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:17:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3783106F;
	Wed,  2 Apr 2025 05:17:26 -0700 (PDT)
Received: from [10.57.67.12] (unknown [10.57.67.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B7C3F63F;
	Wed,  2 Apr 2025 05:17:22 -0700 (PDT)
Message-ID: <2f594c55-6fce-445f-b838-ea518916103f@arm.com>
Date: Wed, 2 Apr 2025 13:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: arm-ni: Fix list_add() corruption in
 arm_ni_probe()
To: HongBo Yao <andy.xu@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250331121536.2626552-1-andy.xu@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250331121536.2626552-1-andy.xu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051725_792886_B77BD4AB 
X-CRM114-Status: GOOD (  24.57  )
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

On 2025-03-31 1:15 pm, HongBo Yao wrote:
> From: Hongbo Yao <andy.xu@hj-micro.com>
> 
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

This, and the subject, are really confusing, since apparent list
corruption is just one of many possible symptoms, and the fact that it
happens to be a second instance of arm_ni_probe() hitting it is pure
coincidence. The bug is that probe failure can lead to PMUs being freed
without being unregistered, which can obviously lead to all manner of
use-after-free conditions in the perf core.

> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 44 +++++++++++++++++++++++++++++--------------
>   1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index fd7a5e60e963..ee85577e86b9 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -102,6 +102,7 @@ struct arm_ni_unit {
>   struct arm_ni_cd {
>   	void __iomem *pmu_base;
>   	u16 id;
> +	bool pmu_registered;
>   	int num_units;
>   	int irq;
>   	int cpu;
> @@ -571,10 +572,31 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	err = perf_pmu_register(&cd->pmu, name, -1);
>   	if (err)
>   		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
> +	else
> +		cd->pmu_registered = true;
>   
>   	return err;
>   }
>   
> +static void arm_ni_remove_cds(struct arm_ni *ni)
> +{
> +	for (int i = 0; i < ni->num_cds; i++) {
> +		struct arm_ni_cd *cd = ni->cds + i;
> +
> +		if (!cd->pmu_base)
> +			continue;
> +
> +		if (!cd->pmu_registered)
> +			continue;

It's clearly redundant to have both checks here - TBH I'd be inclined to
just do the minimal fix with the existing pmu_base logic:

@@ -656,8 +673,11 @@ static int arm_ni_probe(struct platform_device *pdev)
  				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
  				arm_ni_probe_domain(base + reg, &cd);
  				ret = arm_ni_init_cd(ni, &cd, res->start);
-				if (ret)
+				if (ret) {
+					ni->cds[cd.id].pmu_base = NULL;
+					arm_ni_remove(pdev);
  					return ret;
+				}
  			}
  		}
  	}

...however I'm not against replacing that use of pmu_base with an
explicit flag if you think that's nicer. As implied, though, I really
don't see any point in splitting up arm_ni_remove() itself, we can just
move the whole definition up and call it for this purpose too (with your
other drvdata fix).

Thanks,
Robin.

