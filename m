Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1543CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfS5ejxh5GqFmut0s+Xz893zHL/kygYE/3kNRX/2D8k=; b=E1Dn6hvKjcWQRWET19iAx5izd9
	1ey93FfaPFLjXMFm6Q1jLGS0t6rU5geLWzsQyp9LhIH9i6EGdnrIItH/2WMxwEyjd+STw56y0QiQr
	jz15vU/6t7V5/aXoXItwytgyO+uRGuwtKBLxh6nqxXUHUIqLOFKZv/eHHegFY5LGcT8c56wrSYkNK
	otdxYIHWgzMOYDijUiB70CiDq3w/kPIXKurkmzc9ayeWl0oOGqCzzOvQ6vWiNIc+Lhd8q1J9GEB+g
	F+y+grShKSqZsxiJ/0/jFoLfFB0xHL0BsnTEDtLlYDAZ2lrCGbaxi6ySyioWE8PtgjaUB6r5m2PR8
	r6ZfHFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73yZ-00000007bwP-3eM8;
	Fri, 10 Oct 2025 03:39:27 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73yW-00000007bvg-11R4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 03:39:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QfS5ejxh5GqFmut0s+Xz893zHL/kygYE/3kNRX/2D8k=;
	b=Q9xnfrVr0DDuqZ7xoRBKLV+QSlEIy6Nh2e4fWpJLD0pwKnpLggkoKJi0uye7ZYQchgd7BL34x
	9T+Yx+mitq31Nstri3bUTHQfe0NYyf3E4Pzmqy2yZYsJJ1UznXAriHKkpfdvKKW1KtC/O1PpcYx
	WWLHZF/+GWkmNwovjYo0/s8=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4cjXXh24Zhz1cyVx;
	Fri, 10 Oct 2025 11:39:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 578531401F3;
	Fri, 10 Oct 2025 11:39:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Oct 2025 11:39:16 +0800
Message-ID: <4491c8b6-adab-1e86-19cc-777a8a9c8858@huawei.com>
Date: Fri, 10 Oct 2025 11:39:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 08/26] perf: arm_pmu: Convert to new IRQ affinity
 retrieval API
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>
References: <20250922082833.2038905-1-maz@kernel.org>
 <20250922082833.2038905-9-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250922082833.2038905-9-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203924_914580_EF9CD006 
X-CRM114-Status: GOOD (  16.28  )
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



On 2025/9/22 16:28, Marc Zyngier wrote:
> Now that the relevant interrupt controllers are equipped with
> a callback returning the affinity of per-CPU interrupts, switch
> the OF side of the ARM PMU driver over to this new method.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/perf/arm_pmu_platform.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
> index 118170a5cedef..9c0494d8a867a 100644
> --- a/drivers/perf/arm_pmu_platform.c
> +++ b/drivers/perf/arm_pmu_platform.c
> @@ -42,14 +42,13 @@ static int probe_current_pmu(struct arm_pmu *pmu,
>  	return ret;
>  }
>  
> -static int pmu_parse_percpu_irq(struct arm_pmu *pmu, int irq)
> +static int pmu_parse_percpu_irq(struct arm_pmu *pmu, int irq,
> +				const struct cpumask *affinity)
>  {
> -	int cpu, ret;
>  	struct pmu_hw_events __percpu *hw_events = pmu->hw_events;
> +	int cpu;
>  
> -	ret = irq_get_percpu_devid_partition(irq, &pmu->supported_cpus);
> -	if (ret)
> -		return ret;
> +	cpumask_copy(&pmu->supported_cpus, affinity);
>  
>  	for_each_cpu(cpu, &pmu->supported_cpus)
>  		per_cpu(hw_events->irq, cpu) = irq;
> @@ -115,9 +114,12 @@ static int pmu_parse_irqs(struct arm_pmu *pmu)
>  	}
>  
>  	if (num_irqs == 1) {
> -		int irq = platform_get_irq(pdev, 0);
> +		const struct cpumask *affinity;
> +		int irq;
> +
> +		irq = platform_get_irq_affinity(pdev, 0, &affinity);
>  		if ((irq > 0) && irq_is_percpu_devid(irq))
> -			return pmu_parse_percpu_irq(pmu, irq);
> +			return pmu_parse_percpu_irq(pmu, irq, affinity);
>  	}
>  

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	if (nr_cpu_ids != 1 && !pmu_has_irq_affinity(dev->of_node))

