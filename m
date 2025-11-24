Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD51CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No5KfVBZeNSAD/ylqJFzKZhQRFVvDWjCD8DcnddvI6c=; b=d4YpKbI86cZlbMTpLSgeh/bzPx
	c+UdNln5haC8oCEJYJelFpRAeZnDBom2FF3ZozHdfhQzbAN0pmZPvm+Ic1YOjhhzr1TOwn3GDP1Tk
	OYSTAoKzYCu3LKQFYllBprc2c1ovwqTPC1PF38HJ9BAY+ZlzCZ3x8wbYhsQXpqsZkxN5/OHJh492q
	t1fF/GpOgW4fXIN73e6E42bQ2zz9wToF+MndI8/sKQmJ6jkW3bfKnP9QFmeN7iQUOx2NzTIEml+P1
	8tzYXiREyXI4ncyTBT1xgeAhoHbcW/onseFm515GuwweXXbYbX/LY4wKLS1lEgHFsaUvKOQmZV3p/
	nWAgqRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbJ3-0000000CBKr-1zac;
	Mon, 24 Nov 2025 18:28:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbJ0-0000000CBK7-13a3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00AB51477;
	Mon, 24 Nov 2025 10:28:44 -0800 (PST)
Received: from [10.1.30.67] (unknown [10.1.30.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47ED13F86F;
	Mon, 24 Nov 2025 10:28:50 -0800 (PST)
Message-ID: <4813dc26-0f5c-47f8-b4e4-333f3a26c042@arm.com>
Date: Mon, 24 Nov 2025 18:28:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf: arm-ni: add topology debug info for the clock
 domain
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
References: <20251107084320.555979-1-allen.wang@hj-micro.com>
 <20251107084320.555979-3-allen.wang@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251107084320.555979-3-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_102854_374920_A8ACB364 
X-CRM114-Status: GOOD (  25.26  )
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

On 2025-11-07 8:43 am, Shouping Wang wrote:
> When capturing PMU info with perf, it is necessary to know the nodeid of
> the interface. Here, we add topology debug info for the clock domain to
> display the nodeid of the interfaces.
> 
> $ cat /sys/kernel/debug/arm-ni/map_1f3c06
> as shown below:
> | HSNI #5 || PMNI #6 || PMU  #14 |

This doesn't really provide any useful driver debugging facility though, 
it's just repeating the exact same information that's already perfectly 
visible through the perf interface.

Debugfs is not meant for presenting information to end users. If they 
really don't know the NI topology, it's trivial to query what interfaces 
the driver knows about by simply opening an event for every possible ID 
of the relevant type and seeing which are considered valid - at most 
that's 128*5 perf_event_open syscalls, which can be done in a matter of 
milliseconds. A user only needs to do that once per platform, then 
they're free to use that data to generate numbers that are still largely 
meaningless without knowledge of what those interfaces represent in the 
context of the system outside the NI :)

Thanks,
Robin.

> 
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 63 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 32eabdbe877a..e0f0e18d0120 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -13,6 +13,7 @@
>   #include <linux/perf_event.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/debugfs.h>
>   
>   /* Common registers */
>   #define NI_NODE_TYPE		0x000
> @@ -110,6 +111,7 @@ struct arm_ni_cd {
>   	struct arm_ni_unit *units;
>   	struct perf_event *evcnt[NI_NUM_COUNTERS];
>   	struct perf_event *ccnt;
> +	struct dentry *debug;
>   };
>   
>   struct arm_ni {
> @@ -476,6 +478,59 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
>   	}
>   }
>   
> +static struct dentry *arm_ni_cd_debugfs;
> +
> +#ifdef CONFIG_DEBUG_FS
> +static const char *arm_ni_node_type(enum ni_node_type type)
> +{
> +	switch (type) {
> +	case NI_ASNI:
> +		return "| ASNI ";
> +	case NI_AMNI:
> +		return "| AMNI ";
> +	case NI_PMU:
> +		return "| PMU  ";
> +	case NI_HSNI:
> +		return "| HSNI ";
> +	case NI_HMNI:
> +		return "| HMNI ";
> +	case NI_PMNI:
> +		return "| PMNI ";
> +	default:
> +		return "| ???? ";
> +	}
> +}
> +
> +static int arm_ni_cd_map_show(struct seq_file *s, void *data)
> +{
> +	struct arm_ni_cd *cd = s->private;
> +
> +	cd_for_each_unit(cd, unit) {
> +		seq_printf(s, "%s#%-2d |", arm_ni_node_type(unit->type), unit->id);
> +	}
> +	seq_puts(s, "\n");
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(arm_ni_cd_map);
> +
> +static void arm_ni_cd_debugfs_init(struct arm_ni_cd *cd, u64 res_start)
> +{
> +	const char *name = "map";
> +
> +	if (res_start > 0)
> +		name = devm_kasprintf(cd_to_ni(cd)->dev, GFP_KERNEL, "map_%llx",
> +				res_start >> NI_PMU_PA_SHIFT);
> +	if (!name)
> +		return;
> +
> +	cd->debug = debugfs_create_file(name, 0444, arm_ni_cd_debugfs, cd, &arm_ni_cd_map_fops);
> +}
> +#else
> +static void arm_ni_cd_debugfs_init(struct arm_ni_cd *cd, u64 res_start) {}
> +#endif
> +
>   static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
>   {
>   	struct arm_ni_cd *cd = ni->cds + node->id;
> @@ -563,6 +618,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%llx", res_start >> NI_PMU_PA_SHIFT);
>   	if (!name)
>   		return -ENOMEM;
> +	arm_ni_cd_debugfs_init(cd, res_start);
>   
>   	return perf_pmu_register(&cd->pmu, name, -1);
>   }
> @@ -575,6 +631,7 @@ static void arm_ni_remove(struct platform_device *pdev)
>   		writel_relaxed(0, cd->pmu_base + NI_PMCR);
>   		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
>   		perf_pmu_unregister(&cd->pmu);
> +		debugfs_remove(cd->debug);
>   	}
>   	cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &ni->cpuhp_node);
>   }
> @@ -787,9 +844,12 @@ static int __init arm_ni_init(void)
>   
>   	arm_ni_hp_state = ret;
>   
> +	arm_ni_cd_debugfs = debugfs_create_dir("arm-ni", NULL);
>   	ret = platform_driver_register(&arm_ni_driver);
> -	if (ret)
> +	if (ret) {
>   		cpuhp_remove_multi_state(arm_ni_hp_state);
> +		debugfs_remove(arm_ni_cd_debugfs);
> +	}
>   	return ret;
>   }
>   
> @@ -797,6 +857,7 @@ static void __exit arm_ni_exit(void)
>   {
>   	platform_driver_unregister(&arm_ni_driver);
>   	cpuhp_remove_multi_state(arm_ni_hp_state);
> +	debugfs_remove(arm_ni_cd_debugfs);
>   }
>   
>   module_init(arm_ni_init);

