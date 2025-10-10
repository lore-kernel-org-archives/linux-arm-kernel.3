Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E601CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ib9FPglNu41CzWqVMwNxnGJL+FukWXzH1VDfijrkoY=; b=RNo5RFnmfE62ogZDxJJ1gsyFyr
	nC2NiuB/X5VwkfhEjKSz2BuHTkjiuo/qmoj39tZihQNoOvJftGeS4wXd5zj00+mwjkkJNSek07nse
	/MuaOBCmqg62NUo++/Ugi1KSspbLrEXaCodyMN8ictAGMmVFW39y3BYZt/azMdhf7TU/Mee5raJSD
	Flcwuu9MR7J6TBF6RLUYATW8fQGTqN+c6rlR5vxXpqiHKqhc3Aahpkttu+QOzRuAgBJvb9rzw6G4A
	QebvxC1GYa3lnbzeLHWE4aTuY46Qfmx5pP190AfbB4ci76L1FDA49lMfN6GriaieDoMmTiZs34zzr
	umHxi9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v740e-00000007cGW-3YD7;
	Fri, 10 Oct 2025 03:41:36 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v740c-00000007cFf-3LrG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 03:41:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6ib9FPglNu41CzWqVMwNxnGJL+FukWXzH1VDfijrkoY=;
	b=dUfzL1brp36gtrQslDAIiDiRXLr5YllztSUN9fxkQsmF3d3cb8W9f/FaTOlXw/qNZxOUE3dGx
	stzw4ksTgDb2c2LIbIki/+MsSdrX9XP553OU2mvHEKmQh1wU+TDnSOvBCO8jOvs0EquzrVQUTlf
	74kKI5T5PGkQgsTGqR3nYtc=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4cjXZY6dqYzpTKC;
	Fri, 10 Oct 2025 11:40:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 86CFB140279;
	Fri, 10 Oct 2025 11:41:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Oct 2025 11:41:22 +0800
Message-ID: <fa16cacc-07a8-ae85-a391-1736765f1cad@huawei.com>
Date: Fri, 10 Oct 2025 11:41:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 09/26] perf: arm_spe_pmu: Convert to new IRQ affinity
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
 <20250922082833.2038905-10-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250922082833.2038905-10-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_204135_000939_B2C31692 
X-CRM114-Status: GOOD (  16.13  )
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
> the ARM SPE driver over to this new method.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 369e77ad5f13f..a1c86a1f21427 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -1211,8 +1211,10 @@ static void arm_spe_pmu_dev_teardown(struct arm_spe_pmu *spe_pmu)
>  static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
>  {
>  	struct platform_device *pdev = spe_pmu->pdev;
> -	int irq = platform_get_irq(pdev, 0);
> +	const struct cpumask *affinity;
> +	int irq;
>  
> +	irq = platform_get_irq_affinity(pdev, 0, &affinity);
>  	if (irq < 0)
>  		return -ENXIO;
>  
> @@ -1221,10 +1223,7 @@ static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
>  		return -EINVAL;
>  	}
>  
> -	if (irq_get_percpu_devid_partition(irq, &spe_pmu->supported_cpus)) {
> -		dev_err(&pdev->dev, "failed to get PPI partition (%d)\n", irq);
> -		return -EINVAL;
> -	}
> +	cpumask_copy(&spe_pmu->supported_cpus, affinity);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	spe_pmu->irq = irq;
>  	return 0;

