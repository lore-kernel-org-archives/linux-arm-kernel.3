Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C7DCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfpaXm8zeJropLPpBYfIh7Es0vghOOv8ogeZtujNt2I=; b=nXdLinLX80aa1PWoVRu3XucVX5
	c/N3EZjo2rKDjJynLW5+PvcaU+k2ascdpMfyQ+QDV+WNMuOUdgW17p4taTUE8R8bcjQj17ZM6lh37
	P51mC/R2LXOB/6Kz5vJyjvmhzaeW6YDIuzfdjevdXn39hwxYCoFEKSHNjpRmPTNV7VZiqIfbZy8Bp
	X8+xbX3l/u23LpYYc/xoCiS1OYas12ktiW2xOGW+RJy7KsUzVwuPGpXxPfJyLsi98w4t/JOuWBB7F
	ZNORc3wc9PT+tmTfqkM6npRF2vSUP84nH8esCvSJ/DVVVcxK92J4CPLPggqfNNaXX1h+N/+rCPozh
	X69GXDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5YC-00000003TzL-0ZWr;
	Mon, 15 Sep 2025 09:31:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Y9-00000003TyQ-3TyQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:31:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9831E1063;
	Mon, 15 Sep 2025 02:30:54 -0700 (PDT)
Received: from [10.1.35.47] (unknown [10.1.35.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BDB33F694;
	Mon, 15 Sep 2025 02:31:00 -0700 (PDT)
Message-ID: <ef6ac601-22a6-48f6-98d7-32ff93a2d21e@arm.com>
Date: Mon, 15 Sep 2025 10:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/25] coresight: trbe: Convert to new IRQ affinity
 retrieval API
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 James Clark <james.clark@linaro.org>
References: <20250915085702.519996-1-maz@kernel.org>
 <20250915085702.519996-8-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250915085702.519996-8-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_023105_916648_12D239C5 
X-CRM114-Status: GOOD (  18.13  )
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

On 15/09/2025 09:56, Marc Zyngier wrote:
> Now that the relevant interrupt controllers are equipped with
> a callback returning the affinity of per-CPU interrupts, switch
> the TRBE driver over to this new method.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Assuming this goes via irqchip tree,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130d..c512f8faa6012 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1472,9 +1472,10 @@ static void arm_trbe_remove_cpuhp(struct trbe_drvdata *drvdata)
>   static int arm_trbe_probe_irq(struct platform_device *pdev,
>   			      struct trbe_drvdata *drvdata)
>   {
> +	const struct cpumask *affinity;
>   	int ret;
>   
> -	drvdata->irq = platform_get_irq(pdev, 0);
> +	drvdata->irq = platform_get_irq_affinity(pdev, 0, &affinity);
>   	if (drvdata->irq < 0) {
>   		pr_err("IRQ not found for the platform device\n");
>   		return drvdata->irq;
> @@ -1485,8 +1486,7 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   		return -EINVAL;
>   	}
>   
> -	if (irq_get_percpu_devid_partition(drvdata->irq, &drvdata->supported_cpus))
> -		return -EINVAL;
> +	cpumask_copy(&drvdata->supported_cpus, affinity);
>   
>   	drvdata->handle = alloc_percpu(struct perf_output_handle *);
>   	if (!drvdata->handle)


